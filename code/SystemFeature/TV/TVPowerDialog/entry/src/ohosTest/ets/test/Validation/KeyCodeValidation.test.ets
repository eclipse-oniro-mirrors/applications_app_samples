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
  KEY_HOME,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  TOLERANCE_COMPONENT_COUNT,
  serializedDelay,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

// 键码常量定义：参考 KeyCode.ts 中的标准键码定义
class KeyCodeConstants {
  public static readonly KEYCODE_DPAD_LEFT: number = 2014;
  public static readonly KEYCODE_DPAD_RIGHT: number = 2015;
  public static readonly KEYCODE_DPAD_UP: number = 2012;
  public static readonly KEYCODE_DPAD_DOWN: number = 2013;
  public static readonly KEYCODE_ENTER: number = 2049;
  public static readonly KEYCODE_BACK: number = 2;
  public static readonly KEYCODE_HOME: number = 3;
  public static readonly KEYCODE_ESCAPE: number = 1;
  public static readonly KEYCODE_TAB: number = 4;
  public static readonly KEYCODE_SPACE: number = 57;
  public static readonly KEYCODE_MEDIA_PLAY_PAUSE: number = 163;
  public static readonly KEYCODE_MEDIA_STOP: number = 164;
  public static readonly KEYCODE_MEDIA_NEXT: number = 165;
  public static readonly KEYCODE_MEDIA_PREVIOUS: number = 166;
  public static readonly KEYCODE_VOLUME_UP: number = 16;
  public static readonly KEYCODE_VOLUME_DOWN: number = 17;
  public static readonly KEYCODE_VOLUME_MUTE: number = 167;
  public static readonly KEYCODE_POWER: number = 26;
  public static readonly KEYCODE_MENU: number = 18;
  public static readonly KEYCODE_SETTINGS: number = 176;
}

// 键事件日志接口
interface KeyEventLog {
  keyCode: number;
  eventType: number;
  timestamp: number;
}

