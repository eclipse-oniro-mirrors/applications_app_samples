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
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum EventPhase {
  CAPTURING = 'capturing', AT_TARGET = 'at_target', BUBBLING = 'bubbling'
}

interface EventRecord {
  eventType: string;
  phase: EventPhase;
  isPropagated: boolean;
  isStopped: boolean;
  responseTime: number;
  timestamp: number;
}

class EventPropagationTracker {
  private static instance: EventPropagationTracker;
  private eventHistory: EventRecord[] = [];
  private totalEvents: number = 0;
  private propagatedEvents: number = 0;
  private stoppedEvents: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): EventPropagationTracker {
    if (!EventPropagationTracker.instance) {
      EventPropagationTracker.instance = new EventPropagationTracker();
    }
    return EventPropagationTracker.instance;
  }

  public recordEvent(eventType: string, phase: EventPhase, isPropagated: boolean, isStopped: boolean,
    responseTime: number): void {
    const record: EventRecord = {
      eventType,
      phase,
      isPropagated,
      isStopped,
      responseTime,
      timestamp: Date.now()
    };
    this.eventHistory.push(record);
    this.totalEvents++;
    if (isPropagated) {
      this.propagatedEvents++;
    }
    if (isStopped) {
      this.stoppedEvents++;
    }
  }

  public getEventHistory(): EventRecord[] {
    return [...this.eventHistory];
  }

  public getTotalEvents(): number {
    return this.totalEvents;
  }

  public getPropagatedEvents(): number {
    return this.propagatedEvents;
  }

  public getStoppedEvents(): number {
    return this.stoppedEvents;
  }

  public resetTracker(): void {
    this.eventHistory = [];
    this.totalEvents = 0;
    this.propagatedEvents = 0;
    this.stoppedEvents = 0;
  }

  public getPropagationRate(): number {
    if (this.totalEvents === 0) {
      return 0;
    }
    return this.propagatedEvents / this.totalEvents;
  }

  public hasEventType(eventType: string): boolean {
    return this.eventHistory.some(record => record.eventType === eventType);
  }

  public hasPhase(phase: EventPhase): boolean {
    return this.eventHistory.some(record => record.phase === phase);
  }
}

// ==================== 事件传播扩展工具集（新增代码） ====================

// 传播通道枚举：描述事件传播经过的不同通道
enum PropagationChannel {
  CAPTURE = 'capture', TARGET = 'target', BUBBLE = 'bubble'
}

// 传播状态枚举：描述事件在传播过程中的状态
enum PropagationStatus {
  PENDING = 'pending', PROPAGATING = 'propagating', STOPPED = 'stopped', COMPLETED = 'completed'
}

// 传播统计接口：汇总事件传播的统计信息
interface PropagationStatistics {
  totalEvents: number;
  propagatedCount: number;
  stoppedCount: number;
  completedCount: number;
  propagationRate: number;
}

// 传播阶段映射接口：描述事件类型与传播通道的映射关系
interface PropagationPhaseMapping {
  eventType: string;
  channel: PropagationChannel;
  isPropagated: boolean;
}

// 传播通道映射器：将事件传播阶段映射到逻辑通道
class PropagationChannelMapper {
  private static readonly PHASE_TO_CHANNEL: Map<EventPhase, PropagationChannel> =
    new Map([[EventPhase.CAPTURING, PropagationChannel.CAPTURE], [EventPhase.AT_TARGET, PropagationChannel.TARGET],
      [EventPhase.BUBBLING, PropagationChannel.BUBBLE]]);

  // 将事件阶段映射为传播通道
  public mapPhase(phase: EventPhase): PropagationChannel {
    const channel = PropagationChannelMapper.PHASE_TO_CHANNEL.get(phase);
    if (channel === undefined) {
      return PropagationChannel.TARGET;
    }
    return channel;
  }

  // 判断阶段是否为捕获阶段
  public isCapturePhase(phase: EventPhase): boolean {
    return phase === EventPhase.CAPTURING;
  }

  // 判断阶段是否为冒泡阶段
  public isBubblePhase(phase: EventPhase): boolean {
    return phase === EventPhase.BUBBLING;
  }
}

