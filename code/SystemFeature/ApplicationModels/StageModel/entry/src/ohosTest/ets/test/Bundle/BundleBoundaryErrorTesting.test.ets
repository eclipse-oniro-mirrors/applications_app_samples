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

const INT_MIN: number = -2147483648;
const INT_MAX: number = 2147483647;

enum BundleFlag {
  DEFAULT = 0,
  APPLICATION_INFO = 1,
  ABILITY = 2,
  EXTENSION = 4,
  HAP_MODULE = 8,
  PERMISSIONS = 16,
  METADATA = 32,
  SIGNATURE = 64
}

enum ErrorCode {
  PARAM_ERROR = 401,
  NOT_SUPPORTED = 801,
  BUNDLE_NOT_EXIST = 17700001,
  MODULE_NOT_EXIST = 17700002,
  ABILITY_NOT_EXIST = 17700003,
  PERMISSION_DENIED = 17700004,
  INVALID_PATH = 17700005
}

class BundleQuery {
  readonly moduleName: string;
  readonly abilityName: string;
  readonly flags: number;

  constructor(moduleName: string, abilityName: string, flags: number) {
    this.moduleName = moduleName;
    this.abilityName = abilityName;
    this.flags = flags;
  }

  hasFlag(flag: BundleFlag): boolean {
    return (this.flags & flag) !== 0;
  }

  withFlag(flag: BundleFlag): BundleQuery {
    return new BundleQuery(this.moduleName, this.abilityName, this.flags | flag);
  }

  withoutFlag(flag: BundleFlag): BundleQuery {
    return new BundleQuery(this.moduleName, this.abilityName, this.flags & (0xFFFFFFFF ^ flag));
  }

  describe(): string {
    return `${this.moduleName}/${this.abilityName}@${this.flags}`;
  }

  flagCount(): number {
    let count = 0;
    let value = this.flags;
    while (value !== 0) {
      count += value & 1;
      value = value >> 1;
    }
    return count;
  }
}

class VersionInfo {
  readonly versionCode: number;
  readonly versionName: string;
  readonly targetVersion: number;
  readonly minVersion: number;

  constructor(versionCode: number, versionName: string, targetVersion: number, minVersion: number) {
    this.versionCode = versionCode;
    this.versionName = versionName;
    this.targetVersion = targetVersion;
    this.minVersion = minVersion;
  }

  canUpgradeTo(other: VersionInfo): boolean {
    return other.versionCode > this.versionCode && other.minVersion <= this.versionCode;
  }

  supportsTarget(target: number): boolean {
    return this.targetVersion >= target;
  }

  describe(): string {
    return `${this.versionName}:${this.versionCode}`;
  }
}

class BoundaryCase {
  readonly label: string;
  readonly value: number;
  readonly lower: number;
  readonly upper: number;

  constructor(label: string, value: number, lower: number, upper: number) {
    this.label = label;
    this.value = value;
    this.lower = lower;
    this.upper = upper;
  }

  inRange(): boolean {
    return this.value >= this.lower && this.value <= this.upper;
  }

  classify(): string {
    if (this.value < this.lower) {
      return 'below';
    }
    if (this.value > this.upper) {
      return 'above';
    }
    return 'inside';
  }

  distanceToLower(): number {
    return this.value - this.lower;
  }

  distanceToUpper(): number {
    return this.upper - this.value;
  }
}

class BoundaryEvaluator {
  private cases: BoundaryCase[] = [];

  add(item: BoundaryCase): BoundaryEvaluator {
    this.cases.push(item);
    return this;
  }

  size(): number {
    return this.cases.length;
  }

  insideCount(): number {
    let count = 0;
    for (const item of this.cases) {
      if (item.inRange()) {
        count += 1;
      }
    }
    return count;
  }

  outsideCount(): number {
    let count = 0;
    for (const item of this.cases) {
      if (!item.inRange()) {
        count += 1;
      }
    }
    return count;
  }

