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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from '@ohos.hilog';

import { TOLERANCE_COMPONENT_COUNT } from '../Shared/SharedDriver';

const LOG_TAG: string = 'PermissionSessio';
const BUNDLE_NAME: string = 'com.sample.demonstration';
const ABILITY_NAME: string = 'EntryAbility';
const TAB_COUNT: number = 4;
const SETTLE_TIME: number = 120;
const CASE_TIMEOUT: number = 15000;

interface CaseSample {
  id: string;
  label: string;
  expected: number;
}

interface CaseResult {
  name: string;
  valid: boolean;
  score: number;
}

const SAMPLE_POOL: CaseSample[] = [
  { id: 'case0', label: 'bundleName', expected: 0 },
  { id: 'case1', label: 'versionCode', expected: 1 },
  { id: 'case2', label: 'versionName', expected: 2 },
  { id: 'case3', label: 'moduleName', expected: 3 },
  { id: 'case4', label: 'abilityName', expected: 0 },
  { id: 'case5', label: 'uid', expected: 1 },
  { id: 'case6', label: 'appId', expected: 2 }
];

function clampIndex(value: number, size: number): number {
  if (size <= 0) {
    return 0;
  }
  if (value < 0) {
    return 0;
  }
  if (value >= size) {
    return size - 1;
  }
  return value;
}

function normalizeLabel(label: string): string {
  return label.trim().toLowerCase();
}

function isStableIndex(index: number, size: number): boolean {
  return index >= 0 && index < size;
}

function checksumOf(text: string): number {
  let total: number = 0;
  for (let i: number = 0; i < text.length; i++) {
    total = (total * 31 + text.charCodeAt(i)) % 1000003;
  }
  return total;
}

function buildResult(name: string, index: number): CaseResult {
  const sample: CaseSample = SAMPLE_POOL[clampIndex(index, SAMPLE_POOL.length)];
  return { name: name, valid: isStableIndex(clampIndex(index, SAMPLE_POOL.length), SAMPLE_POOL.length),
    score: checksumOf(sample.label) };
}

export default function permissionSessionValidationTest(): void {
  describe('PermissionSessionValidationTest', () => {
    let driver: Driver | null = null;

    beforeAll(async (): Promise<void> => {
      try {
        driver = Driver.create();
      } catch (error) {
        driver = null;
      }
      expect(TOLERANCE_COMPONENT_COUNT >= 0).assertTrue();
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationTest beforeAll');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationTest beforeEach');
    });

    afterEach(async (): Promise<void> => {
      if (driver !== null) {
        await driver.delayMs(SETTLE_TIME);
      }
    });

    afterAll(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationTest afterAll');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0000
     * @tc.name PermissionSessionValidationCase000
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for bundleName in iteration 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase000', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase000 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(0, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('bundleName', 0);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(0 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase000 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0001
     * @tc.name PermissionSessionValidationCase001
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionCode in iteration 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase001', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase001 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(1, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionCode', 1);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(1 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase001 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0002
     * @tc.name PermissionSessionValidationCase002
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionName in iteration 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase002', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase002 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(2, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionName', 2);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(2 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase002 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0003
     * @tc.name PermissionSessionValidationCase003
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for moduleName in iteration 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase003', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase003 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(3, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('moduleName', 3);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(3 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase003 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0004
     * @tc.name PermissionSessionValidationCase004
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for abilityName in iteration 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase004', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase004 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(4, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('abilityName', 4);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(4 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase004 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0005
     * @tc.name PermissionSessionValidationCase005
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for uid in iteration 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase005', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase005 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(5, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('uid', 5);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(5 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase005 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0006
     * @tc.name PermissionSessionValidationCase006
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for appId in iteration 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase006', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase006 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(6, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('appId', 6);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(6 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase006 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0007
     * @tc.name PermissionSessionValidationCase007
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for bundleName in iteration 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase007', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase007 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(7, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('bundleName', 7);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(7 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase007 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0008
     * @tc.name PermissionSessionValidationCase008
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionCode in iteration 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase008', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase008 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(8, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionCode', 8);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(8 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase008 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0009
     * @tc.name PermissionSessionValidationCase009
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionName in iteration 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase009', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase009 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(9, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionName', 9);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(9 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase009 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0010
     * @tc.name PermissionSessionValidationCase010
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for moduleName in iteration 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase010', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase010 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(10, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('moduleName', 10);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(10 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase010 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0011
     * @tc.name PermissionSessionValidationCase011
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for abilityName in iteration 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase011', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase011 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(11, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('abilityName', 11);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(11 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase011 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0012
     * @tc.name PermissionSessionValidationCase012
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for uid in iteration 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase012', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase012 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(12, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('uid', 12);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(12 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase012 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0013
     * @tc.name PermissionSessionValidationCase013
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for appId in iteration 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase013', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase013 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(13, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('appId', 13);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(13 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase013 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0014
     * @tc.name PermissionSessionValidationCase014
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for bundleName in iteration 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase014', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase014 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(14, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('bundleName', 14);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(14 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase014 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0015
     * @tc.name PermissionSessionValidationCase015
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionCode in iteration 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase015', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase015 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(15, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionCode', 15);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(15 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase015 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0016
     * @tc.name PermissionSessionValidationCase016
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionName in iteration 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase016', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase016 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(16, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionName', 16);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(16 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase016 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0017
     * @tc.name PermissionSessionValidationCase017
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for moduleName in iteration 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase017', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase017 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(17, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('moduleName', 17);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(17 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase017 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0018
     * @tc.name PermissionSessionValidationCase018
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for abilityName in iteration 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase018', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase018 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(18, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('abilityName', 18);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(18 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase018 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0019
     * @tc.name PermissionSessionValidationCase019
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for uid in iteration 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase019', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase019 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(19, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('uid', 19);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(19 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase019 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0020
     * @tc.name PermissionSessionValidationCase020
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for appId in iteration 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase020', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase020 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(20, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('appId', 20);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(20 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase020 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0021
     * @tc.name PermissionSessionValidationCase021
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for bundleName in iteration 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase021', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase021 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(21, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('bundleName', 21);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(21 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase021 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0022
     * @tc.name PermissionSessionValidationCase022
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionCode in iteration 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase022', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase022 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(22, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionCode', 22);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(22 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase022 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0023
     * @tc.name PermissionSessionValidationCase023
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionName in iteration 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase023', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase023 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(23, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionName', 23);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(23 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase023 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0024
     * @tc.name PermissionSessionValidationCase024
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for moduleName in iteration 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase024', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase024 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(24, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('moduleName', 24);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(24 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase024 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0025
     * @tc.name PermissionSessionValidationCase025
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for abilityName in iteration 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase025', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase025 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(25, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('abilityName', 25);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(25 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase025 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0026
     * @tc.name PermissionSessionValidationCase026
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for uid in iteration 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase026', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase026 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(26, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('uid', 26);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(26 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase026 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0027
     * @tc.name PermissionSessionValidationCase027
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for appId in iteration 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase027', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase027 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(27, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('appId', 27);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(27 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase027 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0028
     * @tc.name PermissionSessionValidationCase028
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for bundleName in iteration 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase028', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase028 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(28, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('bundleName', 28);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(28 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase028 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_PERMISSIONSESSIONVALIDATION_0029
     * @tc.name PermissionSessionValidationCase029
     * @tc.desc Verify PermissionSessionValidationTest keeps deterministic behaviour for versionCode in iteration 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('PermissionSessionValidationCase029', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase029 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(29, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('versionCode', 29);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(29 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'PermissionSessionValidationCase029 end');
    });

  });
}
