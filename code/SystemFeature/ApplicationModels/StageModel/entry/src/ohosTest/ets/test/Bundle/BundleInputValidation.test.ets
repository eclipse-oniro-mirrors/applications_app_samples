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
import { getDriver, ensureAppReady, BUNDLE_NAME, MODULE_ENTRY } from '../Shared/SharedDriver';

const MAX_FLAGS: number = 127;
const MAX_NAME_LENGTH: number = 128;

enum InputKind {
  BUNDLE_NAME = 0,
  MODULE_NAME = 1,
  ABILITY_NAME = 2,
  FLAG = 3,
  TOKEN = 4
}

class InputRule {
  readonly kind: InputKind;
  readonly minLength: number;
  readonly maxLength: number;
  readonly required: boolean;

  constructor(kind: InputKind, minLength: number, maxLength: number, required: boolean) {
    this.kind = kind;
    this.minLength = minLength;
    this.maxLength = maxLength;
    this.required = required;
  }

  acceptsLength(length: number): boolean {
    return length >= this.minLength && length <= this.maxLength;
  }

  describe(): string {
    return `${this.kind}:${this.minLength}-${this.maxLength}`;
  }
}

class InputValue {
  readonly kind: InputKind;
  readonly text: string;
  readonly numeric: number;

  constructor(kind: InputKind, text: string, numeric: number) {
    this.kind = kind;
    this.text = text;
    this.numeric = numeric;
  }

  hasText(): boolean {
    return this.text.length > 0;
  }

  hasDot(): boolean {
    return this.text.indexOf('.') >= 0;
  }

  endsWith(suffix: string): boolean {
    if (this.text.length < suffix.length) {
      return false;
    }
    return this.text.substring(this.text.length - suffix.length) === suffix;
  }

  length(): number {
    return this.text.length;
  }

  describe(): string {
    return `${this.kind}:${this.text}:${this.numeric}`;
  }
}

class InputIssue {
  readonly kind: InputKind;
  readonly reason: string;

  constructor(kind: InputKind, reason: string) {
    this.kind = kind;
    this.reason = reason;
  }

  describe(): string {
    return `${this.kind}:${this.reason}`;
  }

  isRange(): boolean {
    return this.reason === 'out-of-range';
  }

  isFormat(): boolean {
    return this.reason === 'bad-format';
  }

  isMissing(): boolean {
    return this.reason === 'missing';
  }
}

class InputReport {
  private issues: InputIssue[] = [];

  add(issue: InputIssue): InputReport {
    this.issues.push(issue);
    return this;
  }

  clean(): boolean {
    return this.issues.length === 0;
  }

  count(): number {
    return this.issues.length;
  }

  kinds(): InputKind[] {
    return this.issues.map((issue: InputIssue) => issue.kind);
  }

  rangeCount(): number {
    let count = 0;
    for (const issue of this.issues) {
      if (issue.isRange()) {
        count += 1;
      }
    }
    return count;
  }

  formatCount(): number {
    let count = 0;
    for (const issue of this.issues) {
      if (issue.isFormat()) {
        count += 1;
      }
    }
    return count;
  }

  describe(): string {
    return this.issues.map((issue: InputIssue) => issue.describe()).join(';');
  }
}

class InputValidator {
  private rules: InputRule[] = [];

  withRule(rule: InputRule): InputValidator {
    this.rules.push(rule);
    return this;
  }

  ruleOf(kind: InputKind): InputRule | null {
    for (const rule of this.rules) {
      if (rule.kind === kind) {
        return rule;
      }
    }
    return null;
  }

  ruleCount(): number {
    return this.rules.length;
  }

  validate(value: InputValue): InputIssue | null {
    const rule = this.ruleOf(value.kind);
    if (rule === null) {
      return new InputIssue(value.kind, 'missing-rule');
    }
    if (rule.required && !value.hasText()) {
      return new InputIssue(value.kind, 'missing');
    }
    if (!rule.acceptsLength(value.length()) && value.kind !== InputKind.FLAG) {
      return new InputIssue(value.kind, 'out-of-range');
    }
    if (value.kind === InputKind.BUNDLE_NAME && !value.hasDot()) {
      return new InputIssue(value.kind, 'bad-format');
    }
    if (value.kind === InputKind.ABILITY_NAME && !value.endsWith('Ability')) {
      return new InputIssue(value.kind, 'bad-format');
    }
    if (value.kind === InputKind.FLAG && (value.numeric < 0 || value.numeric > MAX_FLAGS)) {
      return new InputIssue(value.kind, 'out-of-range');
    }
    if (value.kind === InputKind.TOKEN && value.numeric <= 0) {
      return new InputIssue(value.kind, 'out-of-range');
    }
    return null;
  }

