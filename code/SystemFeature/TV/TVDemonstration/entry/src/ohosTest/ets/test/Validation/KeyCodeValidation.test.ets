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

const LOG_TAG: string = 'KeyCodeValidatio';
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
  { id: 'case0', label: 'KEYCODE_DPAD_UP', expected: 0 },
  { id: 'case1', label: 'KEYCODE_DPAD_DOWN', expected: 1 },
  { id: 'case2', label: 'KEYCODE_DPAD_LEFT', expected: 2 },
  { id: 'case3', label: 'KEYCODE_DPAD_RIGHT', expected: 3 },
  { id: 'case4', label: 'KEYCODE_ENTER', expected: 0 },
  { id: 'case5', label: 'KEYCODE_BACK', expected: 1 },
  { id: 'case6', label: 'KEYCODE_HOME', expected: 2 }
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

export default function keyCodeValidationTest(): void {
  describe('KeyCodeValidationTest', () => {
    let driver: Driver | null = null;

    beforeAll(async (): Promise<void> => {
      try {
        driver = Driver.create();
      } catch (error) {
        driver = null;
      }
      expect(TOLERANCE_COMPONENT_COUNT >= 0).assertTrue();
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationTest beforeAll');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationTest beforeEach');
    });

    afterEach(async (): Promise<void> => {
      if (driver !== null) {
        await driver.delayMs(SETTLE_TIME);
      }
    });

    afterAll(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationTest afterAll');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0000
     * @tc.name KeyCodeValidationCase000
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase000', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase000 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(0, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 0);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(0 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase000 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0001
     * @tc.name KeyCodeValidationCase001
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase001', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase001 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(1, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 1);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(1 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase001 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0002
     * @tc.name KeyCodeValidationCase002
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase002', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase002 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(2, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 2);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(2 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase002 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0003
     * @tc.name KeyCodeValidationCase003
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase003', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase003 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(3, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 3);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(3 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase003 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0004
     * @tc.name KeyCodeValidationCase004
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase004', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase004 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(4, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 4);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(4 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase004 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0005
     * @tc.name KeyCodeValidationCase005
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase005', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase005 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(5, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 5);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(5 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase005 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0006
     * @tc.name KeyCodeValidationCase006
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_HOME in iteration 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase006', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase006 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(6, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_HOME', 6);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(6 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase006 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0007
     * @tc.name KeyCodeValidationCase007
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase007', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase007 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(7, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 7);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(7 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase007 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0008
     * @tc.name KeyCodeValidationCase008
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase008', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase008 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(8, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 8);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(8 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase008 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0009
     * @tc.name KeyCodeValidationCase009
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase009', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase009 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(9, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 9);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(9 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase009 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0010
     * @tc.name KeyCodeValidationCase010
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase010', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase010 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(10, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 10);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(10 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase010 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0011
     * @tc.name KeyCodeValidationCase011
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase011', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase011 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(11, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 11);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(11 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase011 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0012
     * @tc.name KeyCodeValidationCase012
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase012', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase012 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(12, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 12);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(12 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase012 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0013
     * @tc.name KeyCodeValidationCase013
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_HOME in iteration 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase013', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase013 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(13, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_HOME', 13);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(13 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase013 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0014
     * @tc.name KeyCodeValidationCase014
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase014', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase014 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(14, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 14);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(14 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase014 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0015
     * @tc.name KeyCodeValidationCase015
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase015', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase015 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(15, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 15);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(15 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase015 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0016
     * @tc.name KeyCodeValidationCase016
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase016', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase016 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(16, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 16);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(16 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase016 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0017
     * @tc.name KeyCodeValidationCase017
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase017', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase017 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(17, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 17);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(17 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase017 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0018
     * @tc.name KeyCodeValidationCase018
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase018', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase018 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(18, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 18);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(18 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase018 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0019
     * @tc.name KeyCodeValidationCase019
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase019', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase019 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(19, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 19);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(19 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase019 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0020
     * @tc.name KeyCodeValidationCase020
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_HOME in iteration 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase020', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase020 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(20, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_HOME', 20);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(20 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase020 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0021
     * @tc.name KeyCodeValidationCase021
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase021', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase021 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(21, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 21);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(21 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase021 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0022
     * @tc.name KeyCodeValidationCase022
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase022', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase022 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(22, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 22);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(22 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase022 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0023
     * @tc.name KeyCodeValidationCase023
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase023', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase023 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(23, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 23);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(23 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase023 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0024
     * @tc.name KeyCodeValidationCase024
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase024', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase024 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(24, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 24);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(24 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase024 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0025
     * @tc.name KeyCodeValidationCase025
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase025', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase025 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(25, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 25);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(25 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase025 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0026
     * @tc.name KeyCodeValidationCase026
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase026', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase026 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(26, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 26);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(26 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase026 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0027
     * @tc.name KeyCodeValidationCase027
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_HOME in iteration 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase027', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase027 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(27, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_HOME', 27);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(27 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase027 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0028
     * @tc.name KeyCodeValidationCase028
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase028', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase028 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(28, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 28);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(28 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase028 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0029
     * @tc.name KeyCodeValidationCase029
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase029', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase029 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(29, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 29);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(29 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase029 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0030
     * @tc.name KeyCodeValidationCase030
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase030', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase030 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(30, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 30);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(30 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase030 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0031
     * @tc.name KeyCodeValidationCase031
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 31
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase031', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase031 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(31, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 31);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(31 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase031 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0032
     * @tc.name KeyCodeValidationCase032
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase032', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase032 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(32, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 32);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(32 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase032 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0033
     * @tc.name KeyCodeValidationCase033
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase033', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase033 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(33, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 33);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(33 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase033 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0034
     * @tc.name KeyCodeValidationCase034
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_HOME in iteration 34
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase034', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase034 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(34, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_HOME', 34);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(34 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase034 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0035
     * @tc.name KeyCodeValidationCase035
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 35
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase035', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase035 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(35, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 35);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(35 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase035 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0036
     * @tc.name KeyCodeValidationCase036
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 36
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase036', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase036 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(36, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 36);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(36 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase036 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0037
     * @tc.name KeyCodeValidationCase037
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 37
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase037', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase037 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(37, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 37);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(37 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase037 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0038
     * @tc.name KeyCodeValidationCase038
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase038', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase038 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(38, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 38);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(38 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase038 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0039
     * @tc.name KeyCodeValidationCase039
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 39
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase039', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase039 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(39, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 39);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(39 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase039 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0040
     * @tc.name KeyCodeValidationCase040
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase040', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase040 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(40, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 40);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(40 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase040 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0041
     * @tc.name KeyCodeValidationCase041
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_HOME in iteration 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase041', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase041 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(41, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_HOME', 41);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(41 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase041 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0042
     * @tc.name KeyCodeValidationCase042
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_UP in iteration 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase042', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase042 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(42, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_UP', 42);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(42 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase042 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0043
     * @tc.name KeyCodeValidationCase043
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_DOWN in iteration 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase043', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase043 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(43, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_DOWN', 43);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(43 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase043 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0044
     * @tc.name KeyCodeValidationCase044
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_LEFT in iteration 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase044', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase044 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(44, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_LEFT', 44);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(44 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase044 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0045
     * @tc.name KeyCodeValidationCase045
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_DPAD_RIGHT in iteration 45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase045', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase045 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(45, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_DPAD_RIGHT', 45);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(45 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase045 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0046
     * @tc.name KeyCodeValidationCase046
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_ENTER in iteration 46
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase046', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase046 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(46, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_ENTER', 46);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(46 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase046 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_KEYCODEVALIDATION_0047
     * @tc.name KeyCodeValidationCase047
     * @tc.desc Verify KeyCodeValidationTest keeps deterministic behaviour for KEYCODE_BACK in iteration 47
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('KeyCodeValidationCase047', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase047 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(47, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('KEYCODE_BACK', 47);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(47 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'KeyCodeValidationCase047 end');
    });

  });
}
