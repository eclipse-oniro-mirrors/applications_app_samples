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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import { BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN, ABILITY_SERVICE, ABILITY_FORM, ACCOUNT_ID, RESULT_CODE } from '../Shared/SharedDriver';

enum ConfigScope {
  ABILITY = 0,
  EXTENSION = 1,
  SERVICE = 2,
  FORM = 3
}

enum LaunchType {
  SINGLETON = 0,
  STANDARD = 1,
  SPECIFIED = 2
}

enum ConfigFlag {
  NONE = 0,
  WITH_ACCOUNT = 1,
  FOR_RESULT = 2,
  NEW_TASK = 4,
  WITH_MODULE = 8
}

class ConfigEntry {
  readonly key: string;
  readonly value: string;
  readonly required: boolean;

  constructor(key: string, value: string, required: boolean) {
    this.key = key;
    this.value = value;
    this.required = required;
  }

  describe(): string {
    return `${this.key}:${this.value}`;
  }

  sameAs(other: ConfigEntry): boolean {
    return this.key === other.key && this.value === other.value;
  }
}

class AbilityRequestConfiguration {
  readonly configId: number;
  bundleName: string;
  moduleName: string;
  abilityName: string;
  scope: ConfigScope;
  launchType: LaunchType;
  flagBits: number;
  resultCode: number;
  private entries: ConfigEntry[] = [];

  constructor(configId: number, bundleName: string, moduleName: string, abilityName: string) {
    this.configId = configId;
    this.bundleName = bundleName;
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.scope = ConfigScope.ABILITY;
    this.launchType = LaunchType.SINGLETON;
    this.flagBits = ConfigFlag.NONE;
    this.resultCode = 0;
  }

  scopeOf(scope: ConfigScope): AbilityRequestConfiguration {
    this.scope = scope;
    return this;
  }

  launchAs(type: LaunchType): AbilityRequestConfiguration {
    this.launchType = type;
    return this;
  }

  addFlag(flag: ConfigFlag): AbilityRequestConfiguration {
    this.flagBits = this.flagBits | flag;
    return this;
  }

  hasFlag(flag: ConfigFlag): boolean {
    return (this.flagBits & flag) === flag;
  }

  setEntry(key: string, value: string, required: boolean): AbilityRequestConfiguration {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        this.entries[i] = new ConfigEntry(key, value, required);
        return this;
      }
    }
    this.entries.push(new ConfigEntry(key, value, required));
    return this;
  }

  getEntry(key: string): string {
    for (const entry of this.entries) {
      if (entry.key === key) {
        return entry.value;
      }
    }
    return '';
  }

  hasEntry(key: string): boolean {
    for (const entry of this.entries) {
      if (entry.key === key) {
        return true;
      }
    }
    return false;
  }

  entryCount(): number {
    return this.entries.length;
  }

  allEntries(): ConfigEntry[] {
    return this.entries;
  }

  requiredCount(): number {
    let count = 0;
    for (const entry of this.entries) {
      if (entry.required) {
        count += 1;
      }
    }
    return count;
  }

  isService(): boolean {
    return this.scope === ConfigScope.SERVICE;
  }

  isForm(): boolean {
    return this.scope === ConfigScope.FORM;
  }

  isExtension(): boolean {
    return this.scope === ConfigScope.EXTENSION;
  }

  isAbility(): boolean {
    return this.scope === ConfigScope.ABILITY;
  }

  isValid(): boolean {
    return this.bundleName.length > 0 && this.moduleName.length > 0 && this.abilityName.length > 0;
  }

  describe(): string {
    return `${this.configId}[${this.scope}]:${this.moduleName}/${this.abilityName}`;
  }

  identity(): string {
    return `${this.bundleName}/${this.moduleName}/${this.abilityName}`;
  }

  clone(): AbilityRequestConfiguration {
    const copy = new AbilityRequestConfiguration(this.configId, this.bundleName, this.moduleName, this.abilityName);
    copy.scope = this.scope;
    copy.launchType = this.launchType;
    copy.flagBits = this.flagBits;
    copy.resultCode = this.resultCode;
    for (const entry of this.entries) {
      copy.setEntry(entry.key, entry.value, entry.required);
    }
    return copy;
  }

  equals(other: AbilityRequestConfiguration): boolean {
    return this.configId === other.configId &&
      this.identity() === other.identity() &&
      this.scope === other.scope &&
      this.entryCount() === other.entryCount();
  }
}

