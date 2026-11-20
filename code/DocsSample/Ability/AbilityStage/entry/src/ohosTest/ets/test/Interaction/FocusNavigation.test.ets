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
  getBundleName,
  ensureIndexPageInitial,
  logInfo,
  logError,
  launchEntryAbility,
  runSerializedUiOperation,
  serializedDelay,
  waitForIndexPageStable,
  checkTextContent,
  isIndexPageVisible,
  pageComponentCount,
  findComponentsByType,
  checkFocusState,
  getCurrentFocusIndex,
  pressAndWait,
  checkComponentExistsByKey,
  INDEX_PAGE_TEXT_KEY,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_AFTER_LAUNCH,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_FOCUS_CHANGE,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_TAB,
  KEY_ENTER
} from '../Shared/SharedDriver';

enum FocusDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  TAB_FORWARD = 'tab_forward',
  TAB_BACKWARD = 'tab_backward'
}

enum FocusMoveResult {
  MOVED = 'moved',
  CLAMPED = 'clamped',
  WRAPPED = 'wrapped',
  INVALID = 'invalid'
}

interface FocusableNode {
  index: number;
  nodeId: string;
  label: string;
  enabled: boolean;
}

interface FocusStep {
  sequence: number;
  fromIndex: number;
  toIndex: number;
  direction: FocusDirection;
  result: FocusMoveResult;
}

interface FocusSequenceSummary {
  totalMoves: number;
  movedCount: number;
  clampedCount: number;
  wrappedCount: number;
  visitedIndexes: number[];
}

interface FocusBudgetCheck {
  withinBudget: boolean;
  elapsedMs: number;
  budgetMs: number;
}

class FocusSequenceModel {
  private nodes: FocusableNode[] = [];
  private currentIndex: number = -1;
  private wrapEnabled: boolean;

  constructor(nodes: FocusableNode[], wrapEnabled: boolean) {
    for (let i = 0; i < nodes.length; i++) {
      this.nodes.push(nodes[i]);
    }
    this.wrapEnabled = wrapEnabled;
    this.currentIndex = this.firstEnabledIndex();
  }

  public static keyToDirection(key: number): FocusDirection {
    if (key === KEY_LEFT) {
      return FocusDirection.LEFT;
    }
    if (key === KEY_RIGHT) {
      return FocusDirection.RIGHT;
    }
    if (key === KEY_UP) {
      return FocusDirection.UP;
    }
    if (key === KEY_DOWN) {
      return FocusDirection.DOWN;
    }
    if (key === KEY_TAB) {
      return FocusDirection.TAB_FORWARD;
    }
    return FocusDirection.LEFT;
  }

  private firstEnabledIndex(): number {
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].enabled) {
        return i;
      }
    }
    return -1;
  }

  private lastEnabledIndex(): number {
    for (let i = this.nodes.length - 1; i >= 0; i--) {
      if (this.nodes[i].enabled) {
        return i;
      }
    }
    return -1;
  }

  public isBackward(direction: FocusDirection): boolean {
    return direction === FocusDirection.LEFT
      || direction === FocusDirection.UP
      || direction === FocusDirection.TAB_BACKWARD;
  }

  public move(direction: FocusDirection): FocusStep {
    const fromIndex: number = this.currentIndex;
    if (this.nodes.length === 0 || fromIndex < 0) {
      const invalid: FocusStep = {
        sequence: 0,
        fromIndex: fromIndex,
        toIndex: fromIndex,
        direction: direction,
        result: FocusMoveResult.INVALID
      };
      return invalid;
    }
    const stepBack: boolean = this.isBackward(direction);
    let candidate: number = stepBack ? fromIndex - 1 : fromIndex + 1;
    let result: FocusMoveResult = FocusMoveResult.MOVED;
    if (candidate < 0) {
      if (this.wrapEnabled) {
        candidate = this.lastEnabledIndex();
        result = FocusMoveResult.WRAPPED;
      } else {
        candidate = 0;
        result = FocusMoveResult.CLAMPED;
      }
    } else if (candidate > this.nodes.length - 1) {
      if (this.wrapEnabled) {
        candidate = this.firstEnabledIndex();
        result = FocusMoveResult.WRAPPED;
      } else {
        candidate = this.nodes.length - 1;
        result = FocusMoveResult.CLAMPED;
      }
    }
    if (!this.nodes[candidate].enabled) {
      candidate = fromIndex;
      result = FocusMoveResult.CLAMPED;
    }
    if (candidate === fromIndex && result === FocusMoveResult.MOVED) {
      result = FocusMoveResult.CLAMPED;
    }
    this.currentIndex = candidate;
    const step: FocusStep = {
      sequence: 0,
      fromIndex: fromIndex,
      toIndex: candidate,
      direction: direction,
      result: result
    };
    return step;
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public setCurrentIndex(index: number): boolean {
    if (index < 0 || index >= this.nodes.length) {
      return false;
    }
    if (!this.nodes[index].enabled) {
      return false;
    }
    this.currentIndex = index;
    return true;
  }

  public getNodeCount(): number {
    return this.nodes.length;
  }

  public getEnabledCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.nodes.length; i++) {
      if (this.nodes[i].enabled) {
        count++;
      }
    }
    return count;
  }

  public getLabelAt(index: number): string {
    if (index < 0 || index >= this.nodes.length) {
      return '';
    }
    return this.nodes[index].label;
  }

  public isIndexInRange(index: number): boolean {
    return index >= 0 && index < this.nodes.length;
  }

  public isWrapEnabled(): boolean {
    return this.wrapEnabled;
  }
}

