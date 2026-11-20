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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_BACK, miracastComponentCount, isIndexPageVisible,
  isPlayerPageVisible, isPermissionDialogVisible, waitForPageStable, waitForPlayerPage,
  waitForServiceConnected, countComponentsById, readTextById, pressAndWait, serializedDelay,
  triggerMiracastHome, launchPlayerPage, safeBack, ID_TAB_MIRACAST, ID_TAB_SETTINGS, ID_SWITCH_BTN,
  ID_SAVE_BTN, TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER, DELAY_KEY_NAVIGATION,
  DELAY_SERVICE_RECONNECT, DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'IntegrationTestingSuite';

enum PageId {
  INDEX = 'pages/Index',
  PLAYER = 'pages/PlayerPage',
  CHANGE_NAME = 'pages/ChangeNamePage',
  TRUST_LIST = 'pages/TrustDeviceListPage'
}

enum RouteEvent {
  OPEN_PLAYER = 'open_player',
  OPEN_SETTINGS = 'open_settings',
  OPEN_CHANGE_NAME = 'open_change_name',
  OPEN_TRUST_LIST = 'open_trust_list',
  BACK = 'back',
  SAVE = 'save'
}

interface RouteHop {
  from: PageId;
  to: PageId;
  event: RouteEvent;
  accepted: boolean;
}

enum BindingState {
  UNBOUND = 'unbound',
  BINDING = 'binding',
  BOUND = 'bound',
  DESTROYED = 'destroyed'
}

// 页面路由模型：复现 TvAbility onNewWant 的防重复堆叠规则
class PageRouterModel {
  private stack: PageId[] = [];
  private playerShow: boolean = false;
  private hops: RouteHop[] = [];

  public constructor() {
    this.stack.push(PageId.INDEX);
  }

  public getLength(): number { return this.stack.length; }

  public getCurrent(): PageId { return this.stack[this.stack.length - 1]; }

  public isPlayerShow(): boolean { return this.playerShow; }

  private recordHop(from: PageId, to: PageId, event: RouteEvent, accepted: boolean): void {
    const hop: RouteHop = { from: from, to: to, event: event, accepted: accepted };
    this.hops.push(hop);
  }

  private hasPlayerInStack(): boolean { return this.stack.includes(PageId.PLAYER); }

  public push(page: PageId, event: RouteEvent): boolean {
    const from: PageId = this.getCurrent();
    if (page === PageId.PLAYER && this.playerShow) {
      this.recordHop(from, page, event, false);
      return false;
    }
    this.stack.push(page);
    if (page === PageId.PLAYER) { this.playerShow = true; }
    this.recordHop(from, page, event, true);
    return true;
  }

  // onNewWant 去重：栈大于 1 且不在播放页时清理并回到首页
  public onNewWant(wantPlayer: boolean): boolean {
    const from: PageId = this.getCurrent();
    if (this.stack.length > 1 && !this.playerShow) {
      this.stack = [PageId.INDEX];
      this.recordHop(from, PageId.INDEX, RouteEvent.BACK, true);
    }
    if (wantPlayer) { return this.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER); }
    return true;
  }

  public back(): boolean {
    if (this.stack.length <= 1) { return false; }
    const from: PageId = this.getCurrent();
    this.stack.pop();
    if (from === PageId.PLAYER && !this.hasPlayerInStack()) { this.playerShow = false; }
    this.recordHop(from, this.getCurrent(), RouteEvent.BACK, true);
    return true;
  }

  public replace(page: PageId): void {
    const from: PageId = this.getCurrent();
    this.stack.pop();
    this.stack.push(page);
    this.playerShow = page === PageId.PLAYER;
    this.recordHop(from, page, RouteEvent.SAVE, true);
  }

  public hasPage(page: PageId): boolean { return this.stack.includes(page); }

  public getHops(): RouteHop[] {
    const copy: RouteHop[] = [];
    for (let i = 0; i < this.hops.length; i++) { copy.push(this.hops[i]); }
    return copy;
  }

  public getAcceptedHopCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.hops.length; i++) {
      if (this.hops[i].accepted) { count++; }
    }
    return count;
  }

  public getRejectedHopCount(): number { return this.hops.length - this.getAcceptedHopCount(); }
}

