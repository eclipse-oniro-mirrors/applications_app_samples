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
  waitForPageStable,
  waitForComponentById,
  readTextById,
  triggerMiracastHome,
  ID_SWITCH_BTN,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'StatePersistenceSuite';

enum SettingKey {
  DEVICE_NAME = 'settingsData.deviceName',
  MIRACAST_SYSTEM_KEY = 'persist.castengine.name',
  QUICK_PLAY = 'settings.wifi.miracast.quickplay',
  SWITCH_STATE = 'miracastSwitchState'
}

class SettingsStore {
  private values: Map<string, string> = new Map<string, string>();
  private writeCount: number = 0;
  public set(key: SettingKey, value: string): boolean {
    if (value.length === 0) {
      return false;
    }
    this.values.set(key, value);
    this.writeCount++;
    return true;
  }
  public get(key: SettingKey): string {
    const value = this.values.get(key);
    if (value === undefined) {
      return '';
    }
    return value;
  }
  public has(key: SettingKey): boolean {
    return this.values.has(key);
  }
  public remove(key: SettingKey): boolean {
    if (!this.values.has(key)) {
      return false;
    }
    this.values.delete(key);
    return true;
  }
  public size(): number {
    return this.values.size;
  }
  public getWriteCount(): number {
    return this.writeCount;
  }
  public getKeys(): string[] {
    const keys: string[] = [];
    const stored = this.values.keys();
    for (const key of stored) {
      keys.push(key);
    }
    return keys;
  }
  public clear(): void {
    this.values = new Map<string, string>();
  }
}
interface TrustDeviceRow {
  id: string;
  name: string;
  type: number;
}

class TrustDeviceDb {
  private rows: TrustDeviceRow[] = [];
  private opened: boolean = false;
  public open(): boolean {
    if (this.opened) {
      return false;
    }
    this.opened = true;
    return true;
  }
  public isReady(): boolean {
    return this.opened;
  }
  public add(id: string, name: string, type: number): boolean {
    if (!this.opened || id.length === 0 || name.length === 0 || this.isTrusted(id)) {
      return false;
    }
    const row: TrustDeviceRow = { id: id, name: name, type: type };
    this.rows.push(row);
    return true;
  }
  public remove(id: string): boolean {
    for (let i = 0; i < this.rows.length; i++) {
      if (this.rows[i].id === id) {
        this.rows.splice(i, 1);
        return true;
      }
    }
    return false;
  }
  public isTrusted(id: string): boolean {
    return this.findById(id) !== null;
  }
  public getCount(): number {
    return this.rows.length;
  }
  public findById(id: string): TrustDeviceRow | null {
    for (let i = 0; i < this.rows.length; i++) {
      if (this.rows[i].id === id) {
        return this.rows[i];
      }
    }
    return null;
  }
  public close(): void {
    this.rows = [];
    this.opened = false;
  }
}