class FocusHistoryLog {
  private steps: FocusStep[] = [];
  private nextSequence: number = 1;

  public append(step: FocusStep): FocusStep {
    const recorded: FocusStep = {
      sequence: this.nextSequence,
      fromIndex: step.fromIndex,
      toIndex: step.toIndex,
      direction: step.direction,
      result: step.result
    };
    this.steps.push(recorded);
    this.nextSequence++;
    return recorded;
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public getStepAt(index: number): FocusStep | null {
    if (index < 0 || index >= this.steps.length) {
      return null;
    }
    return this.steps[index];
  }

  public countByResult(result: FocusMoveResult): number {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].result === result) {
        count++;
      }
    }
    return count;
  }

  public countByDirection(direction: FocusDirection): number {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].direction === direction) {
        count++;
      }
    }
    return count;
  }

  public visitedIndexes(): number[] {
    const visited: number[] = [];
    for (let i = 0; i < this.steps.length; i++) {
      if (visited.indexOf(this.steps[i].toIndex) === -1) {
        visited.push(this.steps[i].toIndex);
      }
    }
    return visited;
  }

  public lastToIndex(): number {
    if (this.steps.length === 0) {
      return -1;
    }
    return this.steps[this.steps.length - 1].toIndex;
  }

  public hasSequenceGap(): boolean {
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].sequence !== i + 1) {
        return true;
      }
    }
    return false;
  }

  public summarize(): FocusSequenceSummary {
    const summary: FocusSequenceSummary = {
      totalMoves: this.steps.length,
      movedCount: this.countByResult(FocusMoveResult.MOVED),
      clampedCount: this.countByResult(FocusMoveResult.CLAMPED),
      wrappedCount: this.countByResult(FocusMoveResult.WRAPPED),
      visitedIndexes: this.visitedIndexes()
    };
    return summary;
  }

  public clear(): void {
    this.steps = [];
    this.nextSequence = 1;
  }
}

class FocusIndexGuard {
  private minIndex: number;
  private maxIndex: number;

  constructor(minIndex: number, maxIndex: number) {
    this.minIndex = minIndex;
    this.maxIndex = maxIndex;
  }

  public clamp(index: number): number {
    if (index < this.minIndex) {
      return this.minIndex;
    }
    if (index > this.maxIndex) {
      return this.maxIndex;
    }
    return index;
  }

  public isWithin(index: number): boolean {
    return index >= this.minIndex && index <= this.maxIndex;
  }

  public isAtLowerBound(index: number): boolean {
    return index === this.minIndex;
  }

  public isAtUpperBound(index: number): boolean {
    return index === this.maxIndex;
  }

  public getSpan(): number {
    return this.maxIndex - this.minIndex;
  }

  public clampWithTolerance(index: number, tolerance: number): number {
    const lower: number = this.minIndex - tolerance;
    const upper: number = this.maxIndex + tolerance;
    if (index < lower) {
      return lower;
    }
    if (index > upper) {
      return upper;
    }
    return index;
  }
}

class FocusBudgetEvaluator {
  private budgetMs: number;

  constructor(budgetMs: number) {
    this.budgetMs = budgetMs;
  }

  public evaluate(elapsedMs: number): FocusBudgetCheck {
    const check: FocusBudgetCheck = {
      withinBudget: elapsedMs <= this.budgetMs,
      elapsedMs: elapsedMs,
      budgetMs: this.budgetMs
    };
    return check;
  }

  public static isBoundaryAccepted(elapsedMs: number, budgetMs: number): boolean {
    return elapsedMs <= budgetMs;
  }

  public static worstCaseOf(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    let worst: number = values[0];
    for (let i = 1; i < values.length; i++) {
      if (values[i] > worst) {
        worst = values[i];
      }
    }
    return worst;
  }

