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

import { describe, it, expect } from '@ohos/hypium';

const SCOPE_GLOBAL: string = 'global';

const SCOPE_PAGE: string = 'page';

const SCOPE_TEMP: string = 'temp';

const TYPE_STRING: string = 'string';

const TYPE_NUMBER: string = 'number';

const TYPE_BOOLEAN: string = 'boolean';

const MAX_KEY_LENGTH: number = 64;

const MAX_VALUE_LENGTH: number = 1024;

interface ConfigEntry {
  key: string;
  value: string;
  type: string;
  scope: string;
}

interface ConfigSnapshot {
  entries: ConfigEntry[];
  version: number;
}

// Validates configuration keys, values and scopes
class ConfigValidator {
  public static isKeyValid(key: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z][A-Za-z0-9_.]*$');
    return key.length > 0 && key.length <= MAX_KEY_LENGTH && pattern.test(key);
  }

  public static isValueValid(value: string): boolean {
    return value.length <= MAX_VALUE_LENGTH && value.indexOf('\r') < 0;
  }

  public static isScopeValid(scope: string): boolean {
    return scope === SCOPE_GLOBAL || scope === SCOPE_PAGE || scope === SCOPE_TEMP;
  }

  public static isTypeValid(type: string): boolean {
    return type === TYPE_STRING || type === TYPE_NUMBER || type === TYPE_BOOLEAN;
  }

  public static validate(entry: ConfigEntry): string[] {
    const issues: string[] = [];
    if (!ConfigValidator.isKeyValid(entry.key)) {
      issues.push('key');
    }
    if (!ConfigValidator.isValueValid(entry.value)) {
      issues.push('value');
    }
    if (!ConfigValidator.isScopeValid(entry.scope)) {
      issues.push('scope');
    }
    if (!ConfigValidator.isTypeValid(entry.type)) {
      issues.push('type');
    }
    return issues;
  }
}

// Stores scoped configuration values with typed accessors
class ConfigurationManager {
  private entries: Map<string, ConfigEntry> = new Map<string, ConfigEntry>();
  private version: number = 0;

  public set(entry: ConfigEntry): boolean {
    if (ConfigValidator.validate(entry).length > 0) {
      return false;
    }
    if (this.entries.has(entry.key)) {
      const existing = this.entries.get(entry.key) as ConfigEntry;
      if (existing.type !== entry.type) {
        return false;
      }
    }
    this.entries.set(entry.key, {
      key: entry.key,
      value: entry.value,
      type: entry.type,
      scope: entry.scope
    });
    this.version++;
    return true;
  }

  public get(key: string): string {
    const entry = this.entries.get(key);
    return entry === undefined ? '' : entry.value;
  }

  public getNumber(key: string): number {
    const value = this.get(key);
    return value.length === 0 ? 0 : Number(value);
  }

  public getBoolean(key: string): boolean {
    return this.get(key) === 'true';
  }

  public has(key: string): boolean {
    return this.entries.has(key);
  }

  public remove(key: string): boolean {
    const removed = this.entries.delete(key);
    if (removed) {
      this.version++;
    }
    return removed;
  }

  public size(): number {
    return this.entries.size;
  }

  public keysInScope(scope: string): string[] {
    const result: string[] = [];
    this.entries.forEach((entry: ConfigEntry) => {
      if (entry.scope === scope) {
        result.push(entry.key);
      }
    });
    return result;
  }

  public clearScope(scope: string): number {
    const keys = this.keysInScope(scope);
    for (let i = 0; i < keys.length; i++) {
      this.entries.delete(keys[i]);
    }
    if (keys.length > 0) {
      this.version++;
    }
    return keys.length;
  }

  public snapshot(): ConfigSnapshot {
    const entries: ConfigEntry[] = [];
    this.entries.forEach((entry: ConfigEntry) => {
      entries.push({
        key: entry.key,
        value: entry.value,
        type: entry.type,
        scope: entry.scope
      });
    });
    return { entries: entries, version: this.version };
  }

  public restore(snapshot: ConfigSnapshot): number {
    this.entries = new Map<string, ConfigEntry>();
    let restored: number = 0;
    for (let i = 0; i < snapshot.entries.length; i++) {
      const entry = snapshot.entries[i];
      if (ConfigValidator.validate(entry).length === 0) {
        this.entries.set(entry.key, entry);
        restored++;
      }
    }
    this.version = snapshot.version;
    return restored;
  }

  public getVersion(): number {
    return this.version;
  }

