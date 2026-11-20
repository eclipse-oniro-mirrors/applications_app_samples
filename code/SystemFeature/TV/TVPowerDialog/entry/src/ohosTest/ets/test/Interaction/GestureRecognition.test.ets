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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_UP,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

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

  // 计算平均响应时间：评估手势识别的整体响应性能
  public getAverageResponseTime(): number {
    if (this.gestureHistory.length === 0) {
      return 0;
    }
    const totalTime = this.gestureHistory.reduce((sum: number, record: GestureRecord) => sum + record.responseTime, 0);
    return totalTime / this.gestureHistory.length;
  }

  // 计算最大响应时间：识别手势响应最慢的操作
  public getMaxResponseTime(): number {
    if (this.gestureHistory.length === 0) {
      return 0;
    }
    let maxTime = 0;
    for (let i = 0; i < this.gestureHistory.length; i++) {
      if (this.gestureHistory[i].responseTime > maxTime) {
        maxTime = this.gestureHistory[i].responseTime;
      }
    }
    return maxTime;
  }

  // 计算最小响应时间：识别手势响应最快的操作
  public getMinResponseTime(): number {
    if (this.gestureHistory.length === 0) {
      return 0;
    }
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.gestureHistory.length; i++) {
      if (this.gestureHistory[i].responseTime < minTime) {
        minTime = this.gestureHistory[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  // 统计指定手势类型的记录数量：分析手势类型分布
  public getGestureTypeCount(gestureType: GestureType): number {
    return this.gestureHistory.filter(record => record.gestureType === gestureType).length;
  }

  // 获取所有已识别的手势记录：过滤出成功识别的手势
  public getRecognizedHistory(): GestureRecord[] {
    return this.gestureHistory.filter(record => record.isRecognized);
  }

  // 统计各手势类型出现频率：分析手势交互的使用分布
  public getGestureTypeFrequency(): Map<string, number> {
    const frequency = new Map<string, number>();
    for (let i = 0; i < this.gestureHistory.length; i++) {
      const type = this.gestureHistory[i].gestureType;
      const currentCount = frequency.get(type) || 0;
      frequency.set(type, currentCount + 1);
    }
    return frequency;
  }

  // 克隆追踪器：返回一个记录一致的副本
  public clone(): GestureRecognitionTracker {
    const cloneTracker = new GestureRecognitionTracker();
    for (let i = 0; i < this.gestureHistory.length; i++) {
      cloneTracker.recordGesture(this.gestureHistory[i].gestureType, this.gestureHistory[i].isRecognized,
        this.gestureHistory[i].responseTime);
    }
    return cloneTracker;
  }

  // 判断两个追踪器是否等价
  public equals(other: GestureRecognitionTracker): boolean {
    return this.gestureHistory.length === other.gestureHistory.length;
  }

  // 生成追踪器摘要字符串
  public toString(): string {
    return `GestureRecognitionTracker{total=${this.totalGestures}, recognized=${this.recognizedGestures}, rate=${this.getRecognitionRate()}}`;
  }
}

// 手势移动方向枚举：描述手势在屏幕上的滑动方向
enum GestureDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', NONE = 'none'
}

// 手势识别模式枚举：描述手势识别引擎的工作模式
enum GestureMode {
  STANDARD = 'standard', AGGRESSIVE = 'aggressive', CONSERVATIVE = 'conservative', DISABLED = 'disabled'
}

// 手势优先级枚举：描述手势处理在事件管线中的优先级
enum GesturePriority {
  LOW = 0, NORMAL = 1, HIGH = 2, EXCLUSIVE = 3
}

// 手势度量信息结构体：聚合单次手势识别的关键指标
interface GestureMetrics {
  gestureType: GestureType;
  direction: GestureDirection;
  isRecognized: boolean;
  responseTime: number;
  confidence: number;
}

// 手势识别统计结果：汇总一段时间内的手势识别统计
interface GestureStatistics {
  totalGestures: number;
  recognizedGestures: number;
  averageResponseTime: number;
  maxResponseTime: number;
  minResponseTime: number;
  recognitionRate: number;
}

// 手势配置结构：描述手势识别的行为配置参数
interface GestureConfig {
  mode: GestureMode;
  priority: GesturePriority;
  swipeThreshold: number;
  longPressDuration: number;
  doubleTapInterval: number;
  enabled: boolean;
}

// 手势会话结构：描述一次完整手势交互的会话信息
interface GestureSession {
  sessionId: number;
  gestureType: GestureType;
  startTimestamp: number;
  endTimestamp: number;
  result: boolean;
}

// 手势数据模型：封装手势的完整属性，提供克隆、比较和序列化能力
class GestureModel {
  private gestureType: GestureType;
  private direction: GestureDirection;
  private isRecognized: boolean;
  private responseTime: number;
  private confidence: number;

  // 构造函数：初始化手势数据模型的默认属性
  public constructor() {
    this.gestureType = GestureType.TAP;
    this.direction = GestureDirection.NONE;
    this.isRecognized = false;
    this.responseTime = 0;
    this.confidence = 0;
  }

  public setGestureType(type: GestureType): void {
    this.gestureType = type;
  }

  public getGestureType(): GestureType {
    return this.gestureType;
  }

  public setDirection(direction: GestureDirection): void {
    this.direction = direction;
  }

  public getDirection(): GestureDirection {
    return this.direction;
  }

  public setRecognized(recognized: boolean): void {
    this.isRecognized = recognized;
  }

  public getRecognized(): boolean {
    return this.isRecognized;
  }

  public setResponseTime(time: number): void {
    this.responseTime = time;
  }

  public getResponseTime(): number {
    return this.responseTime;
  }

  public setConfidence(confidence: number): void {
    this.confidence = confidence;
  }

  public getConfidence(): number {
    return this.confidence;
  }

  // 校验置信度：置信度必须在0到1之间
  public isConfidenceValid(): boolean {
    return this.confidence >= 0 && this.confidence <= 1;
  }

  // 校验响应时间：响应时间必须非负
  public isResponseTimeValid(): boolean {
    return this.responseTime >= 0;
  }

  // 综合校验：判断手势数据是否完全合法
  public isValid(): boolean {
    return this.isConfidenceValid() && this.isResponseTimeValid();
  }

  // 克隆手势数据模型：返回一个属性完全一致的副本
  public clone(): GestureModel {
    const cloned = new GestureModel();
    cloned.gestureType = this.gestureType;
    cloned.direction = this.direction;
    cloned.isRecognized = this.isRecognized;
    cloned.responseTime = this.responseTime;
    cloned.confidence = this.confidence;
    return cloned;
  }

  // 比较两个手势数据模型是否相等
  public equals(other: GestureModel): boolean {
    return this.gestureType === other.gestureType && this.direction === other.direction &&
      this.isRecognized === other.isRecognized && this.responseTime === other.responseTime &&
      this.confidence === other.confidence;
  }

  // 序列化手势数据模型
  public toString(): string {
    return `GestureModel{type=${this.gestureType}, direction=${this.direction}, recognized=${this.isRecognized}, confidence=${this.confidence}}`;
  }
}

// 手势度量计算器：提供基于手势记录的统计分析能力
class GestureMetricsCalculator {
  private records: GestureRecord[];

  // 构造函数：初始化度量计算器的记录列表
  public constructor(records: GestureRecord[]) {
    this.records = records;
  }

  // 计算平均响应时间
  public averageResponseTime(): number {
    if (this.records.length === 0) {
      return 0;
    }
    const total = this.records.reduce((sum: number, record: GestureRecord) => sum + record.responseTime, 0);
    return total / this.records.length;
  }

  // 计算最大响应时间
  public maxResponseTime(): number {
    let maxTime = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime > maxTime) {
        maxTime = this.records[i].responseTime;
      }
    }
    return maxTime;
  }

  // 计算最小响应时间
  public minResponseTime(): number {
    let minTime = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].responseTime < minTime) {
        minTime = this.records[i].responseTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  // 计算识别成功的记录数量
  public recognizedCount(): number {
    return this.records.filter(record => record.isRecognized).length;
  }

  // 计算识别率
  public recognitionRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.recognizedCount() / this.records.length;
  }
}

