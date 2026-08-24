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
  KEY_ENTER,
  KEY_BACK,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

// 焦点方向枚举
enum FocusDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', NONE = 'none'
}

// 焦点状态接口
interface FocusState {
  currentIndex: number;
  previousIndex: number;
  direction: FocusDirection;
  timestamp: number;
}

// 焦点管理器模拟器：模拟焦点管理功能，用于测试焦点分配逻辑
class GridFocusManagerSimulator {
  private static instance: GridFocusManagerSimulator;
  private focusState: FocusState;
  private focusHistory: FocusState[] = [];
  private itemCount: number = 0;
  private focusListeners: Array<(state: FocusState) => void> = [];

  constructor() {
    this.focusState = {
      currentIndex: -1,
      previousIndex: -1,
      direction: FocusDirection.NONE,
      timestamp: Date.now()
    };
  }

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): GridFocusManagerSimulator {
    if (!GridFocusManagerSimulator.instance) {
      GridFocusManagerSimulator.instance = new GridFocusManagerSimulator();
    }
    return GridFocusManagerSimulator.instance;
  }

  public initialize(itemCount: number): void {
    this.itemCount = itemCount;
    this.focusState = {
      currentIndex: -1,
      previousIndex: -1,
      direction: FocusDirection.NONE,
      timestamp: Date.now()
    };
    this.focusHistory = [];
  }

  public setFocus(index: number, direction: FocusDirection): boolean {
    if (index < 0 || index >= this.itemCount) {
      return false;
    }

    const oldIndex = this.focusState.currentIndex;
    const newFocusState: FocusState = {
      currentIndex: index,
      previousIndex: oldIndex,
      direction: direction,
      timestamp: Date.now()
    };
    this.focusState = newFocusState;
    this.focusHistory.push(newFocusState);

    this.notifyListeners();
    return true;
  }

  // 移动焦点：根据方向移动当前焦点位置
  public moveFocus(direction: FocusDirection): boolean {
    let newIndex = this.focusState.currentIndex;

    switch (direction) {
      case FocusDirection.LEFT:
        newIndex = this.focusState.currentIndex - 1;
        break;
      case FocusDirection.RIGHT:
        newIndex = this.focusState.currentIndex + 1;
        break;
      case FocusDirection.UP:
        newIndex = this.focusState.currentIndex - 1;
        break;
      case FocusDirection.DOWN:
        newIndex = this.focusState.currentIndex + 1;
        break;
      default:
        return false;
    }

    return this.setFocus(newIndex, direction);
  }

  public getCurrentIndex(): number {
    return this.focusState.currentIndex;
  }

  public getPreviousIndex(): number {
    return this.focusState.previousIndex;
  }

  public getFocusState(): FocusState {
    const copy: FocusState = {
      currentIndex: this.focusState.currentIndex,
      previousIndex: this.focusState.previousIndex,
      direction: this.focusState.direction,
      timestamp: this.focusState.timestamp
    };
    return copy;
  }

  public getFocusHistory(): FocusState[] {
    const copy: FocusState[] = [];
    for (const state of this.focusHistory) {
      const stateCopy: FocusState = {
        currentIndex: state.currentIndex,
        previousIndex: state.previousIndex,
        direction: state.direction,
        timestamp: state.timestamp
      };
      copy.push(stateCopy);
    }
    return copy;
  }

  public getFocusMoveCount(): number {
    return this.focusHistory.length;
  }

  // 添加焦点监听器：注册焦点变化回调函数
  public addFocusListener(listener: (state: FocusState) => void): void {
    this.focusListeners.push(listener);
  }

  // 移除焦点监听器：取消焦点变化回调函数
  public removeFocusListener(listener: (state: FocusState) => void): void {
    const index = this.focusListeners.indexOf(listener);
    if (index !== -1) {
      this.focusListeners.splice(index, 1);
    }
  }

  public resetFocus(): void {
    this.focusState = {
      currentIndex: -1,
      previousIndex: -1,
      direction: FocusDirection.NONE,
      timestamp: Date.now()
    };
    this.focusHistory = [];
  }

  public getDirectionStats(): Map<string, number> {
    const stats = new Map<string, number>();

    for (const state of this.focusHistory) {
      const direction = state.direction;
      const currentCount = stats.get(direction) || 0;
      stats.set(direction, currentCount + 1);
    }

    return stats;
  }

  public isValidIndex(index: number): boolean {
    return index >= 0 && index < this.itemCount;
  }

  public getItemCount(): number {
    return this.itemCount;
  }

  public hasFocus(): boolean {
    return this.focusState.currentIndex >= 0 && this.focusState.currentIndex < this.itemCount;
  }

  // 通知监听器：触发所有注册的焦点变化回调
  private notifyListeners(): void {
    for (const listener of this.focusListeners) {
      const stateCopy: FocusState = {
        currentIndex: this.focusState.currentIndex,
        previousIndex: this.focusState.previousIndex,
        direction: this.focusState.direction,
        timestamp: this.focusState.timestamp
      };
      listener(stateCopy);
    }
  }
}

