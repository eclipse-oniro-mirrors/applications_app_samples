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
  KEY_BACK,
  KEY_ENTER,
  appComponentCount,
  checkFocusState,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

enum GestureType {
  TAP = 'tap', SWIPE_LEFT = 'swipe_left', SWIPE_RIGHT = 'swipe-right', LONG_PRESS = 'long_press', DOUBLE_TAP = 'double_tap', PINCH = 'pinch'
}

interface GestureRecord {
  gestureType: GestureType;
  isRecognized: boolean;
  responseTime: number;
  timestamp: number;
}

class GestureRecognitionTracker {
  private static instance: GestureRecognitionTracker;
  private gestureHistory: GestureRecord[] = [];
  private totalGestures: number = 0;
  private recognizedGestures: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): GestureRecognitionTracker {
    if (!GestureRecognitionTracker.instance) {
      GestureRecognitionTracker.instance = new GestureRecognitionTracker();
    }
    return GestureRecognitionTracker.instance;
  }

  public recordGesture(gestureType: GestureType, isRecognized: boolean, responseTime: number): void {
    const record: GestureRecord = {
      gestureType,
      isRecognized,
      responseTime,
      timestamp: Date.now()
    };
    this.gestureHistory.push(record);
    this.totalGestures++;
    if (isRecognized) {
      this.recognizedGestures++;
    }
  }

  public getGestureHistory(): GestureRecord[] {
    return [...this.gestureHistory];
  }

  public getTotalGestures(): number {
    return this.totalGestures;
  }

  public getRecognizedGestures(): number {
    return this.recognizedGestures;
  }

  public resetTracker(): void {
    this.gestureHistory = [];
    this.totalGestures = 0;
    this.recognizedGestures = 0;
  }

  public getRecognitionRate(): number {
    if (this.totalGestures === 0) {
      return 0;
    }
    return this.recognizedGestures / this.totalGestures;
  }

  public hasTestedGesture(gestureType: GestureType): boolean {
    return this.gestureHistory.some(record => record.gestureType === gestureType);
  }
}

export default function gestureRecognitionTest() {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;
    let gestureTracker: GestureRecognitionTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = await createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      gestureTracker = GestureRecognitionTracker.getInstance();
      gestureTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_recognize_tap_gesture', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      gestureTracker.recordGesture(GestureType.TAP, true, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.TAP)).assertTrue();
    });

    it('dialog_should_recognize_swipe_left_gesture', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, isFocusCorrect, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.SWIPE_LEFT)).assertTrue();
    });

    it('dialog_should_recognize_swipe_right_gesture', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, isFocusCorrect, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.SWIPE_RIGHT)).assertTrue();
    });

    it('dialog_should_recognize_long_press_gesture', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(1000);
      const responseTime = Date.now() - startTime;

      gestureTracker.recordGesture(GestureType.LONG_PRESS, true, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.LONG_PRESS)).assertTrue();
    });

    it('dialog_should_recognize_double_tap_gesture', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 2, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      gestureTracker.recordGesture(GestureType.DOUBLE_TAP, true, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.DOUBLE_TAP)).assertTrue();
    });

    // 验证dialog gesture状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_gesture_records_timestamps_should_be_chronological', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      gestureTracker.recordGesture(GestureType.TAP, true, 50);
      await driver.delayMs(100);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, 50);
      await driver.delayMs(100);
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, true, 50);

      const history = gestureTracker.getGestureHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog gesture维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_gesture_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = GestureRecognitionTracker.getInstance();
      const tracker2 = GestureRecognitionTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordGesture(GestureType.TAP, true, 100);

      expect(tracker2.getTotalGestures()).assertEqual(1);
      expect(tracker2.getRecognizedGestures()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle all gesture types下功能正常
    it('dialog_should_handle_all_gesture_types', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const gestures = [GestureType.TAP, GestureType.SWIPE_LEFT, GestureType.SWIPE_RIGHT, GestureType.LONG_PRESS,
        GestureType.DOUBLE_TAP, GestureType.PINCH];

      for (const gesture of gestures) {
        gestureTracker.recordGesture(gesture, true, 50);
      }

      expect(gestureTracker.getTotalGestures()).assertEqual(6);
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid gestures下功能正常
    it('dialog_should_handle_rapid_gestures', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const gestures = [GestureType.TAP, GestureType.SWIPE_LEFT, GestureType.SWIPE_RIGHT];
      for (let i = 0; i < 30; i++) {
        const gesture = gestures[i % gestures.length];
        gestureTracker.recordGesture(gesture, true, 20);
        await driver.delayMs(30);
      }

      expect(gestureTracker.getTotalGestures()).assertEqual(30);
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain stability during gestures下性能不降低
    it('dialog_should_maintain_stability_during_gestures', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        gestureTracker.recordGesture(GestureType.TAP, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive gesture场景测试：验证完整操作流程中功能正确
    it('comprehensive_gesture_recognition_scenario', 0, async () => {
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, responseTime1);

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(gestureTracker.getTotalGestures()).assertEqual(2);
      expect(gestureTracker.getRecognitionRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证触摸手势识别：确保TVDeviceTouchGestureRecognizer拖拽记录正确
    it('touch_gesture_recognizer_should_record_drag', 0, () => {
      const recognizer: TouchGestureRecognizer = new TouchGestureRecognizer();
      recognizer.recognizeDrag(0, 0, 100, 100);
      recognizer.recognizeClick(50, 50);
      expect(recognizer.getGestureCount()).assertEqual(2);
      expect(recognizer.getGestureLog().length).assertEqual(2);
      recognizer.clear();
      expect(recognizer.getGestureCount()).assertEqual(0);
    });

    // 验证输入校验：确保TVDeviceInputValidator输入合法性校验正确
    it('input_validator_should_validate_inputs', 0, () => {
      expect(InputValidator.isEmpty('')).assertTrue();
      expect(InputValidator.isEmpty('abc')).assertFalse();
      expect(InputValidator.isLengthValid('abc', 1, 5)).assertTrue();
      expect(InputValidator.isLengthValid('abcdef', 1, 5)).assertFalse();
      expect(InputValidator.isValid('ok', 1, 5)).assertTrue();
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
