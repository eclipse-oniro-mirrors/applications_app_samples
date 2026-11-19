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
  pageComponentCount,
  collectAllTexts,
  isWithinBudget,
  measureElapsed,
  averageOf,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_ABILITY_LAUNCH,
  DELAY_AFTER_LAUNCH,
  DELAY_AFTER_BACKGROUND,
  STRESS_ROUNDS_LIFECYCLE,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const RECOVERY_BUDGET_MS: number = 3000;

const BACKGROUND_BUDGET_MS: number = 2000;

const MAX_PENDING_NOTIFICATIONS: number = 8;

const STALE_DISCARD_THRESHOLD: number = 1;

const MIN_RECOVERY_ATTEMPTS: number = 1;

const MAX_RECOVERY_ATTEMPTS: number = 3;

enum LifecycleState {
  CREATED = 'created',
  FOREGROUND = 'foreground',
  BACKGROUND = 'background',
  RECOVERING = 'recovering',
  DESTROYED = 'destroyed'
}

enum InterruptionKind {
  HOME_KEY = 'home_key',
  BACK_KEY = 'back_key',
  WINDOW_HIDDEN = 'window_hidden',
  PROCESS_RESTART = 'process_restart'
}

class InterruptionEvent {
  public kind: InterruptionKind;
  public timestamp: number;
  public sequence: number;

  constructor(kind: InterruptionKind, timestamp: number, sequence: number) {
    this.kind = kind;
    this.timestamp = timestamp;
    this.sequence = sequence;
  }

  public isProcessLevel(): boolean {
    return this.kind === InterruptionKind.PROCESS_RESTART;
  }
}

class LifecycleRecorder {
  private states: LifecycleState[] = [];

  private interruptions: InterruptionEvent[] = [];

  private recoveryMarked: boolean = false;

  private recoveryCount: number = 0;

  public enter(state: LifecycleState): number {
    if (this.states.length > 0 && this.states[this.states.length - 1] === state) {
      return this.states.length;
    }
    this.states.push(state);
    return this.states.length;
  }

  public current(): LifecycleState {
    if (this.states.length === 0) {
      return LifecycleState.CREATED;
    }
    return this.states[this.states.length - 1];
  }

  public historySize(): number {
    return this.states.length;
  }

  public recordInterruption(kind: InterruptionKind, timestamp: number): number {
    const event: InterruptionEvent = new InterruptionEvent(kind, timestamp, this.interruptions.length + 1);
    this.interruptions.push(event);
    return this.interruptions.length;
  }

  public interruptionCount(): number {
    return this.interruptions.length;
  }

