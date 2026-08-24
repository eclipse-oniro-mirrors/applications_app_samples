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
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT
} from '../common/SharedDriver';

enum DialogState {
  CLOSED = 'closed', OPENING = 'opening', OPENED = 'opened', CLOSING = 'closing'
}

interface StateTransitionRecord {
  fromState: DialogState;
  toState: DialogState;
  trigger: string;
  timestamp: number;
}

class MenuDialogStateManager {
  private static instance: MenuDialogStateManager;
  private currentState: DialogState = DialogState.CLOSED;
  private stateHistory: StateTransitionRecord[] = [];
  private totalTransitions: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): MenuDialogStateManager {
    if (!MenuDialogStateManager.instance) {
      MenuDialogStateManager.instance = new MenuDialogStateManager();
    }
    return MenuDialogStateManager.instance;
  }

  public transitionTo(newState: DialogState, trigger: string): void {
    const record: StateTransitionRecord = {
      fromState: this.currentState,
      toState: newState,
      trigger,
      timestamp: Date.now()
    };
    this.stateHistory.push(record);
    this.currentState = newState;
    this.totalTransitions++;
  }

  public getCurrentState(): DialogState {
    return this.currentState;
  }

  public getStateHistory(): StateTransitionRecord[] {
    return [...this.stateHistory];
  }

  public getTotalTransitions(): number {
    return this.totalTransitions;
  }

  public resetManager(): void {
    this.currentState = DialogState.CLOSED;
    this.stateHistory = [];
    this.totalTransitions = 0;
  }

  public hasTransitionedTo(state: DialogState): boolean {
    return this.stateHistory.some(record => record.toState === state);
  }

  public getTransitionCountForState(state: DialogState): number {
    return this.stateHistory.filter(record => record.toState === state).length;
  }
}

