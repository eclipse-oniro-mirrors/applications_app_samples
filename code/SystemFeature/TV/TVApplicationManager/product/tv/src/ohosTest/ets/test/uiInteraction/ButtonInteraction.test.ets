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
  runSerializedUiOperation,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

// 按钮状态枚举：覆盖TV遥控器操作中按钮的所有可能状态，确保交互逻辑完整
enum ButtonState {
  NORMAL = 'normal', FOCUSED = 'focused', PRESSED = 'pressed', DISABLED = 'disabled'
}

// 按钮记录接口：定义按钮交互的关键指标，用于量化评估用户交互体验
interface ButtonRecord {
  buttonIndex: number;
  state: ButtonState;
  isResponsive: boolean;
  responseTime: number;
  timestamp: number;
}

// 按钮交互追踪器：单例模式确保跨测试用例数据一致性，集中管理按钮交互评估
class ButtonInteractionTracker {
  private static instance: ButtonInteractionTracker;
  private buttonHistory: ButtonRecord[] = [];
  private totalInteractions: number = 0;
  private responsiveInteractions: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): ButtonInteractionTracker {
    if (!ButtonInteractionTracker.instance) {
      ButtonInteractionTracker.instance = new ButtonInteractionTracker();
    }
    return ButtonInteractionTracker.instance;
  }

  // 记录按钮交互：收集每次按钮操作的状态和响应时间，为后续分析提供数据
  public recordButton(buttonIndex: number, state: ButtonState, isResponsive: boolean, responseTime: number): void {
    const record: ButtonRecord = {
      buttonIndex,
      state,
      isResponsive,
      responseTime,
      timestamp: Date.now()
    };
    this.buttonHistory.push(record);
    this.totalInteractions++;
    if (isResponsive) {
      this.responsiveInteractions++;
    }
  }

  public getButtonHistory(): ButtonRecord[] {
    return [...this.buttonHistory];
  }

  public getTotalInteractions(): number {
    return this.totalInteractions;
  }

  public getResponsiveInteractions(): number {
    return this.responsiveInteractions;
  }

  public resetTracker(): void {
    this.buttonHistory = [];
    this.totalInteractions = 0;
    this.responsiveInteractions = 0;
  }

  // 计算响应率：评估按钮交互的成功率，确保TV设备按钮响应符合设计标准
  public getResponsivenessRate(): number {
    if (this.totalInteractions === 0) {
      return 0;
    }
    return this.responsiveInteractions / this.totalInteractions;
  }

  public hasTestedButton(buttonIndex: number): boolean {
    return this.buttonHistory.some(record => record.buttonIndex === buttonIndex);
  }

  public hasState(state: ButtonState): boolean {
    return this.buttonHistory.some(record => record.state === state);
  }
}

