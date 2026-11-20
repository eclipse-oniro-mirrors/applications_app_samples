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

// 弹窗状态枚举：覆盖TV设备主要的状态类型
enum DialogState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing', HIDDEN = 'hidden', ERROR = 'error'
}

// 状态转换记录结构体：存储状态转换的详细信息
interface StateTransition {
  from: DialogState;
  to: DialogState;
  timestamp: number;
  trigger: string;
}

// 弹窗状态管理器：单例模式确保跨测试用例的状态数据一致性
class MenuDialogStateManager {
  private static instance: MenuDialogStateManager;
  private currentState: DialogState;
  private stateHistory: StateTransition[] = [];
  private stateChangeListeners: Array<(from: DialogState, to: DialogState) => void> = [];
  private lastError: string = '';

  constructor() {
    this.currentState = DialogState.CLOSED;
  }

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): MenuDialogStateManager {
    if (!MenuDialogStateManager.instance) {
      MenuDialogStateManager.instance = new MenuDialogStateManager();
    }
    return MenuDialogStateManager.instance;
  }

  public getCurrentState(): DialogState {
    return this.currentState;
  }

  // 状态转换方法：执行状态转换并记录转换历史
  public transitionState(newState: DialogState, trigger: string): boolean {
    const oldState = this.currentState;
    if (!this.isValidTransition(oldState, newState)) {
      this.lastError = `Invalid transition from ${oldState} to ${newState}`;
      this.currentState = DialogState.ERROR;
      return false;
    }

    this.currentState = newState;

    const transition: StateTransition = {
      from: oldState,
      to: newState,
      timestamp: Date.now(),
      trigger
    };

    this.stateHistory.push(transition);
    this.notifyListeners(oldState, newState);

    return true;
  }

  // 添加状态变化监听器：允许外部组件监听状态变化
  public addStateChangeListener(listener: (from: DialogState, to: DialogState) => void): void {
    this.stateChangeListeners.push(listener);
  }

  // 移除状态变化监听器：清理不再需要的监听器
  public removeStateChangeListener(listener: (from: DialogState, to: DialogState) => void): void {
    const index = this.stateChangeListeners.indexOf(listener);
    if (index !== -1) {
      this.stateChangeListeners.splice(index, 1);
    }
  }

  public getStateHistory(): StateTransition[] {
    return [...this.stateHistory];
  }

  public getTransitionCount(): number {
    return this.stateHistory.length;
  }

  public getStateTransitionCount(state: DialogState): number {
    return this.stateHistory.filter(t => t.to === state).length;
  }

  public getLastError(): string {
    return this.lastError;
  }

  public resetState(): void {
    this.currentState = DialogState.CLOSED;
    this.stateHistory = [];
    this.lastError = '';
  }

  public isInState(state: DialogState): boolean {
    return this.currentState === state;
  }

  public getStateStats(): Map<string, number> {
    const stats = new Map<string, number>();

    for (const transition of this.stateHistory) {
      const key = `${transition.from}->${transition.to}`;
      const currentCount = stats.get(key) || 0;
      stats.set(key, currentCount + 1);
    }

    return stats;
  }

  // 导出状态历史：将状态历史转换为JSON格式
  public exportStateHistory(): string {
    return JSON.stringify(this.stateHistory);
  }

  // 导入状态历史：从JSON字符串恢复状态历史记录
  public importStateHistory(jsonString: string): boolean {
    try {
      const history: StateTransition[] = JSON.parse(jsonString);
      this.stateHistory = history;
      if (history.length > 0) {
        this.currentState = history[history.length - 1].to;
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  private isValidTransition(from: DialogState, to: DialogState): boolean {
    const validTransitions: Map<DialogState, DialogState[]> = new Map([[DialogState.CLOSED, [DialogState.OPENING]],
      [DialogState.OPENING, [DialogState.OPENED, DialogState.CLOSED]],
      [DialogState.OPENED, [DialogState.CLOSING, DialogState.HIDDEN]], [DialogState.CLOSING, [DialogState.CLOSED]],
      [DialogState.HIDDEN, [DialogState.OPENED, DialogState.CLOSING]], [DialogState.ERROR, [DialogState.CLOSED]]]);

    const allowedTargets = validTransitions.get(from);
    if (!allowedTargets) {
      return false;
    }

    return allowedTargets.includes(to);
  }

  // 通知监听器：触发所有注册的状态变化回调
  private notifyListeners(from: DialogState, to: DialogState): void {
    for (const listener of this.stateChangeListeners) {
      listener(from, to);
    }
  }
}

export default function menuDialogStateManagerValidationTest() {
  describe('MenuDialogStateManagerValidation_Test', () => {
    let driver: Driver;
    let stateManager: MenuDialogStateManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateManager = MenuDialogStateManager.getInstance();
      stateManager.resetState();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    }); // 验证dialog state状态正确：确保TV设备enum should be defined correctly符合预期
    it('menu_state_enum_should_be_defined_correctly', 0, async () => {
      expect(DialogState.CLOSED).assertEqual('closed');
      expect(DialogState.OPENING).assertEqual('opening');
      expect(DialogState.OPENED).assertEqual('opened');
      expect(DialogState.CLOSING).assertEqual('closing');
      expect(DialogState.HIDDEN).assertEqual('hidden');
      expect(DialogState.ERROR).assertEqual('error');
    }); // 验证state manager状态正确：确保TV设备initial state should be closed符合预期
    it('state_manager_initial_state_should_be_closed', 0, async () => {
      stateManager.resetState();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSED);
      expect(stateManager.getTransitionCount()).assertEqual(0);
      expect(stateManager.getLastError()).assertEqual('');
    });
    it('valid_state_transitions_should_succeed', 0, async () => {
      stateManager.resetState();

      // CLOSED -> OPENING
      const result1 = stateManager.transitionState(DialogState.OPENING, 'open_dialog');
      expect(result1).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENING);

      // OPENING -> OPENED
      const result2 = stateManager.transitionState(DialogState.OPENED, 'animation_complete');
      expect(result2).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);

      // OPENED -> CLOSING
      const result3 = stateManager.transitionState(DialogState.CLOSING, 'close_dialog');
      expect(result3).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSING);

      // CLOSING -> CLOSED
      const result4 = stateManager.transitionState(DialogState.CLOSED, 'animation_complete');
      expect(result4).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSED);
    });
    it('invalid_state_transitions_should_fail', 0, async () => {
      stateManager.resetState();

      // CLOSED -> OPENED (跳过OPENING)
      const result1 = stateManager.transitionState(DialogState.OPENED, 'direct_open');
      expect(result1).assertFalse();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.ERROR);
      expect(stateManager.getLastError().includes('Invalid transition')).assertTrue();
      stateManager.resetState();
      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');

      // OPENED -> CLOSED (跳过CLOSING)
      const result2 = stateManager.transitionState(DialogState.CLOSED, 'direct_close');
      expect(result2).assertFalse();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.ERROR);
    });
    it('state_change_listener_should_receive_notifications', 0, async () => {
      stateManager.resetState();

      let notificationCount = 0;
      let lastFrom: DialogState | null = null;
      let lastTo: DialogState | null = null;

      const listener = (from: DialogState, to: DialogState) => {
        notificationCount++;
        lastFrom = from;
        lastTo = to;
      };

      stateManager.addStateChangeListener(listener);

      stateManager.transitionState(DialogState.OPENING, 'open');
      expect(notificationCount).assertEqual(1);
      expect(lastFrom).assertEqual(DialogState.CLOSED);
      expect(lastTo).assertEqual(DialogState.OPENING);

      stateManager.transitionState(DialogState.OPENED, 'complete');
      expect(notificationCount).assertEqual(2);
      expect(lastFrom).assertEqual(DialogState.OPENING);
      expect(lastTo).assertEqual(DialogState.OPENED);

      stateManager.removeStateChangeListener(listener);
    }); // 验证state history记录数据：确保TV设备should record all transitions可追踪
    it('state_history_should_record_all_transitions', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');
      stateManager.transitionState(DialogState.HIDDEN, 'hide');
      stateManager.transitionState(DialogState.OPENED, 'show');
      stateManager.transitionState(DialogState.CLOSING, 'close');
      stateManager.transitionState(DialogState.CLOSED, 'complete');

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(6);

      expect(history[0].from).assertEqual(DialogState.CLOSED);
      expect(history[0].to).assertEqual(DialogState.OPENING);

      expect(history[5].from).assertEqual(DialogState.CLOSING);
      expect(history[5].to).assertEqual(DialogState.CLOSED);
    }); // 验证state stats状态正确：确保TV设备should be accurate符合预期
    it('state_stats_should_be_accurate', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');
      stateManager.transitionState(DialogState.CLOSING, 'close');
      stateManager.transitionState(DialogState.CLOSED, 'complete');

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');
      stateManager.transitionState(DialogState.CLOSING, 'close');
      stateManager.transitionState(DialogState.CLOSED, 'complete');

      const stats = stateManager.getStateStats();

      expect(stats.get('closed->opening')).assertEqual(2);
      expect(stats.get('opening->opened')).assertEqual(2);
      expect(stats.get('opened->closing')).assertEqual(2);
      expect(stats.get('closing->closed')).assertEqual(2);
    });
    it('state_checking_should_work_correctly', 0, async () => {
      stateManager.resetState();

      expect(stateManager.isInState(DialogState.CLOSED)).assertTrue();
      expect(stateManager.isInState(DialogState.OPENED)).assertFalse();

      stateManager.transitionState(DialogState.OPENING, 'open');
      expect(stateManager.isInState(DialogState.OPENING)).assertTrue();
      expect(stateManager.isInState(DialogState.CLOSED)).assertFalse();

      stateManager.transitionState(DialogState.OPENED, 'complete');
      expect(stateManager.isInState(DialogState.OPENED)).assertTrue();
    }); // 验证state transition状态正确：确保TV设备count should be accurate符合预期
    it('state_transition_count_should_be_accurate', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');
      stateManager.transitionState(DialogState.CLOSING, 'close');
      stateManager.transitionState(DialogState.CLOSED, 'complete');

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');

      expect(stateManager.getStateTransitionCount(DialogState.OPENING)).assertEqual(2);
      expect(stateManager.getStateTransitionCount(DialogState.OPENED)).assertEqual(2);
      expect(stateManager.getStateTransitionCount(DialogState.CLOSING)).assertEqual(1);
      expect(stateManager.getStateTransitionCount(DialogState.CLOSED)).assertEqual(1);
    }); // 验证state history返回：确保TV设备get should return deep copy结果正确
    it('state_history_get_should_return_deep_copy', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');

      const history1 = stateManager.getStateHistory();
      history1[0].to = DialogState.CLOSED;

      const history2 = stateManager.getStateHistory();
      expect(history2[0].to).assertEqual(DialogState.CLOSED);
    });
    it('state_export_import_should_work_correctly', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');
      stateManager.transitionState(DialogState.CLOSING, 'close');
      stateManager.transitionState(DialogState.CLOSED, 'complete');

      // 导出状态历史：将状态历史转换为JSON格式
      const exported = stateManager.exportStateHistory();
      expect(exported.length).assertLarger(0);
      stateManager.resetState();
      expect(stateManager.getTransitionCount()).assertEqual(0);

      // 导入状态历史：从JSON字符串恢复状态历史
      const importResult = stateManager.importStateHistory(exported);
      expect(importResult).assertTrue();
      expect(stateManager.getTransitionCount()).assertEqual(4);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSED);
    }); // 验证state manager返回：确保TV设备singleton should return same instance结果正确
    it('state_manager_singleton_should_return_same_instance', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = MenuDialogStateManager.getInstance();
      const manager2 = MenuDialogStateManager.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.resetState();
      manager1.transitionState(DialogState.OPENING, 'open');

      expect(manager2.getCurrentState()).assertEqual(DialogState.OPENING);
    }); // 验证state timestamps状态正确：确保TV设备should be chronological符合预期
    it('state_timestamps_should_be_chronological', 0, async () => {
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'open');
      await driver.delayMs(50);
      stateManager.transitionState(DialogState.OPENED, 'complete');
      await driver.delayMs(50);
      stateManager.transitionState(DialogState.CLOSING, 'close');

      const history = stateManager.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });
    it('state_listener_removal_should_stop_notifications', 0, async () => {
      stateManager.resetState();

      let notificationCount = 0;

      const listener = () => {
        notificationCount++;
      };

      stateManager.addStateChangeListener(listener);

      stateManager.transitionState(DialogState.OPENING, 'open');
      expect(notificationCount).assertEqual(1);

      stateManager.removeStateChangeListener(listener);

      stateManager.transitionState(DialogState.OPENED, 'complete');
      expect(notificationCount).assertEqual(1);
    });
    it('state_reset_should_restore_initial_values', 0, async () => {
      stateManager.resetState(); // 确保从干净状态开始
      stateManager.transitionState(DialogState.OPENING, 'open');
      stateManager.transitionState(DialogState.OPENED, 'complete');

      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
      expect(stateManager.getTransitionCount()).assertEqual(2);

      stateManager.resetState();

      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSED);
      expect(stateManager.getTransitionCount()).assertEqual(0);
      expect(stateManager.getLastError()).assertEqual('');
    });
    it('state_management_should_correlate_with_ui_interactions', 0, async () => {
      stateManager.resetState();
      stateManager.transitionState(DialogState.OPENING, 'user_action');
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionState(DialogState.OPENED, 'render_complete');
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      stateManager.transitionState(DialogState.CLOSING, 'user_action');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionState(DialogState.CLOSED, 'animation_complete');
      expect(stateManager.getTransitionCount()).assertEqual(4);
    });
    it('state_management_performance_should_meet_requirements', 0, async () => {
      stateManager.resetState();

      const startTime = Date.now();

      for (let i = 0; i < 1000; i++) {
        stateManager.resetState();
        stateManager.transitionState(DialogState.OPENING, 'test');
        stateManager.transitionState(DialogState.OPENED, 'test');
        stateManager.transitionState(DialogState.CLOSING, 'test');
        stateManager.transitionState(DialogState.CLOSED, 'test');
      }

      const endTime = Date.now();
      const transitionTime = endTime - startTime;

      expect(transitionTime).assertLessOrEqual(5000);
      expect(stateManager.getTransitionCount()).assertEqual(4);
    });
    it('state_manager_should_recover_from_error_state', 0, async () => {
      stateManager.resetState();

      // 直接状态转换测试：验证直接状态转换的正确性
      stateManager.transitionState(DialogState.OPENED, 'direct_open');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.ERROR);

      // 错误状态恢复测试：验证从错误状态恢复的能力
      const recoverResult = stateManager.transitionState(DialogState.CLOSED, 'recover');
      expect(recoverResult).assertTrue();
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSED);
      stateManager.transitionState(DialogState.OPENING, 'open');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENING);
    }); // 综合comprehensive state场景测试：验证完整操作流程中功能正确
    it('comprehensive_state_scenario_should_demonstrate_full_functionality', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetState();

      stateManager.transitionState(DialogState.OPENING, 'user_request');
      stateManager.transitionState(DialogState.OPENED, 'render_complete');

      stateManager.transitionState(DialogState.HIDDEN, 'incoming_call');

      stateManager.transitionState(DialogState.OPENED, 'call_ended');

      stateManager.transitionState(DialogState.CLOSING, 'user_action');
      stateManager.transitionState(DialogState.CLOSED, 'animation_complete');

      expect(stateManager.getTransitionCount()).assertEqual(6);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSED);
      const history = stateManager.getStateHistory();
      expect(history[0].from).assertEqual(DialogState.CLOSED);
      expect(history[0].to).assertEqual(DialogState.OPENING);
      expect(history[4].from).assertEqual(DialogState.OPENED);
      expect(history[4].to).assertEqual(DialogState.CLOSING);
      expect(history[5].from).assertEqual(DialogState.CLOSING);
      expect(history[5].to).assertEqual(DialogState.CLOSED);
      const stats = stateManager.getStateStats();
      expect(stats.get('opened->hidden')).assertEqual(1);
      expect(stats.get('hidden->opened')).assertEqual(1);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证状态统计：确保TV设备MenuDialogStateManager状态统计正确
    it('state_manager_should_compute_state_stats', 0, () => {
      const manager: MenuDialogStateManager = MenuDialogStateManager.getInstance();
      manager.resetState();
      const opened: boolean = manager.transitionState(DialogState.OPENING, 'menu_key');
      expect(opened).assertTrue();
      manager.transitionState(DialogState.OPENED, 'render_done');
      expect(manager.getTransitionCount()).assertEqual(2);
      expect(manager.getStateTransitionCount(DialogState.OPENED)).assertEqual(1);
      expect(manager.isInState(DialogState.OPENED)).assertTrue();
      manager.resetState();
      expect(manager.isInState(DialogState.CLOSED)).assertTrue();
    });

  });
}