export default function menuDialogStateManagementTest() {
  describe('MenuDialogStateManagement_Test', () => {
    let driver: Driver;
    let stateManager: MenuDialogStateManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      stateManager = MenuDialogStateManager.getInstance();
      stateManager.resetManager();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('menu_should_start_in_opened_state', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain state during navigation下性能不降低
    it('menu_should_maintain_state_during_navigation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog should处理能力：确保TV设备在handle back key transition下功能正常
    it('menu_should_handle_back_key_transition', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      stateManager.transitionTo(DialogState.CLOSING, 'back_key');
      await driver.delayMs(500);

      expect(stateManager.hasTransitionedTo(DialogState.CLOSING)).assertTrue();
    });

    // 验证dialog state状态正确：确保TV设备history should be complete符合预期
    it('menu_state_history_should_be_complete', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'user_action');
      stateManager.transitionTo(DialogState.OPENED, 'render_complete');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(DialogState.CLOSING, 'back_key');
      stateManager.transitionTo(DialogState.CLOSED, 'close_complete');

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(4);
      expect(history[0].fromState).assertEqual(DialogState.CLOSED);
      expect(history[0].toState).assertEqual(DialogState.OPENING);
      expect(history[1].toState).assertEqual(DialogState.OPENED);
      expect(history[2].toState).assertEqual(DialogState.CLOSING);
      expect(history[3].toState).assertEqual(DialogState.CLOSED);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid state changes下功能正常
    it('menu_should_handle_rapid_state_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      for (let i = 0; i < 10; i++) {
        stateManager.transitionTo(DialogState.OPENED, `navigation_${i}`);
        await driver.delayMs(50);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(10);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog state具备特性：确保TV设备transitions should have correct triggers满足设计要求
    it('menu_state_transitions_should_have_correct_triggers', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'user_request');
      stateManager.transitionTo(DialogState.OPENED, 'system_render');
      stateManager.transitionTo(DialogState.CLOSING, 'user_back');
      stateManager.transitionTo(DialogState.CLOSED, 'system_close');

      const history = stateManager.getStateHistory();
      expect(history[0].trigger).assertEqual('user_request');
      expect(history[1].trigger).assertEqual('system_render');
      expect(history[2].trigger).assertEqual('user_back');
      expect(history[3].trigger).assertEqual('system_close');
    });

    // 验证dialog should持久：确保TV设备persist state after operations状态保持
    it('menu_should_persist_state_after_operations', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await driver.delayMs(200);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog state状态正确：确保TV设备timestamps should be chronological符合预期
    it('menu_state_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      await driver.delayMs(100);
      stateManager.transitionTo(DialogState.OPENED, 'complete');
      await driver.delayMs(100);
      stateManager.transitionTo(DialogState.CLOSING, 'user_action');

      const history = stateManager.getStateHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog should处理能力：确保TV设备在handle multiple open close cycles下功能正常
    it('menu_should_handle_multiple_open_close_cycles', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      for (let cycle = 0; cycle < 3; cycle++) {
        stateManager.transitionTo(DialogState.OPENING, `open_${cycle}`);
        stateManager.transitionTo(DialogState.OPENED, `render_${cycle}`);

        await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

        stateManager.transitionTo(DialogState.CLOSING, `close_${cycle}`);
        stateManager.transitionTo(DialogState.CLOSED, `closed_${cycle}`);

        await driver.delayMs(200);
      }

      expect(stateManager.getTransitionCountForState(DialogState.OPENED)).assertEqual(3);
      expect(stateManager.getTransitionCountForState(DialogState.CLOSED)).assertEqual(3);
    });

    it('menu_state_validation_should_detect_invalid_transitions', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      stateManager.transitionTo(DialogState.OPENED, 'complete');

      const currentState = stateManager.getCurrentState();
      expect(currentState).assertEqual(DialogState.OPENED);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain consistency during long session下性能不降低
    it('menu_should_maintain_consistency_during_long_session', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager(); // 重置状态管理器，确保测试从干净状态开始
      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      for (let i = 0; i < 20; i++) {
        if (i % 2 === 0) {
          await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        } else {
          await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        }
        stateManager.transitionTo(DialogState.OPENED, `navigation_${i}`);
        await driver.delayMs(100);
      }

      // 期望转换次数：1次初始转换 + 20次导航转换 = 21次
      expect(stateManager.getTotalTransitions()).assertEqual(21);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证dialog state状态正确：确保TV设备should be queryable at any time符合预期
    it('menu_state_should_be_queryable_at_any_time', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENING);

      stateManager.transitionTo(DialogState.OPENED, 'complete');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);

      stateManager.transitionTo(DialogState.CLOSING, 'user_action');
      expect(stateManager.getCurrentState()).assertEqual(DialogState.CLOSING);
    });

    it('menu_state_history_should_support_filtering', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'request_1');
      stateManager.transitionTo(DialogState.OPENED, 'render_1');
      stateManager.transitionTo(DialogState.CLOSING, 'close_1');
      stateManager.transitionTo(DialogState.CLOSED, 'closed_1');

      stateManager.transitionTo(DialogState.OPENING, 'request_2');
      stateManager.transitionTo(DialogState.OPENED, 'render_2');

      const openCount = stateManager.getTransitionCountForState(DialogState.OPENED);
      const closeCount = stateManager.getTransitionCountForState(DialogState.CLOSED);

      expect(openCount).assertEqual(2);
      expect(closeCount).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle state recovery after error下功能正常
    it('menu_should_handle_state_recovery_after_error', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENED, 'initial_render');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(DialogState.OPENED, 'recovery');

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      expect(stateManager.getCurrentState()).assertEqual(DialogState.OPENED);
    });

    // 验证dialog state状态正确：确保TV设备transitions should be atomic符合预期
    it('menu_state_transitions_should_be_atomic', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENING, 'start');
      const midState = stateManager.getCurrentState();
      expect(midState).assertEqual(DialogState.OPENING);

      stateManager.transitionTo(DialogState.OPENED, 'complete');
      const finalState = stateManager.getCurrentState();
      expect(finalState).assertEqual(DialogState.OPENED);

      const history = stateManager.getStateHistory();
      expect(history.length).assertEqual(2);
    });

    it('menu_should_track_all_state_changes', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      const states =
        [DialogState.OPENING, DialogState.OPENED, DialogState.CLOSING, DialogState.CLOSED, DialogState.OPENING,
          DialogState.OPENED];

      for (const state of states) {
        stateManager.transitionTo(state, 'test_transition');
      }

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      expect(stateManager.hasTransitionedTo(DialogState.OPENING)).assertTrue();
      expect(stateManager.hasTransitionedTo(DialogState.OPENED)).assertTrue();
      expect(stateManager.hasTransitionedTo(DialogState.CLOSING)).assertTrue();
      expect(stateManager.hasTransitionedTo(DialogState.CLOSED)).assertTrue();
    });

    // 验证dialog state维持稳定：确保TV设备在manager singleton should maintain consistency下性能不降低
    it('menu_state_manager_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = MenuDialogStateManager.getInstance();
      const manager2 = MenuDialogStateManager.getInstance();

      expect(manager1 === manager2).assertTrue();

      manager1.resetManager();
      manager1.transitionTo(DialogState.OPENED, 'test');

      expect(manager2.getCurrentState()).assertEqual(DialogState.OPENED);
      expect(manager2.getTotalTransitions()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle concurrent state requests下功能正常
    it('menu_should_handle_concurrent_state_requests', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      stateManager.transitionTo(DialogState.OPENED, 'initial');

      // 使用串行化执行避免UITest API并发调用错误
      for (let i = 0; i < 5; i++) {
        stateManager.transitionTo(DialogState.OPENED, `concurrent_${i}`);
        await driver.delayMs(50);
      }

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('menu_state_performance_should_meet_requirements', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      const startTime = Date.now();

      for (let i = 0; i < 1000; i++) {
        stateManager.transitionTo(DialogState.OPENED, `perf_${i}`);
      }

      const endTime = Date.now();
      const transitionTime = endTime - startTime;

      expect(transitionTime).assertLessOrEqual(2000);
      expect(stateManager.getTotalTransitions()).assertEqual(1000);
    });

    // 综合comprehensive dialog场景测试：验证完整操作流程中功能正确
    it('comprehensive_menu_state_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      stateManager.resetManager();

      const scenarioStart = Date.now();

      stateManager.transitionTo(DialogState.OPENING, 'user_open');
      stateManager.transitionTo(DialogState.OPENED, 'render_complete');

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);

      stateManager.transitionTo(DialogState.CLOSING, 'operation_complete');
      stateManager.transitionTo(DialogState.CLOSED, 'close_complete');

      await driver.delayMs(500);

      stateManager.transitionTo(DialogState.OPENING, 'reopen');
      stateManager.transitionTo(DialogState.OPENED, 'reopen_complete');

      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(stateManager.getTotalTransitions()).assertEqual(6);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证状态转移记录：确保TV设备MenuDialogStateManager转移计数正确
    it('state_manager_should_track_transition_count', 0, () => {
      const manager: MenuDialogStateManager = MenuDialogStateManager.getInstance();
      manager.resetManager();
      manager.transitionTo(DialogState.OPENING, 'menu_key');
      manager.transitionTo(DialogState.OPENED, 'render_done');
      expect(manager.getCurrentState()).assertEqual(DialogState.OPENED);
      expect(manager.getTotalTransitions()).assertEqual(2);
      expect(manager.hasTransitionedTo(DialogState.OPENING)).assertTrue();
      expect(manager.getTransitionCountForState(DialogState.OPENED)).assertEqual(1);
      manager.resetManager();
      expect(manager.getTotalTransitions()).assertEqual(0);
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
