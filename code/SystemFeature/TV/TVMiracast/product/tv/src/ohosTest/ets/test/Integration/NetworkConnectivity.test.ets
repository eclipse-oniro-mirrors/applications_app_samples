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
  getDriver, KEY_LEFT, KEY_RIGHT, miracastComponentCount, isIndexPageVisible, waitForPageStable,
  waitForServiceConnected, countComponentsById, pressAndWait, serializedDelay, triggerMiracastHome,
  safeBack, ID_SWITCH_BTN, TIMEOUT_PAGE_RENDER, DELAY_KEY_NAVIGATION, DELAY_SERVICE_RECONNECT
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'NetworkConnectivitySuite';

enum NetworkState {
  WIFI_ON = 'wifi_on',
  WIFI_OFF = 'wifi_off',
  SOFTBUS_UP = 'softbus_up',
  SOFTBUS_DOWN = 'softbus_down',
  DISCOVERING = 'discovering',
  DISCOVERY_TIMEOUT = 'discovery_timeout',
  CONNECTED = 'connected'
}

// 连接模型：复现 WiFi / softbus 开关、发现超时、重试预算与恢复路径
class ConnectivityModel {
  private wifiOn: boolean = true;
  private softbusUp: boolean = true;
  private state: NetworkState = NetworkState.WIFI_ON;
  private discovering: boolean = false;
  private startMs: number = 0;
  private attempts: number = 0;
  private found: boolean = false;
  public isWifiOn(): boolean { return this.wifiOn; }
  public isSoftbusUp(): boolean { return this.softbusUp; }
  public getState(): NetworkState { return this.state; }
  public setWifi(on: boolean): NetworkState {
    this.wifiOn = on;
    if (!on) { this.softbusUp = false; this.discovering = false; this.state = NetworkState.WIFI_OFF; return this.state; }
    this.state = NetworkState.WIFI_ON;
    return this.state;
  }
  public setSoftbus(up: boolean): NetworkState {
    if (!this.wifiOn) { this.softbusUp = false; this.discovering = false; this.state = NetworkState.WIFI_OFF; return this.state; }
    this.softbusUp = up;
    this.state = up ? NetworkState.SOFTBUS_UP : NetworkState.SOFTBUS_DOWN;
    return this.state;
  }
  public canDiscover(): boolean { return this.wifiOn && this.softbusUp; }
  public canCast(): boolean { return this.canDiscover() && this.found; }
  public beginDiscovery(nowMs: number): boolean {
    if (!this.canDiscover() || this.discovering) { return false; }
    this.discovering = true; this.startMs = nowMs; this.attempts = 0; this.state = NetworkState.DISCOVERING;
    return true;
  }
  public tick(nowMs: number, timeoutMs: number): NetworkState {
    if (this.discovering && nowMs - this.startMs >= timeoutMs) { this.discovering = false; this.state = NetworkState.DISCOVERY_TIMEOUT; }
    return this.state;
  }
  public onDeviceFound(): boolean {
    if (!this.discovering) { return false; }
    this.discovering = false; this.found = true; this.state = NetworkState.CONNECTED;
    return true;
  }
  public getDiscoveryElapsed(nowMs: number): number { return this.startMs === 0 ? 0 : nowMs - this.startMs; }
  public getAttempts(): number { return this.attempts; }
  public registerAttempt(): number { this.attempts++; return this.attempts; }
  public canRetry(): boolean { return this.attempts < 3; }
  public nextDelay(): number { return this.canRetry() ? 400 * (this.attempts + 1) : -1; }
  public isDiscovering(): boolean { return this.discovering; }
  public isDeviceFound(): boolean { return this.found; }
  public reset(): void {
    this.wifiOn = true; this.softbusUp = true; this.state = NetworkState.WIFI_ON;
    this.discovering = false; this.startMs = 0; this.attempts = 0; this.found = false;
  }
}

