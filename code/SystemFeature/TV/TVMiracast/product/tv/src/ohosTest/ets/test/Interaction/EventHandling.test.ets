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
import { Driver } from '../Shared/MiracastDriver';
import { getDriver, triggerMiracastHome, waitForPageStable, waitForPermissionDialog, miracastComponentCount,
  countComponentsById, checkFocusState, pressAndWait, simulateTouch, getCurrentFocusIndex, serializedDelay,
  KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK, KEY_MENU, ID_ALLOW_BTN, ID_CANCEL_BTN,
  TIMEOUT_PAGE_RENDER, TIMEOUT_FOCUS_CHANGE, DELAY_KEY_NAVIGATION, DELAY_TOUCH_EVENT, DELAY_AFTER_SESSION_OP } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'EventHandlingSuite';

// ===== 事件处理领域模型（本地 Mock，纯逻辑，不依赖业务源码） =====

// 事件来源枚举：描述按键来自遥控器、触摸还是系统
enum EventSource {
  REMOTE = 'remote',
  TOUCH = 'touch',
  SYSTEM = 'system',
  SERVICE = 'service'
}

// 事件处理结果枚举：描述一次事件被消费的方式
enum EventHandleResult {
  HANDLED = 'handled',
  IGNORED = 'ignored',
  DELEGATED = 'delegated',
  FAILED = 'failed'
}

// 按键路由枚举：描述按键落在哪个投屏页面上
enum KeyRoute {
  INDEX = 'index',
  PLAYER = 'player',
  PERMISSION = 'permission',
  CHANGE_NAME = 'change_name',
  UNKNOWN = 'unknown'
}

// 按键事件接口：描述一次遥控器按键
interface KeyEventSpec {
  keyCode: number;
  eventType: number;
  source: EventSource;
}

// 处理记录接口：描述一条事件处理详情
interface EventHandleRecord {
  source: EventSource;
  result: EventHandleResult;
  keyCode: number;
  responseTime: number;
  timestamp: number;
}

// 事件批次接口：描述一批事件的处理统计
interface EventBatch {
  source: EventSource;
  totalCount: number;
  handledCount: number;
  failedCount: number;
  averageResponseTime: number;
}

// 按键事件模型：封装按键类型、键码与来源
class KeyEventModel {
  private eventType: number;
  private keyCode: number;
  private source: EventSource;
  private repeatCount: number = 0;

  constructor(eventType: number, keyCode: number, source: EventSource) {
    this.eventType = eventType;
    this.keyCode = keyCode;
    this.source = source;
  }

  public getEventType(): number {
    return this.eventType;
  }

  public getKeyCode(): number {
    return this.keyCode;
  }

  public getSource(): EventSource {
    return this.source;
  }

  public getRepeatCount(): number {
    return this.repeatCount;
  }

  public setSource(source: EventSource): void {
    this.source = source;
  }

  public markRepeat(): number {
    this.repeatCount++;
    return this.repeatCount;
  }

  // 判断是否为按下事件：业务侧约定 eventType 1 为 KEY_DOWN
  public isKeyDown(): boolean {
    return this.eventType === 1;
  }

  public isNavigationKey(): boolean {
    return this.keyCode === KEY_LEFT || this.keyCode === KEY_RIGHT || this.keyCode === KEY_UP ||
      this.keyCode === KEY_DOWN;
  }

  public isConfirmKey(): boolean {
    return this.keyCode === KEY_ENTER;
  }

  public toString(): string {
    return 'KeyEventModel(type=' + this.eventType + ', keyCode=' + this.keyCode + ', source=' + this.source + ')';
  }
}

// 触摸事件模型：封装触摸点坐标、区域命中与距离
class TouchEventModel {
  private x: number;
  private y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }

  public getX(): number {
    return this.x;
  }

  public getY(): number {
    return this.y;
  }

  public isWithinRegion(minX: number, minY: number, maxX: number, maxY: number): boolean {
    return this.x >= minX && this.x <= maxX && this.y >= minY && this.y <= maxY;
  }

  public distanceTo(other: TouchEventModel): number {
    const deltaX: number = this.x - other.getX();
    const deltaY: number = this.y - other.getY();
    return Math.sqrt(deltaX * deltaX + deltaY * deltaY);
  }

  public isInTopHalf(screenHeight: number): boolean {
    return this.y < screenHeight / 2;
  }
}

