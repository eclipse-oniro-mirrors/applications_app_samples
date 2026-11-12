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
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  waitForServiceConnected,
  triggerMiracastHome,
  launchPlayerPage,
  SERVICE_ABILITY_NAME,
  TIMEOUT_SERVICE_CONNECT,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_SERVICE_RECONNECT,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ExtensionLifecycleSuite';

// ===== 领域模型（本地 Mock：ServiceExtTvAbility 生命周期与 globalThis.miracastImpl 绑定） =====

// 扩展生命周期状态枚举：描述服务扩展从创建到销毁的状态
enum ExtensionState {
  IDLE = 'idle',
  CREATED = 'created',
  CONNECTED = 'connected',
  REQUESTED = 'requested',
  DISCONNECTED = 'disconnected',
  DESTROYED = 'destroyed'
}

// 生命周期事件枚举：ServiceExtTvAbility 的回调事件
enum ExtensionEvent {
  ON_CREATE = 'onCreate',
  ON_CONNECT = 'onConnect',
  ON_REQUEST = 'onRequest',
  ON_DISCONNECT = 'onDisconnect',
  ON_DESTROY = 'onDestroy'
}

// 生命周期记录：保存事件、状态与时间戳
interface ExtensionRecord {
  event: ExtensionEvent;
  state: ExtensionState;
  timestamp: number;
}

// 连接请求：描述一次 onConnect 的调用方信息
interface ConnectRequest {
  connectionId: number;
  callingUid: number;
}

// 全局实现持有者：模拟 globalThis.miracastImpl 的绑定槽位
class GlobalImplHolder {
  private implName: string = '';
  private bindCount: number = 0;

  public bind(name: string): boolean {
    if (name.length === 0) {
      return false;
    }
    if (this.implName.length > 0) {
      return false;
    }
    this.implName = name;
    this.bindCount++;
    return true;
  }

  public getImpl(): string {
    return this.implName;
  }

  public isBound(): boolean {
    return this.implName.length > 0;
  }

  public getBindCount(): number {
    return this.bindCount;
  }

  public unbind(): boolean {
    if (this.implName.length === 0) {
      return false;
    }
    this.implName = '';
    return true;
  }

  public reset(): void {
    this.implName = '';
    this.bindCount = 0;
  }
}

// 扩展状态机：限定合法的回调顺序，重复或越界迁移应被拒绝
class ExtensionStateMachine {
  private state: ExtensionState = ExtensionState.IDLE;
  private history: ExtensionState[] = [];

  public getState(): ExtensionState {
    return this.state;
  }

  public canTransition(event: ExtensionEvent): boolean {
    if (event === ExtensionEvent.ON_CREATE) {
      return this.state === ExtensionState.IDLE;
    }
    if (event === ExtensionEvent.ON_CONNECT) {
      if (this.state === ExtensionState.CREATED || this.state === ExtensionState.DISCONNECTED) {
        return true;
      }
      return this.state === ExtensionState.CONNECTED;
    }
    if (event === ExtensionEvent.ON_REQUEST) {
      return this.state === ExtensionState.CONNECTED;
    }
    if (event === ExtensionEvent.ON_DISCONNECT) {
      return this.state === ExtensionState.CONNECTED || this.state === ExtensionState.REQUESTED;
    }
    return this.state !== ExtensionState.DESTROYED;
  }

  public apply(event: ExtensionEvent): boolean {
    if (!this.canTransition(event)) {
      return false;
    }
    if (event === ExtensionEvent.ON_CREATE) {
      this.state = ExtensionState.CREATED;
    } else if (event === ExtensionEvent.ON_CONNECT) {
      this.state = ExtensionState.CONNECTED;
    } else if (event === ExtensionEvent.ON_REQUEST) {
      this.state = ExtensionState.REQUESTED;
    } else if (event === ExtensionEvent.ON_DISCONNECT) {
      this.state = ExtensionState.DISCONNECTED;
    } else {
      this.state = ExtensionState.DESTROYED;
    }
    this.history.push(this.state);
    return true;
  }

  public getHistory(): ExtensionState[] {
    return [...this.history];
  }

  public getTransitionCount(): number {
    return this.history.length;
  }

