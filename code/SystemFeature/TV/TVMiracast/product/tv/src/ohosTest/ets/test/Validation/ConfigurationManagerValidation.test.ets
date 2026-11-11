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
import { Log } from 'library';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  miracastComponentCount,
  pressAndWait,
  waitForPageStable,
  waitForComponentById,
  ID_SAVE_BTN,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';

const TAG: string = 'ConfigurationManagerSuite';

// Configuration value types stored by the miracast settings layer.
enum ConfigType {
  STRING = 'string',
  NUMBER = 'number',
  BOOLEAN = 'boolean',
  OBJECT = 'object'
}

// Panel position value used by the permission float window.
interface ConfigObjectValue {
  x?: number;
  y?: number;
  width?: number;
  height?: number;
}

// One stored configuration entry.
interface ConfigItem {
  key: string;
  value: string | number | boolean | ConfigObjectValue;
  type: ConfigType;
  lastModified: number;
}

// One change record, only updates of existing keys are recorded.
interface ConfigChangeRecord {
  key: string;
  oldValue: string | number | boolean | ConfigObjectValue;
  newValue: string | number | boolean | ConfigObjectValue;
  timestamp: number;
}

// Batch configuration item used by the initial setup path.
interface ConfigBatchItem {
  key: string;
  value: string | number | boolean | ConfigObjectValue;
  type: ConfigType;
}

// Configuration manager of the miracast settings layer.
class MiracastConfigurationManager {
  private static instance: MiracastConfigurationManager | null = null;
  private store: Map<string, ConfigItem> = new Map<string, ConfigItem>();
  private changeHistory: ConfigChangeRecord[] = [];

  public static getInstance(): MiracastConfigurationManager {
    if (MiracastConfigurationManager.instance === null) {
      MiracastConfigurationManager.instance = new MiracastConfigurationManager();
    }
    return MiracastConfigurationManager.instance;
  }

  public setConfig(key: string, value: string | number | boolean | ConfigObjectValue, type: ConfigType): void {
    const existing: ConfigItem | undefined = this.store.get(key);
    if (existing !== undefined) {
      this.changeHistory.push({ key: key, oldValue: existing.value, newValue: value, timestamp: Date.now() });
    }
    this.store.set(key, { key: key, value: value, type: type, lastModified: Date.now() });
  }

  public getConfig(key: string): ConfigItem | undefined {
    return this.store.get(key);
  }

  public getConfigValue(key: string): string | number | boolean | ConfigObjectValue | undefined {
    const item = this.store.get(key);
    if (item === undefined) {
      return undefined;
    }
    return item.value;
  }

  public getConfigString(key: string, fallback: string): string {
    const item = this.store.get(key);
    if (item === undefined || item.type !== ConfigType.STRING) {
      return fallback;
    }
    return item.value as string;
  }

  public getConfigNumber(key: string, fallback: number): number {
    const item = this.store.get(key);
    if (item === undefined || item.type !== ConfigType.NUMBER) {
      return fallback;
    }
    return item.value as number;
  }

  public deleteConfig(key: string): boolean {
    return this.store.delete(key);
  }

  public hasConfig(key: string): boolean {
    return this.store.has(key);
  }

  public getAllConfigs(): ConfigItem[] {
    const result: ConfigItem[] = [];
    for (const item of this.store.values()) {
      result.push(item);
    }
    return result;
  }

  public getConfigCount(): number {
    return this.store.size;
  }

  public clearAllConfigs(): void {
    this.store.clear();
    this.changeHistory = [];
  }

  public getChangeHistory(): ConfigChangeRecord[] {
    const result: ConfigChangeRecord[] = [];
    for (const record of this.changeHistory) {
      result.push(record);
    }
    return result;
  }

  public getKeyChangeHistory(key: string): ConfigChangeRecord[] {
    const result: ConfigChangeRecord[] = [];
    for (const record of this.changeHistory) {
      if (record.key === key) {
        result.push(record);
      }
    }
    return result;
  }

  public reset(): void {
    this.clearAllConfigs();
  }

  public batchSetConfigs(configs: ConfigBatchItem[]): number {
    let appliedCount: number = 0;
    for (const config of configs) {
      this.setConfig(config.key, config.value, config.type);
      appliedCount++;
    }
    return appliedCount;
  }

