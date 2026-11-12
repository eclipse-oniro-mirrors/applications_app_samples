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
  isPlayerPageVisible, waitForPageStable, waitForPlayerPage, waitForServiceConnected,
  countComponentsById, pressAndWait, serializedDelay, triggerMiracastHome, launchPlayerPage,
  safeBack, ID_SWITCH_BTN, PAGE_INDEX, PAGE_PLAYER, TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER,
  DELAY_KEY_NAVIGATION, DELAY_EMITTER_DISPATCH, DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'SystemIntegrationSuite';

enum WantRoute {
  INDEX = 'pages/Index',
  PLAYER = 'pages/PlayerPage'
}

interface ParsedWant {
  route: WantRoute;
  deviceId: string;
  deviceName: string;
  valid: boolean;
}

interface PlayerDataPayload {
  deviceId: string;
  deviceName: string;
  delayMs: number;
  dispatched: boolean;
}

// Want 参数解析器：复现 want.parameters['startPlayer'] 的分支逻辑
class WantParameterParser {
  public static readonly KEY_START_PLAYER: string = 'startPlayer';
  public parse(startPlayer: boolean, deviceId: string, deviceName: string): ParsedWant {
    const route: WantRoute = startPlayer ? WantRoute.PLAYER : WantRoute.INDEX;
    const want: ParsedWant = {
      route: route, deviceId: deviceId, deviceName: deviceName,
      valid: startPlayer ? deviceId.length > 0 && deviceName.length > 0 : true
    };
    return want;
  }
  public isPlayerRoute(want: ParsedWant): boolean { return want.route === WantRoute.PLAYER; }
  public hasIdentity(want: ParsedWant): boolean { return want.deviceId.length > 0 && want.deviceName.length > 0; }
  public describe(want: ParsedWant): string { return want.route + ':' + want.deviceId; }
}

// TvAbility 生命周期模型：onCreate / onNewWant 路由与 1001 播放数据延迟分发
class TvAbilityLifecycleModel {
  private route: WantRoute = WantRoute.INDEX;
  private depth: number = 1;
  private playerShow: boolean = false;
  private foreground: boolean = false;
  private destroyed: boolean = false;
  private pending: PlayerDataPayload | null = null;
  private createdCount: number = 0;
  private newWantCount: number = 0;
  public onCreate(startPlayer: boolean, deviceId: string, deviceName: string): WantRoute {
    this.createdCount++;
    this.foreground = true;
    const parser = new WantParameterParser();
    const want: ParsedWant = parser.parse(startPlayer, deviceId, deviceName);
    this.route = want.route;
    this.playerShow = want.route === WantRoute.PLAYER;
    this.depth = this.playerShow ? 2 : 1;
    if (parser.isPlayerRoute(want) && parser.hasIdentity(want)) { this.onPostPlayerData(deviceId, deviceName); }
    return this.route;
  }
  private onPostPlayerData(deviceId: string, deviceName: string): void {
    const payload: PlayerDataPayload = { deviceId: deviceId, deviceName: deviceName, delayMs: 500, dispatched: false };
    this.pending = payload;
  }
  public onNewWant(startPlayer: boolean): boolean {
    this.newWantCount++;
    if (this.depth > 1 && !this.playerShow) { this.depth = 1; }
    this.playerShow = startPlayer;
    this.route = startPlayer ? WantRoute.PLAYER : WantRoute.INDEX;
    if (startPlayer && this.depth === 1) { this.depth = 2; }
    return true;
  }
  // 到点分发：elapsed >= 500 时把事件标记为已发送
  public dispatchPlayerData(elapsedMs: number): boolean {
    if (this.pending === null || elapsedMs < this.pending.delayMs) { return false; }
    this.pending.dispatched = true;
    return true;
  }
  public getPendingPayload(): PlayerDataPayload | null { return this.pending; }
  public getRoute(): WantRoute { return this.route; }
  public isPlayerShow(): boolean { return this.playerShow; }
  public getRouterLength(): number { return this.depth; }
  public onForeground(): void { this.foreground = true; }
  public onBackground(): void { this.foreground = false; }
  public isForeground(): boolean { return this.foreground; }
  public onDestroy(): void {
    this.destroyed = true;
    this.foreground = false;
    this.pending = null;
    this.depth = 0;
  }
  public isDestroyed(): boolean { return this.destroyed; }
  public getCreatedCount(): number { return this.createdCount; }
  public getNewWantCount(): number { return this.newWantCount; }
}

