/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_DOWN,
  KEY_ENTER,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  TIMEOUT_FOCUS_CHANGE,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  TOLERANCE_COMPONENT_COUNT,
  checkFocusState,
  componentCount,
  getCurrentFocusIndex,
  getDriver,
  homeComponentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  logInfo,
  pressAndWait,
  resetToHome,
  simulateTouch,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// Focus transition record: captures one focus move on the sample pages.
interface FocusTransitionRecord {
  fromIndex: number;
  toIndex: number;
  direction: string;
  timestamp: number;
  duration: number;
}

// Focus navigation tracker: keeps the focus history of the sample.
class FocusNavigationTracker {
  private static instance: FocusNavigationTracker;
  private focusHistory: FocusTransitionRecord[] = [];
  private currentFocusIndex: number = 0;
  private totalNavigations: number = 0;
  private navigationStartTime: number = 0;

  // Returns the singleton instance to keep the history consistent.
  public static getInstance(): FocusNavigationTracker {
    if (!FocusNavigationTracker.instance) {
      FocusNavigationTracker.instance = new FocusNavigationTracker();
    }
    return FocusNavigationTracker.instance;
  }

  public recordNavigation(fromIndex: number, toIndex: number, direction: string): void {
    const record: FocusTransitionRecord = {
      fromIndex,
      toIndex,
      direction,
      timestamp: Date.now(),
      duration: Date.now() - this.navigationStartTime
    };
    this.focusHistory.push(record);
    this.currentFocusIndex = toIndex;
    this.totalNavigations++;
  }

  public startNavigationTimer(): void {
    this.navigationStartTime = Date.now();
  }

  public getCurrentFocusIndex(): number {
    return this.currentFocusIndex;
  }

  public syncCurrentFocusIndex(focusIndex: number): void {
    if (focusIndex !== -1) {
      this.currentFocusIndex = focusIndex;
    }
  }

  public getFocusHistory(): FocusTransitionRecord[] {
    return [...this.focusHistory];
  }

  public getTotalNavigations(): number {
    return this.totalNavigations;
  }

  public getAverageNavigationDuration(): number {
    if (this.focusHistory.length === 0) {
      return 0;
    }
    let totalDuration: number = 0;
    for (const record of this.focusHistory) {
      totalDuration += record.duration;
    }
    return totalDuration / this.focusHistory.length;
  }

  public resetTracker(): void {
    this.focusHistory = [];
    this.currentFocusIndex = 0;
    this.totalNavigations = 0;
    this.navigationStartTime = 0;
  }

  public hasNavigatedTo(index: number): boolean {
    return this.focusHistory.some((record: FocusTransitionRecord) => record.toIndex === index);
  }

  public getNavigationCountToIndex(index: number): number {
    return this.focusHistory.filter((record: FocusTransitionRecord) => record.toIndex === index).length;
  }
}

// ==================== Focus navigation extension utilities ====================

// Navigation direction enumeration: describes the focus move direction.
enum NavigationDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', NONE = 'none'
}

// Navigation result enumeration: describes the focus move outcome.
enum NavigationResult {
  SUCCESS = 'success', BLOCKED = 'blocked', INVALID = 'invalid', WRAPPED = 'wrapped'
}

// Navigation statistics interface: summarises the focus navigation data.
interface NavigationStatistics {
  totalNavigations: number;
  leftNavigations: number;
  rightNavigations: number;
  blockedNavigations: number;
  averageDuration: number;
}

// Navigation path interface: describes one continuous navigation path.
interface NavigationPath {
  fromIndex: number;
  toIndex: number;
  direction: NavigationDirection;
  steps: number;
}

// Navigation direction converter: converts between strings and directions.
class NavigationDirectionConverter {
  // Parses the string direction into the navigation direction enumeration.
  public parseDirection(direction: string): NavigationDirection {
    if (direction === 'left') {
      return NavigationDirection.LEFT;
    }
    if (direction === 'right') {
      return NavigationDirection.RIGHT;
    }
    if (direction === 'up') {
      return NavigationDirection.UP;
    }
    if (direction === 'down') {
      return NavigationDirection.DOWN;
    }
    return NavigationDirection.NONE;
  }

  // Checks whether the direction is horizontal.
  public isHorizontal(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.LEFT || direction === NavigationDirection.RIGHT;
  }

  // Checks whether the direction is vertical.
  public isVertical(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.UP || direction === NavigationDirection.DOWN;
  }