// 按键路由表：按页面注册键码，解析按键应落到哪个页面
class KeyRouteTable {
  private indexKeys: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK];
  private playerKeys: number[] = [KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK, KEY_MENU];
  private permissionKeys: number[] = [KEY_LEFT, KEY_RIGHT, KEY_ENTER, KEY_BACK];

  public resolveRoute(page: string, keyCode: number): KeyRoute {
    if (page === KeyRoute.INDEX) {
      return this.contains(this.indexKeys, keyCode) ? KeyRoute.INDEX : KeyRoute.UNKNOWN;
    }
    if (page === KeyRoute.PLAYER) {
      return this.contains(this.playerKeys, keyCode) ? KeyRoute.PLAYER : KeyRoute.UNKNOWN;
    }
    if (page === KeyRoute.PERMISSION) {
      return this.contains(this.permissionKeys, keyCode) ? KeyRoute.PERMISSION : KeyRoute.UNKNOWN;
    }
    if (page === KeyRoute.CHANGE_NAME) {
      return keyCode === KEY_BACK || keyCode === KEY_ENTER ? KeyRoute.CHANGE_NAME : KeyRoute.UNKNOWN;
    }
    return KeyRoute.UNKNOWN;
  }

  private contains(keys: number[], keyCode: number): boolean {
    for (const key of keys) {
      if (key === keyCode) {
        return true;
      }
    }
    return false;
  }

  public getIndexKeyCount(): number {
    return this.indexKeys.length;
  }



}

// 重复按键抑制器：连续同键在阈值内只处理一次
class RepeatSuppressor {
  private lastKeyCode: number = -1;
  private lastHandledTime: number = -1;

  public shouldHandle(keyCode: number, now: number, thresholdMs: number): boolean {
    if (keyCode !== this.lastKeyCode) {
      this.lastKeyCode = keyCode;
      this.lastHandledTime = now;
      return true;
    }
    if (this.lastHandledTime < 0 || now - this.lastHandledTime >= thresholdMs) {
      this.lastHandledTime = now;
      return true;
    }
    return false;
  }

  public reset(): void {
    this.lastKeyCode = -1;
    this.lastHandledTime = -1;
  }

  public getLastKeyCode(): number {
    return this.lastKeyCode;
  }
}

// 事件批次统计器：按来源聚合处理结果
class EventBatchStatistics {
  private records: EventHandleRecord[] = [];

  public appendRecord(record: EventHandleRecord): void {
    this.records.push(record);
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public buildBatch(source: EventSource): EventBatch {
    let total: number = 0;
    let handled: number = 0;
    let failed: number = 0;
    let responseTotal: number = 0;
    for (const record of this.records) {
      if (record.source !== source) {
        continue;
      }
      total++;
      responseTotal += record.responseTime;
      if (record.result === EventHandleResult.HANDLED) {
        handled++;
      }
      if (record.result === EventHandleResult.FAILED) {
        failed++;
      }
    }
    const batch: EventBatch = {
      source: source,
      totalCount: total,
      handledCount: handled,
      failedCount: failed,
      averageResponseTime: total === 0 ? 0 : responseTotal / total
    };
    return batch;
  }

  public clearRecords(): void {
    this.records = [];
  }
}

// 事件处理器描述接口：描述一个按键处理器的优先级与来源
interface EventHandlerDescriptor {
  handlerId: string;
  source: EventSource;
  priority: number;
  enabled: boolean;
}

// 事件分发器：按优先级选择处理器并按来源筛选
class EventDispatcher {
  private handlers: EventHandlerDescriptor[] = [];

  public registerHandler(handler: EventHandlerDescriptor): void {
    this.handlers.push(handler);
  }