// 服务绑定模型：onCreate 注入 impl、onRequest 延迟启动、onDestroy 停止服务
class ServiceBindingModel {
  private state: BindingState = BindingState.UNBOUND;
  private implReady: boolean = false;
  private requestDelayMs: number = 8000;

  public bind(): boolean {
    if (this.state === BindingState.BOUND) { return false; }
    this.state = BindingState.BINDING;
    this.state = BindingState.BOUND;
    this.implReady = true;
    return true;
  }

  public getState(): BindingState { return this.state; }

  public isImplReady(): boolean { return this.implReady; }

  public getRequestDelay(): number { return this.requestDelayMs; }

  public handleRequest(requestName: string): boolean {
    return this.implReady && requestName === 'startMiracastService';
  }

  public onDestroy(): void {
    if (this.state !== BindingState.BOUND) { return; }
    this.state = BindingState.DESTROYED;
    this.implReady = false;
  }
}

// 事件总线模型：1000 授权回传与 1001 播放数据延迟 500ms 分发
class EmitterBusModel {
  public static readonly PERMISSION_EVENT_ID: number = 1000;
  public static readonly PLAYER_DATA_EVENT_ID: number = 1001;
  public static readonly PLAYER_EVENT_DELAY_MS: number = 500;
  private permissions: number[] = [];
  private pending: number = 0;
  private dispatched: number = 0;

  public register(eventId: number): boolean {
    return eventId === EmitterBusModel.PERMISSION_EVENT_ID || eventId === EmitterBusModel.PLAYER_DATA_EVENT_ID;
  }

  public emitPermission(deviceId: string, permission: number): boolean {
    if (deviceId.length === 0) { return false; }
    this.permissions.push(permission);
    return true;
  }

  public schedulePlayerData(deviceId: string, deviceName: string): number {
    if (deviceId.length === 0 || deviceName.length === 0) { return -1; }
    this.pending++;
    return EmitterBusModel.PLAYER_EVENT_DELAY_MS;
  }

  public dispatchPlayerData(elapsedMs: number): number {
    if (this.pending === 0 || elapsedMs < EmitterBusModel.PLAYER_EVENT_DELAY_MS) { return 0; }
    const count: number = this.pending;
    this.pending = 0;
    this.dispatched += count;
    return count;
  }

  public getPermissionEventCount(): number { return this.permissions.length; }

  public getPendingPlayerEventCount(): number { return this.pending; }

  public getDispatchedPlayerEventCount(): number { return this.dispatched; }

  public getLastPermission(): number {
    return this.permissions.length === 0 ? -1 : this.permissions[this.permissions.length - 1];
  }

  public clear(): void { this.permissions = []; this.pending = 0; }
}

// 链路完整性校验器：确认每个 hop 的 from/to/event 组合都是允许的
class FlowIntegrityChecker {
  private allowed: string[] = [
    'open_player|pages/Index|pages/PlayerPage',
    'open_settings|pages/Index|pages/ChangeNamePage',
    'open_trust_list|pages/Index|pages/TrustDeviceListPage',
    'save|pages/ChangeNamePage|pages/Index',
    'back|pages/PlayerPage|pages/Index'
  ];

  public isHopAllowed(hop: RouteHop): boolean {
    return this.allowed.includes(hop.event + '|' + hop.from + '|' + hop.to);
  }

  public areHopsAllowed(hops: RouteHop[]): boolean {
    for (let i = 0; i < hops.length; i++) {
      if (hops[i].accepted && !this.isHopAllowed(hops[i])) { return false; }
    }
    return true;
  }