  public reset(): void {
    this.entries = new Map<string, ConfigEntry>();
    this.version = 0;
  }
}

// Notifies observers about configuration changes
class ConfigChangeObserver {
  private observers: Map<string, number> = new Map<string, number>();
  private notifications: number = 0;

  public subscribe(id: string): boolean {
    if (id.length === 0 || this.observers.has(id)) {
      return false;
    }
    this.observers.set(id, 0);
    return true;
  }

  public unsubscribe(id: string): boolean {
    return this.observers.delete(id);
  }

  public notify(key: string): number {
    let delivered: number = 0;
    this.observers.forEach((count: number, id: string) => {
      this.observers.set(id, count + 1);
      delivered++;
    });
    this.notifications++;
    return delivered;
  }

  public countOf(id: string): number {
    const count = this.observers.get(id);
    return count === undefined ? 0 : count;
  }

  public size(): number {
    return this.observers.size;
  }

  public getNotifications(): number {
    return this.notifications;
  }

  public reset(): void {
    this.observers = new Map<string, number>();
    this.notifications = 0;
  }
}

// Merges page-level overrides over global configuration
class ConfigMerger {
  public static merge(global: ConfigEntry[], page: ConfigEntry[]): ConfigEntry[] {
    const merged: Map<string, ConfigEntry> = new Map<string, ConfigEntry>();
    for (let i = 0; i < global.length; i++) {
      merged.set(global[i].key, global[i]);
    }
    for (let i = 0; i < page.length; i++) {
      merged.set(page[i].key, page[i]);
    }
    const result: ConfigEntry[] = [];
    merged.forEach((entry: ConfigEntry) => {
      result.push(entry);
    });
    return result;
  }

  public static overrideCount(global: ConfigEntry[], page: ConfigEntry[]): number {
    let count: number = 0;
    for (let i = 0; i < page.length; i++) {
      for (let j = 0; j < global.length; j++) {
        if (page[i].key === global[j].key) {
          count++;
          break;
        }
      }
    }
    return count;
  }
}

