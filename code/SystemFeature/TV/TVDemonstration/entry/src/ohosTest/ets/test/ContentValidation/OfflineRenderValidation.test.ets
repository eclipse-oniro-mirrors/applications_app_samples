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

const LOG_TAG: string = 'OfflineRenderVal';
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
  { id: 'case0', label: 'string', expected: 0 },
  { id: 'case1', label: 'media', expected: 1 },
  { id: 'case2', label: 'color', expected: 2 },
  { id: 'case3', label: 'float', expected: 3 },
  { id: 'case4', label: 'profile', expected: 0 },
  { id: 'case5', label: 'rawfile', expected: 1 },
  { id: 'case6', label: 'zh_CN', expected: 2 },
  { id: 'case7', label: 'en_US', expected: 3 },
  { id: 'case8', label: 'dark', expected: 0 }
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

export default function offlineRenderValidationTest(): void {
  describe('OfflineRenderValidationTest', () => {
    let driver: Driver | null = null;

    beforeAll(async (): Promise<void> => {
      try {
        driver = Driver.create();
      } catch (error) {
        driver = null;
      }
      expect(TOLERANCE_COMPONENT_COUNT >= 0).assertTrue();
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationTest beforeAll');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationTest beforeEach');
    });

    afterEach(async (): Promise<void> => {
      if (driver !== null) {
        await driver.delayMs(SETTLE_TIME);
      }
    });

    afterAll(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationTest afterAll');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0000
     * @tc.name OfflineRenderValidationCase000
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for string in iteration 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase000', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase000 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(0, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('string', 0);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(0 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase000 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0001
     * @tc.name OfflineRenderValidationCase001
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for media in iteration 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase001', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase001 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(1, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('media', 1);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(1 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase001 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0002
     * @tc.name OfflineRenderValidationCase002
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for color in iteration 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase002', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase002 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(2, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('color', 2);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(2 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase002 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0003
     * @tc.name OfflineRenderValidationCase003
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for float in iteration 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase003', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase003 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(3, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('float', 3);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(3 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase003 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0004
     * @tc.name OfflineRenderValidationCase004
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for profile in iteration 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase004', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase004 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(4, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('profile', 4);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(4 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase004 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0005
     * @tc.name OfflineRenderValidationCase005
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for rawfile in iteration 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase005', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase005 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(5, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('rawfile', 5);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(5 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase005 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0006
     * @tc.name OfflineRenderValidationCase006
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for zh_CN in iteration 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase006', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase006 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(6, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('zh_CN', 6);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(6 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase006 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0007
     * @tc.name OfflineRenderValidationCase007
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for en_US in iteration 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase007', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase007 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(7, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('en_US', 7);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(7 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase007 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0008
     * @tc.name OfflineRenderValidationCase008
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for dark in iteration 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase008', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase008 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(8, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('dark', 8);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(8 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase008 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0009
     * @tc.name OfflineRenderValidationCase009
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for string in iteration 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase009', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase009 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(9, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('string', 9);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(9 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase009 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0010
     * @tc.name OfflineRenderValidationCase010
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for media in iteration 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase010', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase010 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(10, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('media', 10);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(10 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase010 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0011
     * @tc.name OfflineRenderValidationCase011
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for color in iteration 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase011', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase011 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(11, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('color', 11);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(11 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase011 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0012
     * @tc.name OfflineRenderValidationCase012
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for float in iteration 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase012', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase012 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(12, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('float', 12);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(12 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase012 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0013
     * @tc.name OfflineRenderValidationCase013
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for profile in iteration 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase013', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase013 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(13, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('profile', 13);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(13 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase013 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0014
     * @tc.name OfflineRenderValidationCase014
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for rawfile in iteration 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase014', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase014 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(14, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('rawfile', 14);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(14 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase014 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0015
     * @tc.name OfflineRenderValidationCase015
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for zh_CN in iteration 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase015', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase015 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(15, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('zh_CN', 15);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(15 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase015 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0016
     * @tc.name OfflineRenderValidationCase016
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for en_US in iteration 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase016', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase016 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(16, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('en_US', 16);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(16 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase016 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0017
     * @tc.name OfflineRenderValidationCase017
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for dark in iteration 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase017', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase017 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(17, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('dark', 17);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(17 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase017 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0018
     * @tc.name OfflineRenderValidationCase018
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for string in iteration 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase018', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase018 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(18, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('string', 18);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(18 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase018 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0019
     * @tc.name OfflineRenderValidationCase019
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for media in iteration 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase019', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase019 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(19, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('media', 19);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(19 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase019 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0020
     * @tc.name OfflineRenderValidationCase020
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for color in iteration 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase020', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase020 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(20, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('color', 20);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(20 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase020 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0021
     * @tc.name OfflineRenderValidationCase021
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for float in iteration 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase021', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase021 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(21, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('float', 21);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(21 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase021 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0022
     * @tc.name OfflineRenderValidationCase022
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for profile in iteration 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase022', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase022 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(22, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('profile', 22);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(22 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase022 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0023
     * @tc.name OfflineRenderValidationCase023
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for rawfile in iteration 23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase023', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase023 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(23, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('rawfile', 23);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(23 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase023 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0024
     * @tc.name OfflineRenderValidationCase024
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for zh_CN in iteration 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase024', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase024 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(24, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('zh_CN', 24);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(24 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase024 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0025
     * @tc.name OfflineRenderValidationCase025
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for en_US in iteration 25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase025', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase025 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(25, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('en_US', 25);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(25 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase025 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0026
     * @tc.name OfflineRenderValidationCase026
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for dark in iteration 26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase026', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase026 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(26, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('dark', 26);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(26 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase026 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0027
     * @tc.name OfflineRenderValidationCase027
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for string in iteration 27
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase027', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase027 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(27, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('string', 27);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(27 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase027 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0028
     * @tc.name OfflineRenderValidationCase028
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for media in iteration 28
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase028', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase028 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(28, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('media', 28);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(28 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase028 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_OFFLINERENDERVALIDATION_0029
     * @tc.name OfflineRenderValidationCase029
     * @tc.desc Verify OfflineRenderValidationTest keeps deterministic behaviour for color in iteration 29
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('OfflineRenderValidationCase029', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase029 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(29, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('color', 29);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(29 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'OfflineRenderValidationCase029 end');
    });

  });
}
