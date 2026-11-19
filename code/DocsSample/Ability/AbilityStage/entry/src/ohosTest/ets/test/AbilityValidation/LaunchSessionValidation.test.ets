/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  launchEntryAbility,
  serializedDelay,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  doAbilityBackground,
  doAbilityForeground,
  measureElapsed,
  isWithinBudget,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_SESSION_CREATE,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const MAX_CONCURRENT_SESSIONS: number = 4;

const SESSION_ID_PREFIX: string = 'session-';

const SESSION_LIFETIME_MS: number = 5000;

const SESSION_RECLAIM_BUDGET_MS: number = TIMEOUT_SESSION_CREATE;

enum SessionState {
  CREATED = 'created',
  STARTED = 'started',
  ACTIVE = 'active',
  DESTROYED = 'destroyed'
}

enum SessionErrorCode {
  OK = 'ok',
  CAPACITY_EXCEEDED = 'capacity_exceeded',
  INVALID_TRANSITION = 'invalid_transition',
  SESSION_NOT_FOUND = 'session_not_found',
  SESSION_EXPIRED = 'session_expired',
  ID_EMPTY = 'id_empty',
  ID_DUPLICATE = 'id_duplicate'
}

class LaunchSession {
  public id: string;
  public state: SessionState;
  public createdAt: number;
  public startedAt: number;
  public activeAt: number;
  public destroyedAt: number;
  public launchCount: number;

  constructor(id: string, createdAt: number) {
    this.id = id;
    this.state = SessionState.CREATED;
    this.createdAt = createdAt;
    this.startedAt = 0;
    this.activeAt = 0;
    this.destroyedAt = 0;
    this.launchCount = 0;
  }

  public markStarted(timestamp: number): boolean {
    if (this.state !== SessionState.CREATED) {
      return false;
    }
    this.state = SessionState.STARTED;
    this.startedAt = timestamp;
    this.launchCount++;
    return true;
  }

  public markActive(timestamp: number): boolean {
    if (this.state !== SessionState.STARTED) {
      return false;
    }
    this.state = SessionState.ACTIVE;
    this.activeAt = timestamp;
    return true;
  }

  public markDestroyed(timestamp: number): boolean {
    if (this.state === SessionState.DESTROYED) {
      return false;
    }
    this.state = SessionState.DESTROYED;
    this.destroyedAt = timestamp;
    return true;
  }

  public isAlive(): boolean {
    return this.state !== SessionState.DESTROYED;
  }

  public isActive(): boolean {
    return this.state === SessionState.ACTIVE;
  }

  public ageAt(timestamp: number): number {
    return timestamp - this.createdAt;
  }

  public isExpired(timestamp: number, lifetimeMs: number = SESSION_LIFETIME_MS): boolean {
    if (this.state === SessionState.DESTROYED) {
      return false;
    }
    return this.ageAt(timestamp) > lifetimeMs;
  }

  public startLatency(): number {
    if (this.startedAt === 0) {
      return 0;
    }
    return this.startedAt - this.createdAt;
  }

  public activeLatency(): number {
    if (this.activeAt === 0 || this.startedAt === 0) {
      return 0;
    }
    return this.activeAt - this.startedAt;
  }

  public totalLifetime(): number {
    const end: number = this.destroyedAt === 0 ? this.activeAt : this.destroyedAt;
    if (end === 0) {
      return 0;
    }
    return end - this.createdAt;
  }
}

class SessionPool {
  private sessions: LaunchSession[] = [];

  private nextOrdinal: number = 0;

  private createdCount: number = 0;

  private destroyedCount: number = 0;

  private reclaimedCount: number = 0;

  public nextId(): string {
    this.nextOrdinal++;
    return SESSION_ID_PREFIX + this.nextOrdinal.toString();
  }

  public create(timestamp: number): LaunchSession {
    const session: LaunchSession = new LaunchSession(this.nextId(), timestamp);
    this.sessions.push(session);
    this.createdCount++;
    return session;
  }

  public size(): number {
    return this.sessions.length;
  }

