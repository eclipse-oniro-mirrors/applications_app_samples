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
  ensureIndexPageInitial,
  logInfo,
  logError,
  sleepMs,
  launchEntryAbility,
  doAbilityForeground,
  doAbilityBackground,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  pageComponentCount,
  DELAY_AFTER_BACKGROUND,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED
} from '../Shared/SharedDriver';

enum AbilityState {
  INITIAL = 'INITIAL',
  FOREGROUND = 'FOREGROUND',
  BACKGROUND = 'BACKGROUND',
  DESTROYED = 'DESTROYED'
}

class IllegalTransitionError extends Error {
  private readonly fromState: string;
  private readonly toState: string;

  constructor(fromState: string, toState: string) {
    super(`illegal transition from ${fromState} to ${toState}`);
    this.name = 'IllegalTransitionError';
    this.fromState = fromState;
    this.toState = toState;
  }

  public getFromState(): string {
    return this.fromState;
  }

  public getToState(): string {
    return this.toState;
  }
}

interface StateSnapshot {
  state: AbilityState;
  step: number;
  foregroundCount: number;
  backgroundCount: number;
  historyLength: number;
  capturedAt: number;
}

class AbilityStateMachine {
  private state: AbilityState = AbilityState.INITIAL;
  private history: AbilityState[] = [];
  private step: number = 0;
  private foregroundCount: number = 0;
  private backgroundCount: number = 0;

  constructor() {
    this.history.push(AbilityState.INITIAL);
  }

  public getState(): AbilityState {
    return this.state;
  }

  public getStep(): number {
    return this.step;
  }

  public getHistoryLength(): number {
    return this.history.length;
  }

  public getHistory(): AbilityState[] {
    return this.history.slice(0);
  }

  public getForegroundCount(): number {
    return this.foregroundCount;
  }

  public getBackgroundCount(): number {
    return this.backgroundCount;
  }

  public isAlive(): boolean {
    return this.state !== AbilityState.DESTROYED;
  }

  public isLegal(target: AbilityState): boolean {
    if (target === this.state) {
      return true;
    }
    if (this.state === AbilityState.INITIAL) {
      return target === AbilityState.FOREGROUND || target === AbilityState.DESTROYED;
    }
    if (this.state === AbilityState.FOREGROUND) {
      return target === AbilityState.BACKGROUND || target === AbilityState.DESTROYED;
    }
    if (this.state === AbilityState.BACKGROUND) {
      return target === AbilityState.FOREGROUND || target === AbilityState.DESTROYED;
    }
    return false;
  }

  public transition(target: AbilityState): boolean {
    if (!this.isLegal(target)) {
      throw new IllegalTransitionError(this.state, target);
    }
    if (target === this.state) {
      return false;
    }
    this.state = target;
    this.step++;
    this.history.push(target);
    if (target === AbilityState.FOREGROUND) {
      this.foregroundCount++;
    }
    if (target === AbilityState.BACKGROUND) {
      this.backgroundCount++;
    }
    return true;
  }

  public tryTransition(target: AbilityState): boolean {
    if (!this.isLegal(target)) {
      return false;
    }
    if (target === this.state) {
      return false;
    }
    this.state = target;
    this.step++;
    this.history.push(target);
    if (target === AbilityState.FOREGROUND) {
      this.foregroundCount++;
    }
    if (target === AbilityState.BACKGROUND) {
      this.backgroundCount++;
    }
    return true;
  }

  public snapshot(): StateSnapshot {
    return {
      state: this.state,
      step: this.step,
      foregroundCount: this.foregroundCount,
      backgroundCount: this.backgroundCount,
      historyLength: this.history.length,
      capturedAt: Date.now()
    };
  }

  public restore(snapshot: StateSnapshot): void {
    this.state = snapshot.state;
    this.step = snapshot.step;
    this.foregroundCount = snapshot.foregroundCount;
    this.backgroundCount = snapshot.backgroundCount;
    this.history = [snapshot.state];
  }

  public replay(states: AbilityState[]): number {
    let applied: number = 0;
    for (let i = 0; i < states.length; i++) {
      if (this.tryTransition(states[i])) {
        applied++;
      }
    }
    return applied;
  }
}

class TransitionMatrix {
  private readonly allowed: number[][] = [
    [1, 1, 0, 1],
    [0, 1, 1, 1],
    [0, 1, 1, 1],
    [0, 0, 0, 0]
  ];

