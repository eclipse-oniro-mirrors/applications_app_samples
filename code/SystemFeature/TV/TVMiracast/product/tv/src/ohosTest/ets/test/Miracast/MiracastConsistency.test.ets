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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  miracastComponentCount,
  waitForPageStable,
  pressAndWait,
  triggerMiracastHome,
  isIndexPageVisible,
  serializedDelay,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  TOLERANCE_COMPONENT_COUNT,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { ConfigData, Log, MIRACAST_SETTINGS_KEY, PermissionType } from 'library';

const TAG: string = 'MiracastConsistencySuite';

enum CastDeviceState {
  CONNECTED = 0,
  DISCONNECTED = 1
}

enum SessionPhase {
  NONE = 'none',
  CREATED = 'created',
  PLAYING = 'playing',
  PAUSED = 'paused',
  RELEASED = 'released'
}

interface RemoteDeviceEntry {
  deviceId: string;
  deviceName: string;
  state: CastDeviceState;
  trusted: boolean;
}

class CastSessionConsistencyModel {
  private sessionPhase: SessionPhase = SessionPhase.NONE;
  private started: boolean = false;
  private devices: Map<string, RemoteDeviceEntry> = new Map<string, RemoteDeviceEntry>();
  private players: Map<string, number> = new Map<string, number>();

  public startService(): void {
    this.started = true;
  }

  public stopService(): void {
    this.started = false;
    this.sessionPhase = SessionPhase.NONE;
    this.players = new Map<string, number>();
  }

  public openSession(): boolean {
    if (!this.started || this.sessionPhase === SessionPhase.RELEASED) {
      return false;
    }
    this.sessionPhase = SessionPhase.CREATED;
    return true;
  }

  public addDevice(deviceId: string, deviceName: string, trusted: boolean): boolean {
    if (deviceId.length === 0 || this.devices.has(deviceId)) {
      return false;
    }
    const entry: RemoteDeviceEntry = {
      deviceId: deviceId,
      deviceName: deviceName,
      state: CastDeviceState.CONNECTED,
      trusted: trusted
    };
    this.devices.set(deviceId, entry);
    return true;
  }

  public disconnectDevice(deviceId: string): boolean {
    const entry: RemoteDeviceEntry | undefined = this.devices.get(deviceId);
    if (entry === undefined) {
      return false;
    }
    entry.state = CastDeviceState.DISCONNECTED;
    this.players.delete(deviceId);
    this.devices.delete(deviceId);
    if (this.devices.size === 0) {
      this.sessionPhase = SessionPhase.RELEASED;
    }
    return true;
  }

  public attachPlayer(deviceId: string, screenId: number): boolean {
    if (!this.devices.has(deviceId) || this.players.size >= MAX_MIRROR_TILES) {
      return false;
    }
    this.players.set(deviceId, screenId);
    return true;
  }

  public getDeviceCount(): number {
    return this.devices.size;
  }

  public getPlayerCount(): number {
    return this.players.size;
  }

  public getSessionPhase(): SessionPhase {
    return this.sessionPhase;
  }

  public isStarted(): boolean {
    return this.started;
  }

  public getDeviceState(deviceId: string): CastDeviceState {
    const entry: RemoteDeviceEntry | undefined = this.devices.get(deviceId);
    if (entry === undefined) {
      return CastDeviceState.DISCONNECTED;
    }
    return entry.state;
  }

  public isTrusted(deviceId: string): boolean {
    const entry: RemoteDeviceEntry | undefined = this.devices.get(deviceId);
    if (entry === undefined) {
      return false;
    }
    return entry.trusted;
  }

  public getDeviceIds(): string[] {
    const ids: string[] = [];
    this.devices.forEach((entry: RemoteDeviceEntry) => {
      ids.push(entry.deviceId);
    });
    return ids;
  }

  public getPlayerDeviceIds(): string[] {
    const ids: string[] = [];
    this.players.forEach((screenId: number, deviceId: string) => {
      ids.push(deviceId);
    });
    return ids;
  }