export default function networkConnectivitySuite(): void {
  describe('NetworkConnectivity_Suite', () => {
    let driver: Driver;
    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'network connectivity suite start');
      await waitForServiceConnected(driver);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_SERVICE_RECONNECT);
      Log.info(TAG, 'network connectivity suite end');
    });

    it('default_network_state_is_wifi_on', 0, async () => { const model = new ConnectivityModel(); expect(model.isWifiOn()).assertTrue(); expect(model.isSoftbusUp()).assertTrue(); expect(model.getState()).assertEqual(NetworkState.WIFI_ON); });
    it('wifi_off_blocks_discovery_and_casting', 0, async () => { const model = new ConnectivityModel(); expect(model.setWifi(false)).assertEqual(NetworkState.WIFI_OFF); expect(model.canDiscover()).assertFalse(); expect(model.canCast()).assertFalse(); expect(model.beginDiscovery(0)).assertFalse(); });
    it('softbus_down_blocks_discovery', 0, async () => { const model = new ConnectivityModel(); expect(model.setSoftbus(false)).assertEqual(NetworkState.SOFTBUS_DOWN); expect(model.canDiscover()).assertFalse(); expect(model.beginDiscovery(100)).assertFalse(); });
    it('softbus_up_restores_discovery', 0, async () => { const model = new ConnectivityModel(); model.setSoftbus(false); expect(model.setSoftbus(true)).assertEqual(NetworkState.SOFTBUS_UP); expect(model.beginDiscovery(200)).assertTrue(); expect(model.isDiscovering()).assertTrue(); });
    it('softbus_cannot_raise_while_wifi_is_off', 0, async () => { const model = new ConnectivityModel(); model.setWifi(false); expect(model.setSoftbus(true)).assertEqual(NetworkState.WIFI_OFF); expect(model.isSoftbusUp()).assertFalse(); });
    it('discovery_transitions_to_discovering', 0, async () => { const model = new ConnectivityModel(); expect(model.beginDiscovery(1000)).assertTrue(); expect(model.getState()).assertEqual(NetworkState.DISCOVERING); expect(model.getDiscoveryElapsed(1400)).assertEqual(400); });
    it('duplicate_discovery_start_is_rejected', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.beginDiscovery(50)).assertFalse(); expect(model.isDiscovering()).assertTrue(); });
    it('discovery_times_out_after_eight_seconds', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.tick(7999, 8000)).assertEqual(NetworkState.DISCOVERING); expect(model.tick(8000, 8000)).assertEqual(NetworkState.DISCOVERY_TIMEOUT); expect(model.isDiscovering()).assertFalse(); });
    it('discovery_timeout_before_deadline_is_noop', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(100); expect(model.tick(500, 8000)).assertEqual(NetworkState.DISCOVERING); expect(model.isDiscovering()).assertTrue(); });
    it('device_found_moves_state_to_connected', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.onDeviceFound()).assertTrue(); expect(model.getState()).assertEqual(NetworkState.CONNECTED); expect(model.isDeviceFound()).assertTrue(); expect(model.canCast()).assertTrue(); });
    it('device_found_without_discovery_is_rejected', 0, async () => { const model = new ConnectivityModel(); expect(model.onDeviceFound()).assertFalse(); expect(model.isDeviceFound()).assertFalse(); expect(model.canCast()).assertFalse(); });
    it('softbus_down_clears_casting_capability', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); model.onDeviceFound(); model.setSoftbus(false); expect(model.isDeviceFound()).assertTrue(); expect(model.canCast()).assertFalse(); expect(model.getState()).assertEqual(NetworkState.SOFTBUS_DOWN); });
    it('retry_budget_allows_three_attempts', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.canRetry()).assertTrue(); model.registerAttempt(); model.registerAttempt(); model.registerAttempt(); expect(model.getAttempts()).assertEqual(3); expect(model.canRetry()).assertFalse(); });
    it('retry_delay_grows_linearly', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.nextDelay()).assertEqual(400); model.registerAttempt(); expect(model.nextDelay()).assertEqual(800); model.registerAttempt(); expect(model.nextDelay()).assertEqual(1200); model.registerAttempt(); expect(model.nextDelay()).assertEqual(-1); });
    it('model_counts_retry_attempts', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.getAttempts()).assertEqual(0); expect(model.registerAttempt()).assertEqual(1); expect(model.registerAttempt()).assertEqual(2); });
    it('model_reset_restores_defaults', 0, async () => { const model = new ConnectivityModel(); model.setWifi(false); model.setSoftbus(false); model.reset(); expect(model.isWifiOn()).assertTrue(); expect(model.getState()).assertEqual(NetworkState.WIFI_ON); expect(model.isDeviceFound()).assertFalse(); });
    it('retry_then_success_recovers_casting', 0, async () => { const model = new ConnectivityModel(); model.beginDiscovery(0); expect(model.tick(8000, 8000)).assertEqual(NetworkState.DISCOVERY_TIMEOUT); model.registerAttempt(); expect(model.beginDiscovery(8400)).assertTrue(); expect(model.onDeviceFound()).assertTrue(); expect(model.canCast()).assertTrue(); });
    it('discovery_elapsed_is_zero_before_start', 0, async () => { const model = new ConnectivityModel(); expect(model.getDiscoveryElapsed(5000)).assertEqual(0); model.beginDiscovery(2000); expect(model.getDiscoveryElapsed(2500)).assertEqual(500); });
    it('network_off_on_round_trip_is_bounded', 0, async () => { const model = new ConnectivityModel(); for (let i = 0; i < 10; i++) { model.setWifi(false); model.setWifi(true); model.setSoftbus(true); } expect(model.isWifiOn()).assertTrue(); expect(model.getState()).assertEqual(NetworkState.SOFTBUS_UP); });
    it('network_recovery_after_full_restart', 0, async () => { const model = new ConnectivityModel(); model.setWifi(false); model.setWifi(true); model.setSoftbus(true); expect(model.beginDiscovery(0)).assertTrue(); expect(model.onDeviceFound()).assertTrue(); expect(model.getState()).assertEqual(NetworkState.CONNECTED); model.reset(); expect(model.canCast()).assertFalse(); });
  });
}
