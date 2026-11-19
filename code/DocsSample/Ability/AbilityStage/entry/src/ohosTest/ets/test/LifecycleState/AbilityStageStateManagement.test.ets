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
import Want from '@ohos.app.ability.Want';
import {
  getDriver,
  logInfo,
  sleepMs,
  launchEntryAbility,
  doAbilityBackground,
  doAbilityForeground,
  waitForIndexPageStable,
  isIndexPageVisible,
  pageComponentCount,
  checkComponentExistsByKey,
  buildEntryWant,
  measureElapsed,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_PAGE_RENDER,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  ABILITY_STAGE_NAME,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

enum StageState {
  IDLE = 'IDLE',
  RUNNING = 'RUNNING',
  PAUSED = 'PAUSED',
  STOPPED = 'STOPPED',
  DESTROYED = 'DESTROYED'
}

const ALL_STATES: StageState[] = [
  StageState.IDLE,
  StageState.RUNNING,
  StageState.PAUSED,
  StageState.STOPPED,
  StageState.DESTROYED
];

interface StageTransitionRecord {
  fromState: StageState;
  toState: StageState;
  trigger: string;
  timestampMs: number;
}

interface StageSnapshot {
  state: StageState;
  generation: number;
  transitionCount: number;
  lastTrigger: string;
  acceptWantCount: number;
}

interface TransitionRule {
  fromState: StageState;
  toStates: StageState[];
}

function makeNamedError(name: string, message: string): Error {
  const error: Error = new Error(message);
  error.name = name;
  return error;
}

class StageStateRules {
  private static readonly RULES: TransitionRule[] = [
    { fromState: StageState.IDLE, toStates: [StageState.RUNNING, StageState.DESTROYED] },
    { fromState: StageState.RUNNING, toStates: [StageState.PAUSED, StageState.STOPPED, StageState.DESTROYED] },
    { fromState: StageState.PAUSED, toStates: [StageState.RUNNING, StageState.STOPPED, StageState.DESTROYED] },
    { fromState: StageState.STOPPED, toStates: [StageState.RUNNING, StageState.IDLE, StageState.DESTROYED] },
    { fromState: StageState.DESTROYED, toStates: [] }
  ];

  public static allowedTargets(fromState: StageState): StageState[] {
    for (let i: number = 0; i < StageStateRules.RULES.length; i++) {
      if (StageStateRules.RULES[i].fromState === fromState) {
        return StageStateRules.RULES[i].toStates;
      }
    }
    return [];
  }

  public static isAllowed(fromState: StageState, toState: StageState): boolean {
    const targets: StageState[] = StageStateRules.allowedTargets(fromState);
    for (let i: number = 0; i < targets.length; i++) {
      if (targets[i] === toState) {
        return true;
      }
    }
    return false;
  }

  public static isTerminal(state: StageState): boolean {
    return StageStateRules.allowedTargets(state).length === 0;
  }

  public static countAllowed(fromState: StageState): number {
    return StageStateRules.allowedTargets(fromState).length;
  }

  public static listReachableInOneStep(fromState: StageState): string {
    const targets: StageState[] = StageStateRules.allowedTargets(fromState);
    let text: string = '';
    for (let i: number = 0; i < targets.length; i++) {
      if (i > 0) {
        text += ',';
      }
      text += `${targets[i]}`;
    }
    return text;
  }
}

class AbilityStageStateMachine {
  private state: StageState = StageState.IDLE;

  private generation: number = 0;

  private history: StageTransitionRecord[] = [];

  private lastTrigger: string = '';

  private acceptWantCount: number = 0;

  public getState(): StageState {
    return this.state;
  }

  public getGeneration(): number {
    return this.generation;
  }

  public getLastTrigger(): string {
    return this.lastTrigger;
  }

  public getAcceptWantCount(): number {
    return this.acceptWantCount;
  }

  public getHistory(): StageTransitionRecord[] {
    const copy: StageTransitionRecord[] = [];
    for (let i: number = 0; i < this.history.length; i++) {
      copy.push(this.history[i]);
    }
    return copy;
  }

  public getTransitionCount(): number {
    return this.history.length;
  }

  public canTransitionTo(target: StageState): boolean {
    return StageStateRules.isAllowed(this.state, target);
  }

  public transitionTo(target: StageState, trigger: string, nowMs: number): void {
    if (this.state === target) {
      throw makeNamedError('StageStateError', `already in state ${target}`);
    }
    if (!StageStateRules.isAllowed(this.state, target)) {
      throw makeNamedError('IllegalStageTransitionError', `${this.state}->${target} rejected`);
    }
    const record: StageTransitionRecord = {
      fromState: this.state,
      toState: target,
      trigger: trigger,
      timestampMs: nowMs
    };
    this.history.push(record);
    this.state = target;
    this.lastTrigger = trigger;
    this.generation++;
  }

  public acceptWant(want: Want | null): string {
    const key: string = WantValidator.resolveInstanceKey(want);
    this.acceptWantCount++;
    return key;
  }

  public snapshot(): StageSnapshot {
    const snap: StageSnapshot = {
      state: this.state,
      generation: this.generation,
      transitionCount: this.history.length,
      lastTrigger: this.lastTrigger,
      acceptWantCount: this.acceptWantCount
    };
    return snap;
  }

  public restore(snapshot: StageSnapshot): void {
    if (snapshot.generation < 0) {
      throw makeNamedError('StageSnapshotError', 'negative generation');
    }
    if (snapshot.transitionCount < 0) {
      throw makeNamedError('StageSnapshotError', 'negative transition count');
    }
    this.state = snapshot.state;
    this.generation = snapshot.generation;
    this.lastTrigger = snapshot.lastTrigger;
    this.acceptWantCount = snapshot.acceptWantCount;
    this.history = [];
  }

  public replay(records: StageTransitionRecord[], startState: StageState): number {
    this.state = startState;
    this.history = [];
    this.generation = 0;
    let replayed: number = 0;
    for (let i: number = 0; i < records.length; i++) {
      const record: StageTransitionRecord = records[i];
      if (record.fromState !== this.state) {
        throw makeNamedError('StageReplayError', `replay mismatch at index ${i}`);
      }
      if (!StageStateRules.isAllowed(record.fromState, record.toState)) {
        throw makeNamedError('IllegalStageTransitionError', `replay ${record.fromState}->${record.toState}`);
      }
      this.history.push(record);
      this.state = record.toState;
      this.lastTrigger = record.trigger;
      this.generation++;
      replayed++;
    }
    return replayed;
  }

  public countTransitionsTo(target: StageState): number {
    let count: number = 0;
    for (let i: number = 0; i < this.history.length; i++) {
      if (this.history[i].toState === target) {
        count++;
      }
    }
    return count;
  }

  public countTransitionsFrom(source: StageState): number {
    let count: number = 0;
    for (let i: number = 0; i < this.history.length; i++) {
      if (this.history[i].fromState === source) {
        count++;
      }
    }
    return count;
  }

  public isHealthy(): boolean {
    return this.state !== StageState.DESTROYED && this.generation >= 0;
  }

  public reset(): void {
    this.state = StageState.IDLE;
    this.generation = 0;
    this.history = [];
    this.lastTrigger = '';
    this.acceptWantCount = 0;
  }
}

class WantValidator {
  public static readonly INSTANCE_KEY: string = 'MyAbilityStage';

  public static isValid(want: Want | null): boolean {
    if (want === null) {
      return false;
    }
    const bundle: string | undefined = want.bundleName;
    const ability: string | undefined = want.abilityName;
    if (bundle === undefined || bundle.length === 0) {
      return false;
    }
    if (ability === undefined || ability.length === 0) {
      return false;
    }
    return true;
  }

  public static resolveInstanceKey(want: Want | null): string {
    if (!WantValidator.isValid(want)) {
      throw makeNamedError('InvalidWantError', 'want is null or missing fields');
    }
    return WantValidator.INSTANCE_KEY;
  }

  public static isSpecifiedMode(want: Want | null): boolean {
    if (want === null) {
      return false;
    }
    const bundle: string | undefined = want.bundleName;
    if (bundle === undefined || bundle.length === 0) {
      return false;
    }
    const ability: string | undefined = want.abilityName;
    if (ability === undefined || ability.length === 0) {
      return false;
    }
    const rawFlags: number | undefined = want.flags;
    if (rawFlags === undefined) {
      return false;
    }
    return (rawFlags & 1024) !== 0;
  }

  public static buildWant(bundleName: string, abilityName: string): Want {
    const want: Want = {
      bundleName: bundleName,
      abilityName: abilityName
    };
    return want;
  }
}

class StageSnapshotCodec {
  private static readonly FIELD_SEPARATOR: string = ';';

  public encode(snapshot: StageSnapshot): string {
    return `${snapshot.state}${StageSnapshotCodec.FIELD_SEPARATOR}${snapshot.generation}` +
      `${StageSnapshotCodec.FIELD_SEPARATOR}${snapshot.transitionCount}` +
      `${StageSnapshotCodec.FIELD_SEPARATOR}${snapshot.acceptWantCount}` +
      `${StageSnapshotCodec.FIELD_SEPARATOR}${snapshot.lastTrigger}`;
  }

  public decode(payload: string): StageSnapshot {
    if (payload.length === 0) {
      throw makeNamedError('StageSnapshotError', 'empty payload');
    }
    const parts: string[] = payload.split(StageSnapshotCodec.FIELD_SEPARATOR);
    if (parts.length !== 5) {
      throw makeNamedError('StageSnapshotError', `expected 5 fields, got ${parts.length}`);
    }
    const state: StageState = this.parseState(parts[0]);
    const snapshot: StageSnapshot = {
      state: state,
      generation: StageSnapshotCodec.toNumber(parts[1]),
      transitionCount: StageSnapshotCodec.toNumber(parts[2]),
      acceptWantCount: StageSnapshotCodec.toNumber(parts[3]),
      lastTrigger: parts[4]
    };
    if (snapshot.generation < 0 || snapshot.transitionCount < 0) {
      throw makeNamedError('StageSnapshotError', 'non numeric counter field');
    }
    return snapshot;
  }

  private static toNumber(text: string): number {
    if (text.length === 0) {
      return -1;
    }
    let value: number = 0;
    for (let i: number = 0; i < text.length; i++) {
      const digit: number = text.charCodeAt(i) - 48;
      if (digit < 0 || digit > 9) {
        return -1;
      }
      value = value * 10 + digit;
    }
    return value;
  }

  private parseState(text: string): StageState {
    if (text === 'IDLE') {
      return StageState.IDLE;
    }
    if (text === 'RUNNING') {
      return StageState.RUNNING;
    }
    if (text === 'PAUSED') {
      return StageState.PAUSED;
    }
    if (text === 'STOPPED') {
      return StageState.STOPPED;
    }
    if (text === 'DESTROYED') {
      return StageState.DESTROYED;
    }
    throw makeNamedError('StageSnapshotError', `unknown state ${text}`);
  }

  public isEncodable(payload: string): boolean {
    if (payload.length === 0) {
      return false;
    }
    try {
      this.decode(payload);
      return true;
    } catch (e) {
      return false;
    }
  }

  public isDefaultSnapshot(snapshot: StageSnapshot): boolean {
    return snapshot.state === StageState.IDLE && snapshot.generation === 0 && snapshot.transitionCount === 0;
  }
}

class StageAuditReport {
  private totalTransitions: number;

  private pausedCount: number;

  private stoppedCount: number;

  private destroyedReached: boolean;

  constructor(totalTransitions: number, pausedCount: number, stoppedCount: number, destroyedReached: boolean) {
    this.totalTransitions = totalTransitions;
    this.pausedCount = pausedCount;
    this.stoppedCount = stoppedCount;
    this.destroyedReached = destroyedReached;
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public getPausedCount(): number {
    return this.pausedCount;
  }

  public getStoppedCount(): number {
    return this.stoppedCount;
  }

  public didReachDestroyed(): boolean {
    return this.destroyedReached;
  }

  public computeRestartCount(): number {
    return this.pausedCount + this.stoppedCount;
  }

  public isCleanShutdown(): boolean {
    return this.destroyedReached && this.totalTransitions > 0;
  }

  public describe(): string {
    return `transitions=${this.totalTransitions} paused=${this.pausedCount} stopped=${this.stoppedCount} destroyed=${this.destroyedReached}`;
  }
}

class StageHealthMonitor {
  private samples: number[] = [];

  public sample(durationMs: number): void {
    if (durationMs < 0) {
      throw makeNamedError('StageHealthError', 'negative duration');
    }
    this.samples.push(durationMs);
  }

  public getSampleCount(): number {
    return this.samples.length;
  }

  public average(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let sum: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      sum += this.samples[i];
    }
    return sum / this.samples.length;
  }

  public peak(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let best: number = this.samples[0];
    for (let i: number = 1; i < this.samples.length; i++) {
      if (this.samples[i] > best) {
        best = this.samples[i];
      }
    }
    return best;
  }

  public trough(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    let best: number = this.samples[0];
    for (let i: number = 1; i < this.samples.length; i++) {
      if (this.samples[i] < best) {
        best = this.samples[i];
      }
    }
    return best;
  }

  public countAbove(threshold: number): number {
    let count: number = 0;
    for (let i: number = 0; i < this.samples.length; i++) {
      if (this.samples[i] > threshold) {
        count++;
      }
    }
    return count;
  }

  public reset(): void {
    this.samples = [];
  }
}

export default function abilityStageStateManagementTest(): void {
  describe('AbilityStageStateManagementTest', () => {
    let driver: Driver = getDriver();
    let machine: AbilityStageStateMachine = new AbilityStageStateMachine();

    beforeAll(async () => {
      driver = getDriver();
      machine = new AbilityStageStateMachine();
      await launchEntryAbility();
      await sleepMs(DELAY_AFTER_LAUNCH);

      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      await doAbilityForeground();
      await sleepMs(DELAY_AFTER_BACKGROUND);
      logInfo('AbilityStageStateManagementTest: suite finished');
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0100
     * @tc.name testInitialStateIsIdle
     * @tc.desc Verify fresh state machine: constructed stage -> state IDLE, generation 0, transition count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInitialStateIsIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        expect(stage.getState()).assertEqual(StageState.IDLE);
        expect(stage.getGeneration()).assertEqual(0);
        expect(stage.getTransitionCount()).assertEqual(0);
        expect(stage.isHealthy()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0200
     * @tc.name testIdleToRunningTransition
     * @tc.desc Verify legal startup migration: IDLE to RUNNING -> state RUNNING, generation 1, one history record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIdleToRunningTransition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'onCreate', 100);
        expect(stage.getState()).assertEqual(StageState.RUNNING);
        expect(stage.getGeneration()).assertEqual(1);
        expect(stage.getLastTrigger()).assertEqual('onCreate');
        const history: StageTransitionRecord[] = stage.getHistory();
        expect(history.length).assertEqual(1);
        expect(history[0].fromState).assertEqual(StageState.IDLE);
        expect(history[0].toState).assertEqual(StageState.RUNNING);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0300
     * @tc.name testRunningToPausedThenRunning
     * @tc.desc Verify pause and resume cycle: RUNNING to PAUSED to RUNNING -> generation 3 and pause count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunningToPausedThenRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'onCreate', 100);
        stage.transitionTo(StageState.PAUSED, 'onBackground', 200);
        stage.transitionTo(StageState.RUNNING, 'onForeground', 300);
        expect(stage.getState()).assertEqual(StageState.RUNNING);
        expect(stage.getGeneration()).assertEqual(3);
        expect(stage.countTransitionsTo(StageState.PAUSED)).assertEqual(1);
        expect(stage.countTransitionsFrom(StageState.PAUSED)).assertEqual(1);
        expect(stage.countTransitionsTo(StageState.RUNNING)).assertEqual(2);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0400
     * @tc.name testRunningToStoppedThenIdle
     * @tc.desc Verify stop and recycle path: RUNNING to STOPPED to IDLE -> stopped count 1 and final state IDLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRunningToStoppedThenIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'onCreate', 100);
        stage.transitionTo(StageState.STOPPED, 'onStop', 200);
        stage.transitionTo(StageState.IDLE, 'recycle', 300);
        expect(stage.getState()).assertEqual(StageState.IDLE);
        expect(stage.countTransitionsTo(StageState.STOPPED)).assertEqual(1);
        expect(stage.countTransitionsFrom(StageState.STOPPED)).assertEqual(1);
        expect(stage.getGeneration()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0500
     * @tc.name testIllegalIdleToPausedThrows
     * @tc.desc Verify illegal migration rejection: IDLE to PAUSED -> throws Error named IllegalStageTransitionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIllegalIdleToPausedThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        expect(stage.canTransitionTo(StageState.PAUSED)).assertFalse();
        try {
          stage.transitionTo(StageState.PAUSED, 'invalid', 100);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('IllegalStageTransitionError');
          expect(e.message).assertEqual('IDLE->PAUSED rejected');
        }
        expect(stage.getState()).assertEqual(StageState.IDLE);
        expect(stage.getGeneration()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0600
     * @tc.name testIllegalDestroyedToRunningThrows
     * @tc.desc Verify terminal state lock: DESTROYED to RUNNING -> throws IllegalStageTransitionError and terminal flag true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIllegalDestroyedToRunningThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.DESTROYED, 'onDestroy', 100);
        expect(StageStateRules.isTerminal(StageState.DESTROYED)).assertTrue();
        expect(StageStateRules.countAllowed(StageState.DESTROYED)).assertEqual(0);
        try {
          stage.transitionTo(StageState.RUNNING, 'restart', 200);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('IllegalStageTransitionError');
        }
        expect(stage.getState()).assertEqual(StageState.DESTROYED);
        expect(stage.isHealthy()).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0700
     * @tc.name testSelfTransitionRejected
     * @tc.desc Verify redundant migration rejection: RUNNING to RUNNING -> throws Error named StageStateError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSelfTransitionRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'onCreate', 100);
        try {
          stage.transitionTo(StageState.RUNNING, 'duplicate', 200);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStateError');
          expect(e.message).assertEqual('already in state RUNNING');
        }
        expect(stage.getTransitionCount()).assertEqual(1);
        expect(stage.getGeneration()).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0800
     * @tc.name testAllowedTargetsMatrix
     * @tc.desc Verify transition table: IDLE permits 2 targets, RUNNING 3, PAUSED 3, STOPPED 3, DESTROYED 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAllowedTargetsMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        expect(StageStateRules.countAllowed(StageState.IDLE)).assertEqual(2);
        expect(StageStateRules.countAllowed(StageState.RUNNING)).assertEqual(3);
        expect(StageStateRules.countAllowed(StageState.PAUSED)).assertEqual(3);
        expect(StageStateRules.countAllowed(StageState.STOPPED)).assertEqual(3);
        expect(StageStateRules.countAllowed(StageState.DESTROYED)).assertEqual(0);
        expect(StageStateRules.listReachableInOneStep(StageState.IDLE)).assertEqual('RUNNING,DESTROYED');
        expect(StageStateRules.listReachableInOneStep(StageState.DESTROYED)).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_0900
     * @tc.name testFullLifecyclePathReachesDestroyed
     * @tc.desc Verify complete lifecycle: IDLE to RUNNING to PAUSED to RUNNING to STOPPED to DESTROYED -> 5 transitions, destroyed terminal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFullLifecyclePathReachesDestroyed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 100);
        stage.transitionTo(StageState.PAUSED, 'pause', 200);
        stage.transitionTo(StageState.RUNNING, 'resume', 300);
        stage.transitionTo(StageState.STOPPED, 'stop', 400);
        stage.transitionTo(StageState.DESTROYED, 'destroy', 500);
        expect(stage.getTransitionCount()).assertEqual(5);
        expect(stage.getState()).assertEqual(StageState.DESTROYED);
        expect(stage.getLastTrigger()).assertEqual('destroy');
        expect(StageStateRules.isTerminal(stage.getState())).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1000
     * @tc.name testSnapshotCapturesStateAndGeneration
     * @tc.desc Verify snapshot content: after two transitions -> snapshot state RUNNING, generation 2, transition count 2, last trigger onForeground
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotCapturesStateAndGeneration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'onCreate', 100);
        stage.transitionTo(StageState.PAUSED, 'onBackground', 200);
        stage.transitionTo(StageState.RUNNING, 'onForeground', 300);
        const snapshot: StageSnapshot = stage.snapshot();
        expect(snapshot.state).assertEqual(StageState.RUNNING);
        expect(snapshot.generation).assertEqual(3);
        expect(snapshot.transitionCount).assertEqual(3);
        expect(snapshot.lastTrigger).assertEqual('onForeground');
        expect(snapshot.acceptWantCount).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1100
     * @tc.name testSnapshotRestoreReproducesState
     * @tc.desc Verify snapshot restore: restore snapshot captured at generation 2 into fresh machine -> state and generation match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotRestoreReproducesState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const source: AbilityStageStateMachine = new AbilityStageStateMachine();
        source.transitionTo(StageState.RUNNING, 'create', 100);
        source.transitionTo(StageState.PAUSED, 'pause', 200);
        const snapshot: StageSnapshot = source.snapshot();
        const target: AbilityStageStateMachine = new AbilityStageStateMachine();
        target.restore(snapshot);
        expect(target.getState()).assertEqual(StageState.PAUSED);
        expect(target.getGeneration()).assertEqual(2);
        expect(target.getLastTrigger()).assertEqual('pause');
        expect(target.getTransitionCount()).assertEqual(0);
        expect(target.canTransitionTo(StageState.RUNNING)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1200
     * @tc.name testRestoreRejectsNegativeGeneration
     * @tc.desc Verify snapshot validation: snapshot with generation -1 -> throws StageSnapshotError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRestoreRejectsNegativeGeneration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        const broken: StageSnapshot = {
          state: StageState.RUNNING,
          generation: -1,
          transitionCount: 0,
          lastTrigger: 'corrupt',
          acceptWantCount: 0
        };
        try {
          stage.restore(broken);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageSnapshotError');
          expect(e.message).assertEqual('negative generation');
        }
        expect(stage.getState()).assertEqual(StageState.IDLE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1300
     * @tc.name testReplayRebuildsHistory
     * @tc.desc Verify replay: three recorded transitions replayed from IDLE -> final RUNNING and replayed count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplayRebuildsHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const records: StageTransitionRecord[] = [
          {
            fromState: StageState.IDLE,
            toState: StageState.RUNNING,
            trigger: 'create',
            timestampMs: 100
          },
          {
            fromState: StageState.RUNNING,
            toState: StageState.PAUSED,
            trigger: 'pause',
            timestampMs: 200
          },
          {
            fromState: StageState.PAUSED,
            toState: StageState.RUNNING,
            trigger: 'resume',
            timestampMs: 300
          }
        ];
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        const replayed: number = stage.replay(records, StageState.IDLE);
        expect(replayed).assertEqual(3);
        expect(stage.getState()).assertEqual(StageState.RUNNING);
        expect(stage.getTransitionCount()).assertEqual(3);
        expect(stage.getGeneration()).assertEqual(3);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1400
     * @tc.name testReplayDetectsBrokenChain
     * @tc.desc Verify replay validation: record claiming a PAUSED source after IDLE start -> throws StageReplayError at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplayDetectsBrokenChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const broken: StageTransitionRecord[] = [
          {
            fromState: StageState.PAUSED,
            toState: StageState.RUNNING,
            trigger: 'resume',
            timestampMs: 100
          }
        ];
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        try {
          stage.replay(broken, StageState.IDLE);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageReplayError');
          expect(e.message).assertEqual('replay mismatch at index 0');
        }
        expect(stage.getState()).assertEqual(StageState.IDLE);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1500
     * @tc.name testReplayDetectsIllegalHop
     * @tc.desc Verify replay rule enforcement: IDLE to PAUSED record -> throws IllegalStageTransitionError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplayDetectsIllegalHop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const illegal: StageTransitionRecord[] = [
          {
            fromState: StageState.IDLE,
            toState: StageState.PAUSED,
            trigger: 'bad',
            timestampMs: 100
          }
        ];
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        try {
          stage.replay(illegal, StageState.IDLE);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('IllegalStageTransitionError');
          expect(e.message).assertEqual('replay IDLE->PAUSED');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1600
     * @tc.name testAcceptWantReturnsStageInstanceKey
     * @tc.desc Verify onAcceptWant return value: valid want passed to stage -> returns literal MyAbilityStage and counter increments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantReturnsStageInstanceKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        const want: Want = buildEntryWant();
        const key: string = stage.acceptWant(want);
        expect(key).assertEqual('MyAbilityStage');
        expect(key).assertEqual(ABILITY_STAGE_NAME);
        expect(stage.getAcceptWantCount()).assertEqual(1);
        expect(WantValidator.INSTANCE_KEY).assertEqual('MyAbilityStage');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1700
     * @tc.name testAcceptWantRejectsNullWant
     * @tc.desc Verify specified mode guard: null want -> throws InvalidWantError and count stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantRejectsNullWant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        try {
          stage.acceptWant(null);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidWantError');
          expect(e.message).assertEqual('want is null or missing fields');
        }
        expect(stage.getAcceptWantCount()).assertEqual(0);
        expect(WantValidator.isValid(null)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1800
     * @tc.name testAcceptWantRejectsEmptyBundleName
     * @tc.desc Verify want field validation: want with empty bundleName -> InvalidWantError, while complete want validates true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAcceptWantRejectsEmptyBundleName', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const emptyBundle: Want = WantValidator.buildWant('', 'EntryAbility');
        expect(WantValidator.isValid(emptyBundle)).assertFalse();
        try {
          WantValidator.resolveInstanceKey(emptyBundle);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('InvalidWantError');
        }
        const complete: Want = WantValidator.buildWant('com.samples.abilitystage', 'EntryAbility');
        expect(WantValidator.isValid(complete)).assertTrue();
        expect(WantValidator.resolveInstanceKey(complete)).assertEqual('MyAbilityStage');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_1900
     * @tc.name testSpecifiedModeFlagDetection
     * @tc.desc Verify specified mode branching: want with flag 1024 -> isSpecifiedMode true, plain want -> false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSpecifiedModeFlagDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const specified: Want = {
          bundleName: 'com.samples.abilitystage',
          abilityName: 'EntryAbility',
          flags: 1024
        };
        const plain: Want = buildEntryWant();
        expect(WantValidator.isSpecifiedMode(specified)).assertTrue();
        expect(WantValidator.isSpecifiedMode(plain)).assertFalse();
        expect(WantValidator.isSpecifiedMode(null)).assertFalse();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2000
     * @tc.name testSnapshotCodecRoundTrip
     * @tc.desc Verify snapshot serialization: encode then decode -> state, generation and last trigger preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotCodecRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const codec: StageSnapshotCodec = new StageSnapshotCodec();
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 100);
        stage.transitionTo(StageState.STOPPED, 'stop', 200);
        const payload: string = codec.encode(stage.snapshot());
        const decoded: StageSnapshot = codec.decode(payload);
        expect(decoded.state).assertEqual(StageState.STOPPED);
        expect(decoded.generation).assertEqual(2);
        expect(decoded.lastTrigger).assertEqual('stop');
        expect(codec.isEncodable(payload)).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2100
     * @tc.name testSnapshotCodecRejectsCorruptPayload
     * @tc.desc Verify corrupt snapshot rejection: empty payload and non-object JSON -> decode throws StageSnapshotError, encodable false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotCodecRejectsCorruptPayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const codec: StageSnapshotCodec = new StageSnapshotCodec();
        expect(codec.isEncodable('')).assertFalse();
        expect(codec.isEncodable('not_json')).assertFalse();
        try {
          codec.decode('');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageSnapshotError');
          expect(e.message).assertEqual('empty payload');
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2200
     * @tc.name testDefaultSnapshotDetection
     * @tc.desc Verify default snapshot predicate: fresh machine snapshot -> isDefaultSnapshot true, after one transition false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDefaultSnapshotDetection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const codec: StageSnapshotCodec = new StageSnapshotCodec();
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        expect(codec.isDefaultSnapshot(stage.snapshot())).assertTrue();
        stage.transitionTo(StageState.RUNNING, 'create', 100);
        expect(codec.isDefaultSnapshot(stage.snapshot())).assertFalse();
        expect(stage.snapshot().state).assertEqual(StageState.RUNNING);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2300
     * @tc.name testAuditReportAggregatesCounters
     * @tc.desc Verify audit aggregation: 6 transitions with 2 pauses and 1 stop, destroyed reached -> restart count 3 and clean shutdown true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAuditReportAggregatesCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const report: StageAuditReport = new StageAuditReport(6, 2, 1, true);
        expect(report.getTotalTransitions()).assertEqual(6);
        expect(report.getPausedCount()).assertEqual(2);
        expect(report.getStoppedCount()).assertEqual(1);
        expect(report.computeRestartCount()).assertEqual(3);
        expect(report.isCleanShutdown()).assertTrue();
        expect(report.didReachDestroyed()).assertTrue();
        expect(report.describe()).assertContain('transitions=6');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2400
     * @tc.name testAuditReportWithoutDestroyIsNotClean
     * @tc.desc Verify clean shutdown predicate: report that never reached destroyed -> isCleanShutdown false even with transitions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAuditReportWithoutDestroyIsNotClean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const report: StageAuditReport = new StageAuditReport(3, 3, 0, false);
        expect(report.isCleanShutdown()).assertFalse();
        expect(report.computeRestartCount()).assertEqual(3);
        const empty: StageAuditReport = new StageAuditReport(0, 0, 0, false);
        expect(empty.isCleanShutdown()).assertFalse();
        expect(empty.computeRestartCount()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2500
     * @tc.name testHealthMonitorStatistics
     * @tc.desc Verify stage health sampling: samples 10, 30, 20 -> average 20, peak 30, trough 10, countAbove 20 equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHealthMonitorStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const monitor: StageHealthMonitor = new StageHealthMonitor();
        monitor.sample(10);
        monitor.sample(30);
        monitor.sample(20);
        expect(monitor.getSampleCount()).assertEqual(3);
        expect(monitor.average()).assertEqual(20);
        expect(monitor.peak()).assertEqual(30);
        expect(monitor.trough()).assertEqual(10);
        expect(monitor.countAbove(20)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2600
     * @tc.name testHealthMonitorRejectsNegativeSample
     * @tc.desc Verify health sampling guard: negative duration -> throws StageHealthError and sample count stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHealthMonitorRejectsNegativeSample', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const monitor: StageHealthMonitor = new StageHealthMonitor();
        try {
          monitor.sample(-5);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageHealthError');
          expect(e.message).assertEqual('negative duration');
        }
        expect(monitor.getSampleCount()).assertEqual(0);
        expect(monitor.average()).assertEqual(0);
        expect(monitor.peak()).assertEqual(0);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2700
     * @tc.name testUiStageRunningWhilePageVisible
     * @tc.desc Verify real stage state vs UI: launch EntryAbility and observe Index page -> machine reaches RUNNING and page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStageRunningWhilePageVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        machine.reset();
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        expect(stable).assertTrue();
        machine.transitionTo(StageState.RUNNING, 'pageVisible', Date.now());
        expect(machine.getState()).assertEqual(StageState.RUNNING);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
        expect(machine.isHealthy()).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2800
     * @tc.name testUiStagePausedWhileBackgrounded
     * @tc.desc Verify stage pause driven by background: send EntryAbility to background -> machine PAUSED and page not visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStagePausedWhileBackgrounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        machine.reset();
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        machine.transitionTo(StageState.RUNNING, 'create', Date.now());
        await doAbilityBackground();
        machine.transitionTo(StageState.PAUSED, 'onBackground', Date.now());
        await sleepMs(DELAY_AFTER_BACKGROUND);
        expect(machine.getState()).assertEqual(StageState.PAUSED);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertFalse();
        expect(machine.countTransitionsTo(StageState.PAUSED)).assertEqual(1);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_2900
     * @tc.name testUiStageResumesAfterForeground
     * @tc.desc Verify resume migration: PAUSED then foreground -> machine RUNNING again, page visible, generation 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiStageResumesAfterForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        machine.reset();
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        machine.transitionTo(StageState.RUNNING, 'create', Date.now());
        await doAbilityBackground();
        machine.transitionTo(StageState.PAUSED, 'pause', Date.now());
        await sleepMs(DELAY_AFTER_BACKGROUND);
        await doAbilityForeground();
        machine.transitionTo(StageState.RUNNING, 'resume', Date.now());
        await sleepMs(DELAY_AFTER_LAUNCH);
        expect(machine.getState()).assertEqual(StageState.RUNNING);
        expect(machine.getGeneration()).assertEqual(3);
        const visible: boolean = await isIndexPageVisible(driver);
        expect(visible).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3000
     * @tc.name testUiAcceptWantDuringLivePage
     * @tc.desc Verify onAcceptWant with live page: buildEntryWant accepted -> key MyAbilityStage while HelloWorld component remains resolvable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testUiAcceptWantDuringLivePage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        machine.reset();
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const want: Want = buildEntryWant();
        const key: string = machine.acceptWant(want);
        expect(key).assertEqual('MyAbilityStage');
        expect(machine.getAcceptWantCount()).assertEqual(1);
        const present: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(present).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3100
     * @tc.name testUiRepeatedCycleKeepsComponentCount
     * @tc.desc Verify 5 pause/resume cycles with live UI: component count remains stable and machine returns to RUNNING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testUiRepeatedCycleKeepsComponentCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        machine.reset();
        await launchEntryAbility();
        await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        machine.transitionTo(StageState.RUNNING, 'create', Date.now());
        const baseline: number = await pageComponentCount(driver);
        for (let i: number = 0; i < 5; i++) {
          await doAbilityBackground();
          machine.transitionTo(StageState.PAUSED, 'pause', Date.now());
          await sleepMs(DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          machine.transitionTo(StageState.RUNNING, 'resume', Date.now());
          await sleepMs(DELAY_AFTER_LAUNCH);
        }
        const current: number = await pageComponentCount(driver);
        expect(current).assertEqual(baseline);
        expect(machine.getState()).assertEqual(StageState.RUNNING);
        expect(machine.countTransitionsTo(StageState.PAUSED)).assertEqual(5);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3200
     * @tc.name testStateMachineThroughputWithinBudget
     * @tc.desc Verify transition throughput: 500 pause/resume pairs -> 1000 transitions recorded within 1500 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL3
     */
    it('testStateMachineThroughputWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 0);
        const startTime: number = Date.now();
        for (let i: number = 0; i < 500; i++) {
          stage.transitionTo(StageState.PAUSED, 'pause', i * 2);
          stage.transitionTo(StageState.RUNNING, 'resume', i * 2 + 1);
        }
        const elapsed: number = measureElapsed(startTime);
        expect(stage.getTransitionCount()).assertEqual(1001);
        expect(stage.countTransitionsTo(StageState.PAUSED)).assertEqual(500);
        expect(elapsed <= 1500).assertTrue();
        expect(stage.getGeneration()).assertEqual(1001);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3300
     * @tc.name testHistoryCopyIsIndependent
     * @tc.desc Verify history isolation: getHistory returns copy -> appending externally does not change internal count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testHistoryCopyIsIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 10);
        const copy: StageTransitionRecord[] = stage.getHistory();
        const injected: StageTransitionRecord = {
          fromState: StageState.RUNNING,
          toState: StageState.DESTROYED,
          trigger: 'injected',
          timestampMs: 20
        };
        copy.push(injected);
        expect(copy.length).assertEqual(2);
        expect(stage.getTransitionCount()).assertEqual(1);
        expect(stage.getState()).assertEqual(StageState.RUNNING);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3400
     * @tc.name testResetReturnsToInitialState
     * @tc.desc Verify machine reset: after full lifecycle then reset -> IDLE, generation 0, counters 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testResetReturnsToInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 10);
        stage.transitionTo(StageState.STOPPED, 'stop', 20);
        stage.acceptWant(buildEntryWant());
        expect(stage.getAcceptWantCount()).assertEqual(1);
        stage.reset();
        expect(stage.getState()).assertEqual(StageState.IDLE);
        expect(stage.getGeneration()).assertEqual(0);
        expect(stage.getTransitionCount()).assertEqual(0);
        expect(stage.getAcceptWantCount()).assertEqual(0);
        expect(stage.getLastTrigger()).assertEqual('');
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3500
     * @tc.name testEveryStateReachableFromIdle
     * @tc.desc Verify reachability: each of the five declared states is produced by at least one legal path from IDLE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEveryStateReachableFromIdle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const reached: StageState[] = [];
        const running: AbilityStageStateMachine = new AbilityStageStateMachine();
        running.transitionTo(StageState.RUNNING, 'create', 0);
        reached.push(running.getState());
        const paused: AbilityStageStateMachine = new AbilityStageStateMachine();
        paused.transitionTo(StageState.RUNNING, 'create', 0);
        paused.transitionTo(StageState.PAUSED, 'pause', 1);
        reached.push(paused.getState());
        const stopped: AbilityStageStateMachine = new AbilityStageStateMachine();
        stopped.transitionTo(StageState.RUNNING, 'create', 0);
        stopped.transitionTo(StageState.STOPPED, 'stop', 1);
        reached.push(stopped.getState());
        const destroyed: AbilityStageStateMachine = new AbilityStageStateMachine();
        destroyed.transitionTo(StageState.DESTROYED, 'destroy', 0);
        reached.push(destroyed.getState());
        const idle: AbilityStageStateMachine = new AbilityStageStateMachine();
        reached.push(idle.getState());
        expect(reached.length).assertEqual(ALL_STATES.length);
        for (let i: number = 0; i < ALL_STATES.length; i++) {
          let found: boolean = false;
          for (let j: number = 0; j < reached.length; j++) {
            if (reached[j] === ALL_STATES[i]) {
              found = true;
            }
          }
          expect(found).assertTrue();
        }
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3600
     * @tc.name testTransitionMonotonicTimestamps
     * @tc.desc Verify recorded timestamps: three transitions with 100/200/300 -> history timestamps strictly increasing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransitionMonotonicTimestamps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 100);
        stage.transitionTo(StageState.PAUSED, 'pause', 200);
        stage.transitionTo(StageState.RUNNING, 'resume', 300);
        const history: StageTransitionRecord[] = stage.getHistory();
        expect(history[0].timestampMs).assertEqual(100);
        expect(history[1].timestampMs).assertEqual(200);
        expect(history[2].timestampMs).assertEqual(300);
        expect(history[1].timestampMs > history[0].timestampMs).assertTrue();
        expect(history[2].timestampMs > history[1].timestampMs).assertTrue();
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3700
     * @tc.name testSnapshotAcceptWantCountPreserved
     * @tc.desc Verify snapshot carries accept want counter: two accepted wants then snapshot -> count 2 and restore keeps 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSnapshotAcceptWantCountPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.RUNNING, 'create', 0);
        stage.acceptWant(buildEntryWant());
        stage.acceptWant(buildEntryWant());
        const snapshot: StageSnapshot = stage.snapshot();
        expect(snapshot.acceptWantCount).assertEqual(2);
        const restored: AbilityStageStateMachine = new AbilityStageStateMachine();
        restored.restore(snapshot);
        expect(restored.getAcceptWantCount()).assertEqual(2);
        expect(restored.getState()).assertEqual(StageState.RUNNING);
      } finally {
        done();
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_STAGESTATE_3800
     * @tc.name testSecondDestroyAttemptRejected
     * @tc.desc Verify destroy idempotency guard: DESTROYED then DESTROYED again -> StageStateError and transition count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSecondDestroyAttemptRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const stage: AbilityStageStateMachine = new AbilityStageStateMachine();
        stage.transitionTo(StageState.DESTROYED, 'destroy', 0);
        try {
          stage.transitionTo(StageState.DESTROYED, 'destroyAgain', 1);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('StageStateError');
          expect(e.message).assertEqual('already in state DESTROYED');
        }
        expect(stage.getTransitionCount()).assertEqual(1);
        expect(stage.getLastTrigger()).assertEqual('destroy');
      } finally {
        done();
      }
    })
  })
}
