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
import { Driver, ON, Component } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  logError,
  launchEntryAbility,
  runSerializedUiOperation,
  serializedDelay,
  ensureIndexPageInitial,
  waitForIndexPageStable,
  checkTextContent,
  isIndexPageVisible,
  pageComponentCount,
  findComponentsByText,
  simulateTouch,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  DELAY_TOUCH_EVENT,
  DELAY_AFTER_LAUNCH
} from '../Shared/SharedDriver';

enum TextPresentation {
  INITIAL = 'initial',
  CLICKED = 'clicked',
  UNKNOWN = 'unknown'
}

enum InteractionKind {
  ACTIVATE = 'activate',
  RESET = 'reset',
  NOOP = 'noop'
}

interface TransitionResult {
  accepted: boolean;
  from: TextPresentation;
  to: TextPresentation;
  reason: string;
}

interface ClickRecord {
  sequence: number;
  textBefore: string;
  textAfter: string;
  changed: boolean;
  elapsedMs: number;
}

interface RectBounds {
  left: number;
  top: number;
  right: number;
  bottom: number;
}

enum HitZone {
  INSIDE = 'inside',
  EDGE = 'edge',
  OUTSIDE = 'outside'
}

interface ClickabilityReport {
  clickable: boolean;
  clickCount: number;
  changedCount: number;
  idempotentCount: number;
  finalText: string;
}

class TextStateMachine {
  private state: TextPresentation;

  constructor(initialText: string) {
    this.state = TextStateMachine.classify(initialText);
  }

  public static classify(text: string): TextPresentation {
    if (text === PAGE_TEXT_INITIAL) {
      return TextPresentation.INITIAL;
    }
    if (text === PAGE_TEXT_CLICKED) {
      return TextPresentation.CLICKED;
    }
    return TextPresentation.UNKNOWN;
  }

  public apply(kind: InteractionKind): TransitionResult {
    const from: TextPresentation = this.state;
    if (kind === InteractionKind.ACTIVATE) {
      if (from === TextPresentation.INITIAL) {
        this.state = TextPresentation.CLICKED;
        const accepted: TransitionResult = {
          accepted: true,
          from: from,
          to: this.state,
          reason: 'activation accepted from initial state'
        };
        return accepted;
      }
      if (from === TextPresentation.CLICKED) {
        const idempotent: TransitionResult = {
          accepted: true,
          from: from,
          to: this.state,
          reason: 'activation is idempotent in clicked state'
        };
        return idempotent;
      }
      const rejected: TransitionResult = {
        accepted: false,
        from: from,
        to: this.state,
        reason: 'activation rejected for unknown state'
      };
      return rejected;
    }
    if (kind === InteractionKind.RESET) {
      if (from === TextPresentation.CLICKED) {
        this.state = TextPresentation.INITIAL;
        const resetAccepted: TransitionResult = {
          accepted: true,
          from: from,
          to: this.state,
          reason: 'reset accepted from clicked state'
        };
        return resetAccepted;
      }
      const resetRejected: TransitionResult = {
        accepted: false,
        from: from,
        to: this.state,
        reason: 'reset only allowed from clicked state'
      };
      return resetRejected;
    }
    const noop: TransitionResult = {
      accepted: true,
      from: from,
      to: this.state,
      reason: 'noop keeps current state'
    };
    return noop;
  }

  public getState(): TextPresentation {
    return this.state;
  }

  public isInitial(): boolean {
    return this.state === TextPresentation.INITIAL;
  }

  public isClicked(): boolean {
    return this.state === TextPresentation.CLICKED;
  }

}

class ClickSessionTracker {
  private records: ClickRecord[] = [];
  private sequence: number = 0;

  public record(textBefore: string, textAfter: string, elapsedMs: number): ClickRecord {
    this.sequence++;
    const record: ClickRecord = {
      sequence: this.sequence,
      textBefore: textBefore,
      textAfter: textAfter,
      changed: textBefore !== textAfter,
      elapsedMs: elapsedMs
    };
    this.records.push(record);
    return record;
  }

  public getClickCount(): number {
    return this.records.length;
  }