export default function configurationManagerValidationTest() {
  describe('ConfigurationManagerValidation_Test', () => {

    it('validator_should_check_keys', 0, () => {
      expect(ConfigValidator.isKeyValid('app.baseUrl')).assertTrue();
      expect(ConfigValidator.isKeyValid('page_1.size')).assertTrue();
      expect(ConfigValidator.isKeyValid('1bad')).assertFalse();
      expect(ConfigValidator.isKeyValid('has space')).assertFalse();
      expect(ConfigValidator.isKeyValid('')).assertFalse();
      expect(ConfigValidator.isKeyValid('a'.repeat(MAX_KEY_LENGTH + 1))).assertFalse();
    });

    it('validator_should_check_values_and_scopes', 0, () => {
      expect(ConfigValidator.isValueValid('value')).assertTrue();
      expect(ConfigValidator.isValueValid('a'.repeat(MAX_VALUE_LENGTH))).assertTrue();
      expect(ConfigValidator.isValueValid('a'.repeat(MAX_VALUE_LENGTH + 1))).assertFalse();
      expect(ConfigValidator.isValueValid('line\rbreak')).assertFalse();
      expect(ConfigValidator.isScopeValid(SCOPE_GLOBAL)).assertTrue();
      expect(ConfigValidator.isScopeValid(SCOPE_PAGE)).assertTrue();
      expect(ConfigValidator.isScopeValid('unknown')).assertFalse();
    });

    it('validator_should_check_types', 0, () => {
      expect(ConfigValidator.isTypeValid(TYPE_STRING)).assertTrue();
      expect(ConfigValidator.isTypeValid(TYPE_NUMBER)).assertTrue();
      expect(ConfigValidator.isTypeValid(TYPE_BOOLEAN)).assertTrue();
      expect(ConfigValidator.isTypeValid('object')).assertFalse();
      expect(ConfigValidator.validate({
        key: 'bad key', value: '', type: 'object', scope: 'unknown'
      }).length).assertEqual(3);
    });

    it('manager_should_set_and_get', 0, () => {
      const manager = new ConfigurationManager();
      expect(manager.set({
        key: 'app.baseUrl', value: 'http://host/', type: TYPE_STRING, scope: SCOPE_GLOBAL
      })).assertTrue();
      expect(manager.get('app.baseUrl')).assertEqual('http://host/');
      expect(manager.has('app.baseUrl')).assertTrue();
      expect(manager.size()).assertEqual(1);
      expect(manager.getVersion()).assertEqual(1);
      expect(manager.get('missing')).assertEqual('');
    });

    it('manager_should_reject_invalid_entries', 0, () => {
      const manager = new ConfigurationManager();
      expect(manager.set({
        key: '', value: 'v', type: TYPE_STRING, scope: SCOPE_GLOBAL
      })).assertFalse();
      expect(manager.set({
        key: 'k', value: 'v', type: 'object', scope: SCOPE_GLOBAL
      })).assertFalse();
      expect(manager.set({
        key: 'k', value: 'v', type: TYPE_STRING, scope: 'unknown'
      })).assertFalse();
      expect(manager.size()).assertEqual(0);
      expect(manager.getVersion()).assertEqual(0);
    });

    it('manager_should_block_type_change', 0, () => {
      const manager = new ConfigurationManager();
      manager.set({ key: 'timeout', value: '30', type: TYPE_NUMBER, scope: SCOPE_GLOBAL });
      expect(manager.set({
        key: 'timeout', value: '60', type: TYPE_NUMBER, scope: SCOPE_GLOBAL
      })).assertTrue();
      expect(manager.getNumber('timeout')).assertEqual(60);
      expect(manager.set({
        key: 'timeout', value: 'true', type: TYPE_BOOLEAN, scope: SCOPE_GLOBAL
      })).assertFalse();
      expect(manager.getVersion()).assertEqual(2);
    });

    it('manager_should_read_typed_values', 0, () => {
      const manager = new ConfigurationManager();
      manager.set({ key: 'enabled', value: 'true', type: TYPE_BOOLEAN, scope: SCOPE_GLOBAL });
      manager.set({ key: 'limit', value: '4', type: TYPE_NUMBER, scope: SCOPE_GLOBAL });
      expect(manager.getBoolean('enabled')).assertTrue();
      expect(manager.getBoolean('limit')).assertFalse();
      expect(manager.getNumber('limit')).assertEqual(4);
      expect(manager.getNumber('missing')).assertEqual(0);
    });

    it('manager_should_remove_and_clear_scope', 0, () => {
      const manager = new ConfigurationManager();
      manager.set({ key: 'a', value: '1', type: TYPE_STRING, scope: SCOPE_GLOBAL });
      manager.set({ key: 'b', value: '2', type: TYPE_STRING, scope: SCOPE_PAGE });
      manager.set({ key: 'c', value: '3', type: TYPE_STRING, scope: SCOPE_PAGE });
      expect(manager.keysInScope(SCOPE_PAGE).length).assertEqual(2);
      expect(manager.clearScope(SCOPE_PAGE)).assertEqual(2);
      expect(manager.size()).assertEqual(1);
      expect(manager.remove('a')).assertTrue();
      expect(manager.remove('a')).assertFalse();
      expect(manager.size()).assertEqual(0);
    });

    it('manager_should_snapshot_and_restore', 0, () => {
      const manager = new ConfigurationManager();
      manager.set({ key: 'a', value: '1', type: TYPE_STRING, scope: SCOPE_GLOBAL });
      manager.set({ key: 'b', value: '2', type: TYPE_NUMBER, scope: SCOPE_PAGE });
      const snapshot = manager.snapshot();
      expect(snapshot.entries.length).assertEqual(2);
      expect(snapshot.version).assertEqual(2);
      manager.reset();
      expect(manager.size()).assertEqual(0);
      expect(manager.restore(snapshot)).assertEqual(2);
      expect(manager.get('a')).assertEqual('1');
      expect(manager.getNumber('b')).assertEqual(2);
      expect(manager.getVersion()).assertEqual(2);
    });

    it('manager_should_skip_invalid_snapshot_entries', 0, () => {
      const manager = new ConfigurationManager();
      const restored = manager.restore({
        version: 9,
        entries: [
          { key: 'good', value: 'v', type: TYPE_STRING, scope: SCOPE_GLOBAL },
          { key: 'bad key', value: 'v', type: TYPE_STRING, scope: SCOPE_GLOBAL }
        ]
      });
      expect(restored).assertEqual(1);
      expect(manager.size()).assertEqual(1);
      expect(manager.getVersion()).assertEqual(9);
      expect(manager.has('good')).assertTrue();
      expect(manager.has('bad key')).assertFalse();
    });

    it('observer_should_notify_subscribers', 0, () => {
      const observer = new ConfigChangeObserver();
      expect(observer.subscribe('ui')).assertTrue();
      expect(observer.subscribe('ui')).assertFalse();
      expect(observer.subscribe('')).assertFalse();
      observer.subscribe('logger');
      expect(observer.size()).assertEqual(2);
      expect(observer.notify('app.baseUrl')).assertEqual(2);
      expect(observer.countOf('ui')).assertEqual(1);
      expect(observer.countOf('logger')).assertEqual(1);
      expect(observer.getNotifications()).assertEqual(1);
    });

    it('observer_should_unsubscribe', 0, () => {
      const observer = new ConfigChangeObserver();
      observer.subscribe('ui');
      expect(observer.unsubscribe('ui')).assertTrue();
      expect(observer.unsubscribe('ui')).assertFalse();
      expect(observer.size()).assertEqual(0);
      expect(observer.notify('key')).assertEqual(0);
      expect(observer.getNotifications()).assertEqual(1);
      observer.reset();
      expect(observer.getNotifications()).assertEqual(0);
    });

    it('merger_should_override_global_with_page', 0, () => {
      const global: ConfigEntry[] = [
        { key: 'a', value: 'global-a', type: TYPE_STRING, scope: SCOPE_GLOBAL },
        { key: 'b', value: 'global-b', type: TYPE_STRING, scope: SCOPE_GLOBAL }
      ];
      const page: ConfigEntry[] = [
        { key: 'b', value: 'page-b', type: TYPE_STRING, scope: SCOPE_PAGE },
        { key: 'c', value: 'page-c', type: TYPE_STRING, scope: SCOPE_PAGE }
      ];
      const merged = ConfigMerger.merge(global, page);
      expect(merged.length).assertEqual(3);
      expect(ConfigMerger.overrideCount(global, page)).assertEqual(1);
      let bValue: string = '';
      for (let i = 0; i < merged.length; i++) {
        if (merged[i].key === 'b') {
          bValue = merged[i].value;
        }
      }
      expect(bValue).assertEqual('page-b');
    });

    it('merger_should_handle_no_overrides', 0, () => {
      const global: ConfigEntry[] = [
        { key: 'a', value: '1', type: TYPE_STRING, scope: SCOPE_GLOBAL }
      ];
      const page: ConfigEntry[] = [
        { key: 'b', value: '2', type: TYPE_STRING, scope: SCOPE_PAGE }
      ];
      expect(ConfigMerger.merge(global, page).length).assertEqual(2);
      expect(ConfigMerger.overrideCount(global, page)).assertEqual(0);
      expect(ConfigMerger.merge([], page).length).assertEqual(1);
      expect(ConfigMerger.merge(global, []).length).assertEqual(1);
    });

    it('config_flow_should_notify_on_change', 0, () => {
      const manager = new ConfigurationManager();
      const observer = new ConfigChangeObserver();
      observer.subscribe('ui');
      const entry: ConfigEntry = {
        key: 'app.timeout', value: '30', type: TYPE_NUMBER, scope: SCOPE_GLOBAL
      };
      expect(manager.set(entry)).assertTrue();
      observer.notify(entry.key);
      entry.value = '60';
      expect(manager.set(entry)).assertTrue();
      observer.notify(entry.key);
      expect(observer.countOf('ui')).assertEqual(2);
      expect(manager.getNumber('app.timeout')).assertEqual(60);
      expect(manager.getVersion()).assertEqual(2);
    });

    it('config_constants_should_be_stable', 0, () => {
      expect(SCOPE_GLOBAL).assertEqual('global');
      expect(SCOPE_PAGE).assertEqual('page');
      expect(SCOPE_TEMP).assertEqual('temp');
      expect(TYPE_STRING).assertEqual('string');
      expect(TYPE_NUMBER).assertEqual('number');
      expect(TYPE_BOOLEAN).assertEqual('boolean');
      expect(MAX_KEY_LENGTH).assertEqual(64);
      expect(MAX_VALUE_LENGTH).assertEqual(1024);
    });

    it('manager_should_keep_independent_instances', 0, () => {
      const first = new ConfigurationManager();
      const second = new ConfigurationManager();
      first.set({ key: 'k', value: 'first', type: TYPE_STRING, scope: SCOPE_GLOBAL });
      second.set({ key: 'k', value: 'second', type: TYPE_STRING, scope: SCOPE_GLOBAL });
      expect(first.get('k')).assertEqual('first');
      expect(second.get('k')).assertEqual('second');
      expect(first.size()).assertEqual(1);
      second.reset();
      expect(second.has('k')).assertFalse();
      expect(first.has('k')).assertTrue();
    });
  });
}
