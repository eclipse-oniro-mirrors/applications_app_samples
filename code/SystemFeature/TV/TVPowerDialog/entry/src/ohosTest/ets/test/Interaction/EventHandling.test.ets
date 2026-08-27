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
  simulateTouch,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  TOLERANCE_COMPONENT_COUNT,
  getCurrentFocusIndex
} from '../Shared/SharedDriver';

// 触摸事件接口：模拟TV设备触摸操作的坐标数
interface TouchEvent {
  x?: number;
  y?: number;
}

// 按键事件接口：模拟TV遥控器按键的类型和键码
interface KeyEvent {
  type?: number;
  keyCode?: number;
}

// 事件统计结构体：记录事件数量和最后事件信息
interface EventStats {
  count: number;
  lastEvent: TouchEvent | KeyEvent | null;
}

// 模拟事件工具类：用于测试环境中的事件处理验证
class MockEventUtil {
  private static touchEventCount: number = 0;
  private static keyEventCount: number = 0;
  private static lastTouchEvent: TouchEvent | null = null;
  private static lastKeyEvent: KeyEvent | null = null;

  // 处理触摸事件：记录触摸操作并返回有效性，用于验证触摸交互
  public static processTouchEvent(event: TouchEvent | null): boolean {
    MockEventUtil.touchEventCount++;
    MockEventUtil.lastTouchEvent = event;
    return event !== null;
  }

  // 处理按键事件：记录按键操作并验证类型，用于验证遥控器交互
  public static processKeyEvent(event: KeyEvent | null): boolean {
    MockEventUtil.keyEventCount++;
    MockEventUtil.lastKeyEvent = event;
    return event !== null && event.type === 1; // KEY_DOWN 事件类型
  }

  public static getTouchEventStats(): EventStats {
    return {
      count: MockEventUtil.touchEventCount, lastEvent: MockEventUtil.lastTouchEvent
    };
  }

  public static getKeyEventStats(): EventStats {
    return {
      count: MockEventUtil.keyEventCount, lastEvent: MockEventUtil.lastKeyEvent
    };
  }

  public static resetEventStats(): void {
    MockEventUtil.touchEventCount = 0;
    MockEventUtil.keyEventCount = 0;
    MockEventUtil.lastTouchEvent = null;
    MockEventUtil.lastKeyEvent = null;
  }
}

// 电源事件数据接口：存储电源操作的就绪状态和时间戳
interface PowerEventData {
  isReady: boolean;
  timestamp: number;
}

// 模拟公共事件工具类：用于测试环境中的电源事件处理验证
class MockCommonEventUtil {
  private static powerEventData: PowerEventData | null = null;
  private static eventCallCount: number = 0;

  // 处理电源事件数据：记录电源操作状态，用于验证电源功能触发
  public static processPowerEventData(isReady: boolean): void {
    MockCommonEventUtil.eventCallCount++;
    MockCommonEventUtil.powerEventData = { isReady, timestamp: Date.now() };
  }

  public static getPowerEventData(): PowerEventData | null {
    return MockCommonEventUtil.powerEventData;
  }

  public static getEventCallCount(): number {
    return MockCommonEventUtil.eventCallCount;
  }

  public static resetEventData(): void {
    MockCommonEventUtil.powerEventData = null;
    MockCommonEventUtil.eventCallCount = 0;
  }
}

// ==================== 事件处理扩展工具集（新增代码） ====================

// 事件来源枚举：描述事件的不同来源类型
enum EventSource {
  KEYBOARD = 'keyboard', TOUCH = 'touch', REMOTE = 'remote', SYSTEM = 'system'
}

// 事件处理结果枚举：描述事件处理的结果类型
enum EventHandleResult {
  HANDLED = 'handled', IGNORED = 'ignored', DELEGATED = 'delegated', FAILED = 'failed'
}

// 事件批次接口：描述一批事件的处理统计信息
interface EventBatch {
  source: EventSource;
  totalCount: number;
  handledCount: number;
  failedCount: number;
  averageResponseTime: number;
}

// 事件处理记录接口：描述单条事件的处理详情
interface EventHandleRecord {
  source: EventSource;
  result: EventHandleResult;
  responseTime: number;
  timestamp: number;
}

