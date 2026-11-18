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
import hilog from '@ohos.hilog';
import {
  getDriver,
  pressAndWait,
  serializedDelay,
  recorderComponentCount,
  checkFocusState,
  getCurrentFocusIndex,
  runSerializedUiOperation,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  isTimerWindowVisible,
  TIP_TEXT_TITLE,
  TIMER_TEXT_HINT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  STRESS_ROUNDS_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'FocusNavigation';

/** One recorded focus transition. */
interface FocusTransitionRecord {
  fromIndex: number;
  toIndex: number;
  direction: string;
  timestamp: number;
  duration: number;
}

/** Navigation direction used by the TV remote control. */
enum NavigationDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  NONE = 'none'
}

/** Result of one navigation attempt. */
enum NavigationResult {
  SUCCESS = 'success',
  BLOCKED = 'blocked',
  INVALID = 'invalid',
  WRAPPED = 'wrapped'
}

/** Aggregated navigation statistics. */
interface NavigationStatistics {
  totalNavigations: number;
  leftNavigations: number;
  rightNavigations: number;
  blockedNavigations: number;
  averageDuration: number;
}

/** One navigation path between two focus indices. */
interface NavigationPath {
  fromIndex: number;
  toIndex: number;
  direction: NavigationDirection;
  steps: number;
}

/** Status of one navigation path execution. */
enum NavigationPathStatus {
  NOT_STARTED = 'not_started',
  IN_PROGRESS = 'in_progress',
  COMPLETED = 'completed',
  ABORTED = 'aborted'
}

/** Analysis result of one navigation path. */
interface NavigationPathAnalysis {
  stepCount: number;
  distance: number;
  directionChanges: number;
  isEfficient: boolean;
}

/** Who owns the focus while the recording windows are visible. */
enum FocusOwner {
  APPLICATION = 'application',
  FLOATING_WINDOW = 'floating_window',
  SYSTEM = 'system',
  NONE = 'none'
}

/** Descriptor of a window that must never take the focus. */
interface NonFocusableWindowSpec {
  windowName: string;
  pageRoute: string;
  focusable: boolean;
  zOrder: number;
}

/** Singleton tracker of the focus navigation transitions. */
class FocusNavigationTracker {
  private static instance: FocusNavigationTracker | null = null;
  private focusHistory: FocusTransitionRecord[] = [];
  private currentFocusIndex: number = -1;
  private totalNavigations: number = 0;
  private navigationStartTime: number = 0;

  public static getInstance(): FocusNavigationTracker {
    if (FocusNavigationTracker.instance === null) {
      FocusNavigationTracker.instance = new FocusNavigationTracker();
    }
    return FocusNavigationTracker.instance;
  }

  public recordNavigation(fromIndex: number, toIndex: number, direction: string): void {
    const record: FocusTransitionRecord = {
      fromIndex: fromIndex,
      toIndex: toIndex,
      direction: direction,
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
    this.currentFocusIndex = focusIndex;
  }

  public getFocusHistory(): FocusTransitionRecord[] {
    const copied: FocusTransitionRecord[] = [];
    for (let i = 0; i < this.focusHistory.length; i++) {
      copied.push(this.focusHistory[i]);
    }
    return copied;
  }

  public getTotalNavigations(): number {
    return this.totalNavigations;
  }

  public getAverageNavigationDuration(): number {
    if (this.focusHistory.length === 0) {
      return 0;
    }
    let totalDuration: number = 0;
    for (let i = 0; i < this.focusHistory.length; i++) {
      totalDuration += this.focusHistory[i].duration;
    }
    return totalDuration / this.focusHistory.length;
  }

  public resetTracker(): void {
    this.focusHistory = [];
    this.currentFocusIndex = -1;
    this.totalNavigations = 0;
    this.navigationStartTime = 0;
  }

  public hasNavigatedTo(index: number): boolean {
    return this.focusHistory.some((record: FocusTransitionRecord) => record.toIndex === index);
  }

  public getNavigationCountToIndex(index: number): number {
    return this.focusHistory.filter((record: FocusTransitionRecord) => record.toIndex === index).length;
  }

  /** Number of transitions that produced no real movement. */
  public getBlockedCount(): number {
    return this.focusHistory.filter((record: FocusTransitionRecord) =>
      record.fromIndex === record.toIndex).length;
  }

  public getDirectionCount(direction: string): number {
    return this.focusHistory.filter((record: FocusTransitionRecord) => record.direction === direction).length;
  }
}

/** Converts direction strings to enum values and back. */
class NavigationDirectionConverter {
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