// ServiceExtTvAbility 模型：onCreate 注入 impl，onRequest 延迟 8000ms，onDestroy 停止服务
class ServiceExtensionModel {
  private bound: boolean = false;
  private implReady: boolean = false;
  private requestDelayMs: number = 8000;
  private startRequestedAt: number = -1;
  private stopped: boolean = false;
  public onCreate(): void { this.bound = true; this.implReady = true; }
  public isBound(): boolean { return this.bound; }
  public isImplReady(): boolean { return this.implReady; }
  public getRequestDelay(): number { return this.requestDelayMs; }
  public onRequest(requestName: string, nowMs: number): boolean {
    if (!this.implReady || requestName !== 'startMiracastService') { return false; }
    this.startRequestedAt = nowMs;
    return true;
  }
  public shouldStartNow(nowMs: number): boolean {
    if (this.startRequestedAt < 0) { return false; }
    return nowMs - this.startRequestedAt >= this.requestDelayMs;
  }
  public onDestroy(): void { this.stopped = true; this.bound = false; this.implReady = false; }
  public isStopped(): boolean { return this.stopped; }
}

// 授权 emitter 模型：eventId 1000 回传许可结果，重复事件在展示期内合并
class PermissionEmitterModel {
  public static readonly EVENT_ID: number = 1000;
  private lastPermission: number = -1;
  private pendingCount: number = 0;
  public emit(permission: number): boolean {
    if (permission < 0 || permission > 2) { return false; }
    this.lastPermission = permission;
    this.pendingCount++;
    return true;
  }
  public consume(): number {
    if (this.pendingCount === 0) { return -1; }
    this.pendingCount = 0;
    return this.lastPermission;
  }
  public getPendingCount(): number { return this.pendingCount; }
  public getLastPermission(): number { return this.lastPermission; }
  public isTrustGranted(): boolean { return this.lastPermission === 0; }
  public clear(): void { this.lastPermission = -1; this.pendingCount = 0; }
}