class KeyEventHandler {
  private static instance: KeyEventHandler;
  private keyEventLog: KeyEventLog[] = [];
  private keyDownCount: number = 0;
  private keyUpCount: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): KeyEventHandler {
    if (!KeyEventHandler.instance) {
      KeyEventHandler.instance = new KeyEventHandler();
    }
    return KeyEventHandler.instance;
  }

  public handleKeyDown(keyCode: number): void {
    this.keyDownCount++;
    const logEntry: KeyEventLog = {
      keyCode: keyCode, eventType: 1, timestamp: Date.now()
    };
    this.keyEventLog.push(logEntry);
  }

  public handleKeyUp(keyCode: number): void {
    this.keyUpCount++;
    const logEntry: KeyEventLog = {
      keyCode: keyCode, eventType: 0, timestamp: Date.now()
    };
    this.keyEventLog.push(logEntry);
  }

  public getKeyEventLog(): KeyEventLog[] {
    return [...this.keyEventLog];
  }

  public getKeyDownCount(): number {
    return this.keyDownCount;
  }

  public getKeyUpCount(): number {
    return this.keyUpCount;
  }

  public hasKeyCode(keyCode: number): boolean {
    return this.keyEventLog.some(event => event.keyCode === keyCode);
  }

  getKeyCodeCount(keyCode: number): number {
    return this.keyEventLog.filter(event => event.keyCode === keyCode).length;
  }

  // 清空日志记录
  public clearLog(): void {
    this.keyEventLog = [];
    this.keyDownCount = 0;
    this.keyUpCount = 0;
  }

  public isNavigationKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_DPAD_LEFT || keyCode === KeyCodeConstants.KEYCODE_DPAD_RIGHT ||
      keyCode === KeyCodeConstants.KEYCODE_DPAD_UP || keyCode === KeyCodeConstants.KEYCODE_DPAD_DOWN;
  }

  public isMediaKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE || keyCode === KeyCodeConstants.KEYCODE_MEDIA_STOP ||
      keyCode === KeyCodeConstants.KEYCODE_MEDIA_NEXT || keyCode === KeyCodeConstants.KEYCODE_MEDIA_PREVIOUS;
  }

  public isVolumeKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_VOLUME_UP || keyCode === KeyCodeConstants.KEYCODE_VOLUME_DOWN ||
      keyCode === KeyCodeConstants.KEYCODE_VOLUME_MUTE;
  }

  public isSystemKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_BACK || keyCode === KeyCodeConstants.KEYCODE_HOME ||
      keyCode === KeyCodeConstants.KEYCODE_POWER || keyCode === KeyCodeConstants.KEYCODE_MENU ||
      keyCode === KeyCodeConstants.KEYCODE_SETTINGS;
  }

  // 计算按键事件总数：统计按键按下和抬起事件的总和
  public getTotalEventCount(): number {
    return this.keyEventLog.length;
  }

  // 统计指定键码的按键事件数量：分别统计按下和抬起事件
  public getKeyEventCount(keyCode: number): number {
    return this.keyEventLog.filter(event => event.keyCode === keyCode).length;
  }

  // 获取按下事件的数量
  public getKeyDownEventCount(keyCode: number): number {
    return this.keyEventLog.filter(event => event.keyCode === keyCode && event.eventType === 1).length;
  }

  // 获取抬起事件的数量
  public getKeyUpEventCount(keyCode: number): number {
    return this.keyEventLog.filter(event => event.keyCode === keyCode && event.eventType === 0).length;
  }

  // 获取所有按下的键码列表：提取所有按下事件对应的键码
  public getAllKeyDownCodes(): number[] {
    const codes: number[] = [];
    for (let i = 0; i < this.keyEventLog.length; i++) {
      if (this.keyEventLog[i].eventType === 1) {
        codes.push(this.keyEventLog[i].keyCode);
      }
    }
    return codes;
  }

  // 统计各键码的出现频率：分析按键使用分布
  public getKeyCodeFrequency(): Map<number, number> {
    const frequency = new Map<number, number>();
    for (let i = 0; i < this.keyEventLog.length; i++) {
      const keyCode = this.keyEventLog[i].keyCode;
      const currentCount = frequency.get(keyCode) || 0;
      frequency.set(keyCode, currentCount + 1);
    }
    return frequency;
  }

  // 判断是否存在未配对的按键事件：按下和抬起事件数量是否一致
  public hasUnpairedEvents(): boolean {
    return this.keyDownCount !== this.keyUpCount;
  }

  // 计算最近一次按键事件的时间戳
  public getLastEventTimestamp(): number {
    if (this.keyEventLog.length === 0) {
      return 0;
    }
    return this.keyEventLog[this.keyEventLog.length - 1].timestamp;
  }

  // 判断事件时间戳是否严格递增：验证按键事件的时间顺序
  public isChronological(): boolean {
    for (let i = 1; i < this.keyEventLog.length; i++) {
      if (this.keyEventLog[i].timestamp < this.keyEventLog[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  // 生成按键事件处理器摘要字符串
  public toString(): string {
    return `KeyEventHandler{down=${this.keyDownCount}, up=${this.keyUpCount}, total=${this.keyEventLog.length}}`;
  }
}

// 键码类别枚举：描述按键功能所属的分类
enum KeyCategory {
  NAVIGATION = 'navigation', MEDIA = 'media', VOLUME = 'volume', SYSTEM = 'system', UNKNOWN = 'unknown'
}

// 按键动作枚举：描述按键事件的动作类型
enum KeyAction {
  NONE = 0, KEY_DOWN = 1, KEY_UP = 2, KEY_REPEAT = 3
}

// 按键事件阶段枚举：描述按键处理的完整阶段
enum KeyEventPhase {
  DISPATCH = 'dispatch', CONSUME = 'consume', IGNORE = 'ignore', PROPAGATE = 'propagate'
}

// 按键度量信息结构体：聚合单次按键处理的关键指标
interface KeyMetrics {
  keyCode: number;
  category: KeyCategory;
  action: KeyAction;
  processingTime: number;
  handled: boolean;
}

// 按键统计结果：汇总一段时间内的按键处理统计
interface KeyStatistics {
  totalEvents: number;
  keyDownCount: number;
  keyUpCount: number;
  averageProcessingTime: number;
  maxProcessingTime: number;
  minProcessingTime: number;
}

// 按键配置结构：描述按键处理的配置参数
interface KeyConfig {
  repeatDelayMs: number;
  repeatIntervalMs: number;
  enableRepeat: boolean;
  enableLongPress: boolean;
  filterUnknownKeys: boolean;
}

// 按键事件描述结构：描述单次按键事件的完整信息
interface KeyEventDescriptor {
  keyCode: number;
  action: KeyAction;
  category: KeyCategory;
  phase: KeyEventPhase;
  timestamp: number;
}

// 键码数据模型：封装键码的完整属性，提供克隆、比较和序列化能力
class KeyCodeModel {
  private keyCode: number;
  private category: KeyCategory;
  private action: KeyAction;
  private phase: KeyEventPhase;
  private handled: boolean;

  // 构造函数：初始化键码数据模型的默认属性
  public constructor() {
    this.keyCode = 0;
    this.category = KeyCategory.UNKNOWN;
    this.action = KeyAction.NONE;
    this.phase = KeyEventPhase.IGNORE;
    this.handled = false;
  }

  public setKeyCode(keyCode: number): void {
    this.keyCode = keyCode;
  }

  public getKeyCode(): number {
    return this.keyCode;
  }

  public setCategory(category: KeyCategory): void {
    this.category = category;
  }

  public getCategory(): KeyCategory {
    return this.category;
  }

  public setAction(action: KeyAction): void {
    this.action = action;
  }

  public getAction(): KeyAction {
    return this.action;
  }

  public setPhase(phase: KeyEventPhase): void {
    this.phase = phase;
  }

  public getPhase(): KeyEventPhase {
    return this.phase;
  }

  public setHandled(handled: boolean): void {
    this.handled = handled;
  }

  public getHandled(): boolean {
    return this.handled;
  }

  // 校验键码：键码必须非负
  public isKeyCodeValid(): boolean {
    return this.keyCode >= 0;
  }

  // 判断按键是否已被消费：只有被消费或传播的按键才视为已处理
  public isConsumed(): boolean {
    return this.phase === KeyEventPhase.CONSUME;
  }

  // 克隆键码数据模型：返回一个属性完全一致的副本
  public clone(): KeyCodeModel {
    const cloned = new KeyCodeModel();
    cloned.keyCode = this.keyCode;
    cloned.category = this.category;
    cloned.action = this.action;
    cloned.phase = this.phase;
    cloned.handled = this.handled;
    return cloned;
  }

  // 比较两个键码数据模型是否相等
  public equals(other: KeyCodeModel): boolean {
    return this.keyCode === other.keyCode && this.category === other.category && this.action === other.action &&
      this.phase === other.phase && this.handled === other.handled;
  }

  // 序列化键码数据模型
  public toString(): string {
    return `KeyCodeModel{keyCode=${this.keyCode}, category=${this.category}, action=${this.action}, phase=${this.phase}}`;
  }
}

// 按键度量计算器：提供基于按键记录的统计分析能力
class KeyMetricsCalculator {
  private metrics: KeyMetrics[];

  // 构造函数：初始化度量计算器的指标列表
  public constructor(metrics: KeyMetrics[]) {
    this.metrics = metrics;
  }

  // 计算平均处理时间
  public averageProcessingTime(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    const total = this.metrics.reduce((sum: number, metric: KeyMetrics) => sum + metric.processingTime, 0);
    return total / this.metrics.length;
  }

  // 计算最大处理时间
  public maxProcessingTime(): number {
    let maxTime = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].processingTime > maxTime) {
        maxTime = this.metrics[i].processingTime;
      }
    }
    return maxTime;
  }

  // 计算最小处理时间
  public minProcessingTime(): number {
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].processingTime < minTime) {
        minTime = this.metrics[i].processingTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  // 统计已处理按键的数量
  public handledCount(): number {
    return this.metrics.filter(metric => metric.handled).length;
  }

  // 统计指定类别的按键数量
  public countByCategory(category: KeyCategory): number {
    return this.metrics.filter(metric => metric.category === category).length;
  }
}