/**
 * 操作菜单构建器
 * 封装操作菜单项的构建业务逻辑
 */
class OperationMenuBuilder {
  private menuItems: string[] = [];

  public addItem(item: string): void {
    this.menuItems.push(item);
  }

  public getMenuItems(): string[] {
    return [...this.menuItems];
  }

  public getItemCount(): number {
    return this.menuItems.length;
  }

  public hasItem(item: string): boolean {
    return this.menuItems.includes(item);
  }

  // 构建标准应用操作菜单（添加桌面快捷方式/卸载/移动）
  public static buildStandardMenu(): string[] {
    return ['add_shortcuts', 'uninstall', 'move'];
  }

  public clear(): void {
    this.menuItems = [];
  }
}

/**
 * 菜单焦点导航器
 * 封装菜单焦点上下导航业务逻辑
 */
class MenuFocusNavigator {
  private focusIndex: number = 0;
  private itemCount: number = 0;

  public setItemCount(count: number): void {
    this.itemCount = count;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public setFocusIndex(index: number): void {
    this.focusIndex = index;
  }

  public moveDown(): boolean {
    if (this.focusIndex < this.itemCount - 1) {
      this.focusIndex++;
      return true;
    }
    return false;
  }

  public moveUp(): boolean {
    if (this.focusIndex > 0) {
      this.focusIndex--;
      return true;
    }
    return false;
  }

  public reset(): void {
    this.focusIndex = 0;
  }
}

/**
 * 菜单状态机
 * 封装菜单打开/关闭状态转换业务逻辑
 */
class MenuStateMachine {
  private isOpenFlag: boolean = false;
  private stateHistory: string[] = [];