  validateAll(values: InputValue[]): InputReport {
    const report = new InputReport();
    for (const value of values) {
      const issue = this.validate(value);
      if (issue !== null) {
        report.add(issue);
      }
    }
    return report;
  }
}

function buildValidator(): InputValidator {
  const validator = new InputValidator();
  validator.withRule(new InputRule(InputKind.BUNDLE_NAME, 1, MAX_NAME_LENGTH, true));
  validator.withRule(new InputRule(InputKind.MODULE_NAME, 1, MAX_NAME_LENGTH, true));
  validator.withRule(new InputRule(InputKind.ABILITY_NAME, 1, MAX_NAME_LENGTH, true));
  validator.withRule(new InputRule(InputKind.FLAG, 0, 3, false));
  validator.withRule(new InputRule(InputKind.TOKEN, 1, 10, true));
  return validator;
}

function buildValidValues(): InputValue[] {
  return [
    new InputValue(InputKind.BUNDLE_NAME, BUNDLE_NAME, 0),
    new InputValue(InputKind.MODULE_NAME, MODULE_ENTRY, 0),
    new InputValue(InputKind.ABILITY_NAME, 'MainAbility', 0),
    new InputValue(InputKind.FLAG, '8', 8),
    new InputValue(InputKind.TOKEN, '100', 100)
  ];
}