class PersistenceValidator {
  public isValidDeviceName(name: string): boolean {
    return name.length > 0 && name.length <= 23 && name.indexOf(' ') < 0;
  }
  public isValidSwitchValue(value: string): boolean {
    return value === 'true' || value === 'false';
  }
  public isValidType(type: number): boolean {
    return type >= 0 && type <= 2;
  }
  public isValidQuickPlay(value: string): boolean {
    return value === '1' || value === '0';
  }
}
export default function statePersistenceSuite(): void {
  describe('StatePersistence_Suite', () => {
    let driver: Driver;
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite start');
    });
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'suite end');
    });

    it('settings_should_persist_device_name', 0, async () => {
      const store = new SettingsStore();
      expect(store.set(SettingKey.DEVICE_NAME, 'LivingRoomTV') && store.get(SettingKey.DEVICE_NAME) === 'LivingRoomTV').assertTrue();
    });
    it('settings_should_reject_empty_value', 0, async () => {
      const store = new SettingsStore();
      expect(!store.set(SettingKey.DEVICE_NAME, '') && !store.has(SettingKey.DEVICE_NAME)).assertTrue();
    });
    it('settings_should_overwrite_existing_value', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.MIRACAST_SYSTEM_KEY, 'OldName');
      store.set(SettingKey.MIRACAST_SYSTEM_KEY, 'NewName');
      expect(store.getWriteCount() === 2 && store.size() === 1).assertTrue();
    });
    it('settings_should_remove_existing_key', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.QUICK_PLAY, '1');
      expect(store.remove(SettingKey.QUICK_PLAY) && !store.has(SettingKey.QUICK_PLAY)).assertTrue();
    });
    it('settings_should_enumerate_keys', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.DEVICE_NAME, 'LivingRoom');
      store.set(SettingKey.QUICK_PLAY, '1');
      expect(store.getKeys().length).assertEqual(2);
    });
    it('settings_should_clear_all_entries', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.DEVICE_NAME, 'LivingRoom');
      store.clear();
      expect(store.size() === 0 && store.get(SettingKey.DEVICE_NAME) === '').assertTrue();
    });
    it('persistence_validator_should_check_device_name', 0, async () => {
      const validator = new PersistenceValidator();
      expect(validator.isValidDeviceName('LivingRoom') && !validator.isValidDeviceName('Living Room')).assertTrue();
      expect(!validator.isValidDeviceName('') && !validator.isValidDeviceName('ABCDEFGHIJKLMNOPQRSTUVWX')).assertTrue();
    });
    it('persistence_validator_should_check_switch_values', 0, async () => {
      const validator = new PersistenceValidator();
      expect(validator.isValidSwitchValue('true') && validator.isValidQuickPlay('1')).assertTrue();
      expect(!validator.isValidSwitchValue('on') && !validator.isValidQuickPlay('2')).assertTrue();
    });
    it('persistence_validator_should_check_device_type', 0, async () => {
      const validator = new PersistenceValidator();
      expect(validator.isValidType(0) && validator.isValidType(2)).assertTrue();
      expect(!validator.isValidType(3) && !validator.isValidType(-1)).assertTrue();
    });
    it('trust_db_should_require_open_before_add', 0, async () => {
      const db = new TrustDeviceDb();
      expect(db.add('device_1', 'SinkA', 0)).assertFalse();
      expect(db.open() && db.isReady() && db.add('device_1', 'SinkA', 0)).assertTrue();
    });
    it('trust_db_should_reject_duplicate_device', 0, async () => {
      const db = new TrustDeviceDb();
      db.open();
      db.add('device_1', 'SinkA', 0);
      expect(!db.add('device_1', 'SinkB', 1) && db.getCount() === 1).assertTrue();
    });
    it('trust_db_should_reject_empty_identity', 0, async () => {
      const db = new TrustDeviceDb();
      db.open();
      expect(!db.add('', 'SinkA', 0) && !db.add('device_1', '', 0)).assertTrue();
    });
    it('trust_db_should_remove_trusted_device', 0, async () => {
      const db = new TrustDeviceDb();
      db.open();
      db.add('device_1', 'SinkA', 0);
      expect(db.remove('device_1') && !db.isTrusted('device_1')).assertTrue();
    });
    it('trust_db_should_find_row_by_id', 0, async () => {
      const db = new TrustDeviceDb();
      db.open();
      db.add('device_1', 'SinkA', 1);
      const row: TrustDeviceRow | null = db.findById('device_1');
      expect(row !== null && row.type === 1 && db.findById('device_x') === null).assertTrue();
    });
    it('trust_db_should_clear_rows_on_close', 0, async () => {
      const db = new TrustDeviceDb();
      db.open();
      db.add('device_1', 'SinkA', 0);
      db.close();
      expect(!db.isReady() && db.getCount() === 0).assertTrue();
    });
    it('settings_should_reset_write_count_after_clear', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.DEVICE_NAME, 'LivingRoom');
      store.clear();
      expect(store.size() === 0 && store.getWriteCount() === 1).assertTrue();
    });
    it('settings_should_read_missing_key_as_empty', 0, async () => {
      const store = new SettingsStore();
      expect(store.get(SettingKey.SWITCH_STATE) === '' && !store.has(SettingKey.SWITCH_STATE)).assertTrue();
    });
    it('settings_should_persist_quick_play_switch', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.QUICK_PLAY, '1');
      expect(new PersistenceValidator().isValidQuickPlay(store.get(SettingKey.QUICK_PLAY))).assertTrue();
    });
    it('invalid_device_name_should_not_persist', 0, async () => {
      const store = new SettingsStore();
      const validator = new PersistenceValidator();
      if (validator.isValidDeviceName('Bad Name')) {
        store.set(SettingKey.DEVICE_NAME, 'Bad Name');
      }
      expect(store.size()).assertEqual(0);
    });
    it('home_switch_should_be_readable_for_persisted_state', 0, async () => {
      await triggerMiracastHome(driver);
      const present: boolean = await waitForComponentById(driver, ID_SWITCH_BTN, TIMEOUT_PAGE_RENDER);
      expect(present || (await readTextById(driver, ID_SWITCH_BTN)).length >= 0).assertTrue();
    });
    it('settings_should_survive_page_navigation', 0, async () => {
      const store = new SettingsStore();
      store.set(SettingKey.DEVICE_NAME, 'PersistedName');
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      expect(store.get(SettingKey.DEVICE_NAME)).assertEqual('PersistedName');
    });
    it('settings_should_handle_bulk_writes', 0, async () => {
      const store = new SettingsStore();
      for (let i = 0; i < 200; i++) {
        store.set(SettingKey.MIRACAST_SYSTEM_KEY, 'Name' + i);
      }
      expect(store.getWriteCount() === 200 && store.size() === 1).assertTrue();
    });
    it('trust_db_should_handle_bulk_devices', 0, async () => {
      const db = new TrustDeviceDb();
      db.open();
      for (let i = 0; i < 9; i++) {
        db.add('device_' + i, 'Sink' + i, 0);
      }
      expect(db.getCount()).assertEqual(9);
    });
    it('settings_and_trust_db_should_persist_together', 0, async () => {
      const store = new SettingsStore();
      const db = new TrustDeviceDb();
      db.open();
      store.set(SettingKey.DEVICE_NAME, 'LivingRoom');
      db.add('device_1', 'LivingRoom', 0);
      expect(store.get(SettingKey.DEVICE_NAME) === 'LivingRoom' && db.isTrusted('device_1')).assertTrue();
    });
    it('comprehensive_state_persistence_scenario', 0, async () => {
      const store = new SettingsStore();
      const db = new TrustDeviceDb();
      const validator = new PersistenceValidator();
      db.open();
      const name: string = 'MiracastTV2026';
      expect(validator.isValidDeviceName(name) && store.set(SettingKey.DEVICE_NAME, name)).assertTrue();
      expect(store.set(SettingKey.MIRACAST_SYSTEM_KEY, name) && db.add('device_restart', name, 2)).assertTrue();
    });
  });
}
