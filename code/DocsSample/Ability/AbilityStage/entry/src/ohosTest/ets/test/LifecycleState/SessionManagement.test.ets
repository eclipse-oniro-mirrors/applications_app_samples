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
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkComponentExistsByKey,
  measureElapsed,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum SessionPhase {
  NONE = 'none',
  CREATED = 'created',
  ACTIVE = 'active',
  SUSPENDED = 'suspended',
  DESTROYED = 'destroyed'
}

interface SessionRecord {
  sessionId: string;
  phase: SessionPhase;
  createdAtMs: number;
  lastActiveAtMs: number;
  activationCount: number;
}

interface SessionStats {
  created: number;
  activated: number;
  suspended: number;
  destroyed: number;
  expired: number;
}

const MAX_CONCURRENT_SESSIONS: number = 4;

const SESSION_TTL_MS: number = 3000;

function sessionError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class SessionLifecycleRules {
  public static allowedTargets(from: SessionPhase): SessionPhase[] {
    if (from === SessionPhase.CREATED) {
      return [SessionPhase.ACTIVE, SessionPhase.DESTROYED];
    }
    if (from === SessionPhase.ACTIVE) {
      return [SessionPhase.SUSPENDED, SessionPhase.DESTROYED];
    }
    if (from === SessionPhase.SUSPENDED) {
      return [SessionPhase.ACTIVE, SessionPhase.DESTROYED];
    }
    return [];
  }

  public static isAllowed(from: SessionPhase, to: SessionPhase): boolean {
    const targets: SessionPhase[] = SessionLifecycleRules.allowedTargets(from);
    for (let i: number = 0; i < targets.length; i++) {
      if (targets[i] === to) {
        return true;
      }
    }
    return false;
  }

  public static isTerminal(phase: SessionPhase): boolean {
    return SessionLifecycleRules.allowedTargets(phase).length === 0;
  }

  public static describePath(): string {
    return 'created>active>suspended>active>destroyed';
  }
}

class SessionManager {
  private sessions: Map<string, SessionRecord> = new Map<string, SessionRecord>();

  private sequence: number = 0;

  private readonly maxConcurrent: number;

  private readonly ttlMs: number;

  private counters: SessionStats;

  constructor(maxConcurrent: number, ttlMs: number) {
    this.maxConcurrent = maxConcurrent;
    this.ttlMs = ttlMs;
    this.counters = {
      created: 0,
      activated: 0,
      suspended: 0,
      destroyed: 0,
      expired: 0
    };
  }

  public create(nowMs: number): SessionRecord {
    if (this.sessions.size >= this.maxConcurrent) {
      throw sessionError('SessionCapacityError', `concurrent limit ${this.maxConcurrent} reached`);
    }
    this.sequence++;
    const record: SessionRecord = {
      sessionId: `session_${this.sequence}`,
      phase: SessionPhase.CREATED,
      createdAtMs: nowMs,
      lastActiveAtMs: nowMs,
      activationCount: 0
    };
    this.sessions.set(record.sessionId, record);
    this.counters.created++;
    return record;
  }

  public activate(sessionId: string, nowMs: number): void {
    const record: SessionRecord = this.require(sessionId);
    if (!SessionLifecycleRules.isAllowed(record.phase, SessionPhase.ACTIVE)) {
      throw sessionError('IllegalSessionTransitionError', `${record.phase}->active rejected`);
    }
    record.phase = SessionPhase.ACTIVE;
    record.lastActiveAtMs = nowMs;
    record.activationCount++;
    this.counters.activated++;
  }

  public suspend(sessionId: string, nowMs: number): void {
    const record: SessionRecord = this.require(sessionId);
    if (!SessionLifecycleRules.isAllowed(record.phase, SessionPhase.SUSPENDED)) {
      throw sessionError('IllegalSessionTransitionError', `${record.phase}->suspended rejected`);
    }
    record.phase = SessionPhase.SUSPENDED;
    record.lastActiveAtMs = nowMs;
    this.counters.suspended++;
  }

  public destroy(sessionId: string): void {
    const record: SessionRecord = this.require(sessionId);
    if (!SessionLifecycleRules.isAllowed(record.phase, SessionPhase.DESTROYED)) {
      throw sessionError('IllegalSessionTransitionError', `${record.phase}->destroyed rejected`);
    }
    record.phase = SessionPhase.DESTROYED;
    this.sessions.delete(sessionId);
    this.counters.destroyed++;
  }