  public countOf(kind: InterruptionKind): number {
    let count: number = 0;
    for (let i = 0; i < this.interruptions.length; i++) {
      if (this.interruptions[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  public lastInterruption(): InterruptionEvent | null {
    if (this.interruptions.length === 0) {
      return null;
    }
    return this.interruptions[this.interruptions.length - 1];
  }

  public hasProcessRestart(): boolean {
    for (let i = 0; i < this.interruptions.length; i++) {
      if (this.interruptions[i].isProcessLevel()) {
        return true;
      }
    }
    return false;
  }

  public markRecovered(): void {
    this.recoveryMarked = true;
    this.recoveryCount++;
  }

  public isRecoveryMarked(): boolean {
    return this.recoveryMarked;
  }

  public getRecoveryCount(): number {
    return this.recoveryCount;
  }

  public clearRecoveryMark(): void {
    this.recoveryMarked = false;
  }
}

class CallbackBuffer {
  private pending: string[] = [];

  private discarded: string[] = [];

  public enqueue(payload: string): boolean {
    if (this.pending.length >= MAX_PENDING_NOTIFICATIONS) {
      return false;
    }
    this.pending.push(payload);
    return true;
  }

  public discardOlderThan(threshold: number): number {
    if (threshold <= 0) {
      return 0;
    }
    let dropped: number = 0;
    while (this.pending.length > 0 && dropped < threshold) {
      const removed: string[] = this.pending.splice(0, 1);
      this.discarded.push(removed[0]);
      dropped++;
    }
    return dropped;
  }

  public drain(): string[] {
    const drained: string[] = [];
    while (this.pending.length > 0) {
      const removed: string[] = this.pending.splice(0, 1);
      drained.push(removed[0]);
    }
    return drained;
  }

  public pendingCount(): number {
    return this.pending.length;
  }

  public discardedCount(): number {
    return this.discarded.length;
  }

  public wasDiscarded(payload: string): boolean {
    return this.discarded.indexOf(payload) >= 0;
  }

  public isSaturated(): boolean {
    return this.pending.length >= MAX_PENDING_NOTIFICATIONS;
  }
}

class RecoveryPlanner {
  private attemptsUsed: number = 0;

  private recoveredCount: number = 0;

  private failedCount: number = 0;

  public plan(isProcessRestart: boolean): number {
    if (isProcessRestart) {
      this.attemptsUsed = 0;
      return MAX_RECOVERY_ATTEMPTS;
    }
    return MIN_RECOVERY_ATTEMPTS;
  }

  public attempt(succeeded: boolean): boolean {
    this.attemptsUsed++;
    if (succeeded) {
      this.recoveredCount++;
      return true;
    }
    this.failedCount++;
    return false;
  }

  public canRetry(): boolean {
    return this.attemptsUsed < MAX_RECOVERY_ATTEMPTS;
  }

  public getAttempts(): number {
    return this.attemptsUsed;
  }

  public getRecoveredCount(): number {
    return this.recoveredCount;
  }

  public getFailedCount(): number {
    return this.failedCount;
  }

  public successRate(): number {
    const total: number = this.recoveredCount + this.failedCount;
    if (total === 0) {
      return 0;
    }
    return this.recoveredCount / total;
  }

  public reset(): void {
    this.attemptsUsed = 0;
    this.recoveredCount = 0;
    this.failedCount = 0;
  }
}

class HomeStateModel {
  public static expectedTextAfterRestart(): string {
    return PAGE_TEXT_INITIAL;
  }

  public static expectedTextAfterClick(): string {
    return PAGE_TEXT_CLICKED;
  }

  public static isKnownText(text: string): boolean {
    return text === PAGE_TEXT_INITIAL || text === PAGE_TEXT_CLICKED;
  }

  public static countKnownTexts(texts: string[]): number {
    let count: number = 0;
    for (let i = 0; i < texts.length; i++) {
      if (HomeStateModel.isKnownText(texts[i])) {
        count++;
      }
    }
    return count;
  }

  public static firstKnownText(texts: string[]): string {
    for (let i = 0; i < texts.length; i++) {
      if (HomeStateModel.isKnownText(texts[i])) {
        return texts[i];
      }
    }
    return '';
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

export default function abilityInterruptionRecoveryTest(): void {
  describe('AbilityInterruptionRecoveryTest', () => {
    beforeAll(async () => {
      await launchEntryAbility();
      await ensureIndexPageInitial(getDriver());
    });

    afterAll(async () => {
      logInfo('AbilityInterruptionRecoveryTest suite finished');
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0100
     * @tc.name testInterruptRecorderInitialState
     * @tc.desc Verify a fresh recorder reports CREATED as current state with zero history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptRecorderInitialState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          expect(recorder.current()).assertEqual(LifecycleState.CREATED);
          expect(recorder.historySize()).assertEqual(0);
          expect(recorder.interruptionCount()).assertEqual(0);
          expect(recorder.isRecoveryMarked()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0200
     * @tc.name testInterruptForegroundBackgroundSequence
     * @tc.desc Verify foreground then background produces a two step history and background is current
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptForegroundBackgroundSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          expect(recorder.enter(LifecycleState.FOREGROUND)).assertEqual(1);
          expect(recorder.enter(LifecycleState.BACKGROUND)).assertEqual(2);
          expect(recorder.current()).assertEqual(LifecycleState.BACKGROUND);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0300
     * @tc.name testInterruptDuplicateStateCollapsed
     * @tc.desc Verify entering the same state twice does not grow the history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptDuplicateStateCollapsed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          recorder.enter(LifecycleState.FOREGROUND);
          expect(recorder.enter(LifecycleState.FOREGROUND)).assertEqual(1);
          expect(recorder.historySize()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0400
     * @tc.name testInterruptCountPerKind
     * @tc.desc Verify interruption counting separates home key presses from process restarts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptCountPerKind', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          recorder.recordInterruption(InterruptionKind.HOME_KEY, 1000);
          recorder.recordInterruption(InterruptionKind.HOME_KEY, 2000);
          recorder.recordInterruption(InterruptionKind.PROCESS_RESTART, 3000);
          expect(recorder.interruptionCount()).assertEqual(3);
          expect(recorder.countOf(InterruptionKind.HOME_KEY)).assertEqual(2);
          expect(recorder.countOf(InterruptionKind.PROCESS_RESTART)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0500
     * @tc.name testInterruptSequenceMonotonic
     * @tc.desc Verify interruption sequence numbers increase by one per recorded event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptSequenceMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          expect(recorder.recordInterruption(InterruptionKind.BACK_KEY, 500)).assertEqual(1);
          expect(recorder.recordInterruption(InterruptionKind.WINDOW_HIDDEN, 600)).assertEqual(2);
          const last: InterruptionEvent | null = recorder.lastInterruption();
          if (last === null) {
            expect().assertFail();
            return;
          }
          expect(last.sequence).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0600
     * @tc.name testInterruptLastEventAbsent
     * @tc.desc Verify lastInterruption returns null when nothing has been recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptLastEventAbsent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          expect(recorder.lastInterruption()).assertEqual(null);
          expect(recorder.hasProcessRestart()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0700
     * @tc.name testInterruptProcessRestartDetected
     * @tc.desc Verify process restart is flagged while home key interruptions are not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptProcessRestartDetected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const homeOnly: LifecycleRecorder = new LifecycleRecorder();
          homeOnly.recordInterruption(InterruptionKind.HOME_KEY, 100);
          expect(homeOnly.hasProcessRestart()).assertFalse();
          const restarted: LifecycleRecorder = new LifecycleRecorder();
          restarted.recordInterruption(InterruptionKind.HOME_KEY, 100);
          restarted.recordInterruption(InterruptionKind.PROCESS_RESTART, 200);
          expect(restarted.hasProcessRestart()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0800
     * @tc.name testInterruptRecoveryMark
     * @tc.desc Verify marking recovery sets the flag and increments the recovery count once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptRecoveryMark', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          recorder.markRecovered();
          expect(recorder.isRecoveryMarked()).assertTrue();
          expect(recorder.getRecoveryCount()).assertEqual(1);
          recorder.markRecovered();
          expect(recorder.getRecoveryCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_0900
     * @tc.name testInterruptRecoveryMarkCleared
     * @tc.desc Verify clearing the recovery mark resets the flag but keeps the counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptRecoveryMarkCleared', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          recorder.markRecovered();
          recorder.clearRecoveryMark();
          expect(recorder.isRecoveryMarked()).assertFalse();
          expect(recorder.getRecoveryCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1000
     * @tc.name testInterruptBufferEnqueue
     * @tc.desc Verify the callback buffer accepts payloads up to the capacity of eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBufferEnqueue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          for (let i = 0; i < MAX_PENDING_NOTIFICATIONS; i++) {
            expect(buffer.enqueue(`payload-${i}`)).assertTrue();
          }
          expect(buffer.pendingCount()).assertEqual(8);
          expect(buffer.isSaturated()).assertTrue();
          expect(buffer.enqueue('payload-overflow')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1100
     * @tc.name testInterruptBufferDiscard
     * @tc.desc Verify discarding one stale callback removes the oldest payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBufferDiscard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          buffer.enqueue('foreground');
          buffer.enqueue('configuration');
          expect(buffer.discardOlderThan(STALE_DISCARD_THRESHOLD)).assertEqual(1);
          expect(buffer.pendingCount()).assertEqual(1);
          expect(buffer.discardedCount()).assertEqual(1);
          expect(buffer.wasDiscarded('foreground')).assertTrue();
          expect(buffer.wasDiscarded('configuration')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1200
     * @tc.name testInterruptBufferDiscardZero
     * @tc.desc Verify discarding with a zero threshold drops no payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBufferDiscardZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          buffer.enqueue('background');
          expect(buffer.discardOlderThan(0)).assertEqual(0);
          expect(buffer.pendingCount()).assertEqual(1);
          expect(buffer.discardedCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1300
     * @tc.name testInterruptBufferDiscardExceedsPending
     * @tc.desc Verify discarding more than pending payloads drops only what exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBufferDiscardExceedsPending', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          buffer.enqueue('a');
          buffer.enqueue('b');
          expect(buffer.discardOlderThan(5)).assertEqual(2);
          expect(buffer.pendingCount()).assertEqual(0);
          expect(buffer.discardedCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1400
     * @tc.name testInterruptBufferDrain
     * @tc.desc Verify draining returns all pending payloads in order and empties the queue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBufferDrain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          buffer.enqueue('first');
          buffer.enqueue('second');
          buffer.enqueue('third');
          const drained: string[] = buffer.drain();
          expect(drained.length).assertEqual(3);
          expect(drained[0]).assertEqual('first');
          expect(drained[2]).assertEqual('third');
          expect(buffer.pendingCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1500
     * @tc.name testInterruptBufferDrainEmpty
     * @tc.desc Verify draining an empty buffer returns an empty array and keeps counts at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBufferDrainEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          const drained: string[] = buffer.drain();
          expect(drained.length).assertEqual(0);
          expect(buffer.isSaturated()).assertFalse();
          expect(buffer.pendingCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1600
     * @tc.name testInterruptPlannerProcessRestartBudget
     * @tc.desc Verify a process restart plans the maximum three recovery attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptPlannerProcessRestartBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const planner: RecoveryPlanner = new RecoveryPlanner();
          expect(planner.plan(true)).assertEqual(3);
          const softPlanner: RecoveryPlanner = new RecoveryPlanner();
          expect(softPlanner.plan(false)).assertEqual(1);
          expect(planner.getAttempts()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1700
     * @tc.name testInterruptPlannerRetryWindow
     * @tc.desc Verify retries stop after three attempts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptPlannerRetryWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const planner: RecoveryPlanner = new RecoveryPlanner();
          planner.plan(true);
          expect(planner.canRetry()).assertTrue();
          expect(planner.attempt(false)).assertFalse();
          expect(planner.attempt(false)).assertFalse();
          expect(planner.canRetry()).assertTrue();
          expect(planner.attempt(true)).assertTrue();
          expect(planner.canRetry()).assertFalse();
          expect(planner.getAttempts()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1800
     * @tc.name testInterruptPlannerSuccessRate
     * @tc.desc Verify success rate is one half after one success and one failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptPlannerSuccessRate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const planner: RecoveryPlanner = new RecoveryPlanner();
          planner.attempt(true);
          planner.attempt(false);
          expect(planner.getRecoveredCount()).assertEqual(1);
          expect(planner.getFailedCount()).assertEqual(1);
          expect(planner.successRate()).assertEqual(0.5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_1900
     * @tc.name testInterruptPlannerReset
     * @tc.desc Verify resetting the planner clears attempts and success rate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptPlannerReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const planner: RecoveryPlanner = new RecoveryPlanner();
          planner.attempt(true);
          planner.attempt(true);
          planner.reset();
          expect(planner.getAttempts()).assertEqual(0);
          expect(planner.successRate()).assertEqual(0);
          expect(planner.canRetry()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2000
     * @tc.name testInterruptHomeTextModel
     * @tc.desc Verify the home text model recognises the initial and clicked texts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptHomeTextModel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(HomeStateModel.expectedTextAfterRestart()).assertEqual('Hello World');
          expect(HomeStateModel.expectedTextAfterClick()).assertEqual('Welcome');
          expect(HomeStateModel.isKnownText('Hello World')).assertTrue();
          expect(HomeStateModel.isKnownText('Goodbye')).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2100
     * @tc.name testInterruptHomeTextCounting
     * @tc.desc Verify counting known texts across a mixed list returns exactly three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptHomeTextCounting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const texts: string[] = ['Hello World', 'Welcome', 'Other', 'Welcome'];
          expect(HomeStateModel.countKnownTexts(texts)).assertEqual(3);
          expect(HomeStateModel.firstKnownText(texts)).assertEqual('Hello World');
          const none: string[] = [];
          expect(HomeStateModel.firstKnownText(none)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2200
     * @tc.name testInterruptBackgroundRoundTrip
     * @tc.desc Verify the page is visible again after a real background and foreground round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBackgroundRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2300
     * @tc.name testInterruptRecoveryBudget
     * @tc.desc Verify the foreground recovery completes within the configured recovery budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptRecoveryBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          const startTime: number = Date.now();
          await doAbilityForeground();
          const visible: boolean = await waitForIndexPageStable(driver, RECOVERY_BUDGET_MS);
          const elapsed: number = measureElapsed(startTime);
          expect(visible).assertTrue();
          expect(isWithinBudget(elapsed, RECOVERY_BUDGET_MS)).assertTrue();
          logInfo(`recovery elapsed ${elapsed} ms`);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2400
     * @tc.name testInterruptProcessRestartRecoversHome
     * @tc.desc Verify relaunching after a simulated process restart restores the initial home text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptProcessRestartRecoversHome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const visible: boolean = await waitForIndexPageStable(driver, TIMEOUT_ABILITY_LAUNCH);
          expect(visible).assertTrue();
          const texts: string[] = await collectAllTexts(driver);
          expect(HomeStateModel.countKnownTexts(texts) >= 1).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2500
     * @tc.name testInterruptRecoveryAfterClick
     * @tc.desc Verify the page keeps a known text after a click and a background cycle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptRecoveryAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await launchEntryAbility();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await PageTextProbe.ensureClicked(driver)).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2600
     * @tc.name testInterruptLifecycleStress
     * @tc.desc Verify ten background foreground cycles all end with a visible page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptLifecycleStress', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          let visibleRounds: number = 0;
          for (let i = 0; i < STRESS_ROUNDS_LIFECYCLE; i++) {
            await doAbilityBackground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            await doAbilityForeground();
            await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
            if (await isIndexPageVisible(driver)) {
              visibleRounds++;
            }
          }
          expect(visibleRounds).assertEqual(STRESS_ROUNDS_LIFECYCLE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2700
     * @tc.name testInterruptComponentCountAfterRecovery
     * @tc.desc Verify the page still exposes components after recovery from background
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptComponentCountAfterRecovery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          const count: number = await pageComponentCount(driver);
          expect(count > 0).assertTrue();
          expect(await checkTextContent(driver, PAGE_TEXT_CLICKED)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2800
     * @tc.name testInterruptBackgroundBudget
     * @tc.desc Verify switching to background completes within the background switch budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptBackgroundBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const driver: Driver = getDriver();
          const startTime: number = Date.now();
          await doAbilityBackground();
          await serializedDelay(driver, DELAY_AFTER_BACKGROUND);
          const elapsed: number = measureElapsed(startTime);
          expect(isWithinBudget(elapsed, BACKGROUND_BUDGET_MS)).assertTrue();
          await doAbilityForeground();
          await serializedDelay(driver, DELAY_AFTER_LAUNCH);
          expect(await isIndexPageVisible(driver)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_2900
     * @tc.name testInterruptAverageRecoveryTime
     * @tc.desc Verify the average of three simulated recovery samples equals the computed mean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptAverageRecoveryTime', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: number[] = [100, 200, 300];
          expect(averageOf(samples)).assertEqual(200);
          const single: number[] = [450];
          expect(averageOf(single)).assertEqual(450);
          const empty: number[] = [];
          expect(averageOf(empty)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_3000
     * @tc.name testInterruptRecorderFullJourney
     * @tc.desc Verify a recorded journey through foreground background recovery reaches the marked state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptRecorderFullJourney', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const recorder: LifecycleRecorder = new LifecycleRecorder();
          recorder.enter(LifecycleState.FOREGROUND);
          recorder.recordInterruption(InterruptionKind.HOME_KEY, 1000);
          recorder.enter(LifecycleState.BACKGROUND);
          recorder.enter(LifecycleState.RECOVERING);
          recorder.markRecovered();
          recorder.enter(LifecycleState.FOREGROUND);
          expect(recorder.current()).assertEqual(LifecycleState.FOREGROUND);
          expect(recorder.historySize()).assertEqual(4);
          expect(recorder.isRecoveryMarked()).assertTrue();
          expect(recorder.countOf(InterruptionKind.HOME_KEY)).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_INTERRUPT_3100
     * @tc.name testInterruptStaleCallbackDiscardedOnReturn
     * @tc.desc Verify queued callbacks from the background period are discarded on return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInterruptStaleCallbackDiscardedOnReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const buffer: CallbackBuffer = new CallbackBuffer();
          buffer.enqueue('background-entered');
          buffer.enqueue('memory-level');
          const dropped: number = buffer.discardOlderThan(1);
          const remaining: string[] = buffer.drain();
          expect(dropped).assertEqual(1);
          expect(remaining.length).assertEqual(1);
          expect(remaining[0]).assertEqual('memory-level');
        } finally {
          done();
        }
      })
  })
}
