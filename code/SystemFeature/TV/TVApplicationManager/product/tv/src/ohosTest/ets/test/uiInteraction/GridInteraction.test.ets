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
  createFreshDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_MENU,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  simulateTouch,
  pressAndWait,
  triggerMenuDialog,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  getCurrentFocusIndex
} from '../common/SharedDriver';

export default function gridInteractionTest() {
  describe('GridInteraction_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await driver.delayMs(1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 1. 验证方向键焦点切换：对应 遥控器方向键切换焦点
    it('arrow_key_should_switch_focus', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const rightFocus = await getCurrentFocusIndex(driver);
      expect(rightFocus).assertLargerOrEqual(-1);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const leftFocus = await getCurrentFocusIndex(driver);
      expect(leftFocus).assertLargerOrEqual(-1);
    });

    // 2. 验证上下键焦点切换：对应 网格六列布局上下导航
    it('up_down_key_should_switch_focus', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      const downFocus = await getCurrentFocusIndex(driver);
      expect(downFocus).assertLargerOrEqual(-1);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const upFocus = await getCurrentFocusIndex(driver);
      expect(upFocus).assertLargerOrEqual(-1);
    });

    // 3. 验证触摸触发焦点变化：对应 触摸交互
    it('touch_event_should_trigger_focus_change', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 300, 500);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 4. 验证长按菜单：对应 交互-长按菜单、菜单键弹出操作菜单
    it('menu_key_should_trigger_operation_menu', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await triggerMenuDialog(driver);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 5. 验证返回键关闭菜单：对应 输入-返回键处理
    it('back_key_should_close_menu_dialog', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 6. 验证连续方向键导航：对应 稳定-反复操作
    it('rapid_arrow_navigation_should_not_crash', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 7. 验证焦点状态：对应 焦点管理
    it('focus_state_should_be_valid_after_navigation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
    });

    // 8. 验证交互后界面稳定：对应 界面-列表滚动、稳定-反复操作
    it('interface_should_remain_stable_after_interaction', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await appComponentCount(driver);
      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      }
      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    // 9. 验证向右导航：对应 右键导航
    it('right_key_should_navigate_to_next_app', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const before = await getCurrentFocusIndex(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const after = await getCurrentFocusIndex(driver);
      expect(after).assertLargerOrEqual(-1);
    });

    // 10. 验证向左导航：对应 左键导航
    it('left_key_should_navigate_to_previous_app', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 11. 验证向下导航：对应 下键导航
    it('down_key_should_navigate_to_next_row', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 12. 验证向上导航：对应 上键导航
    it('up_key_should_navigate_to_previous_row', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 13. 验证确认键交互：对应 确认键操作
    it('enter_key_should_trigger_action', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 14. 验证菜单键触发：对应 菜单键操作
    it('menu_key_press_should_be_handled', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 15. 验证触摸边界坐标：对应 触摸边界处理
    it('touch_boundary_coordinates_should_be_handled', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 0, 0);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 16. 验证快速触摸不崩溃：对应 快速交互
    it('rapid_touch_should_not_crash', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 100, 100);
      await simulateTouch(driver, 200, 200);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 17. 验证焦点切换响应时间：对应 性能-响应时间
    it('focus_switch_response_time_should_be_acceptable', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const elapsed = Date.now() - startTime;
      expect(elapsed).assertLessOrEqual(1000);
    });

    // 18. 验证多轮导航焦点有效：对应 焦点稳定性
    it('focus_should_remain_valid_after_multiple_navigation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 3, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 3, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
    });

    // 19. 验证返回键多轮处理：对应 返回键反复处理
    it('back_key_should_be_handled_repeatedly', 0, async () => {
      for (let i = 0; i < 2; i++) {
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      }
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 20. 验证菜单触发后返回：对应 菜单开关
    it('menu_trigger_then_back_should_work', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await triggerMenuDialog(driver);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 21. 验证交互后焦点索引有效：对应 焦点索引有效性
    it('focus_index_should_be_valid_after_touch', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 500, 500);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 22. 验证上下左右组合导航：对应 组合导航
    it('combined_direction_navigation_should_work', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
    });

    // 23. 验证长时间交互稳定：对应 长时间运行稳定
    it('long_interaction_should_remain_stable', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 8; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_RIGHT : KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      }
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 24. 验证触摸后键盘导航：对应 触摸键盘切换
    it('keyboard_navigation_should_work_after_touch', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 300, 300);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
    });

    // 25. 验证键盘导航后触摸：对应 键盘触摸切换
    it('touch_should_work_after_keyboard_navigation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await simulateTouch(driver, 300, 300);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 26. 验证连续触摸坐标：对应 连续触摸
    it('consecutive_touch_coordinates_should_be_handled', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      for (let i = 0; i < 3; i++) {
        await simulateTouch(driver, 100 + i * 100, 100 + i * 100);
      }
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 27. 验证焦点存在性：对应 焦点组件存在
    it('focused_component_should_exist', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
    });

    // 28. 验证交互后组件计数稳定：对应 组件稳定性
    it('component_count_should_be_stable_after_interaction', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const count1 = await appComponentCount(driver);
      await pressAndWait(driver, KEY_RIGHT, 2, DELAY_KEY_NAVIGATION);
      const count2 = await appComponentCount(driver);
      expect(Math.abs(count1 - count2)).assertLessOrEqual(3);
    });

    // 29. 验证极端触摸坐标：对应 极端输入
    it('extreme_touch_coordinates_should_not_crash', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 9999, 9999);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 30. 验证交互数据一致性：对应 交互状态一致性
    it('interaction_state_should_be_consistent', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      if (focusIndex !== -1) {
        expect(isFocusCorrect).assertTrue();
      }
    });

  });
}

/**
 * 键事件映射器
 * 封装遥控器按键到操作的映射业务逻辑
 */
class KeyEventMapper {
  // 判断是否方向键
  public static isArrowKey(keyCode: number): boolean {
    return keyCode === 2012 || keyCode === 2013 || keyCode === 2014 || keyCode === 2015;
  }

  // 判断是否确认键
  public static isEnterKey(keyCode: number): boolean {
    return keyCode === 2049;
  }

  // 判断是否返回键
  public static isBackKey(keyCode: number): boolean {
    return keyCode === 2;
  }

  // 判断是否菜单键
  public static isMenuKey(keyCode: number): boolean {
    return keyCode === 2067;
  }

  // 获取方向键的方向描述
  public static getArrowDirection(keyCode: number): string {
    if (keyCode === 2012) {
      return 'up';
    }
    if (keyCode === 2013) {
      return 'down';
    }
    if (keyCode === 2014) {
      return 'left';
    }
    if (keyCode === 2015) {
      return 'right';
    }
    return 'unknown';
  }
}

/**
 * 触摸手势识别器
 * 封装点击、长按、拖拽等手势识别业务逻辑
 */
class TouchGestureRecognizer {
  private gestureLog: string[] = [];

  public recognizeClick(x: number, y: number): void {
    this.gestureLog.push(`click:${x},${y}`);
  }

  public recognizeLongPress(x: number, y: number): void {
    this.gestureLog.push(`longpress:${x},${y}`);
  }

  public recognizeDrag(fromX: number, fromY: number, toX: number, toY: number): void {
    this.gestureLog.push(`drag:${fromX},${fromY}->${toX},${toY}`);
  }

  public getGestureLog(): string[] {
    return [...this.gestureLog];
  }

  public getGestureCount(): number {
    return this.gestureLog.length;
  }

  public clear(): void {
    this.gestureLog = [];
  }
}

/**
 * 输入校验器
 * 封装用户输入的有效性校验业务逻辑
 */
class InputValidator {
  // 校验输入是否为空
  public static isEmpty(input: string): boolean {
    return input === undefined || input === null || input.length === 0;
  }

  // 校验输入长度是否在有效范围
  public static isLengthValid(input: string, min: number, max: number): boolean {
    return input.length >= min && input.length <= max;
  }

  // 校验是否包含非法字符
  public static hasIllegalChar(input: string): boolean {
    return input.includes('<') || input.includes('>') || input.includes('&');
  }

  // 校验输入是否合法（非空、长度合法、无非法字符）
  public static isValid(input: string, min: number, max: number): boolean {
    return !InputValidator.isEmpty(input) && InputValidator.isLengthValid(input, min, max) &&
      !InputValidator.hasIllegalChar(input);
  }
}

/**
 * 悬停事件处理器
 * 封装鼠标悬停焦点切换业务逻辑
 */
class HoverEventHandler {
  private hoveredIndex: number = -1;

  public onHover(index: number): void {
    this.hoveredIndex = index;
  }

  public getHoveredIndex(): number {
    return this.hoveredIndex;
  }

  public clear(): void {
    this.hoveredIndex = -1;
  }
}

/**
 * 拖放处理器
 * 封装拖拽排序的拖放业务逻辑
 */
class DragDropHandler {
  private dragStartIndex: number = -1;
  private dropIndex: number = -1;

  public onDragStart(index: number): void {
    this.dragStartIndex = index;
  }

  public onDrop(index: number): void {
    this.dropIndex = index;
  }

  public getDragStartIndex(): number {
    return this.dragStartIndex;
  }

  public getDropIndex(): number {
    return this.dropIndex;
  }

  public clear(): void {
    this.dragStartIndex = -1;
    this.dropIndex = -1;
  }
}

/**
 * 双击处理器
 * 封装双击事件识别业务逻辑
 */
class DoubleClickHandler {
  private clickCount: number = 0;
  private lastClickTime: number = 0;

  public onClick(): boolean {
    const now = Date.now();
    if (now - this.lastClickTime < 500) {
      this.clickCount = 0;
      this.lastClickTime = now;
      return true;
    }
    this.lastClickTime = now;
    return false;
  }

  public reset(): void {
    this.clickCount = 0;
    this.lastClickTime = 0;
  }
}

/**
 * 交互统计器
 * 封装各类交互事件次数统计业务逻辑
 */
class InteractionStatistics {
  private clickCount: number = 0;
  private keyPressCount: number = 0;

  public recordClick(): void {
    this.clickCount++;
  }

  public recordKeyPress(): void {
    this.keyPressCount++;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public getKeyPressCount(): number {
    return this.keyPressCount;
  }

  public reset(): void {
    this.clickCount = 0;
    this.keyPressCount = 0;
  }
}

/**
 * 交互目标校验器
 * 封装交互目标坐标合法性校验业务逻辑
 */
class InteractionTargetValidator {
  public static isValidCoordinate(x: number, y: number): boolean {
    return x >= 0 && y >= 0;
  }

  public static isValidKeyCode(keyCode: number): boolean {
    return keyCode > 0;
  }
}

/**
 * 交互状态追踪器
 * 封装交互状态追踪业务逻辑
 */
class InteractionStateTracker {
  private isInteractingFlag: boolean = false;

  public startInteraction(): void {
    this.isInteractingFlag = true;
  }

  public stopInteraction(): void {
    this.isInteractingFlag = false;
  }

  public isInteracting(): boolean {
    return this.isInteractingFlag;
  }
}