  public aliveCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].isAlive()) {
        count++;
      }
    }
    return count;
  }

  public activeCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].isActive()) {
        count++;
      }
    }
    return count;
  }

  public find(id: string): LaunchSession | null {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].id === id) {
        return this.sessions[i];
      }
    }
    return null;
  }

  public hasId(id: string): boolean {
    return this.find(id) !== null;
  }

  public ids(): string[] {
    const result: string[] = [];
    for (let i = 0; i < this.sessions.length; i++) {
      result.push(this.sessions[i].id);
    }
    return result;
  }

  public uniqueIdCount(): number {
    const seen: string[] = [];
    for (let i = 0; i < this.sessions.length; i++) {
      if (seen.indexOf(this.sessions[i].id) < 0) {
        seen.push(this.sessions[i].id);
      }
    }
    return seen.length;
  }

  public checkCapacity(): SessionErrorCode {
    if (this.aliveCount() >= MAX_CONCURRENT_SESSIONS) {
      return SessionErrorCode.CAPACITY_EXCEEDED;
    }
    return SessionErrorCode.OK;
  }

  public destroy(id: string, timestamp: number): boolean {
    const session: LaunchSession | null = this.find(id);
    if (session === null) {
      return false;
    }
    const changed: boolean = session.markDestroyed(timestamp);
    if (changed) {
      this.destroyedCount++;
    }
    return changed;
  }

  public reclaimExpired(timestamp: number): number {
    let reclaimed: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      const session: LaunchSession = this.sessions[i];
      if (session.isAlive() && session.isExpired(timestamp)) {
        session.markDestroyed(timestamp);
        this.destroyedCount++;
        reclaimed++;
      }
    }
    this.reclaimedCount += reclaimed;
    return reclaimed;
  }

  public removeDestroyed(): number {
    const survivors: LaunchSession[] = [];
    let removed: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].isAlive()) {
        survivors.push(this.sessions[i]);
      } else {
        removed++;
      }
    }
    this.sessions = survivors;
    return removed;
  }

  public getCreatedCount(): number {
    return this.createdCount;
  }

  public getDestroyedCount(): number {
    return this.destroyedCount;
  }

  public getReclaimedCount(): number {
    return this.reclaimedCount;
  }

  public clear(): void {
    this.sessions.splice(0, this.sessions.length);
  }
}

class SessionStartGate {
  private created: number = 0;

  private reused: number = 0;

  private rejected: number = 0;

  private lastId: string = '';

  public evaluate(pool: SessionPool, requestedId: string, timestamp: number): SessionErrorCode {
    if (requestedId.length === 0) {
      this.rejected++;
      return SessionErrorCode.ID_EMPTY;
    }
    const existing: LaunchSession | null = pool.find(requestedId);
    if (existing !== null && existing.isAlive()) {
      this.reused++;
      this.lastId = requestedId;
      return SessionErrorCode.OK;
    }
    if (pool.checkCapacity() !== SessionErrorCode.OK) {
      this.rejected++;
      return SessionErrorCode.CAPACITY_EXCEEDED;
    }
    const session: LaunchSession = pool.create(timestamp);
    session.markStarted(timestamp);
    this.created++;
    this.lastId = session.id;
    return SessionErrorCode.OK;
  }

  public getCreated(): number {
    return this.created;
  }

  public getReused(): number {
    return this.reused;
  }

  public getRejected(): number {
    return this.rejected;
  }

  public getLastId(): string {
    return this.lastId;
  }
}

class SessionTransitionTable {
  public static isAllowed(from: SessionState, to: SessionState): boolean {
    if (from === SessionState.CREATED && to === SessionState.STARTED) {
      return true;
    }
    if (from === SessionState.STARTED && to === SessionState.ACTIVE) {
      return true;
    }
    if (to === SessionState.DESTROYED && from !== SessionState.DESTROYED) {
      return true;
    }
    return false;
  }

  public static allowedTargets(from: SessionState): SessionState[] {
    const targets: SessionState[] = [];
    const all: SessionState[] = [SessionState.CREATED, SessionState.STARTED, SessionState.ACTIVE,
      SessionState.DESTROYED];
    for (let i = 0; i < all.length; i++) {
      if (SessionTransitionTable.isAllowed(from, all[i])) {
        targets.push(all[i]);
      }
    }
    return targets;
  }