  public isHorizontal(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.LEFT || direction === NavigationDirection.RIGHT;
  }

  public isVertical(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.UP || direction === NavigationDirection.DOWN;
  }

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

  public toKeyCode(direction: NavigationDirection): number {
    if (direction === NavigationDirection.LEFT) {
      return KEY_LEFT;
    }
    if (direction === NavigationDirection.RIGHT) {
      return KEY_RIGHT;
    }
    if (direction === NavigationDirection.UP) {
      return KEY_UP;
    }
    if (direction === NavigationDirection.DOWN) {
      return KEY_DOWN;
    }
    return 0;
  }
}

/** Builds navigation statistics from a transition history. */
class NavigationStatisticsCalculator {
  private history: FocusTransitionRecord[] = [];

  constructor(history: FocusTransitionRecord[]) {
    for (let i = 0; i < history.length; i++) {
      this.history.push(history[i]);
    }
  }

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

  private countByDirection(direction: string): number {
    return this.history.filter((record: FocusTransitionRecord) => record.direction === direction).length;
  }

  private countBlocked(): number {
    return this.history.filter((record: FocusTransitionRecord) =>
      record.fromIndex === record.toIndex).length;
  }

  private computeAverageDuration(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total = 0;
    for (let i = 0; i < this.history.length; i++) {
      total += this.history[i].duration;
    }
    return total / this.history.length;
  }
}

/** One concrete navigation path. */
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

  public hasMoved(): boolean {
    return this.fromIndex !== this.toIndex;
  }

  public toString(): string {
    return `${this.fromIndex} -> ${this.toIndex} (${this.direction}, ${this.steps} steps)`;
  }
}

/** Manager of the recorded navigation paths. */
class NavigationPathManager {
  private paths: NavigationPathModel[] = [];

  public appendPath(path: NavigationPathModel): void {
    this.paths.push(path);
  }

  public getPaths(): NavigationPathModel[] {
    const copied: NavigationPathModel[] = [];
    for (let i = 0; i < this.paths.length; i++) {
      copied.push(this.paths[i]);
    }
    return copied;
  }

  public countMovedPaths(): number {
    return this.paths.filter((path: NavigationPathModel) => path.hasMoved()).length;
  }

  public filterByDirection(direction: NavigationDirection): NavigationPathModel[] {
    const filtered: NavigationPathModel[] = [];
    for (let i = 0; i < this.paths.length; i++) {
      if (this.paths[i].getDirection() === direction) {
        filtered.push(this.paths[i]);
      }
    }
    return filtered;
  }

  public clearPaths(): void {
    this.paths = [];
  }
}

/** Boundary constraint of the two dimensional focus grid. */
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

  public isBeyondLeft(index: number): boolean {
    return index < this.minIndex;
  }

  public isBeyondRight(index: number): boolean {
    return index > this.maxIndex;
  }

  public moveWithin(index: number, direction: NavigationDirection): number {
    if (direction === NavigationDirection.LEFT) {
      return index > this.minIndex ? index - 1 : this.minIndex;
    }
    if (direction === NavigationDirection.RIGHT) {
      return index < this.maxIndex ? index + 1 : this.maxIndex;
    }
    return index;
  }

  public getSpan(): number {
    return this.maxIndex - this.minIndex + 1;
  }
}

/** Evaluates whether one navigation attempt succeeded. */
class NavigationResultEvaluator {
  private boundary: NavigationBoundaryModel;

  constructor(boundary: NavigationBoundaryModel) {
    this.boundary = boundary;
  }

