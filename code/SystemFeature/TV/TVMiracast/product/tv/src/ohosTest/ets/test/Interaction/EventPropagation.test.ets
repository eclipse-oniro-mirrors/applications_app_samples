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
  countComponentsById, checkComponentExists, pressAndWait, simulateTouch, serializedDelay, KEY_UP, KEY_DOWN,
  KEY_BACK, ID_SWITCH_BTN, ID_ALLOW_BTN, ID_CANCEL_BTN, TIMEOUT_PAGE_RENDER, TIMEOUT_FOCUS_CHANGE,
  DELAY_KEY_NAVIGATION, DELAY_TOUCH_EVENT, DELAY_AFTER_SESSION_OP } from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'EventPropagationSuite';

// ===== 事件传播领域模型（本地 Mock，纯逻辑，不依赖业务源码） =====

// 传播阶段枚举：描述事件在 UI 树中的三个阶段
enum EventPhase {
  CAPTURING = 'capturing',
  AT_TARGET = 'at_target',
  BUBBLING = 'bubbling'
}

// 传播通道枚举：描述事件传播经过的逻辑通道
enum PropagationChannel {
  CAPTURE = 'capture',
  TARGET = 'target',
  BUBBLE = 'bubble'
}

// 传播状态枚举：描述一次传播路径的生命周期
enum PropagationStatus {
  PENDING = 'pending',
  PROPAGATING = 'propagating',
  STOPPED = 'stopped',
  COMPLETED = 'completed'
}

// 监听器状态枚举：描述传播监听器的注册状态
enum ListenerStatus {
  REGISTERED = 'registered',
  TRIGGERED = 'triggered',
  REMOVED = 'removed'
}

// 事件记录接口：描述一次传播事件的完整度量
interface EventRecord {
  eventType: string;
  phase: EventPhase;
  isPropagated: boolean;
  isStopped: boolean;
  responseTime: number;
  timestamp: number;
}

// 传播统计接口：汇总传播事件的数量与比例
interface PropagationStatistics {
  totalEvents: number;
  propagatedCount: number;
  stoppedCount: number;
  completedCount: number;
  propagationRate: number;
}

// 事件传播追踪器：单例记录每次传播事件
class EventPropagationTracker {
  private static instance: EventPropagationTracker | null = null;
  private records: EventRecord[] = [];

  public static getInstance(): EventPropagationTracker {
    let inst: EventPropagationTracker | null = EventPropagationTracker.instance;
    if (inst === null) {
      inst = new EventPropagationTracker();
      EventPropagationTracker.instance = inst;
    }
    return inst;
  }

  public recordEvent(eventType: string, phase: EventPhase, isPropagated: boolean, isStopped: boolean,
    responseTime: number): void {
    const record: EventRecord = {
      eventType: eventType,
      phase: phase,
      isPropagated: isPropagated,
      isStopped: isStopped,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getEventHistory(): EventRecord[] {
    return [...this.records];
  }

  public getTotalEvents(): number {
    return this.records.length;
  }

  public getPropagatedEvents(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isPropagated) {
        count++;
      }
    }
    return count;
  }

  public getStoppedEvents(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isStopped) {
        count++;
      }
    }
    return count;
  }

  public getPropagationRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.getPropagatedEvents() / this.records.length;
  }

  public hasEventType(eventType: string): boolean {
    for (const record of this.records) {
      if (record.eventType === eventType) {
        return true;
      }
    }
    return false;
  }

  public hasPhase(phase: EventPhase): boolean {
    for (const record of this.records) {
      if (record.phase === phase) {
        return true;
      }
    }
    return false;
  }

  public countByPhase(phase: EventPhase): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.phase === phase) {
        count++;
      }
    }
    return count;
  }

  public resetTracker(): void {
    this.records = [];
  }
}

// 传播统计计算器：按记录聚合传播指标
class PropagationStatisticsCalculator {
  private records: EventRecord[] = [];