class ConfigRegistry {
  private configs: AbilityRequestConfiguration[] = [];

  register(config: AbilityRequestConfiguration): ConfigRegistry {
    this.configs.push(config);
    return this;
  }

  size(): number {
    return this.configs.length;
  }

  all(): AbilityRequestConfiguration[] {
    return this.configs;
  }

  countByScope(scope: ConfigScope): number {
    let count = 0;
    for (const config of this.configs) {
      if (config.scope === scope) {
        count += 1;
      }
    }
    return count;
  }

  countByLaunchType(type: LaunchType): number {
    let count = 0;
    for (const config of this.configs) {
      if (config.launchType === type) {
        count += 1;
      }
    }
    return count;
  }

  findByAbility(abilityName: string): AbilityRequestConfiguration | null {
    for (const config of this.configs) {
      if (config.abilityName === abilityName) {
        return config;
      }
    }
    return null;
  }

  findById(configId: number): AbilityRequestConfiguration | null {
    for (const config of this.configs) {
      if (config.configId === configId) {
        return config;
      }
    }
    return null;
  }

  totalEntries(): number {
    let count = 0;
    for (const config of this.configs) {
      count += config.entryCount();
    }
    return count;
  }

  validCount(): number {
    let count = 0;
    for (const config of this.configs) {
      if (config.isValid()) {
        count += 1;
      }
    }
    return count;
  }

  identities(): string[] {
    const result: string[] = [];
    for (const config of this.configs) {
      result.push(config.identity());
    }
    return result;
  }
}

class ConfigDiff {
  private base: AbilityRequestConfiguration;
  private target: AbilityRequestConfiguration;

  constructor(base: AbilityRequestConfiguration, target: AbilityRequestConfiguration) {
    this.base = base;
    this.target = target;
  }

  scopeChanged(): boolean {
    return this.base.scope !== this.target.scope;
  }

  launchChanged(): boolean {
    return this.base.launchType !== this.target.launchType;
  }

  flagsChanged(): boolean {
    return this.base.flagBits !== this.target.flagBits;
  }

  entryCountDelta(): number {
    return this.target.entryCount() - this.base.entryCount();
  }

  sameIdentity(): boolean {
    return this.base.identity() === this.target.identity();
  }

  changedKeys(): string[] {
    const keys: string[] = [];
    for (const entry of this.target.allEntries()) {
      if (this.base.getEntry(entry.key) !== entry.value) {
        keys.push(entry.key);
      }
    }
    return keys;
  }

  anyChange(): boolean {
    return this.scopeChanged() || this.launchChanged() || this.flagsChanged() ||
      this.entryCountDelta() !== 0 || !this.sameIdentity();
  }
}

class ConfigMerger {
  private base: AbilityRequestConfiguration;
  private override: AbilityRequestConfiguration;

  constructor(base: AbilityRequestConfiguration, override: AbilityRequestConfiguration) {
    this.base = base;
    this.override = override;
  }

  merged(): AbilityRequestConfiguration {
    const result = this.base.clone();
    if (this.override.isValid()) {
      result.scope = this.override.scope;
      result.launchType = this.override.launchType;
      result.flagBits = result.flagBits | this.override.flagBits;
      result.resultCode = this.override.resultCode;
    }
    for (const entry of this.override.allEntries()) {
      result.setEntry(entry.key, entry.value, entry.required);
    }
    return result;
  }

  overriddenKeys(): string[] {
    const keys: string[] = [];
    for (const entry of this.override.allEntries()) {
      if (this.base.hasEntry(entry.key)) {
        keys.push(entry.key);
      }
    }
    return keys;
  }

  newKeys(): string[] {
    const keys: string[] = [];
    for (const entry of this.override.allEntries()) {
      if (!this.base.hasEntry(entry.key)) {
        keys.push(entry.key);
      }
    }
    return keys;
  }
}