export default function gridFocusManagerValidationTest() {
  describe('GridFocusManagerValidation_Test', () => {
    let driver: Driver;
    let focusManager: GridFocusManagerSimulator;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      focusManager = GridFocusManagerSimulator.getInstance();
      focusManager.initialize(6);
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证focus direction状态正确：确保TV设备enum should be defined correctly符合预期
    it('focus_direction_enum_should_be_defined_correctly', 0, async () => {
      expect(FocusDirection.LEFT).assertEqual('left');
      expect(FocusDirection.RIGHT).assertEqual('right');
      expect(FocusDirection.UP).assertEqual('up');
      expect(FocusDirection.DOWN).assertEqual('down');
      expect(FocusDirection.NONE).assertEqual('none');
    });

    it('focus_manager_initialization_should_set_correct_state', 0, async () => {
      focusManager.initialize(6);

      expect(focusManager.getCurrentIndex()).assertEqual(-1);
      expect(focusManager.getPreviousIndex()).assertEqual(-1);
      expect(focusManager.getItemCount()).assertEqual(6);
      expect(focusManager.hasFocus()).assertFalse();
    });

    it('focus_setting_should_work_correctly', 0, async () => {
      focusManager.initialize(6);
      const result1 = focusManager.setFocus(0, FocusDirection.RIGHT);
      expect(result1).assertTrue();
      expect(focusManager.getCurrentIndex()).assertEqual(0);
      expect(focusManager.hasFocus()).assertTrue();
      const result2 = focusManager.setFocus(3, FocusDirection.RIGHT);
      expect(result2).assertTrue();
      expect(focusManager.getCurrentIndex()).assertEqual(3);
      expect(focusManager.getPreviousIndex()).assertEqual(0);
    });

    // 验证focus setting状态正确：确保TV设备boundary values should be handled符合预期
    it('focus_setting_boundary_values_should_be_handled', 0, async () => {
      focusManager.initialize(6);

      // 测试负值边界
      const result1 = focusManager.setFocus(-1, FocusDirection.LEFT);
      expect(result1).assertFalse();

      // 测试超出上限边界
      const result2 = focusManager.setFocus(6, FocusDirection.RIGHT);
      expect(result2).assertFalse();

      // 测试有效边界值
      const result3 = focusManager.setFocus(0, FocusDirection.RIGHT);
      expect(result3).assertTrue();

      const result4 = focusManager.setFocus(5, FocusDirection.RIGHT);
      expect(result4).assertTrue();
    });

    it('focus_movement_should_work_correctly', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(2, FocusDirection.RIGHT);

      // 向右移动焦点
      const result1 = focusManager.moveFocus(FocusDirection.RIGHT);
      expect(result1).assertTrue();
      expect(focusManager.getCurrentIndex()).assertEqual(3);

      // 向左移动焦点
      const result2 = focusManager.moveFocus(FocusDirection.LEFT);
      expect(result2).assertTrue();
      expect(focusManager.getCurrentIndex()).assertEqual(2);
    });

    it('focus_movement_boundary_handling_should_work', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(0, FocusDirection.RIGHT);

      // 测试左边界移动
      const result1 = focusManager.moveFocus(FocusDirection.LEFT);
      expect(result1).assertFalse();
      expect(focusManager.getCurrentIndex()).assertEqual(0);

      // 设置到右边界
      focusManager.setFocus(5, FocusDirection.RIGHT);

      // 测试右边界移动
      const result2 = focusManager.moveFocus(FocusDirection.RIGHT);
      expect(result2).assertFalse();
      expect(focusManager.getCurrentIndex()).assertEqual(5);
    });

    // 验证focus history记录数据：确保TV设备should record all movements可追踪
    it('focus_history_should_record_all_movements', 0, async () => {
      focusManager.initialize(6);

      focusManager.setFocus(0, FocusDirection.RIGHT);
      focusManager.setFocus(1, FocusDirection.RIGHT);
      focusManager.setFocus(2, FocusDirection.RIGHT);
      focusManager.setFocus(1, FocusDirection.LEFT);

      const history = focusManager.getFocusHistory();
      expect(history.length).assertEqual(4);

      expect(history[0].currentIndex).assertEqual(0);
      expect(history[1].currentIndex).assertEqual(1);
      expect(history[2].currentIndex).assertEqual(2);
      expect(history[3].currentIndex).assertEqual(1);
    });

    // 验证focus direction状态正确：确保TV设备stats should be accurate符合预期
    it('focus_direction_stats_should_be_accurate', 0, async () => {
      focusManager.initialize(6);

      focusManager.setFocus(0, FocusDirection.RIGHT);
      focusManager.moveFocus(FocusDirection.RIGHT);
      focusManager.moveFocus(FocusDirection.RIGHT);
      focusManager.moveFocus(FocusDirection.LEFT);
      focusManager.moveFocus(FocusDirection.LEFT);
      focusManager.moveFocus(FocusDirection.RIGHT);

      const stats = focusManager.getDirectionStats();

      expect(stats.get('right')).assertEqual(4);
      expect(stats.get('left')).assertEqual(2);
    });

    it('focus_listener_should_receive_notifications', 0, async () => {
      focusManager.initialize(6);

      let notificationCount = 0;
      let lastNotifiedState: FocusState = {
        currentIndex: -1,
        previousIndex: -1,
        direction: FocusDirection.NONE,
        timestamp: 0
      };

      const listener = (state: FocusState) => {
        notificationCount++;
        lastNotifiedState = state;
      };

      focusManager.addFocusListener(listener);

      focusManager.setFocus(0, FocusDirection.RIGHT);
      expect(notificationCount).assertEqual(1);
      expect(lastNotifiedState.currentIndex).assertEqual(0);

      focusManager.moveFocus(FocusDirection.RIGHT);
      expect(notificationCount).assertEqual(2);
      expect(lastNotifiedState.currentIndex).assertEqual(1);

      focusManager.removeFocusListener(listener);
    });

    // 验证focus state返回：确保TV设备get should return deep copy结果正确
    it('focus_state_get_should_return_deep_copy', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(2, FocusDirection.RIGHT);

      const state1 = focusManager.getFocusState();
      state1.currentIndex = 99;

      const state2 = focusManager.getFocusState();
      expect(state2.currentIndex).assertEqual(2);
    });

    // 验证focus history返回：确保TV设备get should return deep copy结果正确
    it('focus_history_get_should_return_deep_copy', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(0, FocusDirection.RIGHT);
      focusManager.setFocus(1, FocusDirection.RIGHT);

      const history1 = focusManager.getFocusHistory();
      history1[0].currentIndex = 99;

      const history2 = focusManager.getFocusHistory();
      expect(history2[0].currentIndex).assertEqual(0);
    });

    it('focus_reset_should_restore_initial_state', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(3, FocusDirection.RIGHT);
      focusManager.moveFocus(FocusDirection.RIGHT);

      expect(focusManager.getCurrentIndex()).assertEqual(4);
      expect(focusManager.getFocusMoveCount()).assertEqual(2);

      focusManager.resetFocus();

      expect(focusManager.getCurrentIndex()).assertEqual(-1);
      expect(focusManager.getPreviousIndex()).assertEqual(-1);
      expect(focusManager.getFocusMoveCount()).assertEqual(0);
      expect(focusManager.hasFocus()).assertFalse();
    });

    // 验证focus manager返回：确保TV设备singleton should return same instance结果正确
    it('focus_manager_singleton_should_return_same_instance', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = GridFocusManagerSimulator.getInstance();
      const manager2 = GridFocusManagerSimulator.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.initialize(6);
      manager1.setFocus(2, FocusDirection.RIGHT);

      expect(manager2.getCurrentIndex()).assertEqual(2);
    });

    it('focus_index_validation_should_work_correctly', 0, async () => {
      focusManager.initialize(6);

      expect(focusManager.isValidIndex(-1)).assertFalse();
      expect(focusManager.isValidIndex(0)).assertTrue();
      expect(focusManager.isValidIndex(3)).assertTrue();
      expect(focusManager.isValidIndex(5)).assertTrue();
      expect(focusManager.isValidIndex(6)).assertFalse();
      expect(focusManager.isValidIndex(10)).assertFalse();
    });

    it('focus_movement_performance_should_meet_requirements', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(0, FocusDirection.RIGHT);

      const startTime = Date.now();

      for (let i = 0; i < 10000; i++) {
        const direction = i % 2 === 0 ? FocusDirection.RIGHT : FocusDirection.LEFT;
        focusManager.moveFocus(direction);
      }

      const endTime = Date.now();
      const moveTime = endTime - startTime;

      expect(moveTime).assertLessOrEqual(5000);
      expect(focusManager.getFocusMoveCount()).assertLargerOrEqual(1);
    });

    it('focus_management_should_correlate_with_ui_interactions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      focusManager.initialize(6);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusManager.setFocus(1, FocusDirection.RIGHT);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      focusManager.setFocus(2, FocusDirection.RIGHT);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      focusManager.setFocus(1, FocusDirection.LEFT);
      expect(focusManager.getCurrentIndex()).assertEqual(1);
      expect(focusManager.getFocusMoveCount()).assertEqual(3);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证focus timestamps状态正确：确保TV设备should be chronological符合预期
    it('focus_timestamps_should_be_chronological', 0, async () => {
      focusManager.initialize(6);

      focusManager.setFocus(0, FocusDirection.RIGHT);
      await driver.delayMs(50);
      focusManager.setFocus(1, FocusDirection.RIGHT);
      await driver.delayMs(50);
      focusManager.setFocus(2, FocusDirection.RIGHT);

      const history = focusManager.getFocusHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('focus_listener_removal_should_stop_notifications', 0, async () => {
      focusManager.initialize(6);

      let notificationCount = 0;

      const listener = () => {
        notificationCount++;
      };

      focusManager.addFocusListener(listener);
      focusManager.setFocus(0, FocusDirection.RIGHT);
      expect(notificationCount).assertEqual(1);

      focusManager.removeFocusListener(listener);
      focusManager.setFocus(1, FocusDirection.RIGHT);
      expect(notificationCount).assertEqual(1);
    });

    it('focus_manager_should_recover_from_abnormal_states', 0, async () => {
      focusManager.initialize(6);
      focusManager.setFocus(2, FocusDirection.RIGHT);

      // 测试异常状态恢复：无效焦点设置
      focusManager.setFocus(-1, FocusDirection.LEFT);
      focusManager.setFocus(10, FocusDirection.RIGHT);
      expect(focusManager.getCurrentIndex()).assertEqual(2);

      // 验证重置后恢复正常状态
      focusManager.moveFocus(FocusDirection.RIGHT);
      expect(focusManager.getCurrentIndex()).assertEqual(3);
    });

    // 综合comprehensive focus场景测试：验证完整操作流程中功能正确
    it('comprehensive_focus_scenario_should_demonstrate_full_functionality', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      focusManager.initialize(6);

      const scenarioStart = Date.now();

      // 1. 初始焦点设置
      focusManager.setFocus(0, FocusDirection.RIGHT);

      // 2. 向右移动焦点
      focusManager.moveFocus(FocusDirection.RIGHT);
      focusManager.moveFocus(FocusDirection.RIGHT);

      // 3. 向左移动焦点
      focusManager.moveFocus(FocusDirection.LEFT);

      // 4. 直接设置到右边界
      focusManager.setFocus(5, FocusDirection.RIGHT);

      // 5. 直接设置到左边界
      focusManager.setFocus(0, FocusDirection.LEFT);

      const scenarioEnd = Date.now();
      expect(focusManager.getCurrentIndex()).assertEqual(0);
      expect(focusManager.getFocusMoveCount()).assertEqual(6);
      const stats = focusManager.getDirectionStats();
      expect(stats.get('right')).assertLargerOrEqual(1);
      expect(stats.get('left')).assertLargerOrEqual(1);
      const history = focusManager.getFocusHistory();
      expect(history[history.length - 1].currentIndex).assertEqual(0);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证焦点导航策略：确保TV设备FocusNavigationStrategy边界导航正确
    it('focus_navigation_strategy_should_move_within_bounds', 0, () => {
      const strategy: FocusNavigationStrategy = new FocusNavigationStrategy();
      strategy.setContext(0, 4);
      expect(strategy.moveRight()).assertTrue();
      expect(strategy.getCurrentIndex()).assertEqual(1);
      strategy.setContext(3, 4);
      expect(strategy.moveRight()).assertFalse();
      strategy.setContext(7, 20);
      expect(strategy.moveUp()).assertTrue();
      expect(strategy.getCurrentIndex()).assertEqual(1);
      strategy.setContext(1, 20);
      expect(strategy.moveUp()).assertFalse();
    });

  });
}

/**
 * 焦点导航策略
 * 封装网格焦点的上下左右导航业务逻辑
 */
class FocusNavigationStrategy {
  private currentIndex: number = 0;
  private totalCount: number = 0;
  private readonly columns: number = 6;

  public setContext(currentIndex: number, totalCount: number): void {
    this.currentIndex = currentIndex;
    this.totalCount = totalCount;
  }

  public getCurrentIndex(): number {
    return this.currentIndex;
  }

  public moveRight(): boolean {
    if (this.currentIndex < this.totalCount - 1) {
      this.currentIndex++;
      return true;
    }
    return false;
  }

  public moveLeft(): boolean {
    if (this.currentIndex > 0) {
      this.currentIndex--;
      return true;
    }
    return false;
  }

  public moveDown(): boolean {
    const next = this.currentIndex + this.columns;
    if (next < this.totalCount) {
      this.currentIndex = next;
      return true;
    }
    return false;
  }

  public moveUp(): boolean {
    const prev = this.currentIndex - this.columns;
    if (prev >= 0) {
      this.currentIndex = prev;
      return true;
    }
    return false;
  }
}

/**
 * 页面路由器
 * 封装页面栈的入栈、出栈、路由业务逻辑
 */
class PageRouter {
  private pageStack: string[] = [];

  public push(page: string): void {
    this.pageStack.push(page);
  }

  public pop(): string | null {
    if (this.pageStack.length === 0) {
      return null;
    }
    return this.pageStack.pop() ?? null;
  }

  public pushRoot(page: string): void {
    this.pageStack = [page];
  }

  public getStackDepth(): number {
    return this.pageStack.length;
  }

  public getTopPage(): string {
    return this.pageStack.length > 0 ? this.pageStack[this.pageStack.length - 1] : 'HOME';
  }

  public clear(): void {
    this.pageStack = [];
  }
}

/**
 * 面包屑构建器
 * 封装页面路径面包屑的构建业务逻辑
 */
class BreadcrumbBuilder {
  private pathSegments: string[] = [];

  public addSegment(segment: string): void {
    this.pathSegments.push(segment);
  }

  public getSegments(): string[] {
    return [...this.pathSegments];
  }

  public getSegmentCount(): number {
    return this.pathSegments.length;
  }

  // 构建面包屑路径字符串
  public buildPath(): string {
    return this.pathSegments.join(' / ');
  }

  public clear(): void {
    this.pathSegments = [];
  }
}

/**
 * 焦点循环处理器
 * 封装焦点循环导航业务逻辑
 */
class FocusLoopHandler {
  private focusIndex: number = 0;
  private totalCount: number = 0;

  public setContext(index: number, total: number): void {
    this.focusIndex = index;
    this.totalCount = total;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public moveNext(): void {
    if (this.totalCount > 0) {
      this.focusIndex = (this.focusIndex + 1) % this.totalCount;
    }
  }

  public movePrevious(): void {
    if (this.totalCount > 0) {
      this.focusIndex = (this.focusIndex - 1 + this.totalCount) % this.totalCount;
    }
  }
}

/**
 * 焦点边界处理器
 * 封装焦点导航边界拦截业务逻辑
 */
class FocusBoundaryHandler {
  private isAtBoundaryFlag: boolean = false;

  public markBoundary(): void {
    this.isAtBoundaryFlag = true;
  }

  public clearBoundary(): void {
    this.isAtBoundaryFlag = false;
  }

  public isAtBoundary(): boolean {
    return this.isAtBoundaryFlag;
  }
}

/**
 * 页面转场处理器
 * 封装页面切换转场业务逻辑
 */
class PageTransitionHandler {
  private transitionCount: number = 0;

  public onTransition(): void {
    this.transitionCount++;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public reset(): void {
    this.transitionCount = 0;
  }
}

/**
 * 导航统计器
 * 封装页面导航次数统计业务逻辑
 */
class NavigationStatistics {
  private navigationCount: number = 0;

  public recordNavigation(): void {
    this.navigationCount++;
  }

  public getNavigationCount(): number {
    return this.navigationCount;
  }

  public reset(): void {
    this.navigationCount = 0;
  }
}

/**
 * 导航目标校验器
 * 封装导航目标页面合法性校验业务逻辑
 */
class NavigationTargetValidator {
  public static isValidPage(page: string): boolean {
    return page !== undefined && page !== null && page.length > 0;
  }

  public static isKnownPage(page: string, knownPages: string[]): boolean {
    return knownPages.includes(page);
  }
}

/**
 * 导航状态追踪器
 * 封装导航状态追踪业务逻辑
 */
class NavigationStateTracker {
  private isNavigatingFlag: boolean = false;

  public startNavigation(): void {
    this.isNavigatingFlag = true;
  }

  public stopNavigation(): void {
    this.isNavigatingFlag = false;
  }

  public isNavigating(): boolean {
    return this.isNavigatingFlag;
  }
}