  public isPlayerDeviceConsistent(): boolean {
    const deviceIds: string[] = this.getDeviceIds();
    const playerIds: string[] = this.getPlayerDeviceIds();
    for (let i = 0; i < playerIds.length; i++) {
      if (!deviceIds.includes(playerIds[i])) {
        return false;
      }
    }
    return true;
  }

  public setPhase(phase: SessionPhase): void {
    this.sessionPhase = phase;
  }

  public reset(): void {
    this.sessionPhase = SessionPhase.NONE;
    this.started = false;
    this.devices = new Map<string, RemoteDeviceEntry>();
    this.players = new Map<string, number>();
  }
}

class MiracastEventNames {
  public static readonly PERMISSION_EVENT_ID: number = 1000;
  public static readonly PLAYER_DATA_EVENT_ID: number = 1001;
  public static readonly KEY_DEVICE_ID: string = 'deviceId';
  public static readonly KEY_DEVICE_NAME: string = 'deviceName';
  public static readonly SYSTEM_NAME_KEY: string = 'persist.castengine.name';
  public static readonly DEVICE_NAME_KEY: string = 'miracastName';
  public static readonly TRUST_TABLE: string = 'TrustDevice';
  public static readonly DB_NAME: string = 'MiraCast.db';
}

class PermissionResultMapper {
  public isTrustPersisted(permission: PermissionType): boolean {
    return permission === PermissionType.FOREVER;
  }

  public isSessionAllowed(permission: PermissionType): boolean {
    return permission === PermissionType.FOREVER || permission === PermissionType.ONCE;
  }

  public isCancelled(permission: PermissionType): boolean {
    return permission === PermissionType.CANCEL;
  }

  public toTrustFlag(permission: PermissionType): number {
    if (permission === PermissionType.FOREVER) {
      return 1;
    }
    if (permission === PermissionType.ONCE) {
      return 2;
    }
    return 0;
  }

  public describe(permission: PermissionType): string {
    if (permission === PermissionType.FOREVER) {
      return 'permission forever';
    }
    if (permission === PermissionType.ONCE) {
      return 'permission once';
    }
    return 'permission cancelled';
  }
}

class TrustDeviceRecordModel {
  private records: Map<string, string> = new Map<string, string>();

  public insert(deviceId: string, deviceName: string): boolean {
    if (deviceId.length === 0 || deviceName.length === 0) {
      return false;
    }
    if (this.records.has(deviceId)) {
      return false;
    }
    this.records.set(deviceId, deviceName);
    return true;
  }

  public remove(deviceId: string): boolean {
    if (!this.records.has(deviceId)) {
      return false;
    }
    this.records.delete(deviceId);
    return true;
  }

  public contains(deviceId: string): boolean {
    return this.records.has(deviceId);
  }

  public getName(deviceId: string): string {
    const name: string | undefined = this.records.get(deviceId);
    if (name === undefined) {
      return '';
    }
    return name;
  }

  public size(): number {
    return this.records.size;
  }

  public getIds(): string[] {
    const ids: string[] = [];
    this.records.forEach((name: string, deviceId: string) => {
      ids.push(deviceId);
    });
    return ids;
  }

  public clear(): void {
    this.records = new Map<string, string>();
  }
}

// 设备连接状态判定：把状态枚举比较收敛到一处
class DeviceStateValidator {
  public isConnected(state: CastDeviceState): boolean {
    return state === CastDeviceState.CONNECTED;
  }

  public isDisconnected(state: CastDeviceState): boolean {
    return state === CastDeviceState.DISCONNECTED;
  }
}

enum ConsistencyCheckType {
  STATE = 'state', KEY_SET = 'key_set', SEQUENCE = 'sequence'
}

enum ConsistencyResult {
  PASS = 'pass', FAIL = 'fail'
}

interface ConsistencyCheckEntry {
  checkType: ConsistencyCheckType;
  detail: string;
  result: ConsistencyResult;
}

class ConsistencyCheckRecorder {
  private checks: ConsistencyCheckEntry[] = [];

