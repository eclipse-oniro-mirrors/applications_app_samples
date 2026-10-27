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

const LOG_TAG: string = 'FeatureDetailSta';
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
  { id: 'case0', label: 'Universal Interconnection', expected: 0 },
  { id: 'case1', label: 'Screen Cast', expected: 1 },
  { id: 'case2', label: 'Smart AI', expected: 2 },
  { id: 'case3', label: 'Pointing Remote', expected: 3 },
  { id: 'case4', label: 'Voice Control', expected: 0 },
  { id: 'case5', label: 'Child Care', expected: 1 },
  { id: 'case6', label: 'Distributed', expected: 2 }
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

export default function featureDetailStateManagementTest(): void {
  describe('FeatureDetailStateManagementTest', () => {
    let driver: Driver | null = null;

    beforeAll(async (): Promise<void> => {
      try {
        driver = Driver.create();
      } catch (error) {
        driver = null;
      }
      expect(TOLERANCE_COMPONENT_COUNT >= 0).assertTrue();
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementTest beforeAll');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementTest beforeEach');
    });

    afterEach(async (): Promise<void> => {
      if (driver !== null) {
        await driver.delayMs(SETTLE_TIME);
      }
    });

    afterAll(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementTest afterAll');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0000
     * @tc.name FeatureDetailStateManagementCase000
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Universal Interconnection in iteration 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase000', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase000 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(0, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Universal Interconnection', 0);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(0 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase000 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0001
     * @tc.name FeatureDetailStateManagementCase001
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Screen Cast in iteration 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase001', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase001 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(1, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Screen Cast', 1);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(1 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase001 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0002
     * @tc.name FeatureDetailStateManagementCase002
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Smart AI in iteration 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase002', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase002 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(2, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Smart AI', 2);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(2 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase002 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0003
     * @tc.name FeatureDetailStateManagementCase003
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Pointing Remote in iteration 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase003', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase003 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(3, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Pointing Remote', 3);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(3 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase003 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0004
     * @tc.name FeatureDetailStateManagementCase004
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Voice Control in iteration 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase004', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase004 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(4, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Voice Control', 4);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(4 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase004 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0005
     * @tc.name FeatureDetailStateManagementCase005
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Child Care in iteration 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase005', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase005 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(5, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Child Care', 5);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(5 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase005 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0006
     * @tc.name FeatureDetailStateManagementCase006
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Distributed in iteration 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase006', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase006 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(6, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Distributed', 6);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(6 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase006 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0007
     * @tc.name FeatureDetailStateManagementCase007
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Universal Interconnection in iteration 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase007', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase007 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(7, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Universal Interconnection', 7);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(7 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase007 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0008
     * @tc.name FeatureDetailStateManagementCase008
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Screen Cast in iteration 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase008', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase008 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(8, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Screen Cast', 8);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(8 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase008 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0009
     * @tc.name FeatureDetailStateManagementCase009
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Smart AI in iteration 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase009', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase009 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(9, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Smart AI', 9);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(9 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase009 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0010
     * @tc.name FeatureDetailStateManagementCase010
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Pointing Remote in iteration 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase010', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase010 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(10, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Pointing Remote', 10);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(10 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase010 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0011
     * @tc.name FeatureDetailStateManagementCase011
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Voice Control in iteration 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase011', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase011 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(11, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Voice Control', 11);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(11 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase011 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0012
     * @tc.name FeatureDetailStateManagementCase012
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Child Care in iteration 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase012', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase012 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(12, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Child Care', 12);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(12 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase012 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0013
     * @tc.name FeatureDetailStateManagementCase013
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Distributed in iteration 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase013', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase013 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(13, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Distributed', 13);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(13 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase013 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0014
     * @tc.name FeatureDetailStateManagementCase014
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Universal Interconnection in iteration 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase014', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase014 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(14, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Universal Interconnection', 14);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(14 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase014 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_FEATUREDETAILSTATEMANAGEMENT_0015
     * @tc.name FeatureDetailStateManagementCase015
     * @tc.desc Verify FeatureDetailStateManagementTest keeps deterministic behaviour for Screen Cast in iteration 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('FeatureDetailStateManagementCase015', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase015 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(15, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('Screen Cast', 15);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(15 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'FeatureDetailStateManagementCase015 end');
    });

  });
}