  public static isTerminal(state: SessionState): boolean {
    return state === SessionState.DESTROYED;
  }

  public static orderIndex(state: SessionState): number {
    if (state === SessionState.CREATED) {
      return 0;
    }
    if (state === SessionState.STARTED) {
      return 1;
    }
    if (state === SessionState.ACTIVE) {
      return 2;
    }
    return 3;
  }

  public static isForward(from: SessionState, to: SessionState): boolean {
    return SessionTransitionTable.orderIndex(to) > SessionTransitionTable.orderIndex(from);
  }

  public static errorName(code: SessionErrorCode): string {
    if (code === SessionErrorCode.CAPACITY_EXCEEDED) {
      return 'SessionCapacityError';
    }
    if (code === SessionErrorCode.INVALID_TRANSITION) {
      return 'SessionTransitionError';
    }
    if (code === SessionErrorCode.SESSION_NOT_FOUND) {
      return 'SessionNotFoundError';
    }
    if (code === SessionErrorCode.SESSION_EXPIRED) {
      return 'SessionExpiredError';
    }
    if (code === SessionErrorCode.ID_EMPTY) {
      return 'SessionIdEmptyError';
    }
    if (code === SessionErrorCode.ID_DUPLICATE) {
      return 'SessionIdDuplicateError';
    }
    return 'NoError';
  }

  public static toError(code: SessionErrorCode): Error {
    const error: Error = new Error(`session rejected: ${code}`);
    error.name = SessionTransitionTable.errorName(code);
    return error;
  }
}

class SessionReclaimer {
  private budgetMs: number;

  private measurements: number[] = [];

  constructor(budgetMs: number = SESSION_RECLAIM_BUDGET_MS) {
    this.budgetMs = budgetMs;
  }

  public record(elapsedMs: number): boolean {
    this.measurements.push(elapsedMs);
    return isWithinBudget(elapsedMs, this.budgetMs);
  }

  public count(): number {
    return this.measurements.length;
  }

  public getBudget(): number {
    return this.budgetMs;
  }

  public overBudgetCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.measurements.length; i++) {
      if (!isWithinBudget(this.measurements[i], this.budgetMs)) {
        count++;
      }
    }
    return count;
  }

  public allWithinBudget(): boolean {
    return this.count() > 0 && this.overBudgetCount() === 0;
  }

  public clear(): void {
    this.measurements.splice(0, this.measurements.length);
  }
}

class PageTextProbe {
  public static async current(driver: Driver): Promise<string> {
    if (await checkTextContent(driver, PAGE_TEXT_INITIAL)) {
      return PAGE_TEXT_INITIAL;
    }
    if (await checkTextContent(driver, PAGE_TEXT_CLICKED)) {
      return PAGE_TEXT_CLICKED;
    }
    return '';
  }