  public static indexOf(state: AbilityState): number {
    if (state === AbilityState.INITIAL) {
      return 0;
    }
    if (state === AbilityState.FOREGROUND) {
      return 1;
    }
    if (state === AbilityState.BACKGROUND) {
      return 2;
    }
    return 3;
  }

  public isAllowed(fromState: AbilityState, toState: AbilityState): boolean {
    const fromIndex: number = TransitionMatrix.indexOf(fromState);
    const toIndex: number = TransitionMatrix.indexOf(toState);
    return this.allowed[fromIndex][toIndex] === 1;
  }

  public allowedCount(fromState: AbilityState): number {
    const fromIndex: number = TransitionMatrix.indexOf(fromState);
    let count: number = 0;
    for (let i = 0; i < this.allowed[fromIndex].length; i++) {
      if (this.allowed[fromIndex][i] === 1) {
        count++;
      }
    }
    return count;
  }

  public deadEndStates(): number {
    let count: number = 0;
    for (let i = 0; i < this.allowed.length; i++) {
      let total: number = 0;
      for (let j = 0; j < this.allowed[i].length; j++) {
        total += this.allowed[i][j];
      }
      if (total === 0) {
        count++;
      }
    }
    return count;
  }
}

class StateAuditLog {
  private labels: string[] = [];
  private counts: number[] = [0, 0, 0, 0];

  public record(fromState: AbilityState, toState: AbilityState): void {
    this.labels.push(`${fromState}->${toState}`);
    this.counts[TransitionMatrix.indexOf(toState)]++;
  }

  public getRecordCount(): number {
    return this.labels.length;
  }

  public getEntry(index: number): string {
    if (index < 0 || index >= this.labels.length) {
      return '';
    }
    return this.labels[index];
  }

  public getCount(state: AbilityState): number {
    return this.counts[TransitionMatrix.indexOf(state)];
  }

  public getMostVisitedIndex(): number {
    let bestIndex: number = 0;
    let bestCount: number = this.counts[0];
    for (let i = 1; i < this.counts.length; i++) {
      if (this.counts[i] > bestCount) {
        bestCount = this.counts[i];
        bestIndex = i;
      }
    }
    return bestIndex;
  }
}

class StateConsistencyChecker {
  private observed: number = 0;
  private matches: number = 0;

  public sample(expected: AbilityState, actual: AbilityState): boolean {
    this.observed++;
    if (expected === actual) {
      this.matches++;
      return true;
    }
    return false;
  }

  public getObserved(): number {
    return this.observed;
  }

  public getMatches(): number {
    return this.matches;
  }

  public isFullyConsistent(): boolean {
    return this.observed > 0 && this.matches === this.observed;
  }

  public getConsistencyRate(): number {
    if (this.observed === 0) {
      return 0;
    }
    return this.matches / this.observed;
  }

  public reset(): void {
    this.observed = 0;
    this.matches = 0;
  }
}

async function observeRealState(driver: Driver): Promise<AbilityState> {
  const visible: boolean = await isIndexPageVisible(driver);
  if (visible) {
    return AbilityState.FOREGROUND;
  }
  return AbilityState.BACKGROUND;
}

async function ensureForeground(driver: Driver): Promise<boolean> {
  await doAbilityForeground();
  await sleepMs(DELAY_AFTER_BACKGROUND);
  return await waitForIndexPageStable(driver);
}