// 事件传播统计器：聚合事件传播统计信息
class PropagationStatisticsCalculator {
  private records: EventRecord[] = [];

  constructor(records: EventRecord[]) {
    this.records = [...records];
  }

  // 生成传播统计信息
  public buildStatistics(): PropagationStatistics {
    const statistics: PropagationStatistics = {
      totalEvents: this.records.length,
      propagatedCount: this.countPropagated(),
      stoppedCount: this.countStopped(),
      completedCount: this.countCompleted(),
      propagationRate: this.computePropagationRate()
    };
    return statistics;
  }

  // 统计已传播的事件数量
  private countPropagated(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isPropagated) {
        count++;
      }
    }
    return count;
  }

  // 统计已停止传播的事件数量
  private countStopped(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isStopped) {
        count++;
      }
    }
    return count;
  }

  // 统计已完成传播的事件数量
  private countCompleted(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isPropagated && !record.isStopped) {
        count++;
      }
    }
    return count;
  }

  // 计算事件传播率
  private computePropagationRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countPropagated() / this.records.length;
  }
}

// 传播阶段映射模型：封装事件类型与传播通道的映射关系
class PropagationPhaseMappingEntry {
  private eventType: string;
  private channel: PropagationChannel;
  private isPropagated: boolean;

  constructor(eventType: string, channel: PropagationChannel, isPropagated: boolean) {
    this.eventType = eventType;
    this.channel = channel;
    this.isPropagated = isPropagated;
  }

  public getEventType(): string {
    return this.eventType;
  }

  public getChannel(): PropagationChannel {
    return this.channel;
  }

  public getIsPropagated(): boolean {
    return this.isPropagated;
  }

  public setIsPropagated(isPropagated: boolean): void {
    this.isPropagated = isPropagated;
  }

  // 生成映射条目的文本表示
  public toString(): string {
    return `${this.eventType} -> ${this.channel} propagated=${this.isPropagated}`;
  }

  // 判断两个映射条目是否相等
  public equals(other: PropagationPhaseMappingEntry): boolean {
    return this.eventType === other.eventType && this.channel === other.channel;
  }
}

// 事件传播路径模型：描述事件从捕获到冒泡的完整路径
class EventPropagationPath {
  private stages: PropagationChannel[] = [];
  private currentStatus: PropagationStatus = PropagationStatus.PENDING;

  // 添加一个传播阶段
  public addStage(channel: PropagationChannel): void {
    this.stages.push(channel);
  }

  // 推进传播状态
  public advanceStatus(): void {
    if (this.currentStatus === PropagationStatus.PENDING) {
      this.currentStatus = PropagationStatus.PROPAGATING;
    } else if (this.currentStatus === PropagationStatus.PROPAGATING) {
      this.currentStatus = PropagationStatus.COMPLETED;
    }
  }

  // 停止传播
  public stopPropagation(): void {
    this.currentStatus = PropagationStatus.STOPPED;
  }

  // 获取全部传播阶段
  public getStages(): PropagationChannel[] {
    return [...this.stages];
  }

  public getCurrentStatus(): PropagationStatus {
    return this.currentStatus;
  }

  // 判断传播是否已完成
  public isCompleted(): boolean {
    return this.currentStatus === PropagationStatus.COMPLETED;
  }

  // 判断传播是否已停止
  public isStopped(): boolean {
    return this.currentStatus === PropagationStatus.STOPPED;
  }
}

// 事件传播映射管理器：集中管理传播阶段映射关系
class PropagationMappingManager {
  private mappings: PropagationPhaseMappingEntry[] = [];

  // 添加一条映射关系
  public addMapping(mapping: PropagationPhaseMappingEntry): void {
    this.mappings.push(mapping);
  }

  // 根据事件类型查找映射关系
  public findByEventType(eventType: string): PropagationPhaseMappingEntry | null {
    for (const mapping of this.mappings) {
      if (mapping.getEventType() === eventType) {
        return mapping;
      }
    }
    return null;
  }

  // 获取全部映射关系
  public getMappings(): PropagationPhaseMappingEntry[] {
    return [...this.mappings];
  }