class ConfigValidator {
  private requiredKeys: string[] = [];
  private maxEntries: number;

  constructor(requiredKeys: string[], maxEntries: number) {
    this.requiredKeys = requiredKeys;
    this.maxEntries = maxEntries;
  }

  missingKeys(config: AbilityRequestConfiguration): string[] {
    const missing: string[] = [];
    for (const key of this.requiredKeys) {
      if (!config.hasEntry(key)) {
        missing.push(key);
      }
    }
    return missing;
  }

  validate(config: AbilityRequestConfiguration): boolean {
    if (!config.isValid()) {
      return false;
    }
    if (this.missingKeys(config).length > 0) {
      return false;
    }
    if (config.entryCount() > this.maxEntries) {
      return false;
    }
    return true;
  }
}

function buildRegistry(): ConfigRegistry {
  const registry = new ConfigRegistry();
  const main = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
  main.setEntry('mode', 'deep', true);
  main.setEntry('origin', 'test', false);
  main.launchAs(LaunchType.SINGLETON);
  main.addFlag(ConfigFlag.WITH_MODULE);
  registry.register(main);

  const service = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
  service.scopeOf(ConfigScope.SERVICE);
  service.launchAs(LaunchType.STANDARD);
  service.addFlag(ConfigFlag.WITH_ACCOUNT);
  service.setEntry('account', `${ACCOUNT_ID}`, true);
  registry.register(service);

  const form = new AbilityRequestConfiguration(3, BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM);
  form.scopeOf(ConfigScope.FORM);
  form.launchAs(LaunchType.SPECIFIED);
  form.setEntry('formId', '1001', true);
  form.setEntry('mode', 'card', false);
  registry.register(form);

  return registry;
}

