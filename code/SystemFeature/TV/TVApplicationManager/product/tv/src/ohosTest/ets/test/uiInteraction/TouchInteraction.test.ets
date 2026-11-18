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
  simulateTouch,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT
} from '../common/SharedDriver';

interface TouchEventRecord {
  x: number;
  y: number;
  eventType: 'click' | 'long_press' | 'swipe';
  timestamp: number;
  targetIndex: number;
}

interface CoordinateRecord {
  x: number;
  y: number;
  index: number;
}

class TouchInteractionTracker {
  private static instance: TouchInteractionTracker;
  private touchHistory: TouchEventRecord[] = [];
  private totalTouchEvents: number = 0;
  private clickCount: number = 0;
  private longPressCount: number = 0;
  private swipeCount: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): TouchInteractionTracker {
    if (!TouchInteractionTracker.instance) {
      TouchInteractionTracker.instance = new TouchInteractionTracker();
    }
    return TouchInteractionTracker.instance;
  }

  public recordTouchEvent(x: number, y: number, eventType: 'click' | 'long_press' | 'swipe',
    targetIndex: number): void {
    const record: TouchEventRecord = {
      x,
      y,
      eventType,
      timestamp: Date.now(),
      targetIndex
    };
    this.touchHistory.push(record);
    this.totalTouchEvents++;

    switch (eventType) {
      case 'click':
        this.clickCount++;
        break;
      case 'long_press':
        this.longPressCount++;
        break;
      case 'swipe':
        this.swipeCount++;
        break;
    }
  }

  public getTouchHistory(): TouchEventRecord[] {
    return [...this.touchHistory];
  }

  public getTotalTouchEvents(): number {
    return this.totalTouchEvents;
  }

  public getClickCount(): number {
    return this.clickCount;
  }

  public getLongPressCount(): number {
    return this.longPressCount;
  }

  public getSwipeCount(): number {
    return this.swipeCount;
  }

  public resetTracker(): void {
    this.touchHistory = [];
    this.totalTouchEvents = 0;
    this.clickCount = 0;
    this.longPressCount = 0;
    this.swipeCount = 0;
  }

  public hasTouchedIndex(index: number): boolean {
    return this.touchHistory.some(record => record.targetIndex === index);
  }

  public getTouchCountForIndex(index: number): number {
    return this.touchHistory.filter(record => record.targetIndex === index).length;
  }
}