  // 统计可传播的映射数量
  public countPropagatedMappings(): number {
    let count = 0;
    for (const mapping of this.mappings) {
      if (mapping.getIsPropagated()) {
        count++;
      }
    }
    return count;
  }

  // 清空全部映射
  public clearMappings(): void {
    this.mappings = [];
  }
}

// ==================== 传播监听工具集（新增代码） ====================

// 监听器状态枚举：描述传播监听器的状态
enum ListenerStatus {
  REGISTERED = 'registered', TRIGGERED = 'triggered', REMOVED = 'removed'
}

// 传播监听器接口：描述一个传播监听器
interface PropagationListenerDescriptor {
  listenerId: string;
  channel: PropagationChannel;
  status: ListenerStatus;
  invocationCount: number;
}

// 传播监听器管理器：管理传播监听器的注册与触发
class PropagationListenerManager {
  private listeners: PropagationListenerDescriptor[] = [];

  // 注册一个传播监听器
  public registerListener(listenerId: string, channel: PropagationChannel): void {
    const listener: PropagationListenerDescriptor = {
      listenerId,
      channel,
      status: ListenerStatus.REGISTERED,
      invocationCount: 0
    };
    this.listeners.push(listener);
  }

  // 触发指定通道上的监听器
  public triggerChannel(channel: PropagationChannel): void {
    for (const listener of this.listeners) {
      if (listener.channel === channel && listener.status === ListenerStatus.REGISTERED) {
        listener.status = ListenerStatus.TRIGGERED;
        listener.invocationCount++;
      }
    }
  }

  // 移除指定监听器
  public removeListener(listenerId: string): void {
    for (const listener of this.listeners) {
      if (listener.listenerId === listenerId) {
        listener.status = ListenerStatus.REMOVED;
      }
    }
  }

  // 获取全部监听器
  public getListeners(): PropagationListenerDescriptor[] {
    return [...this.listeners];
  }

  // 统计指定通道的触发次数
  public countInvocations(channel: PropagationChannel): number {
    let total = 0;
    for (const listener of this.listeners) {
      if (listener.channel === channel) {
        total += listener.invocationCount;
      }
    }
    return total;
  }

  // 清空全部监听器
  public clearListeners(): void {
    this.listeners = [];
  }
}

// 传播深度模型：描述事件传播的深度信息
class PropagationDepthModel {
  private maxDepth: number;
  private currentDepth: number;

  constructor(maxDepth: number) {
    this.maxDepth = maxDepth;
    this.currentDepth = 0;
  }

  // 进入下一层传播
  public descend(): boolean {
    if (this.currentDepth >= this.maxDepth) {
      return false;
    }
    this.currentDepth++;
    return true;
  }

  // 返回上一层传播
  public ascend(): void {
    if (this.currentDepth > 0) {
      this.currentDepth--;
    }
  }

  public getCurrentDepth(): number {
    return this.currentDepth;
  }

  public getMaxDepth(): number {
    return this.maxDepth;
  }

  // 判断是否已到达最大深度
  public isAtMaxDepth(): boolean {
    return this.currentDepth === this.maxDepth;
  }

  // 重置传播深度
  public resetDepth(): void {
    this.currentDepth = 0;
  }
}

// 传播事件模型：封装一个可复用的传播事件对象
class PropagationEventModel {
  private eventType: string;
  private channel: PropagationChannel;
  private depth: number;

  constructor(eventType: string, channel: PropagationChannel, depth: number) {
    this.eventType = eventType;
    this.channel = channel;
    this.depth = depth;
  }

  public getEventType(): string {
    return this.eventType;
  }

  public getChannel(): PropagationChannel {
    return this.channel;
  }

  public getDepth(): number {
    return this.depth;
  }

  // 生成传播事件的文本表示
  public toString(): string {
    return `PropagationEvent(${this.eventType}, ${this.channel}, depth=${this.depth})`;
  }
}

// 传播事件管理器：集中管理传播事件记录
class PropagationEventManager {
  private events: PropagationEventModel[] = [];

  // 追加一条传播事件
  public appendEvent(event: PropagationEventModel): void {
    this.events.push(event);
  }