export default function abilityRequestConfigurationTest(): void {
  describe('AbilityRequestConfigurationSuite', () => {
    let registry: ConfigRegistry = buildRegistry();

    beforeAll(() => {
      registry = buildRegistry();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'request configuration suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'request configuration suite end');
    });

    it('AbilityRequestConfiguration_001', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(config.isValid()).assertTrue();
      expect(config.scope).assertEqual(ConfigScope.ABILITY);
      expect(config.launchType).assertEqual(LaunchType.SINGLETON);
      expect(config.entryCount()).assertEqual(0);
      done();
    });

    it('AbilityRequestConfiguration_002', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, '', MODULE_ENTRY, ABILITY_MAIN);
      expect(config.isValid()).assertFalse();
      const noModule = new AbilityRequestConfiguration(2, BUNDLE_NAME, '', ABILITY_MAIN);
      expect(noModule.isValid()).assertFalse();
      const noAbility = new AbilityRequestConfiguration(3, BUNDLE_NAME, MODULE_ENTRY, '');
      expect(noAbility.isValid()).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_003', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
      config.scopeOf(ConfigScope.SERVICE);
      expect(config.scope).assertEqual(ConfigScope.SERVICE);
      expect(config.isService()).assertTrue();
      expect(config.isForm()).assertFalse();
      expect(config.isAbility()).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_004', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM);
      config.scopeOf(ConfigScope.FORM);
      expect(config.isForm()).assertTrue();
      expect(config.isService()).assertFalse();
      expect(config.isExtension()).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_005', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.scopeOf(ConfigScope.EXTENSION);
      expect(config.isExtension()).assertTrue();
      expect(config.isAbility()).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_006', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('a', '1', true);
      config.setEntry('b', '2', false);
      expect(config.entryCount()).assertEqual(2);
      expect(config.getEntry('a')).assertEqual('1');
      expect(config.getEntry('b')).assertEqual('2');
      expect(config.getEntry('missing')).assertEqual('');
      done();
    });

    it('AbilityRequestConfiguration_007', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('a', '1', true);
      config.setEntry('a', '9', false);
      expect(config.entryCount()).assertEqual(1);
      expect(config.getEntry('a')).assertEqual('9');
      done();
    });

    it('AbilityRequestConfiguration_008', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(config.hasEntry('x')).assertFalse();
      config.setEntry('x', '1', true);
      expect(config.hasEntry('x')).assertTrue();
      expect(config.requiredCount()).assertEqual(1);
      done();
    });

    it('AbilityRequestConfiguration_009', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('a', '1', true);
      config.setEntry('b', '2', false);
      config.setEntry('c', '3', true);
      expect(config.requiredCount()).assertEqual(2);
      expect(config.allEntries().length).assertEqual(3);
      done();
    });

    it('AbilityRequestConfiguration_010', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(config.hasFlag(ConfigFlag.FOR_RESULT)).assertFalse();
      config.addFlag(ConfigFlag.FOR_RESULT);
      expect(config.hasFlag(ConfigFlag.FOR_RESULT)).assertTrue();
      expect(config.hasFlag(ConfigFlag.NEW_TASK)).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_011', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.addFlag(ConfigFlag.WITH_ACCOUNT).addFlag(ConfigFlag.NEW_TASK);
      expect(config.flagBits).assertEqual(ConfigFlag.WITH_ACCOUNT | ConfigFlag.NEW_TASK);
      expect(config.hasFlag(ConfigFlag.WITH_ACCOUNT)).assertTrue();
      expect(config.hasFlag(ConfigFlag.NEW_TASK)).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_012', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(5, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.scopeOf(ConfigScope.SERVICE);
      expect(config.describe()).assertEqual(`5[${ConfigScope.SERVICE}]:${MODULE_ENTRY}/${ABILITY_MAIN}`);
      expect(config.identity()).assertEqual(`${BUNDLE_NAME}/${MODULE_ENTRY}/${ABILITY_MAIN}`);
      done();
    });

    it('AbilityRequestConfiguration_013', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.launchAs(LaunchType.STANDARD);
      expect(config.launchType).assertEqual(LaunchType.STANDARD);
      config.launchAs(LaunchType.SPECIFIED);
      expect(config.launchType).assertEqual(LaunchType.SPECIFIED);
      done();
    });

    it('AbilityRequestConfiguration_014', 0, async (done: Function) => {
      const source = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
      source.scopeOf(ConfigScope.SERVICE);
      source.addFlag(ConfigFlag.NEW_TASK);
      source.setEntry('k', 'v', true);
      const copy = source.clone();
      expect(copy.equals(source)).assertTrue();
      expect(copy.isService()).assertTrue();
      expect(copy.entryCount()).assertEqual(1);
      done();
    });

    it('AbilityRequestConfiguration_015', 0, async (done: Function) => {
      const source = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      source.setEntry('k', 'v', true);
      const copy = source.clone();
      copy.setEntry('extra', 'x', false);
      expect(source.entryCount()).assertEqual(1);
      expect(copy.entryCount()).assertEqual(2);
      done();
    });

    it('AbilityRequestConfiguration_016', 0, async (done: Function) => {
      const first = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const second = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(first.equals(second)).assertFalse();
      const third = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(first.equals(third)).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_017', 0, async (done: Function) => {
      const entry = new ConfigEntry('k', 'v', true);
      expect(entry.describe()).assertEqual('k:v');
      const same = new ConfigEntry('k', 'v', false);
      const other = new ConfigEntry('k', 'x', true);
      expect(entry.sameAs(same)).assertTrue();
      expect(entry.sameAs(other)).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_018', 0, async (done: Function) => {
      expect(registry.size()).assertEqual(3);
      expect(registry.all().length).assertEqual(3);
      expect(registry.countByScope(ConfigScope.ABILITY)).assertEqual(1);
      expect(registry.countByScope(ConfigScope.SERVICE)).assertEqual(1);
      expect(registry.countByScope(ConfigScope.FORM)).assertEqual(1);
      expect(registry.countByScope(ConfigScope.EXTENSION)).assertEqual(0);
      done();
    });

    it('AbilityRequestConfiguration_019', 0, async (done: Function) => {
      expect(registry.countByLaunchType(LaunchType.SINGLETON)).assertEqual(1);
      expect(registry.countByLaunchType(LaunchType.STANDARD)).assertEqual(1);
      expect(registry.countByLaunchType(LaunchType.SPECIFIED)).assertEqual(1);
      done();
    });

    it('AbilityRequestConfiguration_020', 0, async (done: Function) => {
      expect(registry.totalEntries()).assertEqual(5);
      expect(registry.validCount()).assertEqual(3);
      expect(registry.identities().length).assertEqual(3);
      done();
    });

    it('AbilityRequestConfiguration_021', 0, async (done: Function) => {
      const main = registry.findByAbility(ABILITY_MAIN);
      expect(main !== null).assertTrue();
      if (main !== null) {
        expect(main.configId).assertEqual(1);
        expect(main.hasEntry('mode')).assertTrue();
        expect(main.getEntry('mode')).assertEqual('deep');
        expect(main.hasFlag(ConfigFlag.WITH_MODULE)).assertTrue();
      }
      expect(registry.findByAbility('Missing')).assertNull();
      done();
    });

    it('AbilityRequestConfiguration_022', 0, async (done: Function) => {
      const service = registry.findById(2);
      expect(service !== null).assertTrue();
      if (service !== null) {
        expect(service.isService()).assertTrue();
        expect(service.launchType).assertEqual(LaunchType.STANDARD);
        expect(service.getEntry('account')).assertEqual(`${ACCOUNT_ID}`);
      }
      done();
    });

    it('AbilityRequestConfiguration_023', 0, async (done: Function) => {
      const form = registry.findById(3);
      expect(form !== null).assertTrue();
      if (form !== null) {
        expect(form.isForm()).assertTrue();
        expect(form.launchType).assertEqual(LaunchType.SPECIFIED);
        expect(form.entryCount()).assertEqual(2);
        expect(form.getEntry('formId')).assertEqual('1001');
      }
      done();
    });

    it('AbilityRequestConfiguration_024', 0, async (done: Function) => {
      const empty = new ConfigRegistry();
      expect(empty.size()).assertEqual(0);
      expect(empty.totalEntries()).assertEqual(0);
      expect(empty.validCount()).assertEqual(0);
      expect(empty.findByAbility(ABILITY_MAIN)).assertNull();
      done();
    });

    it('AbilityRequestConfiguration_025', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const target = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const diff = new ConfigDiff(base, target);
      expect(diff.scopeChanged()).assertFalse();
      expect(diff.launchChanged()).assertFalse();
      expect(diff.flagsChanged()).assertFalse();
      expect(diff.sameIdentity()).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_026', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const target = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      target.scopeOf(ConfigScope.SERVICE);
      const diff = new ConfigDiff(base, target);
      expect(diff.scopeChanged()).assertTrue();
      expect(diff.anyChange()).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_027', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const target = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      target.launchAs(LaunchType.STANDARD);
      target.addFlag(ConfigFlag.NEW_TASK);
      const diff = new ConfigDiff(base, target);
      expect(diff.launchChanged()).assertTrue();
      expect(diff.flagsChanged()).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_028', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      base.setEntry('a', '1', false);
      const target = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      target.setEntry('a', '2', false);
      target.setEntry('b', '3', false);
      const diff = new ConfigDiff(base, target);
      expect(diff.entryCountDelta()).assertEqual(1);
      expect(diff.changedKeys().length).assertEqual(2);
      expect(diff.changedKeys()[0]).assertEqual('a');
      done();
    });

    it('AbilityRequestConfiguration_029', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const target = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_SERVICE);
      const diff = new ConfigDiff(base, target);
      expect(diff.sameIdentity()).assertFalse();
      expect(diff.anyChange()).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_030', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      base.setEntry('mode', 'deep', true);
      const override = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      override.setEntry('mode', 'card', true);
      override.setEntry('extra', 'x', false);
      const merger = new ConfigMerger(base, override);
      expect(merger.overriddenKeys().length).assertEqual(1);
      expect(merger.overriddenKeys()[0]).assertEqual('mode');
      expect(merger.newKeys().length).assertEqual(1);
      expect(merger.newKeys()[0]).assertEqual('extra');
      done();
    });

    it('AbilityRequestConfiguration_031', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      base.setEntry('mode', 'deep', true);
      base.addFlag(ConfigFlag.WITH_MODULE);
      const override = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      override.scopeOf(ConfigScope.SERVICE);
      override.addFlag(ConfigFlag.WITH_ACCOUNT);
      override.setEntry('extra', 'x', false);
      const merged = new ConfigMerger(base, override).merged();
      expect(merged.scope).assertEqual(ConfigScope.SERVICE);
      expect(merged.hasFlag(ConfigFlag.WITH_MODULE)).assertTrue();
      expect(merged.hasFlag(ConfigFlag.WITH_ACCOUNT)).assertTrue();
      expect(merged.getEntry('mode')).assertEqual('deep');
      expect(merged.getEntry('extra')).assertEqual('x');
      expect(merged.entryCount()).assertEqual(2);
      done();
    });

    it('AbilityRequestConfiguration_032', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const invalidOverride = new AbilityRequestConfiguration(2, '', MODULE_ENTRY, ABILITY_MAIN);
      invalidOverride.scopeOf(ConfigScope.SERVICE);
      const merged = new ConfigMerger(base, invalidOverride).merged();
      expect(merged.scope).assertEqual(ConfigScope.ABILITY);
      expect(merged.identity()).assertEqual(base.identity());
      done();
    });

    it('AbilityRequestConfiguration_033', 0, async (done: Function) => {
      const validator = new ConfigValidator(['mode', 'origin'], 5);
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('mode', 'deep', true);
      expect(validator.missingKeys(config).length).assertEqual(1);
      expect(validator.missingKeys(config)[0]).assertEqual('origin');
      expect(validator.validate(config)).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_034', 0, async (done: Function) => {
      const validator = new ConfigValidator(['mode'], 5);
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('mode', 'deep', true);
      expect(validator.missingKeys(config).length).assertEqual(0);
      expect(validator.validate(config)).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_035', 0, async (done: Function) => {
      const validator = new ConfigValidator([], 1);
      const config = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('a', '1', false);
      config.setEntry('b', '2', false);
      expect(validator.validate(config)).assertFalse();
      done();
    });

    it('AbilityRequestConfiguration_036', 0, async (done: Function) => {
      const validator = new ConfigValidator([], 5);
      const blank = new AbilityRequestConfiguration(1, '', MODULE_ENTRY, ABILITY_MAIN);
      expect(validator.validate(blank)).assertFalse();
      const good = new AbilityRequestConfiguration(2, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      expect(validator.validate(good)).assertTrue();
      done();
    });

    it('AbilityRequestConfiguration_037', 0, async (done: Function) => {
      let totalRequired = 0;
      for (const config of registry.all()) {
        totalRequired += config.requiredCount();
      }
      expect(totalRequired).assertEqual(3);
      done();
    });

    it('AbilityRequestConfiguration_038', 0, async (done: Function) => {
      let entriesSum = 0;
      for (const config of registry.all()) {
        entriesSum += config.entryCount();
      }
      expect(entriesSum).assertEqual(registry.totalEntries());
      expect(entriesSum).assertEqual(5);
      done();
    });

    it('AbilityRequestConfiguration_039', 0, async (done: Function) => {
      const services = registry.all().filter((config: AbilityRequestConfiguration) => config.isService());
      expect(services.length).assertEqual(1);
      expect(services[0].configId).assertEqual(2);
      done();
    });

    it('AbilityRequestConfiguration_040', 0, async (done: Function) => {
      const forms = registry.all().filter((config: AbilityRequestConfiguration) => config.isForm());
      expect(forms.length).assertEqual(1);
      expect(forms[0].getEntry('formId')).assertEqual('1001');
      done();
    });

    it('AbilityRequestConfiguration_041', 0, async (done: Function) => {
      const names = registry.all().map((config: AbilityRequestConfiguration) => config.abilityName);
      expect(names.length).assertEqual(3);
      expect(names[0]).assertEqual(ABILITY_MAIN);
      expect(names[1]).assertEqual(ABILITY_SERVICE);
      expect(names[2]).assertEqual(ABILITY_FORM);
      done();
    });

    it('AbilityRequestConfiguration_042', 0, async (done: Function) => {
      let idSum = 0;
      for (const config of registry.all()) {
        idSum += config.configId;
      }
      expect(idSum).assertEqual(6);
      done();
    });

    it('AbilityRequestConfiguration_043', 0, async (done: Function) => {
      const registry2 = new ConfigRegistry();
      for (let i = 0; i < 4; i++) {
        const config = new AbilityRequestConfiguration(i, BUNDLE_NAME, MODULE_ENTRY, `Ability${i}`);
        if (i % 2 === 0) {
          config.scopeOf(ConfigScope.EXTENSION);
        }
        registry2.register(config);
      }
      expect(registry2.size()).assertEqual(4);
      expect(registry2.countByScope(ConfigScope.EXTENSION)).assertEqual(2);
      expect(registry2.countByScope(ConfigScope.ABILITY)).assertEqual(2);
      done();
    });

    it('AbilityRequestConfiguration_044', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(80, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.resultCode = RESULT_CODE;
      expect(config.resultCode).assertEqual(RESULT_CODE);
      const copy = config.clone();
      expect(copy.resultCode).assertEqual(RESULT_CODE);
      done();
    });

    it('AbilityRequestConfiguration_045', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(81, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.setEntry('k1', 'v1', true);
      config.setEntry('k2', 'v2', false);
      config.setEntry('k3', 'v3', true);
      const required: string[] = [];
      for (const entry of config.allEntries()) {
        if (entry.required) {
          required.push(entry.key);
        }
      }
      expect(required.length).assertEqual(2);
      expect(required[0]).assertEqual('k1');
      expect(required[1]).assertEqual('k3');
      done();
    });

    it('AbilityRequestConfiguration_046', 0, async (done: Function) => {
      const base = new AbilityRequestConfiguration(1, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      base.setEntry('a', '1', false);
      const same = base.clone();
      const diff = new ConfigDiff(base, same);
      expect(diff.anyChange()).assertFalse();
      expect(diff.changedKeys().length).assertEqual(0);
      expect(diff.entryCountDelta()).assertEqual(0);
      done();
    });

    it('AbilityRequestConfiguration_047', 0, async (done: Function) => {
      const validator = new ConfigValidator(['account'], 3);
      const service = registry.findById(2);
      expect(service !== null).assertTrue();
      if (service !== null) {
        expect(validator.validate(service)).assertTrue();
        expect(validator.missingKeys(service).length).assertEqual(0);
      }
      done();
    });

    it('AbilityRequestConfiguration_048', 0, async (done: Function) => {
      const main = registry.findByAbility(ABILITY_MAIN);
      expect(main !== null).assertTrue();
      if (main !== null) {
        const copy = main.clone();
        copy.setEntry('mode', 'card', true);
        expect(main.getEntry('mode')).assertEqual('deep');
        expect(copy.getEntry('mode')).assertEqual('card');
      }
      done();
    });

    it('AbilityRequestConfiguration_049', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(90, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      const flags: ConfigFlag[] = [ConfigFlag.WITH_ACCOUNT, ConfigFlag.FOR_RESULT, ConfigFlag.NEW_TASK];
      for (const flag of flags) {
        config.addFlag(flag);
      }
      let present = 0;
      for (const flag of flags) {
        if (config.hasFlag(flag)) {
          present += 1;
        }
      }
      expect(present).assertEqual(3);
      expect(config.flagBits).assertEqual(ConfigFlag.WITH_ACCOUNT | ConfigFlag.FOR_RESULT | ConfigFlag.NEW_TASK);
      done();
    });

    it('AbilityRequestConfiguration_050', 0, async (done: Function) => {
      const config = new AbilityRequestConfiguration(91, BUNDLE_NAME, MODULE_ENTRY, ABILITY_MAIN);
      config.scopeOf(ConfigScope.SERVICE);
      const copy = config.clone();
      copy.scopeOf(ConfigScope.FORM);
      expect(config.isService()).assertTrue();
      expect(copy.isForm()).assertTrue();
      expect(config.equals(copy)).assertFalse();
      done();
    });
  });
}




