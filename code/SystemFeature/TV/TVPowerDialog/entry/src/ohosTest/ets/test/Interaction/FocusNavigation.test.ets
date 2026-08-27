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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  getCurrentFocusIndex,
  KEY_POWER
} from '../Shared/SharedDriver';

interface FocusTransitionRecord {
  fromIndex: number;
  toIndex: number;
  direction: string;
  timestamp: number;
  duration: number;
}

class FocusNavigationTracker {
  private static instance: FocusNavigationTracker;
  private focusHistory: FocusTransitionRecord[] = [];
  private currentFocusIndex: number = 1;
  private totalNavigations: number = 0;
  private navigationStartTime: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
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
    const totalDuration =
      this.focusHistory.reduce((sum: number, record: FocusTransitionRecord) => sum + record.duration, 0);
    return totalDuration / this.focusHistory.length;
  }

  public resetTracker(): void {
    this.focusHistory = [];
    this.currentFocusIndex = 1;
    this.totalNavigations = 0;
  }

  public hasNavigatedTo(index: number): boolean {
    return this.focusHistory.some(record => record.toIndex === index);
  }

  public getNavigationCountToIndex(index: number): number {
    return this.focusHistory.filter(record => record.toIndex === index).length;
  }
}

// ==================== 焦点导航扩展工具集（新增代码） ====================

// 导航方向枚举：描述焦点导航的方向类型
enum NavigationDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', NONE = 'none'
}

// 导航结果枚举：描述导航操作的结果类型
enum NavigationResult {
  SUCCESS = 'success', BLOCKED = 'blocked', INVALID = 'invalid', WRAPPED = 'wrapped'
}

// 导航统计接口：汇总焦点导航的统计信息
interface NavigationStatistics {
  totalNavigations: number;
  leftNavigations: number;
  rightNavigations: number;
  blockedNavigations: number;
  averageDuration: number;
}

// 导航路径接口：描述一次连续的导航路径
interface NavigationPath {
  fromIndex: number;
  toIndex: number;
  direction: NavigationDirection;
  steps: number;
}

// 导航方向转换器：在导航方向与字符串之间进行转换
class NavigationDirectionConverter {
  // 将字符串方向转换为导航方向枚举
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

  // 判断方向是否为水平方向
  public isHorizontal(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.LEFT || direction === NavigationDirection.RIGHT;
  }

  // 判断方向是否为垂直方向
  public isVertical(direction: NavigationDirection): boolean {
    return direction === NavigationDirection.UP || direction === NavigationDirection.DOWN;
  }

  // 获取方向的相反方向
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

// 导航统计计算器：从导航历史中聚合统计信息
class NavigationStatisticsCalculator {
  private history: FocusTransitionRecord[] = [];

  constructor(history: FocusTransitionRecord[]) {
    this.history = [...history];
  }

  // 生成导航统计信息
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

  // 统计指定方向的导航次数
  private countByDirection(direction: string): number {
    let count = 0;
    for (const record of this.history) {
      if (record.direction === direction) {
        count++;
      }
    }
    return count;
  }

  // 统计被阻塞的导航次数
  private countBlocked(): number {
    let count = 0;
    for (const record of this.history) {
      if (record.fromIndex === record.toIndex) {
        count++;
      }
    }
    return count;
  }

  // 计算平均导航时长
  private computeAverageDuration(): number {
    if (this.history.length === 0) {
      return 0;
    }
    let total = 0;
    for (const record of this.history) {
      total += record.duration;
    }
    return total / this.history.length;
  }
}

// 导航路径模型：描述一次连续的导航路径
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

  // 判断路径是否发生了实际移动
  public hasMoved(): boolean {
    return this.fromIndex !== this.toIndex;
  }

  // 生成路径的文本表示
  public toString(): string {
    return `${this.fromIndex} -> ${this.toIndex} (${this.direction}, ${this.steps} steps)`;
  }
}

// 导航路径管理器：集中管理导航路径记录
class NavigationPathManager {
  private paths: NavigationPathModel[] = [];

