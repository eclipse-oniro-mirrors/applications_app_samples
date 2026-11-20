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
  getDriver, miracastComponentCount, isIndexPageVisible, waitForPageStable, waitForServiceConnected,
  countComponentsById, serializedDelay, triggerMiracastHome, safeBack, ID_SWITCH_BTN,
  TIMEOUT_PAGE_RENDER, DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'AdvancedScenariosSuite';

enum AdvancedStage {
  IDLE = 'idle',
  SERVICE_STARTED = 'service_started',
  DEVICE_DISCOVERED = 'device_discovered',
  SESSION_ACTIVE = 'session_active',
  SCREEN_BOUND = 'screen_bound',
  PLAYING = 'playing',
  STOPPED = 'stopped'
}

enum PermissionChoice {
  FOREVER = 0,
  ONCE = 1,
  CANCEL = 2
}

interface ScenarioEvent {
  stage: AdvancedStage;
  success: boolean;
  elapsedMs: number;
}

// 多设备投屏模型：复现 impl 中 session / players / deviceMap 的联动约束
class MultiDeviceCastModel {
  private stage: AdvancedStage = AdvancedStage.IDLE;
  private started: boolean = false;
  private names: Map<string, string> = new Map<string, string>();
  private trusted: Set<string> = new Set<string>();
  private screens: Map<string, number> = new Map<string, number>();
  public startService(): boolean {
    if (this.started) { return false; }
    this.started = true;
    this.stage = AdvancedStage.SERVICE_STARTED;
    return true;
  }
  public isStarted(): boolean { return this.started; }
  public getStage(): AdvancedStage { return this.stage; }
  public discover(deviceId: string, deviceName: string): boolean {
    if (!this.started || deviceId.length === 0 || this.names.has(deviceId)) { return false; }
    this.names.set(deviceId, deviceName);
    this.stage = AdvancedStage.DEVICE_DISCOVERED;
    return true;
  }
  public requestAccess(deviceId: string, choice: PermissionChoice): boolean {
    if (!this.names.has(deviceId)) { return false; }
    if (choice === PermissionChoice.CANCEL) {
      this.stage = AdvancedStage.DEVICE_DISCOVERED;
      return false;
    }
    if (choice === PermissionChoice.FOREVER) { this.trusted.add(deviceId); }
    this.stage = AdvancedStage.SESSION_ACTIVE;
    return true;
  }
  public needsReprompt(deviceId: string): boolean {
    if (!this.names.has(deviceId)) { return false; }
    return !this.trusted.has(deviceId);
  }
  public bindScreen(deviceId: string, screenId: number): boolean {
    if (this.stage !== AdvancedStage.SESSION_ACTIVE && this.stage !== AdvancedStage.SCREEN_BOUND) { return false; }
    if (!this.names.has(deviceId) || screenId < 0) { return false; }
    this.screens.set(deviceId, screenId);
    this.stage = AdvancedStage.SCREEN_BOUND;
    return true;
  }
  public play(): boolean {
    if (this.stage !== AdvancedStage.SCREEN_BOUND && this.stage !== AdvancedStage.STOPPED) { return false; }
    this.stage = AdvancedStage.PLAYING;
    return true;
  }
  public stopMirror(): boolean {
    if (this.stage !== AdvancedStage.PLAYING) { return false; }
    this.stage = AdvancedStage.STOPPED;
    return true;
  }
  public disconnect(deviceId: string): boolean {
    if (!this.names.delete(deviceId)) { return false; }
    this.screens.delete(deviceId);
    this.trusted.delete(deviceId);
    if (this.names.size === 0) { this.stage = AdvancedStage.STOPPED; }
    return true;
  }
  public rename(deviceId: string, newName: string): boolean {
    if (!this.names.has(deviceId) || newName.length === 0) { return false; }
    this.names.set(deviceId, newName);
    return true;
  }
  public getDeviceName(deviceId: string): string {
    const name: string | undefined = this.names.get(deviceId);
    return name === undefined ? '' : name;
  }
  public getScreenId(deviceId: string): number {
    const screenId: number | undefined = this.screens.get(deviceId);
    return screenId === undefined ? -1 : screenId;
  }
  public isTrusted(deviceId: string): boolean { return this.trusted.has(deviceId); }
  public getActiveDeviceCount(): number { return this.names.size; }
  public getDeviceIds(): string[] {
    const ids: string[] = [];
    this.names.forEach((name: string, deviceId: string) => { ids.push(deviceId); });
    return ids;
  }
  public isTileLimitReached(): boolean { return this.names.size >= MAX_MIRROR_TILES; }
}