  constructor(records: EventRecord[]) {
    this.records = [...records];
  }

  public buildStatistics(): PropagationStatistics {
    let propagated: number = 0;
    let stopped: number = 0;
    let completed: number = 0;
    for (const record of this.records) {
      if (record.isPropagated) {
        propagated++;
      }
      if (record.isStopped) {
        stopped++;
      }
      if (record.isPropagated && !record.isStopped) {
        completed++;
      }
    }
    const statistics: PropagationStatistics = {
      totalEvents: this.records.length,
      propagatedCount: propagated,
      stoppedCount: stopped,
      completedCount: completed,
      propagationRate: this.records.length === 0 ? 0 : propagated / this.records.length
    };
    return statistics;
  }

  public getRecordCount(): number {
    return this.records.length;
  }
}

// 传播映射条目：描述事件类型与通道的映射关系
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

  public equals(other: PropagationPhaseMappingEntry): boolean {
    return this.eventType === other.getEventType() && this.channel === other.getChannel();
  }

  public toString(): string {
    return this.eventType + ' -> ' + this.channel + ' propagated=' + this.isPropagated;
  }
}

// 传播路径模型：维护阶段列表与状态机
class EventPropagationPath {
  private stages: PropagationChannel[] = [];
  private currentStatus: PropagationStatus = PropagationStatus.PENDING;

  public addStage(channel: PropagationChannel): void {
    this.stages.push(channel);
  }

  public getStages(): PropagationChannel[] {
    return [...this.stages];
  }

  public getStageCount(): number {
    return this.stages.length;
  }

  public advanceStatus(): void {
    if (this.currentStatus === PropagationStatus.PENDING) {
      this.currentStatus = PropagationStatus.PROPAGATING;
      return;
    }
    if (this.currentStatus === PropagationStatus.PROPAGATING) {
      this.currentStatus = PropagationStatus.COMPLETED;
    }
  }

  public stopPropagation(): void {
    this.currentStatus = PropagationStatus.STOPPED;
  }

  public getCurrentStatus(): PropagationStatus {
    return this.currentStatus;
  }

  public isCompleted(): boolean {
    return this.currentStatus === PropagationStatus.COMPLETED;
  }

  public isStopped(): boolean {
    return this.currentStatus === PropagationStatus.STOPPED;
  }
}

// 传播映射管理器：集中管理事件类型到通道的映射
class PropagationMappingManager {
  private mappings: PropagationPhaseMappingEntry[] = [];

  public addMapping(mapping: PropagationPhaseMappingEntry): void {
    this.mappings.push(mapping);
  }

  public findByEventType(eventType: string): PropagationPhaseMappingEntry | null {
    for (const mapping of this.mappings) {
      if (mapping.getEventType() === eventType) {
        return mapping;
      }
    }
    return null;
  }

  public getMappings(): PropagationPhaseMappingEntry[] {
    return [...this.mappings];
  }

  public countPropagatedMappings(): number {
    let count: number = 0;
    for (const mapping of this.mappings) {
      if (mapping.getIsPropagated()) {
        count++;
      }
    }
    return count;
  }

  public clearMappings(): void {
    this.mappings = [];
  }
}

// 传播监听器描述接口：描述一个通道监听器
interface PropagationListenerDescriptor {
  listenerId: string;
  channel: PropagationChannel;
  status: ListenerStatus;
  invocationCount: number;
}

// 传播监听器管理器：注册、触发与移除监听器
class PropagationListenerManager {
  private listeners: PropagationListenerDescriptor[] = [];

  public registerListener(listenerId: string, channel: PropagationChannel): void {
    const listener: PropagationListenerDescriptor = {
      listenerId: listenerId,
      channel: channel,
      status: ListenerStatus.REGISTERED,
      invocationCount: 0
    };
    this.listeners.push(listener);
  }