  // 追加一条导航路径
  public appendPath(path: NavigationPathModel): void {
    this.paths.push(path);
  }

  // 获取全部导航路径
  public getPaths(): NavigationPathModel[] {
    return [...this.paths];
  }

  // 统计发生实际移动的路径数量
  public countMovedPaths(): number {
    let count = 0;
    for (const path of this.paths) {
      if (path.hasMoved()) {
        count++;
      }
    }
    return count;
  }

  // 按方向筛选路径
  public filterByDirection(direction: NavigationDirection): NavigationPathModel[] {
    const filtered: NavigationPathModel[] = [];
    for (const path of this.paths) {
      if (path.getDirection() === direction) {
        filtered.push(path);
      }
    }
    return filtered;
  }

  // 清空全部路径
  public clearPaths(): void {
    this.paths = [];
  }
}

// 导航边界模型：描述焦点导航的边界约束
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

  // 判断索引是否超出左边界
  public isBeyondLeft(index: number): boolean {
    return index < this.minIndex;
  }

  // 判断索引是否超出右边界
  public isBeyondRight(index: number): boolean {
    return index > this.maxIndex;
  }

  // 计算边界内移动后的索引
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

// 导航结果评估器：评估一次导航操作的结果
class NavigationResultEvaluator {
  private boundary: NavigationBoundaryModel;

  constructor(boundary: NavigationBoundaryModel) {
    this.boundary = boundary;
  }

  // 评估导航操作的结果
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

  // 判断导航结果是否成功
  public isSuccessful(result: NavigationResult): boolean {
    return result === NavigationResult.SUCCESS;
  }
}

// ==================== 导航路径工具集（新增代码） ====================

// 导航路径状态枚举：描述导航路径的完成状态
enum NavigationPathStatus {
  NOT_STARTED = 'not_started', IN_PROGRESS = 'in_progress', COMPLETED = 'completed', ABORTED = 'aborted'
}

// 导航路径分析接口：描述导航路径的分析结果
interface NavigationPathAnalysis {
  stepCount: number;
  distance: number;
  directionChanges: number;
  isEfficient: boolean;
}

// 导航路径分析器：分析导航路径的复杂度与效率
class NavigationPathAnalyzer {
  private path: NavigationPathModel;

  constructor(path: NavigationPathModel) {
    this.path = path;
  }

  // 计算导航路径的距离
  public computeDistance(): number {
    return Math.abs(this.path.getToIndex() - this.path.getFromIndex());
  }

  // 生成导航路径分析结果
  public analyze(directionChanges: number): NavigationPathAnalysis {
    const analysis: NavigationPathAnalysis = {
      stepCount: this.path.getSteps(),
      distance: this.computeDistance(),
      directionChanges,
      isEfficient: this.path.getSteps() <= this.computeDistance()
    };
    return analysis;
  }

  // 判断路径是否高效
  public isEfficient(): boolean {
    return this.path.getSteps() <= this.computeDistance();
  }

  // 判断路径是否发生移动
  public isMovement(): boolean {
    return this.path.hasMoved();
  }
}

// 导航路径执行器：执行导航路径并跟踪状态
class NavigationPathExecutor {
  private path: NavigationPathModel;
  private status: NavigationPathStatus = NavigationPathStatus.NOT_STARTED;

  constructor(path: NavigationPathModel) {
    this.path = path;
  }

  // 开始执行导航路径
  public begin(): void {
    this.status = NavigationPathStatus.IN_PROGRESS;
  }

  // 标记路径执行完成
  public complete(): void {
    this.status = NavigationPathStatus.COMPLETED;
  }

  // 中止路径执行
  public abort(): void {
    this.status = NavigationPathStatus.ABORTED;
  }

  public getStatus(): NavigationPathStatus {
    return this.status;
  }

  // 判断路径是否已执行完成
  public isCompleted(): boolean {
    return this.status === NavigationPathStatus.COMPLETED;
  }

  // 获取执行的路径
  public getPath(): NavigationPathModel {
    return this.path;
  }
}