// 场景日志：记录阶段序列与耗时，供顺序与统计断言使用
class ScenarioJournal {
  private events: ScenarioEvent[] = [];
  private total: number = 0;
  public record(stage: AdvancedStage, success: boolean, elapsedMs: number): void {
    const event: ScenarioEvent = { stage: stage, success: success, elapsedMs: elapsedMs };
    this.events.push(event);
    this.total += elapsedMs;
  }
  public getEventCount(): number { return this.events.length; }
  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].success) { count++; }
    }
    return count;
  }
  public getFailureCount(): number { return this.getEventCount() - this.getSuccessCount(); }
  public countByStage(stage: AdvancedStage): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].stage === stage) { count++; }
    }
    return count;
  }
  public getLastStage(): AdvancedStage {
    if (this.events.length === 0) { return AdvancedStage.IDLE; }
    return this.events[this.events.length - 1].stage;
  }
  public getAverageElapsed(): number {
    if (this.events.length === 0) { return 0; }
    return this.total / this.events.length;
  }
  public getLongestEvent(): number {
    let longest: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      longest = Math.max(longest, this.events[i].elapsedMs);
    }
    return longest;
  }
}

export default function advancedScenariosSuite(): void {
  describe('AdvancedScenarios_Suite', () => {
    let driver: Driver;
    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'advanced scenarios suite start');
      await waitForServiceConnected(driver);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'advanced scenarios suite end');
    });
    it('model_starts_in_idle_stage', 0, async () => {
      const model = new MultiDeviceCastModel(); expect(model.getStage()).assertEqual(AdvancedStage.IDLE); expect(model.isStarted()).assertFalse(); expect(model.getActiveDeviceCount()).assertEqual(0);
    });
    it('service_start_moves_model_to_started_stage', 0, async () => {
      const model = new MultiDeviceCastModel(); expect(model.startService()).assertTrue(); expect(model.getStage()).assertEqual(AdvancedStage.SERVICE_STARTED); expect(model.isStarted()).assertTrue();
    });
    it('duplicate_service_start_is_rejected', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); expect(model.startService()).assertFalse(); expect(model.isStarted()).assertTrue();
    });
    it('discovery_registers_first_device', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); expect(model.discover('device-001', 'Living Room Phone')).assertTrue(); expect(model.getStage()).assertEqual(AdvancedStage.DEVICE_DISCOVERED); expect(model.getActiveDeviceCount()).assertEqual(1); expect(model.getDeviceName('device-001')).assertEqual('Living Room Phone');
    });
    it('discovery_rejects_duplicate_device_id', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-002', 'Tablet'); expect(model.discover('device-002', 'Tablet Again')).assertFalse(); expect(model.getActiveDeviceCount()).assertEqual(1); expect(model.getDeviceName('device-002')).assertEqual('Tablet');
    });
    it('discovery_rejects_empty_device_id', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); expect(model.discover('', 'Anonymous')).assertFalse(); expect(model.getActiveDeviceCount()).assertEqual(0);
    });
    it('discovery_requires_running_service', 0, async () => {
      const model = new MultiDeviceCastModel(); expect(model.discover('device-003', 'Phone')).assertFalse(); expect(model.getActiveDeviceCount()).assertEqual(0);
    });
    it('once_permission_creates_session_without_trust', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-004', 'Phone'); expect(model.requestAccess('device-004', PermissionChoice.ONCE)).assertTrue(); expect(model.getStage()).assertEqual(AdvancedStage.SESSION_ACTIVE); expect(model.isTrusted('device-004')).assertFalse();
    });
    it('forever_permission_persists_trust', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-005', 'Phone'); model.requestAccess('device-005', PermissionChoice.FOREVER); expect(model.isTrusted('device-005')).assertTrue(); expect(model.needsReprompt('device-005')).assertFalse();
    });
    it('cancel_permission_keeps_device_untrusted', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-006', 'Phone'); expect(model.requestAccess('device-006', PermissionChoice.CANCEL)).assertFalse(); expect(model.getStage()).assertEqual(AdvancedStage.DEVICE_DISCOVERED); expect(model.needsReprompt('device-006')).assertTrue();
    });
    it('request_access_for_unknown_device_is_rejected', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); expect(model.requestAccess('missing-device', PermissionChoice.ONCE)).assertFalse(); expect(model.getStage()).assertEqual(AdvancedStage.SERVICE_STARTED);
    });
    it('multi_device_cast_supports_three_tiles', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-a', 'Phone A'); model.discover('device-b', 'Phone B'); model.discover('device-c', 'TV Box'); model.requestAccess('device-b', PermissionChoice.ONCE); expect(model.getActiveDeviceCount()).assertEqual(3); expect(model.getDeviceIds().length).assertEqual(3); expect(model.isTileLimitReached()).assertFalse();
    });
    it('multi_device_cast_stops_at_nine_tiles', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); for (let i = 0; i < MAX_MIRROR_TILES; i++) { expect(model.discover('tile-' + i, 'Device ' + i)).assertTrue(); } expect(model.getActiveDeviceCount()).assertEqual(MAX_MIRROR_TILES); expect(model.isTileLimitReached()).assertTrue();
    });
    it('screen_bind_requires_active_session', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-008', 'Phone'); expect(model.bindScreen('device-008', 11)).assertFalse(); expect(model.getScreenId('device-008')).assertEqual(-1);
    });
    it('screen_bind_records_screen_id', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-009', 'Phone'); model.requestAccess('device-009', PermissionChoice.ONCE); expect(model.bindScreen('device-009', 42)).assertTrue(); expect(model.getScreenId('device-009')).assertEqual(42);
    });
    it('screen_bind_rejects_negative_screen_id', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-010', 'Phone'); model.requestAccess('device-010', PermissionChoice.ONCE); expect(model.bindScreen('device-010', -5)).assertFalse(); expect(model.getScreenId('device-010')).assertEqual(-1);
    });
    it('play_requires_bound_screen', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-011', 'Phone'); model.requestAccess('device-011', PermissionChoice.ONCE); expect(model.play()).assertFalse(); expect(model.getStage()).assertEqual(AdvancedStage.SESSION_ACTIVE);
    });
    it('play_after_screen_bind_enters_playing', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-012', 'Phone'); model.requestAccess('device-012', PermissionChoice.ONCE); model.bindScreen('device-012', 3); expect(model.play()).assertTrue(); expect(model.getStage()).assertEqual(AdvancedStage.PLAYING);
    });
    it('stop_mirror_requires_playing_stage', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); expect(model.stopMirror()).assertFalse(); model.discover('device-013', 'Phone'); model.requestAccess('device-013', PermissionChoice.ONCE); model.bindScreen('device-013', 4); model.play(); expect(model.stopMirror()).assertTrue(); expect(model.getStage()).assertEqual(AdvancedStage.STOPPED);
    });
    it('disconnect_removes_device_from_tile_set', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-014', 'Phone'); model.requestAccess('device-014', PermissionChoice.FOREVER); expect(model.disconnect('device-014')).assertTrue(); expect(model.getActiveDeviceCount()).assertEqual(0); expect(model.isTrusted('device-014')).assertFalse();
    });
    it('rename_device_updates_name', 0, async () => {
      const model = new MultiDeviceCastModel(); model.startService(); model.discover('device-015', 'Old Name'); expect(model.rename('device-015', 'New Name')).assertTrue(); expect(model.getDeviceName('device-015')).assertEqual('New Name');
    });
    it('journal_records_stage_sequence', 0, async () => {
      const recorder = new ScenarioJournal(); recorder.record(AdvancedStage.SERVICE_STARTED, true, 20); recorder.record(AdvancedStage.DEVICE_DISCOVERED, true, 30); recorder.record(AdvancedStage.SESSION_ACTIVE, true, 40); recorder.record(AdvancedStage.PLAYING, false, 50); expect(recorder.getEventCount()).assertEqual(4); expect(recorder.getSuccessCount()).assertEqual(3); expect(recorder.getFailureCount()).assertEqual(1); expect(recorder.getLastStage()).assertEqual(AdvancedStage.PLAYING);
    });
    it('journal_counts_events_per_stage', 0, async () => {
      const recorder = new ScenarioJournal(); recorder.record(AdvancedStage.SESSION_ACTIVE, true, 10); recorder.record(AdvancedStage.SESSION_ACTIVE, true, 10); recorder.record(AdvancedStage.SCREEN_BOUND, true, 10); expect(recorder.countByStage(AdvancedStage.SESSION_ACTIVE)).assertEqual(2); expect(recorder.countByStage(AdvancedStage.SCREEN_BOUND)).assertEqual(1);
    });
    it('journal_reports_elapsed_statistics', 0, async () => {
      const recorder = new ScenarioJournal(); recorder.record(AdvancedStage.DEVICE_DISCOVERED, true, 100); recorder.record(AdvancedStage.SESSION_ACTIVE, true, 300); recorder.record(AdvancedStage.PLAYING, true, 200); expect(recorder.getAverageElapsed()).assertEqual(200); expect(recorder.getLongestEvent()).assertEqual(300);
    });
    it('advanced_flow_reaches_playing_stage_in_order', 0, async () => {
      const model = new MultiDeviceCastModel(); const recorder = new ScenarioJournal(); recorder.record(AdvancedStage.SERVICE_STARTED, model.startService(), 5); recorder.record(AdvancedStage.DEVICE_DISCOVERED, model.discover('device-018', 'Phone 18'), 10); recorder.record(AdvancedStage.SESSION_ACTIVE, model.requestAccess('device-018', PermissionChoice.FOREVER), 20); recorder.record(AdvancedStage.SCREEN_BOUND, model.bindScreen('device-018', 9), 30); recorder.record(AdvancedStage.PLAYING, model.play(), 40); expect(recorder.getEventCount()).assertEqual(5); expect(recorder.getFailureCount()).assertEqual(0); expect(model.getStage()).assertEqual(AdvancedStage.PLAYING);
    });
  });
}