export default function abilityStateManagementTest(): void {
  describe('AbilityStateManagementTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      logInfo('AbilityStateManagementTest beforeAll: preparing EntryAbility');
      try {
        await launchEntryAbility();
        await waitForIndexPageStable(driver);
        await ensureIndexPageInitial(driver);
      } catch (error) {
        logError(`AbilityStateManagementTest beforeAll error: ${error}`);
      }
    })

    afterAll(async () => {
      try {
        await doAbilityForeground();
        await sleepMs(DELAY_AFTER_BACKGROUND);
      } catch (error) {
        logError(`AbilityStateManagementTest afterAll error: ${error}`);
      }
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0100
     * @tc.name testStateInitialValueAndHistorySeed
     * @tc.desc Verify a fresh state machine starts at INITIAL with step zero and single history entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateInitialValueAndHistorySeed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          expect(machine.getState()).assertEqual(AbilityState.INITIAL);
          expect(machine.getStep()).assertEqual(0);
          expect(machine.getHistoryLength()).assertEqual(1);
          expect(machine.isAlive()).assertTrue();
          expect(machine.getForegroundCount()).assertEqual(0);
          expect(machine.getBackgroundCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0200
     * @tc.name testStateLegalColdStartPath
     * @tc.desc Verify INITIAL to FOREGROUND to BACKGROUND to FOREGROUND is accepted step by step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateLegalColdStartPath', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          expect(machine.transition(AbilityState.FOREGROUND)).assertTrue();
          expect(machine.transition(AbilityState.BACKGROUND)).assertTrue();
          expect(machine.transition(AbilityState.FOREGROUND)).assertTrue();
          expect(machine.getState()).assertEqual(AbilityState.FOREGROUND);
          expect(machine.getStep()).assertEqual(3);
          expect(machine.getHistoryLength()).assertEqual(4);
          expect(machine.getHistory()[0]).assertEqual(AbilityState.INITIAL);
          expect(machine.getHistory()[3]).assertEqual(AbilityState.FOREGROUND);
          expect(machine.getForegroundCount()).assertEqual(2);
          expect(machine.getBackgroundCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0300
     * @tc.name testStateInitialToBackgroundRejected
     * @tc.desc Verify INITIAL to BACKGROUND throws IllegalTransitionError with exact name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateInitialToBackgroundRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          try {
            machine.transition(AbilityState.BACKGROUND);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('IllegalTransitionError');
          }
          expect(machine.getState()).assertEqual(AbilityState.INITIAL);
          expect(machine.getStep()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0400
     * @tc.name testStateTerminalDestroyedRejectsForeground
     * @tc.desc Verify DESTROYED to FOREGROUND throws IllegalTransitionError and state stays DESTROYED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateTerminalDestroyedRejectsForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          machine.transition(AbilityState.DESTROYED);
          expect(machine.isAlive()).assertFalse();
          try {
            machine.transition(AbilityState.FOREGROUND);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('IllegalTransitionError');
          }
          expect(machine.getState()).assertEqual(AbilityState.DESTROYED);
          expect(machine.getStep()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0500
     * @tc.name testStateIllegalErrorCarriesEndpoints
     * @tc.desc Verify IllegalTransitionError exposes the rejected from and to states
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateIllegalErrorCarriesEndpoints', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          try {
            machine.transition(AbilityState.INITIAL);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('IllegalTransitionError');
            const transitionError: IllegalTransitionError = e as IllegalTransitionError;
            expect(transitionError.getFromState()).assertEqual('FOREGROUND');
            expect(transitionError.getToState()).assertEqual('INITIAL');
          }
          expect(machine.getState()).assertEqual(AbilityState.FOREGROUND);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0600
     * @tc.name testStateSelfTransitionIsIdempotent
     * @tc.desc Verify self transition returns false and leaves step and counters unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateSelfTransitionIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          expect(machine.transition(AbilityState.FOREGROUND)).assertFalse();
          expect(machine.transition(AbilityState.FOREGROUND)).assertFalse();
          expect(machine.getStep()).assertEqual(1);
          expect(machine.getForegroundCount()).assertEqual(1);
          expect(machine.getHistoryLength()).assertEqual(2);
          expect(machine.getState()).assertEqual(AbilityState.FOREGROUND);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0700
     * @tc.name testStateTryTransitionNeverThrows
     * @tc.desc Verify tryTransition returns false for an illegal move without throwing or mutating state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateTryTransitionNeverThrows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          expect(machine.tryTransition(AbilityState.BACKGROUND)).assertFalse();
          expect(machine.getState()).assertEqual(AbilityState.INITIAL);
          expect(machine.tryTransition(AbilityState.FOREGROUND)).assertTrue();
          expect(machine.tryTransition(AbilityState.INITIAL)).assertFalse();
          expect(machine.tryTransition(AbilityState.DESTROYED)).assertTrue();
          expect(machine.tryTransition(AbilityState.DESTROYED)).assertFalse();
          expect(machine.getStep()).assertEqual(2);
          expect(machine.getHistoryLength()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0800
     * @tc.name testStateTransitionMatrixLegality
     * @tc.desc Verify matrix allows nine legal pairs including self loops and exposes DESTROYED as only dead end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateTransitionMatrixLegality', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const matrix: TransitionMatrix = new TransitionMatrix();
          expect(matrix.isAllowed(AbilityState.INITIAL, AbilityState.FOREGROUND)).assertTrue();
          expect(matrix.isAllowed(AbilityState.INITIAL, AbilityState.BACKGROUND)).assertFalse();
          expect(matrix.isAllowed(AbilityState.FOREGROUND, AbilityState.BACKGROUND)).assertTrue();
          expect(matrix.isAllowed(AbilityState.BACKGROUND, AbilityState.FOREGROUND)).assertTrue();
          expect(matrix.isAllowed(AbilityState.DESTROYED, AbilityState.INITIAL)).assertFalse();
          expect(matrix.isAllowed(AbilityState.BACKGROUND, AbilityState.INITIAL)).assertFalse();
          expect(matrix.allowedCount(AbilityState.INITIAL)).assertEqual(3);
          expect(matrix.allowedCount(AbilityState.FOREGROUND)).assertEqual(3);
          expect(matrix.allowedCount(AbilityState.BACKGROUND)).assertEqual(3);
          expect(matrix.allowedCount(AbilityState.DESTROYED)).assertEqual(0);
          expect(matrix.deadEndStates()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_0900
     * @tc.name testStateSnapshotAndRestore
     * @tc.desc Verify snapshot captures counters and restore rebuilds machine at the captured step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateSnapshotAndRestore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          machine.transition(AbilityState.BACKGROUND);
          const snapshot: StateSnapshot = machine.snapshot();
          expect(snapshot.state).assertEqual(AbilityState.BACKGROUND);
          expect(snapshot.step).assertEqual(2);
          expect(snapshot.foregroundCount).assertEqual(1);
          expect(snapshot.backgroundCount).assertEqual(1);
          expect(snapshot.historyLength).assertEqual(3);
          machine.transition(AbilityState.FOREGROUND);
          expect(machine.getState()).assertEqual(AbilityState.FOREGROUND);
          machine.restore(snapshot);
          expect(machine.getState()).assertEqual(AbilityState.BACKGROUND);
          expect(machine.getStep()).assertEqual(2);
          expect(machine.getHistoryLength()).assertEqual(1);
          expect(machine.getForegroundCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1000
     * @tc.name testStateReplayFromSnapshotConverges
     * @tc.desc Verify replay of a recorded path from a snapshot reaches the same terminal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateReplayFromSnapshotConverges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          machine.transition(AbilityState.BACKGROUND);
          const snapshot: StateSnapshot = machine.snapshot();
          machine.transition(AbilityState.FOREGROUND);
          machine.transition(AbilityState.BACKGROUND);
          machine.transition(AbilityState.FOREGROUND);
          const expectedState: AbilityState = machine.getState();
          const expectedStep: number = machine.getStep();
          const replayed: AbilityStateMachine = new AbilityStateMachine();
          replayed.restore(snapshot);
          const applied: number = replayed.replay([
            AbilityState.FOREGROUND,
            AbilityState.BACKGROUND,
            AbilityState.FOREGROUND
          ]);
          expect(applied).assertEqual(3);
          expect(replayed.getState()).assertEqual(expectedState);
          expect(replayed.getStep()).assertEqual(expectedStep);
          expect(replayed.getStep()).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1100
     * @tc.name testStateAuditLogCountsPerState
     * @tc.desc Verify audit log records transitions and counts arrivals per target state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateAuditLogCountsPerState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const log: StateAuditLog = new StateAuditLog();
          log.record(AbilityState.INITIAL, AbilityState.FOREGROUND);
          log.record(AbilityState.FOREGROUND, AbilityState.BACKGROUND);
          log.record(AbilityState.BACKGROUND, AbilityState.FOREGROUND);
          log.record(AbilityState.FOREGROUND, AbilityState.DESTROYED);
          expect(log.getRecordCount()).assertEqual(4);
          expect(log.getEntry(0)).assertEqual('INITIAL->FOREGROUND');
          expect(log.getEntry(3)).assertEqual('FOREGROUND->DESTROYED');
          expect(log.getEntry(4)).assertEqual('');
          expect(log.getCount(AbilityState.FOREGROUND)).assertEqual(2);
          expect(log.getCount(AbilityState.BACKGROUND)).assertEqual(1);
          expect(log.getCount(AbilityState.DESTROYED)).assertEqual(1);
          expect(log.getMostVisitedIndex()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1200
     * @tc.name testStateConsistencyCheckerRate
     * @tc.desc Verify consistency checker computes exact match rate over mixed samples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateConsistencyCheckerRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const checker: StateConsistencyChecker = new StateConsistencyChecker();
          expect(checker.sample(AbilityState.FOREGROUND, AbilityState.FOREGROUND)).assertTrue();
          expect(checker.sample(AbilityState.FOREGROUND, AbilityState.FOREGROUND)).assertTrue();
          expect(checker.sample(AbilityState.FOREGROUND, AbilityState.BACKGROUND)).assertFalse();
          expect(checker.sample(AbilityState.BACKGROUND, AbilityState.BACKGROUND)).assertTrue();
          expect(checker.getObserved()).assertEqual(4);
          expect(checker.getMatches()).assertEqual(3);
          expect(checker.getConsistencyRate()).assertEqual(0.75);
          expect(checker.isFullyConsistent()).assertFalse();
          checker.reset();
          expect(checker.getObserved()).assertEqual(0);
          expect(checker.getConsistencyRate()).assertEqual(0);
          expect(checker.isFullyConsistent()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1300
     * @tc.name testStateRealLaunchEntersForeground
     * @tc.desc Verify real launched EntryAbility is observed in FOREGROUND state with readable page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateRealLaunchEntersForeground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const prepared: boolean = await ensureForeground(driver);
          expect(prepared).assertTrue();
          const realState: AbilityState = await observeRealState(driver);
          expect(realState).assertEqual(AbilityState.FOREGROUND);
          const readable: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL) ||
            await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(readable).assertTrue();
          const components: number = await pageComponentCount(driver);
          expect(components > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1400
     * @tc.name testStateRealBackgroundMatchesModel
     * @tc.desc Verify real background leaves no visible page and model records BACKGROUND after transition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateRealBackgroundMatchesModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await ensureForeground(driver);
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          await doAbilityBackground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          machine.transition(AbilityState.BACKGROUND);
          expect(machine.getState()).assertEqual(AbilityState.BACKGROUND);
          expect(machine.getBackgroundCount()).assertEqual(1);
          const realState: AbilityState = await observeRealState(driver);
          expect(realState).assertEqual(AbilityState.BACKGROUND);
          await doAbilityForeground();
          await sleepMs(DELAY_AFTER_BACKGROUND);
          expect(await waitForIndexPageStable(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1500
     * @tc.name testStateRealModelConvergenceOverRounds
     * @tc.desc Verify model and real observation agree for three consecutive foreground background rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateRealModelConvergenceOverRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          const checker: StateConsistencyChecker = new StateConsistencyChecker();
          machine.transition(AbilityState.FOREGROUND);
          await ensureForeground(driver);
          checker.sample(machine.getState(), await observeRealState(driver));
          for (let i = 0; i < 3; i++) {
            machine.transition(AbilityState.BACKGROUND);
            await doAbilityBackground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            checker.sample(machine.getState(), await observeRealState(driver));
            machine.transition(AbilityState.FOREGROUND);
            await doAbilityForeground();
            await sleepMs(DELAY_AFTER_BACKGROUND);
            expect(await waitForIndexPageStable(driver)).assertTrue();
            checker.sample(machine.getState(), await observeRealState(driver));
          }
          expect(checker.getObserved()).assertEqual(7);
          expect(checker.getMatches()).assertEqual(7);
          expect(checker.isFullyConsistent()).assertTrue();
          expect(machine.getForegroundCount()).assertEqual(4);
          expect(machine.getBackgroundCount()).assertEqual(3);
          expect(machine.getState()).assertEqual(AbilityState.FOREGROUND);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_ABILITYSTATE_1600
     * @tc.name testStateDestroyPathFromBackground
     * @tc.desc Verify BACKGROUND to DESTROYED is legal while DESTROYED to BACKGROUND is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStateDestroyPathFromBackground', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: AbilityStateMachine = new AbilityStateMachine();
          machine.transition(AbilityState.FOREGROUND);
          machine.transition(AbilityState.BACKGROUND);
          expect(machine.transition(AbilityState.DESTROYED)).assertTrue();
          expect(machine.isAlive()).assertFalse();
          expect(machine.getBackgroundCount()).assertEqual(1);
          try {
            machine.transition(AbilityState.BACKGROUND);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('IllegalTransitionError');
          }
          expect(machine.getStep()).assertEqual(3);
          expect(machine.getHistoryLength()).assertEqual(4);
        } finally {
          done();
        }
      })
  })
}