  public reset(): void {
    this.state = ExtensionState.IDLE;
    this.history = [];
  }
}

// 请求分发器：解析 onRequest 的 action 并安排延迟启动
class RequestDispatcher {
  private pendingActions: string[] = [];
  private scheduledDelayMs: number = 0;
  private dispatchCount: number = 0;
  public static readonly START_ACTION: string = 'startMiracastService';
  public static readonly STOP_ACTION: string = 'stopMiracastService';

  public dispatch(action: string): boolean {
    if (action.length === 0) {
      return false;
    }
    this.dispatchCount++;
    if (action === RequestDispatcher.START_ACTION) {
      this.pendingActions.push(action);
      this.scheduledDelayMs = 8000;
      return true;
    }
    if (action === RequestDispatcher.STOP_ACTION) {
      this.pendingActions = [];
      this.scheduledDelayMs = 0;
      return true;
    }
    return false;
  }

  public getPendingCount(): number {
    return this.pendingActions.length;
  }

  public getScheduledDelayMs(): number {
    return this.scheduledDelayMs;
  }

  public getDispatchCount(): number {
    return this.dispatchCount;
  }

  public isStartPending(): boolean {
    return this.pendingActions.indexOf(RequestDispatcher.START_ACTION) >= 0;
  }

  public cancel(): void {
    this.pendingActions = [];
    this.scheduledDelayMs = 0;
  }
}

// 连接登记表：onConnect 增加连接，onDisconnect 释放连接
class ConnectionRegistry {
  private connectionIds: number[] = [];

  public add(request: ConnectRequest): boolean {
    if (request.connectionId < 0) {
      return false;
    }
    if (this.connectionIds.indexOf(request.connectionId) >= 0) {
      return false;
    }
    this.connectionIds.push(request.connectionId);
    return true;
  }

  public remove(connectionId: number): boolean {
    const index: number = this.connectionIds.indexOf(connectionId);
    if (index < 0) {
      return false;
    }
    this.connectionIds.splice(index, 1);
    return true;
  }

  public getCount(): number {
    return this.connectionIds.length;
  }

  public contains(connectionId: number): boolean {
    return this.connectionIds.indexOf(connectionId) >= 0;
  }

  public clear(): void {
    this.connectionIds = [];
  }
}

// 扩展服务模型：复现 ServiceExtTvAbility 的五个回调与实现绑定
class ServiceExtensionModel {
  private machine: ExtensionStateMachine = new ExtensionStateMachine();
  private holder: GlobalImplHolder = new GlobalImplHolder();
  private dispatcher: RequestDispatcher = new RequestDispatcher();
  private connections: ConnectionRegistry = new ConnectionRegistry();
  private records: ExtensionRecord[] = [];
  private serviceRunning: boolean = false;

  public onCreate(): boolean {
    if (!this.machine.apply(ExtensionEvent.ON_CREATE)) {
      return false;
    }
    const bound: boolean = this.holder.bind('MiracastPlayerServiceImpl');
    this.record(ExtensionEvent.ON_CREATE);
    return bound;
  }

  public onConnect(request: ConnectRequest): boolean {
    if (!this.machine.apply(ExtensionEvent.ON_CONNECT)) {
      return false;
    }
    const added: boolean = this.connections.add(request);
    this.record(ExtensionEvent.ON_CONNECT);
    return added;
  }

  public onRequest(action: string): boolean {
    if (!this.machine.apply(ExtensionEvent.ON_REQUEST)) {
      return false;
    }
    const dispatched: boolean = this.dispatcher.dispatch(action);
    if (dispatched && action === RequestDispatcher.START_ACTION) {
      this.serviceRunning = true;
    }
    this.record(ExtensionEvent.ON_REQUEST);
    return dispatched;
  }

  public onDisconnect(connectionId: number): boolean {
    if (!this.machine.apply(ExtensionEvent.ON_DISCONNECT)) {
      return false;
    }
    const removed: boolean = this.connections.remove(connectionId);
    this.record(ExtensionEvent.ON_DISCONNECT);
    return removed;
  }