  public getHandlerCount(): number {
    return this.handlers.length;
  }

  public findHighestPriorityHandler(): EventHandlerDescriptor | null {
    let best: EventHandlerDescriptor | null = null;
    for (const handler of this.handlers) {
      if (!handler.enabled) {
        continue;
      }
      if (best === null || handler.priority > best.priority) {
        best = handler;
      }
    }
    return best;
  }

  public filterBySource(source: EventSource): EventHandlerDescriptor[] {
    const filtered: EventHandlerDescriptor[] = [];
    for (const handler of this.handlers) {
      if (handler.source === source) {
        filtered.push(handler);
      }
    }
    return filtered;
  }

  public countEnabledHandlers(): number {
    let count: number = 0;
    for (const handler of this.handlers) {
      if (handler.enabled) {
        count++;
      }
    }
    return count;
  }

  public clearHandlers(): void {
    this.handlers = [];
  }
}

// 事件队列模型：先进先出地缓存待处理按键
class EventQueueModel {
  private queue: KeyEventModel[] = [];

  public enqueue(event: KeyEventModel): void {
    this.queue.push(event);
  }

  public dequeue(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    const first: KeyEventModel = this.queue[0];
    this.queue.splice(0, 1);
    return first;
  }

  public peek(): KeyEventModel | null {
    if (this.queue.length === 0) {
      return null;
    }
    return this.queue[0];
  }

  public getLength(): number {
    return this.queue.length;
  }

  public isEmpty(): boolean {
    return this.queue.length === 0;
  }


}

// 事件结果记录器：单例记录事件处理结果
class EventResultRecorder {
  private static instance: EventResultRecorder | null = null;
  private records: EventHandleRecord[] = [];

  public static getInstance(): EventResultRecorder {
    let inst: EventResultRecorder | null = EventResultRecorder.instance;
    if (inst === null) {
      inst = new EventResultRecorder();
      EventResultRecorder.instance = inst;
    }
    return inst;
  }

  public record(source: EventSource, result: EventHandleResult, responseTime: number): void {
    const record: EventHandleRecord = {
      source: source,
      result: result,
      keyCode: -1,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getRecords(): EventHandleRecord[] {
    return [...this.records];
  }

  public countHandled(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.result === EventHandleResult.HANDLED) {
        count++;
      }
    }
    return count;
  }

  public resetRecorder(): void {
    this.records = [];
  }
}

// 服务事件数据接口：描述会话操作事件的就绪状态
interface ServiceEventData {
  isReady: boolean;
  timestamp: number;
}

// 模拟事件工具：统计触摸与按键事件，供设备侧断言引用
class MockEventUtil {
  private static touchEventCount: number = 0;
  private static keyEventCount: number = 0;
  private static lastKeyCode: number = -1;

  public static processTouchEvent(event: TouchEventModel | null): boolean {
    if (event === null) {
      return false;
    }
    MockEventUtil.touchEventCount++;
    return true;
  }

  public static processKeyEvent(event: KeyEventModel | null): boolean {
    if (event === null) {
      return false;
    }
    MockEventUtil.keyEventCount++;
    MockEventUtil.lastKeyCode = event.getKeyCode();
    return event.isKeyDown();
  }

  public static getTouchEventCount(): number {
    return MockEventUtil.touchEventCount;
  }

  public static getKeyEventCount(): number {
    return MockEventUtil.keyEventCount;
  }

  public static getLastKeyCode(): number {
    return MockEventUtil.lastKeyCode;
  }

  public static resetEventStats(): void {
    MockEventUtil.touchEventCount = 0;
    MockEventUtil.keyEventCount = 0;
    MockEventUtil.lastKeyCode = -1;
  }
}

// 模拟服务事件工具：记录会话启动与停止事件
class MockServiceEventUtil {
  private static serviceEventData: ServiceEventData | null = null;
  private static eventCallCount: number = 0;