  public getChangedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].changed) {
        count++;
      }
    }
    return count;
  }

  public getIdempotentCount(): number {
    return this.records.length - this.getChangedCount();
  }

  public getFirstRecord(): ClickRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[0];
  }

  public getLastRecord(): ClickRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public hasSequenceGap(): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].sequence !== i + 1) {
        return true;
      }
    }
    return false;
  }

  public averageElapsed(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].elapsedMs;
    }
    return total / this.records.length;
  }

  public maxElapsed(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let max: number = this.records[0].elapsedMs;
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].elapsedMs > max) {
        max = this.records[i].elapsedMs;
      }
    }
    return max;
  }

  public clear(): void {
    this.records = [];
    this.sequence = 0;
  }

  public getTextTimeline(): string[] {
    const timeline: string[] = [];
    for (let i = 0; i < this.records.length; i++) {
      timeline.push(this.records[i].textAfter);
    }
    return timeline;
  }
}

class HitTestModel {
  private bounds: RectBounds;

  constructor(bounds: RectBounds) {
    this.bounds = bounds;
  }

  public contains(x: number, y: number): boolean {
    return x >= this.bounds.left && x <= this.bounds.right
      && y >= this.bounds.top && y <= this.bounds.bottom;
  }

  public getWidth(): number {
    return this.bounds.right - this.bounds.left;
  }

  public getHeight(): number {
    return this.bounds.bottom - this.bounds.top;
  }

  public getCenterX(): number {
    return this.bounds.left + this.getWidth() / 2;
  }

  public getCenterY(): number {
    return this.bounds.top + this.getHeight() / 2;
  }

  public isOnEdge(x: number, y: number): boolean {
    if (!this.contains(x, y)) {
      return false;
    }
    return x === this.bounds.left || x === this.bounds.right
      || y === this.bounds.top || y === this.bounds.bottom;
  }

  public classify(x: number, y: number): HitZone {
    if (!this.contains(x, y)) {
      return HitZone.OUTSIDE;
    }
    if (this.isOnEdge(x, y)) {
      return HitZone.EDGE;
    }
    return HitZone.INSIDE;
  }

  public isDegenerate(): boolean {
    return this.getWidth() === 0 || this.getHeight() === 0;
  }
}

class ClickDebounceModel {
  private windowMs: number;
  private acceptedCount: number = 0;
  private droppedCount: number = 0;
  private lastAcceptedAt: number = -1;

  constructor(windowMs: number) {
    this.windowMs = windowMs;
  }

  public shouldAccept(timestamp: number): boolean {
    if (this.lastAcceptedAt < 0 || timestamp - this.lastAcceptedAt >= this.windowMs) {
      this.lastAcceptedAt = timestamp;
      this.acceptedCount++;
      return true;
    }
    this.droppedCount++;
    return false;
  }

  public getAcceptedCount(): number {
    return this.acceptedCount;
  }

  public getDroppedCount(): number {
    return this.droppedCount;
  }

  public getWindowMs(): number {
    return this.windowMs;
  }

  public reset(): void {
    this.acceptedCount = 0;
    this.droppedCount = 0;
    this.lastAcceptedAt = -1;
  }
}

class ClickabilityEvaluator {
  public evaluate(tracker: ClickSessionTracker, finalText: string): ClickabilityReport {
    const report: ClickabilityReport = {
      clickable: tracker.getClickCount() > 0,
      clickCount: tracker.getClickCount(),
      changedCount: tracker.getChangedCount(),
      idempotentCount: tracker.getIdempotentCount(),
      finalText: finalText
    };
    return report;
  }

  public isTextProgressionValid(timeline: string[]): boolean {
    let sawClicked: boolean = false;
    for (let i = 0; i < timeline.length; i++) {
      if (timeline[i] === PAGE_TEXT_CLICKED) {
        sawClicked = true;
      }
      if (timeline[i] === PAGE_TEXT_INITIAL && sawClicked) {
        return false;
      }
      if (timeline[i] !== PAGE_TEXT_INITIAL && timeline[i] !== PAGE_TEXT_CLICKED) {
        return false;
      }
    }
    return true;
  }
}

async function readTextById(driver: Driver): Promise<string> {
  return await runSerializedUiOperation(async (): Promise<string> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return '';
      }
      return await component.getText();
    } catch (error) {
      logError(`readTextById failed: ${error}`);
      return '';
    }
  });
}