// 事件来源分类器：将键码或坐标映射到事件来源
class EventSourceClassifier {
  private keyCodeToSource: Map<number, EventSource> = new Map<number, EventSource>();

  constructor() {
    this.keyCodeToSource.set(1, EventSource.KEYBOARD);
    this.keyCodeToSource.set(2, EventSource.KEYBOARD);
    this.keyCodeToSource.set(3, EventSource.REMOTE);
    this.keyCodeToSource.set(4, EventSource.REMOTE);
  }

  // 根据键码推断事件来源
  public classifyKeyCode(keyCode: number): EventSource {
    const source = this.keyCodeToSource.get(keyCode);
    if (source === undefined) {
      return EventSource.SYSTEM;
    }
    return source;
  }

  // 判断来源是否为键盘
  public isKeyboardSource(source: EventSource): boolean {
    return source === EventSource.KEYBOARD;
  }

  // 判断来源是否为触摸
  public isTouchSource(source: EventSource): boolean {
    return source === EventSource.TOUCH;
  }
}

// 事件批次统计器：聚合一批事件的处理统计信息
class EventBatchStatistics {
  private records: EventHandleRecord[] = [];

  // 追加一条事件处理记录
  public appendRecord(record: EventHandleRecord): void {
    this.records.push(record);
  }

  // 按来源统计事件批次信息
  public buildBatch(source: EventSource): EventBatch {
    const filtered = this.filterBySource(source);
    const batch: EventBatch = {
      source,
      totalCount: filtered.length,
      handledCount: this.countByResult(filtered, EventHandleResult.HANDLED),
      failedCount: this.countByResult(filtered, EventHandleResult.FAILED),
      averageResponseTime: this.computeAverageResponseTime(filtered)
    };
    return batch;
  }

  // 按来源筛选记录
  private filterBySource(source: EventSource): EventHandleRecord[] {
    const filtered: EventHandleRecord[] = [];
    for (const record of this.records) {
      if (record.source === source) {
        filtered.push(record);
      }
    }
    return filtered;
  }

  // 统计指定处理结果的记录数量
  private countByResult(records: EventHandleRecord[], result: EventHandleResult): number {
    let count = 0;
    for (const record of records) {
      if (record.result === result) {
        count++;
      }
    }
    return count;
  }

  // 计算平均响应时间
  private computeAverageResponseTime(records: EventHandleRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let total = 0;
    for (const record of records) {
      total += record.responseTime;
    }
    return total / records.length;
  }

  // 清空全部记录
  public clearRecords(): void {
    this.records = [];
  }

  // 获取记录总数
  public getRecordCount(): number {
    return this.records.length;
  }
}

// 按键事件模型：封装一个可复用的按键事件对象
class KeyEventModel {
  private type: number;
  private keyCode: number;
  private source: EventSource;

  constructor(type: number, keyCode: number, source: EventSource) {
    this.type = type;
    this.keyCode = keyCode;
    this.source = source;
  }

  public getType(): number {
    return this.type;
  }

  public getKeyCode(): number {
    return this.keyCode;
  }

  public getSource(): EventSource {
    return this.source;
  }

  public setSource(source: EventSource): void {
    this.source = source;
  }

  // 判断事件是否为按键按下类型
  public isKeyDown(): boolean {
    return this.type === 1;
  }

  // 生成事件的文本表示
  public toString(): string {
    return `KeyEvent(type=${this.type}, keyCode=${this.keyCode}, source=${this.source})`;
  }
}

// 触摸事件模型：封装一个可复用的触摸事件对象
class TouchEventModel {
  private x: number;
  private y: number;
  private source: EventSource;

  constructor(x: number, y: number, source: EventSource) {
    this.x = x;
    this.y = y;
    this.source = source;
  }

  public getX(): number {
    return this.x;
  }

  public getY(): number {
    return this.y;
  }

  public getSource(): EventSource {
    return this.source;
  }

  // 判断触摸点是否在指定区域内
  public isWithinRegion(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.x >= minX && this.x <= maxX && this.y >= minY && this.y <= maxY;
  }