  private require(sessionId: string): SessionRecord {
    const record: SessionRecord | undefined = this.sessions.get(sessionId);
    if (record === undefined) {
      throw sessionError('UnknownSessionError', `session ${sessionId} not found`);
    }
    return record;
  }

  public phaseOf(sessionId: string): SessionPhase {
    const record: SessionRecord | undefined = this.sessions.get(sessionId);
    if (record === undefined) {
      return SessionPhase.NONE;
    }
    return record.phase;
  }

  public activationCountOf(sessionId: string): number {
    const record: SessionRecord | undefined = this.sessions.get(sessionId);
    if (record === undefined) {
      return 0;
    }
    return record.activationCount;
  }

  public liveCount(): number {
    return this.sessions.size;
  }

  public liveSessionIds(): string[] {
    const ids: string[] = [];
    for (let i: number = 1; i <= this.sequence; i++) {
      if (this.sessions.has(`session_${i}`)) {
        ids.push(`session_${i}`);
      }
    }
    return ids;
  }

  public expire(nowMs: number): number {
    const expired: string[] = [];
    const ids: string[] = this.liveSessionIds();
    for (let i: number = 0; i < ids.length; i++) {
      const record: SessionRecord | undefined = this.sessions.get(ids[i]);
      if (record === undefined) {
        continue;
      }
      if (nowMs - record.lastActiveAtMs >= this.ttlMs) {
        expired.push(ids[i]);
      }
    }
    for (let i: number = 0; i < expired.length; i++) {
      this.sessions.delete(expired[i]);
      this.counters.expired++;
    }
    return expired.length;
  }

  public getCounters(): SessionStats {
    const copy: SessionStats = {
      created: this.counters.created,
      activated: this.counters.activated,
      suspended: this.counters.suspended,
      destroyed: this.counters.destroyed,
      expired: this.counters.expired
    };
    return copy;
  }

  public isSessionIdUnique(candidate: string): boolean {
    for (let i: number = 1; i <= this.sequence; i++) {
      if (`session_${i}` === candidate) {
        return false;
      }
    }
    return true;
  }

  public nextSessionId(): string {
    return `session_${this.sequence + 1}`;
  }

  public getMaxConcurrent(): number {
    return this.maxConcurrent;
  }

  public getTtlMs(): number {
    return this.ttlMs;
  }
}

class SessionIdGenerator {
  private static readonly PREFIX: string = 'abilitystage';

  public static build(index: number): string {
    if (index < 0) {
      throw sessionError('SessionIdError', 'negative index');
    }
    return `${SessionIdGenerator.PREFIX}_${index}`;
  }

  public static isWellFormed(value: string): boolean {
    if (value.indexOf(SessionIdGenerator.PREFIX + '_') !== 0) {
      return false;
    }
    const suffix: string = value.substring(SessionIdGenerator.PREFIX.length + 1);
    if (suffix.length === 0) {
      return false;
    }
    for (let i: number = 0; i < suffix.length; i++) {
      const code: number = suffix.charCodeAt(i);
      if (code < 48 || code > 57) {
        return false;
      }
    }
    return true;
  }

  public static sequenceOf(value: string): number {
    if (!SessionIdGenerator.isWellFormed(value)) {
      return -1;
    }
    const suffix: string = value.substring(SessionIdGenerator.PREFIX.length + 1);
    let result: number = 0;
    for (let i: number = 0; i < suffix.length; i++) {
      result = result * 10 + (suffix.charCodeAt(i) - 48);
    }
    return result;
  }
}