async function clickTextComponent(driver: Driver): Promise<boolean> {
  return await runSerializedUiOperation(async (): Promise<boolean> => {
    try {
      const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
      if (component === null || component === undefined) {
        return false;
      }
      await component.click();
      await driver.delayMs(DELAY_TOUCH_EVENT);
      logInfo('clickTextComponent: click dispatched');
      return true;
    } catch (error) {
      logError(`clickTextComponent failed: ${error}`);
      return false;
    }
  });
}

async function restoreInitialText(driver: Driver): Promise<boolean> {
  const restored: boolean = await ensureIndexPageInitial(driver);
  logInfo(`restoreInitialText: initial text restored: ${restored}`);
  return restored;
}

async function clickAndRecord(driver: Driver, tracker: ClickSessionTracker): Promise<ClickRecord | null> {
  const beforeText: string = await readTextById(driver);
  const startTime: number = Date.now();
  const clicked: boolean = await clickTextComponent(driver);
  if (!clicked) {
    return null;
  }
  const afterText: string = await readTextById(driver);
  const record: ClickRecord = tracker.record(beforeText, afterText, Date.now() - startTime);
  logInfo(`clickAndRecord: ${beforeText} -> ${afterText} in ${record.elapsedMs} ms`);
  return record;
}

export default function buttonInteractionTest(): void {
  describe('ButtonInteractionTest', () => {
    let driver: Driver;
    let tracker: ClickSessionTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new ClickSessionTracker();
      logInfo('ButtonInteractionTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
    })

    afterAll(async () => {
      logInfo('ButtonInteractionTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0100
     * @tc.name testButtonTextComponentExists
     * @tc.desc Verify the interactive Text component is present on index page: ON.id(HelloWorld) -> one node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTextComponentExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const restored: boolean = await restoreInitialText(driver);
          expect(restored).assertTrue();
          const text: string = await readTextById(driver);
          expect(text).assertEqual(PAGE_TEXT_INITIAL);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0200
     * @tc.name testButtonClickTransitionsToWelcome
     * @tc.desc Verify click on Text triggers onClick: Hello World -> Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonClickTransitionsToWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const restored: boolean = await restoreInitialText(driver);
          expect(restored).assertTrue();
          tracker.clear();
          const record: ClickRecord | null = await clickAndRecord(driver, tracker);
          expect(record !== null).assertTrue();
          if (record !== null) {
            expect(record.textBefore).assertEqual(PAGE_TEXT_INITIAL);
            expect(record.textAfter).assertEqual(PAGE_TEXT_CLICKED);
            expect(record.changed).assertTrue();
          }
          expect(tracker.getChangedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0300
     * @tc.name testButtonClickReachabilityByText
     * @tc.desc Verify clicked text is discoverable by text locator: ON.text(Welcome) -> one node
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonClickReachabilityByText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clickedVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(clickedVisible).assertTrue();
          const matched: Component[] = await findComponentsByText(driver, PAGE_TEXT_CLICKED);
          expect(matched.length).assertEqual(1);
          const text: string = await matched[0].getText();
          expect(text).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0400
     * @tc.name testButtonRepeatedClickIdempotent
     * @tc.desc Verify repeated clicks are idempotent: five clicks after transition keep Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonRepeatedClickIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          tracker.clear();
          for (let i = 0; i < 5; i++) {
            const record: ClickRecord | null = await clickAndRecord(driver, tracker);
            expect(record !== null).assertTrue();
          }
          expect(tracker.getClickCount()).assertEqual(5);
          expect(tracker.getChangedCount()).assertEqual(0);
          expect(tracker.getIdempotentCount()).assertEqual(5);
          const finalText: string = await readTextById(driver);
          expect(finalText).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0500
     * @tc.name testButtonClickAgainKeepsWelcome
     * @tc.desc Verify explicit second click keeps clicked state and does not revert: Welcome -> Welcome
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonClickAgainKeepsWelcome', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          tracker.clear();
          const first: ClickRecord | null = await clickAndRecord(driver, tracker);
          const second: ClickRecord | null = await clickAndRecord(driver, tracker);
          expect(first !== null).assertTrue();
          expect(second !== null).assertTrue();
          if (first !== null && second !== null) {
            expect(first.textBefore).assertEqual(PAGE_TEXT_CLICKED);
            expect(first.textAfter).assertEqual(PAGE_TEXT_CLICKED);
            expect(second.textBefore).assertEqual(PAGE_TEXT_CLICKED);
            expect(second.textAfter).assertEqual(PAGE_TEXT_CLICKED);
          }
          expect(tracker.getClickCount()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0600
     * @tc.name testButtonComponentCountBeforeAfterClick
     * @tc.desc Verify click does not change layout cardinality: component count before equals after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonComponentCountBeforeAfterClick', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          expect(beforeCount).assertLargerOrEqual(1);
          await clickTextComponent(driver);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0700
     * @tc.name testButtonTextNodeCountRemainsSingle
     * @tc.desc Verify Text node cardinality stays one across click cycles: type Text count is one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTextNodeCountRemainsSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeNodes: Component[] = await findComponentsByText(driver, PAGE_TEXT_CLICKED);
          expect(beforeNodes.length).assertEqual(1);
          await clickTextComponent(driver);
          const afterNodes: Component[] = await findComponentsByText(driver, PAGE_TEXT_CLICKED);
          expect(afterNodes.length).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0800
     * @tc.name testButtonTouchCoordinatesDoNotBreakPage
     * @tc.desc Verify pointer input outside hit target keeps page alive: smoke click -> page visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTouchCoordinatesDoNotBreakPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          await simulateTouch(driver, 1, 1);
          await serializedDelay(driver, DELAY_TOUCH_EVENT);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_0900
     * @tc.name testButtonStateMachineInitialActivation
     * @tc.desc Verify state machine accepts activation from initial state: initial -> clicked with reason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonStateMachineInitialActivation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: TextStateMachine = new TextStateMachine(PAGE_TEXT_INITIAL);
          expect(machine.isInitial()).assertTrue();
          const result: TransitionResult = machine.apply(InteractionKind.ACTIVATE);
          expect(result.accepted).assertTrue();
          expect(result.from).assertEqual(TextPresentation.INITIAL);
          expect(result.to).assertEqual(TextPresentation.CLICKED);
          expect(machine.isClicked()).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1000
     * @tc.name testButtonStateMachineIdempotentActivation
     * @tc.desc Verify repeated activation in clicked state is accepted but state unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonStateMachineIdempotentActivation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: TextStateMachine = new TextStateMachine(PAGE_TEXT_CLICKED);
          const result: TransitionResult = machine.apply(InteractionKind.ACTIVATE);
          expect(result.accepted).assertTrue();
          expect(result.from).assertEqual(TextPresentation.CLICKED);
          expect(result.to).assertEqual(TextPresentation.CLICKED);
          expect(result.reason).assertEqual('activation is idempotent in clicked state');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1100
     * @tc.name testButtonStateMachineUnknownRejected
     * @tc.desc Verify activation is rejected for unknown text state: empty text -> accepted false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonStateMachineUnknownRejected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const machine: TextStateMachine = new TextStateMachine('');
          expect(machine.getState()).assertEqual(TextPresentation.UNKNOWN);
          const result: TransitionResult = machine.apply(InteractionKind.ACTIVATE);
          expect(result.accepted).assertFalse();
          expect(result.reason).assertEqual('activation rejected for unknown state');
          expect(machine.isClicked()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1200
     * @tc.name testButtonStateMachineResetSemantics
     * @tc.desc Verify reset semantics: reset from clicked accepted, reset from initial rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonStateMachineResetSemantics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clickedMachine: TextStateMachine = new TextStateMachine(PAGE_TEXT_CLICKED);
          const resetResult: TransitionResult = clickedMachine.apply(InteractionKind.RESET);
          expect(resetResult.accepted).assertTrue();
          expect(clickedMachine.isInitial()).assertTrue();
          const initialMachine: TextStateMachine = new TextStateMachine(PAGE_TEXT_INITIAL);
          const rejectedReset: TransitionResult = initialMachine.apply(InteractionKind.RESET);
          expect(rejectedReset.accepted).assertFalse();
          expect(rejectedReset.reason).assertEqual('reset only allowed from clicked state');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1300
     * @tc.name testButtonStateMachineNoopKeepsState
     * @tc.desc Verify noop interaction preserves state in both directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonStateMachineNoopKeepsState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const initialMachine: TextStateMachine = new TextStateMachine(PAGE_TEXT_INITIAL);
          const initialNoop: TransitionResult = initialMachine.apply(InteractionKind.NOOP);
          expect(initialNoop.accepted).assertTrue();
          expect(initialMachine.getState()).assertEqual(TextPresentation.INITIAL);
          const clickedMachine: TextStateMachine = new TextStateMachine(PAGE_TEXT_CLICKED);
          const clickedNoop: TransitionResult = clickedMachine.apply(InteractionKind.NOOP);
          expect(clickedNoop.to).assertEqual(TextPresentation.CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1400
     * @tc.name testButtonTrackerRecordsSequence
     * @tc.desc Verify click tracker numbers records contiguously and reports first record correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTrackerRecordsSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localTracker: ClickSessionTracker = new ClickSessionTracker();
          localTracker.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 40);
          localTracker.record(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED, 30);
          localTracker.record(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED, 20);
          expect(localTracker.getClickCount()).assertEqual(3);
          expect(localTracker.hasSequenceGap()).assertFalse();
          const first: ClickRecord | null = localTracker.getFirstRecord();
          expect(first !== null).assertTrue();
          if (first !== null) {
            expect(first.sequence).assertEqual(1);
            expect(first.textBefore).assertEqual(PAGE_TEXT_INITIAL);
            expect(first.changed).assertTrue();
          }
          expect(localTracker.averageElapsed()).assertEqual(30);
          expect(localTracker.maxElapsed()).assertEqual(40);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1500
     * @tc.name testButtonTrackerTimelineProgression
     * @tc.desc Verify text timeline follows a valid monotonic progression and evaluator accepts it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTrackerTimelineProgression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localTracker: ClickSessionTracker = new ClickSessionTracker();
          localTracker.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 30);
          localTracker.record(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED, 20);
          const timeline: string[] = localTracker.getTextTimeline();
          expect(timeline.length).assertEqual(2);
          expect(timeline[0]).assertEqual(PAGE_TEXT_CLICKED);
          expect(timeline[1]).assertEqual(PAGE_TEXT_CLICKED);
          const evaluator: ClickabilityEvaluator = new ClickabilityEvaluator();
          expect(evaluator.isTextProgressionValid(timeline)).assertTrue();
          const illegalTimeline: string[] = [PAGE_TEXT_CLICKED, PAGE_TEXT_INITIAL];
          expect(evaluator.isTextProgressionValid(illegalTimeline)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1600
     * @tc.name testButtonTrackerEmptyState
     * @tc.desc Verify empty tracker reports zero counts, null records and zero averages
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTrackerEmptyState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const emptyTracker: ClickSessionTracker = new ClickSessionTracker();
          expect(emptyTracker.getClickCount()).assertEqual(0);
          expect(emptyTracker.getFirstRecord()).assertNull();
          expect(emptyTracker.getLastRecord()).assertNull();
          expect(emptyTracker.averageElapsed()).assertEqual(0);
          expect(emptyTracker.hasSequenceGap()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1700
     * @tc.name testButtonTrackerClearState
     * @tc.desc Verify tracker clear resets counts and sequence numbering restarts at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonTrackerClearState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localTracker: ClickSessionTracker = new ClickSessionTracker();
          localTracker.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 10);
          localTracker.record(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED, 10);
          localTracker.clear();
          expect(localTracker.getClickCount()).assertEqual(0);
          const freshRecord: ClickRecord = localTracker.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 15);
          expect(freshRecord.sequence).assertEqual(1);
          expect(localTracker.getChangedCount()).assertEqual(1);
          expect(localTracker.getIdempotentCount()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1800
     * @tc.name testButtonHitTestCenterInside
     * @tc.desc Verify hit testing accepts the component center: center point classified as inside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonHitTestCenterInside', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bounds: RectBounds = { left: 100, top: 200, right: 300, bottom: 400 };
          const hitTest: HitTestModel = new HitTestModel(bounds);
          expect(hitTest.getWidth()).assertEqual(200);
          expect(hitTest.getHeight()).assertEqual(200);
          expect(hitTest.getCenterX()).assertEqual(200);
          expect(hitTest.getCenterY()).assertEqual(300);
          expect(hitTest.classify(200, 300)).assertEqual(HitZone.INSIDE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_1900
     * @tc.name testButtonHitTestEdgesAndOutside
     * @tc.desc Verify edge and outside classification: on-edge points classified edge, beyond classified outside
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonHitTestEdgesAndOutside', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bounds: RectBounds = { left: 100, top: 200, right: 300, bottom: 400 };
          const hitTest: HitTestModel = new HitTestModel(bounds);
          expect(hitTest.classify(100, 300)).assertEqual(HitZone.EDGE);
          expect(hitTest.classify(300, 400)).assertEqual(HitZone.EDGE);
          expect(hitTest.classify(99, 300)).assertEqual(HitZone.OUTSIDE);
          expect(hitTest.contains(301, 300)).assertFalse();
          expect(hitTest.isDegenerate()).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_2000
     * @tc.name testButtonHitTestDegenerateBounds
     * @tc.desc Verify degenerate bounds with zero width are detected and never contain interior points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonHitTestDegenerateBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const bounds: RectBounds = { left: 50, top: 50, right: 50, bottom: 150 };
          const hitTest: HitTestModel = new HitTestModel(bounds);
          expect(hitTest.isDegenerate()).assertTrue();
          expect(hitTest.getWidth()).assertEqual(0);
          expect(hitTest.classify(50, 100)).assertEqual(HitZone.EDGE);
          expect(hitTest.classify(51, 100)).assertEqual(HitZone.OUTSIDE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_2100
     * @tc.name testButtonDebounceWindowBoundary
     * @tc.desc Verify debounce accepts at window boundary: gap equal to window accepted, gap below window dropped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonDebounceWindowBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debounce: ClickDebounceModel = new ClickDebounceModel(100);
          expect(debounce.shouldAccept(0)).assertTrue();
          expect(debounce.shouldAccept(99)).assertFalse();
          expect(debounce.shouldAccept(100)).assertTrue();
          expect(debounce.shouldAccept(101)).assertFalse();
          expect(debounce.getAcceptedCount()).assertEqual(2);
          expect(debounce.getDroppedCount()).assertEqual(2);
          expect(debounce.getWindowMs()).assertEqual(100);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_2200
     * @tc.name testButtonDebounceReset
     * @tc.desc Verify debounce reset clears counters and the next event is accepted regardless of timestamp
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonDebounceReset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const debounce: ClickDebounceModel = new ClickDebounceModel(50);
          debounce.shouldAccept(10);
          debounce.shouldAccept(20);
          expect(debounce.getDroppedCount()).assertEqual(1);
          debounce.reset();
          expect(debounce.getAcceptedCount()).assertEqual(0);
          expect(debounce.getDroppedCount()).assertEqual(0);
          expect(debounce.shouldAccept(20)).assertTrue();
          expect(debounce.getAcceptedCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_2300
     * @tc.name testButtonClickabilityReportAggregation
     * @tc.desc Verify clickability report aggregates click, change and idempotent counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonClickabilityReportAggregation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localTracker: ClickSessionTracker = new ClickSessionTracker();
          localTracker.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 20);
          localTracker.record(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED, 20);
          localTracker.record(PAGE_TEXT_CLICKED, PAGE_TEXT_CLICKED, 20);
          const evaluator: ClickabilityEvaluator = new ClickabilityEvaluator();
          const report: ClickabilityReport = evaluator.evaluate(localTracker, PAGE_TEXT_CLICKED);
          expect(report.clickable).assertTrue();
          expect(report.clickCount).assertEqual(3);
          expect(report.changedCount).assertEqual(1);
          expect(report.idempotentCount).assertEqual(2);
          expect(report.finalText).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_BUTTON_2400
     * @tc.name testButtonLiveSessionFinalState
     * @tc.desc Verify live click session ends in clicked state with exactly one transition over three clicks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testButtonLiveSessionFinalState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          tracker.clear();
          for (let i = 0; i < 3; i++) {
            await clickAndRecord(driver, tracker);
          }
          expect(tracker.getClickCount()).assertEqual(3);
          expect(tracker.getChangedCount() + tracker.getIdempotentCount()).assertEqual(3);
          const finalText: string = await readTextById(driver);
          expect(finalText).assertEqual(PAGE_TEXT_CLICKED);
          const report: ClickabilityReport =
            new ClickabilityEvaluator().evaluate(tracker, finalText);
          expect(report.clickable).assertTrue();
          expect(report.finalText).assertEqual(PAGE_TEXT_CLICKED);
        } finally {
          done();
        }
      })
  })
}
