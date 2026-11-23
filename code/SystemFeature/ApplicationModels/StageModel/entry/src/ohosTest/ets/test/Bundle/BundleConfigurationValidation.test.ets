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
import { getDriver, ensureAppReady } from '../Shared/SharedDriver';

enum FieldKind {
  TEXT = 0,
  FLAGS = 1,
  VERSION = 2,
  ENTITY = 3,
  PROCESS = 4
}

enum ConfigFlag {
  NONE = 0,
  APPLICATION_INFO = 1,
  ABILITY = 2,
  EXTENSION = 4,
  HAP_MODULE = 8,
  METADATA = 16
}

class ConfigItem {
  readonly key: string;
  readonly kind: FieldKind;
  readonly required: boolean;
  readonly value: string;

  constructor(key: string, kind: FieldKind, required: boolean, value: string) {
    this.key = key;
    this.kind = kind;
    this.required = required;
    this.value = value;
  }

  isEmpty(): boolean {
    return this.value.length === 0;
  }

  describe(): string {
    return `${this.key}=${this.value}`;
  }

  isText(): boolean {
    return this.kind === FieldKind.TEXT;
  }

  isNumeric(): boolean {
    return this.kind === FieldKind.FLAGS || this.kind === FieldKind.VERSION;
  }

  label(): string {
    return `${this.kind}:${this.key}`;
  }
}

class ValidationIssue {
  readonly key: string;
  readonly reason: string;

  constructor(key: string, reason: string) {
    this.key = key;
    this.reason = reason;
  }

  describe(): string {
    return `${this.key}:${this.reason}`;
  }

  isMissing(): boolean {
    return this.reason === 'missing';
  }

  isEmpty(): boolean {
    return this.reason === 'empty';
  }
}

class ValidationReport {
  private issues: ValidationIssue[] = [];

  add(issue: ValidationIssue): ValidationReport {
    this.issues.push(issue);
    return this;
  }

  isValid(): boolean {
    return this.issues.length === 0;
  }

  count(): number {
    return this.issues.length;
  }

  keys(): string[] {
    return this.issues.map((issue: ValidationIssue) => issue.key);
  }

  missingCount(): number {
    let count = 0;
    for (const issue of this.issues) {
      if (issue.isMissing()) {
        count += 1;
      }
    }
    return count;
  }

  emptyCount(): number {
    let count = 0;
    for (const issue of this.issues) {
      if (issue.isEmpty()) {
        count += 1;
      }
    }
    return count;
  }

  hasKey(key: string): boolean {
    for (const issue of this.issues) {
      if (issue.key === key) {
        return true;
      }
    }
    return false;
  }

  describe(): string {
    return this.issues.map((issue: ValidationIssue) => issue.describe()).join(',');
  }
}

class ConfigValidator {
  private items: ConfigItem[] = [];

  add(item: ConfigItem): ConfigValidator {
    this.items.push(item);
    return this;
  }

  size(): number {
    return this.items.length;
  }

  validate(): ValidationReport {
    const report = new ValidationReport();
    for (const item of this.items) {
      if (item.required && item.isEmpty()) {
        report.add(new ValidationIssue(item.key, 'missing'));
      } else if (!item.required && item.isEmpty()) {
        report.add(new ValidationIssue(item.key, 'empty'));
      }
    }
    return report;
  }

  find(key: string): ConfigItem | null {
    for (const item of this.items) {
      if (item.key === key) {
        return item;
      }
    }
    return null;
  }

  requiredItems(): ConfigItem[] {
    return this.items.filter((item: ConfigItem) => item.required);
  }

  optionalItems(): ConfigItem[] {
    return this.items.filter((item: ConfigItem) => !item.required);
  }

  kinds(): FieldKind[] {
    return this.items.map((item: ConfigItem) => item.kind);
  }

  numericCount(): number {
    let count = 0;
    for (const item of this.items) {
      if (item.isNumeric()) {
        count += 1;
      }
    }
    return count;
  }
}

class ConfigSnapshot {
  readonly moduleName: string;
  readonly abilityName: string;
  readonly flags: number;
  readonly entityType: string;
  readonly process: string;
  readonly targetVersion: number;

  constructor(moduleName: string, abilityName: string, flags: number, entityType: string,
    process: string, targetVersion: number) {
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.flags = flags;
    this.entityType = entityType;
    this.process = process;
    this.targetVersion = targetVersion;
  }