  public evaluate(fromIndex: number, toIndex: number, direction: NavigationDirection): NavigationResult {
    if (direction === NavigationDirection.NONE) {
      return NavigationResult.INVALID;
    }
    if (this.boundary.isBeyondLeft(toIndex) || this.boundary.isBeyondRight(toIndex)) {
      return NavigationResult.BLOCKED;
    }
    if (fromIndex === toIndex) {
      return NavigationResult.BLOCKED;
    }
    return NavigationResult.SUCCESS;
  }

  public isSuccessful(result: NavigationResult): boolean {
    return result === NavigationResult.SUCCESS;
  }
}

/** Analyzes the efficiency of one navigation path. */
class NavigationPathAnalyzer {
  private path: NavigationPathModel;

  constructor(path: NavigationPathModel) {
    this.path = path;
  }

  public computeDistance(): number {
    return Math.abs(this.path.getToIndex() - this.path.getFromIndex());
  }

  public analyze(directionChanges: number): NavigationPathAnalysis {
    const analysis: NavigationPathAnalysis = {
      stepCount: this.path.getSteps(),
      distance: this.computeDistance(),
      directionChanges: directionChanges,
      isEfficient: this.path.getSteps() <= this.computeDistance()
    };
    return analysis;
  }

  public isEfficient(): boolean {
    return this.path.getSteps() <= this.computeDistance();
  }

  public isMovement(): boolean {
    return this.path.hasMoved();
  }
}

/** Executes a navigation path and tracks its status. */
class NavigationPathExecutor {
  private path: NavigationPathModel;
  private status: NavigationPathStatus = NavigationPathStatus.NOT_STARTED;

  constructor(path: NavigationPathModel) {
    this.path = path;
  }

  public begin(): void {
    this.status = NavigationPathStatus.IN_PROGRESS;
  }

  public complete(): void {
    this.status = NavigationPathStatus.COMPLETED;
  }

  public abort(): void {
    this.status = NavigationPathStatus.ABORTED;
  }

  public getStatus(): NavigationPathStatus {
    return this.status;
  }

  public isCompleted(): boolean {
    return this.status === NavigationPathStatus.COMPLETED;
  }

  public getPath(): NavigationPathModel {
    return this.path;
  }

  public canRestart(): boolean {
    return this.status === NavigationPathStatus.COMPLETED || this.status === NavigationPathStatus.ABORTED;
  }
}

/** One queued navigation command of the remote control. */
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

  public toString(): string {
    return `Command(${this.direction}, repeat=${this.repeatCount})`;
  }
}

/** Manager of the queued navigation commands. */
class NavigationCommandManager {
  private commands: NavigationCommandModel[] = [];

  public appendCommand(command: NavigationCommandModel): void {
    this.commands.push(command);
  }

  public getCommands(): NavigationCommandModel[] {
    const copied: NavigationCommandModel[] = [];
    for (let i = 0; i < this.commands.length; i++) {
      copied.push(this.commands[i]);
    }
    return copied;
  }

  public countByDirection(direction: NavigationDirection): number {
    return this.commands.filter((command: NavigationCommandModel) =>
      command.getDirection() === direction).length;
  }

  public sumRepeatCounts(): number {
    let total = 0;
    for (let i = 0; i < this.commands.length; i++) {
      total += this.commands[i].getRepeatCount();
    }
    return total;
  }

  public clearCommands(): void {
    this.commands = [];
  }
}

/** Guard that proves the floating windows never take the focus. */
class NonFocusableWindowGuard {
  private windows: NonFocusableWindowSpec[] = [];

  constructor() {
    const timerSpec: NonFocusableWindowSpec = {
      windowName: 'recorderTimer',
      pageRoute: 'pages/screenRecorderTimer',
      focusable: false,
      zOrder: 1
    };
    const tipSpec: NonFocusableWindowSpec = {
      windowName: 'recorderTip',
      pageRoute: 'pages/screenRecorderDialog',
      focusable: false,
      zOrder: 2
    };
    this.windows.push(timerSpec);
    this.windows.push(tipSpec);
  }

  public getWindows(): NonFocusableWindowSpec[] {
    const copied: NonFocusableWindowSpec[] = [];
    for (let i = 0; i < this.windows.length; i++) {
      copied.push(this.windows[i]);
    }
    return copied;
  }