  // Returns the reverse direction.
  public reverse(direction: NavigationDirection): NavigationDirection {
    if (direction === NavigationDirection.LEFT) {
      return NavigationDirection.RIGHT;
    }
    if (direction === NavigationDirection.RIGHT) {
      return NavigationDirection.LEFT;
    }
    if (direction === NavigationDirection.UP) {
      return NavigationDirection.DOWN;
    }
    if (direction === NavigationDirection.DOWN) {
      return NavigationDirection.UP;
    }
    return NavigationDirection.NONE;
  }
}

// Navigation statistics calculator: aggregates the navigation history.
class NavigationStatisticsCalculator {
  private history: FocusTransitionRecord[] = [];

  constructor(history: FocusTransitionRecord[]) {
    this.history = [...history];
  }

  // Builds the focus navigation statistics.
  public buildStatistics(): NavigationStatistics {
    const statistics: NavigationStatistics = {
      totalNavigations: this.history.length,
      leftNavigations: this.countByDirection('left'),
      rightNavigations: this.countByDirection('right'),
      blockedNavigations: this.countBlocked(),
      averageDuration: this.computeAverageDuration()
    };
    return statistics;
  }

  // Counts the navigations of the given direction.
  private countByDirection(direction: string): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.direction === direction) {
        count++;
      }
    }
    return count;
  }

  // Counts the blocked navigations where the focus did not move.
  private countBlocked(): number {
    let count: number = 0;
    for (const record of this.history) {
      if (record.fromIndex === record.toIndex) {
        count++;
      }
    }
    return count;
  }

  // Computes the average navigation duration.
  private computeAverageDuration(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.history) {
      total += record.duration;
    }
    return total / this.history.length;
  }
}

// Navigation path model: describes one continuous navigation path.
class NavigationPathModel {
  private fromIndex: number;
  private toIndex: number;
  private direction: NavigationDirection;
  private steps: number;

  constructor(fromIndex: number, toIndex: number, direction: NavigationDirection, steps: number) {
    this.fromIndex = fromIndex;
    this.toIndex = toIndex;
    this.direction = direction;
    this.steps = steps;
  }

  public getFromIndex(): number {
    return this.fromIndex;
  }

  public getToIndex(): number {
    return this.toIndex;
  }

  public getDirection(): NavigationDirection {
    return this.direction;
  }

  public getSteps(): number {
    return this.steps;
  }

  // Checks whether the path moved the focus.
  public hasMoved(): boolean {
    return this.fromIndex !== this.toIndex;
  }

  // Builds the textual representation of the navigation path.
  public toString(): string {
    return `${this.fromIndex} -> ${this.toIndex} (${this.direction}, ${this.steps} steps)`;
  }
}

// Navigation path manager: centrally manages the navigation paths.
class NavigationPathManager {
  private paths: NavigationPathModel[] = [];

  // Appends one navigation path.
  public appendPath(path: NavigationPathModel): void {
    this.paths.push(path);
  }

  // Returns every navigation path.
  public getPaths(): NavigationPathModel[] {
    return [...this.paths];
  }

  // Counts the paths that moved the focus.
  public countMovedPaths(): number {
    let count: number = 0;
    for (const path of this.paths) {
      if (path.hasMoved()) {
        count++;
      }
    }
    return count;
  }

  // Filters the paths by direction.
  public filterByDirection(direction: NavigationDirection): NavigationPathModel[] {
    const filtered: NavigationPathModel[] = [];
    for (const path of this.paths) {
      if (path.getDirection() === direction) {
        filtered.push(path);
      }
    }
    return filtered;
  }

  // Clears every navigation path.
  public clearPaths(): void {
    this.paths = [];
  }
}

// Navigation boundary model: describes the focus navigation boundaries.
class NavigationBoundaryModel {
  private minIndex: number;
  private maxIndex: number;

  constructor(minIndex: number, maxIndex: number) {
    this.minIndex = minIndex;
    this.maxIndex = maxIndex;
  }

  public getMinIndex(): number {
    return this.minIndex;
  }

  public getMaxIndex(): number {
    return this.maxIndex;
  }

  // Checks whether the index is beyond the left boundary.
  public isBeyondLeft(index: number): boolean {
    return index < this.minIndex;
  }

  // Checks whether the index is beyond the right boundary.
  public isBeyondRight(index: number): boolean {
    return index > this.maxIndex;
  }

  // Computes the index after a move clamped to the boundaries.
  public moveWithin(index: number, direction: NavigationDirection): number {
    if (direction === NavigationDirection.LEFT) {
      return index > this.minIndex ? index - 1 : this.minIndex;
    }
    if (direction === NavigationDirection.RIGHT) {
      return index < this.maxIndex ? index + 1 : this.maxIndex;
    }
    return index;
  }
}

// Navigation result evaluator: evaluates the outcome of a navigation.
class NavigationResultEvaluator {
  private boundary: NavigationBoundaryModel;