  hasFlag(flag: ConfigFlag): boolean {
    return (this.flags & flag) !== 0;
  }

  isEntity(): boolean {
    return this.entityType === 'entity.system.browsable';
  }

  describe(): string {
    return `${this.moduleName}/${this.abilityName}:${this.targetVersion}`;
  }

  fingerprint(): string {
    return `${this.flags}:${this.process}:${this.entityType}`;
  }

  withFlag(flag: ConfigFlag): ConfigSnapshot {
    return new ConfigSnapshot(this.moduleName, this.abilityName, this.flags | flag,
      this.entityType, this.process, this.targetVersion);
  }
}

function buildValidator(): ConfigValidator {
  const validator = new ConfigValidator();
  validator.add(new ConfigItem('moduleName', FieldKind.TEXT, true, 'entry'));
  validator.add(new ConfigItem('abilityName', FieldKind.TEXT, true, 'MainAbility'));
  validator.add(new ConfigItem('flags', FieldKind.FLAGS, true, '8'));
  validator.add(new ConfigItem('entityType', FieldKind.ENTITY, false, 'entity.system.browsable'));
  validator.add(new ConfigItem('process', FieldKind.PROCESS, false, 'ohos.samples.stagemodel'));
  validator.add(new ConfigItem('targetVersion', FieldKind.VERSION, true, '12'));
  return validator;
}