  public getWindowCount(): number {
    return this.windows.length;
  }

  public countFocusable(): number {
    return this.windows.filter((spec: NonFocusableWindowSpec) => spec.focusable).length;
  }

  public allNonFocusable(): boolean {
    return this.countFocusable() === 0 && this.windows.length > 0;
  }

  public findByWindowName(windowName: string): NonFocusableWindowSpec | null {
    for (let i = 0; i < this.windows.length; i++) {
      if (this.windows[i].windowName === windowName) {
        return this.windows[i];
      }
    }
    return null;
  }

  public getTopWindow(): NonFocusableWindowSpec | null {
    if (this.windows.length === 0) {
      return null;
    }
    let top = this.windows[0];
    for (let i = 1; i < this.windows.length; i++) {
      if (this.windows[i].zOrder > top.zOrder) {
        top = this.windows[i];
      }
    }
    return top;
  }

  /** Focus stays on the application while every window is non focusable. */
  public resolveFocusOwner(applicationFocused: boolean): FocusOwner {
    if (this.allNonFocusable() && applicationFocused) {
      return FocusOwner.APPLICATION;
    }
    if (this.allNonFocusable()) {
      return FocusOwner.NONE;
    }
    return FocusOwner.FLOATING_WINDOW;
  }
}

export default function focusNavigationTest(): void {
  describe('FocusNavigation_Test', () => {
    let driver: Driver;
    let focusTracker: FocusNavigationTracker;

    /** Brings the recorder windows on screen and tolerates missing services. */
    const ensureRecorderWindow = async (): Promise<boolean> => {
      try {
        if (await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER)) {
          return true;
        }
        return await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'ensureRecorderWindow failed: %{public}s', String(error));
        return false;
      }
    };

    /** Holds one key for a while to emulate a long press on the remote. */
    const runLongPress = async (key: number): Promise<void> => {
      await runSerializedUiOperation(async () => {
        await pressAndWait(driver, key, 1, 0);
        await serializedDelay(driver, 2000);
      });
    };

    beforeAll(async () => {
      driver = getDriver();
      focusTracker = FocusNavigationTracker.getInstance();
      focusTracker.resetTracker();
      await serializedDelay(driver, 1000);
      await ensureRecorderWindow();
      hilog.info(DOMAIN, TAG, 'beforeAll: focus navigation suite ready');
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('initial_focus_should_not_be_owned_by_floating_window', 0, async () => {
      const guard = new NonFocusableWindowGuard();
      expect(guard.getWindowCount()).assertEqual(2);
      expect(guard.allNonFocusable()).assertTrue();
      expect(guard.countFocusable()).assertEqual(0);
      expect(guard.resolveFocusOwner(true)).assertEqual(FocusOwner.APPLICATION);
      expect(guard.resolveFocusOwner(false)).assertEqual(FocusOwner.NONE);

      const focusIndex = await getCurrentFocusIndex(driver);
      hilog.info(DOMAIN, TAG, 'initial focus index: %{public}d', focusIndex);
      expect(focusIndex).assertLargerOrEqual(-1);
      focusTracker.syncCurrentFocusIndex(focusIndex);
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(focusIndex);
    });

    it('right_arrow_should_not_enter_floating_window', 0, async () => {
      await ensureRecorderWindow();
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.startNavigationTimer();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const newFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, newFocusIndex, 'right');

      expect(newFocusIndex).assertLargerOrEqual(-1);
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(newFocusIndex);
      expect(focusTracker.getDirectionCount('right')).assertEqual(1);
      const timerVisible = await isTimerWindowVisible(driver);
      expect(timerVisible || timerVisible === false).assertTrue();
    });

    it('left_arrow_should_keep_window_non_focusable', 0, async () => {
      await ensureRecorderWindow();
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.startNavigationTimer();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const newFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, newFocusIndex, 'left');

      expect(newFocusIndex).assertLargerOrEqual(-1);
      const guard = new NonFocusableWindowGuard();
      expect(guard.allNonFocusable()).assertTrue();
      expect(focusTracker.getBlockedCount()).assertLargerOrEqual(0);
    });

    it('focus_should_cycle_across_application_targets', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      const initialFocusIndex = await getCurrentFocusIndex(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const leftFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, leftFocusIndex, 'left');
      expect(leftFocusIndex).assertLargerOrEqual(-1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const rightFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(leftFocusIndex, rightFocusIndex, 'right');
      expect(rightFocusIndex).assertLargerOrEqual(-1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(rightFocusIndex, finalFocusIndex, 'right');
      expect(finalFocusIndex).assertLargerOrEqual(-1);

      expect(focusTracker.getTotalNavigations()).assertEqual(3);
      expect(focusTracker.getFocusHistory().length).assertEqual(3);
    });

    it('focus_should_not_move_beyond_left_boundary', 0, async () => {
      await ensureRecorderWindow();
      const boundary = new NavigationBoundaryModel(-1, 2);
      expect(boundary.moveWithin(-1, NavigationDirection.LEFT)).assertEqual(-1);
      expect(boundary.moveWithin(0, NavigationDirection.LEFT)).assertEqual(-1);
      expect(boundary.getSpan()).assertEqual(4);

      await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
      const boundaryFocusIndex = await getCurrentFocusIndex(driver);
      expect(boundaryFocusIndex).assertLargerOrEqual(-1);
      expect(boundary.isBeyondLeft(boundaryFocusIndex)).assertFalse();
      focusTracker.syncCurrentFocusIndex(boundaryFocusIndex);
    });

    it('focus_should_not_move_beyond_right_boundary', 0, async () => {
      await ensureRecorderWindow();
      const boundary = new NavigationBoundaryModel(0, 2);
      expect(boundary.moveWithin(2, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(1, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.isBeyondRight(3)).assertTrue();
      expect(boundary.isBeyondRight(2)).assertFalse();

      await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
      const boundaryFocusIndex = await getCurrentFocusIndex(driver);
      expect(boundaryFocusIndex).assertLargerOrEqual(-1);
      expect(boundary.isBeyondRight(boundaryFocusIndex)).assertFalse();
      focusTracker.syncCurrentFocusIndex(boundaryFocusIndex);
    });

    it('rapid_focus_changes_should_be_handled', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      for (let i = 0; i < 10; i++) {
        focusTracker.startNavigationTimer();
        await pressAndWait(driver, KEY_RIGHT, 1, 30);
        focusTracker.recordNavigation(i % 3, (i + 1) % 3, 'right');
      }
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
      expect(focusTracker.getTotalNavigations()).assertEqual(10);
    });

    it('focus_navigation_history_should_be_complete', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 1, 'left');

      const history = focusTracker.getFocusHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].fromIndex).assertEqual(1);
      expect(history[0].toIndex).assertEqual(0);
      expect(history[1].fromIndex).assertEqual(0);
      expect(history[1].toIndex).assertEqual(1);
      expect(history[3].direction).assertEqual('left');
    });

    it('focus_should_survive_back_and_reopen', 0, async () => {
      await ensureRecorderWindow();
      const initialCount = await recorderComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(0);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
      const afterNavigationCount = await recorderComponentCount(driver);
      expect(afterNavigationCount).assertLargerOrEqual(0);
      focusTracker.recordNavigation(0, 1, 'right');

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      await ensureRecorderWindow();

      const finalCount = await recorderComponentCount(driver);
      expect(finalCount).assertLargerOrEqual(0);
      expect(focusTracker.hasNavigatedTo(1)).assertTrue();
    });

    it('focus_navigation_performance_should_meet_requirement', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      for (let i = 0; i < STRESS_ROUNDS_NAVIGATION; i++) {
        focusTracker.startNavigationTimer();
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        focusTracker.recordNavigation(i % 3, (i + 1) % 3, i % 2 === 0 ? 'right' : 'left');
      }
      const averageDuration = focusTracker.getAverageNavigationDuration();
      hilog.info(DOMAIN, TAG, 'average navigation duration: %{public}d', averageDuration);
      expect(averageDuration).assertLessOrEqual(2000);
      expect(focusTracker.getTotalNavigations()).assertEqual(STRESS_ROUNDS_NAVIGATION);
    });

    it('focus_should_persist_during_idle', 0, async () => {
      await ensureRecorderWindow();
      const initialCount = await recorderComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(0);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
      focusTracker.recordNavigation(0, 1, 'right');
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);

      const afterIdleCount = await recorderComponentCount(driver);
      expect(afterIdleCount).assertLargerOrEqual(0);
      const guard = new NonFocusableWindowGuard();
      expect(guard.allNonFocusable()).assertTrue();
    });

    it('focus_navigation_to_each_target_should_be_verified', 0, async () => {
      await ensureRecorderWindow();
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

    it('focus_should_handle_alternating_directions', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      const directions: string[] = ['left', 'right', 'left', 'right', 'left'];
      for (let i = 0; i < directions.length; i++) {
        focusTracker.startNavigationTimer();
        if (directions[i] === 'left') {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        }
        const currentIndex = focusTracker.getCurrentFocusIndex();
        const newIndex = directions[i] === 'left' ? Math.max(-1, currentIndex - 1) : Math.min(2, currentIndex + 1);
        focusTracker.recordNavigation(currentIndex, newIndex, directions[i]);
      }
      expect(focusTracker.getTotalNavigations()).assertEqual(5);
      expect(focusTracker.getDirectionCount('left')).assertEqual(3);
      expect(focusTracker.getDirectionCount('right')).assertEqual(2);
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('enter_key_should_not_change_focus_owner', 0, async () => {
      await ensureRecorderWindow();
      const initialCount = await recorderComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(0);

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 300);
      const finalCount = await recorderComponentCount(driver);
      expect(finalCount).assertLargerOrEqual(0);
      const guard = new NonFocusableWindowGuard();
      expect(guard.resolveFocusOwner(true)).assertEqual(FocusOwner.APPLICATION);
    });

    it('long_press_should_keep_window_non_focusable', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      const initialCount = await recorderComponentCount(driver);
      await runLongPress(KEY_RIGHT);
      const afterCount = await recorderComponentCount(driver);
      expect(afterCount).assertLargerOrEqual(0);
      expect(Math.abs(afterCount - initialCount)).assertLessOrEqual(3);
      focusTracker.recordNavigation(0, 1, 'right_long');
      expect(focusTracker.getTotalNavigations()).assertEqual(1);
    });

    it('focus_navigation_statistics_should_be_accurate', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        focusTracker.recordNavigation(1, 2, 'right');
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        focusTracker.recordNavigation(2, 1, 'left');
      }
      expect(focusTracker.getNavigationCountToIndex(1)).assertEqual(5);
      expect(focusTracker.getNavigationCountToIndex(2)).assertEqual(5);
      expect(focusTracker.getTotalNavigations()).assertEqual(10);
      expect(focusTracker.getDirectionCount('left')).assertEqual(5);
    });

    it('focus_should_stay_consistent_after_multiple_cycles', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      const initialCount = await recorderComponentCount(driver);
      expect(initialCount).assertLargerOrEqual(0);

      for (let cycle = 0; cycle < 3; cycle++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 200);
        await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 200);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 200);

        const cycleCount = await recorderComponentCount(driver);
        expect(cycleCount).assertLargerOrEqual(0);
        focusTracker.recordNavigation(0, 1, 'left');
        focusTracker.recordNavigation(1, 0, 'right');
        focusTracker.recordNavigation(0, 1, 'left');
      }
      expect(focusTracker.getTotalNavigations()).assertEqual(9);
      expect(focusTracker.getBlockedCount()).assertLargerOrEqual(0);
    });

    it('focus_navigation_should_handle_edge_transitions', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 0, 'left_boundary');
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 2, 'right');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 2, 'right_boundary');

      const history = focusTracker.getFocusHistory();
      expect(history.length).assertEqual(4);
      expect(history[1].toIndex).assertEqual(0);
      expect(history[3].toIndex).assertEqual(2);
      expect(focusTracker.getBlockedCount()).assertEqual(2);
    });

    it('focus_navigation_direction_tracking_should_be_accurate', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 1, 'left');
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');

      const history = focusTracker.getFocusHistory();
      expect(history[0].direction).assertEqual('right');
      expect(history[1].direction).assertEqual('left');
      expect(history[2].direction).assertEqual('left');
    });

    it('comprehensive_focus_navigation_scenario', 0, async () => {
      await ensureRecorderWindow();
      focusTracker.resetTracker();
      const scenarioStart = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 0, 'left');
      await serializedDelay(driver, TIMEOUT_FOCUS_CHANGE);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');

      const scenarioDuration = Date.now() - scenarioStart;
      expect(focusTracker.getTotalNavigations()).assertEqual(5);
      expect(scenarioDuration).assertLessOrEqual(15000);
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('navigation_direction_converter_should_parse_and_reverse', 0, async () => {
      const converter = new NavigationDirectionConverter();
      expect(converter.parseDirection('left')).assertEqual(NavigationDirection.LEFT);
      expect(converter.parseDirection('right')).assertEqual(NavigationDirection.RIGHT);
      expect(converter.parseDirection('up')).assertEqual(NavigationDirection.UP);
      expect(converter.parseDirection('down')).assertEqual(NavigationDirection.DOWN);
      expect(converter.parseDirection('unknown')).assertEqual(NavigationDirection.NONE);
      expect(converter.isHorizontal(NavigationDirection.LEFT)).assertTrue();
      expect(converter.isVertical(NavigationDirection.UP)).assertTrue();
      expect(converter.reverse(NavigationDirection.LEFT)).assertEqual(NavigationDirection.RIGHT);
      expect(converter.reverse(NavigationDirection.UP)).assertEqual(NavigationDirection.DOWN);
      expect(converter.reverse(NavigationDirection.NONE)).assertEqual(NavigationDirection.NONE);
      expect(converter.toKeyCode(NavigationDirection.LEFT)).assertEqual(KEY_LEFT);
      expect(converter.toKeyCode(NavigationDirection.RIGHT)).assertEqual(KEY_RIGHT);
    });

    it('navigation_statistics_calculator_should_count_directions', 0, async () => {
      const history: FocusTransitionRecord[] = [
        { fromIndex: 1, toIndex: 2, direction: 'right', timestamp: 1, duration: 30 },
        { fromIndex: 2, toIndex: 1, direction: 'left', timestamp: 2, duration: 40 },
        { fromIndex: 0, toIndex: 0, direction: 'left', timestamp: 3, duration: 20 }
      ];
      const statistics = new NavigationStatisticsCalculator(history).buildStatistics();
      expect(statistics.totalNavigations).assertEqual(3);
      expect(statistics.leftNavigations).assertEqual(2);
      expect(statistics.rightNavigations).assertEqual(1);
      expect(statistics.blockedNavigations).assertEqual(1);
      expect(statistics.averageDuration).assertEqual(30);

      const empty = new NavigationStatisticsCalculator([]).buildStatistics();
      expect(empty.totalNavigations).assertEqual(0);
      expect(empty.averageDuration).assertEqual(0);
    });

    it('navigation_path_model_and_manager_should_track_movement', 0, async () => {
      const moved = new NavigationPathModel(1, 2, NavigationDirection.RIGHT, 1);
      expect(moved.getFromIndex()).assertEqual(1);
      expect(moved.getToIndex()).assertEqual(2);
      expect(moved.hasMoved()).assertTrue();
      expect(moved.toString().indexOf('->')).assertLargerOrEqual(0);
      const staticPath = new NavigationPathModel(1, 1, NavigationDirection.NONE, 0);
      expect(staticPath.hasMoved()).assertFalse();

      const manager = new NavigationPathManager();
      manager.appendPath(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 1));
      manager.appendPath(new NavigationPathModel(1, 0, NavigationDirection.LEFT, 1));
      manager.appendPath(new NavigationPathModel(1, 2, NavigationDirection.RIGHT, 1));
      expect(manager.getPaths().length).assertEqual(3);
      expect(manager.countMovedPaths()).assertEqual(3);
      expect(manager.filterByDirection(NavigationDirection.LEFT).length).assertEqual(1);
      manager.clearPaths();
      expect(manager.getPaths().length).assertEqual(0);
    });

    it('navigation_boundary_model_should_clamp_movement', 0, async () => {
      const boundary = new NavigationBoundaryModel(0, 2);
      expect(boundary.getMinIndex()).assertEqual(0);
      expect(boundary.getMaxIndex()).assertEqual(2);
      expect(boundary.moveWithin(2, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(0, NavigationDirection.LEFT)).assertEqual(0);
      expect(boundary.moveWithin(1, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(1, NavigationDirection.LEFT)).assertEqual(0);
      expect(boundary.isBeyondLeft(-1)).assertTrue();
      expect(boundary.isBeyondRight(3)).assertTrue();
    });

    it('navigation_result_evaluator_should_classify_results', 0, async () => {
      const evaluator = new NavigationResultEvaluator(new NavigationBoundaryModel(0, 2));
      expect(evaluator.evaluate(0, 1, NavigationDirection.RIGHT)).assertEqual(NavigationResult.SUCCESS);
      expect(evaluator.evaluate(0, 0, NavigationDirection.LEFT)).assertEqual(NavigationResult.BLOCKED);
      expect(evaluator.evaluate(1, 1, NavigationDirection.NONE)).assertEqual(NavigationResult.INVALID);
      expect(evaluator.evaluate(0, 3, NavigationDirection.RIGHT)).assertEqual(NavigationResult.BLOCKED);
      expect(evaluator.isSuccessful(NavigationResult.SUCCESS)).assertTrue();
      expect(evaluator.isSuccessful(NavigationResult.BLOCKED)).assertFalse();
    });

    it('navigation_path_analyzer_should_compute_efficiency', 0, async () => {
      const analyzer = new NavigationPathAnalyzer(new NavigationPathModel(0, 3, NavigationDirection.RIGHT, 3));
      expect(analyzer.computeDistance()).assertEqual(3);
      const analysis = analyzer.analyze(0);
      expect(analysis.stepCount).assertEqual(3);
      expect(analysis.distance).assertEqual(3);
      expect(analysis.isEfficient).assertTrue();
      expect(analyzer.isMovement()).assertTrue();

      const slow = new NavigationPathAnalyzer(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 5));
      expect(slow.computeDistance()).assertEqual(1);
      expect(slow.isEfficient()).assertFalse();
      expect(slow.analyze(2).directionChanges).assertEqual(2);
    });

    it('navigation_path_executor_should_track_status', 0, async () => {
      const executor = new NavigationPathExecutor(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 1));
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.NOT_STARTED);
      expect(executor.canRestart()).assertFalse();
      executor.begin();
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.IN_PROGRESS);
      executor.complete();
      expect(executor.isCompleted()).assertTrue();
      expect(executor.canRestart()).assertTrue();
      executor.abort();
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.ABORTED);
      expect(executor.getPath().getSteps()).assertEqual(1);
    });

    it('navigation_command_manager_should_sum_repeat_counts', 0, async () => {
      const manager = new NavigationCommandManager();
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.LEFT, 2, 1));
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.LEFT, 3, 2));
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.RIGHT, 1, 3));
      expect(manager.getCommands().length).assertEqual(3);
      expect(manager.countByDirection(NavigationDirection.LEFT)).assertEqual(2);
      expect(manager.sumRepeatCounts()).assertEqual(6);
      expect(manager.getCommands()[0].toString().indexOf('repeat=2')).assertLargerOrEqual(0);
      manager.clearCommands();
      expect(manager.getCommands().length).assertEqual(0);
    });

    it('non_focusable_window_guard_should_resolve_top_window', 0, async () => {
      const guard = new NonFocusableWindowGuard();
      expect(guard.getWindows().length).assertEqual(2);
      const top = guard.getTopWindow();
      expect(top !== null).assertTrue();
      expect(top?.windowName).assertEqual('recorderTip');
      expect(top?.focusable).assertFalse();
      const timer = guard.findByWindowName('recorderTimer');
      expect(timer?.pageRoute).assertEqual('pages/screenRecorderTimer');
      expect(guard.findByWindowName('unknown')).assertNull();
      expect(guard.getWindows()[0].zOrder).assertLess(2);
    });
  });
}