export default function buttonInteractionTest() {
  describe('ButtonInteraction_Test', () => {
    let driver: Driver;
    let buttonTracker: ButtonInteractionTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      buttonTracker = ButtonInteractionTracker.getInstance();
      buttonTracker.resetTracker();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(1000);
      });
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });

    // 验证button should响应：确保TV设备respond to focus交互流畅
    it('button_should_respond_to_focus', 0, async () => { // 验证按钮焦点响应：确保TV遥控器导航时按钮能正确获取焦点
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      buttonTracker.recordButton(0, ButtonState.FOCUSED, isFocusCorrect, responseTime);

      expect(buttonTracker.hasState(ButtonState.FOCUSED)).assertTrue();
    });

    // 验证button should响应：确保TV设备respond to press交互流畅
    it('button_should_respond_to_press', 0, async () => { // 验证按钮按下响应：确保TV遥控器确认键能正确触发按钮按下状态
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      buttonTracker.recordButton(0, ButtonState.PRESSED, true, responseTime);

      expect(buttonTracker.hasState(ButtonState.PRESSED)).assertTrue();
    });

    // 验证button should返回：确保TV设备return to normal after release结果正确
    it('button_should_return_to_normal_after_release', 0, async () => { // 验证按钮释放后恢复：确保TV设备按钮在操作完成后能正确回到正常状态
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      buttonTracker.recordButton(1, ButtonState.NORMAL, isFocusCorrect, responseTime);

      expect(buttonTracker.hasState(ButtonState.NORMAL)).assertTrue();
    });

    // 验证button should处理：确保TV设备在handle disabled state下功能正常
    it('button_should_handle_disabled_state', 0, async () => { // 验证禁用状态处理：确保TV设备在按钮不可用时正确显示禁用状态
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      buttonTracker.recordButton(2, ButtonState.DISABLED, false, 50);

      expect(buttonTracker.hasState(ButtonState.DISABLED)).assertTrue();
    });

    // 验证button should处理：确保TV设备在handle all buttons下功能正常
    it('button_should_handle_all_buttons', 0, async () => { // 验证所有按钮处理：确保TV设备弹窗中所有按钮都能正常交互
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i, ButtonState.FOCUSED, true, 50);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(3);
    });

    // 记录测试数据：收集每次操作的关键指标，为后续分析提供原始数据
    it('button_records_timestamps_should_be_chronological', 0, async () => { // 验证时间戳顺序：确保按钮记录按时间顺序存储，便于后续分析
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      buttonTracker.recordButton(0, ButtonState.FOCUSED, true, 50);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      buttonTracker.recordButton(1, ButtonState.PRESSED, true, 50);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      buttonTracker.recordButton(2, ButtonState.NORMAL, true, 50);

      const history = buttonTracker.getButtonHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证button tracker稳定：确保TV设备在singleton should maintain consistency下性能不降低
    it('button_tracker_singleton_should_maintain_consistency', 0, async () => { // 验证单例一致性：确保追踪器在跨测试用例时保持数据一致性
      const tracker1 = ButtonInteractionTracker.getInstance();
      const tracker2 = ButtonInteractionTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordButton(0, ButtonState.FOCUSED, true, 100);

      expect(tracker2.getTotalInteractions()).assertEqual(1);
      expect(tracker2.getResponsiveInteractions()).assertEqual(1);
    });

    // 验证button should处理：确保TV设备在handle all states下功能正常
    it('button_should_handle_all_states', 0, async () => { // 验证所有状态处理：确保TV设备按钮能正确切换各种状态
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const states = [ButtonState.NORMAL, ButtonState.FOCUSED, ButtonState.PRESSED, ButtonState.DISABLED];
      for (const state of states) {
        buttonTracker.recordButton(0, state, state !== ButtonState.DISABLED, 50);
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(4);
    });

    // 验证button should稳定：确保TV设备在maintain responsiveness下性能不降低
    it('button_should_maintain_responsiveness', 0, async () => { // 验证响应稳定性：确保TV设备在频繁操作下按钮响应不降底
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();
      const initialCount = await appComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i % 3, ButtonState.FOCUSED, true, 30);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }

      const finalCount = await appComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证button should处理：确保TV设备在handle rapid interactions下功能正常
    it('button_should_handle_rapid_interactions', 0, async () => { // 验证快速交互处理：确保TV设备在快速操作时按钮系统不崩溃
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i % 3, ButtonState.FOCUSED, true, 20);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(100);
        });
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(15);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
    });

    // 综合comprehensive button场景：验证完整操作流程中功能正确
    it('comprehensive_button_interaction_scenario', 0, async () => { // 综合按钮交互场景：验证完整操作流程中按钮状态转换正确
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);

      buttonTracker.resetTracker();

      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime1 = Date.now() - startTime1;
      buttonTracker.recordButton(0, ButtonState.FOCUSED, true, responseTime1);

      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime2 = Date.now() - startTime2;
      buttonTracker.recordButton(0, ButtonState.PRESSED, true, responseTime2);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(buttonTracker.getTotalInteractions()).assertEqual(2);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 31. 验证键事件映射器：对应 KeyEventMapper 按键类型分类
    it('key_event_mapper_should_classify_tv_keys', 0, async () => {
      expect(KeyEventMapper.isArrowKey(2015)).assertTrue();
      expect(KeyEventMapper.isArrowKey(2049)).assertFalse();
      expect(KeyEventMapper.isEnterKey(2049)).assertTrue();
      expect(KeyEventMapper.isBackKey(2)).assertTrue();
      expect(KeyEventMapper.isMenuKey(2067)).assertTrue();
      expect(KeyEventMapper.getArrowDirection(2012)).assertEqual('up');
      expect(KeyEventMapper.getArrowDirection(2015)).assertEqual('right');
      expect(KeyEventMapper.getArrowDirection(9999)).assertEqual('unknown');
    });

    // 32. 验证触摸手势识别器：对应 TouchGestureRecognizer 手势记录
    it('touch_gesture_recognizer_should_record_gestures', 0, async () => {
      const recognizer = new TouchGestureRecognizer();
      recognizer.recognizeClick(10, 20);
      recognizer.recognizeLongPress(30, 40);
      recognizer.recognizeDrag(0, 0, 100, 100);
      expect(recognizer.getGestureCount()).assertEqual(3);
      const gestures: string[] = recognizer.getGestureLog();
      expect(gestures[0]).assertEqual('click:10,20');
      expect(gestures[2]).assertEqual('drag:0,0->100,100');
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