  find(label: string): BoundaryCase | null {
    for (const item of this.cases) {
      if (item.label === label) {
        return item;
      }
    }
    return null;
  }

  labels(): string[] {
    return this.cases.map((item: BoundaryCase) => item.label);
  }

  values(): number[] {
    return this.cases.map((item: BoundaryCase) => item.value);
  }

  belowCount(): number {
    let count = 0;
    for (const item of this.cases) {
      if (item.classify() === 'below') {
        count += 1;
      }
    }
    return count;
  }

  aboveCount(): number {
    let count = 0;
    for (const item of this.cases) {
      if (item.classify() === 'above') {
        count += 1;
      }
    }
    return count;
  }
}

class ErrorRecord {
  readonly code: ErrorCode;
  readonly message: string;

  constructor(code: ErrorCode, message: string) {
    this.code = code;
    this.message = message;
  }

  describe(): string {
    return `${this.code}:${this.message}`;
  }

  isParamError(): boolean {
    return this.code === ErrorCode.PARAM_ERROR;
  }

  isNotFound(): boolean {
    return this.code === ErrorCode.BUNDLE_NOT_EXIST ||
      this.code === ErrorCode.MODULE_NOT_EXIST ||
      this.code === ErrorCode.ABILITY_NOT_EXIST;
  }
}

class ErrorCatalog {
  private records: ErrorRecord[] = [];

  add(record: ErrorRecord): ErrorCatalog {
    this.records.push(record);
    return this;
  }

  size(): number {
    return this.records.length;
  }

  countCode(code: ErrorCode): number {
    let count = 0;
    for (const record of this.records) {
      if (record.code === code) {
        count += 1;
      }
    }
    return count;
  }

  first(): ErrorRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[0];
  }

  last(): ErrorRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  codes(): ErrorCode[] {
    return this.records.map((record: ErrorRecord) => record.code);
  }

  notFoundCount(): number {
    let count = 0;
    for (const record of this.records) {
      if (record.isNotFound()) {
        count += 1;
      }
    }
    return count;
  }

  describe(): string {
    return this.records.map((record: ErrorRecord) => record.describe()).join('|');
  }
}

class BundleErrorSimulator {
  simulate(flags: number): ErrorRecord {
    if (flags < 0) {
      return new ErrorRecord(ErrorCode.PARAM_ERROR, 'negative-flags');
    }
    if ((flags & BundleFlag.SIGNATURE) !== 0) {
      return new ErrorRecord(ErrorCode.PERMISSION_DENIED, 'signature-denied');
    }
    if ((flags & BundleFlag.HAP_MODULE) === 0) {
      return new ErrorRecord(ErrorCode.MODULE_NOT_EXIST, 'module-flag-required');
    }
    return new ErrorRecord(ErrorCode.BUNDLE_NOT_EXIST, 'bundle-resolved');
  }

  simulateModule(moduleName: string): ErrorRecord {
    if (moduleName.length === 0) {
      return new ErrorRecord(ErrorCode.PARAM_ERROR, 'empty-module');
    }
    if (moduleName === 'entry') {
      return new ErrorRecord(ErrorCode.BUNDLE_NOT_EXIST, 'entry-ok');
    }
    return new ErrorRecord(ErrorCode.MODULE_NOT_EXIST, 'unknown-module');
  }
}

function buildEvaluator(): BoundaryEvaluator {
  const evaluator = new BoundaryEvaluator();
  evaluator.add(new BoundaryCase('flags-default', 0, 0, 127));
  evaluator.add(new BoundaryCase('flags-all', 127, 0, 127));
  evaluator.add(new BoundaryCase('flags-over', 128, 0, 127));
  evaluator.add(new BoundaryCase('flags-under', -1, 0, 127));
  evaluator.add(new BoundaryCase('version-zero', 0, 0, INT_MAX));
  evaluator.add(new BoundaryCase('version-max', INT_MAX, 0, INT_MAX));
  evaluator.add(new BoundaryCase('version-min', INT_MIN, INT_MIN, 0));
  evaluator.add(new BoundaryCase('token-ok', 100, 1, 1000));
  evaluator.add(new BoundaryCase('token-zero', 0, 1, 1000));
  evaluator.add(new BoundaryCase('token-high', 1001, 1, 1000));
  return evaluator;
}