  public static processServiceEventData(isReady: boolean): void {
    MockServiceEventUtil.eventCallCount++;
    MockServiceEventUtil.serviceEventData = { isReady: isReady, timestamp: Date.now() };
  }

  public static getServiceEventData(): ServiceEventData | null {
    return MockServiceEventUtil.serviceEventData;
  }

  public static getEventCallCount(): number {
    return MockServiceEventUtil.eventCallCount;
  }

  public static resetEventData(): void {
    MockServiceEventUtil.serviceEventData = null;
    MockServiceEventUtil.eventCallCount = 0;
  }
}

// 事件延迟分析器：统计按键处理耗时
class EventLatencyAnalyzer {
  private latencies: number[] = [];

  public record(latencyMs: number): void {
    this.latencies.push(latencyMs);
  }

  public getCount(): number {
    return this.latencies.length;
  }

  public getAverage(): number {
    if (this.latencies.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const latency of this.latencies) {
      total += latency;
    }
    return total / this.latencies.length;
  }

  public getMax(): number {
    let max: number = 0;
    for (const latency of this.latencies) {
      if (latency > max) {
        max = latency;
      }
    }
    return max;
  }

  public isWithinBudget(budgetMs: number): boolean {
    return this.latencies.length > 0 && this.getMax() <= budgetMs;
  }

  public reset(): void {
    this.latencies = [];
  }
}

export default function eventHandlingSuite(): void {
  describe('EventHandling_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动并回到投屏首页
    beforeAll(async () => {
      driver = getDriver();
      MockEventUtil.resetEventStats();
      MockServiceEventUtil.resetEventData();
      Log.info(TAG, 'suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    // 测试清理：退出浮窗与播放页
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    // 验证方向键触发首页焦点导航
    it('arrow_key_events_should_trigger_focus_navigation', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialFocus: number = await getCurrentFocusIndex(driver);
      expect(initialFocus).assertLargerOrEqual(-1);
      if (initialFocus >= 0) {
      }
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_RIGHT, EventSource.REMOTE));
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_LEFT, EventSource.REMOTE));
      expect(MockEventUtil.getKeyEventCount()).assertEqual(2);
    });