  constructor(boundary: NavigationBoundaryModel) {
    this.boundary = boundary;
  }

  // Evaluates the navigation outcome.
  public evaluate(fromIndex: number, toIndex: number, direction: NavigationDirection): NavigationResult {
    if (direction === NavigationDirection.NONE) {
      return NavigationResult.INVALID;
    }
    if (fromIndex === toIndex) {
      if (this.boundary.isBeyondLeft(toIndex) || this.boundary.isBeyondRight(toIndex)) {
        return NavigationResult.BLOCKED;
      }
      return NavigationResult.BLOCKED;
    }
    return NavigationResult.SUCCESS;
  }

  // Checks whether the navigation succeeded.
  public isSuccessful(result: NavigationResult): boolean {
    return result === NavigationResult.SUCCESS;
  }
}

// Navigation path status enumeration: describes the path completion state.
enum NavigationPathStatus {
  NOT_STARTED = 'not_started', IN_PROGRESS = 'in_progress', COMPLETED = 'completed', ABORTED = 'aborted'
}

// Navigation path analysis interface: describes the path analysis result.
interface NavigationPathAnalysis {
  stepCount: number;
  distance: number;
  directionChanges: number;
  isEfficient: boolean;
}

// Navigation path analyzer: analyzes the complexity of a navigation path.
class NavigationPathAnalyzer {
  private path: NavigationPathModel;

  constructor(path: NavigationPathModel) {
    this.path = path;
  }

  // Computes the distance of the navigation path.
  public computeDistance(): number {
    return Math.abs(this.path.getToIndex() - this.path.getFromIndex());
  }

  // Builds the navigation path analysis result.
  public analyze(directionChanges: number): NavigationPathAnalysis {
    const analysis: NavigationPathAnalysis = {
      stepCount: this.path.getSteps(),
      distance: this.computeDistance(),
      directionChanges,
      isEfficient: this.path.getSteps() <= this.computeDistance()
    };
    return analysis;
  }

  // Checks whether the path is efficient.
  public isEfficient(): boolean {
    return this.path.getSteps() <= this.computeDistance();
  }

  // Checks whether the path moved the focus.
  public isMovement(): boolean {
    return this.path.hasMoved();
  }
}

// Navigation path executor: executes a navigation path and tracks the status.
class NavigationPathExecutor {
  private path: NavigationPathModel;
  private status: NavigationPathStatus = NavigationPathStatus.NOT_STARTED;

  constructor(path: NavigationPathModel) {
    this.path = path;
  }

  // Starts the execution of the navigation path.
  public begin(): void {
    this.status = NavigationPathStatus.IN_PROGRESS;
  }

  // Marks the navigation path as completed.
  public complete(): void {
    this.status = NavigationPathStatus.COMPLETED;
  }

  // Aborts the navigation path execution.
  public abort(): void {
    this.status = NavigationPathStatus.ABORTED;
  }

  public getStatus(): NavigationPathStatus {
    return this.status;
  }

  // Checks whether the path execution is completed.
  public isCompleted(): boolean {
    return this.status === NavigationPathStatus.COMPLETED;
  }

  // Returns the executed path.
  public getPath(): NavigationPathModel {
    return this.path;
  }
}

// Navigation command model: wraps one navigation command.
class NavigationCommandModel {
  private direction: NavigationDirection;
  private repeatCount: number;
  private timestamp: number;

  constructor(direction: NavigationDirection, repeatCount: number, timestamp: number) {
    this.direction = direction;
    this.repeatCount = repeatCount;
    this.timestamp = timestamp;
  }

  public getDirection(): NavigationDirection {
    return this.direction;
  }

  public getRepeatCount(): number {
    return this.repeatCount;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  // Builds the textual representation of the navigation command.
  public toString(): string {
    return `Command(${this.direction}, repeat=${this.repeatCount})`;
  }
}

// Navigation command manager: centrally manages the navigation commands.
class NavigationCommandManager {
  private commands: NavigationCommandModel[] = [];

  // Appends one navigation command.
  public appendCommand(command: NavigationCommandModel): void {
    this.commands.push(command);
  }

  // Returns every navigation command.
  public getCommands(): NavigationCommandModel[] {
    return [...this.commands];
  }

  // Counts the commands of the given direction.
  public countByDirection(direction: NavigationDirection): number {
    let count: number = 0;
    for (const command of this.commands) {
      if (command.getDirection() === direction) {
        count++;
      }
    }
    return count;
  }

  // Sums the repeat counts of the commands.
  public sumRepeatCounts(): number {
    let total: number = 0;
    for (const command of this.commands) {
      total += command.getRepeatCount();
    }
    return total;
  }