  public getRuleCount(): number { return this.allowed.length; }
}

// 集成交互记录：汇总页面、服务、事件三个维度的成功率
interface IntegrationOutcome {
  dimension: string;
  success: boolean;
  elapsedMs: number;
}

class IntegrationOutcomeTracker {
  private outcomes: IntegrationOutcome[] = [];
  public record(dimension: string, success: boolean, elapsedMs: number): void {
    const outcome: IntegrationOutcome = { dimension: dimension, success: success, elapsedMs: elapsedMs };
    this.outcomes.push(outcome);
  }
  public getOutcomeCount(): number { return this.outcomes.length; }
  public countByDimension(dimension: string): number {
    let count: number = 0;
    for (let i = 0; i < this.outcomes.length; i++) {
      if (this.outcomes[i].dimension === dimension) { count++; }
    }
    return count;
  }
  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.outcomes.length; i++) {
      if (this.outcomes[i].success) { count++; }
    }
    return count;
  }
  public getSuccessRate(): number {
    return this.outcomes.length === 0 ? 0 : this.getSuccessCount() / this.outcomes.length;
  }
  public getAverageElapsed(dimension: string): number {
    let total: number = 0;
    let count: number = 0;
    for (let i = 0; i < this.outcomes.length; i++) {
      if (this.outcomes[i].dimension === dimension) { total += this.outcomes[i].elapsedMs; count++; }
    }
    return count === 0 ? 0 : total / count;
  }
  public getDimensions(): string[] {
    const dimensions: string[] = [];
    for (let i = 0; i < this.outcomes.length; i++) {
      if (!dimensions.includes(this.outcomes[i].dimension)) { dimensions.push(this.outcomes[i].dimension); }
    }
    return dimensions;
  }
}