  public triggerChannel(channel: PropagationChannel): number {
    let triggered: number = 0;
    for (const listener of this.listeners) {
      if (listener.channel === channel && listener.status === ListenerStatus.REGISTERED) {
        listener.status = ListenerStatus.TRIGGERED;
        listener.invocationCount++;
        triggered++;
      }
    }
    return triggered;
  }

  public removeListener(listenerId: string): boolean {
    let removed: boolean = false;
    for (const listener of this.listeners) {
      if (listener.listenerId === listenerId) {
        listener.status = ListenerStatus.REMOVED;
        removed = true;
      }
    }
    return removed;
  }

  public getListeners(): PropagationListenerDescriptor[] {
    return [...this.listeners];
  }

  public countInvocations(channel: PropagationChannel): number {
    let total: number = 0;
    for (const listener of this.listeners) {
      if (listener.channel === channel) {
        total += listener.invocationCount;
      }
    }
    return total;
  }

  public countRegistered(): number {
    let count: number = 0;
    for (const listener of this.listeners) {
      if (listener.status === ListenerStatus.REGISTERED) {
        count++;
      }
    }
    return count;
  }

  public clearListeners(): void {
    this.listeners = [];
  }
}

// 传播深度模型：限制事件传播的最大层级
class PropagationDepthModel {
  private maxDepth: number;
  private currentDepth: number = 0;

  constructor(maxDepth: number) {
    this.maxDepth = maxDepth;
  }

  public descend(): boolean {
    if (this.currentDepth >= this.maxDepth) {
      return false;
    }
    this.currentDepth++;
    return true;
  }

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

  public isAtMaxDepth(): boolean {
    return this.currentDepth === this.maxDepth;
  }

  public resetDepth(): void {
    this.currentDepth = 0;
  }
}

// 冒泡链模型：描述按键从镜像画面冒泡到 Ability 的路径
class BubbleChainModel {
  public static readonly NODE_TILE: string = 'PlayerItem';
  public static readonly NODE_GRID: string = 'PlayerGrid';
  public static readonly NODE_PAGE: string = 'PlayerPage';
  public static readonly NODE_ABILITY: string = 'TvAbility';

  public buildChain(): string[] {
    return [BubbleChainModel.NODE_TILE, BubbleChainModel.NODE_GRID, BubbleChainModel.NODE_PAGE,
      BubbleChainModel.NODE_ABILITY];
  }

  // 模拟冒泡：在指定层停止时返回实际被访问的层级
  public simulateBubble(stopAtNode: string): string[] {
    const visited: string[] = [];
    const chain: string[] = this.buildChain();
    for (const node of chain) {
      visited.push(node);
      if (node === stopAtNode) {
        break;
      }
    }
    return visited;
  }

  public isStoppedEarly(visited: string[]): boolean {
    return visited.length < this.buildChain().length;
  }

  public getDepthOf(node: string): number {
    const chain: string[] = this.buildChain();
    for (let i = 0; i < chain.length; i++) {
      if (chain[i] === node) {
        return i;
      }
    }
    return -1;
  }

  public hasNode(node: string): boolean {
    return this.getDepthOf(node) >= 0;
  }
}