  public onDestroy(): boolean {
    if (!this.machine.apply(ExtensionEvent.ON_DESTROY)) {
      return false;
    }
    this.serviceRunning = false;
    this.dispatcher.cancel();
    this.connections.clear();
    this.holder.unbind();
    this.record(ExtensionEvent.ON_DESTROY);
    return true;
  }

  private record(event: ExtensionEvent): void {
    const record: ExtensionRecord = {
      event: event,
      state: this.machine.getState(),
      timestamp: Date.now()
    };
    this.records.push(record);
  }

  public getState(): ExtensionState {
    return this.machine.getState();
  }

  public getMachine(): ExtensionStateMachine {
    return this.machine;
  }

  public getHolder(): GlobalImplHolder {
    return this.holder;
  }

  public getDispatcher(): RequestDispatcher {
    return this.dispatcher;
  }

  public getConnections(): ConnectionRegistry {
    return this.connections;
  }

  public getRecords(): ExtensionRecord[] {
    return [...this.records];
  }

  public countEvent(event: ExtensionEvent): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].event === event) {
        count++;
      }
    }
    return count;
  }

  public isServiceRunning(): boolean {
    return this.serviceRunning;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].timestamp < this.records[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }
}

// 生命周期时长账本：记录各回调耗时用于评估启动预算