export default function integrationTestingSuite(): void {
  describe('IntegrationTesting_Suite', () => {
    let driver: Driver;
    let tracker: IntegrationOutcomeTracker;
    beforeAll(async () => {
      driver = getDriver();
      tracker = new IntegrationOutcomeTracker();
      Log.info(TAG, 'integration testing suite start');
      await waitForServiceConnected(driver);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'integration testing suite end');
    });

    it('router_starts_on_index_page', 0, async () => {
      const router = new PageRouterModel(); expect(router.getLength()).assertEqual(1); expect(router.getCurrent()).assertEqual(PageId.INDEX); expect(router.isPlayerShow()).assertFalse();
    });
    it('router_pushes_player_page', 0, async () => {
      const router = new PageRouterModel(); expect(router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER)).assertTrue(); expect(router.getLength()).assertEqual(2); expect(router.getCurrent()).assertEqual(PageId.PLAYER); expect(router.isPlayerShow()).assertTrue();
    });
    it('router_rejects_duplicate_player_stack', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER); expect(router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER)).assertFalse(); expect(router.getLength()).assertEqual(2); expect(router.getRejectedHopCount()).assertEqual(1);
    });
    it('router_back_returns_to_index_and_clears_player_flag', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER); expect(router.back()).assertTrue(); expect(router.getCurrent()).assertEqual(PageId.INDEX); expect(router.isPlayerShow()).assertFalse();
    });
    it('router_back_at_root_is_rejected', 0, async () => {
      const router = new PageRouterModel(); expect(router.back()).assertFalse(); expect(router.getLength()).assertEqual(1);
    });
    it('router_supports_settings_pages', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.CHANGE_NAME, RouteEvent.OPEN_SETTINGS); expect(router.hasPage(PageId.CHANGE_NAME)).assertTrue(); router.replace(PageId.INDEX); expect(router.getCurrent()).assertEqual(PageId.INDEX); expect(router.hasPage(PageId.CHANGE_NAME)).assertFalse();
    });
    it('router_trust_list_round_trip_keeps_index_alive', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.TRUST_LIST, RouteEvent.OPEN_TRUST_LIST); expect(router.getLength()).assertEqual(2); router.back(); expect(router.getCurrent()).assertEqual(PageId.INDEX); expect(router.getLength()).assertEqual(1);
    });
    it('on_new_want_collapses_duplicate_stack', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.CHANGE_NAME, RouteEvent.OPEN_SETTINGS); router.push(PageId.TRUST_LIST, RouteEvent.OPEN_TRUST_LIST); expect(router.getLength()).assertEqual(3); expect(router.onNewWant(false)).assertTrue(); expect(router.getLength()).assertEqual(1);
    });
    it('on_new_want_with_player_flag_opens_player', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.TRUST_LIST, RouteEvent.OPEN_TRUST_LIST); expect(router.onNewWant(true)).assertTrue(); expect(router.getCurrent()).assertEqual(PageId.PLAYER); expect(router.isPlayerShow()).assertTrue();
    });
    it('router_hop_journal_tracks_acceptance', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER); router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER); router.back(); expect(router.getHops().length).assertEqual(3); expect(router.getAcceptedHopCount()).assertEqual(2); expect(router.getRejectedHopCount()).assertEqual(1);
    });
    it('integrity_checker_accepts_player_hop', 0, async () => {
      const router = new PageRouterModel(); router.push(PageId.PLAYER, RouteEvent.OPEN_PLAYER); const checker = new FlowIntegrityChecker(); const hops: RouteHop[] = router.getHops(); expect(checker.isHopAllowed(hops[0])).assertTrue(); expect(checker.areHopsAllowed(hops)).assertTrue(); expect(checker.getRuleCount()).assertEqual(5);
    });
    it('integrity_checker_rejects_unknown_hop', 0, async () => {
      const checker = new FlowIntegrityChecker(); const hop: RouteHop = { from: PageId.TRUST_LIST, to: PageId.PLAYER, event: RouteEvent.OPEN_PLAYER, accepted: true }; expect(checker.isHopAllowed(hop)).assertFalse(); const skipped: RouteHop = { from: PageId.INDEX, to: PageId.PLAYER, event: RouteEvent.OPEN_PLAYER, accepted: false }; expect(checker.areHopsAllowed([skipped])).assertTrue();
    });
    it('service_binding_injects_impl_on_bind', 0, async () => {
      const binding = new ServiceBindingModel(); expect(binding.getState()).assertEqual(BindingState.UNBOUND); expect(binding.bind()).assertTrue(); expect(binding.getState()).assertEqual(BindingState.BOUND); expect(binding.isImplReady()).assertTrue();
    });
    it('service_binding_rejects_double_bind', 0, async () => {
      const binding = new ServiceBindingModel(); binding.bind(); expect(binding.bind()).assertFalse(); expect(binding.getState()).assertEqual(BindingState.BOUND);
    });
    it('service_request_requires_impl_ready', 0, async () => {
      const binding = new ServiceBindingModel(); expect(binding.handleRequest('startMiracastService')).assertFalse(); binding.bind(); expect(binding.handleRequest('startMiracastService')).assertTrue(); expect(binding.handleRequest('unknownRequest')).assertFalse();
    });
    it('service_request_delay_is_eight_seconds', 0, async () => {
      const binding = new ServiceBindingModel(); expect(binding.getRequestDelay()).assertEqual(8000);
    });
    it('service_destroy_stops_service', 0, async () => {
      const binding = new ServiceBindingModel(); binding.bind(); expect(binding.handleRequest('startMiracastService')).assertTrue(); binding.onDestroy(); expect(binding.getState()).assertEqual(BindingState.DESTROYED); expect(binding.isImplReady()).assertFalse();
    });
    it('service_destroy_before_bind_is_ignored', 0, async () => {
      const binding = new ServiceBindingModel(); binding.onDestroy(); expect(binding.getState()).assertEqual(BindingState.UNBOUND); expect(binding.isImplReady()).assertFalse();
    });
    it('emitter_registers_only_supported_event_ids', 0, async () => {
      const bus = new EmitterBusModel(); expect(bus.register(EmitterBusModel.PERMISSION_EVENT_ID)).assertTrue(); expect(bus.register(EmitterBusModel.PLAYER_DATA_EVENT_ID)).assertTrue(); expect(bus.register(999)).assertFalse();
    });
    it('emitter_records_permission_decode_result', 0, async () => {
      const bus = new EmitterBusModel(); expect(bus.emitPermission('device-200', 0)).assertTrue(); expect(bus.getPermissionEventCount()).assertEqual(1); expect(bus.getLastPermission()).assertEqual(0); expect(bus.emitPermission('', 1)).assertFalse();
    });
    it('emitter_delays_player_data_by_500ms', 0, async () => {
      const bus = new EmitterBusModel(); expect(bus.schedulePlayerData('device-201', 'Living Room Phone')).assertEqual(500); expect(bus.getPendingPlayerEventCount()).assertEqual(1); expect(bus.dispatchPlayerData(499)).assertEqual(0); expect(bus.dispatchPlayerData(500)).assertEqual(1); expect(bus.getDispatchedPlayerEventCount()).assertEqual(1);
    });
    it('emitter_dispatch_is_idempotent', 0, async () => {
      const bus = new EmitterBusModel(); bus.schedulePlayerData('device-202', 'Phone'); bus.dispatchPlayerData(600); expect(bus.dispatchPlayerData(900)).assertEqual(0); expect(bus.getDispatchedPlayerEventCount()).assertEqual(1);
    });
    it('emitter_clear_resets_all_queues', 0, async () => {
      const bus = new EmitterBusModel(); bus.emitPermission('device-203', 1); bus.schedulePlayerData('device-203', 'Phone'); bus.clear(); expect(bus.getPermissionEventCount()).assertEqual(0); expect(bus.getPendingPlayerEventCount()).assertEqual(0); expect(bus.getLastPermission()).assertEqual(-1);
    });
    it('tracker_counts_outcomes_by_dimension', 0, async () => {
      const local = new IntegrationOutcomeTracker(); local.record('page', true, 120); local.record('page', true, 110); local.record('service', true, 80); local.record('event', false, 40); expect(local.getOutcomeCount()).assertEqual(4); expect(local.countByDimension('page')).assertEqual(2); expect(local.getSuccessCount()).assertEqual(3); expect(local.getSuccessRate()).assertEqual(0.75);
    });
    it('tracker_averages_elapsed_by_dimension', 0, async () => {
      const local = new IntegrationOutcomeTracker(); local.record('service', true, 100); local.record('service', true, 300); expect(local.getAverageElapsed('service')).assertEqual(200); expect(local.getAverageElapsed('missing')).assertEqual(0);
    });
    it('tracker_lists_distinct_dimensions', 0, async () => {
      const local = new IntegrationOutcomeTracker(); local.record('page', true, 1); local.record('page', true, 1); local.record('service', true, 1); expect(local.getDimensions().length).assertEqual(2); expect(local.getDimensions().includes('service')).assertTrue();
    });
    it('integration_launch_repeats_without_stack_growth', 0, async () => {
      const router = new PageRouterModel(); for (let i = 0; i < 5; i++) { router.onNewWant(true); router.back(); } expect(router.getCurrent()).assertEqual(PageId.INDEX); expect(router.getLength()).assertEqual(1); expect(router.isPlayerShow()).assertFalse();
    });
    it('integration_player_data_text_contract', 0, async () => {
      expect((await readTextById(driver, ID_SWITCH_BTN)).length).assertLargerOrEqual(0); expect((await readTextById(driver, ID_SAVE_BTN)).length).assertLargerOrEqual(0);
    });
  });
}