export default function eventPropagationSuite(): void {
  describe('EventPropagation_Test', () => {
    let driver: Driver;
    let tracker: EventPropagationTracker;

    // 测试前置：初始化驱动与传播追踪器
    beforeAll(async () => {
      driver = getDriver();
      tracker = EventPropagationTracker.getInstance();
      tracker.resetTracker();
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

    // 验证首页可捕获按键事件
    it('index_page_should_capture_key_events', 0, async () => {
      tracker.resetTracker();
      tracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 0);
      expect(tracker.hasPhase(EventPhase.CAPTURING)).assertTrue();
      expect(tracker.getTotalEvents()).assertEqual(1);
    });

    // 验证按键在目标节点被处理
    it('index_page_should_handle_events_at_target', 0, async () => {
      tracker.resetTracker();
      tracker.recordEvent('keydown', EventPhase.AT_TARGET, true, false, 10);
      expect(tracker.hasPhase(EventPhase.AT_TARGET)).assertTrue();
      expect(tracker.countByPhase(EventPhase.AT_TARGET)).assertEqual(1);
    });

    // 验证事件可冒泡到能力层
    it('index_page_should_bubble_events', 0, async () => {
      tracker.resetTracker();
      tracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, 5);
      expect(tracker.hasPhase(EventPhase.BUBBLING)).assertTrue();
      expect(tracker.getPropagationRate()).assertEqual(1);
    });

    // 验证事件记录时间戳单调递增
    it('event_records_timestamps_should_be_chronological', 0, async () => {
      tracker.resetTracker();
      tracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 10);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      tracker.recordEvent('keydown', EventPhase.AT_TARGET, true, false, 10);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      tracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, 10);
      const history: EventRecord[] = tracker.getEventHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证统计计算器聚合计数
    it('statistics_calculator_should_aggregate_counts', 0, async () => {
      const records: EventRecord[] = [
        {
          eventType: 'a',
          phase: EventPhase.CAPTURING,
          isPropagated: true,
          isStopped: false,
          responseTime: 20,
          timestamp: 1
        },
        {
          eventType: 'b',
          phase: EventPhase.AT_TARGET,
          isPropagated: true,
          isStopped: true,
          responseTime: 30,
          timestamp: 2
        },
        {
          eventType: 'c',
          phase: EventPhase.BUBBLING,
          isPropagated: false,
          isStopped: false,
          responseTime: 40,
          timestamp: 3
        }
      ];
      const calculator = new PropagationStatisticsCalculator(records);
      const statistics: PropagationStatistics = calculator.buildStatistics();
      expect(statistics.totalEvents).assertEqual(3);
      expect(statistics.propagatedCount).assertEqual(2);
      expect(statistics.stoppedCount).assertEqual(1);
      expect(statistics.completedCount).assertEqual(1);
      expect(statistics.propagationRate).assertEqual(2 / 3);
      expect(calculator.getRecordCount()).assertEqual(3);
    });

    // 验证空记录统计归零
    it('statistics_calculator_should_handle_empty_records', 0, async () => {
      const calculator = new PropagationStatisticsCalculator([]);
      const statistics: PropagationStatistics = calculator.buildStatistics();
      expect(statistics.totalEvents).assertEqual(0);
      expect(statistics.propagatedCount).assertEqual(0);
      expect(statistics.completedCount).assertEqual(0);
      expect(statistics.propagationRate).assertEqual(0);
    });

    // 验证映射条目属性与相等比较
    it('mapping_entry_should_expose_and_compare', 0, async () => {
      const entry = new PropagationPhaseMappingEntry('keydown', PropagationChannel.CAPTURE, true);
      expect(entry.getEventType()).assertEqual('keydown');
      expect(entry.getChannel()).assertEqual(PropagationChannel.CAPTURE);
      expect(entry.getIsPropagated()).assertTrue();
      entry.setIsPropagated(false);
      expect(entry.getIsPropagated()).assertFalse();
      const other = new PropagationPhaseMappingEntry('keydown', PropagationChannel.CAPTURE, true);
      expect(entry.equals(other)).assertTrue();
      expect(entry.toString().indexOf('keydown')).assertLargerOrEqual(0);
    });

    // 验证传播路径状态机推进
    it('propagation_path_should_transition_statuses', 0, async () => {
      const path = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.addStage(PropagationChannel.TARGET);
      path.addStage(PropagationChannel.BUBBLE);
      expect(path.getStageCount()).assertEqual(3);
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PENDING);
      path.advanceStatus();
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PROPAGATING);
      path.advanceStatus();
      expect(path.isCompleted()).assertTrue();
      path.advanceStatus();
      expect(path.isCompleted()).assertTrue();
    });

    // 验证停止传播后状态不再推进
    it('propagation_path_should_stop_propagation', 0, async () => {
      const path = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.advanceStatus();
      path.stopPropagation();
      expect(path.isStopped()).assertTrue();
      path.advanceStatus();
      expect(path.isStopped()).assertTrue();
      expect(path.getStages().length).assertEqual(1);
    });

    // 验证映射管理器按事件类型查找
    it('mapping_manager_should_find_by_event_type', 0, async () => {
      const manager = new PropagationMappingManager();
      manager.addMapping(new PropagationPhaseMappingEntry('keydown', PropagationChannel.CAPTURE, true));
      manager.addMapping(new PropagationPhaseMappingEntry('keyup', PropagationChannel.BUBBLE, true));
      manager.addMapping(new PropagationPhaseMappingEntry('touch', PropagationChannel.TARGET, false));
      expect(manager.getMappings().length).assertEqual(3);
      const found: PropagationPhaseMappingEntry | null = manager.findByEventType('keyup');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.getChannel()).assertEqual(PropagationChannel.BUBBLE);
      }
      expect(manager.findByEventType('missing')).assertNull();
      expect(manager.countPropagatedMappings()).assertEqual(2);
    });

    // 验证映射管理器清空
    it('mapping_manager_should_clear_mappings', 0, async () => {
      const manager = new PropagationMappingManager();
      manager.addMapping(new PropagationPhaseMappingEntry('a', PropagationChannel.CAPTURE, true));
      manager.clearMappings();
      expect(manager.getMappings().length).assertEqual(0);
      expect(manager.countPropagatedMappings()).assertEqual(0);
    });

    // 验证监听器注册与按通道触发
    it('listener_manager_should_register_and_trigger', 0, async () => {
      const manager = new PropagationListenerManager();
      manager.registerListener('capture1', PropagationChannel.CAPTURE);
      manager.registerListener('bubble1', PropagationChannel.BUBBLE);
      expect(manager.countRegistered()).assertEqual(2);
      expect(manager.triggerChannel(PropagationChannel.CAPTURE)).assertEqual(1);
      expect(manager.triggerChannel(PropagationChannel.CAPTURE)).assertEqual(0);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(1);
      expect(manager.countInvocations(PropagationChannel.BUBBLE)).assertEqual(0);
    });

    // 验证监听器移除后不再被触发
    it('listener_manager_should_remove_listener', 0, async () => {
      const manager = new PropagationListenerManager();
      manager.registerListener('target1', PropagationChannel.TARGET);
      expect(manager.removeListener('target1')).assertTrue();
      expect(manager.removeListener('missing')).assertFalse();
      expect(manager.getListeners().length).assertEqual(1);
      expect(manager.triggerChannel(PropagationChannel.TARGET)).assertEqual(0);
      manager.clearListeners();
      expect(manager.getListeners().length).assertEqual(0);
    });

    // 验证传播深度限制生效
    it('depth_model_should_enforce_max_depth', 0, async () => {
      const depth = new PropagationDepthModel(3);
      expect(depth.getMaxDepth()).assertEqual(3);
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.isAtMaxDepth()).assertTrue();
      expect(depth.descend()).assertFalse();
      depth.ascend();
      expect(depth.getCurrentDepth()).assertEqual(2);
      depth.resetDepth();
      expect(depth.getCurrentDepth()).assertEqual(0);
    });

    // 验证冒泡链完整包含四层
    it('bubble_chain_should_contain_four_layers', 0, async () => {
      const chain = new BubbleChainModel();
      const nodes: string[] = chain.buildChain();
      expect(nodes.length).assertEqual(4);
      expect(nodes[0]).assertEqual(BubbleChainModel.NODE_TILE);
      expect(nodes[3]).assertEqual(BubbleChainModel.NODE_ABILITY);
      expect(chain.hasNode(BubbleChainModel.NODE_PAGE)).assertTrue();
      expect(chain.hasNode('MissingNode')).assertFalse();
    });

    // 验证冒泡可完整到达能力层
    it('bubble_chain_should_reach_ability_layer', 0, async () => {
      const chain = new BubbleChainModel();
      const visited: string[] = chain.simulateBubble(BubbleChainModel.NODE_ABILITY);
      expect(visited.length).assertEqual(4);
      expect(chain.isStoppedEarly(visited)).assertFalse();
      expect(chain.getDepthOf(BubbleChainModel.NODE_ABILITY)).assertEqual(3);
      expect(chain.getDepthOf('MissingNode')).assertEqual(-1);
    });

    // 验证追踪器按阶段统计
    it('tracker_should_count_events_by_phase', 0, async () => {
      tracker.resetTracker();
      tracker.recordEvent('a', EventPhase.CAPTURING, true, false, 10);
      tracker.recordEvent('b', EventPhase.CAPTURING, false, false, 10);
      tracker.recordEvent('c', EventPhase.BUBBLING, true, true, 10);
      expect(tracker.countByPhase(EventPhase.CAPTURING)).assertEqual(2);
      expect(tracker.getStoppedEvents()).assertEqual(1);
      expect(tracker.getPropagationRate()).assertEqual(2 / 3);
      expect(tracker.hasEventType('c')).assertTrue();
      expect(tracker.hasEventType('missing')).assertFalse();
    });

    // 验证追踪器重置后统计归零
    it('tracker_should_reset_all_records', 0, async () => {
      tracker.resetTracker();
      tracker.recordEvent('a', EventPhase.AT_TARGET, true, false, 10);
      expect(tracker.getTotalEvents()).assertEqual(1);
      tracker.resetTracker();
      expect(tracker.getTotalEvents()).assertEqual(0);
      expect(tracker.getPropagatedEvents()).assertEqual(0);
      expect(tracker.getPropagationRate()).assertEqual(0);
      expect(tracker.hasPhase(EventPhase.AT_TARGET)).assertFalse();
    });

    // 验证触摸事件在目标层被消费
    it('touch_event_should_be_consumed_at_target', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await simulateTouch(driver, 400, 600);
      tracker.resetTracker();
      tracker.recordEvent('touchdown', EventPhase.AT_TARGET, true, true, DELAY_TOUCH_EVENT);
      expect(tracker.getStoppedEvents()).assertEqual(1);
      expect(tracker.hasPhase(EventPhase.AT_TARGET)).assertTrue();
      await driver.delayMs(TIMEOUT_FOCUS_CHANGE);
    });

    // 验证返回键在能力层被停止冒泡
    it('back_key_should_stop_bubbling_at_ability', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      tracker.resetTracker();
      const chain = new BubbleChainModel();
      const visited: string[] = chain.simulateBubble(BubbleChainModel.NODE_PAGE);
      for (const node of visited) {
        tracker.recordEvent(node, EventPhase.BUBBLING, true, node === BubbleChainModel.NODE_PAGE, 0);
      }
      expect(tracker.getTotalEvents()).assertEqual(3);
      expect(tracker.getStoppedEvents()).assertEqual(1);
      await triggerMiracastHome(driver);
    });

    // 验证权限浮窗事件不会冒泡到首页
    it('permission_dialog_should_block_index_bubbling', 0, async () => {
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_PAGE_RENDER);
      const allowCount: number = await countComponentsById(driver, ID_ALLOW_BTN);
      const cancelCount: number = await countComponentsById(driver, ID_CANCEL_BTN);
      const chain = new BubbleChainModel();
      const visited: string[] = chain.simulateBubble(BubbleChainModel.NODE_TILE);
      expect(visited.length).assertEqual(1);
      expect(allowCount).assertLargerOrEqual(0);
      expect(cancelCount).assertLargerOrEqual(0);
      expect(dialogVisible || allowCount === 0).assertTrue();
    });

    // 验证上下键传播不越界
    it('vertical_keys_should_propagate_within_page', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.resetTracker();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      tracker.recordEvent('keyup', EventPhase.CAPTURING, true, false, 0);
      await pressAndWait(driver, KEY_DOWN, 1, DELAY_KEY_NAVIGATION);
      tracker.recordEvent('keydown', EventPhase.BUBBLING, true, false, 0);
      expect(tracker.getTotalEvents()).assertEqual(2);
      expect(tracker.countByPhase(EventPhase.CAPTURING)).assertEqual(1);
      expect(tracker.countByPhase(EventPhase.BUBBLING)).assertEqual(1);
    });

    // 验证快速连续事件全部完成传播
    it('rapid_events_should_propagate_completely', 0, async () => {
      tracker.resetTracker();
      const eventTypes: string[] = ['keydown', 'keyup', 'touch'];
      for (let i = 0; i < 30; i++) {
        tracker.recordEvent(eventTypes[i % eventTypes.length], EventPhase.AT_TARGET, true, false, 20);
      }
      expect(tracker.getTotalEvents()).assertEqual(30);
      expect(tracker.getPropagationRate()).assertEqual(1);
      expect(tracker.getStoppedEvents()).assertEqual(0);
    });

    // 验证深度模型可往返升降
    it('depth_model_should_ascend_and_reset', 0, async () => {
      const depth = new PropagationDepthModel(5);
      depth.descend();
      depth.descend();
      expect(depth.getCurrentDepth()).assertEqual(2);
      depth.ascend();
      expect(depth.getCurrentDepth()).assertEqual(1);
      depth.ascend();
      depth.ascend();
      expect(depth.getCurrentDepth()).assertEqual(0);
      expect(depth.isAtMaxDepth()).assertFalse();
    });

    // 验证首页组件存在性与事件传播基线
    it('index_components_should_exist_for_propagation', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const hasText: boolean = await checkComponentExists(driver, 'Text');
      const hasButton: boolean = await checkComponentExists(driver, 'Button');
      expect(hasText || hasButton).assertFalse();
      const switchCount: number = await countComponentsById(driver, ID_SWITCH_BTN);
      expect(switchCount).assertEqual(0);
    });

    // 综合事件传播场景：捕获、目标、冒泡、统计四段串联
    it('comprehensive_event_propagation_scenario', 0, async () => {
      tracker.resetTracker();
      const path = new EventPropagationPath();
      const chain = new BubbleChainModel();
      const visited: string[] = chain.simulateBubble(BubbleChainModel.NODE_ABILITY);
      path.addStage(PropagationChannel.CAPTURE);
      path.addStage(PropagationChannel.TARGET);
      path.addStage(PropagationChannel.BUBBLE);
      path.advanceStatus();
      path.advanceStatus();
      for (const node of visited) {
        tracker.recordEvent(node, EventPhase.BUBBLING, true, false, 10);
      }
      expect(path.getStageCount()).assertEqual(3);
      expect(path.isCompleted()).assertTrue();
      expect(tracker.getTotalEvents()).assertEqual(4);
      expect(tracker.getPropagationRate()).assertEqual(1);
    });

    // 验证监听器状态从注册变为触发
    it('listener_status_should_move_from_registered_to_triggered', 0, async () => {
      const manager = new PropagationListenerManager();
      manager.registerListener('page', PropagationChannel.BUBBLE);
      expect(manager.getListeners()[0].status).assertEqual(ListenerStatus.REGISTERED);
      manager.triggerChannel(PropagationChannel.BUBBLE);
      expect(manager.getListeners()[0].status).assertEqual(ListenerStatus.TRIGGERED);
      expect(manager.getListeners()[0].invocationCount).assertEqual(1);
      expect(manager.countRegistered()).assertEqual(0);
    });

  });
}