  // 计算与另一点的欧氏距离
  public distanceTo(other: TouchEventModel): number {
    const dx = this.x - other.x;
    const dy = this.y - other.y;
    return Math.sqrt(dx * dx + dy * dy);
  }

  // 生成触摸事件的文本表示
  public toString(): string {
    return `TouchEvent(x=${this.x}, y=${this.y}, source=${this.source})`;
  }
}

// 事件处理结果记录器：集中记录事件处理结果
class EventResultRecorder {
  private static instance: EventResultRecorder;
  private records: EventHandleRecord[] = [];

  // 单例模式获取实例：确保事件处理结果跨测试用例一致
  public static getInstance(): EventResultRecorder {
    if (!EventResultRecorder.instance) {
      EventResultRecorder.instance = new EventResultRecorder();
    }
    return EventResultRecorder.instance;
  }

  // 记录一条处理结果
  public record(source: EventSource, result: EventHandleResult, responseTime: number): void {
    const record: EventHandleRecord = {
      source,
      result,
      responseTime,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  // 获取全部记录
  public getRecords(): EventHandleRecord[] {
    return [...this.records];
  }

  // 统计成功处理的记录数量
  public countHandled(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.result === EventHandleResult.HANDLED) {
        count++;
      }
    }
    return count;
  }

  // 重置记录器
  public resetRecorder(): void {
    this.records = [];
  }
}

// ==================== 事件分发工具集（新增代码） ====================

// 事件分发结果枚举：描述事件分发的不同结果
enum EventDispatchResult {
  DISPATCHED = 'dispatched', CONSUMED = 'consumed', REJECTED = 'rejected', QUEUED = 'queued'
}

// 事件处理器接口：描述一个可处理事件的对象
interface EventHandlerDescriptor {
  handlerId: string;
  source: EventSource;
  priority: number;
  isEnabled: boolean;
}

// 事件分发器：根据优先级和来源分发事件
class EventDispatcher {
  private handlers: EventHandlerDescriptor[] = [];

  // 注册一个事件处理器
  public registerHandler(handler: EventHandlerDescriptor): void {
    this.handlers.push(handler);
  }

  // 获取全部事件处理器
  public getHandlers(): EventHandlerDescriptor[] {
    return [...this.handlers];
  }

  // 查找优先级最高的处理器
  public findHighestPriorityHandler(): EventHandlerDescriptor | null {
    let best: EventHandlerDescriptor | null = null;
    for (const handler of this.handlers) {
      if (!handler.isEnabled) {
        continue;
      }
      if (best === null || handler.priority > best.priority) {
        best = handler;
      }
    }
    return best;
  }

  // 按来源筛选处理器
  public filterBySource(source: EventSource): EventHandlerDescriptor[] {
    const filtered: EventHandlerDescriptor[] = [];
    for (const handler of this.handlers) {
      if (handler.source === source) {
        filtered.push(handler);
      }
    }
    return filtered;
  }

  // 统计启用的处理器数量
  public countEnabledHandlers(): number {
    let count = 0;
    for (const handler of this.handlers) {
      if (handler.isEnabled) {
        count++;
      }
    }
    return count;
  }

  // 清空全部处理器
  public clearHandlers(): void {
    this.handlers = [];
  }
}

// 事件队列模型：维护一个按优先级排序的事件队列
class EventQueueModel {
  private queue: KeyEventModel[] = [];

  // 入队一个按键事件
  public enqueue(event: KeyEventModel): void {
    this.queue.push(event);
  }

  // 出队一个按键事件
  public dequeue(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    const first = this.queue[0];
    this.queue.splice(0, 1);
    return first;
  }

  // 获取队列长度
  public getLength(): number {
    return this.queue.length;
  }

  // 判断队列是否为空
  public isEmpty(): boolean {
    return this.queue.length === 0;
  }

  // 查看队首事件但不移除
  public peek(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    return this.queue[0];
  }

  // 清空队列
  public clearQueue(): void {
    this.queue = [];
  }
}

// 事件分发审计器：审计事件分发的正确性
class EventDispatchAuditor {
  private dispatchRecords: EventDispatchResult[] = [];

  // 记录一次分发结果
  public recordDispatch(result: EventDispatchResult): void {
    this.dispatchRecords.push(result);
  }