export default function extensionLifecycleSuite(): void {
  describe('ExtensionLifecycle_Suite', () => {
    let driver: Driver;
    let model: ServiceExtensionModel;

    beforeAll(async () => {
      driver = getDriver();
      model = new ServiceExtensionModel();
      Log.info(TAG, 'suite start for ' + SERVICE_ABILITY_NAME);
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    // onCreate 应把实现绑定到全局槽位
    it('extension_on_create_should_bind_impl', 0, async () => {
      const extension = new ServiceExtensionModel();
      expect(extension.onCreate()).assertTrue();
      expect(extension.getState()).assertEqual(ExtensionState.CREATED);
      expect(extension.getHolder().isBound()).assertTrue();
      expect(extension.getHolder().getImpl()).assertEqual('MiracastPlayerServiceImpl');
    });

    // 重复 onCreate 应被状态机拒绝且不重复绑定
    it('extension_on_create_should_be_idempotent', 0, async () => {
      const extension = new ServiceExtensionModel();
      expect(extension.onCreate()).assertTrue();
      expect(extension.onCreate()).assertFalse();
      expect(extension.getHolder().getBindCount()).assertEqual(1);
      expect(extension.countEvent(ExtensionEvent.ON_CREATE)).assertEqual(1);
    });

    // 空实现名不允许绑定到全局槽位

    // 全局槽位重复绑定应被拒绝
    it('global_impl_holder_should_reject_second_bind', 0, async () => {
      const holder = new GlobalImplHolder();
      holder.bind('implA');
      expect(holder.bind('implB')).assertFalse();
      expect(holder.getImpl()).assertEqual('implA');
      expect(holder.getBindCount()).assertEqual(1);
    });

    // onConnect 应登记连接并推进到 CONNECTED
    it('extension_on_connect_should_register_connection', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      const request: ConnectRequest = { connectionId: 1, callingUid: 1000 };
      expect(extension.onConnect(request)).assertTrue();
      expect(extension.getState()).assertEqual(ExtensionState.CONNECTED);
      expect(extension.getConnections().getCount()).assertEqual(1);
      expect(extension.getConnections().contains(1)).assertTrue();
    });

    // 重复 connectionId 的 onConnect 应被连接表拒绝
    it('extension_on_connect_should_reject_duplicate_connection', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      const request: ConnectRequest = { connectionId: 7, callingUid: 1000 };
      expect(extension.onConnect(request)).assertTrue();
      expect(extension.onConnect(request)).assertFalse();
      expect(extension.getConnections().getCount()).assertEqual(1);
    });

    // 未 onCreate 时 onConnect 应被状态机拒绝
    it('extension_on_connect_before_create_should_fail', 0, async () => {
      const extension = new ServiceExtensionModel();
      const request: ConnectRequest = { connectionId: 2, callingUid: 1000 };
      expect(extension.onConnect(request)).assertFalse();
      expect(extension.getState()).assertEqual(ExtensionState.IDLE);
      expect(extension.getConnections().getCount()).assertEqual(0);
    });

    // 负数 connectionId 不应进入连接表
    it('connection_registry_should_reject_negative_id', 0, async () => {
      const registry = new ConnectionRegistry();
      const invalid: ConnectRequest = { connectionId: -1, callingUid: 1000 };
      expect(registry.add(invalid)).assertFalse();
      expect(registry.remove(-1)).assertFalse();
      const valid: ConnectRequest = { connectionId: 0, callingUid: 1000 };
      expect(registry.add(valid)).assertTrue();
      expect(registry.remove(0)).assertTrue();
      expect(registry.getCount()).assertEqual(0);
    });

    // onRequest 的 startMiracastService 应安排 8000ms 延迟
    it('extension_on_request_should_schedule_start_delay', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onConnect({ connectionId: 3, callingUid: 1000 });
      expect(extension.onRequest('startMiracastService')).assertTrue();
      expect(extension.getDispatcher().getScheduledDelayMs()).assertEqual(8000);
      expect(extension.getDispatcher().isStartPending()).assertTrue();
      expect(extension.isServiceRunning()).assertTrue();
    });

    // 非 start 动作不应安排延迟启动

    // 空 action 应被请求分发器拒绝
    it('request_dispatcher_should_reject_empty_action', 0, async () => {
      const dispatcher = new RequestDispatcher();
      expect(dispatcher.dispatch('')).assertFalse();
      expect(dispatcher.getDispatchCount()).assertEqual(0);
      expect(dispatcher.getPendingCount()).assertEqual(0);
    });

    // stop 动作应清空待处理启动并归零延迟
    it('request_dispatcher_should_cancel_pending_on_stop', 0, async () => {
      const dispatcher = new RequestDispatcher();
      dispatcher.dispatch(RequestDispatcher.START_ACTION);
      expect(dispatcher.isStartPending()).assertTrue();
      expect(dispatcher.dispatch(RequestDispatcher.STOP_ACTION)).assertTrue();
      expect(dispatcher.isStartPending()).assertFalse();
      expect(dispatcher.getScheduledDelayMs()).assertEqual(0);
      dispatcher.cancel();
      expect(dispatcher.getPendingCount()).assertEqual(0);
    });

    // onDisconnect 应释放连接并推进到 DISCONNECTED
    it('extension_on_disconnect_should_release_connection', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onConnect({ connectionId: 5, callingUid: 1000 });
      expect(extension.onDisconnect(5)).assertTrue();
      expect(extension.getState()).assertEqual(ExtensionState.DISCONNECTED);
      expect(extension.getConnections().getCount()).assertEqual(0);
    });

    // 释放不存在的连接应返回 false 但状态仍推进
    it('extension_on_disconnect_should_handle_unknown_connection', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onConnect({ connectionId: 6, callingUid: 1000 });
      expect(extension.onDisconnect(99)).assertFalse();
      expect(extension.getState()).assertEqual(ExtensionState.DISCONNECTED);
      expect(extension.getConnections().contains(6)).assertTrue();
    });

    // 销毁时应停止服务、清空连接并解绑全局实现
    it('extension_on_destroy_should_release_all_resources', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onConnect({ connectionId: 8, callingUid: 1000 });
      extension.onRequest('startMiracastService');
      expect(extension.isServiceRunning()).assertTrue();
      expect(extension.onDestroy()).assertTrue();
      expect(extension.getState()).assertEqual(ExtensionState.DESTROYED);
      expect(extension.isServiceRunning()).assertFalse();
      expect(extension.getConnections().getCount()).assertEqual(0);
      expect(extension.getHolder().isBound()).assertFalse();
    });

    // 销毁后再次 onCreate 应被状态机拒绝
    it('extension_on_create_after_destroy_should_fail', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onDestroy();
      expect(extension.onCreate()).assertFalse();
      expect(extension.getState()).assertEqual(ExtensionState.DESTROYED);
      expect(extension.countEvent(ExtensionEvent.ON_CREATE)).assertEqual(1);
    });

    // 状态机应允许 DISCONNECTED 后重新连接
    it('state_machine_should_allow_reconnect_after_disconnect', 0, async () => {
      const machine = new ExtensionStateMachine();
      expect(machine.apply(ExtensionEvent.ON_CREATE)).assertTrue();
      expect(machine.apply(ExtensionEvent.ON_CONNECT)).assertTrue();
      expect(machine.apply(ExtensionEvent.ON_DISCONNECT)).assertTrue();
      expect(machine.apply(ExtensionEvent.ON_CONNECT)).assertTrue();
      expect(machine.getState()).assertEqual(ExtensionState.CONNECTED);
      expect(machine.getTransitionCount()).assertEqual(4);
    });

    // 状态机应拒绝 onRequest 先于 onConnect
    it('state_machine_should_reject_request_before_connect', 0, async () => {
      const machine = new ExtensionStateMachine();
      expect(machine.apply(ExtensionEvent.ON_REQUEST)).assertFalse();
      expect(machine.apply(ExtensionEvent.ON_CREATE)).assertTrue();
      expect(machine.apply(ExtensionEvent.ON_REQUEST)).assertFalse();
      expect(machine.getState()).assertEqual(ExtensionState.CREATED);
    });

    // 状态机在销毁后拒绝所有后续迁移
    it('state_machine_should_reject_transitions_after_destroy', 0, async () => {
      const machine = new ExtensionStateMachine();
      machine.apply(ExtensionEvent.ON_CREATE);
      machine.apply(ExtensionEvent.ON_DESTROY);
      expect(machine.apply(ExtensionEvent.ON_CONNECT)).assertFalse();
      expect(machine.apply(ExtensionEvent.ON_CREATE)).assertFalse();
      expect(machine.getState()).assertEqual(ExtensionState.DESTROYED);
    });

    // 状态机迁移历史应按顺序记录
    it('state_machine_should_record_transition_history', 0, async () => {
      const machine = new ExtensionStateMachine();
      machine.apply(ExtensionEvent.ON_CREATE);
      machine.apply(ExtensionEvent.ON_CONNECT);
      machine.apply(ExtensionEvent.ON_REQUEST);
      const history: ExtensionState[] = machine.getHistory();
      expect(history.length).assertEqual(3);
      expect(history[0]).assertEqual(ExtensionState.CREATED);
      expect(history[2]).assertEqual(ExtensionState.REQUESTED);
      machine.reset();
      expect(machine.getState()).assertEqual(ExtensionState.IDLE);
      expect(machine.getHistory().length).assertEqual(0);
    });

    // 每个回调都应写入一条事件记录
    it('extension_model_should_record_every_callback', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onConnect({ connectionId: 11, callingUid: 1000 });
      extension.onRequest('startMiracastService');
      extension.onDisconnect(11);
      expect(extension.getRecords().length).assertEqual(4);
      expect(extension.countEvent(ExtensionEvent.ON_CREATE)).assertEqual(1);
      expect(extension.countEvent(ExtensionEvent.ON_DESTROY)).assertEqual(0);
    });

    // 事件记录的时间戳必须单调递增
    it('extension_records_timestamps_should_be_chronological', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      extension.onConnect({ connectionId: 12, callingUid: 1000 });
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      extension.onRequest('startMiracastService');
      expect(extension.isChronological()).assertTrue();
      const records: ExtensionRecord[] = extension.getRecords();
      expect(records[0].timestamp).assertLessOrEqual(records[1].timestamp);
      expect(records[1].timestamp).assertLessOrEqual(records[2].timestamp);
    });

    // 完整生命周期应覆盖创建、连接、请求、断开、销毁
    it('complete_extension_lifecycle_should_be_ordered', 0, async () => {
      const extension = new ServiceExtensionModel();
      expect(extension.onCreate()).assertTrue();
      expect(extension.onConnect({ connectionId: 13, callingUid: 1000 })).assertTrue();
      expect(extension.onRequest('startMiracastService')).assertTrue();
      expect(extension.onDisconnect(13)).assertTrue();
      expect(extension.onDestroy()).assertTrue();
      expect(extension.getRecords().length).assertEqual(5);
      expect(extension.getState()).assertEqual(ExtensionState.DESTROYED);
    });

    // 多个连接同时存在时应全部登记
    it('extension_should_support_multiple_connections', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      expect(extension.onConnect({ connectionId: 21, callingUid: 1000 })).assertTrue();
      expect(extension.onConnect({ connectionId: 22, callingUid: 1000 })).assertTrue();
      expect(extension.getConnections().getCount()).assertEqual(2);
      expect(extension.onDisconnect(21)).assertTrue();
      expect(extension.getConnections().getCount()).assertEqual(1);
      expect(extension.getConnections().contains(22)).assertTrue();
    });

    // 连接表清空后不再保留任何 connectionId

    // 生命周期耗时账本应记录每个回调的成本

    // 空耗时账本的平均值应为 0 且预算判定为真

    // 重连审计应确保重连次数不超过断连次数

    // 服务扩展启动后应能在超时窗口内建立服务连接

    // 扩展创建后首页应保持可渲染

    // 播放页拉起后返回不应残留播放器资源

    // 重复 onRequest 应只保留一次待处理启动

    // onRequest 在未连接时应被状态机拒绝
    it('extension_on_request_without_connection_should_fail', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      expect(extension.onRequest('startMiracastService')).assertFalse();
      expect(extension.getState()).assertEqual(ExtensionState.CREATED);
      expect(extension.isServiceRunning()).assertFalse();
    });

    // 销毁后请求分发器不应保留延迟任务
    it('extension_destroy_should_cancel_scheduled_request', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      extension.onConnect({ connectionId: 51, callingUid: 1000 });
      extension.onRequest('startMiracastService');
      expect(extension.getDispatcher().getScheduledDelayMs()).assertEqual(8000);
      extension.onDestroy();
      expect(extension.getDispatcher().getScheduledDelayMs()).assertEqual(0);
      expect(extension.getDispatcher().getPendingCount()).assertEqual(0);
    });

    // 综合场景：创建 → 连接 → 请求 → 销毁 → 重新连接

    // 请求分发器应累计分发次数
    it('request_dispatcher_should_count_dispatch_calls', 0, async () => {
      const dispatcher = new RequestDispatcher();
      dispatcher.dispatch(RequestDispatcher.START_ACTION);
      dispatcher.dispatch('unknownAction');
      expect(dispatcher.getDispatchCount()).assertEqual(2);
      expect(dispatcher.getPendingCount()).assertEqual(1);
      dispatcher.cancel();
      expect(dispatcher.getDispatchCount()).assertEqual(2);
      expect(dispatcher.getPendingCount()).assertEqual(0);
    });

    // 连接表应按插入顺序保留 connectionId
    it('connection_registry_should_keep_insertion_order', 0, async () => {
      const registry = new ConnectionRegistry();
      registry.add({ connectionId: 71, callingUid: 1000 });
      registry.add({ connectionId: 72, callingUid: 1000 });
      expect(registry.getCount()).assertEqual(2);
      expect(registry.contains(71)).assertTrue();
      expect(registry.contains(72)).assertTrue();
      expect(registry.remove(71)).assertTrue();
      expect(registry.contains(71)).assertFalse();
      expect(registry.getCount()).assertEqual(1);
    });

    // 仅创建未连接时应停留在 CREATED
    it('extension_state_should_remain_created_without_connect', 0, async () => {
      const extension = new ServiceExtensionModel();
      extension.onCreate();
      expect(extension.getState()).assertEqual(ExtensionState.CREATED);
      expect(extension.getConnections().getCount()).assertEqual(0);
      expect(extension.isServiceRunning()).assertFalse();
      expect(extension.getHolder().isBound()).assertTrue();
    });

    // 生命周期成本预算边界应可精确判定

    // 零次断连时重连审计应保持平衡

    // 全局实现槽位重置后可重新绑定新的实现
    it('global_impl_holder_should_rebind_after_reset', 0, async () => {
      const holder = new GlobalImplHolder();
      expect(holder.bind('implFirst')).assertTrue();
      holder.reset();
      expect(holder.isBound()).assertFalse();
      expect(holder.getBindCount()).assertEqual(0);
      expect(holder.bind('implSecond')).assertTrue();
      expect(holder.getImpl()).assertEqual('implSecond');
    });
  });
}