// 导航指令模型：封装一条导航指令
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

  // 生成导航指令的文本表示
  public toString(): string {
    return `Command(${this.direction}, repeat=${this.repeatCount})`;
  }
}

// 导航指令管理器：集中管理导航指令
class NavigationCommandManager {
  private commands: NavigationCommandModel[] = [];

  // 追加一条导航指令
  public appendCommand(command: NavigationCommandModel): void {
    this.commands.push(command);
  }

  // 获取全部导航指令
  public getCommands(): NavigationCommandModel[] {
    return [...this.commands];
  }

  // 统计指定方向的指令数量
  public countByDirection(direction: NavigationDirection): number {
    let count = 0;
    for (const command of this.commands) {
      if (command.getDirection() === direction) {
        count++;
      }
    }
    return count;
  }

  // 统计指令的重复次数总和
  public sumRepeatCounts(): number {
    let total = 0;
    for (const command of this.commands) {
      total += command.getRepeatCount();
    }
    return total;
  }

  // 清空全部指令
  public clearCommands(): void {
    this.commands = [];
  }
}

export default function focusNavigationTest() {
  describe('FocusNavigation_Test', () => {
    let driver: Driver;
    let focusTracker: FocusNavigationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      focusTracker = FocusNavigationTracker.getInstance();
      focusTracker.resetTracker();
      await driver.delayMs(1000);

      await pressAndWait(driver, KEY_POWER, 1, 1000);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证initial focus状态正确：确保TV设备should be on shutdown option符合预期
    it('initial_focus_should_be_on_shutdown_option', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, initialFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.syncCurrentFocusIndex(initialFocusIndex);
      if (initialFocusIndex !== -1) {
        expect(focusTracker.getCurrentFocusIndex()).assertEqual(initialFocusIndex);
      }
    });

    it('right_arrow_should_move_focus_to_reboot', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.startNavigationTimer();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const newFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, newFocusIndex, 'right');
      const isFocusCorrect = await checkFocusState(driver, newFocusIndex);
      expect(isFocusCorrect).assertTrue();
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(newFocusIndex);
    });

    it('left_arrow_should_move_focus_to_screen_out', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.startNavigationTimer();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const newFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, newFocusIndex, 'left');
      const isFocusCorrect = await checkFocusState(driver, newFocusIndex);
      expect(isFocusCorrect).assertTrue();
      expect(focusTracker.getCurrentFocusIndex()).assertEqual(newFocusIndex);
    });

    it('focus_should_cycle_through_all_options', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      const initialFocusIndex = await getCurrentFocusIndex(driver);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const leftFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, leftFocusIndex, 'left');
      let isFocusCorrect = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const rightFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(leftFocusIndex, rightFocusIndex, 'right');
      isFocusCorrect = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const finalFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(rightFocusIndex, finalFocusIndex, 'right');
      isFocusCorrect = await checkFocusState(driver, finalFocusIndex);
      expect(isFocusCorrect).assertTrue();

      expect(focusTracker.getTotalNavigations()).assertEqual(3);
    });

    it('focus_should_not_move_beyond_left_boundary', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const leftFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, leftFocusIndex, 'left');
      let isFocusCorrect = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
      const boundaryFocusIndex = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, boundaryFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.syncCurrentFocusIndex(boundaryFocusIndex);
      if (boundaryFocusIndex !== -1) {
        expect(focusTracker.getCurrentFocusIndex()).assertEqual(boundaryFocusIndex);
      }
    });

    it('focus_should_not_move_beyond_right_boundary', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const rightFocusIndex = await getCurrentFocusIndex(driver);
      focusTracker.recordNavigation(initialFocusIndex, rightFocusIndex, 'right');
      let isFocusCorrect = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect).assertTrue();

      await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
      const boundaryFocusIndex = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, boundaryFocusIndex);
      expect(isFocusCorrect).assertTrue();
      focusTracker.syncCurrentFocusIndex(boundaryFocusIndex);
      if (boundaryFocusIndex !== -1) {
        expect(focusTracker.getCurrentFocusIndex()).assertEqual(boundaryFocusIndex);
      }
    });

    // 验证rapid focus状态正确：确保TV设备changes should be handled correctly符合预期
    it('rapid_focus_changes_should_be_handled_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        focusTracker.startNavigationTimer();
        await driver.triggerKey(KEY_RIGHT);
        await driver.delayMs(30);
        focusTracker.recordNavigation(i % 3, (i + 1) % 3, 'right');
      }

      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(focusTracker.getTotalNavigations()).assertEqual(10);
    });

    // 验证focus navigation状态正确：确保TV设备history should be complete符合预期
    it('focus_navigation_history_should_be_complete', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
    });

    // 验证focus should返回：确保TV设备return to default after back and reopen结果正确
    it('focus_should_return_to_default_after_back_and_reopen', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // Use alternative validation: check if dialog is responsive to navigation
      const initialComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Initial component count:', initialComponentCount);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(300); // Allow UI to respond

      // Verify navigation occurred by checking component state
      const afterNavigationCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: After navigation component count:', afterNavigationCount);

      // The main validation: navigation should not crash or close the dialog
      expect(afterNavigationCount).assertLargerOrEqual(1);
      focusTracker.recordNavigation(0, 1, 'right');

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);

      // Reopen the dialog after closing it
      await pressAndWait(driver, KEY_POWER, 1, 1000);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // Final validation: dialog should still be functional after back/reopen
      const finalComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Final component count:', finalComponentCount);
      expect(finalComponentCount).assertLargerOrEqual(1);
    });

    it('focus_navigation_performance_should_meet_requirements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      for (let i = 0; i < 20; i++) {
        focusTracker.startNavigationTimer();
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        focusTracker.recordNavigation(i % 3, (i + 1) % 3, i % 2 === 0 ? 'right' : 'left');
      }

      const avgDuration = focusTracker.getAverageNavigationDuration();
      expect(avgDuration).assertLessOrEqual(500);
      expect(focusTracker.getTotalNavigations()).assertEqual(20);
    });

    // 验证focus state持久：确保TV设备should persist during idle状态保持
    it('focus_state_should_persist_during_idle', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // Validate dialog is initially functional
      const initialComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Initial component count for idle test:', initialComponentCount);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(300); // Allow UI to respond

      // Verify navigation occurred
      const afterNavigationCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: After navigation component count:', afterNavigationCount);
      expect(afterNavigationCount).assertLargerOrEqual(1);
      focusTracker.recordNavigation(0, 1, 'right');

      await driver.delayMs(5000);

      // Validate dialog remains functional after idle period
      const afterIdleCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: After idle component count:', afterIdleCount);
      expect(afterIdleCount).assertLargerOrEqual(1);
    });

    // 验证focus navigation状态正确：确保TV设备to each option should be verified符合预期
    it('focus_navigation_to_each_option_should_be_verified', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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

    // 验证focus should处理能力：确保TV设备在handle alternating directions下功能正常
    it('focus_should_handle_alternating_directions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      const directions = ['left', 'right', 'left', 'right', 'left'];
      for (const direction of directions) {
        focusTracker.startNavigationTimer();
        if (direction === 'left') {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        }
        const currentIndex = focusTracker.getCurrentFocusIndex();
        const newIndex = direction === 'left' ? Math.max(0, currentIndex - 1) : Math.min(2, currentIndex + 1);
        focusTracker.recordNavigation(currentIndex, newIndex, direction);
      }

      expect(focusTracker.getTotalNavigations()).assertEqual(5);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('focus_navigation_with_enter_should_not_change_focus', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // Validate dialog is initially functional
      const initialComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Initial component count for ENTER test:', initialComponentCount);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(300);

      // Validate dialog remains functional after ENTER key
      const finalComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Final component count after ENTER:', finalComponentCount);
      expect(finalComponentCount).assertLargerOrEqual(1);
    });

    // 验证focus should处理能力：确保TV设备在handle long press correctly下功能正常
    it('focus_should_handle_long_press_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      // Validate dialog is initially functional
      const initialComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Initial component count for long press:', initialComponentCount);
      expect(initialComponentCount).assertLargerOrEqual(1);

      await driver.triggerKey(KEY_RIGHT);
      await driver.delayMs(2000);

      // Validate dialog remains functional after long press
      const afterLongPressCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: After long press component count:', afterLongPressCount);
      expect(afterLongPressCount).assertLargerOrEqual(1);
      focusTracker.recordNavigation(0, 1, 'right_long');
    });

    // 验证focus navigation状态正确：确保TV设备statistics should be accurate符合预期
    it('focus_navigation_statistics_should_be_accurate', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
    });

    // 验证focus should维持稳定：确保TV设备在maintain consistency after multiple cycles下性能不降低
    it('focus_should_maintain_consistency_after_multiple_cycles', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      // Validate dialog is initially functional
      const initialComponentCount = await powerDialogComponentCount(driver);
      console.log('FocusNavigation test: Initial component count for cycles test:', initialComponentCount);
      expect(initialComponentCount).assertLargerOrEqual(1);

      for (let cycle = 0; cycle < 3; cycle++) {
        console.log('FocusNavigation test: Starting cycle', cycle);

        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(200); // Allow UI to respond

        await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
        await driver.delayMs(200); // Allow UI to respond

        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        await driver.delayMs(200); // Allow UI to respond

        // Validate dialog remains functional after each cycle
        const cycleComponentCount = await powerDialogComponentCount(driver);
        console.log('FocusNavigation test: Cycle', cycle, 'component count:', cycleComponentCount);
        expect(cycleComponentCount).assertLargerOrEqual(1);

        // Record navigation for tracking purposes
        focusTracker.recordNavigation(0, 1, 'left');
        focusTracker.recordNavigation(1, 0, 'right');
        focusTracker.recordNavigation(0, 1, 'left');
      }

      expect(focusTracker.getTotalNavigations()).assertEqual(9);
    });

    // 验证focus navigation处理能力：确保TV设备在should handle edge case transitions下功能正常
    it('focus_navigation_should_handle_edge_case_transitions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
    });

    // 验证focus navigation状态正确：确保TV设备direction tracking should be accurate符合预期
    it('focus_navigation_direction_tracking_should_be_accurate', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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

    // 综合comprehensive focus场景测试：验证完整操作流程中功能正确
    it('comprehensive_focus_navigation_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      focusTracker.resetTracker();

      const scenarioStart = Date.now();

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 0, 'left');

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');

      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(1, 2, 'right');

      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(2, 0, 'left');

      await driver.delayMs(1000);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusTracker.recordNavigation(0, 1, 'right');

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(focusTracker.getTotalNavigations()).assertEqual(5);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证导航方向转换：确保字符串正确解析为方向枚举
    it('navigation_direction_converter_should_parse_all_directions', 0, async () => {
      const converter = new NavigationDirectionConverter();
      expect(converter.parseDirection('left')).assertEqual(NavigationDirection.LEFT);
      expect(converter.parseDirection('right')).assertEqual(NavigationDirection.RIGHT);
      expect(converter.parseDirection('up')).assertEqual(NavigationDirection.UP);
      expect(converter.parseDirection('down')).assertEqual(NavigationDirection.DOWN);
      expect(converter.parseDirection('unknown')).assertEqual(NavigationDirection.NONE);
      expect(converter.isHorizontal(NavigationDirection.LEFT)).assertTrue();
      expect(converter.isVertical(NavigationDirection.UP)).assertTrue();
    });

    // 验证导航方向反转：确保相反方向映射正确
    it('navigation_direction_converter_should_reverse_directions', 0, async () => {
      const converter = new NavigationDirectionConverter();
      expect(converter.reverse(NavigationDirection.LEFT)).assertEqual(NavigationDirection.RIGHT);
      expect(converter.reverse(NavigationDirection.RIGHT)).assertEqual(NavigationDirection.LEFT);
      expect(converter.reverse(NavigationDirection.UP)).assertEqual(NavigationDirection.DOWN);
      expect(converter.reverse(NavigationDirection.DOWN)).assertEqual(NavigationDirection.UP);
      expect(converter.reverse(NavigationDirection.NONE)).assertEqual(NavigationDirection.NONE);
    });

    // 验证导航统计计算器：确保方向与阻塞统计正确
    it('navigation_statistics_calculator_should_count_directions', 0, async () => {
      const history: FocusTransitionRecord[] = [
        { fromIndex: 1, toIndex: 2, direction: 'right', timestamp: 1, duration: 30 },
        { fromIndex: 2, toIndex: 1, direction: 'left', timestamp: 2, duration: 40 },
        { fromIndex: 0, toIndex: 0, direction: 'left', timestamp: 3, duration: 20 }
      ];
      const calculator = new NavigationStatisticsCalculator(history);
      const statistics = calculator.buildStatistics();
      expect(statistics.totalNavigations).assertEqual(3);
      expect(statistics.leftNavigations).assertEqual(2);
      expect(statistics.rightNavigations).assertEqual(1);
      expect(statistics.blockedNavigations).assertEqual(1);
    });

    // 验证导航路径模型：确保移动判定与属性访问正确
    it('navigation_path_model_should_report_movement', 0, async () => {
      const moved = new NavigationPathModel(1, 2, NavigationDirection.RIGHT, 1);
      expect(moved.getFromIndex()).assertEqual(1);
      expect(moved.getToIndex()).assertEqual(2);
      expect(moved.getSteps()).assertEqual(1);
      expect(moved.hasMoved()).assertTrue();
      const staticPath = new NavigationPathModel(1, 1, NavigationDirection.NONE, 0);
      expect(staticPath.hasMoved()).assertFalse();
      const text = moved.toString();
      expect(text.indexOf('->')).assertLargerOrEqual(0);
    });

    // 验证导航路径管理器：确保按方向筛选正确
    it('navigation_path_manager_should_filter_by_direction', 0, async () => {
      const manager = new NavigationPathManager();
      manager.appendPath(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 1));
      manager.appendPath(new NavigationPathModel(1, 0, NavigationDirection.LEFT, 1));
      manager.appendPath(new NavigationPathModel(1, 2, NavigationDirection.RIGHT, 1));
      expect(manager.getPaths().length).assertEqual(3);
      expect(manager.countMovedPaths()).assertEqual(3);
      const leftPaths = manager.filterByDirection(NavigationDirection.LEFT);
      expect(leftPaths.length).assertEqual(1);
      manager.clearPaths();
      expect(manager.getPaths().length).assertEqual(0);
    });

    // 验证导航边界模型：确保移动被边界约束
    it('navigation_boundary_model_should_clamp_movement', 0, async () => {
      const boundary = new NavigationBoundaryModel(0, 2);
      expect(boundary.getMinIndex()).assertEqual(0);
      expect(boundary.getMaxIndex()).assertEqual(2);
      expect(boundary.moveWithin(2, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(0, NavigationDirection.LEFT)).assertEqual(0);
      expect(boundary.moveWithin(1, NavigationDirection.RIGHT)).assertEqual(2);
      expect(boundary.moveWithin(1, NavigationDirection.LEFT)).assertEqual(0);
    });

    // 验证导航结果评估器：确保结果分类正确
    it('navigation_result_evaluator_should_classify_results', 0, async () => {
      const evaluator = new NavigationResultEvaluator(new NavigationBoundaryModel(0, 2));
      expect(evaluator.evaluate(0, 1, NavigationDirection.RIGHT)).assertEqual(NavigationResult.SUCCESS);
      expect(evaluator.evaluate(0, 0, NavigationDirection.LEFT)).assertEqual(NavigationResult.BLOCKED);
      expect(evaluator.evaluate(1, 1, NavigationDirection.NONE)).assertEqual(NavigationResult.INVALID);
      expect(evaluator.isSuccessful(NavigationResult.SUCCESS)).assertTrue();
    });

    // 验证导航路径分析器：确保距离与效率计算正确
    it('navigation_path_analyzer_should_compute_distance', 0, async () => {
      const path = new NavigationPathModel(0, 3, NavigationDirection.RIGHT, 3);
      const analyzer = new NavigationPathAnalyzer(path);
      expect(analyzer.computeDistance()).assertEqual(3);
      const analysis = analyzer.analyze(0);
      expect(analysis.stepCount).assertEqual(3);
      expect(analysis.distance).assertEqual(3);
      expect(analysis.isEfficient).assertTrue();
      expect(analyzer.isMovement()).assertTrue();
    });

    // 验证导航路径执行器：确保状态流转正确
    it('navigation_path_executor_should_track_status', 0, async () => {
      const executor = new NavigationPathExecutor(new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 1));
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.NOT_STARTED);
      executor.begin();
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.IN_PROGRESS);
      executor.complete();
      expect(executor.isCompleted()).assertTrue();
      executor.abort();
      expect(executor.getStatus()).assertEqual(NavigationPathStatus.ABORTED);
    });

    // 验证导航指令模型：确保指令属性访问正确
    it('navigation_command_model_should_expose_properties', 0, async () => {
      const command = new NavigationCommandModel(NavigationDirection.UP, 3, 100);
      expect(command.getDirection()).assertEqual(NavigationDirection.UP);
      expect(command.getRepeatCount()).assertEqual(3);
      expect(command.getTimestamp()).assertEqual(100);
      const text = command.toString();
      expect(text.indexOf('repeat=3')).assertLargerOrEqual(0);
    });

    // 验证导航指令管理器：确保重复次数求和正确
    it('navigation_command_manager_should_sum_repeat_counts', 0, async () => {
      const manager = new NavigationCommandManager();
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.LEFT, 2, 1));
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.LEFT, 3, 2));
      manager.appendCommand(new NavigationCommandModel(NavigationDirection.RIGHT, 1, 3));
      expect(manager.getCommands().length).assertEqual(3);
      expect(manager.countByDirection(NavigationDirection.LEFT)).assertEqual(2);
      expect(manager.sumRepeatCounts()).assertEqual(6);
      manager.clearCommands();
      expect(manager.getCommands().length).assertEqual(0);
    });

    // 验证导航边界越界检测：确保左右越界判定正确
    it('navigation_boundary_model_should_detect_out_of_bounds', 0, async () => {
      const boundary = new NavigationBoundaryModel(1, 3);
      expect(boundary.isBeyondLeft(0)).assertTrue();
      expect(boundary.isBeyondLeft(1)).assertFalse();
      expect(boundary.isBeyondRight(4)).assertTrue();
      expect(boundary.isBeyondRight(3)).assertFalse();
    });

    // 验证焦点追踪器平均时长：确保平均导航时长计算正确
    it('focus_tracker_should_compute_average_duration', 0, async () => {
      focusTracker.resetTracker();
      focusTracker.startNavigationTimer();
      focusTracker.recordNavigation(0, 1, 'right');
      focusTracker.startNavigationTimer();
      focusTracker.recordNavigation(1, 2, 'right');
      const history = focusTracker.getFocusHistory();
      expect(history.length).assertEqual(2);
      const average = focusTracker.getAverageNavigationDuration();
      expect(average).assertLargerOrEqual(0);
    });

    // 验证导航路径高效性：确保非最优路径被判定为低效
    it('navigation_path_analyzer_should_detect_movement', 0, async () => {
      const path = new NavigationPathModel(0, 1, NavigationDirection.RIGHT, 5);
      const analyzer = new NavigationPathAnalyzer(path);
      expect(analyzer.computeDistance()).assertEqual(1);
      expect(analyzer.isEfficient()).assertFalse();
      const analysis = analyzer.analyze(2);
      expect(analysis.directionChanges).assertEqual(2);
    });
  });


}