  public exportConfigs(): string {
    return JSON.stringify(this.getAllConfigs());
  }

  public importConfigs(jsonString: string): boolean {
    try {
      const parsed: ConfigItem[] = JSON.parse(jsonString) as ConfigItem[];
      if (parsed.length === 0) {
        return false;
      }
      for (const item of parsed) {
        this.setConfig(item.key, item.value, item.type);
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  public validateConfigType(key: string, expectedType: ConfigType): boolean {
    const item = this.store.get(key);
    if (item === undefined) {
      return false;
    }
    return item.type === expectedType;
  }

  public getConfigKeys(): string[] {
    const keys: string[] = [];
    for (const key of this.store.keys()) {
      keys.push(key);
    }
    return keys;
  }
}

// Validates the miracast device name edited on the change name page.
class DeviceNameConfigValidator {
  public static readonly MAX_NAME_LENGTH: number = 23;

  public isEmpty(name: string): boolean {
    return name.length === 0;
  }

  public isAllBlank(name: string): boolean {
    if (name.length === 0) {
      return true;
    }
    for (let i: number = 0; i < name.length; i++) {
      const code: number = name.charCodeAt(i);
      if (code !== 32 && code !== 9 && code !== 10 && code !== 13) {
        return false;
      }
    }
    return true;
  }

  public hasSpace(name: string): boolean {
    for (let i: number = 0; i < name.length; i++) {
      if (name.charCodeAt(i) === 32) {
        return true;
      }
    }
    return false;
  }

  public isTooLong(name: string): boolean {
    return name.length > DeviceNameConfigValidator.MAX_NAME_LENGTH;
  }

  public isLengthValid(name: string): boolean {
    return name.length >= 1 && name.length <= DeviceNameConfigValidator.MAX_NAME_LENGTH;
  }

  public isValid(name: string): boolean {
    if (this.isEmpty(name) || this.isAllBlank(name) || this.hasSpace(name)) {
      return false;
    }
    return this.isLengthValid(name);
  }

  public getRejectReason(name: string): string {
    if (this.isEmpty(name)) {
      return 'empty';
    }
    if (this.isAllBlank(name)) {
      return 'all_blank';
    }
    if (this.hasSpace(name)) {
      return 'contains_space';
    }
    if (this.isTooLong(name)) {
      return 'too_long';
    }
    return 'none';
  }
}

// Registry of the settings keys relevant to the miracast feature.
class SettingsKeyRegistry {
  public static readonly QUICK_PLAY_KEY: string = 'settings.wifi.miracast.quickplay';
  public static readonly SYSTEM_NAME_KEY: string = 'persist.castengine.name';
  public static readonly APP_NAME_KEY: string = 'miracastName';

  public getKnownKeys(): string[] {
    return [SettingsKeyRegistry.QUICK_PLAY_KEY, SettingsKeyRegistry.SYSTEM_NAME_KEY, SettingsKeyRegistry.APP_NAME_KEY];
  }

  // Classifies a settings key as system, app, quickplay or unknown.
  public getKeyKind(key: string): string {
    if (key === SettingsKeyRegistry.SYSTEM_NAME_KEY) {
      return 'system';
    }
    if (key === SettingsKeyRegistry.APP_NAME_KEY) {
      return 'app';
    }
    if (key === SettingsKeyRegistry.QUICK_PLAY_KEY) {
      return 'quickplay';
    }
    return 'unknown';
  }

  public isKnownKey(key: string): boolean {
    return this.getKeyKind(key) !== 'unknown';
  }
}

export default function configurationManagerValidationSuite(): void {
  describe('ConfigurationManagerValidation_Suite', () => {
    let driver: Driver;
    let manager: MiracastConfigurationManager;
    let nameValidator: DeviceNameConfigValidator;

    beforeAll(async () => {
      driver = getDriver();
      manager = MiracastConfigurationManager.getInstance();
      manager.reset();
      nameValidator = new DeviceNameConfigValidator();
      Log.info(TAG, 'suite start');
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      manager.reset();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      Log.info(TAG, 'suite end');
    });

    it('config_type_enum_should_define_expected_values', 0, async () => {
      expect(ConfigType.STRING).assertEqual('string');
      expect(ConfigType.NUMBER).assertEqual('number');
      expect(ConfigType.BOOLEAN).assertEqual('boolean');
      expect(ConfigType.OBJECT).assertEqual('object');
    });

    it('config_manager_initial_state_should_be_empty', 0, async () => {
      manager.reset();
      expect(manager.getConfigCount()).assertEqual(0);
      expect(manager.getAllConfigs().length).assertEqual(0);
      expect(manager.getConfigKeys().length).assertEqual(0);
      expect(manager.getChangeHistory().length).assertEqual(0);
    });

    it('device_name_setting_should_be_stored', 0, async () => {
      manager.reset();
      manager.setConfig('persist.castengine.name', 'LivingRoomTV', ConfigType.STRING);
      expect(manager.hasConfig('persist.castengine.name')).assertTrue();
      expect(manager.getConfigString('persist.castengine.name', '')).assertEqual('LivingRoomTV');
      expect(manager.validateConfigType('persist.castengine.name', ConfigType.STRING)).assertTrue();
      const item = manager.getConfig('persist.castengine.name');
      expect(item === undefined).assertFalse();
      expect(manager.getConfigString('missing', 'fallback')).assertEqual('fallback');
    });

    it('panel_position_object_should_be_stored', 0, async () => {
      manager.reset();
      const position: ConfigObjectValue = { x: 100, y: 200, width: 690, height: 590 };
      manager.setConfig('panel_position', position, ConfigType.OBJECT);
      const item = manager.getConfig('panel_position');
      expect(item === undefined).assertFalse();
      if (item !== undefined) {
        expect(item.type).assertEqual(ConfigType.OBJECT);
        const value = item.value as ConfigObjectValue;
        expect(value.width).assertEqual(690);
        expect(value.height).assertEqual(590);
      }
    });

    it('config_update_should_record_history', 0, async () => {
      manager.reset();
      manager.setConfig('miracastName', 'TV1', ConfigType.STRING);
      manager.setConfig('miracastName', 'TV2', ConfigType.STRING);
      manager.setConfig('panel_width', 100, ConfigType.NUMBER);
      manager.setConfig('panel_width', 690, ConfigType.NUMBER);
      const history = manager.getKeyChangeHistory('miracastName');
      expect(history.length).assertEqual(1);
      expect(history[0].oldValue).assertEqual('TV1');
      expect(history[0].newValue).assertEqual('TV2');
      expect(manager.getKeyChangeHistory('panel_width').length).assertEqual(1);
      expect(manager.getChangeHistory().length).assertEqual(2);
    });

    it('first_set_should_not_record_history', 0, async () => {
      manager.reset();
      manager.setConfig('miracastName', 'TV1', ConfigType.STRING);
      expect(manager.getChangeHistory().length).assertEqual(0);
      expect(manager.getConfigCount()).assertEqual(1);
    });

    it('config_deletion_should_work', 0, async () => {
      manager.reset();
      manager.setConfig('temp_key', 'temp', ConfigType.STRING);
      expect(manager.deleteConfig('temp_key')).assertTrue();
      expect(manager.hasConfig('temp_key')).assertFalse();
      expect(manager.deleteConfig('temp_key')).assertFalse();
      manager.setConfig('kept', 'A', ConfigType.STRING);
      manager.setConfig('kept', 'B', ConfigType.STRING);
      manager.deleteConfig('kept');
      expect(manager.getChangeHistory().length).assertEqual(1);
      expect(manager.getConfigCount()).assertEqual(0);
    });

    it('batch_config_setting_should_apply_all_items', 0, async () => {
      manager.reset();
      const first: ConfigBatchItem = { key: 'miracastName', value: 'TV1', type: ConfigType.STRING };
      const second: ConfigBatchItem = {
        key: 'settings.wifi.miracast.quickplay',
        value: false,
        type: ConfigType.BOOLEAN
      };
      const third: ConfigBatchItem = { key: 'panel_width', value: 690, type: ConfigType.NUMBER };
      expect(manager.batchSetConfigs([first, second, third])).assertEqual(3);
      expect(manager.getConfigCount()).assertEqual(3);
      expect(manager.getConfigString('miracastName', '')).assertEqual('TV1');
      expect(manager.getConfigNumber('panel_width', 0)).assertEqual(690);
      expect(manager.getConfigNumber('missing_width', 42)).assertEqual(42);
      expect(manager.getConfigValue('settings.wifi.miracast.quickplay')).assertFalse();
    });

    it('config_export_import_should_round_trip', 0, async () => {
      manager.reset();
      manager.setConfig('miracastName', 'LivingRoomTV', ConfigType.STRING);
      manager.setConfig('panel_width', 690, ConfigType.NUMBER);
      const exported: string = manager.exportConfigs();
      expect(exported.length).assertLarger(0);
      manager.reset();
      expect(manager.getConfigCount()).assertEqual(0);
      expect(manager.importConfigs(exported)).assertTrue();
      expect(manager.getConfigCount()).assertEqual(2);
      expect(manager.getConfigString('miracastName', '')).assertEqual('LivingRoomTV');
    });

    it('invalid_json_import_should_return_false', 0, async () => {
      manager.reset();
      expect(manager.importConfigs('invalid json')).assertFalse();
      expect(manager.importConfigs('{key: value}')).assertFalse();
      expect(manager.importConfigs('')).assertFalse();
      expect(manager.importConfigs('[]')).assertFalse();
      expect(manager.getConfigCount()).assertEqual(0);
    });

    it('config_clear_should_remove_everything', 0, async () => {
      manager.reset();
      manager.setConfig('miracastName', 'A', ConfigType.STRING);
      manager.setConfig('miracastName', 'B', ConfigType.STRING);
      expect(manager.getConfigCount()).assertEqual(1);
      manager.clearAllConfigs();
      expect(manager.getConfigCount()).assertEqual(0);
      expect(manager.getConfigKeys().length).assertEqual(0);
      expect(manager.getChangeHistory().length).assertEqual(0);
    });

    it('config_manager_singleton_should_return_same_instance', 0, async () => {
      const first: MiracastConfigurationManager = MiracastConfigurationManager.getInstance();
      const second: MiracastConfigurationManager = MiracastConfigurationManager.getInstance();
      expect(first === second).assertTrue();
      first.reset();
      first.setConfig('miracastName', 'SharedTV', ConfigType.STRING);
      expect(second.getConfigString('miracastName', '')).assertEqual('SharedTV');
    });

    it('config_manager_performance_should_meet_budget', 0, async () => {
      manager.reset();
      const startedAt: number = Date.now();
      for (let i: number = 0; i < 2000; i++) {
        manager.setConfig('key_' + String(i), 'value_' + String(i), ConfigType.STRING);
      }
      expect(Date.now() - startedAt).assertLessOrEqual(5000);
      expect(manager.getConfigCount()).assertEqual(2000);
      manager.reset();
      expect(manager.getConfigCount()).assertEqual(0);
    });

    it('device_name_empty_should_be_rejected', 0, async () => {
      expect(nameValidator.isEmpty('')).assertTrue();
      expect(nameValidator.isValid('')).assertFalse();
      expect(nameValidator.getRejectReason('')).assertEqual('empty');
      expect(nameValidator.isLengthValid('')).assertFalse();
    });

    it('device_name_all_blank_should_be_rejected', 0, async () => {
      expect(nameValidator.isAllBlank('   ')).assertTrue();
      expect(nameValidator.isAllBlank('\t\t')).assertTrue();
      expect(nameValidator.isAllBlank(' A ')).assertFalse();
      expect(nameValidator.isValid('   ')).assertFalse();
      expect(nameValidator.isValid('\n')).assertFalse();
      expect(nameValidator.getRejectReason('\t')).assertEqual('all_blank');
    });

    it('device_name_with_space_should_be_rejected', 0, async () => {
      expect(nameValidator.hasSpace('Living Room')).assertTrue();
      expect(nameValidator.hasSpace('LivingRoom')).assertFalse();
      expect(nameValidator.isValid('Living Room')).assertFalse();
      expect(nameValidator.isValid(' TV')).assertFalse();
      expect(nameValidator.isValid('TV ')).assertFalse();
      expect(nameValidator.getRejectReason(' TV')).assertEqual('contains_space');
    });

    it('device_name_23_chars_should_be_accepted', 0, async () => {
      const name23: string = 'a'.repeat(23);
      expect(nameValidator.isLengthValid(name23)).assertTrue();
      expect(nameValidator.isTooLong(name23)).assertFalse();
      expect(nameValidator.isValid(name23)).assertTrue();
      expect(nameValidator.getRejectReason(name23)).assertEqual('none');
    });

    it('device_name_24_chars_should_be_rejected', 0, async () => {
      const name24: string = 'b'.repeat(24);
      expect(nameValidator.isTooLong(name24)).assertTrue();
      expect(nameValidator.isLengthValid(name24)).assertFalse();
      expect(nameValidator.isValid(name24)).assertFalse();
      expect(nameValidator.getRejectReason(name24)).assertEqual('too_long');
    });

    it('device_name_boundary_should_use_23_limit', 0, async () => {
      expect(DeviceNameConfigValidator.MAX_NAME_LENGTH).assertEqual(23);
      expect(nameValidator.isValid('a'.repeat(22))).assertTrue();
      expect(nameValidator.isValid('a'.repeat(23))).assertTrue();
      expect(nameValidator.isValid('a'.repeat(24))).assertFalse();
      expect(nameValidator.isValid('a'.repeat(64))).assertFalse();
    });

    it('settings_key_registry_should_expose_known_keys', 0, async () => {
      const registry = new SettingsKeyRegistry();
      expect(SettingsKeyRegistry.QUICK_PLAY_KEY).assertEqual('settings.wifi.miracast.quickplay');
      expect(SettingsKeyRegistry.SYSTEM_NAME_KEY).assertEqual('persist.castengine.name');
      expect(SettingsKeyRegistry.APP_NAME_KEY).assertEqual('miracastName');
      expect(registry.isKnownKey('miracastName')).assertTrue();
      expect(registry.isKnownKey('unknown.key')).assertFalse();
      expect(registry.getKnownKeys().length).assertEqual(3);
    });

    it('settings_key_registry_should_classify_keys', 0, async () => {
      const registry = new SettingsKeyRegistry();
      expect(registry.getKeyKind('persist.castengine.name')).assertEqual('system');
      expect(registry.getKeyKind('miracastName')).assertEqual('app');
      expect(registry.getKeyKind('settings.wifi.miracast.quickplay')).assertEqual('quickplay');
      expect(registry.getKeyKind('miracast.name')).assertEqual('unknown');
      expect(registry.getKnownKeys()[2]).assertEqual('miracastName');
    });

    it('device_name_config_should_round_trip_through_manager', 0, async () => {
      manager.reset();
      const candidate: string = 'a'.repeat(23);
      expect(nameValidator.isValid(candidate)).assertTrue();
      manager.setConfig('miracastName', candidate, ConfigType.STRING);
      expect(manager.getConfigString('miracastName', '')).assertEqual(candidate);
      expect(nameValidator.isValid(manager.getConfigString('miracastName', ''))).assertTrue();
      expect(nameValidator.isValid('Living Room')).assertFalse();
      expect(manager.getConfigCount()).assertEqual(1);
    });


    it('unknown_key_lookup_should_return_undefined_semantics', 0, async () => {
      manager.reset();
      expect(manager.getConfig('missing') === undefined).assertTrue();
      expect(manager.hasConfig('missing')).assertFalse();
      expect(manager.getConfigString('missing', 'default')).assertEqual('default');
      expect(manager.getConfigNumber('missing', 7)).assertEqual(7);
      expect(manager.validateConfigType('missing', ConfigType.STRING)).assertFalse();
    });

    it('history_should_return_copy', 0, async () => {
      manager.reset();
      manager.setConfig('miracastName', 'A', ConfigType.STRING);
      manager.setConfig('miracastName', 'B', ConfigType.STRING);
      const historyA = manager.getChangeHistory();
      historyA.push({ key: 'fake', oldValue: 'x', newValue: 'y', timestamp: 0 });
      expect(manager.getChangeHistory().length).assertEqual(1);
      expect(manager.getChangeHistory()[0].key).assertEqual('miracastName');
    });

  });
}