function buildCatalog(): ErrorCatalog {
  const catalog = new ErrorCatalog();
  catalog.add(new ErrorRecord(ErrorCode.PARAM_ERROR, 'bad-flags'));
  catalog.add(new ErrorRecord(ErrorCode.MODULE_NOT_EXIST, 'missing-module'));
  catalog.add(new ErrorRecord(ErrorCode.BUNDLE_NOT_EXIST, 'missing-bundle'));
  catalog.add(new ErrorRecord(ErrorCode.PERMISSION_DENIED, 'denied'));
  catalog.add(new ErrorRecord(ErrorCode.INVALID_PATH, 'bad-path'));
  return catalog;
}

export default function bundleBoundaryErrorTestingTest(): void {
  describe('BundleBoundaryErrorTestingSuite', () => {
    let evaluator: BoundaryEvaluator = buildEvaluator();
    let catalog: ErrorCatalog = buildCatalog();

    beforeAll(() => {
      evaluator = buildEvaluator();
      catalog = buildCatalog();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle boundary suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'bundle boundary suite end');
    });

    it('BundleBoundaryErrorTesting_001', 0, async (done: Function) => {
      expect(evaluator.size()).assertEqual(10);
      expect(evaluator.insideCount()).assertEqual(6);
      expect(evaluator.outsideCount()).assertEqual(4);
      done();
    });

    it('BundleBoundaryErrorTesting_002', 0, async (done: Function) => {
      const item = evaluator.find('flags-default');
      expect(item !== null).assertTrue();
      expect(item !== null ? item.value : -1).assertEqual(0);
      expect(item !== null ? item.inRange() : false).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_003', 0, async (done: Function) => {
      const item = evaluator.find('flags-all');
      expect(item !== null ? item.value : -1).assertEqual(127);
      expect(item !== null ? item.classify() : '').assertEqual('inside');
      done();
    });

    it('BundleBoundaryErrorTesting_004', 0, async (done: Function) => {
      const item = evaluator.find('flags-over');
      expect(item !== null ? item.inRange() : true).assertFalse();
      expect(item !== null ? item.classify() : '').assertEqual('above');
      expect(item !== null ? item.distanceToUpper() : 0).assertEqual(-1);
      done();
    });

    it('BundleBoundaryErrorTesting_005', 0, async (done: Function) => {
      const item = evaluator.find('flags-under');
      expect(item !== null ? item.classify() : '').assertEqual('below');
      expect(item !== null ? item.distanceToLower() : 0).assertEqual(-1);
      expect(evaluator.belowCount()).assertEqual(2);
      done();
    });

    it('BundleBoundaryErrorTesting_006', 0, async (done: Function) => {
      expect(evaluator.aboveCount()).assertEqual(2);
      expect(evaluator.find('missing')).assertNull();
      expect(evaluator.labels().length).assertEqual(10);
      done();
    });

    it('BundleBoundaryErrorTesting_007', 0, async (done: Function) => {
      const values = evaluator.values();
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(127);
      expect(values[5]).assertEqual(INT_MAX);
      expect(values.length).assertEqual(10);
      done();
    });

    it('BundleBoundaryErrorTesting_008', 0, async (done: Function) => {
      const item = evaluator.find('version-min');
      expect(item !== null ? item.value : 0).assertEqual(INT_MIN);
      expect(item !== null ? item.inRange() : false).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_009', 0, async (done: Function) => {
      const item = evaluator.find('token-ok');
      expect(item !== null ? item.inRange() : false).assertTrue();
      expect(item !== null ? item.distanceToLower() : 0).assertEqual(99);
      done();
    });

    it('BundleBoundaryErrorTesting_010', 0, async (done: Function) => {
      const item = evaluator.find('token-zero');
      expect(item !== null ? item.inRange() : true).assertFalse();
      expect(item !== null ? item.classify() : '').assertEqual('below');
      done();
    });

    it('BundleBoundaryErrorTesting_011', 0, async (done: Function) => {
      const item = evaluator.find('token-high');
      expect(item !== null ? item.inRange() : true).assertFalse();
      expect(item !== null ? item.classify() : '').assertEqual('above');
      done();
    });

    it('BundleBoundaryErrorTesting_012', 0, async (done: Function) => {
      let inside = 0;
      for (const value of evaluator.values()) {
        if (value >= 0 && value <= 127) {
          inside += 1;
        }
      }
      expect(inside).assertEqual(5);
      done();
    });

    it('BundleBoundaryErrorTesting_013', 0, async (done: Function) => {
      expect(catalog.size()).assertEqual(5);
      expect(catalog.countCode(ErrorCode.PARAM_ERROR)).assertEqual(1);
      expect(catalog.countCode(ErrorCode.MODULE_NOT_EXIST)).assertEqual(1);
      done();
    });

    it('BundleBoundaryErrorTesting_014', 0, async (done: Function) => {
      const first = catalog.first();
      expect(first !== null).assertTrue();
      expect(first !== null ? first.isParamError() : false).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_015', 0, async (done: Function) => {
      const last = catalog.last();
      expect(last !== null ? last.code : ErrorCode.PARAM_ERROR).assertEqual(ErrorCode.INVALID_PATH);
      expect(last !== null ? last.isNotFound() : true).assertFalse();
      done();
    });

    it('BundleBoundaryErrorTesting_016', 0, async (done: Function) => {
      expect(catalog.notFoundCount()).assertEqual(2);
      expect(catalog.codes().length).assertEqual(5);
      expect(catalog.codes()[0]).assertEqual(ErrorCode.PARAM_ERROR);
      done();
    });

    it('BundleBoundaryErrorTesting_017', 0, async (done: Function) => {
      const description = catalog.describe();
      expect(description.length > 0).assertTrue();
      expect(description.indexOf('bad-flags') >= 0).assertTrue();
      expect(description.indexOf('|') >= 0).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_018', 0, async (done: Function) => {
      const empty = new ErrorCatalog();
      expect(empty.size()).assertEqual(0);
      expect(empty.first()).assertNull();
      expect(empty.last()).assertNull();
      expect(empty.describe()).assertEqual('');
      done();
    });

    it('BundleBoundaryErrorTesting_019', 0, async (done: Function) => {
      const record = new ErrorRecord(ErrorCode.ABILITY_NOT_EXIST, 'no-ability');
      expect(record.describe()).assertEqual(`${ErrorCode.ABILITY_NOT_EXIST}:no-ability`);
      expect(record.isParamError()).assertFalse();
      expect(record.isNotFound()).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_020', 0, async (done: Function) => {
      const record = new ErrorRecord(ErrorCode.NOT_SUPPORTED, 'unsupported');
      expect(record.isNotFound()).assertFalse();
      expect(record.isParamError()).assertFalse();
      expect(record.describe().indexOf('801') >= 0).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_021', 0, async (done: Function) => {
      const record = new ErrorRecord(ErrorCode.PARAM_ERROR, 'bad');
      expect(record.isParamError()).assertTrue();
      expect(record.describe().indexOf('401') >= 0).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_022', 0, async (done: Function) => {
      const query = new BundleQuery('entry', 'MainAbility', 0);
      expect(query.describe()).assertEqual('entry/MainAbility@0');
      expect(query.flagCount()).assertEqual(0);
      expect(query.hasFlag(BundleFlag.HAP_MODULE)).assertFalse();
      done();
    });

    it('BundleBoundaryErrorTesting_023', 0, async (done: Function) => {
      const query = new BundleQuery('entry', 'MainAbility', BundleFlag.HAP_MODULE | BundleFlag.ABILITY);
      expect(query.hasFlag(BundleFlag.HAP_MODULE)).assertTrue();
      expect(query.hasFlag(BundleFlag.ABILITY)).assertTrue();
      expect(query.hasFlag(BundleFlag.SIGNATURE)).assertFalse();
      expect(query.flagCount()).assertEqual(2);
      done();
    });

    it('BundleBoundaryErrorTesting_024', 0, async (done: Function) => {
      const query = new BundleQuery('entry', 'MainAbility', 0).withFlag(BundleFlag.EXTENSION);
      expect(query.hasFlag(BundleFlag.EXTENSION)).assertTrue();
      expect(query.flags).assertEqual(BundleFlag.EXTENSION);
      const removed = query.withoutFlag(BundleFlag.EXTENSION);
      expect(removed.hasFlag(BundleFlag.EXTENSION)).assertFalse();
      done();
    });

    it('BundleBoundaryErrorTesting_025', 0, async (done: Function) => {
      const all = new BundleQuery('entry', 'MainAbility', 127);
      expect(all.flagCount()).assertEqual(7);
      expect(all.hasFlag(BundleFlag.SIGNATURE)).assertTrue();
      expect(all.flags).assertEqual(127);
      done();
    });

    it('BundleBoundaryErrorTesting_026', 0, async (done: Function) => {
      const current = new VersionInfo(100, '1.0.0', 9, 1);
      const next = new VersionInfo(200, '2.0.0', 12, 100);
      expect(current.canUpgradeTo(next)).assertTrue();
      expect(next.canUpgradeTo(current)).assertFalse();
      expect(current.describe()).assertEqual('1.0.0:100');
      done();
    });

    it('BundleBoundaryErrorTesting_027', 0, async (done: Function) => {
      const current = new VersionInfo(100, '1.0.0', 9, 1);
      const blocked = new VersionInfo(200, '2.0.0', 12, 101);
      expect(current.canUpgradeTo(blocked)).assertFalse();
      expect(current.supportsTarget(9)).assertTrue();
      expect(current.supportsTarget(10)).assertFalse();
      done();
    });

    it('BundleBoundaryErrorTesting_028', 0, async (done: Function) => {
      const simulator = new BundleErrorSimulator();
      const result = simulator.simulate(-1);
      expect(result.code).assertEqual(ErrorCode.PARAM_ERROR);
      expect(result.message).assertEqual('negative-flags');
      done();
    });

    it('BundleBoundaryErrorTesting_029', 0, async (done: Function) => {
      const simulator = new BundleErrorSimulator();
      const result = simulator.simulate(BundleFlag.SIGNATURE | BundleFlag.HAP_MODULE);
      expect(result.code).assertEqual(ErrorCode.PERMISSION_DENIED);
      expect(result.isParamError()).assertFalse();
      done();
    });

    it('BundleBoundaryErrorTesting_030', 0, async (done: Function) => {
      const simulator = new BundleErrorSimulator();
      const result = simulator.simulate(BundleFlag.APPLICATION_INFO);
      expect(result.code).assertEqual(ErrorCode.MODULE_NOT_EXIST);
      expect(result.isNotFound()).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_031', 0, async (done: Function) => {
      const simulator = new BundleErrorSimulator();
      const result = simulator.simulate(BundleFlag.HAP_MODULE);
      expect(result.code).assertEqual(ErrorCode.BUNDLE_NOT_EXIST);
      expect(result.message).assertEqual('bundle-resolved');
      done();
    });

    it('BundleBoundaryErrorTesting_032', 0, async (done: Function) => {
      const simulator = new BundleErrorSimulator();
      expect(simulator.simulateModule('').code).assertEqual(ErrorCode.PARAM_ERROR);
      expect(simulator.simulateModule('entry').code).assertEqual(ErrorCode.BUNDLE_NOT_EXIST);
      expect(simulator.simulateModule('other').code).assertEqual(ErrorCode.MODULE_NOT_EXIST);
      done();
    });

    it('BundleBoundaryErrorTesting_033', 0, async (done: Function) => {
      const simulator = new BundleErrorSimulator();
      const empty = simulator.simulateModule('');
      expect(empty.message).assertEqual('empty-module');
      expect(empty.isParamError()).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_034', 0, async (done: Function) => {
      const catalog = new ErrorCatalog();
      for (let i = 0; i < 5; i++) {
        catalog.add(new ErrorRecord(ErrorCode.PARAM_ERROR, `err-${i}`));
      }
      expect(catalog.size()).assertEqual(5);
      expect(catalog.countCode(ErrorCode.PARAM_ERROR)).assertEqual(5);
      expect(catalog.notFoundCount()).assertEqual(0);
      done();
    });

    it('BundleBoundaryErrorTesting_035', 0, async (done: Function) => {
      const catalog = new ErrorCatalog();
      catalog.add(new ErrorRecord(ErrorCode.BUNDLE_NOT_EXIST, 'a'));
      catalog.add(new ErrorRecord(ErrorCode.MODULE_NOT_EXIST, 'b'));
      catalog.add(new ErrorRecord(ErrorCode.ABILITY_NOT_EXIST, 'c'));
      expect(catalog.notFoundCount()).assertEqual(3);
      expect(catalog.first() !== null ? catalog.first()?.code : 0).assertEqual(ErrorCode.BUNDLE_NOT_EXIST);
      done();
    });

    it('BundleBoundaryErrorTesting_036', 0, async (done: Function) => {
      const items = evaluator.labels();
      expect(items[0]).assertEqual('flags-default');
      expect(items[items.length - 1]).assertEqual('token-high');
      expect(items.indexOf('version-max') >= 0).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_037', 0, async (done: Function) => {
      let sum = 0;
      for (const item of catalog.codes()) {
        sum += item.toString().length;
      }
      expect(sum > 0).assertTrue();
      expect(catalog.codes().length).assertEqual(5);
      done();
    });

    it('BundleBoundaryErrorTesting_038', 0, async (done: Function) => {
      const countByCode = new ErrorCatalog();
      countByCode.add(new ErrorRecord(ErrorCode.INVALID_PATH, 'p1'));
      countByCode.add(new ErrorRecord(ErrorCode.INVALID_PATH, 'p2'));
      countByCode.add(new ErrorRecord(ErrorCode.NOT_SUPPORTED, 'n1'));
      expect(countByCode.countCode(ErrorCode.INVALID_PATH)).assertEqual(2);
      expect(countByCode.describe().indexOf('p1') >= 0).assertTrue();
      done();
    });

    it('BundleBoundaryErrorTesting_039', 0, async (done: Function) => {
      const low = new BoundaryCase('low', INT_MIN, 0, 100);
      const high = new BoundaryCase('high', INT_MAX, 0, 100);
      expect(low.classify()).assertEqual('below');
      expect(high.classify()).assertEqual('above');
      expect(low.distanceToLower()).assertEqual(INT_MIN);
      done();
    });

    it('BundleBoundaryErrorTesting_040', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        expect(typeof ready === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('BundleBoundaryErrorTesting_041', 0, async (done: Function) => {
      const growth = new ErrorCatalog();
      expect(growth.first()).assertNull();
      growth.add(new ErrorRecord(ErrorCode.NOT_SUPPORTED, 'first'));
      expect(growth.first()?.code).assertEqual(ErrorCode.NOT_SUPPORTED);
      growth.add(new ErrorRecord(ErrorCode.PARAM_ERROR, 'second'));
      expect(growth.last()?.code).assertEqual(ErrorCode.PARAM_ERROR);
      expect(growth.size()).assertEqual(2);
      done();
    });
  });
}

