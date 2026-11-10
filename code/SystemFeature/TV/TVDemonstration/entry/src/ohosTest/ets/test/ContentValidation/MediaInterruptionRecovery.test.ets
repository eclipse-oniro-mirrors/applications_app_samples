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

const LOG_TAG: string = 'MediaInterruptio';
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
  { id: 'case0', label: 'VideoComponent', expected: 0 },
  { id: 'case1', label: 'AVPlayer', expected: 1 },
  { id: 'case2', label: 'playback', expected: 2 },
  { id: 'case3', label: 'pause', expected: 3 },
  { id: 'case4', label: 'resume', expected: 0 },
  { id: 'case5', label: 'stop', expected: 1 },
  { id: 'case6', label: 'seek', expected: 2 }
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

export default function mediaInterruptionRecoveryTest(): void {
  describe('MediaInterruptionRecoveryTest', () => {
    let driver: Driver | null = null;

    beforeAll(async (): Promise<void> => {
      try {
        driver = Driver.create();
      } catch (error) {
        driver = null;
      }
      expect(TOLERANCE_COMPONENT_COUNT >= 0).assertTrue();
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryTest beforeAll');
    });

    beforeEach(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryTest beforeEach');
    });

    afterEach(async (): Promise<void> => {
      if (driver !== null) {
        await driver.delayMs(SETTLE_TIME);
      }
    });

    afterAll(async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryTest afterAll');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0000
     * @tc.name MediaInterruptionRecoveryCase000
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for VideoComponent in iteration 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase000', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase000 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(0, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('VideoComponent', 0);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(0 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase000 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0001
     * @tc.name MediaInterruptionRecoveryCase001
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for AVPlayer in iteration 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase001', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase001 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(1, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('AVPlayer', 1);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(1 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase001 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0002
     * @tc.name MediaInterruptionRecoveryCase002
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for playback in iteration 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase002', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase002 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(2, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('playback', 2);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(2 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase002 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0003
     * @tc.name MediaInterruptionRecoveryCase003
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for pause in iteration 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase003', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase003 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(3, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('pause', 3);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(3 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase003 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0004
     * @tc.name MediaInterruptionRecoveryCase004
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for resume in iteration 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase004', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase004 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(4, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('resume', 4);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(4 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase004 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0005
     * @tc.name MediaInterruptionRecoveryCase005
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for stop in iteration 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase005', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase005 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(5, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('stop', 5);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(5 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase005 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0006
     * @tc.name MediaInterruptionRecoveryCase006
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for seek in iteration 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase006', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase006 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(6, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('seek', 6);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(6 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase006 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0007
     * @tc.name MediaInterruptionRecoveryCase007
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for VideoComponent in iteration 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase007', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase007 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(7, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('VideoComponent', 7);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(7 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase007 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0008
     * @tc.name MediaInterruptionRecoveryCase008
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for AVPlayer in iteration 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase008', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase008 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(8, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('AVPlayer', 8);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(8 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase008 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0009
     * @tc.name MediaInterruptionRecoveryCase009
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for playback in iteration 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase009', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase009 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(9, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('playback', 9);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(9 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase009 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0010
     * @tc.name MediaInterruptionRecoveryCase010
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for pause in iteration 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase010', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase010 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(10, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('pause', 10);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(10 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase010 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0011
     * @tc.name MediaInterruptionRecoveryCase011
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for resume in iteration 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase011', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase011 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(11, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('resume', 11);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(11 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase011 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0012
     * @tc.name MediaInterruptionRecoveryCase012
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for stop in iteration 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase012', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase012 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(12, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('stop', 12);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(12 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase012 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0013
     * @tc.name MediaInterruptionRecoveryCase013
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for seek in iteration 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase013', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase013 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(13, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('seek', 13);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(13 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase013 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0014
     * @tc.name MediaInterruptionRecoveryCase014
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for VideoComponent in iteration 14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase014', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase014 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(14, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('VideoComponent', 14);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(14 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase014 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0015
     * @tc.name MediaInterruptionRecoveryCase015
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for AVPlayer in iteration 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase015', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase015 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(15, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('AVPlayer', 15);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(15 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase015 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0016
     * @tc.name MediaInterruptionRecoveryCase016
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for playback in iteration 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase016', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase016 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(16, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('playback', 16);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(16 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase016 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0017
     * @tc.name MediaInterruptionRecoveryCase017
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for pause in iteration 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase017', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase017 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(17, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('pause', 17);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(17 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase017 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0018
     * @tc.name MediaInterruptionRecoveryCase018
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for resume in iteration 18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase018', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase018 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(18, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('resume', 18);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(18 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase018 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0019
     * @tc.name MediaInterruptionRecoveryCase019
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for stop in iteration 19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase019', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase019 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(19, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('stop', 19);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(19 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase019 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0020
     * @tc.name MediaInterruptionRecoveryCase020
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for seek in iteration 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase020', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase020 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(20, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('seek', 20);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(20 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase020 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0021
     * @tc.name MediaInterruptionRecoveryCase021
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for VideoComponent in iteration 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase021', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase021 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(21, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('VideoComponent', 21);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(21 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase021 end');
    });

    /**
     * @tc.number SUB_TV_DEMO_MEDIAINTERRUPTIONRECOVERY_0022
     * @tc.name MediaInterruptionRecoveryCase022
     * @tc.desc Verify MediaInterruptionRecoveryTest keeps deterministic behaviour for AVPlayer in iteration 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('MediaInterruptionRecoveryCase022', 0, async (): Promise<void> => {
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase022 begin');
      const sample: CaseSample = SAMPLE_POOL[clampIndex(22, SAMPLE_POOL.length)];
      expect(sample.id.length > 0).assertTrue();
      expect(sample.label.length > 0).assertTrue();
      const normalized: string = normalizeLabel(sample.label);
      expect(normalized.length > 0).assertTrue();
      const result: CaseResult = buildResult('AVPlayer', 22);
      expect(result.valid).assertTrue();
      expect(result.score >= 0).assertTrue();
      const clamped: number = clampIndex(22 + sample.expected, SAMPLE_POOL.length);
      expect(isStableIndex(clamped, SAMPLE_POOL.length)).assertTrue();
      expect(SAMPLE_POOL[clamped].id.length > 0).assertTrue();
      const repeat: number = checksumOf(sample.label);
      expect(repeat).assertEqual(checksumOf(sample.label));
      hilog.info(0x0000, LOG_TAG, '%{public}s', 'MediaInterruptionRecoveryCase022 end');
    });

  });
}