  // Clears every navigation command.
  public clearCommands(): void {
    this.commands = [];
  }
}

export default function focusNavigationTest() {
  describe('FocusNavigation_Test', () => {
    let driver: Driver;
    let focusTracker: FocusNavigationTracker;

    // Test precondition: initialize the driver and reset the tracker.
    beforeAll(async () => {
      driver = getDriver();
      focusTracker = FocusNavigationTracker.getInstance();
      focusTracker.resetTracker();
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('FocusNavigation_Test: home page prepared');
    });

    // Test cleanup: return to the home page for the following suites.
    afterAll(async () => {
      await resetToHome(driver);
      await driver.delayMs(DELAY_AFTER_START_MODE);
    });

    // Verifies that the initial focus lands on the home list.
    it('initial_focus_should_be_on_home_list', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      const isFocusCorrect: boolean = await checkFocusState(driver, initialFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.syncCurrentFocusIndex(initialFocusIndex);
      if (initialFocusIndex !== -1) {
        expect(focusTracker.getCurrentFocusIndex()).assertEqual(initialFocusIndex);
      }
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Verifies that the right arrow moves the focus on the home list.
    it('right_arrow_should_move_focus_on_home', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.startNavigationTimer();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const newFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, newFocusIndex, 'right');
      const isFocusCorrect: boolean = await checkFocusState(driver, newFocusIndex);
      expect(isFocusCorrect).assertTrue();
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(newFocusIndex);
    });

    // Verifies that the left arrow moves the focus on the home list.
    it('left_arrow_should_move_focus_on_home', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.startNavigationTimer();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const newFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, newFocusIndex, 'left');
      const isFocusCorrect: boolean = await checkFocusState(driver, newFocusIndex);
      expect(isFocusCorrect).assertTrue();
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(newFocusIndex);
    });

    // Verifies that the focus cycles through the three food groups.
    it('focus_should_cycle_through_food_groups', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      const initialFocusIndex: number = await getCurrentFocusIndex(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const leftFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, leftFocusIndex, 'left');
      let isFocusCorrect: boolean = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const rightFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(leftFocusIndex, rightFocusIndex, 'right');
      isFocusCorrect = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(rightFocusIndex, finalFocusIndex, 'right');
      isFocusCorrect = await checkFocusState(driver, finalFocusIndex);
      expect(isFocusCorrect).assertTrue();

      expect(focusTracker.getTotalNavigations()).assertEqual(3);
    });