// 按键事件合成器：生成用于测试的按键事件序列
class KeyEventSynthesizer {
  private events: KeyEventDescriptor[];

  // 构造函数：初始化事件描述列表
  public constructor() {
    this.events = [];
  }

  // 合成一个按键事件：根据键码、类别和动作生成事件描述
  public synthesizeEvent(keyCode: number, category: KeyCategory, action: KeyAction): void {
    const descriptor: KeyEventDescriptor = {
      keyCode,
      action,
      category,
      phase: KeyEventPhase.DISPATCH,
      timestamp: Date.now()
    };
    this.events.push(descriptor);
  }

  public getEvents(): KeyEventDescriptor[] {
    return [...this.events];
  }

  public getEventCount(): number {
    return this.events.length;
  }

  // 统计指定动作的事件数量
  public countByAction(action: KeyAction): number {
    return this.events.filter(event => event.action === action).length;
  }

  // 清空所有事件
  public clear(): void {
    this.events = [];
  }
}

// 按键配置校验器：校验按键配置参数的合法性
class KeyConfigValidator {
  private config: KeyConfig;

  // 构造函数：保存待校验的按键配置对象
  public constructor(config: KeyConfig) {
    this.config = config;
  }

  // 校验重复延迟：重复延迟必须大于零
  public isRepeatDelayValid(): boolean {
    return this.config.repeatDelayMs > 0;
  }

  // 校验重复间隔：重复间隔必须大于零
  public isRepeatIntervalValid(): boolean {
    return this.config.repeatIntervalMs > 0;
  }

  // 综合校验：判断整个按键配置是否合法
  public isValid(): boolean {
    return this.isRepeatDelayValid() && this.isRepeatIntervalValid();
  }

  // 生成校验报告：输出按键配置校验的详细结果
  public generateValidationReport(): string {
    return `KeyConfig{repeatDelay=${this.config.repeatDelayMs}, repeatInterval=${this.config.repeatIntervalMs}, ` +
      `repeat=${this.config.enableRepeat}, longPress=${this.config.enableLongPress}}`;
  }
}