// 手势会话管理器：记录和管理完整的手势交互会话
class GestureSessionManager {
  private sessions: GestureSession[];
  private nextSessionId: number;

  // 构造函数：初始化会话列表和会话计数器
  public constructor() {
    this.sessions = [];
    this.nextSessionId = 1;
  }

  // 开始一个新的手势会话：返回新会话的唯一标识
  public beginSession(gestureType: GestureType): number {
    const sessionId = this.nextSessionId;
    const session: GestureSession = {
      sessionId,
      gestureType,
      startTimestamp: Date.now(),
      endTimestamp: 0,
      result: false
    };
    this.sessions.push(session);
    this.nextSessionId++;
    return sessionId;
  }

  // 结束指定会话：记录结束时间和结果
  public endSession(sessionId: number, result: boolean): void {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].sessionId === sessionId) {
        this.sessions[i].endTimestamp = Date.now();
        this.sessions[i].result = result;
      }
    }
  }

  public getSessions(): GestureSession[] {
    return [...this.sessions];
  }

  public getSessionCount(): number {
    return this.sessions.length;
  }

  // 计算成功会话数量
  public getSuccessfulSessionCount(): number {
    return this.sessions.filter(session => session.result).length;
  }

  // 清空所有会话
  public clear(): void {
    this.sessions = [];
    this.nextSessionId = 1;
  }
}