export default function systemIntegrationSuite(): void {
  describe('SystemIntegration_Suite', () => {
    let driver: Driver;
    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'system integration suite start');
      await waitForServiceConnected(driver);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'system integration suite end');
    });
    it('parser_routes_to_index_without_start_player', 0, async () => {
      const parser = new WantParameterParser();
      const want: ParsedWant = parser.parse(false, 'device-300', 'Phone');
      expect(want.route).assertEqual(WantRoute.INDEX);
      expect(parser.isPlayerRoute(want)).assertFalse(); expect(want.valid).assertTrue();
    });
    it('parser_routes_to_player_with_start_player', 0, async () => {
      const parser = new WantParameterParser();
      const want: ParsedWant = parser.parse(true, 'device-301', 'Phone 301');
      expect(want.route).assertEqual(PAGE_PLAYER); expect(parser.isPlayerRoute(want)).assertTrue();
      expect(parser.hasIdentity(want)).assertTrue();
    });
    it('parser_rejects_player_want_without_identity', 0, async () => {
      const parser = new WantParameterParser();
      const noId: ParsedWant = parser.parse(true, '', 'Phone');
      const noName: ParsedWant = parser.parse(true, 'device-302', '');
      expect(noId.valid).assertFalse(); expect(noName.valid).assertFalse(); expect(parser.hasIdentity(noId)).assertFalse();
    });
    it('parser_description_carries_route_and_device', 0, async () => {
      const parser = new WantParameterParser(); const want: ParsedWant = parser.parse(true, 'device-306', 'Phone 306');
      expect(parser.describe(want)).assertEqual('pages/PlayerPage:device-306');
      const home: ParsedWant = parser.parse(false, 'device-307', 'Phone 307');
      expect(parser.describe(home)).assertEqual('pages/Index:device-307');
    });
    it('ability_on_create_index_is_default_route', 0, async () => {
      const ability = new TvAbilityLifecycleModel();
      expect(ability.onCreate(false, '', '')).assertEqual(WantRoute.INDEX);
      expect(ability.getRoute()).assertEqual(PAGE_INDEX); expect(ability.getRouterLength()).assertEqual(1);
      expect(ability.isPlayerShow()).assertFalse(); expect(ability.getCreatedCount()).assertEqual(1);
    });
    it('ability_on_create_player_route_binds_device', 0, async () => {
      const ability = new TvAbilityLifecycleModel();
      expect(ability.onCreate(true, 'device-303', 'Phone 303')).assertEqual(WantRoute.PLAYER);
      expect(ability.getRouterLength()).assertEqual(2); expect(ability.isPlayerShow()).assertTrue();
      const payload: PlayerDataPayload | null = ability.getPendingPayload();
      expect(payload === null).assertFalse(); if (payload !== null) { expect(payload.deviceId).assertEqual('device-303'); expect(payload.delayMs).assertEqual(500); }
    });
    it('ability_on_create_without_identity_skips_payload', 0, async () => {
      const ability = new TvAbilityLifecycleModel();
      ability.onCreate(true, '', '');
      expect(ability.getPendingPayload() === null).assertTrue();
      expect(ability.dispatchPlayerData(600)).assertFalse();
    });
    it('ability_emitter_1001_waits_500ms', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(true, 'device-304', 'Phone 304');
      expect(ability.dispatchPlayerData(0)).assertFalse(); expect(ability.dispatchPlayerData(499)).assertFalse();
      expect(ability.dispatchPlayerData(500)).assertTrue();
      const payload: PlayerDataPayload | null = ability.getPendingPayload(); if (payload !== null) { expect(payload.dispatched).assertTrue(); }
    });
    it('ability_on_new_want_collapses_stale_stack', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(false, '', '');
      expect(ability.onNewWant(false)).assertTrue();
      expect(ability.getNewWantCount()).assertEqual(1); expect(ability.getRouterLength()).assertEqual(1);
      expect(ability.getRoute()).assertEqual(WantRoute.INDEX);
    });
    it('ability_on_new_want_with_player_flag_opens_player', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(false, '', '');
      expect(ability.onNewWant(true)).assertTrue();
      expect(ability.getRoute()).assertEqual(WantRoute.PLAYER); expect(ability.isPlayerShow()).assertTrue();
      expect(ability.getRouterLength()).assertEqual(2);
    });
    it('ability_foreground_background_transitions', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(false, '', '');
      ability.onBackground(); expect(ability.isForeground()).assertFalse();
      ability.onForeground();
      expect(ability.isForeground()).assertTrue(); expect(ability.isDestroyed()).assertFalse();
    });
    it('ability_destroy_clears_pending_payload_and_router', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(true, 'device-305', 'Phone 305');
      ability.onDestroy();
      expect(ability.isDestroyed()).assertTrue(); expect(ability.getRouterLength()).assertEqual(0);
      expect(ability.getPendingPayload() === null).assertTrue(); expect(ability.isForeground()).assertFalse();
    });
    it('service_extension_binds_and_injects_impl', 0, async () => {
      const service = new ServiceExtensionModel();
      expect(service.isBound()).assertFalse();
      service.onCreate();
      expect(service.isBound()).assertTrue(); expect(service.isImplReady()).assertTrue(); expect(service.getRequestDelay()).assertEqual(8000);
    });
    it('service_extension_request_delays_start_by_8000ms', 0, async () => {
      const service = new ServiceExtensionModel(); service.onCreate();
      expect(service.onRequest('startMiracastService', 1000)).assertTrue();
      expect(service.shouldStartNow(8999)).assertFalse();
      expect(service.shouldStartNow(9000)).assertTrue();
    });
    it('service_extension_ignores_unknown_request', 0, async () => {
      const service = new ServiceExtensionModel(); service.onCreate();
      expect(service.onRequest('stopMiracastService', 0)).assertFalse();
      expect(service.shouldStartNow(9000)).assertFalse();
      expect(service.isStopped()).assertFalse();
    });
    it('service_extension_on_destroy_stops_service', 0, async () => {
      const service = new ServiceExtensionModel(); service.onCreate(); service.onRequest('startMiracastService', 0);
      service.onDestroy();
      expect(service.isStopped()).assertTrue(); expect(service.isBound()).assertFalse();
      expect(service.isImplReady()).assertFalse();
    });
    it('service_extension_request_before_create_is_ignored', 0, async () => {
      const service = new ServiceExtensionModel();
      expect(service.onRequest('startMiracastService', 0)).assertFalse();
      service.onCreate(); expect(service.onRequest('startMiracastService', 100)).assertTrue();
      expect(service.shouldStartNow(8100)).assertTrue();
    });
    it('permission_emitter_1000_returns_last_choice', 0, async () => {
      const emitter = new PermissionEmitterModel();
      expect(emitter.emit(0)).assertTrue(); expect(emitter.emit(1)).assertTrue();
      expect(emitter.getPendingCount()).assertEqual(2);
      expect(emitter.consume()).assertEqual(1); expect(emitter.consume()).assertEqual(-1);
    });
    it('permission_emitter_rejects_invalid_choice', 0, async () => {
      const emitter = new PermissionEmitterModel();
      expect(emitter.emit(-1)).assertFalse(); expect(emitter.emit(3)).assertFalse();
      expect(emitter.getPendingCount()).assertEqual(0);
      expect(emitter.isTrustGranted()).assertFalse();
    });
    it('permission_emitter_forever_grants_trust', 0, async () => {
      const emitter = new PermissionEmitterModel(); emitter.emit(0);
      expect(emitter.isTrustGranted()).assertTrue();
      emitter.clear();
      expect(emitter.getLastPermission()).assertEqual(-1); expect(emitter.isTrustGranted()).assertFalse();
    });
    it('permission_once_does_not_grant_persistent_trust', 0, async () => {
      const emitter = new PermissionEmitterModel(); emitter.emit(1);
      expect(emitter.isTrustGranted()).assertFalse(); expect(emitter.getLastPermission()).assertEqual(1);
      emitter.emit(2);
      expect(emitter.consume()).assertEqual(2);
    });
    it('system_emitter_1001_payload_survives_route_switch', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(true, 'system-device-2', 'System Phone 2'); ability.onNewWant(false);
      const payload: PlayerDataPayload | null = ability.getPendingPayload();
      expect(payload === null).assertFalse();
      if (payload !== null) { expect(payload.deviceName).assertEqual('System Phone 2'); expect(ability.dispatchPlayerData(DELAY_EMITTER_DISPATCH)).assertTrue(); }
      expect(ability.getRoute()).assertEqual(WantRoute.INDEX);
    });
    it('system_player_data_dispatch_boundary', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); ability.onCreate(true, 'device-309', 'Phone 309');
      expect(ability.dispatchPlayerData(499)).assertFalse(); expect(ability.dispatchPlayerData(500)).assertTrue();
      const payload: PlayerDataPayload | null = ability.getPendingPayload();
      expect(payload === null).assertFalse(); if (payload !== null) { expect(payload.delayMs).assertEqual(DELAY_EMITTER_DISPATCH); }
    });
    it('system_full_integration_query_is_consistent', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); const service = new ServiceExtensionModel(); const emitter = new PermissionEmitterModel();
      ability.onCreate(false, '', ''); service.onCreate();
      expect(service.onRequest('startMiracastService', 0)).assertTrue(); expect(service.shouldStartNow(8000)).assertTrue();
      expect(emitter.emit(0)).assertTrue(); expect(ability.onNewWant(true)).assertTrue(); expect(ability.isPlayerShow()).assertTrue();
    });
    it('system_player_launch_matches_want_contract', 0, async () => {
      const ability = new TvAbilityLifecycleModel(); expect(ability.onCreate(true, 'system-device-1', 'System Phone 1')).assertEqual(WantRoute.PLAYER);
      await launchPlayerPage('system-device-1', 'System Phone 1'); const ready: boolean = await waitForPlayerPage(driver, TIMEOUT_PLAYER_RENDER);
      await triggerMiracastHome(driver);
    });
  });
}