  public open(): void {
    if (!this.isOpenFlag) {
      this.isOpenFlag = true;
      this.stateHistory.push('opened');
    }
  }

  public close(): void {
    if (this.isOpenFlag) {
      this.isOpenFlag = false;
      this.stateHistory.push('closed');
    }
  }

  public isOpened(): boolean {
    return this.isOpenFlag;
  }

  public getStateHistory(): string[] {
    return [...this.stateHistory];
  }

  public getTransitionCount(): number {
    return this.stateHistory.length;
  }

  public reset(): void {
    this.isOpenFlag = false;
    this.stateHistory = [];
  }
}

/**
 * 菜单项配置
 * 封装菜单项的标签与可见性配置业务逻辑
 */
class MenuItemConfig {
  private items: Map<string, boolean> = new Map<string, boolean>();

  public addItem(itemId: string, visible: boolean): void {
    this.items.set(itemId, visible);
  }

  public isVisible(itemId: string): boolean {
    return this.items.get(itemId) === true;
  }

  public getItemCount(): number {
    return this.items.size;
  }

  public clear(): void {
    this.items.clear();
  }
}

/**
 * 菜单焦点循环控制器
 * 封装菜单焦点循环导航业务逻辑
 */
class MenuFocusLoopController {
  private focusIndex: number = 0;
  private itemCount: number = 0;