export default function sessionManagementTest(): void {
  describe('SessionManagementTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      driver = getDriver();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('SessionManagementTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0100
     * @tc.name testCreateSessionStartsCreatedPhase
     * @tc.desc Verify session creation: first created session -> id session_1, phase created, activation 0, live 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateSessionStartsCreatedPhase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(1000);
        expect(session.sessionId).assertEqual('session_1');
        expect(session.phase).assertEqual(SessionPhase.CREATED);
        expect(session.activationCount).assertEqual(0);
        expect(manager.liveCount()).assertEqual(1);
        expect(manager.getCounters().created).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0200
     * @tc.name testCreateActivateSuspendDestroyCycle
     * @tc.desc Verify full session lifecycle: created to active to suspended to active to destroyed -> counters match each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateActivateSuspendDestroyCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(0);
        manager.activate(session.sessionId, 10);
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.ACTIVE);
        manager.suspend(session.sessionId, 20);
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.SUSPENDED);
        manager.activate(session.sessionId, 30);
        expect(manager.activationCountOf(session.sessionId)).assertEqual(2);
        manager.destroy(session.sessionId);
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.NONE);
        const counters: SessionStats = manager.getCounters();
        expect(counters.created).assertEqual(1);
        expect(counters.activated).assertEqual(2);
        expect(counters.suspended).assertEqual(1);
        expect(counters.destroyed).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0300
     * @tc.name testSessionIdsAreUnique
     * @tc.desc Verify id uniqueness: three created sessions -> ids session_1, session_2, session_3 and candidate uniqueness checks correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionIdsAreUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const first: SessionRecord = manager.create(0);
        const second: SessionRecord = manager.create(0);
        const third: SessionRecord = manager.create(0);
        expect(first.sessionId).assertEqual('session_1');
        expect(second.sessionId).assertEqual('session_2');
        expect(third.sessionId).assertEqual('session_3');
        expect(manager.isSessionIdUnique('session_4')).assertTrue();
        expect(manager.isSessionIdUnique('session_2')).assertFalse();
        expect(manager.nextSessionId()).assertEqual('session_4');
        expect(manager.liveSessionIds().length).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0400
     * @tc.name testConcurrentSessionLimitEnforced
     * @tc.desc Verify concurrency cap: limit 4 then fifth create -> throws SessionCapacityError with limit text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testConcurrentSessionLimitEnforced', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        for (let i: number = 0; i < MAX_CONCURRENT_SESSIONS; i++) {
          manager.create(i);
        }
        try {
          manager.create(99);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SessionCapacityError');
          expect(e.message).assertEqual('concurrent limit 4 reached');
        }
        expect(manager.liveCount()).assertEqual(MAX_CONCURRENT_SESSIONS);
        expect(manager.getMaxConcurrent()).assertEqual(MAX_CONCURRENT_SESSIONS);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0500
     * @tc.name testDestroyFreesConcurrencySlot
     * @tc.desc Verify slot reuse: at capacity destroy one session -> create succeeds with session_5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDestroyFreesConcurrencySlot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const ids: string[] = [];
        for (let i: number = 0; i < MAX_CONCURRENT_SESSIONS; i++) {
          ids.push(manager.create(i).sessionId);
        }
        manager.destroy(ids[0]);
        expect(manager.liveCount()).assertEqual(MAX_CONCURRENT_SESSIONS - 1);
        const replacement: SessionRecord = manager.create(200);
        expect(replacement.sessionId).assertEqual('session_5');
        expect(manager.liveCount()).assertEqual(MAX_CONCURRENT_SESSIONS);
        expect(manager.getCounters().destroyed).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0600
     * @tc.name testUnknownSessionThrows
     * @tc.desc Verify unknown id guard: activating session_9 -> throws UnknownSessionError naming the session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUnknownSessionThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        try {
          manager.activate('session_9', 0);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('UnknownSessionError');
          expect(e.message).assertEqual('session session_9 not found');
        }
        expect(manager.phaseOf('session_9')).assertEqual(SessionPhase.NONE);
        expect(manager.activationCountOf('session_9')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0700
     * @tc.name testSuspendBeforeActivateRejected
     * @tc.desc Verify transition rules: suspend directly on created session -> IllegalSessionTransitionError created->suspended rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSuspendBeforeActivateRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(0);
        try {
          manager.suspend(session.sessionId, 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('IllegalSessionTransitionError');
          expect(e.message).assertEqual('created->suspended rejected');
        }
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.CREATED);
        expect(manager.getCounters().suspended).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0800
     * @tc.name testDestroyedSessionCannotReactivate
     * @tc.desc Verify terminal phase lock: destroy then activate -> UnknownSessionError since record removed and terminal rules empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDestroyedSessionCannotReactivate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(0);
        manager.destroy(session.sessionId);
        expect(SessionLifecycleRules.isTerminal(SessionPhase.DESTROYED)).assertTrue();
        expect(SessionLifecycleRules.allowedTargets(SessionPhase.DESTROYED).length).assertEqual(0);
        try {
          manager.activate(session.sessionId, 10);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('UnknownSessionError');
        }
        expect(manager.liveCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_0900
     * @tc.name testExpiryReclaimsStaleSessions
     * @tc.desc Verify TTL reclaim: two sessions, only one refreshed, expire at ttl -> exactly one expired and one live
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExpiryReclaimsStaleSessions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, 1000);
        const stale: SessionRecord = manager.create(0);
        const fresh: SessionRecord = manager.create(0);
        manager.activate(fresh.sessionId, 900);
        const expiredCount: number = manager.expire(1000);
        expect(expiredCount).assertEqual(1);
        expect(manager.phaseOf(stale.sessionId)).assertEqual(SessionPhase.NONE);
        expect(manager.phaseOf(fresh.sessionId)).assertEqual(SessionPhase.ACTIVE);
        expect(manager.getCounters().expired).assertEqual(1);
        expect(manager.liveCount()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1000
     * @tc.name testExpiryKeepsSessionsWithinTtl
     * @tc.desc Verify TTL lower bound: expire at ttl minus 1 ms -> zero sessions reclaimed and both remain live
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExpiryKeepsSessionsWithinTtl', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, 1000);
        manager.create(0);
        manager.create(500);
        const expiredCount: number = manager.expire(999);
        expect(expiredCount).assertEqual(0);
        expect(manager.liveCount()).assertEqual(2);
        expect(manager.getCounters().expired).assertEqual(0);
        expect(manager.getTtlMs()).assertEqual(1000);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1100
     * @tc.name testExpiryBoundaryIsInclusive
     * @tc.desc Verify TTL boundary: session last active at 0 expires exactly at ttl 3000 -> one reclaimed at equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExpiryBoundaryIsInclusive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(0);
        expect(manager.expire(SESSION_TTL_MS - 1)).assertEqual(0);
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.CREATED);
        expect(manager.expire(SESSION_TTL_MS)).assertEqual(1);
        expect(manager.liveCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1200
     * @tc.name testExpireOnEmptyManagerReturnsZero
     * @tc.desc Verify empty expiry: no sessions then expire -> 0 reclaimed and expired counter 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExpireOnEmptyManagerReturnsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, 100);
        expect(manager.expire(10000)).assertEqual(0);
        expect(manager.liveCount()).assertEqual(0);
        expect(manager.liveSessionIds().length).assertEqual(0);
        const counters: SessionStats = manager.getCounters();
        expect(counters.created).assertEqual(0);
        expect(counters.expired).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1300
     * @tc.name testSessionIdGeneratorFormatting
     * @tc.desc Verify id generator: build index 7 -> abilitystage_7 with sequence 7 and well formed true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionIdGeneratorFormatting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const id: string = SessionIdGenerator.build(7);
        expect(id).assertEqual('abilitystage_7');
        expect(SessionIdGenerator.isWellFormed(id)).assertTrue();
        expect(SessionIdGenerator.sequenceOf(id)).assertEqual(7);
        expect(SessionIdGenerator.isWellFormed('abilitystage_')).assertFalse();
        expect(SessionIdGenerator.isWellFormed('abilitystage_1a')).assertFalse();
        expect(SessionIdGenerator.sequenceOf('bad')).assertEqual(-1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1400
     * @tc.name testSessionIdGeneratorRejectsNegativeIndex
     * @tc.desc Verify id generator guard: index -1 -> throws SessionIdError with negative index message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSessionIdGeneratorRejectsNegativeIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        try {
          SessionIdGenerator.build(-1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('SessionIdError');
          expect(e.message).assertEqual('negative index');
        }
        expect(SessionIdGenerator.build(0)).assertEqual('abilitystage_0');
        expect(SessionIdGenerator.sequenceOf('abilitystage_0')).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1500
     * @tc.name testLifecycleRulesDescribePath
     * @tc.desc Verify rule declaration: path string and per phase target counts created 2, active 2, suspended 2, destroyed 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLifecycleRulesDescribePath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(SessionLifecycleRules.describePath()).assertEqual('created>active>suspended>active>destroyed');
        expect(SessionLifecycleRules.allowedTargets(SessionPhase.CREATED).length).assertEqual(2);
        expect(SessionLifecycleRules.allowedTargets(SessionPhase.ACTIVE).length).assertEqual(2);
        expect(SessionLifecycleRules.allowedTargets(SessionPhase.SUSPENDED).length).assertEqual(2);
        expect(SessionLifecycleRules.allowedTargets(SessionPhase.DESTROYED).length).assertEqual(0);
        expect(SessionLifecycleRules.isAllowed(SessionPhase.ACTIVE, SessionPhase.ACTIVE)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1600
     * @tc.name testCreateAfterExpiryContinuesSequence
     * @tc.desc Verify id monotonicity: create session_1, expire it, create again -> session_2 not recycled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCreateAfterExpiryContinuesSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, 100);
        const first: SessionRecord = manager.create(0);
        expect(first.sessionId).assertEqual('session_1');
        expect(manager.expire(100)).assertEqual(1);
        const second: SessionRecord = manager.create(200);
        expect(second.sessionId).assertEqual('session_2');
        expect(manager.isSessionIdUnique('session_1')).assertFalse();
        expect(manager.isSessionIdUnique('session_2')).assertFalse();
        expect(manager.getCounters().created).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1700
     * @tc.name testUiSessionActiveWhilePageVisible
     * @tc.desc Verify session tied to live UI: launch EntryAbility then activate session -> phase active and HelloWorld component present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSessionActiveWhilePageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(Date.now());
        manager.activate(session.sessionId, Date.now());
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.ACTIVE);
        expect(await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1800
     * @tc.name testUiSessionSuspendedOnBackground
     * @tc.desc Verify suspend maps to background: background EntryAbility -> session suspended and page invisible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSessionSuspendedOnBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(0);
        manager.activate(session.sessionId, 10);
        await doAbilityBackground();
        manager.suspend(session.sessionId, 20);
        await sleepMs(DELAY_AFTER_BACKGROUND);
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.SUSPENDED);
        expect(await isIndexPageVisible(driver)).assertFalse();
        expect(manager.getCounters().suspended).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_1900
     * @tc.name testUiSessionReactivatedAfterForeground
     * @tc.desc Verify reactivation: suspended session resumes to active and page becomes visible again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiSessionReactivatedAfterForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const session: SessionRecord = manager.create(0);
        manager.activate(session.sessionId, 10);
        await doAbilityBackground();
        manager.suspend(session.sessionId, 20);
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        manager.activate(session.sessionId, 30);
        await sleepMs(DELAY_AFTER_LAUNCH);
        expect(manager.phaseOf(session.sessionId)).assertEqual(SessionPhase.ACTIVE);
        expect(manager.activationCountOf(session.sessionId)).assertEqual(2);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_2000
     * @tc.name testUiSessionChurnDoesNotDisturbPage
     * @tc.desc Verify churn isolation: 6 create/activate/destroy cycles on live page -> page still visible and no sessions left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiSessionChurnDoesNotDisturbPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        for (let i: number = 0; i < 6; i++) {
          const session: SessionRecord = manager.create(i * 10);
          manager.activate(session.sessionId, i * 10 + 1);
          manager.destroy(session.sessionId);
        }
        expect(manager.liveCount()).assertEqual(0);
        const counters: SessionStats = manager.getCounters();
        expect(counters.created).assertEqual(6);
        expect(counters.activated).assertEqual(6);
        expect(counters.destroyed).assertEqual(6);
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_2100
     * @tc.name testSessionCreationWithinBudget
     * @tc.desc Verify creation cost: 300 create and destroy pairs -> completes within 1500 ms and created counter 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testSessionCreationWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, SESSION_TTL_MS);
        const startTime: number = Date.now();
        for (let i: number = 0; i < 300; i++) {
          const session: SessionRecord = manager.create(i);
          manager.destroy(session.sessionId);
        }
        const elapsed: number = measureElapsed(startTime);
        expect(manager.getCounters().created).assertEqual(300);
        expect(manager.getCounters().destroyed).assertEqual(300);
        expect(elapsed <= TIMEOUT_SESSION_CREATE * 2).assertTrue();
        expect(manager.liveCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_2200
     * @tc.name testExpiryAfterDestroyDoesNotDoubleCount
     * @tc.desc Verify expiry accounting: destroyed session removed before expire -> expire returns 0 and expired counter stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testExpiryAfterDestroyDoesNotDoubleCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, 100);
        const session: SessionRecord = manager.create(0);
        manager.destroy(session.sessionId);
        expect(manager.expire(10000)).assertEqual(0);
        expect(manager.getCounters().expired).assertEqual(0);
        expect(manager.getCounters().destroyed).assertEqual(1);
        expect(manager.liveCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_SESSION_2300
     * @tc.name testMultipleSessionsExpireTogether
     * @tc.desc Verify batch expiry: three sessions with same timestamp -> all expire together returning 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testMultipleSessionsExpireTogether', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const manager: SessionManager = new SessionManager(MAX_CONCURRENT_SESSIONS, 500);
        manager.create(0);
        manager.create(0);
        manager.create(0);
        expect(manager.liveCount()).assertEqual(3);
        const expiredCount: number = manager.expire(500);
        expect(expiredCount).assertEqual(3);
        expect(manager.liveCount()).assertEqual(0);
        expect(manager.getCounters().expired).assertEqual(3);
        expect(manager.liveSessionIds().length).assertEqual(0);
      } finally {
        done();
      }
    })
  })
}