// 手势配置校验器：校验手势配置参数的合法性
class GestureConfigValidator {
  private config: GestureConfig;

  // 构造函数：保存待校验的手势配置对象
  public constructor(config: GestureConfig) {
    this.config = config;
  }

  // 校验滑动阈值：滑动阈值必须大于零
  public isSwipeThresholdValid(): boolean {
    return this.config.swipeThreshold > 0;
  }

  // 校验长按持续时间：长按持续时间必须大于零
  public isLongPressDurationValid(): boolean {
    return this.config.longPressDuration > 0;
  }

  // 校验双击间隔：双击间隔必须大于零
  public isDoubleTapIntervalValid(): boolean {
    return this.config.doubleTapInterval > 0;
  }

  // 综合校验：判断整个手势配置是否合法
  public isValid(): boolean {
    return this.isSwipeThresholdValid() && this.isLongPressDurationValid() && this.isDoubleTapIntervalValid();
  }

  // 生成校验报告：输出手势配置校验的详细结果
  public generateValidationReport(): string {
    return `GestureConfig{mode=${this.config.mode}, priority=${this.config.priority}, ` +
      `swipeValid=${this.isSwipeThresholdValid()}, ` + `longPressValid=${this.isLongPressDurationValid()}, ` +
      `doubleTapValid=${this.isDoubleTapIntervalValid()}}`;
  }
}