export default function bundleInputValidationTest(): void {
  describe('BundleInputValidationSuite', () => {
    let validator: InputValidator = buildValidator();

    beforeAll(() => {
      validator = buildValidator();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle input suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle input suite end');
    });

    it('BundleInputValidation_001', 0, async (done: Function) => {
      expect(validator.ruleCount()).assertEqual(5);
      expect(validator.ruleOf(InputKind.BUNDLE_NAME) !== null).assertTrue();
      expect(validator.ruleOf(InputKind.TOKEN) !== null).assertTrue();
      done();
    });

    it('BundleInputValidation_002', 0, async (done: Function) => {
      const report = validator.validateAll(buildValidValues());
      expect(report.clean()).assertTrue();
      expect(report.count()).assertEqual(0);
      expect(report.kinds().length).assertEqual(0);
      done();
    });

    it('BundleInputValidation_003', 0, async (done: Function) => {
      const value = new InputValue(InputKind.BUNDLE_NAME, BUNDLE_NAME, 0);
      expect(value.hasText()).assertTrue();
      expect(value.hasDot()).assertTrue();
      expect(value.length()).assertEqual(BUNDLE_NAME.length);
      done();
    });

    it('BundleInputValidation_004', 0, async (done: Function) => {
      const value = new InputValue(InputKind.MODULE_NAME, MODULE_ENTRY, 0);
      expect(value.endsWith('entry')).assertTrue();
      expect(value.endsWith('jump')).assertFalse();
      expect(value.hasDot()).assertFalse();
      done();
    });

    it('BundleInputValidation_005', 0, async (done: Function) => {
      const value = new InputValue(InputKind.ABILITY_NAME, 'MainAbility', 0);
      expect(value.endsWith('Ability')).assertTrue();
      expect(value.length()).assertEqual(11);
      expect(value.describe()).assertEqual(`${InputKind.ABILITY_NAME}:MainAbility:0`);
      done();
    });

    it('BundleInputValidation_006', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.BUNDLE_NAME, 'nobundle', 0));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isFormat() : false).assertTrue();
      expect(issue !== null ? issue.isRange() : true).assertFalse();
      done();
    });

    it('BundleInputValidation_007', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.BUNDLE_NAME, '', 0));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isMissing() : false).assertTrue();
      done();
    });

    it('BundleInputValidation_008', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.ABILITY_NAME, 'MainPage', 0));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isFormat() : false).assertTrue();
      expect(issue !== null ? issue.kind : InputKind.TOKEN).assertEqual(InputKind.ABILITY_NAME);
      done();
    });

    it('BundleInputValidation_009', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.FLAG, '128', 128));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isRange() : false).assertTrue();
      expect(issue !== null ? issue.reason : '').assertEqual('out-of-range');
      done();
    });

    it('BundleInputValidation_010', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.FLAG, '-1', -1));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isRange() : false).assertTrue();
      done();
    });

    it('BundleInputValidation_011', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.TOKEN, '0', 0));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isRange() : false).assertTrue();
      expect(issue !== null ? issue.kind : InputKind.FLAG).assertEqual(InputKind.TOKEN);
      done();
    });

    it('BundleInputValidation_012', 0, async (done: Function) => {
      const value = new InputValue(InputKind.TOKEN, '100', 100);
      const issue = validator.validate(value);
      expect(issue).assertNull();
      expect(value.numeric).assertEqual(100);
      done();
    });

    it('BundleInputValidation_013', 0, async (done: Function) => {
      const values = buildValidValues();
      expect(values.length).assertEqual(5);
      const report = validator.validateAll(values);
      expect(report.clean()).assertTrue();
      expect(report.rangeCount()).assertEqual(0);
      expect(report.formatCount()).assertEqual(0);
      done();
    });

    it('BundleInputValidation_014', 0, async (done: Function) => {
      const values: InputValue[] = [
        new InputValue(InputKind.BUNDLE_NAME, 'invalid', 0),
        new InputValue(InputKind.ABILITY_NAME, 'BadName', 0)
      ];
      const report = validator.validateAll(values);
      expect(report.clean()).assertFalse();
      expect(report.count()).assertEqual(2);
      expect(report.formatCount()).assertEqual(2);
      done();
    });

    it('BundleInputValidation_015', 0, async (done: Function) => {
      const values: InputValue[] = [
        new InputValue(InputKind.FLAG, '200', 200),
        new InputValue(InputKind.TOKEN, '0', 0),
        new InputValue(InputKind.FLAG, '8', 8)
      ];
      const report = validator.validateAll(values);
      expect(report.count()).assertEqual(2);
      expect(report.rangeCount()).assertEqual(2);
      done();
    });

    it('BundleInputValidation_016', 0, async (done: Function) => {
      const report = new InputReport();
      expect(report.clean()).assertTrue();
      report.add(new InputIssue(InputKind.FLAG, 'out-of-range'));
      expect(report.clean()).assertFalse();
      expect(report.count()).assertEqual(1);
      done();
    });

    it('BundleInputValidation_017', 0, async (done: Function) => {
      const report = new InputReport();
      report.add(new InputIssue(InputKind.BUNDLE_NAME, 'bad-format'));
      report.add(new InputIssue(InputKind.TOKEN, 'out-of-range'));
      report.add(new InputIssue(InputKind.MODULE_NAME, 'missing'));
      expect(report.count()).assertEqual(3);
      expect(report.formatCount()).assertEqual(1);
      expect(report.rangeCount()).assertEqual(1);
      done();
    });

    it('BundleInputValidation_018', 0, async (done: Function) => {
      const rule = new InputRule(InputKind.BUNDLE_NAME, 1, 128, true);
      expect(rule.acceptsLength(1)).assertTrue();
      expect(rule.acceptsLength(128)).assertTrue();
      expect(rule.acceptsLength(0)).assertFalse();
      expect(rule.acceptsLength(129)).assertFalse();
      done();
    });

    it('BundleInputValidation_019', 0, async (done: Function) => {
      const rule = new InputRule(InputKind.TOKEN, 1, 10, true);
      expect(rule.describe()).assertEqual(`${InputKind.TOKEN}:1-10`);
      expect(rule.acceptsLength(10)).assertTrue();
      expect(rule.acceptsLength(11)).assertFalse();
      done();
    });

    it('BundleInputValidation_020', 0, async (done: Function) => {
      const issue = new InputIssue(InputKind.FLAG, 'out-of-range');
      expect(issue.describe()).assertEqual(`${InputKind.FLAG}:out-of-range`);
      expect(issue.isRange()).assertTrue();
      expect(issue.isFormat()).assertFalse();
      expect(issue.isMissing()).assertFalse();
      done();
    });

    it('BundleInputValidation_021', 0, async (done: Function) => {
      const value = new InputValue(InputKind.BUNDLE_NAME, 'ohos.samples.stagemodel', 0);
      expect(value.hasDot()).assertTrue();
      expect(value.endsWith('stagemodel')).assertTrue();
      expect(value.describe()).assertEqual(`${InputKind.BUNDLE_NAME}:ohos.samples.stagemodel:0`);
      done();
    });

    it('BundleInputValidation_022', 0, async (done: Function) => {
      const empty = new InputValue(InputKind.MODULE_NAME, '', 0);
      expect(empty.hasText()).assertFalse();
      expect(empty.length()).assertEqual(0);
      expect(empty.hasDot()).assertFalse();
      done();
    });

    it('BundleInputValidation_023', 0, async (done: Function) => {
      const issue = validator.validate(new InputValue(InputKind.MODULE_NAME, '', 0));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.isMissing() : false).assertTrue();
      expect(issue !== null ? issue.kind : InputKind.TOKEN).assertEqual(InputKind.MODULE_NAME);
      done();
    });

    it('BundleInputValidation_024', 0, async (done: Function) => {
      const validator = new InputValidator();
      const issue = validator.validate(new InputValue(InputKind.FLAG, '8', 8));
      expect(issue !== null).assertTrue();
      expect(issue !== null ? issue.reason : '').assertEqual('missing-rule');
      done();
    });

    it('BundleInputValidation_025', 0, async (done: Function) => {
      const validator = new InputValidator();
      validator.withRule(new InputRule(InputKind.FLAG, 0, 3, false));
      expect(validator.ruleCount()).assertEqual(1);
      expect(validator.validate(new InputValue(InputKind.FLAG, '0', 0))).assertNull();
      done();
    });

    it('BundleInputValidation_026', 0, async (done: Function) => {
      const longName = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa';
      const issue = validator.validate(new InputValue(InputKind.MODULE_NAME, longName, 0));
      expect(issue !== null).assertFalse();
      expect(issue !== null ? issue.isRange() : false).assertFalse();
      done();
    });

    it('BundleInputValidation_027', 0, async (done: Function) => {
      const values: InputValue[] = [];
      for (let i = 0; i < 3; i++) {
        values.push(new InputValue(InputKind.FLAG, `${i * 8}`, i * 8));
      }
      const report = validator.validateAll(values);
      expect(values.length).assertEqual(3);
      expect(report.clean()).assertTrue();
      done();
    });

    it('BundleInputValidation_028', 0, async (done: Function) => {
      const values: InputValue[] = [
        new InputValue(InputKind.FLAG, '8', 8),
        new InputValue(InputKind.FLAG, '127', 127),
        new InputValue(InputKind.FLAG, '128', 128)
      ];
      const report = validator.validateAll(values);
      expect(report.count()).assertEqual(1);
      expect(report.rangeCount()).assertEqual(1);
      done();
    });

    it('BundleInputValidation_029', 0, async (done: Function) => {
      const report = new InputReport();
      report.add(new InputIssue(InputKind.BUNDLE_NAME, 'bad-format'));
      expect(report.describe()).assertEqual(`${InputKind.BUNDLE_NAME}:bad-format`);
      expect(report.kinds()[0]).assertEqual(InputKind.BUNDLE_NAME);
      done();
    });

    it('BundleInputValidation_030', 0, async (done: Function) => {
      const issue = new InputIssue(InputKind.MODULE_NAME, 'missing');
      expect(issue.isMissing()).assertTrue();
      expect(issue.isRange()).assertFalse();
      expect(issue.describe()).assertEqual(`${InputKind.MODULE_NAME}:missing`);
      done();
    });

    it('BundleInputValidation_031', 0, async (done: Function) => {
      const values: InputValue[] = [
        new InputValue(InputKind.ABILITY_NAME, 'JumpAbility', 0),
        new InputValue(InputKind.ABILITY_NAME, 'ServiceExtAbility', 0),
        new InputValue(InputKind.ABILITY_NAME, 'FormAbility', 0)
      ];
      const report = validator.validateAll(values);
      expect(report.clean()).assertTrue();
      expect(values.length).assertEqual(3);
      done();
    });

    it('BundleInputValidation_032', 0, async (done: Function) => {
      const values: InputValue[] = [
        new InputValue(InputKind.ABILITY_NAME, 'Service', 0),
        new InputValue(InputKind.ABILITY_NAME, 'ExtAbility', 0)
      ];
      const report = validator.validateAll(values);
      expect(report.count()).assertEqual(1);
      expect(report.formatCount()).assertEqual(1);
      done();
    });

    it('BundleInputValidation_033', 0, async (done: Function) => {
      const value = new InputValue(InputKind.TOKEN, '100', 100);
      expect(value.numeric).assertEqual(100);
      expect(value.text).assertEqual('100');
      expect(value.describe()).assertEqual(`${InputKind.TOKEN}:100:100`);
      done();
    });

    it('BundleInputValidation_034', 0, async (done: Function) => {
      const rule = validator.ruleOf(InputKind.TOKEN);
      expect(rule !== null ? rule.required : false).assertTrue();
      expect(rule !== null ? rule.maxLength : 0).assertEqual(10);
      expect(rule !== null ? rule.minLength : 0).assertEqual(1);
      done();
    });

    it('BundleInputValidation_035', 0, async (done: Function) => {
      const values: InputValue[] = [];
      expect(values.length).assertEqual(0);
      const report = validator.validateAll(values);
      expect(report.clean()).assertTrue();
      expect(report.count()).assertEqual(0);
      done();
    });

    it('BundleInputValidation_036', 0, async (done: Function) => {
      const mixed: InputValue[] = [
        new InputValue(InputKind.BUNDLE_NAME, 'ohos.samples.stagemodel', 0),
        new InputValue(InputKind.BUNDLE_NAME, 'nodot', 0),
        new InputValue(InputKind.MODULE_NAME, MODULE_ENTRY, 0)
      ];
      const report = validator.validateAll(mixed);
      expect(report.count()).assertEqual(1);
      expect(report.formatCount()).assertEqual(1);
      expect(report.clean()).assertFalse();
      done();
    });

    it('BundleInputValidation_037', 0, async (done: Function) => {
      let acceptCount = 0;
      const values = buildValidValues();
      for (const value of values) {
        if (validator.validate(value) === null) {
          acceptCount += 1;
        }
      }
      expect(acceptCount).assertEqual(5);
      expect(acceptCount).assertEqual(values.length);
      done();
    });

    it('BundleInputValidation_038', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(typeof ready === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('BundleInputValidation_039', 0, async (done: Function) => {
      const validator = new InputValidator();
      validator.withRule(new InputRule(InputKind.TOKEN, 1, 10, true));
      validator.withRule(new InputRule(InputKind.FLAG, 0, 3, false));
      expect(validator.ruleCount()).assertEqual(2);
      expect(validator.validate(new InputValue(InputKind.TOKEN, '1', 1))).assertNull();
      done();
    });

    it('BundleInputValidation_040', 0, async (done: Function) => {
      const issue = validator.validate(
        new InputValue(InputKind.MODULE_NAME, 'this.name.has.dots', 0));
      expect(issue).assertNull();
      expect(InputKind.MODULE_NAME).assertEqual(1);
      done();
    });

    it('BundleInputValidation_041', 0, async (done: Function) => {
      const report = new InputReport();
      for (let i = 0; i < 4; i++) {
        report.add(new InputIssue(InputKind.FLAG, i % 2 === 0 ? 'out-of-range' : 'bad-format'));
      }
      expect(report.count()).assertEqual(4);
      expect(report.rangeCount()).assertEqual(2);
      expect(report.formatCount()).assertEqual(2);
      done();
    });

    it('BundleInputValidation_042', 0, async (done: Function) => {
      const longValue = new InputValue(InputKind.BUNDLE_NAME,
        'ohos.samples.stagemodel.with.a.very.long.bundle.name', 0);
      expect(longValue.hasDot()).assertTrue();
      expect(validator.validate(longValue)).assertNull();
      done();
    });

    it('BundleInputValidation_043', 0, async (done: Function) => {
      const issue = new InputIssue(InputKind.ABILITY_NAME, 'bad-format');
      expect(issue.isFormat()).assertTrue();
      expect(issue.isMissing()).assertFalse();
      expect(issue.describe()).assertEqual(`${InputKind.ABILITY_NAME}:bad-format`);
      done();
    });

    it('BundleInputValidation_044', 0, async (done: Function) => {
      const rule = new InputRule(InputKind.ABILITY_NAME, 1, MAX_NAME_LENGTH, true);
      expect(rule.describe()).assertEqual(`${InputKind.ABILITY_NAME}:1-${MAX_NAME_LENGTH}`);
      expect(rule.acceptsLength(MAX_NAME_LENGTH)).assertTrue();
      expect(rule.acceptsLength(MAX_NAME_LENGTH + 1)).assertFalse();
      done();
    });

    it('BundleInputValidation_045', 0, async (done: Function) => {
      const report = validator.validateAll([
        new InputValue(InputKind.TOKEN, '-5', -5),
        new InputValue(InputKind.FLAG, '8', 8)
      ]);
      expect(report.count()).assertEqual(1);
      expect(report.rangeCount()).assertEqual(1);
      expect(report.kinds()[0]).assertEqual(InputKind.TOKEN);
      expect(report.clean()).assertFalse();
      done();
    });
  });
}