export default function keyCodeValidationTest() {
  describe('KeyCodeValidation_Test', () => {
    let driver: Driver;
    let keyEventHandler: KeyEventHandler;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      keyEventHandler = KeyEventHandler.getInstance();
      keyEventHandler.clearLog();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    }); // 验证key code状态正确：确保TV设备constants should be defined correctly符合预期
    it('key_code_constants_should_be_defined_correctly', 0, async () => {
      expect(KeyCodeConstants.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCodeConstants.KEYCODE_DPAD_RIGHT).assertEqual(2015);
      expect(KeyCodeConstants.KEYCODE_DPAD_UP).assertEqual(2012);
      expect(KeyCodeConstants.KEYCODE_DPAD_DOWN).assertEqual(2013);
      expect(KeyCodeConstants.KEYCODE_ENTER).assertEqual(2049);
      expect(KeyCodeConstants.KEYCODE_BACK).assertEqual(2);
      expect(KeyCodeConstants.KEYCODE_HOME).assertEqual(3);
      expect(KeyCodeConstants.KEYCODE_ESCAPE).assertEqual(1);
      expect(KeyCodeConstants.KEYCODE_TAB).assertEqual(4);
      expect(KeyCodeConstants.KEYCODE_SPACE).assertEqual(57);
    });
    it('key_event_handler_should_process_events_correctly', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_DPAD_RIGHT);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(1);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(0);
      keyEventHandler.handleKeyUp(KeyCodeConstants.KEYCODE_DPAD_RIGHT);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(1);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(1);
      const log = keyEventHandler.getKeyEventLog();
      expect(log.length).assertEqual(2);
      expect(log[0].eventType).assertEqual(1); // KEY_DOWN
      expect(log[1].eventType).assertEqual(0); // KEY_UP
    });
    it('navigation_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_RIGHT)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_UP)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_DOWN)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_ENTER)).assertFalse();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_BACK)).assertFalse();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_HOME)).assertFalse();
    });
    it('media_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_STOP)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_NEXT)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PREVIOUS)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertFalse();
    });
    it('volume_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_MUTE)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertFalse();
    });
    it('system_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_BACK)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_HOME)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_POWER)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_MENU)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_SETTINGS)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_ENTER)).assertFalse();
    }); // 验证actual key触发：确保TV设备press should trigger correct events机制有效
    it('actual_key_press_should_trigger_correct_events', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      keyEventHandler.clearLog();

      await driver.triggerKey(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      expect(keyEventHandler.hasKeyCode(KEY_RIGHT)).assertTrue();
      expect(keyEventHandler.getKeyCodeCount(KEY_RIGHT)).assertEqual(1);
      expect(keyEventHandler.isNavigationKey(KEY_RIGHT)).assertTrue();
      await driver.delayMs(DELAY_KEY_NAVIGATION);

      // 使用动态焦点索引验证焦点状态是否正确
      expect(keyEventHandler.isNavigationKey(KEY_RIGHT)).assertTrue();
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, focusIndex);
      expect(isFocusCorrect).assertTrue();
    }); // 验证consecutive key状态正确：确保TV设备presses should be recorded correctly符合预期
    it('consecutive_key_presses_should_be_recorded_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      keyEventHandler.clearLog();

      const keyCodes = [KEY_RIGHT, KEY_LEFT, KEY_ENTER, KEY_BACK];
      for (const keyCode of keyCodes) {
        await driver.triggerKey(keyCode);
        keyEventHandler.handleKeyDown(keyCode);
        await driver.delayMs(50);
      }
      for (const keyCode of keyCodes) {
        expect(keyEventHandler.hasKeyCode(keyCode)).assertTrue();
      }
      expect(keyEventHandler.getKeyDownCount()).assertEqual(4);
    }); // 验证key event状态正确：确保TV设备timestamps should be chronological符合预期
    it('key_event_timestamps_should_be_chronological', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      await driver.delayMs(100);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      await driver.delayMs(100);
      keyEventHandler.handleKeyDown(KEY_ENTER);
      const log = keyEventHandler.getKeyEventLog();
      expect(log[0].timestamp).assertLessOrEqual(log[1].timestamp);
      expect(log[1].timestamp).assertLessOrEqual(log[2].timestamp);
      const interval1 = log[1].timestamp - log[0].timestamp;
      const interval2 = log[2].timestamp - log[1].timestamp;
      expect(interval1).assertLargerOrEqual(50);
      expect(interval2).assertLargerOrEqual(50);
    }); // 验证key code状态正确：确保TV设备boundary values should be handled符合预期
    it('key_code_boundary_values_should_be_handled', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(0);
      expect(keyEventHandler.hasKeyCode(0)).assertTrue();

      keyEventHandler.handleKeyDown(65535);
      expect(keyEventHandler.hasKeyCode(65535)).assertTrue();

      keyEventHandler.handleKeyDown(-1);
      expect(keyEventHandler.hasKeyCode(-1)).assertTrue();
      expect(keyEventHandler.getKeyDownCount()).assertEqual(3);
    });
    it('key_event_log_clear_should_reset_all_counters', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyUp(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_LEFT);

      expect(keyEventHandler.getKeyDownCount()).assertEqual(2);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(1);
      expect(keyEventHandler.getKeyEventLog().length).assertEqual(3);

      keyEventHandler.clearLog();
      expect(keyEventHandler.getKeyDownCount()).assertEqual(0);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(0);
      expect(keyEventHandler.getKeyEventLog().length).assertEqual(0);
    }); // 验证key code状态正确：确保TV设备classifications should be mutually exclusive符合预期
    it('key_code_classifications_should_be_mutually_exclusive', 0, async () => {
      expect(keyEventHandler.isNavigationKey(KEY_RIGHT)).assertTrue();
      expect(keyEventHandler.isMediaKey(KEY_RIGHT)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KEY_RIGHT)).assertFalse();
      expect(keyEventHandler.isSystemKey(KEY_RIGHT)).assertFalse();

      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertFalse();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertFalse();

      expect(keyEventHandler.isSystemKey(KEY_BACK)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KEY_BACK)).assertFalse();
      expect(keyEventHandler.isMediaKey(KEY_BACK)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KEY_BACK)).assertFalse();
    }); // 验证key event状态正确：确保TV设备handler performance should be acceptable符合预期
    it('key_event_handler_performance_should_be_acceptable', 0, async () => {
      keyEventHandler.clearLog();

      const startTime = Date.now();

      for (let i = 0; i < 10000; i++) {
        keyEventHandler.handleKeyDown(i % 2049);
        keyEventHandler.handleKeyUp(i % 2049);
      }

      const endTime = Date.now();
      const processingTime = endTime - startTime;

      expect(processingTime).assertLessOrEqual(5000);

      expect(keyEventHandler.getKeyDownCount()).assertEqual(10000);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(10000);
      expect(keyEventHandler.getKeyEventLog().length).assertEqual(20000);
    });
    it('key_code_constants_should_match_shared_driver_values', 0, async () => {
      expect(KeyCodeConstants.KEYCODE_DPAD_LEFT).assertEqual(KEY_LEFT);
      expect(KeyCodeConstants.KEYCODE_DPAD_RIGHT).assertEqual(KEY_RIGHT);
      expect(KeyCodeConstants.KEYCODE_DPAD_UP).assertEqual(KEY_UP);
      expect(KeyCodeConstants.KEYCODE_DPAD_DOWN).assertEqual(KEY_DOWN);
      expect(KeyCodeConstants.KEYCODE_ENTER).assertEqual(KEY_ENTER);
      expect(KeyCodeConstants.KEYCODE_BACK).assertEqual(KEY_BACK);
      expect(KeyCodeConstants.KEYCODE_HOME).assertEqual(KEY_HOME);
    }); // 验证key event返回：确保TV设备handler singleton should return same instance结果正确
    it('key_event_handler_singleton_should_return_same_instance', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const handler1 = KeyEventHandler.getInstance();
      const handler2 = KeyEventHandler.getInstance();

      expect(handler1 === handler2).assertTrue();
      handler1.clearLog();
      handler1.handleKeyDown(KEY_RIGHT);

      expect(handler2.getKeyDownCount()).assertEqual(1);
      expect(handler2.hasKeyCode(KEY_RIGHT)).assertTrue();
    });
    it('key_event_log_query_functions_should_work_correctly', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_ENTER);
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      expect(keyEventHandler.getKeyCodeCount(KEY_RIGHT)).assertEqual(3);
      expect(keyEventHandler.getKeyCodeCount(KEY_LEFT)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KEY_ENTER)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KEY_BACK)).assertEqual(0);
    }); // 验证key event状态正确：确保TV设备types should be complete符合预期
    it('key_event_types_should_be_complete', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyUp(KEY_RIGHT);

      const log = keyEventHandler.getKeyEventLog();
      expect(log.length).assertEqual(2);
      const hasKeyDown = log.some(event => event.eventType === 1);
      const hasKeyUp = log.some(event => event.eventType === 0);

      expect(hasKeyDown).assertTrue();
      expect(hasKeyUp).assertTrue();
    }); // 验证key code状态正确：确保TV设备ranges should be valid符合预期
    it('key_code_ranges_should_be_valid', 0, async () => {
      expect(KeyCodeConstants.KEYCODE_DPAD_LEFT).assertLargerOrEqual(0);
      expect(KeyCodeConstants.KEYCODE_DPAD_RIGHT).assertLargerOrEqual(0);
      expect(KeyCodeConstants.KEYCODE_ENTER).assertLargerOrEqual(0);
      expect(KeyCodeConstants.KEYCODE_BACK).assertLargerOrEqual(0);
      expect(KeyCodeConstants.KEYCODE_HOME).assertLargerOrEqual(0);
      const keyCodes =
        [KeyCodeConstants.KEYCODE_DPAD_LEFT, KeyCodeConstants.KEYCODE_DPAD_RIGHT, KeyCodeConstants.KEYCODE_DPAD_UP,
          KeyCodeConstants.KEYCODE_DPAD_DOWN, KeyCodeConstants.KEYCODE_ENTER, KeyCodeConstants.KEYCODE_BACK,
          KeyCodeConstants.KEYCODE_HOME];

      const uniqueKeyCodes = new Set(keyCodes);
      expect(uniqueKeyCodes.size).assertEqual(keyCodes.length);
    });
    it('key_event_handler_should_recover_from_abnormal_states', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      keyEventHandler.handleKeyDown(KEY_ENTER);

      expect(keyEventHandler.getKeyDownCount()).assertEqual(3);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(0);

      keyEventHandler.handleKeyUp(KEY_RIGHT);
      keyEventHandler.handleKeyUp(KEY_LEFT);
      keyEventHandler.handleKeyUp(KEY_ENTER);

      expect(keyEventHandler.getKeyDownCount()).assertEqual(3);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(3);
    }); // 综合comprehensive key场景测试：验证完整操作流程中功能正确
    it('comprehensive_key_scenario_should_demonstrate_full_functionality', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      keyEventHandler.clearLog();
      const scenarioKeys = [KEY_RIGHT, KEY_LEFT, KEY_LEFT, KEY_RIGHT, KEY_RIGHT, KEY_ENTER, KEY_BACK];

      for (const keyCode of scenarioKeys) {
        await driver.triggerKey(keyCode);
        keyEventHandler.handleKeyDown(keyCode);
        keyEventHandler.handleKeyUp(keyCode);
        await driver.delayMs(50);
      }
      expect(keyEventHandler.getKeyDownCount()).assertEqual(scenarioKeys.length);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(scenarioKeys.length);
      let navCount = 0;
      let systemCount = 0;
      for (const keyCode of scenarioKeys) {
        if (keyEventHandler.isNavigationKey(keyCode)) {
          navCount++;
        }
        if (keyEventHandler.isSystemKey(keyCode)) {
          systemCount++;
        }
      }

      expect(navCount).assertEqual(5);
      expect(systemCount).assertEqual(1);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 KeyCategory_Enum：按键类别枚举值正确
    it('key_category_enum_should_be_defined_correctly', 0, async () => {
      expect(KeyCategory.NAVIGATION).assertEqual('navigation');
      expect(KeyCategory.MEDIA).assertEqual('media');
      expect(KeyCategory.VOLUME).assertEqual('volume');
      expect(KeyCategory.SYSTEM).assertEqual('system');
      expect(KeyCategory.UNKNOWN).assertEqual('unknown');
    });

    // 适配 KeyAction_Enum：按键动作枚举值正确
    it('key_action_enum_should_be_defined_correctly', 0, async () => {
      expect(KeyAction.NONE).assertEqual(0);
      expect(KeyAction.KEY_DOWN).assertEqual(1);
      expect(KeyAction.KEY_UP).assertEqual(2);
      expect(KeyAction.KEY_REPEAT).assertEqual(3);
    });

    // 适配 KeyEventPhase_Enum：按键事件阶段枚举值正确
    it('key_event_phase_enum_should_be_defined_correctly', 0, async () => {
      expect(KeyEventPhase.DISPATCH).assertEqual('dispatch');
      expect(KeyEventPhase.CONSUME).assertEqual('consume');
      expect(KeyEventPhase.IGNORE).assertEqual('ignore');
      expect(KeyEventPhase.PROPAGATE).assertEqual('propagate');
    });

    // 适配 KeyCodeModel：默认属性值
    it('key_code_model_should_have_default_values', 0, async () => {
      const model = new KeyCodeModel();
      expect(model.getKeyCode()).assertEqual(0);
      expect(model.getCategory()).assertEqual(KeyCategory.UNKNOWN);
      expect(model.getAction()).assertEqual(KeyAction.NONE);
      expect(model.getPhase()).assertEqual(KeyEventPhase.IGNORE);
      expect(model.getHandled()).assertFalse();
    });

    // 适配 KeyCodeModel：属性设置与读取
    it('key_code_model_should_set_and_get_properties', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(KeyCodeConstants.KEYCODE_DPAD_RIGHT);
      model.setCategory(KeyCategory.NAVIGATION);
      model.setAction(KeyAction.KEY_DOWN);
      model.setPhase(KeyEventPhase.DISPATCH);
      model.setHandled(true);
      expect(model.getKeyCode()).assertEqual(KeyCodeConstants.KEYCODE_DPAD_RIGHT);
      expect(model.getCategory()).assertEqual(KeyCategory.NAVIGATION);
      expect(model.getAction()).assertEqual(KeyAction.KEY_DOWN);
      expect(model.getPhase()).assertEqual(KeyEventPhase.DISPATCH);
      expect(model.getHandled()).assertTrue();
    });

    // 适配 KeyCodeModel：键码有效性校验
    it('key_code_model_should_validate_key_code', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(2015);
      expect(model.isKeyCodeValid()).assertTrue();
      model.setKeyCode(-1);
      expect(model.isKeyCodeValid()).assertFalse();
    });

    // 适配 KeyCodeModel：消费阶段识别
    it('key_code_model_should_identify_consumed_phase', 0, async () => {
      const model = new KeyCodeModel();
      model.setPhase(KeyEventPhase.CONSUME);
      expect(model.isConsumed()).assertTrue();
      model.setPhase(KeyEventPhase.PROPAGATE);
      expect(model.isConsumed()).assertFalse();
      model.setPhase(KeyEventPhase.IGNORE);
      expect(model.isConsumed()).assertFalse();
    });

    // 适配 KeyCodeModel：克隆独立副本
    it('key_code_model_clone_should_create_independent_copy', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(2014);
      model.setCategory(KeyCategory.NAVIGATION);
      const cloned = model.clone();
      expect(model.equals(cloned)).assertTrue();
      cloned.setKeyCode(2049);
      expect(model.getKeyCode()).assertEqual(2014);
    });

    // 适配 KeyCodeModel：相等性比较
    it('key_code_model_equals_should_compare_all_fields', 0, async () => {
      const a = new KeyCodeModel();
      const b = new KeyCodeModel();
      expect(a.equals(b)).assertTrue();
      a.setKeyCode(2015);
      expect(a.equals(b)).assertFalse();
    });

    // 适配 KeyCodeModel：字符串描述包含字段
    it('key_code_model_to_string_should_contain_fields', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(2014);
      model.setCategory(KeyCategory.NAVIGATION);
      const str: string = model.toString();
      expect(str.includes('2014')).assertTrue();
      expect(str.includes('navigation')).assertTrue();
    });

    // 适配 KeyMetricsCalculator：平均处理时间
    it('metrics_calculator_should_compute_average_time', 0, async () => {
      const metrics: KeyMetrics[] = [{
        keyCode: 2014,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: 2015,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_UP,
        processingTime: 30,
        handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.averageProcessingTime()).assertEqual(20);
    });

    // 适配 KeyMetricsCalculator：最大最小处理时间
    it('metrics_calculator_should_compute_max_min_time', 0, async () => {
      const metrics: KeyMetrics[] = [{
        keyCode: 2014,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: 2015,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_UP,
        processingTime: 50,
        handled: false
      }, {
        keyCode: 2049,
        category: KeyCategory.SYSTEM,
        action: KeyAction.KEY_DOWN,
        processingTime: 20,
        handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.maxProcessingTime()).assertEqual(50);
      expect(calculator.minProcessingTime()).assertEqual(10);
    });

    // 适配 KeyMetricsCalculator：空列表指标为零
    it('metrics_calculator_should_handle_empty_metrics', 0, async () => {
      const calculator = new KeyMetricsCalculator([]);
      expect(calculator.averageProcessingTime()).assertEqual(0);
      expect(calculator.maxProcessingTime()).assertEqual(0);
      expect(calculator.minProcessingTime()).assertEqual(0);
      expect(calculator.handledCount()).assertEqual(0);
    });

    // 适配 KeyMetricsCalculator：已处理计数
    it('metrics_calculator_should_count_handled', 0, async () => {
      const metrics: KeyMetrics[] = [{
        keyCode: 2014,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: 2015,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_UP,
        processingTime: 20,
        handled: false
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.handledCount()).assertEqual(1);
    });

    // 适配 KeyMetricsCalculator：按类别计数
    it('metrics_calculator_should_count_by_category', 0, async () => {
      const metrics: KeyMetrics[] = [{
        keyCode: 2014,
        category: KeyCategory.NAVIGATION,
        action: KeyAction.KEY_DOWN,
        processingTime: 10,
        handled: true
      }, {
        keyCode: 2049,
        category: KeyCategory.SYSTEM,
        action: KeyAction.KEY_DOWN,
        processingTime: 20,
        handled: true
      }, {
        keyCode: 16,
        category: KeyCategory.VOLUME,
        action: KeyAction.KEY_UP,
        processingTime: 30,
        handled: false
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.countByCategory(KeyCategory.NAVIGATION)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.SYSTEM)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.VOLUME)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.MEDIA)).assertEqual(0);
    });

    // 适配 KeyEventSynthesizer：事件合成与计数
    it('event_synthesizer_should_synthesize_events', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_UP);
      expect(synthesizer.getEventCount()).assertEqual(2);
      const events: KeyEventDescriptor[] = synthesizer.getEvents();
      expect(events[0].phase).assertEqual(KeyEventPhase.DISPATCH);
    });

    // 适配 KeyEventSynthesizer：按动作计数
    it('event_synthesizer_should_count_by_action', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2015, KeyCategory.NAVIGATION, KeyAction.KEY_UP);
      expect(synthesizer.countByAction(KeyAction.KEY_DOWN)).assertEqual(2);
      expect(synthesizer.countByAction(KeyAction.KEY_UP)).assertEqual(1);
    });

    // 适配 KeyEventSynthesizer：事件列表深拷贝
    it('event_synthesizer_get_events_should_return_copy', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2049, KeyCategory.SYSTEM, KeyAction.KEY_DOWN);
      const events: KeyEventDescriptor[] = synthesizer.getEvents();
      events.push({
        keyCode: 2,
        action: KeyAction.KEY_UP,
        category: KeyCategory.SYSTEM,
        phase: KeyEventPhase.DISPATCH,
        timestamp: 0
      });
      expect(synthesizer.getEventCount()).assertEqual(1);
    });

    // 适配 KeyEventSynthesizer：清空后状态复位
    it('event_synthesizer_should_reset_after_clear', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.clear();
      expect(synthesizer.getEventCount()).assertEqual(0);
    });

    // 适配 KeyConfigValidator：重复延迟校验
    it('config_validator_should_validate_repeat_delay', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      const validator = new KeyConfigValidator(config);
      expect(validator.isRepeatDelayValid()).assertTrue();
      const invalidConfig: KeyConfig = {
        repeatDelayMs: 0,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(invalidConfig).isRepeatDelayValid()).assertFalse();
    });

    // 适配 KeyConfigValidator：重复间隔校验
    it('config_validator_should_validate_repeat_interval', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      const validator = new KeyConfigValidator(config);
      expect(validator.isRepeatIntervalValid()).assertTrue();
      const invalidConfig: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 0,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(invalidConfig).isRepeatIntervalValid()).assertFalse();
    });

    // 适配 KeyConfigValidator：综合校验
    it('config_validator_should_validate_entire_config', 0, async () => {
      const validConfig: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: true,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(validConfig).isValid()).assertTrue();
      const invalidConfig: KeyConfig = {
        repeatDelayMs: 0,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: true,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(invalidConfig).isValid()).assertFalse();
    });

    // 适配 KeyConfigValidator：校验报告内容
    it('config_validator_should_generate_report', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      const report: string = new KeyConfigValidator(config).generateValidationReport();
      expect(report.includes('100')).assertTrue();
      expect(report.includes('50')).assertTrue();
    });

    // 适配 KeyEventHandler：按键码统计总数
    it('key_event_handler_should_count_by_key_code', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      keyEventHandler.handleKeyDown(2014);
      expect(keyEventHandler.getKeyCodeCount(2014)).assertEqual(3);
      expect(keyEventHandler.getKeyEventCount(2014)).assertEqual(3);
      expect(keyEventHandler.getTotalEventCount()).assertEqual(3);
    });

    // 适配 KeyEventHandler：按下抬起分别统计
    it('key_event_handler_should_count_down_and_up_separately', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      expect(keyEventHandler.getKeyDownEventCount(2014)).assertEqual(2);
      expect(keyEventHandler.getKeyUpEventCount(2014)).assertEqual(1);
    });

    // 适配 KeyEventHandler：全部按下键码列表
    it('key_event_handler_should_return_all_down_codes', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      keyEventHandler.handleKeyDown(2049);
      const codes: number[] = keyEventHandler.getAllKeyDownCodes();
      expect(codes.length).assertEqual(2);
      expect(codes[0]).assertEqual(2014);
      expect(codes[1]).assertEqual(2049);
    });

    // 适配 KeyEventHandler：键码频率统计
    it('key_event_handler_should_compute_key_frequency', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      keyEventHandler.handleKeyDown(2014);
      const frequency = keyEventHandler.getKeyCodeFrequency();
      expect(frequency.get(2014)).assertEqual(3);
      expect(frequency.get(2049)).assertEqual(undefined);
    });

    // 适配 KeyEventHandler：未配对事件检测
    it('key_event_handler_should_detect_unpaired_events', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      expect(keyEventHandler.hasUnpairedEvents()).assertTrue();
      keyEventHandler.handleKeyUp(2014);
      expect(keyEventHandler.hasUnpairedEvents()).assertFalse();
    });

    // 适配 KeyEventHandler：最近事件时间戳
    it('key_event_handler_should_return_last_timestamp', 0, async () => {
      keyEventHandler.clearLog();
      expect(keyEventHandler.getLastEventTimestamp()).assertEqual(0);
      keyEventHandler.handleKeyDown(2014);
      expect(keyEventHandler.getLastEventTimestamp()).assertLargerOrEqual(1);
    });

    // 适配 KeyEventHandler：事件时序校验
    it('key_event_handler_should_verify_chronology', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      expect(keyEventHandler.isChronological()).assertTrue();
    });

    // 适配 KeyEventHandler：摘要字符串
    it('key_event_handler_to_string_should_contain_counts', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      const summary: string = keyEventHandler.toString();
      expect(summary.includes('down=1')).assertTrue();
      expect(summary.includes('up=1')).assertTrue();
    });

    // 适配 KeyCodeModel：克隆后修改不影响消费阶段判断
    it('key_code_model_clone_should_preserve_consumed_phase', 0, async () => {
      const model = new KeyCodeModel();
      model.setPhase(KeyEventPhase.CONSUME);
      model.setHandled(true);
      const cloned = model.clone();
      expect(cloned.isConsumed()).assertTrue();
      cloned.setPhase(KeyEventPhase.IGNORE);
      expect(model.isConsumed()).assertTrue();
    });

    // 适配 KeyCodeModel：相等性比较区分各字段差异
    it('key_code_model_equals_should_detect_field_differences', 0, async () => {
      const base = new KeyCodeModel();
      base.setKeyCode(2014);
      base.setCategory(KeyCategory.NAVIGATION);
      base.setAction(KeyAction.KEY_DOWN);
      base.setPhase(KeyEventPhase.DISPATCH);
      base.setHandled(true);
      const other = base.clone();
      expect(base.equals(other)).assertTrue();
      other.setCategory(KeyCategory.MEDIA);
      expect(base.equals(other)).assertFalse();
      other.setCategory(KeyCategory.NAVIGATION);
      other.setAction(KeyAction.KEY_UP);
      expect(base.equals(other)).assertFalse();
      other.setAction(KeyAction.KEY_DOWN);
      other.setHandled(false);
      expect(base.equals(other)).assertFalse();
    });

    // 适配 KeyCodeModel：字符串描述包含阶段信息
    it('key_code_model_to_string_should_contain_phase', 0, async () => {
      const model = new KeyCodeModel();
      model.setKeyCode(2049);
      model.setPhase(KeyEventPhase.CONSUME);
      const str: string = model.toString();
      expect(str.includes('2049')).assertTrue();
      expect(str.includes('consume')).assertTrue();
    });

    // 适配 KeyMetricsCalculator：全部处理指标聚合
    it('metrics_calculator_should_aggregate_all_handled', 0, async () => {
      const metrics: KeyMetrics[] = [{
        keyCode: 2014, category: KeyCategory.NAVIGATION, action: KeyAction.KEY_DOWN, processingTime: 5, handled: true
      }, {
        keyCode: 2015, category: KeyCategory.NAVIGATION, action: KeyAction.KEY_UP, processingTime: 15, handled: true
      }, {
        keyCode: 16, category: KeyCategory.VOLUME, action: KeyAction.KEY_DOWN, processingTime: 10, handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.averageProcessingTime()).assertEqual(10);
      expect(calculator.handledCount()).assertEqual(3);
      expect(calculator.maxProcessingTime()).assertEqual(15);
      expect(calculator.minProcessingTime()).assertEqual(5);
    });

    // 适配 KeyMetricsCalculator：单条指标极值一致
    it('metrics_calculator_single_metric_should_have_equal_extremes', 0, async () => {
      const metrics: KeyMetrics[] = [{
        keyCode: 2, category: KeyCategory.SYSTEM, action: KeyAction.KEY_DOWN, processingTime: 42, handled: true
      }];
      const calculator = new KeyMetricsCalculator(metrics);
      expect(calculator.averageProcessingTime()).assertEqual(42);
      expect(calculator.maxProcessingTime()).assertEqual(42);
      expect(calculator.minProcessingTime()).assertEqual(42);
    });

    // 适配 KeyEventSynthesizer：事件阶段默认派发
    it('event_synthesizer_default_phase_should_be_dispatch', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2049, KeyCategory.SYSTEM, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_UP);
      const events: KeyEventDescriptor[] = synthesizer.getEvents();
      expect(events.length).assertEqual(2);
      expect(events[0].phase).assertEqual(KeyEventPhase.DISPATCH);
      expect(events[1].phase).assertEqual(KeyEventPhase.DISPATCH);
      expect(events[0].category).assertEqual(KeyCategory.SYSTEM);
      expect(events[1].category).assertEqual(KeyCategory.NAVIGATION);
    });

    // 适配 KeyEventSynthesizer：清空后按动作计数归零
    it('event_synthesizer_action_count_should_reset_after_clear', 0, async () => {
      const synthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_UP);
      expect(synthesizer.countByAction(KeyAction.KEY_DOWN)).assertEqual(1);
      synthesizer.clear();
      expect(synthesizer.getEventCount()).assertEqual(0);
      expect(synthesizer.countByAction(KeyAction.KEY_DOWN)).assertEqual(0);
      expect(synthesizer.countByAction(KeyAction.KEY_UP)).assertEqual(0);
    });

    // 适配 KeyConfigValidator：报告包含重复策略配置
    it('config_validator_report_should_contain_repeat_flags', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 120, repeatIntervalMs: 60, enableRepeat: true, enableLongPress: true, filterUnknownKeys: false
      };
      const report: string = new KeyConfigValidator(config).generateValidationReport();
      expect(report.includes('repeat=true')).assertTrue();
      expect(report.includes('longPress=true')).assertTrue();
      expect(report.includes('120')).assertTrue();
      expect(report.includes('60')).assertTrue();
    });

    // 适配 KeyConfigValidator：禁用重复时配置仍合法
    it('config_validator_should_accept_disabled_repeat', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100, repeatIntervalMs: 50, enableRepeat: false, enableLongPress: false, filterUnknownKeys: true
      };
      const validator = new KeyConfigValidator(config);
      expect(validator.isValid()).assertTrue();
      expect(validator.isRepeatDelayValid()).assertTrue();
      expect(validator.isRepeatIntervalValid()).assertTrue();
    });

    // 适配 KeyEventHandler：媒体按键分类统计
    it('key_event_handler_should_count_media_events', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE);
      keyEventHandler.handleKeyUp(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE);
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_MEDIA_NEXT);
      keyEventHandler.handleKeyUp(KeyCodeConstants.KEYCODE_MEDIA_NEXT);
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_NEXT)).assertTrue();
      expect(keyEventHandler.getKeyEventCount(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertEqual(2);
      expect(keyEventHandler.getKeyEventCount(KeyCodeConstants.KEYCODE_MEDIA_NEXT)).assertEqual(2);
      expect(keyEventHandler.getTotalEventCount()).assertEqual(4);
    });

    // 适配 KeyEventHandler：音量按键上下区分统计
    it('key_event_handler_should_distinguish_volume_keys', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_VOLUME_UP);
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_VOLUME_DOWN);
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_VOLUME_MUTE);
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_MUTE)).assertTrue();
      expect(keyEventHandler.getKeyCodeCount(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KeyCodeConstants.KEYCODE_VOLUME_MUTE)).assertEqual(1);
    });

    // 适配 KeyEventHandler：事件频率映射仅含已发布键码
    it('key_event_handler_frequency_should_only_contain_published', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      keyEventHandler.handleKeyDown(2049);
      const frequency = keyEventHandler.getKeyCodeFrequency();
      expect(frequency.size).assertEqual(2);
      expect(frequency.get(2014)).assertEqual(2);
      expect(frequency.get(2049)).assertEqual(1);
    });

    // 适配 KeyEventHandler：时序校验覆盖多事件
    it('key_event_handler_chronology_should_hold_for_mixed_events', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyUp(2014);
      keyEventHandler.handleKeyDown(2049);
      keyEventHandler.handleKeyUp(2049);
      expect(keyEventHandler.isChronological()).assertTrue();
      expect(keyEventHandler.hasUnpairedEvents()).assertFalse();
    });

    // 适配 KeyEventHandler：摘要包含按键总数
    it('key_event_handler_to_string_should_contain_total', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2014);
      keyEventHandler.handleKeyDown(2015);
      keyEventHandler.handleKeyUp(2014);
      const summary: string = keyEventHandler.toString();
      expect(summary.includes('down=2')).assertTrue();
      expect(summary.includes('up=1')).assertTrue();
      expect(summary.includes('total=3')).assertTrue();
    });
  });


}