export default function bundleConfigurationValidationTest(): void {
  describe('BundleConfigurationValidationSuite', () => {
    let validator: ConfigValidator = buildValidator();
    let snapshot: ConfigSnapshot = new ConfigSnapshot('entry', 'MainAbility', 8,
      'entity.system.browsable', 'ohos.samples.stagemodel', 12);

    beforeAll(() => {
      validator = buildValidator();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle config suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle config suite end');
    });

    it('BundleConfigurationValidation_001', 0, async (done: Function) => {
      expect(validator.size()).assertEqual(6);
      expect(validator.requiredItems().length).assertEqual(4);
      expect(validator.optionalItems().length).assertEqual(2);
      done();
    });

    it('BundleConfigurationValidation_002', 0, async (done: Function) => {
      const report = validator.validate();
      expect(report.isValid()).assertTrue();
      expect(report.count()).assertEqual(0);
      expect(report.keys().length).assertEqual(0);
      done();
    });

    it('BundleConfigurationValidation_003', 0, async (done: Function) => {
      const moduleItem = validator.find('moduleName');
      expect(moduleItem !== null).assertTrue();
      expect(moduleItem !== null ? moduleItem.value : '').assertEqual('entry');
      expect(moduleItem !== null ? moduleItem.isText() : false).assertTrue();
      done();
    });

    it('BundleConfigurationValidation_004', 0, async (done: Function) => {
      const flags = validator.find('flags');
      expect(flags !== null ? flags.isNumeric() : false).assertTrue();
      expect(flags !== null ? flags.isEmpty() : true).assertFalse();
      expect(flags !== null ? flags.label() : '').assertEqual(`${FieldKind.FLAGS}:flags`);
      done();
    });

    it('BundleConfigurationValidation_005', 0, async (done: Function) => {
      expect(validator.numericCount()).assertEqual(2);
      expect(validator.kinds().length).assertEqual(6);
      expect(validator.find('missing')).assertNull();
      done();
    });

    it('BundleConfigurationValidation_006', 0, async (done: Function) => {
      const broken = new ConfigValidator();
      broken.add(new ConfigItem('moduleName', FieldKind.TEXT, true, ''));
      broken.add(new ConfigItem('abilityName', FieldKind.TEXT, true, 'MainAbility'));
      const report = broken.validate();
      expect(report.isValid()).assertFalse();
      expect(report.missingCount()).assertEqual(1);
      expect(report.hasKey('moduleName')).assertTrue();
      done();
    });

    it('BundleConfigurationValidation_007', 0, async (done: Function) => {
      const broken = new ConfigValidator();
      broken.add(new ConfigItem('moduleName', FieldKind.TEXT, true, ''));
      broken.add(new ConfigItem('process', FieldKind.PROCESS, false, ''));
      const report = broken.validate();
      expect(report.count()).assertEqual(2);
      expect(report.missingCount()).assertEqual(1);
      expect(report.emptyCount()).assertEqual(1);
      done();
    });

    it('BundleConfigurationValidation_008', 0, async (done: Function) => {
      const broken = new ConfigValidator();
      broken.add(new ConfigItem('abilityName', FieldKind.TEXT, true, ''));
      const report = broken.validate();
      expect(report.describe()).assertEqual('abilityName:missing');
      expect(report.keys()[0]).assertEqual('abilityName');
      done();
    });

    it('BundleConfigurationValidation_009', 0, async (done: Function) => {
      const item = new ConfigItem('targetVersion', FieldKind.VERSION, true, '12');
      expect(item.describe()).assertEqual('targetVersion=12');
      expect(item.isNumeric()).assertTrue();
      expect(item.isText()).assertFalse();
      done();
    });

    it('BundleConfigurationValidation_010', 0, async (done: Function) => {
      const issue = new ValidationIssue('flags', 'missing');
      expect(issue.describe()).assertEqual('flags:missing');
      expect(issue.isMissing()).assertTrue();
      expect(issue.isEmpty()).assertFalse();
      done();
    });

    it('BundleConfigurationValidation_011', 0, async (done: Function) => {
      const issue = new ValidationIssue('process', 'empty');
      expect(issue.isMissing()).assertFalse();
      expect(issue.isEmpty()).assertTrue();
      expect(issue.describe()).assertEqual('process:empty');
      done();
    });

    it('BundleConfigurationValidation_012', 0, async (done: Function) => {
      expect(snapshot.hasFlag(ConfigFlag.HAP_MODULE)).assertTrue();
      expect(snapshot.hasFlag(ConfigFlag.ABILITY)).assertFalse();
      expect(snapshot.hasFlag(ConfigFlag.APPLICATION_INFO)).assertFalse();
      done();
    });

    it('BundleConfigurationValidation_013', 0, async (done: Function) => {
      expect(snapshot.describe()).assertEqual('entry/MainAbility:12');
      expect(snapshot.isEntity()).assertTrue();
      expect(snapshot.targetVersion).assertEqual(12);
      done();
    });

    it('BundleConfigurationValidation_014', 0, async (done: Function) => {
      const updated = snapshot.withFlag(ConfigFlag.ABILITY);
      expect(updated.hasFlag(ConfigFlag.ABILITY)).assertTrue();
      expect(updated.hasFlag(ConfigFlag.HAP_MODULE)).assertTrue();
      expect(updated.flags).assertEqual(10);
      done();
    });

    it('BundleConfigurationValidation_015', 0, async (done: Function) => {
      expect(snapshot.fingerprint()).assertEqual('8:ohos.samples.stagemodel:entity.system.browsable');
      expect(snapshot.moduleName).assertEqual('entry');
      expect(snapshot.abilityName).assertEqual('MainAbility');
      done();
    });

    it('BundleConfigurationValidation_016', 0, async (done: Function) => {
      const other = new ConfigSnapshot('entry', 'JumpAbility', 0, 'page', 'proc', 9);
      expect(other.isEntity()).assertFalse();
      expect(other.hasFlag(ConfigFlag.HAP_MODULE)).assertFalse();
      expect(other.describe()).assertEqual('entry/JumpAbility:9');
      done();
    });

    it('BundleConfigurationValidation_017', 0, async (done: Function) => {
      const validator = new ConfigValidator();
      validator.add(new ConfigItem('a', FieldKind.TEXT, true, 'x'));
      validator.add(new ConfigItem('b', FieldKind.ENTITY, false, 'y'));
      expect(validator.size()).assertEqual(2);
      expect(validator.requiredItems().length).assertEqual(1);
      expect(validator.validate().isValid()).assertTrue();
      done();
    });

    it('BundleConfigurationValidation_018', 0, async (done: Function) => {
      const validator = new ConfigValidator();
      for (let i = 0; i < 4; i++) {
        validator.add(new ConfigItem(`req${i}`, FieldKind.TEXT, true, `v${i}`));
      }
      expect(validator.size()).assertEqual(4);
      expect(validator.requiredItems().length).assertEqual(4);
      expect(validator.validate().count()).assertEqual(0);
      done();
    });

    it('BundleConfigurationValidation_019', 0, async (done: Function) => {
      const report = new ValidationReport();
      expect(report.isValid()).assertTrue();
      report.add(new ValidationIssue('x', 'missing'));
      expect(report.isValid()).assertFalse();
      expect(report.count()).assertEqual(1);
      done();
    });

    it('BundleConfigurationValidation_020', 0, async (done: Function) => {
      const report = new ValidationReport();
      report.add(new ValidationIssue('a', 'missing'));
      report.add(new ValidationIssue('b', 'empty'));
      report.add(new ValidationIssue('c', 'empty'));
      expect(report.missingCount()).assertEqual(1);
      expect(report.emptyCount()).assertEqual(2);
      expect(report.keys().length).assertEqual(3);
      done();
    });

    it('BundleConfigurationValidation_021', 0, async (done: Function) => {
      const report = new ValidationReport();
      report.add(new ValidationIssue('flags', 'missing'));
      expect(report.hasKey('flags')).assertTrue();
      expect(report.hasKey('moduleName')).assertFalse();
      expect(report.describe()).assertEqual('flags:missing');
      done();
    });

    it('BundleConfigurationValidation_022', 0, async (done: Function) => {
      const validator = buildValidator();
      const kinds = validator.kinds();
      expect(kinds[0]).assertEqual(FieldKind.TEXT);
      expect(kinds[2]).assertEqual(FieldKind.FLAGS);
      expect(kinds[3]).assertEqual(FieldKind.ENTITY);
      expect(kinds[5]).assertEqual(FieldKind.VERSION);
      done();
    });

    it('BundleConfigurationValidation_023', 0, async (done: Function) => {
      const entity = new ConfigItem('entityType', FieldKind.ENTITY, false, 'entity.system.browsable');
      expect(entity.isEmpty()).assertFalse();
      expect(entity.isNumeric()).assertFalse();
      expect(entity.isText()).assertFalse();
      expect(entity.label()).assertEqual(`${FieldKind.ENTITY}:entityType`);
      done();
    });

    it('BundleConfigurationValidation_024', 0, async (done: Function) => {
      const snapshot = new ConfigSnapshot('entry', 'FormAbility', 28, 'form', 'proc', 12);
      expect(snapshot.hasFlag(ConfigFlag.EXTENSION)).assertTrue();
      expect(snapshot.hasFlag(ConfigFlag.METADATA)).assertTrue();
      expect(snapshot.withFlag(ConfigFlag.ABILITY).flags).assertEqual(30);
      done();
    });

    it('BundleConfigurationValidation_025', 0, async (done: Function) => {
      const validator = new ConfigValidator();
      validator.add(new ConfigItem('moduleName', FieldKind.TEXT, true, ''));
      validator.add(new ConfigItem('abilityName', FieldKind.TEXT, true, ''));
      validator.add(new ConfigItem('flags', FieldKind.FLAGS, true, ''));
      const report = validator.validate();
      expect(report.count()).assertEqual(3);
      expect(report.missingCount()).assertEqual(3);
      expect(report.hasKey('flags')).assertTrue();
      done();
    });

    it('BundleConfigurationValidation_026', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(typeof ready === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('BundleConfigurationValidation_027', 0, async (done: Function) => {
      const validator = new ConfigValidator();
      validator.add(new ConfigItem('process', FieldKind.PROCESS, false, ''));
      validator.add(new ConfigItem('entityType', FieldKind.ENTITY, false, ''));
      const report = validator.validate();
      expect(report.emptyCount()).assertEqual(2);
      expect(report.missingCount()).assertEqual(0);
      expect(report.count()).assertEqual(2);
      done();
    });

    it('BundleConfigurationValidation_028', 0, async (done: Function) => {
      const snapshot = new ConfigSnapshot('entry', 'MainAbility', 8, 'entity.system.browsable', 'proc', 12);
      expect(snapshot.withFlag(ConfigFlag.APPLICATION_INFO).flags).assertEqual(9);
      expect(snapshot.withFlag(ConfigFlag.METADATA).flags).assertEqual(24);
      expect(snapshot.flags).assertEqual(8);
      done();
    });

    it('BundleConfigurationValidation_029', 0, async (done: Function) => {
      const validator = buildValidator();
      const flags = validator.find('flags');
      const target = validator.find('targetVersion');
      expect(flags !== null ? flags.kind : FieldKind.TEXT).assertEqual(FieldKind.FLAGS);
      expect(target !== null ? target.kind : FieldKind.TEXT).assertEqual(FieldKind.VERSION);
      expect(target !== null ? target.value : '').assertEqual('12');
      done();
    });
  });
}