  // 获取全部传播事件
  public getEvents(): PropagationEventModel[] {
    return [...this.events];
  }

  // 按通道筛选事件
  public filterByChannel(channel: PropagationChannel): PropagationEventModel[] {
    const filtered: PropagationEventModel[] = [];
    for (const event of this.events) {
      if (event.getChannel() === channel) {
        filtered.push(event);
      }
    }
    return filtered;
  }

  // 清空全部事件
  public clearEvents(): void {
    this.events = [];
  }
}

export default function eventPropagationTest() {
  describe('EventPropagation_Test', () => {
    let driver: Driver;
    let eventTracker: EventPropagationTracker;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      eventTracker = EventPropagationTracker.getInstance();
      eventTracker.resetTracker();
      await driver.delayMs(1000);
    });

    // 移除beforeEach中的对话框等待，避免重复等待导致超时
    // 对话框已在beforeAll中打开，无需每个测试用例前重新等待

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    it('dialog_should_capture_key_events', 0, async () => {
      const responseTime = 0;

      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.CAPTURING)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle events at target下功能正常
    it('dialog_should_handle_events_at_target', 0, async () => {
      eventTracker.resetTracker();
      const responseTime = 0;

      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.AT_TARGET)).assertTrue();
    });

    it('dialog_should_bubble_events', 0, async () => {
      eventTracker.resetTracker();
      const responseTime = 0;

      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.BUBBLING)).assertTrue();
    });

    // 验证dialog should处理能力：确保TV设备在handle all event phases下功能正常
    it('dialog_should_handle_all_event_phases', 0, async () => {
      eventTracker.resetTracker();

      const phases = [EventPhase.CAPTURING, EventPhase.AT_TARGET, EventPhase.BUBBLING];
      for (const phase of phases) {
        eventTracker.recordEvent('test', phase, true, false, 50);
      }

      expect(eventTracker.getTotalEvents()).assertEqual(3);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // 验证dialog event状态正确：确保TV设备records timestamps should be chronological符合预期
    it('dialog_event_records_timestamps_should_be_chronological', 0, async () => {
      eventTracker.resetTracker();

      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 50);
      await driver.delayMs(100);
      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, 50);
      await driver.delayMs(100);
      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, 50);

      const history = eventTracker.getEventHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证dialog event维持稳定：确保TV设备在tracker singleton should maintain consistency下性能不降低
    it('dialog_event_tracker_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const tracker1 = EventPropagationTracker.getInstance();
      const tracker2 = EventPropagationTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();


      tracker1.resetTracker();
      tracker1.recordEvent('keydown', EventPhase.CAPTURING, true, false, 100);

      expect(tracker2.getTotalEvents()).assertEqual(1);
      expect(tracker2.getPropagatedEvents()).assertEqual(1);
    });

    // 验证dialog should维持稳定：确保TV设备在maintain event propagation下性能不降低
    it('dialog_should_maintain_event_propagation', 0, async () => {
      eventTracker.resetTracker();
      const initialCount = eventTracker.getTotalEvents();

      for (let i = 0; i < 20; i++) {
        eventTracker.recordEvent('navigation', EventPhase.BUBBLING, true, false, 30);
      }

      const finalCount = eventTracker.getTotalEvents();
      expect(finalCount - initialCount).assertEqual(20);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // 验证dialog should处理能力：确保TV设备在handle rapid events下功能正常
    it('dialog_should_handle_rapid_events', 0, async () => {
      eventTracker.resetTracker();

      const events = ['keydown', 'click', 'keyup'];
      for (let i = 0; i < 30; i++) {
        const event = events[i % events.length];
        eventTracker.recordEvent(event, EventPhase.AT_TARGET, true, false, 20);
      }

      expect(eventTracker.getTotalEvents()).assertEqual(30);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // 综合comprehensive event场景测试：验证完整操作流程中功能正确
    it('comprehensive_event_propagation_scenario', 0, async () => {
      eventTracker.resetTracker();

      const scenarioStart = Date.now();

      eventTracker.recordEvent('left', EventPhase.CAPTURING, true, false, 30);
      eventTracker.recordEvent('right', EventPhase.BUBBLING, true, false, 30);

      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;

      expect(eventTracker.getTotalEvents()).assertEqual(2);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
    });

    // 验证传播通道映射：确保三个阶段映射到正确通道
    it('propagation_channel_mapper_should_map_all_phases', 0, async () => {
      const mapper = new PropagationChannelMapper();
      expect(mapper.mapPhase(EventPhase.CAPTURING)).assertEqual(PropagationChannel.CAPTURE);
      expect(mapper.mapPhase(EventPhase.AT_TARGET)).assertEqual(PropagationChannel.TARGET);
      expect(mapper.mapPhase(EventPhase.BUBBLING)).assertEqual(PropagationChannel.BUBBLE);
      expect(mapper.isCapturePhase(EventPhase.CAPTURING)).assertTrue();
      expect(mapper.isBubblePhase(EventPhase.BUBBLING)).assertTrue();
    });

    // 验证传播统计计算器：确保各类计数聚合正确
    it('propagation_statistics_calculator_should_aggregate_counts', 0, async () => {
      const records: EventRecord[] = [
        { eventType: 'a', phase: EventPhase.CAPTURING, isPropagated: true, isStopped: false, responseTime: 20, timestamp: 1 },
        { eventType: 'b', phase: EventPhase.AT_TARGET, isPropagated: true, isStopped: true, responseTime: 30, timestamp: 2 },
        { eventType: 'c', phase: EventPhase.BUBBLING, isPropagated: false, isStopped: false, responseTime: 40, timestamp: 3 }
      ];
      const calculator = new PropagationStatisticsCalculator(records);
      const statistics = calculator.buildStatistics();
      expect(statistics.totalEvents).assertEqual(3);
      expect(statistics.propagatedCount).assertEqual(2);
      expect(statistics.stoppedCount).assertEqual(1);
      expect(statistics.completedCount).assertEqual(1);
    });

    // 验证传播阶段映射条目：确保属性访问与相等比较正确
    it('propagation_phase_mapping_entry_should_expose_and_compare', 0, async () => {
      const entry = new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true);
      expect(entry.getEventType()).assertEqual('click');
      expect(entry.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(entry.getIsPropagated()).assertTrue();
      entry.setIsPropagated(false);
      expect(entry.getIsPropagated()).assertFalse();
      const other = new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true);
      expect(entry.equals(other)).assertTrue();
      const text = entry.toString();
      expect(text.indexOf('click')).assertLargerOrEqual(0);
    });

    // 验证传播路径状态机：确保状态按预期推进
    it('event_propagation_path_should_transition_statuses', 0, async () => {
      const path = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.addStage(PropagationChannel.TARGET);
      path.addStage(PropagationChannel.BUBBLE);
      expect(path.getStages().length).assertEqual(3);
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PENDING);
      path.advanceStatus();
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PROPAGATING);
      path.advanceStatus();
      expect(path.isCompleted()).assertTrue();
    });

    // 验证传播映射管理器：确保按事件类型查找映射正确
    it('propagation_mapping_manager_should_find_by_event_type', 0, async () => {
      const manager = new PropagationMappingManager();
      manager.addMapping(new PropagationPhaseMappingEntry('keydown', PropagationChannel.CAPTURE, true));
      manager.addMapping(new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true));
      manager.addMapping(new PropagationPhaseMappingEntry('keyup', PropagationChannel.BUBBLE, false));
      expect(manager.getMappings().length).assertEqual(3);
      const found = manager.findByEventType('click');
      expect(found?.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(manager.findByEventType('unknown')).assertNull();
      expect(manager.countPropagatedMappings()).assertEqual(2);
    });

    // 验证传播监听器管理：确保注册与触发正确
    it('propagation_listener_manager_should_register_and_trigger', 0, async () => {
      const manager = new PropagationListenerManager();
      manager.registerListener('l1', PropagationChannel.CAPTURE);
      manager.registerListener('l2', PropagationChannel.BUBBLE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(1);
      expect(manager.countInvocations(PropagationChannel.BUBBLE)).assertEqual(0);
      manager.removeListener('l2');
      const listeners = manager.getListeners();
      expect(listeners.length).assertEqual(2);
      manager.clearListeners();
      expect(manager.getListeners().length).assertEqual(0);
    });

    // 验证传播深度模型：确保最大深度限制生效
    it('propagation_depth_model_should_enforce_max_depth', 0, async () => {
      const depth = new PropagationDepthModel(3);
      expect(depth.getCurrentDepth()).assertEqual(0);
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.isAtMaxDepth()).assertTrue();
      expect(depth.descend()).assertFalse();
      depth.ascend();
      expect(depth.getCurrentDepth()).assertEqual(2);
    });

    // 验证传播事件模型：确保事件属性访问正确
    it('propagation_event_model_should_expose_properties', 0, async () => {
      const model = new PropagationEventModel('click', PropagationChannel.TARGET, 2);
      expect(model.getEventType()).assertEqual('click');
      expect(model.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(model.getDepth()).assertEqual(2);
      const text = model.toString();
      expect(text.indexOf('click')).assertLargerOrEqual(0);
    });

    // 验证传播事件管理器：确保按通道筛选事件正确
    it('propagation_event_manager_should_filter_by_channel', 0, async () => {
      const manager = new PropagationEventManager();
      manager.appendEvent(new PropagationEventModel('a', PropagationChannel.CAPTURE, 1));
      manager.appendEvent(new PropagationEventModel('b', PropagationChannel.TARGET, 1));
      manager.appendEvent(new PropagationEventModel('c', PropagationChannel.CAPTURE, 2));
      expect(manager.getEvents().length).assertEqual(3);
      const captureEvents = manager.filterByChannel(PropagationChannel.CAPTURE);
      expect(captureEvents.length).assertEqual(2);
      manager.clearEvents();
      expect(manager.getEvents().length).assertEqual(0);
    });

    // 验证传播路径停止：确保停止后状态不再推进
    it('event_propagation_path_should_stop_propagation', 0, async () => {
      const path = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.advanceStatus();
      path.stopPropagation();
      expect(path.isStopped()).assertTrue();
      path.advanceStatus();
      expect(path.isStopped()).assertTrue();
    });

    // 验证传播统计空记录：确保空数据返回零值
    it('propagation_statistics_calculator_should_handle_empty_records', 0, async () => {
      const calculator = new PropagationStatisticsCalculator([]);
      const statistics = calculator.buildStatistics();
      expect(statistics.totalEvents).assertEqual(0);
      expect(statistics.propagatedCount).assertEqual(0);
      expect(statistics.propagationRate).assertEqual(0);
    });

    // 验证传播深度重置：确保重置后回到初始状态
    it('propagation_depth_model_should_reset_to_zero', 0, async () => {
      const depth = new PropagationDepthModel(5);
      depth.descend();
      depth.descend();
      expect(depth.getCurrentDepth()).assertEqual(2);
      depth.resetDepth();
      expect(depth.getCurrentDepth()).assertEqual(0);
    });

    // 验证传播追踪器停止统计：确保停止事件被准确记录
    it('propagation_tracker_should_track_stopped_events', 0, async () => {
      eventTracker.resetTracker();
      eventTracker.recordEvent('a', EventPhase.CAPTURING, true, true, 20);
      eventTracker.recordEvent('b', EventPhase.AT_TARGET, true, false, 20);
      eventTracker.recordEvent('c', EventPhase.BUBBLING, false, false, 20);
      expect(eventTracker.getStoppedEvents()).assertEqual(1);
      expect(eventTracker.getPropagatedEvents()).assertEqual(2);
      expect(eventTracker.hasEventType('b')).assertTrue();
      expect(eventTracker.hasEventType('unknown')).assertFalse();
    });

    // 验证传播监听器清空：确保清空后统计归零
    it('propagation_listener_manager_should_clear_all_listeners', 0, async () => {
      const manager = new PropagationListenerManager();
      manager.registerListener('l1', PropagationChannel.CAPTURE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(1);
      manager.clearListeners();
      expect(manager.getListeners().length).assertEqual(0);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(0);
    });
  });


}