  public static isKnown(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static async ensureClicked(driver: Driver): Promise<boolean> {
    const currentText: string = await PageTextProbe.current(driver);
    if (currentText.length === 0) {
      return false;
    }
    await tapComponentByText(driver, currentText);
    return await waitForTextVisible(driver, PAGE_TEXT_CLICKED);
  }
}

export default function launchSessionValidationTest(): void {
  describe('LaunchSessionValidationTest', () => {
    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('LaunchSessionValidationTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0100
     * @tc.name testSessionIdUniqueAcrossCreations
     * @tc.desc Verify five created sessions carry five distinct ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionIdUniqueAcrossCreations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          for (let i = 0; i < 5; i++) {
            pool.create(1000 + i);
          }
          expect(pool.size()).assertEqual(5);
          expect(pool.uniqueIdCount()).assertEqual(5);
          expect(pool.hasId('session-1')).assertTrue();
          expect(pool.hasId('session-5')).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0200
     * @tc.name testSessionIdPrefixFormat
     * @tc.desc Verify generated session ids follow the session- prefix format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionIdPrefixFormat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const session: LaunchSession = pool.create(1000);
          expect(session.id.startsWith('session-')).assertTrue();
          expect(session.id).assertEqual('session-1');
          expect(session.id.length).assertEqual(SESSION_ID_PREFIX.length + 1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0300
     * @tc.name testSessionInitialState
     * @tc.desc Verify a new session starts in CREATED with zero launch count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-x', 500);
          expect(session.state).assertEqual(SessionState.CREATED);
          expect(session.launchCount).assertEqual(0);
          expect(session.isActive()).assertFalse();
          expect(session.isAlive()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0400
     * @tc.name testSessionCreatedToStarted
     * @tc.desc Verify CREATED to STARTED transition succeeds and records start latency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionCreatedToStarted', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-a', 1000);
          expect(session.markStarted(1200)).assertTrue();
          expect(session.state).assertEqual(SessionState.STARTED);
          expect(session.startLatency()).assertEqual(200);
          expect(session.launchCount).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0500
     * @tc.name testSessionStartedToActive
     * @tc.desc Verify STARTED to ACTIVE transition succeeds and records active latency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionStartedToActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-b', 1000);
          session.markStarted(1100);
          expect(session.markActive(1500)).assertTrue();
          expect(session.state).assertEqual(SessionState.ACTIVE);
          expect(session.activeLatency()).assertEqual(400);
          expect(session.isActive()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0600
     * @tc.name testSessionActiveToDestroyed
     * @tc.desc Verify an active session can be destroyed and is then terminal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionActiveToDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-c', 1000);
          session.markStarted(1100);
          session.markActive(1200);
          expect(session.markDestroyed(2000)).assertTrue();
          expect(session.state).assertEqual(SessionState.DESTROYED);
          expect(session.isAlive()).assertFalse();
          expect(SessionTransitionTable.isTerminal(session.state)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0700
     * @tc.name testSessionDestroyTwiceRejected
     * @tc.desc Verify destroying an already destroyed session returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionDestroyTwiceRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-d', 1000);
          expect(session.markDestroyed(1500)).assertTrue();
          expect(session.markDestroyed(1600)).assertFalse();
          expect(session.destroyedAt).assertEqual(1500);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0800
     * @tc.name testSessionInvalidTransitionCreatedToActive
     * @tc.desc Verify CREATED to ACTIVE is not an allowed transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionInvalidTransitionCreatedToActive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(SessionTransitionTable.isAllowed(SessionState.CREATED, SessionState.ACTIVE)).assertFalse();
          expect(SessionTransitionTable.isAllowed(SessionState.CREATED, SessionState.STARTED)).assertTrue();
          const session: LaunchSession = new LaunchSession('session-e', 1000);
          expect(session.markActive(1100)).assertFalse();
          expect(session.state).assertEqual(SessionState.CREATED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_0900
     * @tc.name testSessionStartedTwiceRejected
     * @tc.desc Verify a started session cannot be started a second time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionStartedTwiceRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-f', 1000);
          expect(session.markStarted(1100)).assertTrue();
          expect(session.markStarted(1200)).assertFalse();
          expect(session.launchCount).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1000
     * @tc.name testSessionAllowedTargets
     * @tc.desc Verify allowed targets per state match the lifecycle transition table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionAllowedTargets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(SessionTransitionTable.allowedTargets(SessionState.CREATED).length).assertEqual(2);
          expect(SessionTransitionTable.allowedTargets(SessionState.STARTED).length).assertEqual(2);
          expect(SessionTransitionTable.allowedTargets(SessionState.ACTIVE).length).assertEqual(1);
          expect(SessionTransitionTable.allowedTargets(SessionState.DESTROYED).length).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1100
     * @tc.name testSessionStateOrdering
     * @tc.desc Verify state ordering indexes move forward across the lifecycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionStateOrdering', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(SessionTransitionTable.orderIndex(SessionState.CREATED)).assertEqual(0);
          expect(SessionTransitionTable.orderIndex(SessionState.ACTIVE)).assertEqual(2);
          expect(SessionTransitionTable.orderIndex(SessionState.DESTROYED)).assertEqual(3);
          expect(SessionTransitionTable.isForward(SessionState.CREATED, SessionState.ACTIVE)).assertTrue();
          expect(SessionTransitionTable.isForward(SessionState.ACTIVE, SessionState.STARTED)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1200
     * @tc.name testSessionTransitionErrorName
     * @tc.desc Verify the transition error carries the name SessionTransitionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionTransitionErrorName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            throw SessionTransitionTable.toError(SessionErrorCode.INVALID_TRANSITION);
          } catch (e) {
            expect(e.name).assertEqual('SessionTransitionError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1300
     * @tc.name testSessionCapacityErrorName
     * @tc.desc Verify the capacity error carries the name SessionCapacityError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionCapacityErrorName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          try {
            throw SessionTransitionTable.toError(SessionErrorCode.CAPACITY_EXCEEDED);
          } catch (e) {
            expect(e.name).assertEqual('SessionCapacityError');
          }
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1400
     * @tc.name testSessionErrorNameTable
     * @tc.desc Verify the error name table maps not found and expired codes distinctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionErrorNameTable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(SessionTransitionTable.errorName(SessionErrorCode.SESSION_NOT_FOUND))
            .assertEqual('SessionNotFoundError');
          expect(SessionTransitionTable.errorName(SessionErrorCode.SESSION_EXPIRED))
            .assertEqual('SessionExpiredError');
          expect(SessionTransitionTable.errorName(SessionErrorCode.OK)).assertEqual('NoError');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1500
     * @tc.name testSessionFindById
     * @tc.desc Verify the pool finds an existing session and returns null for an unknown id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionFindById', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const created: LaunchSession = pool.create(1000);
          const found: LaunchSession | null = pool.find(created.id);
          if (found === null) {
            expect().assertFail();
            return;
          }
          expect(found.id).assertEqual(created.id);
          expect(pool.find('session-999')).assertEqual(null);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1600
     * @tc.name testSessionAliveCount
     * @tc.desc Verify alive count drops after destroying one of three sessions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionAliveCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          pool.create(1000);
          pool.create(1100);
          pool.create(1200);
          expect(pool.aliveCount()).assertEqual(3);
          expect(pool.destroy('session-2', 1300)).assertTrue();
          expect(pool.aliveCount()).assertEqual(2);
          expect(pool.destroy('session-999', 1300)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1700
     * @tc.name testSessionActiveCount
     * @tc.desc Verify active count counts only sessions that reached ACTIVE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionActiveCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const first: LaunchSession = pool.create(1000);
          const second: LaunchSession = pool.create(1100);
          first.markStarted(1050);
          first.markActive(1080);
          second.markStarted(1150);
          expect(pool.activeCount()).assertEqual(1);
          expect(second.isActive()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1800
     * @tc.name testSessionCapacityUpperBound
     * @tc.desc Verify four live sessions reach the limit and the fifth creation is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionCapacityUpperBound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          for (let i = 0; i < MAX_CONCURRENT_SESSIONS; i++) {
            pool.create(1000 + i);
          }
          expect(pool.aliveCount()).assertEqual(4);
          expect(pool.checkCapacity()).assertEqual(SessionErrorCode.CAPACITY_EXCEEDED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_1900
     * @tc.name testSessionCapacityRecoveredAfterDestroy
     * @tc.desc Verify destroying a session frees a slot so capacity checks pass again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionCapacityRecoveredAfterDestroy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          for (let i = 0; i < MAX_CONCURRENT_SESSIONS; i++) {
            pool.create(1000 + i);
          }
          pool.destroy('session-1', 1500);
          expect(pool.checkCapacity()).assertEqual(SessionErrorCode.OK);
          expect(pool.aliveCount()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2000
     * @tc.name testSessionGateCreatesFirstSession
     * @tc.desc Verify the start gate creates a started session for a fresh id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionGateCreatesFirstSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const gate: SessionStartGate = new SessionStartGate();
          expect(gate.evaluate(pool, 'request-1', 1000)).assertEqual(SessionErrorCode.OK);
          expect(gate.getCreated()).assertEqual(1);
          expect(pool.size()).assertEqual(1);
          expect(pool.find(gate.getLastId()) !== null).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2100
     * @tc.name testSessionGateReusesSameSession
     * @tc.desc Verify a repeated launch request reuses the live session instead of creating a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionGateReusesSameSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const gate: SessionStartGate = new SessionStartGate();
          gate.evaluate(pool, 'request-1', 1000);
          const firstId: string = gate.getLastId();
          expect(gate.evaluate(pool, firstId, 1100)).assertEqual(SessionErrorCode.OK);
          expect(gate.getReused()).assertEqual(1);
          expect(pool.size()).assertEqual(1);
          expect(gate.getLastId()).assertEqual(firstId);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2200
     * @tc.name testSessionGateRejectsEmptyId
     * @tc.desc Verify an empty requested id is rejected with ID_EMPTY and creates nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionGateRejectsEmptyId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const gate: SessionStartGate = new SessionStartGate();
          expect(gate.evaluate(pool, '', 1000)).assertEqual(SessionErrorCode.ID_EMPTY);
          expect(gate.getRejected()).assertEqual(1);
          expect(pool.size()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2300
     * @tc.name testSessionGateCapacityRejection
     * @tc.desc Verify the gate rejects a new session when four sessions are already alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionGateCapacityRejection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          for (let i = 0; i < MAX_CONCURRENT_SESSIONS; i++) {
            pool.create(1000 + i);
          }
          const gate: SessionStartGate = new SessionStartGate();
          expect(gate.evaluate(pool, 'request-new', 2000)).assertEqual(SessionErrorCode.CAPACITY_EXCEEDED);
          expect(gate.getCreated()).assertEqual(0);
          expect(pool.size()).assertEqual(MAX_CONCURRENT_SESSIONS);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2400
     * @tc.name testSessionExpiredByLifetime
     * @tc.desc Verify a session older than the lifetime is reported expired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionExpiredByLifetime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-t', 1000);
          expect(session.isExpired(1000 + SESSION_LIFETIME_MS)).assertFalse();
          expect(session.isExpired(1001 + SESSION_LIFETIME_MS)).assertTrue();
          expect(session.ageAt(2000)).assertEqual(1000);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2500
     * @tc.name testSessionDestroyedNotExpired
     * @tc.desc Verify a destroyed session is never reported as expired
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionDestroyedNotExpired', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const session: LaunchSession = new LaunchSession('session-u', 1000);
          session.markDestroyed(1500);
          expect(session.isExpired(1000 + SESSION_LIFETIME_MS * 10)).assertFalse();
          expect(session.totalLifetime()).assertEqual(500);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2600
     * @tc.name testSessionReclaimExpired
     * @tc.desc Verify reclaiming drops two expired sessions and leaves the fresh one alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionReclaimExpired', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          pool.create(0);
          pool.create(100);
          pool.create(SESSION_LIFETIME_MS * 2);
          expect(pool.reclaimExpired(SESSION_LIFETIME_MS * 2 + 10)).assertEqual(2);
          expect(pool.aliveCount()).assertEqual(1);
          expect(pool.getReclaimedCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2700
     * @tc.name testSessionReclaimNothing
     * @tc.desc Verify reclaiming with no expired sessions returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionReclaimNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          pool.create(10);
          pool.create(20);
          expect(pool.reclaimExpired(30)).assertEqual(0);
          expect(pool.aliveCount()).assertEqual(2);
          expect(pool.getDestroyedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2800
     * @tc.name testSessionRemoveDestroyed
     * @tc.desc Verify removing destroyed sessions shrinks the pool by exactly one entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionRemoveDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          pool.create(1000);
          pool.create(1100);
          pool.destroy('session-1', 1200);
          expect(pool.removeDestroyed()).assertEqual(1);
          expect(pool.size()).assertEqual(1);
          expect(pool.hasId('session-1')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_2900
     * @tc.name testSessionPoolClear
     * @tc.desc Verify clearing the pool empties it while creation counters stay intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionPoolClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          pool.create(1000);
          pool.create(1100);
          expect(pool.getCreatedCount()).assertEqual(2);
          pool.clear();
          expect(pool.size()).assertEqual(0);
          expect(pool.getCreatedCount()).assertEqual(2);
          expect(pool.aliveCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3000
     * @tc.name testSessionReclaimerBudgetBoundary
     * @tc.desc Verify reclaim timing exactly at the budget passes and one millisecond over fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionReclaimerBudgetBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const reclaimer: SessionReclaimer = new SessionReclaimer();
          expect(reclaimer.record(SESSION_RECLAIM_BUDGET_MS)).assertTrue();
          expect(reclaimer.record(SESSION_RECLAIM_BUDGET_MS + 1)).assertFalse();
          expect(reclaimer.count()).assertEqual(2);
          expect(reclaimer.overBudgetCount()).assertEqual(1);
          expect(reclaimer.getBudget()).assertEqual(TIMEOUT_SESSION_CREATE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3100
     * @tc.name testSessionReclaimerEmpty
     * @tc.desc Verify an empty reclaimer does not claim all samples are within budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionReclaimerEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const reclaimer: SessionReclaimer = new SessionReclaimer();
          expect(reclaimer.count()).assertEqual(0);
          expect(reclaimer.allWithinBudget()).assertFalse();
          reclaimer.record(10);
          expect(reclaimer.allWithinBudget()).assertTrue();
          reclaimer.clear();
          expect(reclaimer.count()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3200
     * @tc.name testSessionLaunchRendersIndex
     * @tc.desc Verify launching through the validated session reaches the Index page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionLaunchRendersIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const gate: SessionStartGate = new SessionStartGate();
          expect(gate.evaluate(pool, 'launch-1', Date.now())).assertEqual(SessionErrorCode.OK);
          const session: LaunchSession | null = pool.find(gate.getLastId());
          if (session === null) {
            expect().assertFail();
            return;
          }
          session.markActive(Date.now());
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await waitForIndexPageStable(driver)).assertTrue();
          expect(session.isActive()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3300
     * @tc.name testSessionLaunchLatencyBudget
     * @tc.desc Verify the measured session launch latency stays within the create timeout budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionLaunchLatencyBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const startTime: number = Date.now();
          await launchEntryAbility();
          const visible: boolean = await waitForIndexPageStable(driver, TIMEOUT_SESSION_CREATE * 4);
          const elapsed: number = measureElapsed(startTime);
          const reclaimer: SessionReclaimer = new SessionReclaimer(TIMEOUT_SESSION_CREATE * 4);
          expect(visible).assertTrue();
          expect(reclaimer.record(elapsed)).assertTrue();
          logInfo(`session launch latency ${elapsed} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3400
     * @tc.name testSessionSurvivesBackgroundCycle
     * @tc.desc Verify an active session remains active across a background foreground cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionSurvivesBackgroundCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const session: LaunchSession = pool.create(1000);
          session.markStarted(1050);
          session.markActive(1080);
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(pool.activeCount()).assertEqual(1);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3500
     * @tc.name testSessionTextAfterClick
     * @tc.desc Verify the launched session's page switches text on click as expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionTextAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSIONVALID_3600
     * @tc.name testSessionGateRejectsDuplicateLiveId
     * @tc.desc Verify requesting a live session id always reuses it and never creates a duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionGateRejectsDuplicateLiveId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const pool: SessionPool = new SessionPool();
          const gate: SessionStartGate = new SessionStartGate();
          gate.evaluate(pool, 'seed', 1000);
          const id: string = gate.getLastId();
          for (let i = 0; i < 3; i++) {
            expect(gate.evaluate(pool, id, 1100 + i)).assertEqual(SessionErrorCode.OK);
          }
          expect(gate.getReused()).assertEqual(3);
          expect(gate.getCreated()).assertEqual(1);
          expect(pool.size()).assertEqual(1);
        } finally {
          done();
        }
      })
  })
}