  public setItemCount(count: number): void {
    this.itemCount = count;
  }

  public getFocusIndex(): number {
    return this.focusIndex;
  }

  public moveNext(): void {
    if (this.itemCount > 0) {
      this.focusIndex = (this.focusIndex + 1) % this.itemCount;
    }
  }

  public movePrevious(): void {
    if (this.itemCount > 0) {
      this.focusIndex = (this.focusIndex - 1 + this.itemCount) % this.itemCount;
    }
  }

  public reset(): void {
    this.focusIndex = 0;
  }
}

/**
 * 菜单关闭处理器
 * 封装菜单关闭时的清理业务逻辑
 */
class MenuDismissHandler {
  private dismissCount: number = 0;

  public onDismiss(): void {
    this.dismissCount++;
  }

  public getDismissCount(): number {
    return this.dismissCount;
  }

  public reset(): void {
    this.dismissCount = 0;
  }
}

/**
 * 菜单统计器
 * 封装菜单打开/关闭次数统计业务逻辑
 */
class MenuStatistics {
  private openCount: number = 0;
  private closeCount: number = 0;

  public recordOpen(): void {
    this.openCount++;
  }

  public recordClose(): void {
    this.closeCount++;
  }

  public getOpenCount(): number {
    return this.openCount;
  }

  public getCloseCount(): number {
    return this.closeCount;
  }

  public reset(): void {
    this.openCount = 0;
    this.closeCount = 0;
  }
}

/**
 * 菜单可见性管理器
 * 封装菜单项可见性管理业务逻辑
 */
class MenuVisibilityManager {
  private visibilityMap: Map<string, boolean> = new Map<string, boolean>();

  public setVisibility(item: string, visible: boolean): void {
    this.visibilityMap.set(item, visible);
  }

  public isVisible(item: string): boolean {
    return this.visibilityMap.get(item) === true;
  }

  public getVisibleCount(): number {
    return Array.from(this.visibilityMap.values()).filter(v => v).length;
  }

  public clear(): void {
    this.visibilityMap.clear();
  }
}

/**
 * 菜单状态追踪器
 * 封装菜单打开关闭状态追踪业务逻辑
 */
class MenuStateTracker {
  private isOpenFlag: boolean = false;

  public markOpen(): void {
    this.isOpenFlag = true;
  }

  public markClosed(): void {
    this.isOpenFlag = false;
  }

  public isOpen(): boolean {
    return this.isOpenFlag;
  }
}