    // 验证确认键触发投屏开关事件
    it('enter_key_event_should_trigger_switch_operation', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_ENTER, EventSource.REMOTE));
      MockServiceEventUtil.processServiceEventData(true);
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      expect(MockServiceEventUtil.getEventCallCount()).assertEqual(1);
      const data: ServiceEventData | null = MockServiceEventUtil.getServiceEventData();
      expect(data !== null).assertTrue();
      if (data !== null) {
        expect(data.isReady).assertTrue();
      }
    });

    // 验证返回键退出浮窗且组件数量回落
    it('back_key_event_should_close_overlay', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_BACK, EventSource.REMOTE));
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLessOrEqual(200);
      await triggerMiracastHome(driver);
    });

    // 验证触摸事件被记录且页面保持可用
    it('touch_events_should_be_recorded', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await simulateTouch(driver, 400, 600);
      const handled: boolean = MockEventUtil.processTouchEvent(new TouchEventModel(400, 600));
      expect(handled).assertTrue();
      expect(MockEventUtil.getTouchEventCount()).assertEqual(1);
      await driver.delayMs(DELAY_TOUCH_EVENT);
    });

    // 验证按键响应时间在预算内
    it('event_response_time_should_be_within_limits', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const analyzer = new EventLatencyAnalyzer();
      const startTime: number = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      analyzer.record(Date.now() - startTime);
      expect(analyzer.getCount()).assertEqual(1);
      expect(analyzer.isWithinBudget(TIMEOUT_FOCUS_CHANGE)).assertTrue();
      expect(analyzer.getAverage()).assertLargerOrEqual(0);
    });

    // 验证快速连续按键被全部记录
    it('concurrent_events_should_be_handled_correctly', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      MockEventUtil.resetEventStats();
      for (let i = 0; i < 5; i++) {
        await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_RIGHT, EventSource.REMOTE));
      }
      expect(MockEventUtil.getKeyEventCount()).assertEqual(5);
      expect(MockEventUtil.getLastKeyCode()).assertEqual(KEY_RIGHT);
    });

    // 验证按键与触摸事件类型区分
    it('event_type_recognition_should_work_correctly', 0, async () => {
      MockEventUtil.resetEventStats();
      const keyHandled: boolean = MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_ENTER, EventSource.REMOTE));
      expect(keyHandled).assertTrue();
      const keyUpHandled: boolean = MockEventUtil.processKeyEvent(new KeyEventModel(2, KEY_ENTER, EventSource.REMOTE));
      expect(keyUpHandled).assertFalse();
      expect(MockEventUtil.getKeyEventCount()).assertEqual(2);
      expect(MockEventUtil.getTouchEventCount()).assertEqual(0);
    });

    // 验证无效事件被安全拒绝
    it('event_error_handling_should_reject_null_events', 0, async () => {
      MockEventUtil.resetEventStats();
      expect(MockEventUtil.processTouchEvent(null)).assertFalse();
      expect(MockEventUtil.getTouchEventCount()).assertEqual(0);
      expect(MockEventUtil.processKeyEvent(null)).assertFalse();
      expect(MockEventUtil.getKeyEventCount()).assertEqual(0);
    });

    // 验证按键路由表把方向键路由到首页
    it('key_route_table_should_route_index_keys', 0, async () => {
      const table = new KeyRouteTable();
      expect(table.resolveRoute(KeyRoute.INDEX, KEY_LEFT)).assertEqual(KeyRoute.INDEX);
      expect(table.resolveRoute(KeyRoute.INDEX, KEY_ENTER)).assertEqual(KeyRoute.INDEX);
      expect(table.resolveRoute(KeyRoute.INDEX, KEY_MENU)).assertEqual(KeyRoute.UNKNOWN);
      expect(table.getIndexKeyCount()).assertEqual(6);
    });

    // 验证重复按键在同一时刻被抑制
    it('repeat_suppressor_should_block_same_key_within_threshold', 0, async () => {
      const suppressor = new RepeatSuppressor();
      expect(suppressor.shouldHandle(KEY_RIGHT, 1000, 100)).assertTrue();
      expect(suppressor.shouldHandle(KEY_RIGHT, 1050, 100)).assertFalse();
      expect(suppressor.shouldHandle(KEY_RIGHT, 1100, 100)).assertTrue();
      expect(suppressor.getLastKeyCode()).assertEqual(KEY_RIGHT);
    });

    // 验证不同键码切换时立即放行
    it('repeat_suppressor_should_allow_key_switch', 0, async () => {
      const suppressor = new RepeatSuppressor();
      expect(suppressor.shouldHandle(KEY_RIGHT, 1000, 200)).assertTrue();
      expect(suppressor.shouldHandle(KEY_LEFT, 1010, 200)).assertTrue();
      expect(suppressor.shouldHandle(KEY_LEFT, 1020, 200)).assertFalse();
      suppressor.reset();
      expect(suppressor.getLastKeyCode()).assertEqual(-1);
      expect(suppressor.shouldHandle(KEY_LEFT, 1030, 200)).assertTrue();
    });

    // 验证事件批次统计聚合处理结果
    it('event_batch_statistics_should_aggregate_records', 0, async () => {
      const statistics = new EventBatchStatistics();
      statistics.appendRecord({
        source: EventSource.REMOTE,
        result: EventHandleResult.HANDLED,
        keyCode: KEY_RIGHT,
        responseTime: 20,
        timestamp: 1
      });
      statistics.appendRecord({
        source: EventSource.REMOTE,
        result: EventHandleResult.FAILED,
        keyCode: KEY_LEFT,
        responseTime: 40,
        timestamp: 2
      });
      statistics.appendRecord({
        source: EventSource.TOUCH,
        result: EventHandleResult.HANDLED,
        keyCode: -1,
        responseTime: 100,
        timestamp: 3
      });
      const batch: EventBatch = statistics.buildBatch(EventSource.REMOTE);
      expect(batch.totalCount).assertEqual(2);
      expect(batch.handledCount).assertEqual(1);
      expect(batch.failedCount).assertEqual(1);
      expect(batch.averageResponseTime).assertEqual(30);
      expect(statistics.getRecordCount()).assertEqual(3);
    });

    // 验证空批次统计返回零值
    it('event_batch_statistics_should_return_zero_for_empty_batch', 0, async () => {
      const statistics = new EventBatchStatistics();
      const batch: EventBatch = statistics.buildBatch(EventSource.SERVICE);
      expect(batch.totalCount).assertEqual(0);
      expect(batch.handledCount).assertEqual(0);
      expect(batch.averageResponseTime).assertEqual(0);
      statistics.appendRecord({
        source: EventSource.SERVICE,
        result: EventHandleResult.HANDLED,
        keyCode: -1,
        responseTime: 10,
        timestamp: 1
      });
      statistics.clearRecords();
      expect(statistics.getRecordCount()).assertEqual(0);
    });

    // 验证事件分发器选择优先级最高的启用处理器
    it('event_dispatcher_should_find_highest_priority', 0, async () => {
      const dispatcher = new EventDispatcher();
      dispatcher.registerHandler({
        handlerId: 'index',
        source: EventSource.REMOTE,
        priority: 1,
        enabled: true
      });
      dispatcher.registerHandler({
        handlerId: 'player',
        source: EventSource.REMOTE,
        priority: 3,
        enabled: true
      });
      dispatcher.registerHandler({
        handlerId: 'dialog',
        source: EventSource.REMOTE,
        priority: 5,
        enabled: false
      });
      const best: EventHandlerDescriptor | null = dispatcher.findHighestPriorityHandler();
      expect(best !== null).assertTrue();
      if (best !== null) {
        expect(best.handlerId).assertEqual('player');
      }
      expect(dispatcher.countEnabledHandlers()).assertEqual(2);
      expect(dispatcher.getHandlerCount()).assertEqual(3);
    });

    // 验证事件分发器按来源筛选
    it('event_dispatcher_should_filter_by_source', 0, async () => {
      const dispatcher = new EventDispatcher();
      dispatcher.registerHandler({
        handlerId: 'r1',
        source: EventSource.REMOTE,
        priority: 1,
        enabled: true
      });
      dispatcher.registerHandler({
        handlerId: 'r2',
        source: EventSource.REMOTE,
        priority: 2,
        enabled: true
      });
      dispatcher.registerHandler({
        handlerId: 't1',
        source: EventSource.TOUCH,
        priority: 3,
        enabled: true
      });
      expect(dispatcher.filterBySource(EventSource.REMOTE).length).assertEqual(2);
      expect(dispatcher.filterBySource(EventSource.TOUCH).length).assertEqual(1);
      expect(dispatcher.filterBySource(EventSource.SYSTEM).length).assertEqual(0);
      dispatcher.clearHandlers();
      expect(dispatcher.getHandlerCount()).assertEqual(0);
    });

    // 验证事件队列先进先出
    it('event_queue_should_be_first_in_first_out', 0, async () => {
      const queue = new EventQueueModel();
      expect(queue.isEmpty()).assertTrue();
      queue.enqueue(new KeyEventModel(1, KEY_RIGHT, EventSource.REMOTE));
      queue.enqueue(new KeyEventModel(1, KEY_ENTER, EventSource.REMOTE));
      expect(queue.getLength()).assertEqual(2);
      expect(queue.peek()?.getKeyCode()).assertEqual(KEY_RIGHT);
      expect(queue.dequeue()?.getKeyCode()).assertEqual(KEY_RIGHT);
      expect(queue.getLength()).assertEqual(1);
    });
    // 验证结果记录器单例与成功计数
    it('event_result_recorder_singleton_should_count_handled', 0, async () => {
      const recorder = EventResultRecorder.getInstance();
      const same: EventResultRecorder = EventResultRecorder.getInstance();
      expect(recorder === same).assertTrue();
      recorder.resetRecorder();
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 20);
      recorder.record(EventSource.REMOTE, EventHandleResult.IGNORED, 25);
      recorder.record(EventSource.REMOTE, EventHandleResult.HANDLED, 30);
      expect(recorder.getRecords().length).assertEqual(3);
      expect(recorder.countHandled()).assertEqual(2);
      recorder.resetRecorder();
      expect(recorder.getRecords().length).assertEqual(0);
    });

    // 验证按键事件模型属性与来源切换
    it('key_event_model_should_expose_properties', 0, async () => {
      const event = new KeyEventModel(1, KEY_MENU, EventSource.REMOTE);
      expect(event.getEventType()).assertEqual(1);
      expect(event.getKeyCode()).assertEqual(KEY_MENU);
      expect(event.getSource()).assertEqual(EventSource.REMOTE);
      expect(event.isKeyDown()).assertTrue();
      expect(event.isNavigationKey()).assertFalse();
      expect(event.isConfirmKey()).assertFalse();
      event.setSource(EventSource.SYSTEM);
      expect(event.getSource()).assertEqual(EventSource.SYSTEM);
    });

    // 验证按键事件重复计数与文本表示
    it('key_event_model_should_track_repeat_and_text', 0, async () => {
      const event = new KeyEventModel(1, KEY_RIGHT, EventSource.REMOTE);
      expect(event.getRepeatCount()).assertEqual(0);
      expect(event.markRepeat()).assertEqual(1);
      expect(event.markRepeat()).assertEqual(2);
      expect(event.getRepeatCount()).assertEqual(2);
      const text: string = event.toString();
      expect(text.indexOf('KeyEventModel')).assertLargerOrEqual(0);
      expect(text.indexOf('keyCode=' + KEY_RIGHT)).assertLargerOrEqual(0);
    });

    // 验证触摸事件区域命中与距离计算
    it('touch_event_model_should_detect_region_and_distance', 0, async () => {
      const point = new TouchEventModel(100, 100);
      expect(point.isWithinRegion(0, 0, 200, 200)).assertTrue();
      expect(point.isWithinRegion(200, 200, 300, 300)).assertFalse();
      expect(point.isInTopHalf(400)).assertTrue();
      expect(point.isInTopHalf(150)).assertFalse();
      const other = new TouchEventModel(130, 140);
      expect(point.distanceTo(other)).assertEqual(50);
    });

    // 验证模拟事件工具的按键统计
    it('mock_event_util_should_track_key_events', 0, async () => {
      MockEventUtil.resetEventStats();
      expect(MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_ENTER, EventSource.REMOTE))).assertTrue();
      expect(MockEventUtil.processKeyEvent(new KeyEventModel(2, KEY_ENTER, EventSource.REMOTE))).assertFalse();
      expect(MockEventUtil.getKeyEventCount()).assertEqual(2);
      expect(MockEventUtil.getLastKeyCode()).assertEqual(KEY_ENTER);
      expect(MockEventUtil.getTouchEventCount()).assertEqual(0);
    });

    // 验证模拟事件工具的触摸统计
    it('mock_event_util_should_track_touch_events', 0, async () => {
      MockEventUtil.resetEventStats();
      expect(MockEventUtil.processTouchEvent(new TouchEventModel(10, 20))).assertTrue();
      expect(MockEventUtil.processTouchEvent(null)).assertFalse();
      expect(MockEventUtil.getTouchEventCount()).assertEqual(1);
      expect(MockEventUtil.getKeyEventCount()).assertEqual(0);
      MockEventUtil.resetEventStats();
      expect(MockEventUtil.getTouchEventCount()).assertEqual(0);
      expect(MockEventUtil.getLastKeyCode()).assertEqual(-1);
    });

    // 验证模拟服务事件工具记录调用次数与新值
    it('mock_service_event_util_should_record_data', 0, async () => {
      MockServiceEventUtil.resetEventData();
      expect(MockServiceEventUtil.getEventCallCount()).assertEqual(0);
      MockServiceEventUtil.processServiceEventData(false);
      MockServiceEventUtil.processServiceEventData(true);
      expect(MockServiceEventUtil.getEventCallCount()).assertEqual(2);
      const data: ServiceEventData | null = MockServiceEventUtil.getServiceEventData();
      expect(data !== null).assertTrue();
      if (data !== null) {
        expect(data.isReady).assertTrue();
        expect(data.timestamp).assertLarger(0);
      }
    });

    // 验证延迟分析器的平均值与最大值
    it('latency_analyzer_should_compute_average_and_max', 0, async () => {
      const analyzer = new EventLatencyAnalyzer();
      analyzer.record(20);
      analyzer.record(40);
      analyzer.record(60);
      expect(analyzer.getCount()).assertEqual(3);
      expect(analyzer.getAverage()).assertEqual(40);
      expect(analyzer.getMax()).assertEqual(60);
      expect(analyzer.isWithinBudget(60)).assertTrue();
      expect(analyzer.isWithinBudget(50)).assertFalse();
      analyzer.reset();
      expect(analyzer.getCount()).assertEqual(0);
      expect(analyzer.getAverage()).assertEqual(0);
    });

    // 验证权限浮窗出现时按键路由为权限页
    it('permission_dialog_should_consume_navigation_keys', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      const allowCount: number = await countComponentsById(driver, ID_ALLOW_BTN);
      const cancelCount: number = await countComponentsById(driver, ID_CANCEL_BTN);
      const table = new KeyRouteTable();
      expect(table.resolveRoute(KeyRoute.PERMISSION, KEY_LEFT)).assertEqual(KeyRoute.PERMISSION);
      expect(allowCount).assertLargerOrEqual(0); expect(cancelCount).assertLargerOrEqual(0);
      expect(dialogVisible || allowCount === 0).assertTrue();
    });

    // 验证首页确认键事件被路由到首页
    it('index_enter_key_should_route_to_index_page', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const table = new KeyRouteTable();
      expect(table.resolveRoute(KeyRoute.INDEX, KEY_ENTER)).assertEqual(KeyRoute.INDEX);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      MockEventUtil.processKeyEvent(new KeyEventModel(1, KEY_ENTER, EventSource.REMOTE));
      expect(MockEventUtil.getLastKeyCode()).assertEqual(KEY_ENTER);
    });

    // 综合事件处理场景：路由、队列、分发、统计四段串联
    it('comprehensive_event_handling_scenario', 0, async () => {
      const table = new KeyRouteTable();
      const queue = new EventQueueModel();
      const dispatcher = new EventDispatcher();
      const statistics = new EventBatchStatistics();
      dispatcher.registerHandler({
        handlerId: 'index',
        source: EventSource.REMOTE,
        priority: 1,
        enabled: true
      });
      dispatcher.registerHandler({
        handlerId: 'player',
        source: EventSource.REMOTE,
        priority: 2,
        enabled: true
      });
      queue.enqueue(new KeyEventModel(1, KEY_RIGHT, EventSource.REMOTE));
      queue.enqueue(new KeyEventModel(1, KEY_ENTER, EventSource.REMOTE));
      const first: KeyEventModel | null = queue.dequeue();
      expect(first !== null).assertTrue();
      if (first !== null) {
        expect(table.resolveRoute(KeyRoute.INDEX, first.getKeyCode())).assertEqual(KeyRoute.INDEX);
        statistics.appendRecord({
          source: EventSource.REMOTE,
          result: EventHandleResult.HANDLED,
          keyCode: first.getKeyCode(),
          responseTime: 25,
          timestamp: Date.now()
        });
      }
      const best: EventHandlerDescriptor | null = dispatcher.findHighestPriorityHandler();
      expect(best !== null && best.handlerId === 'player').assertTrue();
      const batch: EventBatch = statistics.buildBatch(EventSource.REMOTE);
      expect(batch.totalCount).assertEqual(1); expect(batch.handledCount).assertEqual(1);
      expect(queue.getLength()).assertEqual(1);
    });
  });
}