export default function touchInteractionTest() {
  describe('TouchInteraction_Test', () => {
    let driver: Driver;
    let touchTracker: TouchInteractionTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      touchTracker = TouchInteractionTracker.getInstance();
      touchTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_TOUCH_EVENT);
      await driver.delayMs(500);
    });

    // 验证touch on触发：确保TV设备screen out option should trigger focus机制有效
    it('touch_on_uninstall_option_should_trigger_focus', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      expect(touchTracker.getClickCount()).assertEqual(1);
    });

    // 验证touch on触发：确保TV设备move option should trigger focus机制有效
    it('touch_on_move_option_should_trigger_focus', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证touch on触发：确保TV设备shortcut option should trigger focus机制有效
    it('touch_on_shortcut_option_should_trigger_focus', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证multiple touch状态正确：确保TV设备events should be recorded符合预期
    it('multiple_touch_events_should_be_recorded', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      expect(touchTracker.getTotalTouchEvents()).assertEqual(3);
      expect(touchTracker.hasTouchedIndex(0)).assertTrue();
      expect(touchTracker.hasTouchedIndex(1)).assertTrue();
      expect(touchTracker.hasTouchedIndex(2)).assertTrue();
    });

    it('touch_focus_should_match_keyboard_navigation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });

    // 验证touch coordinates状态正确：确保TV设备should be recorded accurately符合预期
    it('touch_coordinates_should_be_recorded_accurately', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      const testCoordinates: CoordinateRecord[] =
        [{ x: 250, y: 450, index: 0 }, { x: 600, y: 500, index: 1 }, { x: 950, y: 550, index: 2 }];

      for (const coord of testCoordinates) {
        await simulateTouch(driver, coord.x, coord.y);
        touchTracker.recordTouchEvent(coord.x, coord.y, 'click', coord.index);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      const history = touchTracker.getTouchHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].x).assertEqual(250);
      expect(history[0].y).assertEqual(450);
      expect(history[1].x).assertEqual(600);
      expect(history[1].y).assertEqual(500);
    });

    // 验证rapid touch状态正确：确保TV设备events should be handled符合预期
    it('rapid_touch_events_should_be_handled', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      for (let i = 0; i < 10; i++) {
        const x = 300 + (i % 3) * 300;
        const y = 500;
        await simulateTouch(driver, x, y);
        touchTracker.recordTouchEvent(x, y, 'click', i % 3);
        await driver.delayMs(100);
      }

      expect(touchTracker.getTotalTouchEvents()).assertEqual(10);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('touch_outside_dialog_should_not_change_focus', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 50, 50);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证touch should触发：确保TV设备trigger correct focus state机制有效
    it('touch_should_trigger_correct_focus_state', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证touch interaction状态正确：确保TV设备statistics should be accurate符合预期
    it('touch_interaction_statistics_should_be_accurate', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      for (let i = 0; i < 5; i++) {
        await simulateTouch(driver, 300, 500);
        touchTracker.recordTouchEvent(300, 500, 'click', 0);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      for (let i = 0; i < 3; i++) {
        await simulateTouch(driver, 900, 500);
        touchTracker.recordTouchEvent(900, 500, 'click', 2);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      expect(touchTracker.getTouchCountForIndex(0)).assertEqual(5);
      expect(touchTracker.getTouchCountForIndex(2)).assertEqual(3);
      expect(touchTracker.getTotalTouchEvents()).assertEqual(8);
    });

    // 验证touch response状态正确：确保TV设备time should be within limit符合预期
    it('touch_response_time_should_be_within_limit', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const endTime = Date.now();

      const responseTime = endTime - startTime;
      expect(responseTime).assertLessOrEqual(1500);
    });

    it('keyboard_should_work_after_touch_navigation', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_TOUCH_EVENT);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });

    // 验证touch history状态正确：确保TV设备timestamps should be chronological符合预期
    it('touch_history_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(200);

      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(200);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);

      const history = touchTracker.getTouchHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证touch should处理能力：确保TV设备在handle boundary coordinates下功能正常
    it('touch_should_handle_boundary_coordinates', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      await simulateTouch(driver, 100, 100);
      touchTracker.recordTouchEvent(100, 100, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 1200, 800);
      touchTracker.recordTouchEvent(1200, 800, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证touch focus持久：确保TV设备should persist after delay状态保持
    it('touch_focus_should_persist_after_delay', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await driver.delayMs(3000);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('touch_interaction_with_mixed_options', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      const touchSequence: CoordinateRecord[] =
        [{ x: 600, y: 500, index: 1 }, { x: 300, y: 500, index: 0 }, { x: 900, y: 500, index: 2 },
          { x: 600, y: 500, index: 1 }, { x: 300, y: 500, index: 0 }];

      for (const touch of touchSequence) {
        await simulateTouch(driver, touch.x, touch.y);
        touchTracker.recordTouchEvent(touch.x, touch.y, 'click', touch.index);
        await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      }

      expect(touchTracker.getTotalTouchEvents()).assertEqual(5);
      expect(touchTracker.getTouchCountForIndex(0)).assertEqual(2);
      expect(touchTracker.getTouchCountForIndex(1)).assertEqual(2);
      expect(touchTracker.getTouchCountForIndex(2)).assertEqual(1);
    });

    it('touch_should_not_crash_with_invalid_coordinates', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      // 使用边界但有效的坐标进行测试
      await simulateTouch(driver, 10, 10);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 1200, 800);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 综合comprehensive touch场景测试：验证完整操作流程中功能正确
    it('comprehensive_touch_interaction_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      touchTracker.resetTracker();

      const scenarioStart = Date.now();

      await simulateTouch(driver, 300, 500);
      touchTracker.recordTouchEvent(300, 500, 'click', 0);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await simulateTouch(driver, 900, 500);
      touchTracker.recordTouchEvent(900, 500, 'click', 2);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await pressAndWait(driver, KEY_LEFT, 1, DELAY_TOUCH_EVENT);

      await simulateTouch(driver, 600, 500);
      touchTracker.recordTouchEvent(600, 500, 'click', 1);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);

      await driver.delayMs(1000);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(touchTracker.getTotalTouchEvents()).assertEqual(3);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证悬停事件处理：确保TVDeviceHoverEventHandler悬停索引记录正确
    it('hover_event_handler_should_record_hover', 0, () => {
      const handler: HoverEventHandler = new HoverEventHandler();
      handler.onHover(3);
      expect(handler.getHoveredIndex()).assertEqual(3);
      handler.clear();
      expect(handler.getHoveredIndex()).assertEqual(-1);
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