  public record(checkType: ConsistencyCheckType, detail: string, result: ConsistencyResult): void {
    this.checks.push({ checkType: checkType, detail: detail, result: result });
  }

  public getCountByType(checkType: ConsistencyCheckType): number {
    return this.checks.filter((entry: ConsistencyCheckEntry) => entry.checkType === checkType).length;
  }

  public getChecks(): ConsistencyCheckEntry[] {
    return [...this.checks];
  }
}

export default function miracastConsistencySuite(): void {
  describe('MiracastConsistency_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    it('device_count_should_match_device_list_length', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      model.addDevice('dev_1', 'Living Room TV', true);
      model.addDevice('dev_2', 'Bedroom Pad', false);
      expect(model.getDeviceCount()).assertEqual(2);
      expect(model.getDeviceIds().length).assertEqual(2);
      expect(model.isPlayerDeviceConsistent()).assertTrue();
    });

    it('device_state_should_be_connected_after_attach', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.addDevice('dev_state', 'State Device', false);
      expect(model.getDeviceState('dev_state')).assertEqual(CastDeviceState.CONNECTED);
      expect(model.getDeviceState('missing_device')).assertEqual(CastDeviceState.DISCONNECTED);
      const validator = new DeviceStateValidator();
      expect(validator.isConnected(model.getDeviceState('dev_state'))).assertTrue();
      expect(validator.isDisconnected(model.getDeviceState('missing_device'))).assertTrue();
    });

    it('disconnect_should_remove_device_and_player', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      model.addDevice('dev_drop', 'Drop Device', false);
      model.attachPlayer('dev_drop', 100);
      expect(model.getPlayerCount()).assertEqual(1);
      expect(model.disconnectDevice('dev_drop')).assertTrue();
      expect(model.getDeviceCount()).assertEqual(0);
      expect(model.getPlayerCount()).assertEqual(0);
      expect(model.isPlayerDeviceConsistent()).assertTrue();
      expect(model.disconnectDevice('dev_drop')).assertFalse();
    });

    it('session_should_release_after_last_device_leaves', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      expect(model.getSessionPhase()).assertEqual(SessionPhase.CREATED);
      model.addDevice('dev_last', 'Last Device', false);
      model.disconnectDevice('dev_last');
      expect(model.getSessionPhase()).assertEqual(SessionPhase.RELEASED);
      expect(model.openSession()).assertFalse();
    });

    it('session_should_require_service_start', 0, async () => {
      const model = new CastSessionConsistencyModel();
      expect(model.isStarted()).assertFalse();
      expect(model.openSession()).assertFalse();
      expect(model.getSessionPhase()).assertEqual(SessionPhase.NONE);
      model.startService();
      expect(model.isStarted()).assertTrue();
      expect(model.openSession()).assertTrue();
    });

    it('duplicate_device_id_should_be_rejected', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      expect(model.addDevice('dev_dup', 'Dup', false)).assertTrue();
      expect(model.addDevice('dev_dup', 'Dup Again', true)).assertFalse();
      expect(model.getDeviceCount()).assertEqual(1);
      expect(model.isTrusted('dev_dup')).assertFalse();
      expect(model.addDevice('', 'Empty', false)).assertFalse();
    });

    it('player_should_only_attach_to_known_device', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      expect(model.attachPlayer('ghost_device', 1)).assertFalse();
      model.addDevice('dev_player', 'Player Device', false);
      expect(model.attachPlayer('dev_player', 1)).assertTrue();
      expect(model.getPlayerCount()).assertEqual(1);
      expect(model.isPlayerDeviceConsistent()).assertTrue();
    });

    it('player_count_should_be_capped_at_nine', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      for (let i = 0; i < MAX_MIRROR_TILES; i++) {
        model.addDevice('grid_' + i, 'Grid ' + i, false);
        expect(model.attachPlayer('grid_' + i, i)).assertTrue();
      }
      expect(model.getPlayerCount()).assertEqual(MAX_MIRROR_TILES);
      model.addDevice('grid_overflow', 'Grid Overflow', false);
      expect(model.attachPlayer('grid_overflow', 99)).assertFalse();
    });

    it('stop_service_should_clear_players', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      model.addDevice('dev_stop', 'Stop Device', false);
      model.attachPlayer('dev_stop', 7);
      model.stopService();
      expect(model.isStarted()).assertFalse();
      expect(model.getPlayerCount()).assertEqual(0);
      expect(model.getSessionPhase()).assertEqual(SessionPhase.NONE);
      model.reset();
      expect(model.getDeviceCount()).assertEqual(0);
    });

    it('permission_forever_should_persist_trust', 0, async () => {
      const mapper = new PermissionResultMapper();
      expect(mapper.isTrustPersisted(PermissionType.FOREVER)).assertTrue();
      expect(mapper.isSessionAllowed(PermissionType.FOREVER)).assertTrue();
      expect(mapper.toTrustFlag(PermissionType.FOREVER)).assertEqual(1);
      expect(mapper.describe(PermissionType.FOREVER)).assertEqual('permission forever');
    });

    it('permission_once_should_not_persist_trust', 0, async () => {
      const mapper = new PermissionResultMapper();
      expect(mapper.isTrustPersisted(PermissionType.ONCE)).assertFalse();
      expect(mapper.isSessionAllowed(PermissionType.ONCE)).assertTrue();
      expect(mapper.toTrustFlag(PermissionType.ONCE)).assertEqual(2);
      expect(mapper.isCancelled(PermissionType.ONCE)).assertFalse();
    });

    it('permission_cancel_should_block_session', 0, async () => {
      const mapper = new PermissionResultMapper();
      expect(mapper.isCancelled(PermissionType.CANCEL)).assertTrue();
      expect(mapper.isSessionAllowed(PermissionType.CANCEL)).assertFalse();
      expect(mapper.isTrustPersisted(PermissionType.CANCEL)).assertFalse();
      expect(mapper.toTrustFlag(PermissionType.CANCEL)).assertEqual(0);
      expect(mapper.describe(PermissionType.CANCEL)).assertEqual('permission cancelled');
    });

    it('trust_record_should_reject_duplicate_insert', 0, async () => {
      const records = new TrustDeviceRecordModel();
      expect(records.insert('trust_1', 'Cherry TV')).assertTrue();
      expect(records.insert('trust_1', 'Cherry TV 2')).assertFalse();
      expect(records.size()).assertEqual(1);
      expect(records.getName('trust_1')).assertEqual('Cherry TV');
      expect(records.getName('trust_missing')).assertEqual('');
      expect(records.contains('trust_1')).assertTrue();
    });

    it('trust_record_should_delete_and_list', 0, async () => {
      const records = new TrustDeviceRecordModel();
      records.insert('trust_a', 'A');
      records.insert('trust_b', 'B');
      expect(records.getIds().length).assertEqual(2);
      expect(records.remove('trust_a')).assertTrue();
      expect(records.remove('trust_a')).assertFalse();
      expect(records.getIds().includes('trust_a')).assertFalse();
      expect(records.getIds().includes('trust_b')).assertTrue();
      records.clear();
      expect(records.size()).assertEqual(0);
    });

    it('trust_record_should_reject_invalid_entries', 0, async () => {
      const records = new TrustDeviceRecordModel();
      expect(records.insert('', 'No Id')).assertFalse();
      expect(records.insert('no_name', '')).assertFalse();
      expect(records.size()).assertEqual(0);
      expect(records.getIds().length).assertEqual(0);
    });

    it('event_names_should_be_consistent', 0, async () => {
      expect(MiracastEventNames.PERMISSION_EVENT_ID).assertEqual(1000);
      expect(MiracastEventNames.PLAYER_DATA_EVENT_ID).assertEqual(1001);
      expect(MiracastEventNames.KEY_DEVICE_ID).assertEqual('deviceId');
      expect(MiracastEventNames.KEY_DEVICE_NAME).assertEqual('deviceName');
      expect(MiracastEventNames.SYSTEM_NAME_KEY).assertEqual('persist.castengine.name');
      expect(MiracastEventNames.DEVICE_NAME_KEY).assertEqual('miracastName');
    });

    it('trust_store_names_should_be_consistent', 0, async () => {
      expect(MiracastEventNames.TRUST_TABLE).assertEqual('TrustDevice');
      expect(MiracastEventNames.DB_NAME).assertEqual('MiraCast.db');
      expect(MiracastEventNames.TRUST_TABLE.length).assertLarger(0);
      expect(MiracastEventNames.DB_NAME.includes('.db')).assertTrue();
    });

    it('quick_play_setting_key_should_match_library_constant', 0, async () => {
      expect(MIRACAST_SETTINGS_KEY).assertEqual('settings.wifi.miracast.quickplay');
      expect(ConfigData.SETTINGSDATA_DEVICE_NAME.length).assertLarger(0);
    });

    it('session_phase_should_be_mutually_exclusive', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      model.setPhase(SessionPhase.PLAYING);
      expect(model.getSessionPhase()).assertEqual(SessionPhase.PLAYING);
      model.setPhase(SessionPhase.PAUSED);
      expect(model.getSessionPhase()).assertEqual(SessionPhase.PAUSED);
      expect(model.getSessionPhase() === SessionPhase.PLAYING).assertFalse();
    });

    it('index_page_visibility_should_stay_consistent', 0, async () => {
      const visible: boolean = await isIndexPageVisible(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const beforeCount: number = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const afterCount: number = await miracastComponentCount(driver);
      expect(Math.abs(afterCount - beforeCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
    });

    it('permission_type_enum_should_match_mapper', 0, async () => {
      expect(PermissionType.FOREVER).assertEqual(0);
      expect(PermissionType.ONCE).assertEqual(1);
      expect(PermissionType.CANCEL).assertEqual(2);
      const mapper = new PermissionResultMapper();
      expect(mapper.isTrustPersisted(PermissionType.FOREVER)).assertTrue();
      expect(mapper.isSessionAllowed(PermissionType.CANCEL)).assertFalse();
    });

    it('session_model_reset_should_clear_all_state', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      model.addDevice('dev_reset', 'Reset Device', true);
      model.attachPlayer('dev_reset', 5);
      model.reset();
      expect(model.isStarted()).assertFalse();
      expect(model.getDeviceCount()).assertEqual(0);
      expect(model.getPlayerCount()).assertEqual(0);
      expect(model.getSessionPhase()).assertEqual(SessionPhase.NONE);
      expect(model.isPlayerDeviceConsistent()).assertTrue();
    });

    it('consistency_recorder_should_count_by_check_type', 0, async () => {
      const recorder = new ConsistencyCheckRecorder();
      recorder.record(ConsistencyCheckType.STATE, 'device connected', ConsistencyResult.PASS);
      recorder.record(ConsistencyCheckType.STATE, 'session created', ConsistencyResult.PASS);
      recorder.record(ConsistencyCheckType.KEY_SET, 'player keys subset', ConsistencyResult.FAIL);
      expect(recorder.getCountByType(ConsistencyCheckType.STATE)).assertEqual(2);
      expect(recorder.getCountByType(ConsistencyCheckType.KEY_SET)).assertEqual(1);
      expect(recorder.getCountByType(ConsistencyCheckType.SEQUENCE)).assertEqual(0);
      expect(recorder.getChecks().length).assertEqual(3);
    });

    it('released_session_should_reject_new_session', 0, async () => {
      const model = new CastSessionConsistencyModel();
      model.startService();
      model.openSession();
      model.addDevice('release_dev', 'Release Device', false);
      model.disconnectDevice('release_dev');
      expect(model.getSessionPhase()).assertEqual(SessionPhase.RELEASED);
      expect(model.openSession()).assertFalse();
      expect(model.addDevice('late_dev', 'Late Device', true)).assertTrue();
      expect(model.getDeviceCount()).assertEqual(1);
    });


  });
}