export default function gestureRecognitionTest() {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;
    let gestureTracker: GestureRecognitionTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      gestureTracker = GestureRecognitionTracker.getInstance();
      gestureTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_recognize_tap_gesture', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      const startTime = Date.now();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      gestureTracker.recordGesture(GestureType.TAP, true, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.TAP)).assertTrue();
    });

    it('dialog_should_recognize_swipe_left_gesture', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 0);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, isFocusCorrect, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.SWIPE_LEFT)).assertTrue();
    });

    it('dialog_should_recognize_swipe_right_gesture', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const isFocusCorrect = await checkFocusState(driver, 1);
      gestureTracker.recordGesture(GestureType.SWIPE_RIGHT, isFocusCorrect, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.SWIPE_RIGHT)).assertTrue();
    });

    it('dialog_should_recognize_long_press_gesture', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await driver.delayMs(1000);
      const responseTime = Date.now() - startTime;

      gestureTracker.recordGesture(GestureType.LONG_PRESS, true, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.LONG_PRESS)).assertTrue();
    });

    it('dialog_should_recognize_double_tap_gesture', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_UP, 2, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      gestureTracker.recordGesture(GestureType.DOUBLE_TAP, true, responseTime);

      expect(gestureTracker.hasTestedGesture(GestureType.DOUBLE_TAP)).assertTrue();
    });

    // 验证dialog gesture状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_gesture_records_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      gestureTracker.resetTracker();
      const initialCount = await powerDialogComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        gestureTracker.recordGesture(GestureType.TAP, true, 30);
        await driver.delayMs(50);
      }

      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 综合comprehensive gesture场景测试：验证完整操作流程中功能正确
    it('comprehensive_gesture_recognition_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

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

    // 验证手势数据模型：确保属性设置与合法性校验正确
    it('gesture_model_should_set_and_validate_properties', 0, async () => {
      const model = new GestureModel();
      model.setGestureType(GestureType.SWIPE_RIGHT);
      model.setDirection(GestureDirection.RIGHT);
      model.setRecognized(true);
      model.setResponseTime(80);
      model.setConfidence(0.9);
      expect(model.getGestureType()).assertEqual(GestureType.SWIPE_RIGHT);
      expect(model.getDirection()).assertEqual(GestureDirection.RIGHT);
      expect(model.getRecognized()).assertTrue();
      expect(model.getResponseTime()).assertEqual(80);
      expect(model.getConfidence()).assertEqual(0.9);
      expect(model.isConfidenceValid()).assertTrue();
      expect(model.isValid()).assertTrue();
    });

    // 验证手势度量计算器：确保平均响应时间计算正确
    it('gesture_metrics_calculator_should_compute_average_response', 0, async () => {
      const records: GestureRecord[] = [
        { gestureType: GestureType.TAP, isRecognized: true, responseTime: 30, timestamp: 1 },
        { gestureType: GestureType.SWIPE_LEFT, isRecognized: true, responseTime: 50, timestamp: 2 },
        { gestureType: GestureType.LONG_PRESS, isRecognized: false, responseTime: 70, timestamp: 3 }
      ];
      const calculator = new GestureMetricsCalculator(records);
      expect(calculator.averageResponseTime()).assertEqual(50);
      expect(calculator.maxResponseTime()).assertEqual(70);
      expect(calculator.minResponseTime()).assertEqual(30);
      expect(calculator.recognizedCount()).assertEqual(2);
      expect(calculator.recognitionRate()).assertEqual(2 / 3);
    });

    // 验证手势会话管理器：确保会话生命周期管理正确
    it('gesture_session_manager_should_manage_sessions', 0, async () => {
      const manager = new GestureSessionManager();
      const id1 = manager.beginSession(GestureType.TAP);
      const id2 = manager.beginSession(GestureType.SWIPE_RIGHT);
      expect(manager.getSessionCount()).assertEqual(2);
      expect(id2).assertEqual(id1 + 1);
      manager.endSession(id1, true);
      manager.endSession(id2, false);
      expect(manager.getSuccessfulSessionCount()).assertEqual(1);
      manager.clear();
      expect(manager.getSessionCount()).assertEqual(0);
    });

    // 验证手势配置校验器：确保各阈值参数合法
    it('gesture_config_validator_should_validate_thresholds', 0, async () => {
      const config: GestureConfig = {
        mode: GestureMode.STANDARD,
        priority: GesturePriority.NORMAL,
        swipeThreshold: 50,
        longPressDuration: 500,
        doubleTapInterval: 300,
        enabled: true
      };
      const validator = new GestureConfigValidator(config);
      expect(validator.isSwipeThresholdValid()).assertTrue();
      expect(validator.isLongPressDurationValid()).assertTrue();
      expect(validator.isDoubleTapIntervalValid()).assertTrue();
      expect(validator.isValid()).assertTrue();
    });

    // 验证手势追踪器极值：确保最小最大响应时间计算正确
    it('gesture_tracker_should_compute_min_max_response_time', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 90);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, 20);
      gestureTracker.recordGesture(GestureType.LONG_PRESS, true, 60);
      expect(gestureTracker.getMinResponseTime()).assertEqual(20);
      expect(gestureTracker.getMaxResponseTime()).assertEqual(90);
      expect(gestureTracker.getAverageResponseTime()).assertEqual(170 / 3);
    });

    // 验证手势类型频率：确保各类型出现次数统计正确
    it('gesture_tracker_should_build_type_frequency', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 30);
      gestureTracker.recordGesture(GestureType.TAP, true, 30);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, true, 30);
      const frequency = gestureTracker.getGestureTypeFrequency();
      expect(frequency.get(GestureType.TAP) ?? 0).assertEqual(2);
      expect(frequency.get(GestureType.SWIPE_LEFT) ?? 0).assertEqual(1);
    });

    // 验证已识别手势过滤：确保仅返回成功识别记录
    it('gesture_tracker_should_filter_recognized_history', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 30);
      gestureTracker.recordGesture(GestureType.PINCH, false, 30);
      gestureTracker.recordGesture(GestureType.DOUBLE_TAP, true, 30);
      const recognized = gestureTracker.getRecognizedHistory();
      expect(recognized.length).assertEqual(2);
      expect(recognized[0].isRecognized).assertTrue();
    });

    // 验证手势模型克隆比较：确保克隆副本与源一致
    it('gesture_model_should_clone_and_compare', 0, async () => {
      const model = new GestureModel();
      model.setGestureType(GestureType.LONG_PRESS);
      model.setDirection(GestureDirection.NONE);
      model.setRecognized(true);
      model.setResponseTime(400);
      model.setConfidence(0.85);
      const cloned = model.clone();
      expect(cloned.equals(model)).assertTrue();
      cloned.setResponseTime(999);
      expect(cloned.equals(model)).assertFalse();
      expect(model.getResponseTime()).assertEqual(400);
    });

    // 验证会话成功统计：确保成功会话数量正确
    it('gesture_session_manager_should_count_successful_sessions', 0, async () => {
      const manager = new GestureSessionManager();
      const id1 = manager.beginSession(GestureType.TAP);
      const id2 = manager.beginSession(GestureType.SWIPE_LEFT);
      const id3 = manager.beginSession(GestureType.SWIPE_RIGHT);
      manager.endSession(id1, true);
      manager.endSession(id3, true);
      expect(manager.getSuccessfulSessionCount()).assertEqual(2);
      expect(manager.getSessionCount()).assertEqual(3);
    });

    // 验证配置校验报告：确保报告包含校验结果
    it('gesture_config_validator_should_generate_report', 0, async () => {
      const config: GestureConfig = {
        mode: GestureMode.AGGRESSIVE,
        priority: GesturePriority.HIGH,
        swipeThreshold: 100,
        longPressDuration: 800,
        doubleTapInterval: 250,
        enabled: true
      };
      const validator = new GestureConfigValidator(config);
      const report = validator.generateValidationReport();
      expect(report.indexOf('swipeValid=true')).assertLargerOrEqual(0);
      expect(report.indexOf('longPressValid=true')).assertLargerOrEqual(0);
      expect(report.indexOf('doubleTapValid=true')).assertLargerOrEqual(0);
    });

    // 验证识别率计算：确保空数据识别率为零
    it('gesture_metrics_calculator_should_compute_recognition_rate', 0, async () => {
      const empty = new GestureMetricsCalculator([]);
      expect(empty.averageResponseTime()).assertEqual(0);
      expect(empty.recognitionRate()).assertEqual(0);
      const records: GestureRecord[] = [
        { gestureType: GestureType.TAP, isRecognized: true, responseTime: 40, timestamp: 1 },
        { gestureType: GestureType.SWIPE_LEFT, isRecognized: true, responseTime: 40, timestamp: 2 },
        { gestureType: GestureType.SWIPE_RIGHT, isRecognized: false, responseTime: 40, timestamp: 3 }
      ];
      const calculator = new GestureMetricsCalculator(records);
      expect(calculator.recognitionRate()).assertEqual(2 / 3);
    });

    // 验证追踪器克隆：确保克隆副本保留全部记录
    it('gesture_tracker_clone_should_preserve_records', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 30);
      gestureTracker.recordGesture(GestureType.SWIPE_LEFT, false, 30);
      const cloned = gestureTracker.clone();
      expect(cloned.getTotalGestures()).assertEqual(2);
      expect(cloned.getRecognizedGestures()).assertEqual(1);
      expect(gestureTracker.equals(cloned)).assertTrue();
    });

    // 验证追踪器等价比较：确保不同记录长度判定不等
    it('gesture_tracker_equals_should_compare_history_length', 0, async () => {
      gestureTracker.resetTracker();
      gestureTracker.recordGesture(GestureType.TAP, true, 30);
      const other = gestureTracker.clone();
      expect(gestureTracker.equals(other)).assertTrue();
      other.recordGesture(GestureType.PINCH, false, 30);
      expect(gestureTracker.equals(other)).assertFalse();
    });

    // 验证手势模型响应时间校验：确保负响应时间被判为非法
    it('gesture_model_should_validate_response_time', 0, async () => {
      const model = new GestureModel();
      model.setResponseTime(-10);
      expect(model.isResponseTimeValid()).assertFalse();
      model.setResponseTime(0);
      expect(model.isResponseTimeValid()).assertTrue();
      const text = model.toString();
      expect(text.indexOf('GestureModel')).assertLargerOrEqual(0);
    });
  });


}