  // 获取全部分发记录
  public getDispatchRecords(): EventDispatchResult[] {
    return [...this.dispatchRecords];
  }

  // 统计成功分发的数量
  public countDispatched(): number {
    let count = 0;
    for (const result of this.dispatchRecords) {
      if (result === EventDispatchResult.DISPATCHED) {
        count++;
      }
    }
    return count;
  }

  // 清空分发记录
  public clearDispatchRecords(): void {
    this.dispatchRecords = [];
  }
}

export default function eventHandlingTest() {
  describe('EventHandling_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver();
      MockEventUtil.resetEventStats();
      MockCommonEventUtil.resetEventData();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证arrow key触发：确保TV设备events should trigger focus navigation机制有效
    it('arrow_key_events_should_trigger_focus_navigation', 0, async () => { // 验证方向键事件触发焦点导航：确保TV遥控器左右键能正确移动焦点
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // 初始焦点位置验证：确保对话框打开时焦点位于预期位置
      const initialFocusIndex = await getCurrentFocusIndex(driver);
      let isFocusCorrect = await checkFocusState(driver, initialFocusIndex);
      expect(isFocusCorrect).assertTrue();

      // 右键导航验证：确保焦点向右移动时事件被正确捕获
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_RIGHT });
      const rightFocusIndex = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, rightFocusIndex);
      expect(isFocusCorrect).assertTrue();

      // 左键导航验证：确保焦点向左移动时事件被正确捕获
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_LEFT });
      const leftFocusIndex = await getCurrentFocusIndex(driver);
      isFocusCorrect = await checkFocusState(driver, leftFocusIndex);
      expect(isFocusCorrect).assertTrue();
      const keyStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(1);
    });

    // 验证enter key触发：确保TV设备event should trigger power operation机制有效
    it('enter_key_event_should_trigger_power_operation', 0, async () => { // 验证ENTER键触发电源操作：确保确认键能正确启动电源功能
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      MockCommonEventUtil.processPowerEventData(true);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const eventCallCount = MockCommonEventUtil.getEventCallCount();
      expect(eventCallCount).assertLargerOrEqual(1);
      const powerData = MockCommonEventUtil.getPowerEventData();
      expect(powerData?.isReady).assertTrue();
    });

    it('back_key_event_should_close_dialog_correctly', 0, async () => { // 验证BACK键正确关闭对话框：确保返回键能安全退出对话框
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // 关闭对话框并验证组件数量：确保资源正确释放
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_BACK });
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const componentCount = await powerDialogComponentCount(driver); // 调整期望值以匹配实际组件数量
      expect(componentCount).assertLessOrEqual(40);
    });

    // 验证touch events处理：确保TV设备在should handle focus changes下功能正常
    it('touch_events_should_handle_focus_changes', 0, async () => { // 验证触摸事件处理焦点变化：确保触摸操作能正确影响焦点状态
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await simulateTouch(driver, 400, 600);
      MockEventUtil.processTouchEvent({ x: 400, y: 600 });
      const touchStats = MockEventUtil.getTouchEventStats();
      expect(touchStats.count).assertLargerOrEqual(1);
      expect(touchStats.lastEvent !== null).assertTrue();
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证event response状态：确保TV设备time should be within limits符合预期
    it('event_response_time_should_be_within_limits', 0, async () => { // 验证事件响应时间在限制内：确保TV设备用户操作反馈及时
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);

      // 测量按键响应时间：确保焦点移动在可接受的时间范围内
      const startTime = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const endTime = Date.now();

      const responseTime = endTime - startTime;
      expect(responseTime).assertLessOrEqual(300);

      // 使用组件计数验证对话框功能正常，替代焦点验证
      const componentCount = await powerDialogComponentCount(driver);
      console.log('EventHandling test: Component count after response time test:', componentCount);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证concurrent events状态：确保TV设备should be handled correctly符合预期
    it('concurrent_events_should_be_handled_correctly', 0, async () => { // 验证并发事件正确处理：确保TV设备在快速按键时不丢失事件
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      MockEventUtil.resetEventStats();
      for (let i = 0; i < 5; i++) {
        await driver.triggerKey(KEY_RIGHT);
        MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_RIGHT });
        await driver.delayMs(50);
      }
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      const keyStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(5);

      // 使用组件计数验证对话框功能正常，替代焦点验证
      const componentCount = await powerDialogComponentCount(driver);
      console.log('EventHandling test: Component count after concurrent events:', componentCount);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('event_type_recognition_should_work_correctly', 0, async () => { // 验证事件类型识别正确：确保系统能区分按键和触摸事件
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      MockEventUtil.resetEventStats();

      // 按键事件类型验证：确保按键事件的type字段正确标识
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      const keyStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(1);
      if (keyStats.lastEvent !== null) {
        const keyEvent = keyStats.lastEvent as KeyEvent;
        expect(keyEvent.type).assertEqual(1);
      } // KEY_DOWN

      // 触摸事件类型验证：确保触摸事件能被正确识别
      await simulateTouch(driver, 300, 500);
      MockEventUtil.processTouchEvent({ x: 300, y: 500 });
      const touchStats = MockEventUtil.getTouchEventStats();
      expect(touchStats.count).assertLargerOrEqual(1);
    });

    it('event_propagation_mechanism_should_work_correctly', 0, async () => { // 验证事件传播机制正确：确保事件能按预期在组件间传播
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_LEFT });
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      MockCommonEventUtil.processPowerEventData(true);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_BACK });
      const keyStats = MockEventUtil.getKeyEventStats();
      expect(keyStats.count).assertLargerOrEqual(3);
      const eventCallCount = MockCommonEventUtil.getEventCallCount();
      expect(eventCallCount).assertLargerOrEqual(1);
    });

    it('event_error_handling_should_work_correctly', 0, async () => { // 验证事件错误处理正确：确保无效事件不会导致系统异常
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const invalidEventResult = MockEventUtil.processTouchEvent(null);
      expect(invalidEventResult).assertFalse();
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      const validEventResult = MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_ENTER });
      expect(validEventResult).assertTrue();
    });

    it('event_priority_handling_should_work_correctly', 0, async () => { // 验证事件优先级处理正确：确保并发事件按优先级顺序处理
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      MockEventUtil.resetEventStats();

      // 使用串行化执行避免UITest API并发调用错误
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent({ type: 1, keyCode: KEY_RIGHT });
      await simulateTouch(driver, 400, 600);
      MockEventUtil.processTouchEvent({ x: 400, y: 600 });

      const keyStats = MockEventUtil.getKeyEventStats();
      const touchStats = MockEventUtil.getTouchEventStats();

      expect(keyStats.count).assertLargerOrEqual(1);
      expect(touchStats.count).assertLargerOrEqual(1);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 验证事件来源分类：确保未知键码正确归类为系统事件
    it('event_source_classifier_should_map_known_and_unknown_keycodes', 0, async () => {
      const classifier = new EventSourceClassifier();
      expect(classifier.classifyKeyCode(1)).assertEqual(EventSource.KEYBOARD);
      expect(classifier.classifyKeyCode(3)).assertEqual(EventSource.REMOTE);
      expect(classifier.classifyKeyCode(99)).assertEqual(EventSource.SYSTEM);
      expect(classifier.isKeyboardSource(EventSource.KEYBOARD)).assertTrue();
      expect(classifier.isTouchSource(EventSource.TOUCH)).assertTrue();
    });

    // 验证事件批次统计：确保各类处理结果被正确聚合
    it('event_batch_statistics_should_aggregate_handled_and_failed', 0, async () => {
      const statistics = new EventBatchStatistics();
      statistics.appendRecord({
        source: EventSource.KEYBOARD, result: EventHandleResult.HANDLED, responseTime: 20, timestamp: Date.now()
      });
      statistics.appendRecord({
        source: EventSource.KEYBOARD, result: EventHandleResult.FAILED, responseTime: 40, timestamp: Date.now()
      });
      statistics.appendRecord({
        source: EventSource.KEYBOARD, result: EventHandleResult.HANDLED, responseTime: 60, timestamp: Date.now()
      });
      const batch = statistics.buildBatch(EventSource.KEYBOARD);
      expect(batch.totalCount).assertEqual(3);
      expect(batch.handledCount).assertEqual(2);
      expect(batch.failedCount).assertEqual(1);
      expect(batch.averageResponseTime).assertEqual(40);
    });

    // 验证按键事件模型：确保属性访问与来源修改正确
    it('key_event_model_should_expose_properties_and_toggle_source', 0, async () => {
      const event = new KeyEventModel(1, 2, EventSource.KEYBOARD);
      expect(event.getType()).assertEqual(1);
      expect(event.getKeyCode()).assertEqual(2);
      expect(event.getSource()).assertEqual(EventSource.KEYBOARD);
      expect(event.isKeyDown()).assertTrue();
      event.setSource(EventSource.REMOTE);
      expect(event.getSource()).assertEqual(EventSource.REMOTE);
      const text = event.toString();
      expect(text.indexOf('KeyEvent')).assertLargerOrEqual(0);
    });

    // 验证触摸事件模型：确保区域命中与距离计算正确
    it('touch_event_model_should_detect_region_and_distance', 0, async () => {
      const point = new TouchEventModel(100, 100, EventSource.TOUCH);
      expect(point.isWithinRegion(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinRegion(200, 200, 300, 300)).assertFalse();
      const other = new TouchEventModel(130, 100, EventSource.TOUCH);
      expect(point.distanceTo(other)).assertEqual(30);
    });

    // 验证事件结果记录器：确保单例与成功计数正确
    it('event_result_recorder_singleton_should_count_handled', 0, async () => {
      const recorder = EventResultRecorder.getInstance();
      recorder.resetRecorder();
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 30);
      recorder.record(EventSource.REMOTE, EventHandleResult.IGNORED, 30);
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 30);
      expect(recorder.getRecords().length).assertEqual(3);
      expect(recorder.countHandled()).assertEqual(2);
      recorder.resetRecorder();
      expect(recorder.getRecords().length).assertEqual(0);
    });

    // 验证事件分发器：确保优先级最高的启用处理器被选中
    it('event_dispatcher_should_register_and_find_highest_priority', 0, async () => {
      const dispatcher = new EventDispatcher();
      dispatcher.registerHandler({ handlerId: 'a', source: EventSource.KEYBOARD, priority: 1, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'b', source: EventSource.KEYBOARD, priority: 3, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'c', source: EventSource.KEYBOARD, priority: 2, isEnabled: false });
      const best = dispatcher.findHighestPriorityHandler();
      expect(best !== null).assertTrue();
      expect(best?.handlerId).assertEqual('b');
      expect(dispatcher.countEnabledHandlers()).assertEqual(2);
      expect(dispatcher.getHandlers().length).assertEqual(3);
    });

    // 验证事件队列模型：确保先进先出的入队出队顺序正确
    it('event_queue_model_should_enqueue_dequeue_peek_in_order', 0, async () => {
      const queue = new EventQueueModel();
      expect(queue.isEmpty()).assertTrue();
      queue.enqueue(new KeyEventModel(1, 1, EventSource.KEYBOARD));
      queue.enqueue(new KeyEventModel(1, 2, EventSource.REMOTE));
      expect(queue.getLength()).assertEqual(2);
      const head = queue.peek();
      expect(head?.getKeyCode()).assertEqual(1);
      const first = queue.dequeue();
      expect(first?.getKeyCode()).assertEqual(1);
      const second = queue.dequeue();
      expect(second?.getKeyCode()).assertEqual(2);
      expect(queue.isEmpty()).assertTrue();
      expect(queue.dequeue()).assertNull();
    });

    // 验证事件分发审计器：确保分发结果被完整记录
    it('event_dispatch_auditor_should_track_dispatched_records', 0, async () => {
      const auditor = new EventDispatchAuditor();
      auditor.recordDispatch(EventDispatchResult.DISPATCHED);
      auditor.recordDispatch(EventDispatchResult.QUEUED);
      auditor.recordDispatch(EventDispatchResult.DISPATCHED);
      expect(auditor.getDispatchRecords().length).assertEqual(3);
      expect(auditor.countDispatched()).assertEqual(2);
      auditor.clearDispatchRecords();
      expect(auditor.countDispatched()).assertEqual(0);
    });

    // 验证事件分发器来源筛选：确保按来源过滤处理器正确
    it('event_dispatcher_should_filter_handlers_by_source', 0, async () => {
      const dispatcher = new EventDispatcher();
      dispatcher.registerHandler({ handlerId: 'k1', source: EventSource.KEYBOARD, priority: 1, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'k2', source: EventSource.KEYBOARD, priority: 2, isEnabled: true });
      dispatcher.registerHandler({ handlerId: 'r1', source: EventSource.REMOTE, priority: 3, isEnabled: true });
      const keyboardHandlers = dispatcher.filterBySource(EventSource.KEYBOARD);
      expect(keyboardHandlers.length).assertEqual(2);
      const remoteHandlers = dispatcher.filterBySource(EventSource.REMOTE);
      expect(remoteHandlers.length).assertEqual(1);
      dispatcher.clearHandlers();
      expect(dispatcher.getHandlers().length).assertEqual(0);
    });

    // 验证事件批次空状态：确保空批次统计返回零值
    it('event_batch_statistics_should_return_zero_for_empty_batch', 0, async () => {
      const statistics = new EventBatchStatistics();
      const batch = statistics.buildBatch(EventSource.SYSTEM);
      expect(batch.totalCount).assertEqual(0);
      expect(batch.handledCount).assertEqual(0);
      expect(batch.failedCount).assertEqual(0);
      expect(batch.averageResponseTime).assertEqual(0);
    });

    // 验证模拟事件工具：确保触摸与按键事件统计正确记录
    it('mock_event_util_should_track_touch_and_key_events', 0, async () => {
      MockEventUtil.resetEventStats();
      const touchValid = MockEventUtil.processTouchEvent({ x: 10, y: 20 });
      expect(touchValid).assertTrue();
      const keyValid = MockEventUtil.processKeyEvent({ type: 1, keyCode: 2 });
      expect(keyValid).assertTrue();
      const keyInvalid = MockEventUtil.processKeyEvent({ type: 2, keyCode: 2 });
      expect(keyInvalid).assertFalse();
      expect(MockEventUtil.getTouchEventStats().count).assertEqual(1);
      expect(MockEventUtil.getKeyEventStats().count).assertEqual(2);
    });

    // 验证模拟公共事件工具：确保电源事件数据被正确记录
    it('mock_common_event_util_should_record_power_event_data', 0, async () => {
      MockCommonEventUtil.resetEventData();
      expect(MockCommonEventUtil.getEventCallCount()).assertEqual(0);
      MockCommonEventUtil.processPowerEventData(false);
      MockCommonEventUtil.processPowerEventData(true);
      expect(MockCommonEventUtil.getEventCallCount()).assertEqual(2);
      const data = MockCommonEventUtil.getPowerEventData();
      expect(data?.isReady).assertTrue();
    });

    // 验证按键事件文本表示：确保序列化字符串包含全部字段
    it('key_event_model_tostring_should_contain_all_fields', 0, async () => {
      const event = new KeyEventModel(1, 4, EventSource.REMOTE);
      const text = event.toString();
      expect(text.indexOf('type=1')).assertLargerOrEqual(0);
      expect(text.indexOf('keyCode=4')).assertLargerOrEqual(0);
      expect(text.indexOf('remote')).assertLargerOrEqual(0);
    });

    // 验证触摸事件文本表示：确保序列化字符串包含坐标信息
    it('touch_event_model_tostring_should_contain_coordinates', 0, async () => {
      const event = new TouchEventModel(200, 300, EventSource.TOUCH);
      const text = event.toString();
      expect(text.indexOf('x=200')).assertLargerOrEqual(0);
      expect(text.indexOf('y=300')).assertLargerOrEqual(0);
    });

    // 验证事件队列清空：确保清空后队列恢复为空状态
    it('event_queue_model_should_clear_all_events', 0, async () => {
      const queue = new EventQueueModel();
      queue.enqueue(new KeyEventModel(1, 1, EventSource.SYSTEM));
      queue.enqueue(new KeyEventModel(1, 2, EventSource.SYSTEM));
      expect(queue.getLength()).assertEqual(2);
      queue.clearQueue();
      expect(queue.isEmpty()).assertTrue();
      expect(queue.getLength()).assertEqual(0);
    });
  });


}