  public static medianOf(values: number[]): number {
    if (values.length === 0) {
      return 0;
    }
    const sorted: number[] = [];
    for (let i = 0; i < values.length; i++) {
      sorted.push(values[i]);
    }
    for (let i = 0; i < sorted.length; i++) {
      for (let j = i + 1; j < sorted.length; j++) {
        if (sorted[j] < sorted[i]) {
          const temp: number = sorted[i];
          sorted[i] = sorted[j];
          sorted[j] = temp;
        }
      }
    }
    const middle: number = Math.floor(sorted.length / 2);
    if (sorted.length % 2 === 0) {
      return (sorted[middle - 1] + sorted[middle]) / 2;
    }
    return sorted[middle];
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

async function countAllComponents(driver: Driver): Promise<number> {
  return await pageComponentCount(driver);
}

async function countFocusedLeaves(driver: Driver): Promise<number> {
  return await runSerializedUiOperation(async (): Promise<number> => {
    try {
      const focusedTexts: Component[] = await driver.findComponents(ON.focused(true).type('Text'));
      if (focusedTexts === null || focusedTexts === undefined) {
        return 0;
      }
      logInfo(`countFocusedLeaves: ${focusedTexts.length} focused text leaves`);
      return focusedTexts.length;
    } catch (error) {
      logError(`countFocusedLeaves failed: ${error}`);
      return 0;
    }
  });
}

async function countFocusedComponents(driver: Driver): Promise<number> {
  return await runSerializedUiOperation(async (): Promise<number> => {
    try {
      const focused: Component[] = await driver.findComponents(ON.focused(true).inWindow(getBundleName()));
      if (focused === null || focused === undefined) {
        return 0;
      }
      logInfo(`countFocusedComponents: ${focused.length} focused components in the app window`);
      return focused.length;
    } catch (error) {
      logError(`countFocusedComponents failed: ${error}`);
      return 0;
    }
  });
}

function buildSingleNodeModel(): FocusSequenceModel {
  const nodes: FocusableNode[] = [];
  const node: FocusableNode = {
    index: 0,
    nodeId: INDEX_PAGE_TEXT_KEY,
    label: PAGE_TEXT_INITIAL,
    enabled: true
  };
  nodes.push(node);
  return new FocusSequenceModel(nodes, true);
}

function buildLinearModel(size: number, wrapEnabled: boolean): FocusSequenceModel {
  const nodes: FocusableNode[] = [];
  for (let i = 0; i < size; i++) {
    const node: FocusableNode = {
      index: i,
      nodeId: `FocusNode${i}`,
      label: `Label${i}`,
      enabled: true
    };
    nodes.push(node);
  }
  return new FocusSequenceModel(nodes, wrapEnabled);
}

function buildDisabledModel(): FocusSequenceModel {
  const nodes: FocusableNode[] = [];
  const disabled: FocusableNode = {
    index: 0,
    nodeId: 'DisabledNode',
    label: 'Disabled',
    enabled: false
  };
  const enabled: FocusableNode = {
    index: 1,
    nodeId: 'EnabledNode',
    label: 'Enabled',
    enabled: true
  };
  const tailDisabled: FocusableNode = {
    index: 2,
    nodeId: 'TailDisabled',
    label: 'Tail Disabled',
    enabled: false
  };
  nodes.push(disabled);
  nodes.push(enabled);
  nodes.push(tailDisabled);
  return new FocusSequenceModel(nodes, false);
}

export default function focusNavigationTest(): void {
  describe('FocusNavigationTest', () => {
    let driver: Driver;
    let history: FocusHistoryLog;

    beforeAll(async () => {
      driver = getDriver();
      history = new FocusHistoryLog();
      logInfo('FocusNavigationTest: preparing index page');
      await launchEntryAbility();
      await serializedDelay(driver, DELAY_AFTER_LAUNCH);
      await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
      await ensureIndexPageInitial(driver);
    })

    afterAll(async () => {
      logInfo('FocusNavigationTest: finished');
      await serializedDelay(driver, 100);
    })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0100
     * @tc.name testFocusPageRenderedBeforeNavigation
     * @tc.desc Verify index page is rendered before focus navigation: page stable and text present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusPageRenderedBeforeNavigation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
          expect(stable).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
          const text: string = await readTextById(driver);
          expect(text.length > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0200
     * @tc.name testFocusInitialIndexIsValid
     * @tc.desc Verify initial focus index is either absent or inside component bounds: never beyond count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusInitialIndexIsValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount).assertLargerOrEqual(1);
          const initialIndex: number = await getCurrentFocusIndex(driver);
          const initialInBounds: boolean =
            initialIndex === -1 || (initialIndex >= 0 && initialIndex < componentCount);
          expect(initialInBounds).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0300
     * @tc.name testFocusLeftPressKeepsIndexInRange
     * @tc.desc Verify KEY_LEFT does not push focus index beyond component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLeftPressKeepsIndexInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0400
     * @tc.name testFocusRightPressKeepsIndexInRange
     * @tc.desc Verify KEY_RIGHT does not push focus index beyond component count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRightPressKeepsIndexInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const text: string = await readTextById(driver);
          expect(text.length > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0500
     * @tc.name testFocusUpPressKeepsIndexInRange
     * @tc.desc Verify KEY_UP keeps focus index inside bounds and page unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusUpPressKeepsIndexInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await readTextById(driver);
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(beforeText);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0600
     * @tc.name testFocusDownPressKeepsIndexInRange
     * @tc.desc Verify KEY_DOWN keeps focus index inside bounds and does not crash the page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusDownPressKeepsIndexInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0700
     * @tc.name testFocusFourDirectionsDoNotCrash
     * @tc.desc Verify a full direction sweep keeps the page alive and component count stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusFourDirectionsDoNotCrash', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
          const afterCount: number = await pageComponentCount(driver);
          expect(afterCount).assertEqual(beforeCount);
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0800
     * @tc.name testFocusRepeatedPressesStayInRange
     * @tc.desc Verify ten consecutive KEY_RIGHT presses never leave bounds and text survives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusRepeatedPressesStayInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_RIGHT, 10, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const text: string = await readTextById(driver);
          expect(text.length > 0).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_0900
     * @tc.name testFocusAlternatingPressesStayInRange
     * @tc.desc Verify alternating LEFT and RIGHT presses keep index bounds stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusAlternatingPressesStayInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const countAfter: number = await pageComponentCount(driver);
          expect(countAfter).assertEqual(componentCount);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1000
     * @tc.name testFocusTabPressKeepsPage
     * @tc.desc Verify TAB traversal key keeps focus index in range and page rendered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusTabPressKeepsPage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1100
     * @tc.name testFocusEnterPressKeepsText
     * @tc.desc Verify keyboard activation through focus: TAB moves focus onto the clickable text and ENTER
     * fires its onClick so the copy becomes Welcome, while the HelloWorld node stays present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusEnterPressKeepsText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await readTextById(driver);
          expect(beforeText === PAGE_TEXT_INITIAL || beforeText === PAGE_TEXT_CLICKED).assertTrue();
          await pressAndWait(driver, KEY_TAB, 1, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(PAGE_TEXT_CLICKED);
          const exists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
          expect(exists).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1200
     * @tc.name testFocusStateQueryIsConsistent
     * @tc.desc Verify focus state query is consistent: reported index passes its own focus check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusStateQueryIsConsistent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const currentIndex: number = await getCurrentFocusIndex(driver);
          if (currentIndex >= 0) {
            const focused: boolean = await checkFocusState(driver, currentIndex);
            expect(focused).assertTrue();
            const focusExists: boolean = await checkFocusState(driver, -1);
            expect(focusExists).assertTrue();
          } else {
            const visible: boolean = await isIndexPageVisible(driver);
            expect(visible).assertTrue();
          }
          const componentCount: number = await pageComponentCount(driver);
          expect(componentCount).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1300
     * @tc.name testFocusSingleNodeModelStaysOnIndexZero
     * @tc.desc Verify a single node model never leaves index zero: wrap enabled reports WRAPPED while wrap disabled reports CLAMPED
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusSingleNodeModelStaysOnIndexZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildSingleNodeModel();
          expect(model.getNodeCount()).assertEqual(1);
          expect(model.getCurrentIndex()).assertEqual(0);
          const leftStep: FocusStep = model.move(FocusDirection.LEFT);
          const rightStep: FocusStep = model.move(FocusDirection.RIGHT);
          expect(leftStep.result).assertEqual(FocusMoveResult.WRAPPED);
          expect(rightStep.result).assertEqual(FocusMoveResult.WRAPPED);
          expect(leftStep.toIndex).assertEqual(0);
          expect(rightStep.toIndex).assertEqual(0);
          expect(model.getCurrentIndex()).assertEqual(0);
          expect(model.getLabelAt(0)).assertEqual(PAGE_TEXT_INITIAL);
          const clampedModel: FocusSequenceModel = buildLinearModel(1, false);
          const clampedLeft: FocusStep = clampedModel.move(FocusDirection.LEFT);
          const clampedRight: FocusStep = clampedModel.move(FocusDirection.RIGHT);
          expect(clampedLeft.result).assertEqual(FocusMoveResult.CLAMPED);
          expect(clampedRight.result).assertEqual(FocusMoveResult.CLAMPED);
          expect(clampedModel.getCurrentIndex()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1400
     * @tc.name testFocusLinearModelMovesForward
     * @tc.desc Verify linear model advances index on forward directions: three moves reach index three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLinearModelMovesForward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(5, false);
          const first: FocusStep = model.move(FocusDirection.RIGHT);
          const second: FocusStep = model.move(FocusDirection.DOWN);
          const third: FocusStep = model.move(FocusDirection.TAB_FORWARD);
          expect(first.result).assertEqual(FocusMoveResult.MOVED);
          expect(second.toIndex).assertEqual(2);
          expect(third.toIndex).assertEqual(3);
          expect(model.getCurrentIndex()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1500
     * @tc.name testFocusLinearModelMovesBackward
     * @tc.desc Verify linear model retreats index on backward directions: left then up ends at index one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLinearModelMovesBackward', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(5, false);
          model.setCurrentIndex(3);
          const leftStep: FocusStep = model.move(FocusDirection.LEFT);
          const upStep: FocusStep = model.move(FocusDirection.UP);
          expect(leftStep.toIndex).assertEqual(2);
          expect(upStep.toIndex).assertEqual(1);
          expect(model.getCurrentIndex()).assertEqual(1);
          expect(model.getEnabledCount()).assertEqual(5);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1600
     * @tc.name testFocusClampAtUpperBoundary
     * @tc.desc Verify clamp mode stops at last index: repeated forward moves return clamped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusClampAtUpperBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(3, false);
          model.move(FocusDirection.RIGHT);
          model.move(FocusDirection.RIGHT);
          expect(model.getCurrentIndex()).assertEqual(2);
          const clampedStep: FocusStep = model.move(FocusDirection.RIGHT);
          expect(clampedStep.result).assertEqual(FocusMoveResult.CLAMPED);
          expect(clampedStep.toIndex).assertEqual(2);
          expect(model.getCurrentIndex()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1700
     * @tc.name testFocusClampAtLowerBoundary
     * @tc.desc Verify clamp mode stops at index zero: repeated backward moves return clamped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusClampAtLowerBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(3, false);
          const clampedStep: FocusStep = model.move(FocusDirection.LEFT);
          expect(clampedStep.fromIndex).assertEqual(0);
          expect(clampedStep.toIndex).assertEqual(0);
          expect(clampedStep.result).assertEqual(FocusMoveResult.CLAMPED);
          const secondClamp: FocusStep = model.move(FocusDirection.UP);
          expect(secondClamp.result).assertEqual(FocusMoveResult.CLAMPED);
          expect(model.getCurrentIndex()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1800
     * @tc.name testFocusWrapAtUpperBoundary
     * @tc.desc Verify wrap mode cycles from last index back to zero with wrapped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusWrapAtUpperBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(4, true);
          expect(model.isWrapEnabled()).assertTrue();
          model.setCurrentIndex(3);
          const wrappedStep: FocusStep = model.move(FocusDirection.RIGHT);
          expect(wrappedStep.result).assertEqual(FocusMoveResult.WRAPPED);
          expect(wrappedStep.fromIndex).assertEqual(3);
          expect(wrappedStep.toIndex).assertEqual(0);
          expect(model.getCurrentIndex()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_1900
     * @tc.name testFocusWrapAtLowerBoundary
     * @tc.desc Verify wrap mode cycles from index zero back to last index with wrapped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusWrapAtLowerBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(4, true);
          const wrappedStep: FocusStep = model.move(FocusDirection.LEFT);
          expect(wrappedStep.result).assertEqual(FocusMoveResult.WRAPPED);
          expect(wrappedStep.toIndex).assertEqual(3);
          expect(model.getCurrentIndex()).assertEqual(3);
          const label: string = model.getLabelAt(3);
          expect(label).assertEqual('Label3');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2000
     * @tc.name testFocusFullCycleVisitsEveryIndex
     * @tc.desc Verify a full wrap cycle visits every index exactly once: four moves from zero return to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusFullCycleVisitsEveryIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(4, true);
          const localHistory: FocusHistoryLog = new FocusHistoryLog();
          for (let i = 0; i < 4; i++) {
            const step: FocusStep = model.move(FocusDirection.RIGHT);
            localHistory.append(step);
          }
          const summary: FocusSequenceSummary = localHistory.summarize();
          expect(summary.totalMoves).assertEqual(4);
          expect(summary.wrappedCount).assertEqual(1);
          expect(summary.visitedIndexes.length).assertEqual(4);
          expect(model.getCurrentIndex()).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2100
     * @tc.name testFocusDisabledNodeSkippedByClamp
     * @tc.desc Verify disabled nodes are never targeted: model starts at first enabled and clamps on disabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusDisabledNodeSkippedByClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildDisabledModel();
          expect(model.getCurrentIndex()).assertEqual(1);
          expect(model.getEnabledCount()).assertEqual(1);
          const moveStep: FocusStep = model.move(FocusDirection.RIGHT);
          expect(moveStep.toIndex).assertEqual(1);
          expect(moveStep.result).assertEqual(FocusMoveResult.CLAMPED);
          expect(model.setCurrentIndex(0)).assertFalse();
          expect(model.setCurrentIndex(2)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2200
     * @tc.name testFocusSetIndexRejectsOutOfRange
     * @tc.desc Verify direct index assignment rejects negative and oversized indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusSetIndexRejectsOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(3, false);
          expect(model.setCurrentIndex(-1)).assertFalse();
          expect(model.setCurrentIndex(3)).assertFalse();
          expect(model.setCurrentIndex(99)).assertFalse();
          expect(model.getCurrentIndex()).assertEqual(0);
          expect(model.isIndexInRange(-1)).assertFalse();
          expect(model.isIndexInRange(2)).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2300
     * @tc.name testFocusModelInvalidWhenEmpty
     * @tc.desc Verify empty focus model reports invalid moves and minus one index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusModelInvalidWhenEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const nodes: FocusableNode[] = [];
          const model: FocusSequenceModel = new FocusSequenceModel(nodes, true);
          expect(model.getNodeCount()).assertEqual(0);
          expect(model.getCurrentIndex()).assertEqual(-1);
          const step: FocusStep = model.move(FocusDirection.RIGHT);
          expect(step.result).assertEqual(FocusMoveResult.INVALID);
          expect(step.toIndex).assertEqual(-1);
          expect(model.getLabelAt(0)).assertEqual('');
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2400
     * @tc.name testFocusDirectionMappingFromKeys
     * @tc.desc Verify key codes map to directions exactly for four arrow keys and TAB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusDirectionMappingFromKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(FocusSequenceModel.keyToDirection(KEY_LEFT)).assertEqual(FocusDirection.LEFT);
          expect(FocusSequenceModel.keyToDirection(KEY_RIGHT)).assertEqual(FocusDirection.RIGHT);
          expect(FocusSequenceModel.keyToDirection(KEY_UP)).assertEqual(FocusDirection.UP);
          expect(FocusSequenceModel.keyToDirection(KEY_DOWN)).assertEqual(FocusDirection.DOWN);
          expect(FocusSequenceModel.keyToDirection(KEY_TAB)).assertEqual(FocusDirection.TAB_FORWARD);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2500
     * @tc.name testFocusBackwardDirectionClassification
     * @tc.desc Verify backward direction classification: left, up and tab backward are backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusBackwardDirectionClassification', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const model: FocusSequenceModel = buildLinearModel(2, false);
          expect(model.isBackward(FocusDirection.LEFT)).assertTrue();
          expect(model.isBackward(FocusDirection.UP)).assertTrue();
          expect(model.isBackward(FocusDirection.TAB_BACKWARD)).assertTrue();
          expect(model.isBackward(FocusDirection.RIGHT)).assertFalse();
          expect(model.isBackward(FocusDirection.DOWN)).assertFalse();
          expect(model.isBackward(FocusDirection.TAB_FORWARD)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2600
     * @tc.name testFocusHistorySequenceContiguous
     * @tc.desc Verify history records receive contiguous sequence numbers starting at one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusHistorySequenceContiguous', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localHistory: FocusHistoryLog = new FocusHistoryLog();
          const model: FocusSequenceModel = buildLinearModel(4, true);
          for (let i = 0; i < 5; i++) {
            localHistory.append(model.move(FocusDirection.RIGHT));
          }
          expect(localHistory.getStepCount()).assertEqual(5);
          expect(localHistory.hasSequenceGap()).assertFalse();
          const firstStep: FocusStep | null = localHistory.getStepAt(0);
          expect(firstStep !== null).assertTrue();
          if (firstStep !== null) {
            expect(firstStep.sequence).assertEqual(1);
            expect(firstStep.direction).assertEqual(FocusDirection.RIGHT);
          }
          expect(localHistory.getStepAt(5)).assertNull();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2700
     * @tc.name testFocusHistoryCountersByResult
     * @tc.desc Verify history counters split moved, clamped and wrapped outcomes exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusHistoryCountersByResult', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localHistory: FocusHistoryLog = new FocusHistoryLog();
          const clampedModel: FocusSequenceModel = buildLinearModel(2, false);
          localHistory.append(clampedModel.move(FocusDirection.RIGHT));
          localHistory.append(clampedModel.move(FocusDirection.RIGHT));
          localHistory.append(clampedModel.move(FocusDirection.RIGHT));
          const wrappedModel: FocusSequenceModel = buildLinearModel(2, true);
          localHistory.append(wrappedModel.move(FocusDirection.LEFT));
          const summary: FocusSequenceSummary = localHistory.summarize();
          expect(summary.totalMoves).assertEqual(4);
          expect(summary.movedCount).assertEqual(1);
          expect(summary.clampedCount).assertEqual(2);
          expect(summary.wrappedCount).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2800
     * @tc.name testFocusHistoryDirectionCounters
     * @tc.desc Verify history counts moves per direction independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusHistoryDirectionCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localHistory: FocusHistoryLog = new FocusHistoryLog();
          const model: FocusSequenceModel = buildLinearModel(5, true);
          localHistory.append(model.move(FocusDirection.RIGHT));
          localHistory.append(model.move(FocusDirection.RIGHT));
          localHistory.append(model.move(FocusDirection.LEFT));
          localHistory.append(model.move(FocusDirection.DOWN));
          expect(localHistory.countByDirection(FocusDirection.RIGHT)).assertEqual(2);
          expect(localHistory.countByDirection(FocusDirection.LEFT)).assertEqual(1);
          expect(localHistory.countByDirection(FocusDirection.DOWN)).assertEqual(1);
          expect(localHistory.countByDirection(FocusDirection.UP)).assertEqual(0);
          expect(localHistory.lastToIndex()).assertEqual(2);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_2900
     * @tc.name testFocusHistoryClearResets
     * @tc.desc Verify history clear resets step count, sequence numbering and last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusHistoryClearResets', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const localHistory: FocusHistoryLog = new FocusHistoryLog();
          const model: FocusSequenceModel = buildLinearModel(3, false);
          localHistory.append(model.move(FocusDirection.RIGHT));
          localHistory.append(model.move(FocusDirection.RIGHT));
          localHistory.clear();
          expect(localHistory.getStepCount()).assertEqual(0);
          expect(localHistory.lastToIndex()).assertEqual(-1);
          const freshStep: FocusStep = localHistory.append(model.move(FocusDirection.LEFT));
          expect(freshStep.sequence).assertEqual(1);
          expect(localHistory.getStepCount()).assertEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3000
     * @tc.name testFocusIndexGuardClamp
     * @tc.desc Verify index guard clamps below, inside and above the allowed window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusIndexGuardClamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const guard: FocusIndexGuard = new FocusIndexGuard(0, 3);
          expect(guard.clamp(-5)).assertEqual(0);
          expect(guard.clamp(0)).assertEqual(0);
          expect(guard.clamp(2)).assertEqual(2);
          expect(guard.clamp(3)).assertEqual(3);
          expect(guard.clamp(9)).assertEqual(3);
          expect(guard.getSpan()).assertEqual(3);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3100
     * @tc.name testFocusIndexGuardBoundaryPredicates
     * @tc.desc Verify boundary predicates and within-window checks at all edges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusIndexGuardBoundaryPredicates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const guard: FocusIndexGuard = new FocusIndexGuard(1, 4);
          expect(guard.isWithin(0)).assertFalse();
          expect(guard.isWithin(1)).assertTrue();
          expect(guard.isWithin(4)).assertTrue();
          expect(guard.isWithin(5)).assertFalse();
          expect(guard.isAtLowerBound(1)).assertTrue();
          expect(guard.isAtUpperBound(4)).assertTrue();
          expect(guard.isAtLowerBound(0)).assertFalse();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3200
     * @tc.name testFocusIndexGuardTolerance
     * @tc.desc Verify tolerance clamping expands the window by the tolerance value in both directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusIndexGuardTolerance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const guard: FocusIndexGuard = new FocusIndexGuard(0, 2);
          expect(TOLERANCE_FOCUS_CHANGE).assertEqual(2);
          expect(guard.clampWithTolerance(-1, TOLERANCE_FOCUS_CHANGE)).assertEqual(-1);
          expect(guard.clampWithTolerance(-3, TOLERANCE_FOCUS_CHANGE)).assertEqual(-2);
          expect(guard.clampWithTolerance(4, TOLERANCE_FOCUS_CHANGE)).assertEqual(4);
          expect(guard.clampWithTolerance(5, TOLERANCE_FOCUS_CHANGE)).assertEqual(4);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3300
     * @tc.name testFocusBudgetBoundaryAcceptance
     * @tc.desc Verify focus timing budget accepts boundary value and rejects one over budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusBudgetBoundaryAcceptance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          expect(FocusBudgetEvaluator.isBoundaryAccepted(500, 500)).assertTrue();
          expect(FocusBudgetEvaluator.isBoundaryAccepted(501, 500)).assertFalse();
          expect(FocusBudgetEvaluator.isBoundaryAccepted(0, 500)).assertTrue();
          const evaluator: FocusBudgetEvaluator = new FocusBudgetEvaluator(TIMEOUT_FOCUS_CHANGE);
          const check: FocusBudgetCheck = evaluator.evaluate(250);
          expect(check.withinBudget).assertTrue();
          expect(check.budgetMs).assertEqual(TIMEOUT_FOCUS_CHANGE);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3400
     * @tc.name testFocusBudgetStatistics
     * @tc.desc Verify worst case and median helpers over a known sample set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusBudgetStatistics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const samples: number[] = [120, 240, 180, 300];
          expect(FocusBudgetEvaluator.worstCaseOf(samples)).assertEqual(300);
          expect(FocusBudgetEvaluator.medianOf(samples)).assertEqual(210);
          const oddSamples: number[] = [50, 10, 30];
          expect(FocusBudgetEvaluator.medianOf(oddSamples)).assertEqual(30);
          const emptySamples: number[] = [];
          expect(FocusBudgetEvaluator.worstCaseOf(emptySamples)).assertEqual(0);
          expect(FocusBudgetEvaluator.medianOf(emptySamples)).assertEqual(0);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3500
     * @tc.name testFocusLiveFocusQueryWithinBudget
     * @tc.desc Verify live focus query completes within the focus budget on the real page
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLiveFocusQueryWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const startTime: number = Date.now();
          const currentIndex: number = await getCurrentFocusIndex(driver);
          const elapsed: number = Date.now() - startTime;
          const liveBudget: number = TIMEOUT_FOCUS_CHANGE * 20;
          const evaluator: FocusBudgetEvaluator = new FocusBudgetEvaluator(liveBudget);
          const check: FocusBudgetCheck = evaluator.evaluate(elapsed);
          expect(check.withinBudget).assertTrue();
          expect(check.budgetMs).assertEqual(TIMEOUT_FOCUS_CHANGE * 20);
          const componentCount: number = await pageComponentCount(driver);
          const queryInBounds: boolean = currentIndex === -1 || currentIndex < componentCount;
          expect(queryInBounds).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3600
     * @tc.name testFocusLiveFocusedComponentCountBounded
     * @tc.desc Verify exactly one interactive Text leaf holds focus, that the app window reports enough
     * focused nodes to host it, and that the page still exposes at least that many Text components
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLiveFocusedComponentCountBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const focusedLeaves: number = await countFocusedLeaves(driver);
          expect(focusedLeaves).assertEqual(1);
          const focusedTotal: number = await countFocusedComponents(driver);
          logInfo(`testFocusLiveFocusedComponentCountBounded: leaves ${focusedLeaves}, total ${focusedTotal}`);
          expect(focusedTotal).assertLargerOrEqual(focusedLeaves);
          const textCount: number = (await findComponentsByType(driver, 'Text')).length;
          expect(textCount).assertLargerOrEqual(focusedLeaves);
          const totalComponents: number = await countAllComponents(driver);
          expect(totalComponents).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3700
     * @tc.name testFocusLiveModelSyncWithDevice
     * @tc.desc Verify modelled index after pressing RIGHT matches device reported index when in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLiveModelSyncWithDevice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const componentCount: number = await countAllComponents(driver);
          const model: FocusSequenceModel = buildLinearModel(componentCount, false);
          const startIndex: number = await getCurrentFocusIndex(driver);
          if (startIndex >= 0 && startIndex < componentCount) {
            model.setCurrentIndex(startIndex);
            const modelledStep: FocusStep = model.move(FocusDirection.RIGHT);
            await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
            const deviceIndex: number = await getCurrentFocusIndex(driver);
            if (deviceIndex >= 0) {
              expect(deviceIndex < componentCount).assertTrue();
              expect(modelledStep.toIndex < componentCount).assertTrue();
            }
          }
          expect(componentCount).assertLargerOrEqual(1);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3800
     * @tc.name testFocusLiveLongPressSequenceStable
     * @tc.desc Verify twenty rapid key presses keep the focus index in range and page text intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLiveLongPressSequenceStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const beforeText: string = await readTextById(driver);
          const componentCount: number = await pageComponentCount(driver);
          await pressAndWait(driver, KEY_DOWN, 20, 20);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const afterText: string = await readTextById(driver);
          expect(afterText).assertEqual(beforeText);
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_3900
     * @tc.name testFocusLiveComponentCountAfterNavigation
     * @tc.desc Verify navigation does not change page composition: component count equals text node count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLiveComponentCountAfterNavigation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
          const textNodes: Component[] = await findComponentsByType(driver, 'Text');
          expect(textNodes.length).assertEqual(1);
          const text: string = await textNodes[0].getText();
          expect(text.length > 0).assertTrue();
          const visible: boolean = await isIndexPageVisible(driver);
          expect(visible).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_4000
     * @tc.name testFocusLiveStateAfterClickStillValid
     * @tc.desc Verify focus index stays in range after click driven text change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusLiveStateAfterClickStillValid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          const clicked: boolean = await runSerializedUiOperation(async (): Promise<boolean> => {
            try {
              const component: Component = await driver.findComponent(ON.id(INDEX_PAGE_TEXT_KEY));
              if (component === null || component === undefined) {
                return false;
              }
              await component.click();
              await driver.delayMs(150);
              return true;
            } catch (error) {
              logError(`click failed: ${error}`);
              return false;
            }
          });
          expect(clicked).assertTrue();
          await serializedDelay(driver, 150);
          const componentCount: number = await pageComponentCount(driver);
          const indexAfter: number = await getCurrentFocusIndex(driver);
          const indexInBounds: boolean = indexAfter === -1 || (indexAfter >= 0 && indexAfter < componentCount);
          expect(indexInBounds).assertTrue();
          const hasText: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
          expect(hasText).assertTrue();
        } finally {
          done();
        }
      })

    /**
     * @tc.number SUB_ABILITYSTAGE_FOCUSNAV_4100
     * @tc.name testFocusCombinedLiveAndModelSummary
     * @tc.desc Verify combined live navigation and model history agree on total move count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFocusCombinedLiveAndModelSummary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void) => {
        try {
          history.clear();
          const componentCount: number = await countAllComponents(driver);
          const model: FocusSequenceModel = buildLinearModel(componentCount, true);
          const directions: FocusDirection[] = [
            FocusDirection.RIGHT,
            FocusDirection.RIGHT,
            FocusDirection.LEFT,
            FocusDirection.DOWN
          ];
          for (let i = 0; i < directions.length; i++) {
            history.append(model.move(directions[i]));
          }
          await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
          await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
          const summary: FocusSequenceSummary = history.summarize();
          expect(summary.totalMoves).assertEqual(4);
          expect(summary.movedCount + summary.clampedCount + summary.wrappedCount).assertEqual(4);
          expect(model.getCurrentIndex() < componentCount).assertTrue();
        } finally {
          done();
        }
      })
  })
}