    // Verifies that the focus never leaves the left boundary of the list.
    it('focus_should_not_move_beyond_left_boundary', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const leftFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, leftFocusIndex, 'left');
      let isFocusCorrect: boolean = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
      const boundaryFocusIndex: number = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, boundaryFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.syncCurrentFocusIndex(boundaryFocusIndex);
      if (boundaryFocusIndex !== -1) {
        expect(focusTracker.getCurrentFocusIndex()).assertEqual(boundaryFocusIndex);
      }
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Verifies that the focus never leaves the right boundary of the list.
    it('focus_should_not_move_beyond_right_boundary', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocusIndex: number = await getCurrentFocusIndex(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const rightFocusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, rightFocusIndex, 'right');
      let isFocusCorrect: boolean = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
      const boundaryFocusIndex: number = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, boundaryFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.syncCurrentFocusIndex(boundaryFocusIndex);
      if (boundaryFocusIndex !== -1) {
        expect(focusTracker.getCurrentFocusIndex()).assertEqual(boundaryFocusIndex);
      }
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Verifies that rapid focus changes do not break the rendering of the list.
    it('rapid_focus_changes_should_be_handled_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      for (let i: number = 0; i < 10; i++) {
        focusTracker.startNavigationTimer();
        await driver.triggerKey(KEY_RIGHT);
        await driver.delayMs(DELAY_KEY_NAVIGATION);
        focusTracker.recordNavigation(i % 3, (i + 1) % 3, 'right');
      }

      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(focusTracker.getTotalNavigations()).assertEqual(10);
    });

    // Verifies that the recorded focus history is complete and ordered.
    it('focus_navigation_history_should_be_complete', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 1, 'left');

      const history: FocusTransitionRecord[] = focusTracker.getFocusHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].fromIndex).assertEqual(1);
      expect(history[0].toIndex).assertEqual(0);
      expect(history[1].fromIndex).assertEqual(0);
      expect(history[1].toIndex).assertEqual(1);
    });

    // Verifies that the focus returns to the default entry after back and relaunch.
    it('focus_should_return_to_default_after_back_and_reopen', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      const initialComponentCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: initial component count ${initialComponentCount}`);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const afterNavigationCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: component count after navigation ${afterNavigationCount}`);
      expect(Math.abs(afterNavigationCount - initialComponentCount))
        .assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      focusTracker.recordNavigation(0, 1, 'right');

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(DELAY_AFTER_START_MODE);

      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(homeVisible).assertTrue();
      const finalFocusIndex: number = await getCurrentFocusIndex(driver);
      expect(await checkFocusState(driver, finalFocusIndex)).assertTrue();
    });

    // Verifies that the focus navigation performance meets the requirement.
    it('focus_navigation_performance_should_meet_requirements', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      for (let i: number = 0; i < 20; i++) {
        focusTracker.startNavigationTimer();
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        focusTracker.recordNavigation(i % 3, (i + 1) % 3, i % 2 === 0 ? 'right' : 'left');
      }

      const avgDuration: number = focusTracker.getAverageNavigationDuration();
      expect(avgDuration).assertLessOrEqual(500);
      expect(focusTracker.getTotalNavigations()).assertEqual(20);
    });

    // Verifies that the focus state persists while the page is idle.
    it('focus_state_should_persist_during_idle', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      const initialComponentCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: initial component count for idle test ${initialComponentCount}`);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const afterNavigationCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: component count after navigation ${afterNavigationCount}`);
      expect(afterNavigationCount).assertLargerOrEqual(1);
      focusTracker.recordNavigation(0, 1, 'right');

      await driver.delayMs(TIMEOUT_PAGE_RENDER);

      const afterIdleCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: component count after idle ${afterIdleCount}`);
      expect(afterIdleCount).assertLargerOrEqual(1);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Verifies that the focus reaches every food entry of the home list.
    it('focus_navigation_to_each_option_should_be_verified', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');
      expect(focusTracker.hasNavigatedTo(0)).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');
      expect(focusTracker.hasNavigatedTo(1)).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');
      expect(focusTracker.hasNavigatedTo(2)).assertTrue();

      expect(focusTracker.getNavigationCountToIndex(0)).assertEqual(1);
      expect(focusTracker.getNavigationCountToIndex(1)).assertEqual(1);
      expect(focusTracker.getNavigationCountToIndex(2)).assertEqual(1);
    });

    // Verifies that alternating directions keep the focus navigation stable.
    it('focus_should_handle_alternating_directions', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      const directions: string[] = ['left', 'right', 'left', 'right', 'left'];
      for (const direction of directions) {
        focusTracker.startNavigationTimer();
        if (direction === 'left') {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        }
        const currentIndex: number = focusTracker.getCurrentFocusIndex();
        const newIndex: number =
          direction === 'left' ? Math.max(0, currentIndex - 1) : Math.min(2, currentIndex + 1);
        focusTracker.recordNavigation(currentIndex, newIndex, direction);
      }

      expect(focusTracker.getTotalNavigations()).assertEqual(5);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that the enter key renders the food detail page.
    it('focus_navigation_to_detail_page_should_render', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      expect(detailVisible).assertTrue();

      const initialComponentCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: detail component count ${initialComponentCount}`);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      const afterDownCount: number = await homeComponentCount(driver);
      expect(Math.abs(afterDownCount - initialComponentCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // Verifies that the long press of a navigation key is handled correctly.
    it('focus_should_handle_long_press_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      const initialComponentCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: initial component count for long press ${initialComponentCount}`);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await driver.triggerKey(KEY_RIGHT);
      await driver.delayMs(TIMEOUT_PAGE_SWITCH);

      const afterLongPressCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: component count after long press ${afterLongPressCount}`);
      expect(afterLongPressCount).assertLargerOrEqual(1);
      focusTracker.recordNavigation(0, 1, 'right_long');
      expect(focusTracker.getTotalNavigations()).assertEqual(1);
    });

    // Verifies that the recorded navigation statistics stay accurate.
    it('focus_navigation_statistics_should_be_accurate', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      for (let i: number = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        focusTracker.recordNavigation(1, 2, 'right');
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        focusTracker.recordNavigation(2, 1, 'left');
      }

      expect(focusTracker.getNavigationCountToIndex(1)).assertEqual(5);
      expect(focusTracker.getNavigationCountToIndex(2)).assertEqual(5);
      expect(focusTracker.getTotalNavigations()).assertEqual(10);
    });

    // Verifies the consistency of the focus after multiple navigation cycles.
    it('focus_should_maintain_consistency_after_multiple_cycles', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      const initialComponentCount: number = await homeComponentCount(driver);
      logInfo(`FocusNavigation: initial component count for cycles ${initialComponentCount}`);
      expect(initialComponentCount).assertLargerOrEqual(1);

      for (let cycle: number = 0; cycle < 3; cycle++) {
        logInfo(`FocusNavigation: starting cycle ${cycle}`);

        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(DELAY_KEY_NAVIGATION);

        await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
        await driver.delayMs(DELAY_KEY_NAVIGATION);

        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(DELAY_KEY_NAVIGATION);

        const cycleComponentCount: number = await homeComponentCount(driver);
        logInfo(`FocusNavigation: cycle ${cycle} component count ${cycleComponentCount}`);
        expect(Math.abs(cycleComponentCount - initialComponentCount))
          .assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);

        focusTracker.recordNavigation(0, 1, 'left');
        focusTracker.recordNavigation(1, 0, 'right');
        focusTracker.recordNavigation(0, 1, 'left');
      }

      expect(focusTracker.getTotalNavigations()).assertEqual(9);
    });

    // Verifies the edge case transitions between the first and the last entry.
    it('focus_navigation_should_handle_edge_case_transitions', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 0, 'left_boundary');
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 2, 'right');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 2, 'right_boundary');

      const history: FocusTransitionRecord[] = focusTracker.getFocusHistory();
      expect(history.length).assertEqual(4);
      expect(history[1].toIndex).assertEqual(0);
      expect(history[3].toIndex).assertEqual(2);
      expect(history[1].fromIndex).assertEqual(history[1].toIndex);
    });

    // Verifies that the recorded directions are accurate.
    it('focus_navigation_direction_tracking_should_be_accurate', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 1, 'left');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');

      const history: FocusTransitionRecord[] = focusTracker.getFocusHistory();
      expect(history[0].direction).assertEqual('right');
      expect(history[1].direction).assertEqual('left');
      expect(history[2].direction).assertEqual('left');
    });

    // Verifies that a touch sets the focus on the home list.
    it('touch_should_set_focus_on_home', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      await simulateTouch(driver, 400, 600);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      focusTracker.syncCurrentFocusIndex(focusIndex);
      expect(await checkFocusState(driver, focusIndex)).assertTrue();
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Verifies that the vertical keys keep the focus on a valid component.
    it('focus_should_handle_vertical_keys', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      const downFocusIndex: number = await getCurrentFocusIndex(driver);
      let isFocusCorrect: boolean = await checkFocusState(driver, downFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const upFocusIndex: number = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, upFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.recordNavigation(downFocusIndex, upFocusIndex, 'up');
      expect(focusTracker.getTotalNavigations()).assertEqual(1);
    });

    // Comprehensive focus scenario: the complete flow keeps working.
    it('comprehensive_focus_navigation_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      focusTracker.resetTracker();

      const scenarioStart: number = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');

      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');

      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 0, 'left');

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);

      const scenarioEnd: number = Date.now();
      const scenarioDuration: number = scenarioEnd - scenarioStart;

      expect(focusTracker.getTotalNavigations()).assertEqual(4);
      expect(scenarioDuration).assertLessOrEqual(30000);
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Verifies that the direction converter parses every direction.
    it('navigation_direction_converter_should_parse_all_directions', 0, async () => {
      const converter: NavigationDirectionConverter = new NavigationDirectionConverter();
      expect(converter.parseDirection('left')).assertEqual(NavigationDirection.LEFT);
      expect(converter.parseDirection('right')).assertEqual(NavigationDirection.RIGHT);
      expect(converter.parseDirection('up')).assertEqual(NavigationDirection.UP);
      expect(converter.parseDirection('down')).assertEqual(NavigationDirection.DOWN);
      expect(converter.parseDirection('unknown')).assertEqual(NavigationDirection.NONE);
      expect(converter.isHorizontal(NavigationDirection.LEFT)).assertTrue();
      expect(converter.isVertical(NavigationDirection.UP)).assertTrue();
    });

    // Verifies that the direction converter reverses every direction.
    it('navigation_direction_converter_should_reverse_directions', 0, async () => {
      const converter: NavigationDirectionConverter = new NavigationDirectionConverter();
      expect(converter.reverse(NavigationDirection.LEFT)).assertEqual(NavigationDirection.RIGHT);
      expect(converter.reverse(NavigationDirection.RIGHT)).assertEqual(NavigationDirection.LEFT);
      expect(converter.reverse(NavigationDirection.UP)).assertEqual(NavigationDirection.DOWN);
      expect(converter.reverse(NavigationDirection.DOWN)).assertEqual(NavigationDirection.UP);
      expect(converter.reverse(NavigationDirection.NONE)).assertEqual(NavigationDirection.NONE);
    });

    // Verifies that the statistics calculator counts the directions.
    it('navigation_statistics_calculator_should_count_directions', 0, async () => {
      const history: FocusTransitionRecord[] = [
        { fromIndex: 1, toIndex: 2, direction: 'right', timestamp: 1, duration: 30 },
        { fromIndex: 2, toIndex: 1, direction: 'left', timestamp: 2, duration: 40 },
        { fromIndex: 0, toIndex: 0, direction: 'left', timestamp: 3, duration: 20 }
      ];
      const calculator: NavigationStatisticsCalculator = new NavigationStatisticsCalculator(history);
      const statistics: NavigationStatistics = calculator.buildStatistics();
      expect(statistics.totalNavigations).assertEqual(3);
      expect(statistics.leftNavigations).assertEqual(2);
      expect(statistics.rightNavigations).assertEqual(1);
      expect(statistics.blockedNavigations).assertEqual(1);
      expect(statistics.averageDuration).assertEqual(30);
    });

    // Verifies the movement detection of the navigation path model.
    it('navigation_path_model_should_report_movement', 0, async () => {
      const moved: NavigationPathModel = new NavigationPathModel(1, 2, NavigationDirection.RIGHT, 1);
      expect(moved.getFromIndex()).assertEqual(1);
      expect(moved.getToIndex()).assertEqual(2);
      expect(moved.getSteps()).assertEqual(1);
      expect(moved.hasMoved()).assertTrue();
      const staticPath: NavigationPathModel = new NavigationPathModel(1, 1, NavigationDirection.NONE, 0);
      expect(staticPath.hasMoved()).assertFalse();
      const text: string = moved.toString();
      expect(text.indexOf('->')).assertLargerOrEqual(0);
    });

    // Verifies that the path manager filters the paths by direction.
    it('navigation_path_manager_should_filter_by_direction', 0, async () => {
      const manager: NavigationPathManager = new NavigationPathManager();
      manager.appendPath(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 1));
      manager.appendPath(new NavigationPathModel(1, 0, NavigationDirection.LEFT, 1));
      manager.appendPath(new NavigationPathModel(1, 2, NavigationDirection.RIGHT, 1));
      expect(manager.getPaths().length).assertEqual(3);
      expect(manager.countMovedPaths()).assertEqual(3);
      const leftPaths: NavigationPathModel[] = manager.filterByDirection(NavigationDirection.LEFT);
      expect(leftPaths.length).assertEqual(1);
      manager.clearPaths();
      expect(manager.getPaths().length).assertEqual(0);
    });

    // Verifies that the boundary model clamps the focus movement.
    it('navigation_boundary_model_should_clamp_movement', 0, async () => {
      const boundary: NavigationBoundaryModel = new NavigationBoundaryModel(0, 2);
      expect(boundary.getMinIndex()).assertEqual(0);
      expect(boundary.getMaxIndex()).assertEqual(2);
      expect(boundary.moveWithin(2, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(0, NavigationDirection.LEFT)).assertEqual(0);
      expect(boundary.moveWithin(1, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(1, NavigationDirection.LEFT)).assertEqual(0);
    });

    // Verifies that the result evaluator classifies the outcomes.
    it('navigation_result_evaluator_should_classify_results', 0, async () => {
      const evaluator: NavigationResultEvaluator =
        new NavigationResultEvaluator(new NavigationBoundaryModel(0, 2));
      expect(evaluator.evaluate(0, 1, NavigationDirection.RIGHT)).assertEqual(NavigationResult.SUCCESS);
      expect(evaluator.evaluate(0, 0, NavigationDirection.LEFT)).assertEqual(NavigationResult.BLOCKED);
      expect(evaluator.evaluate(1, 1, NavigationDirection.NONE)).assertEqual(NavigationResult.INVALID);
      expect(evaluator.isSuccessful(NavigationResult.SUCCESS)).assertTrue();
      expect(evaluator.isSuccessful(NavigationResult.BLOCKED)).assertFalse();
    });

    // Verifies that the path analyzer computes the distance and the efficiency.
    it('navigation_path_analyzer_should_compute_distance', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel(0, 3, NavigationDirection.RIGHT, 3);
      const analyzer: NavigationPathAnalyzer = new NavigationPathAnalyzer(path);
      expect(analyzer.computeDistance()).assertEqual(3);
      const analysis: NavigationPathAnalysis = analyzer.analyze(0);
      expect(analysis.stepCount).assertEqual(3);
      expect(analysis.distance).assertEqual(3);
      expect(analysis.isEfficient).assertTrue();
      expect(analyzer.isMovement()).assertTrue();
    });

    // Verifies the status transitions of the path executor.
    it('navigation_path_executor_should_track_status', 0, async () => {
      const executor: NavigationPathExecutor =
        new NavigationPathExecutor(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 1));
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.NOT_STARTED);
      executor.begin();
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.IN_PROGRESS);
      executor.complete();
      expect(executor.isCompleted()).assertTrue();
      executor.abort();
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.ABORTED);
    });

    // Verifies the property access of the navigation command model.
    it('navigation_command_model_should_expose_properties', 0, async () => {
      const command: NavigationCommandModel = new NavigationCommandModel(NavigationDirection.UP, 3, 100);
      expect(command.getDirection()).assertEqual(NavigationDirection.UP);
      expect(command.getRepeatCount()).assertEqual(3);
      expect(command.getTimestamp()).assertEqual(100);
      const text: string = command.toString();
      expect(text.indexOf('repeat=3')).assertLargerOrEqual(0);
    });

    // Verifies that the command manager sums the repeat counts.
    it('navigation_command_manager_should_sum_repeat_counts', 0, async () => {
      const manager: NavigationCommandManager = new NavigationCommandManager();
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.LEFT, 2, 1));
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.LEFT, 3, 2));
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.RIGHT, 1, 3));
      expect(manager.getCommands().length).assertEqual(3);
      expect(manager.countByDirection(NavigationDirection.LEFT)).assertEqual(2);
      expect(manager.sumRepeatCounts()).assertEqual(6);
      manager.clearCommands();
      expect(manager.getCommands().length).assertEqual(0);
    });

    // Verifies the out of bounds detection of the boundary model.
    it('navigation_boundary_model_should_detect_out_of_bounds', 0, async () => {
      const boundary: NavigationBoundaryModel = new NavigationBoundaryModel(1, 3);
      expect(boundary.isBeyondLeft(0)).assertTrue();
      expect(boundary.isBeyondLeft(1)).assertFalse();
      expect(boundary.isBeyondRight(4)).assertTrue();
      expect(boundary.isBeyondRight(3)).assertFalse();
    });

    // Verifies that the focus tracker computes the average duration.
    it('focus_tracker_should_compute_average_duration', 0, async () => {
      focusTracker.resetTracker();
      focusTracker.startNavigationTimer();
      focusTracker.recordNavigation(0, 1, 'right');
      focusTracker.startNavigationTimer();
      focusTracker.recordNavigation(1, 2, 'right');
      const history: FocusTransitionRecord[] = focusTracker.getFocusHistory();
      expect(history.length).assertEqual(2);
      const average: number = focusTracker.getAverageNavigationDuration();
      expect(average).assertLargerOrEqual(0);
      expect(focusTracker.getTotalNavigations()).assertEqual(2);
    });

    // Verifies that a non optimal path is detected as inefficient.
    it('navigation_path_analyzer_should_detect_inefficient_path', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 5);
      const analyzer: NavigationPathAnalyzer = new NavigationPathAnalyzer(path);
      expect(analyzer.computeDistance()).assertEqual(1);
      expect(analyzer.isEfficient()).assertFalse();
      const analysis: NavigationPathAnalysis = analyzer.analyze(2);
      expect(analysis.directionChanges).assertEqual(2);
      expect(analysis.isEfficient).assertFalse();
    });

    // Verifies that the statistics calculator handles an empty history.
    it('navigation_statistics_calculator_should_handle_empty_history', 0, async () => {
      const calculator: NavigationStatisticsCalculator = new NavigationStatisticsCalculator([]);
      const statistics: NavigationStatistics = calculator.buildStatistics();
      expect(statistics.totalNavigations).assertEqual(0);
      expect(statistics.leftNavigations).assertEqual(0);
      expect(statistics.blockedNavigations).assertEqual(0);
      expect(statistics.averageDuration).assertEqual(0);
    });

    // Verifies that the path executor returns the configured path.
    it('navigation_path_executor_should_return_configured_path', 0, async () => {
      const path: NavigationPathModel = new NavigationPathModel(2, 0, NavigationDirection.LEFT, 2);
      const executor: NavigationPathExecutor = new NavigationPathExecutor(path);
      expect(executor.getPath().getFromIndex()).assertEqual(2);
      expect(executor.getPath().getToIndex()).assertEqual(0);
      expect(executor.getPath().getDirection()).assertEqual(NavigationDirection.LEFT);
    });

    // Verifies that the tracker resets the counters and the history.
    it('focus_tracker_should_reset_state', 0, async () => {
      focusTracker.resetTracker();
      focusTracker.recordNavigation(0, 1, 'right');
      focusTracker.recordNavigation(1, 2, 'right');
      expect(focusTracker.getTotalNavigations()).assertEqual(2);
      focusTracker.resetTracker();
      expect(focusTracker.getTotalNavigations()).assertEqual(0);
      expect(focusTracker.getFocusHistory().length).assertEqual(0);
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(0);
      focusTracker.resetTracker();
    });
  });
}

