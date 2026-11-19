/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  logInfo,
  serializedDelay,
  launchEntryAbility,
  waitForIndexPageStable,
  isIndexPageVisible,
  checkTextContent,
  waitForTextVisible,
  tapComponentByText,
  checkComponentExistsByKey,
  pageComponentCount,
  collectAllTexts,
  measureElapsed,
  isWithinBudget,
  averageOf,
  maxOf,
  minOf,
  PAGE_TEXT_INITIAL,
  PAGE_TEXT_CLICKED,
  INDEX_PAGE_TEXT_KEY,
  TIMEOUT_TEXT_APPEAR,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_ABILITY_LAUNCH,
  TOLERANCE_COMPONENT_COUNT,
  ensureIndexPageInitial,
} from '../Shared/SharedDriver';

const FRAME_BASELINE_MS: number = 16.7;

const JANK_FACTOR: number = 2;

const SMOOTH_JANK_RATE_LIMIT: number = 0.05;

const STANDARD_DURATION_LIMIT_MS: number = 300;

const LONG_DURATION_LIMIT_MS: number = 1000;

class FrameIntervalSample {
  private sampleIndex: number;
  private deltaMs: number;

  constructor(sampleIndex: number, deltaMs: number) {
    this.sampleIndex = sampleIndex;
    this.deltaMs = deltaMs;
  }

  public getSampleIndex(): number {
    return this.sampleIndex;
  }

  public getDeltaMs(): number {
    return this.deltaMs;
  }

  public isJank(baselineMs: number): boolean {
    return this.deltaMs > baselineMs * JANK_FACTOR;
  }

  public getInstantFps(): number {
    if (this.deltaMs <= 0) {
      return 0;
    }
    return 1000 / this.deltaMs;
  }

  public getFrameDebt(baselineMs: number): number {
    const debt: number = this.deltaMs - baselineMs;
    if (debt <= 0) {
      return 0;
    }
    return debt;
  }
}

class FrameIntervalSeries {
  private baselineMs: number;
  private samples: FrameIntervalSample[] = [];

  constructor(baselineMs: number) {
    this.baselineMs = baselineMs;
  }

  public getBaselineMs(): number {
    return this.baselineMs;
  }

  public add(deltaMs: number): void {
    this.samples.push(new FrameIntervalSample(this.samples.length, deltaMs));
  }

  public clear(): void {
    this.samples = [];
  }

  public getCount(): number {
    return this.samples.length;
  }

  public getDeltas(): number[] {
    const result: number[] = [];
    for (let i = 0; i < this.samples.length; i++) {
      result.push(this.samples[i].getDeltaMs());
    }
    return result;
  }

  public getAverageDelta(): number {
    return averageOf(this.getDeltas());
  }

  public getMaxDelta(): number {
    return maxOf(this.getDeltas());
  }

  public getMinDelta(): number {
    return minOf(this.getDeltas());
  }

  public getTotalDuration(): number {
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].getDeltaMs();
    }
    return total;
  }

  public getJankCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      if (this.samples[i].isJank(this.baselineMs)) {
        count++;
      }
    }
    return count;
  }

  public getJankRate(): number {
    if (this.samples.length === 0) {
      return 0;
    }
    return this.getJankCount() / this.samples.length;
  }

  public getAverageFps(): number {
    const averageDelta: number = this.getAverageDelta();
    if (averageDelta <= 0) {
      return 0;
    }
    return 1000 / averageDelta;
  }

  public isSmooth(): boolean {
    return this.getJankRate() <= SMOOTH_JANK_RATE_LIMIT;
  }

  public getFrameDebtTotal(): number {
    let total: number = 0;
    for (let i = 0; i < this.samples.length; i++) {
      total += this.samples[i].getFrameDebt(this.baselineMs);
    }
    return total;
  }
}

enum AnimationDurationTier {
  INVALID = 'invalid',
  ZERO = 'zero',
  INSTANT = 'instant',
  SINGLE_FRAME = 'single_frame',
  STANDARD = 'standard',
  EXTENDED = 'extended',
  EXCESSIVE = 'excessive'
}

class AnimationDurationPolicy {
  public classify(durationMs: number): AnimationDurationTier {
    if (!isFinite(durationMs) || durationMs < 0) {
      return AnimationDurationTier.INVALID;
    }
    if (durationMs === 0) {
      return AnimationDurationTier.ZERO;
    }
    if (durationMs <= 1) {
      return AnimationDurationTier.INSTANT;
    }
    if (durationMs <= FRAME_BASELINE_MS) {
      return AnimationDurationTier.SINGLE_FRAME;
    }
    if (durationMs <= STANDARD_DURATION_LIMIT_MS) {
      return AnimationDurationTier.STANDARD;
    }
    if (durationMs <= LONG_DURATION_LIMIT_MS) {
      return AnimationDurationTier.EXTENDED;
    }
    return AnimationDurationTier.EXCESSIVE;
  }

  public isAcceptable(durationMs: number): boolean {
    const tier: AnimationDurationTier = this.classify(durationMs);
    return tier !== AnimationDurationTier.INVALID && tier !== AnimationDurationTier.EXCESSIVE;
  }

  public estimateFrameCount(durationMs: number): number {
    if (!isFinite(durationMs) || durationMs <= 0) {
      return 0;
    }
    return Math.floor(durationMs / FRAME_BASELINE_MS);
  }

  public getOverrun(durationMs: number, budgetMs: number): number {
    if (!isFinite(durationMs) || !isFinite(budgetMs)) {
      return 0;
    }
    const overrun: number = durationMs - budgetMs;
    if (overrun <= 0) {
      return 0;
    }
    return overrun;
  }
}

interface TextTransitionRecord {
  sequence: number;
  fromText: string;
  toText: string;
  durationMs: number;
  frameCount: number;
}

class TextTransitionRecorder {
  private records: TextTransitionRecord[] = [];

  public record(fromText: string, toText: string, durationMs: number): TextTransitionRecord {
    const record: TextTransitionRecord = {
      sequence: this.records.length + 1,
      fromText: fromText,
      toText: toText,
      durationMs: durationMs,
      frameCount: Math.floor(durationMs / FRAME_BASELINE_MS)
    };
    this.records.push(record);
    return record;
  }

  public getCount(): number {
    return this.records.length;
  }

  public clear(): void {
    this.records = [];
  }

  public getRecords(): TextTransitionRecord[] {
    const result: TextTransitionRecord[] = [];
    for (let i = 0; i < this.records.length; i++) {
      const source: TextTransitionRecord = this.records[i];
      const copied: TextTransitionRecord = {
        sequence: source.sequence,
        fromText: source.fromText,
        toText: source.toText,
        durationMs: source.durationMs,
        frameCount: source.frameCount
      };
      result.push(copied);
    }
    return result;
  }

  public getAverageDuration(): number {
    const durations: number[] = [];
    for (let i = 0; i < this.records.length; i++) {
      durations.push(this.records[i].durationMs);
    }
    return averageOf(durations);
  }

  public getLast(): TextTransitionRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public isCanonicalSwitch(): boolean {
    if (this.records.length === 0) {
      return false;
    }
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].fromText !== PAGE_TEXT_INITIAL) {
        return false;
      }
      if (this.records[i].toText !== PAGE_TEXT_CLICKED) {
        return false;
      }
    }
    return true;
  }
}

async function ensureIndexPage(driver: Driver): Promise<boolean> {
  const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
  if (stable) {
    return true;
  }
  await launchEntryAbility();
  return await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
}

async function performTextSwitch(driver: Driver): Promise<number> {
  const initialVisible: boolean = await checkTextContent(driver, PAGE_TEXT_INITIAL);
  const startTime: number = Date.now();
  if (initialVisible) {
    const tapped: boolean = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
    expect(tapped).assertTrue();
  }
  const elapsed: number = measureElapsed(startTime);
  const switched: boolean = await waitForTextVisible(driver, PAGE_TEXT_CLICKED, TIMEOUT_TEXT_APPEAR);
  expect(switched).assertTrue();
  return elapsed;
}

export default function animationPerformanceTest(): void {
  describe('AnimationPerformanceTest', () => {
    let driver: Driver;
    let transitionRecorder: TextTransitionRecorder;

    beforeAll(async () => {
      driver = getDriver();
      transitionRecorder = new TextTransitionRecorder();
      const ready: boolean = await ensureIndexPage(driver);
      expect(ready).assertTrue();

      await ensureIndexPageInitial(driver);
    });

    afterAll(async () => {
      transitionRecorder.clear();
      await serializedDelay(driver, 100);
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0100
     * @tc.name testFrameBaselineShouldBeFixed
     * @tc.desc Verify frame interval series baseline: constructed with 16.7 ms -> baseline returned unchanged and zero filled series reports zero statistics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFrameBaselineShouldBeFixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        expect(series.getBaselineMs()).assertEqual(16.7);
        expect(series.getCount()).assertEqual(0);
        expect(series.getAverageDelta()).assertEqual(0);
        expect(series.getMaxDelta()).assertEqual(0);
        expect(series.getMinDelta()).assertEqual(0);
        expect(series.getJankRate()).assertEqual(0);
        expect(series.getAverageFps()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0200
     * @tc.name testEmptySeriesShouldBeSmooth
     * @tc.desc Verify empty frame interval series: no sample -> jank count 0, frame debt 0 and smoothness flag true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEmptySeriesShouldBeSmooth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        expect(series.getJankCount()).assertEqual(0);
        expect(series.getTotalDuration()).assertEqual(0);
        expect(series.getFrameDebtTotal()).assertEqual(0);
        expect(series.isSmooth()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0300
     * @tc.name testSingleFrameInstantFps
     * @tc.desc Verify single frame sample of 20 ms: average delta 20, instant fps 50 and total duration 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSingleFrameInstantFps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        series.add(20);
        const sample: FrameIntervalSample = new FrameIntervalSample(0, 20);
        expect(series.getCount()).assertEqual(1);
        expect(series.getAverageDelta()).assertEqual(20);
        expect(series.getAverageFps()).assertEqual(50);
        expect(series.getTotalDuration()).assertEqual(20);
        expect(sample.getInstantFps()).assertEqual(50);
        expect(sample.getSampleIndex()).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0400
     * @tc.name testJankBoundaryAtDoubleBaseline
     * @tc.desc Verify jank boundary with 16 ms baseline: delta 32 is not jank, delta 33 is jank
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJankBoundaryAtDoubleBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const onBoundary: FrameIntervalSample = new FrameIntervalSample(0, 32);
        const overBoundary: FrameIntervalSample = new FrameIntervalSample(1, 33);
        expect(onBoundary.isJank(16)).assertFalse();
        expect(overBoundary.isJank(16)).assertTrue();
        expect(onBoundary.getFrameDebt(16)).assertEqual(16);
        expect(overBoundary.getFrameDebt(16)).assertEqual(17);
        expect(new FrameIntervalSample(2, 16).getFrameDebt(16)).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0500
     * @tc.name testJankRateComputation
     * @tc.desc Verify jank rate of five samples with two jank frames: count 2 and rate 0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testJankRateComputation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(16);
        series.add(16);
        series.add(40);
        series.add(16);
        series.add(48);
        series.add(16);
        expect(series.getCount()).assertEqual(5);
        expect(series.getJankCount()).assertEqual(2);
        expect(series.getJankRate()).assertEqual(0.4);
        expect(series.isSmooth()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0600
     * @tc.name testSmoothSeriesWithinJankLimit
     * @tc.desc Verify series with twenty samples and one jank frame: jank rate 0.05 and smooth flag true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSmoothSeriesWithinJankLimit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(16);
        for (let i = 0; i < 19; i++) {
          series.add(16);
        }
        series.add(40);
        expect(series.getCount()).assertEqual(20);
        expect(series.getJankCount()).assertEqual(1);
        expect(series.getJankRate()).assertEqual(0.05);
        expect(series.isSmooth()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0700
     * @tc.name testSampleStatisticsFromSharedDriver
     * @tc.desc Verify shared statistics helpers over deltas 10, 20 and 30: average 20, max 30 and min 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSampleStatisticsFromSharedDriver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const deltas: number[] = [10, 20, 30];
        expect(averageOf(deltas)).assertEqual(20);
        expect(maxOf(deltas)).assertEqual(30);
        expect(minOf(deltas)).assertEqual(10);
        expect(averageOf([])).assertEqual(0);
        expect(maxOf([])).assertEqual(0);
        expect(minOf([])).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0800
     * @tc.name testSeriesStatisticsMatchExpectedValues
     * @tc.desc Verify series of deltas 12, 18 and 24 ms: average delta 18, max 24, min 12 and total 54
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSeriesStatisticsMatchExpectedValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        series.add(12);
        series.add(18);
        series.add(24);
        expect(series.getAverageDelta()).assertEqual(18);
        expect(series.getMaxDelta()).assertEqual(24);
        expect(series.getMinDelta()).assertEqual(12);
        expect(series.getTotalDuration()).assertEqual(54);
        expect(Math.abs(series.getFrameDebtTotal() - 8.6) <= 0.01).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_0900
     * @tc.name testDeltasCopyShouldNotAffectSeries
     * @tc.desc Verify delta snapshot independence: mutating the returned array leaves series count and average unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDeltasCopyShouldNotAffectSeries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        series.add(16);
        series.add(16);
        const snapshot: number[] = series.getDeltas();
        snapshot.push(1000);
        expect(snapshot.length).assertEqual(3);
        expect(series.getCount()).assertEqual(2);
        expect(series.getAverageDelta()).assertEqual(16);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1000
     * @tc.name testClearShouldResetSeries
     * @tc.desc Verify series reset: clearing three samples leaves count 0 and all statistics at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testClearShouldResetSeries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(16);
        series.add(16);
        series.add(40);
        series.add(16);
        series.clear();
        expect(series.getCount()).assertEqual(0);
        expect(series.getJankCount()).assertEqual(0);
        expect(series.getTotalDuration()).assertEqual(0);
        series.add(32);
        expect(series.getCount()).assertEqual(1);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1100
     * @tc.name testDurationTierZeroAndInstant
     * @tc.desc Verify duration classification lower bounds: 0 ms is zero tier, 1 ms is instant tier and 0.5 ms is instant tier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationTierZeroAndInstant', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.classify(0)).assertEqual(AnimationDurationTier.ZERO);
        expect(policy.classify(1)).assertEqual(AnimationDurationTier.INSTANT);
        expect(policy.classify(0.5)).assertEqual(AnimationDurationTier.INSTANT);
        expect(policy.isAcceptable(0)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1200
     * @tc.name testDurationTierSingleFrameBoundary
     * @tc.desc Verify duration classification around the 16.7 ms frame boundary: 16.7 is single frame and 16.8 is standard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationTierSingleFrameBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.classify(2)).assertEqual(AnimationDurationTier.SINGLE_FRAME);
        expect(policy.classify(16)).assertEqual(AnimationDurationTier.SINGLE_FRAME);
        expect(policy.classify(16.7)).assertEqual(AnimationDurationTier.SINGLE_FRAME);
        expect(policy.classify(16.8)).assertEqual(AnimationDurationTier.STANDARD);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1300
     * @tc.name testDurationTierStandardBoundary
     * @tc.desc Verify duration classification around 300 ms: 300 is standard tier and 301 is extended tier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationTierStandardBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.classify(300)).assertEqual(AnimationDurationTier.STANDARD);
        expect(policy.classify(301)).assertEqual(AnimationDurationTier.EXTENDED);
        expect(policy.classify(17)).assertEqual(AnimationDurationTier.STANDARD);
        expect(policy.isAcceptable(300)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1400
     * @tc.name testDurationTierExtendedBoundary
     * @tc.desc Verify duration classification around 1000 ms: 1000 is extended tier and 1001 is excessive tier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationTierExtendedBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.classify(1000)).assertEqual(AnimationDurationTier.EXTENDED);
        expect(policy.classify(1001)).assertEqual(AnimationDurationTier.EXCESSIVE);
        expect(policy.classify(1001.5)).assertEqual(AnimationDurationTier.EXCESSIVE);
        expect(policy.isAcceptable(1001)).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1500
     * @tc.name testNegativeDurationIsInvalid
     * @tc.desc Verify negative duration handling: minus one and minus zero point five are invalid and rejected by the accept check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNegativeDurationIsInvalid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.classify(-1)).assertEqual(AnimationDurationTier.INVALID);
        expect(policy.classify(-0.5)).assertEqual(AnimationDurationTier.INVALID);
        expect(policy.isAcceptable(-1)).assertFalse();
        expect(policy.estimateFrameCount(-1)).assertEqual(0);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1600
     * @tc.name testEstimateFrameCountBoundaries
     * @tc.desc Verify frame count estimation: 0 ms gives 0 frames, 16.7 ms gives 1, 300 ms gives 17 and 1000 ms gives 59
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testEstimateFrameCountBoundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.estimateFrameCount(0)).assertEqual(0);
        expect(policy.estimateFrameCount(16.7)).assertEqual(1);
        expect(policy.estimateFrameCount(33.4)).assertEqual(2);
        expect(policy.estimateFrameCount(300)).assertEqual(17);
        expect(policy.estimateFrameCount(1000)).assertEqual(59);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1700
     * @tc.name testDurationOverrunComputation
     * @tc.desc Verify overrun computation: 350 ms against 300 ms budget yields 50 and 200 ms yields 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testDurationOverrunComputation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(policy.getOverrun(350, 300)).assertEqual(50);
        expect(policy.getOverrun(200, 300)).assertEqual(0);
        expect(policy.getOverrun(300, 300)).assertEqual(0);
        expect(policy.getOverrun(1000, 16.7)).assertEqual(983.3);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1800
     * @tc.name testTransitionRecorderRecordsSequence
     * @tc.desc Verify transition recorder: one recorded switch keeps sequence 1, duration and derived frame count consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransitionRecorderRecordsSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const recorder: TextTransitionRecorder = new TextTransitionRecorder();
        const record: TextTransitionRecord = recorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 167);
        expect(record.sequence).assertEqual(1);
        expect(record.frameCount).assertEqual(10);
        expect(recorder.getCount()).assertEqual(1);
        const last: TextTransitionRecord | null = recorder.getLast();
        expect(last !== null).assertTrue();
        if (last !== null) {
          expect(last.toText).assertEqual(PAGE_TEXT_CLICKED);
        }
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_1900
     * @tc.name testTransitionRecorderAverageDuration
     * @tc.desc Verify transition recorder averaging: durations 100, 200 and 300 ms produce average 200 and sequence 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransitionRecorderAverageDuration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const recorder: TextTransitionRecorder = new TextTransitionRecorder();
        recorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 100);
        recorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 200);
        const third: TextTransitionRecord = recorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 300);
        expect(third.sequence).assertEqual(3);
        expect(recorder.getAverageDuration()).assertEqual(200);
        expect(recorder.getCount()).assertEqual(3);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2000
     * @tc.name testTransitionRecorderCanonicalSwitchCheck
     * @tc.desc Verify canonical switch detection: hello to welcome records pass, a reversed record fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransitionRecorderCanonicalSwitchCheck', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const recorder: TextTransitionRecorder = new TextTransitionRecorder();
        expect(recorder.isCanonicalSwitch()).assertFalse();
        recorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 120);
        expect(recorder.isCanonicalSwitch()).assertTrue();
        recorder.record(PAGE_TEXT_CLICKED, PAGE_TEXT_INITIAL, 120);
        expect(recorder.isCanonicalSwitch()).assertFalse();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2100
     * @tc.name testTransitionRecorderClearAndSnapshot
     * @tc.desc Verify recorder snapshot and clear: copied records are independent and clearing resets count to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTransitionRecorderClearAndSnapshot', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const recorder: TextTransitionRecorder = new TextTransitionRecorder();
        recorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, 167);
        const snapshot: TextTransitionRecord[] = recorder.getRecords();
        expect(snapshot.length).assertEqual(1);
        const extra: TextTransitionRecord = {
          sequence: 9,
          fromText: 'x',
          toText: 'y',
          durationMs: 1,
          frameCount: 0
        };
        snapshot.push(extra);
        expect(snapshot.length).assertEqual(2);
        expect(recorder.getCount()).assertEqual(1);
        recorder.clear();
        expect(recorder.getCount()).assertEqual(0);
        expect(recorder.getLast()).assertNull();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2200
     * @tc.name testIndexTextSwitchWithinBudget
     * @tc.desc Verify real Index page text switch: hello world becomes welcome and elapsed stays within the text appear budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexTextSwitchWithinBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const elapsed: number = await performTextSwitch(driver);
        transitionRecorder.clear();
        transitionRecorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, elapsed);
        expect(isWithinBudget(elapsed, TIMEOUT_TEXT_APPEAR)).assertTrue();
        expect(transitionRecorder.getCount()).assertEqual(1);
        expect(transitionRecorder.isCanonicalSwitch()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2300
     * @tc.name testIndexTextSwitchFrameEstimate
     * @tc.desc Verify frame estimate for the real switch duration: estimated frames equal floor of elapsed over 16.7 ms and stay below 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexTextSwitchFrameEstimate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const startTime: number = Date.now();
        const welcomeVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        let tapped: boolean = false;
        if (welcomeVisible) {
          tapped = await tapComponentByText(driver, PAGE_TEXT_CLICKED);
        } else {
          tapped = await tapComponentByText(driver, PAGE_TEXT_INITIAL);
        }
        const elapsed: number = measureElapsed(startTime);
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        const estimatedFrames: number = policy.estimateFrameCount(elapsed);
        expect(tapped).assertTrue();
        expect(estimatedFrames).assertEqual(Math.floor(elapsed / FRAME_BASELINE_MS));
        expect(estimatedFrames >= 0).assertTrue();
        expect(policy.isAcceptable(elapsed)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2400
     * @tc.name testIndexPageTextComponentKeyExists
     * @tc.desc Verify the Index text component key: the HelloWorld id exists and the welcome text is readable after the switch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIndexPageTextComponentKeyExists', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const keyExists: boolean = await checkComponentExistsByKey(driver, INDEX_PAGE_TEXT_KEY);
        expect(keyExists).assertTrue();
        await performTextSwitch(driver);
        const welcomeVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        expect(welcomeVisible).assertTrue();
        const pageVisible: boolean = await isIndexPageVisible(driver);
        expect(pageVisible).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2500
     * @tc.name testPageTextsContainClickedMessage
     * @tc.desc Verify collected page texts include the clicked message and remain a non empty list after the switch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageTextsContainClickedMessage', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        await performTextSwitch(driver);
        const texts: string[] = await collectAllTexts(driver);
        let containsClicked: boolean = false;
        for (let i = 0; i < texts.length; i++) {
          if (texts[i] === PAGE_TEXT_CLICKED) {
            containsClicked = true;
          }
        }
        expect(texts.length >= 1).assertTrue();
        expect(containsClicked).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2600
     * @tc.name testComponentCountStableAcrossTextSwitch
     * @tc.desc Verify component count stability: switching the text does not add page components beyond the shared tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testComponentCountStableAcrossTextSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const baselineCount: number = await pageComponentCount(driver);
        expect(baselineCount >= 1).assertTrue();
        await performTextSwitch(driver);
        await serializedDelay(driver, 100);
        const finalCount: number = await pageComponentCount(driver);
        expect(Math.abs(finalCount - baselineCount)).assertLessOrEqual(TOLERANCE_COMPONENT_COUNT);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2700
     * @tc.name testFrameSamplingDuringSerializedDelays
     * @tc.desc Verify frame interval sampling over five serialized 20 ms delays: five samples recorded and minimum delta at least 10 ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFrameSamplingDuringSerializedDelays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        for (let i = 0; i < 5; i++) {
          const startTime: number = Date.now();
          await serializedDelay(driver, 20);
          series.add(measureElapsed(startTime));
        }
        logInfo('animation frame samples: ' + series.getCount());
        expect(series.getCount()).assertEqual(5);
        expect(series.getMinDelta() >= 10).assertTrue();
        expect(series.getMaxDelta() <= 5000).assertTrue();
        expect(series.getTotalDuration()).assertEqual(series.getAverageDelta() * 5);
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2800
     * @tc.name testPageVisibleAfterRelaunchBudget
     * @tc.desc Verify the Index page is stable after relaunch and the relaunch plus render stays within launch plus render budget
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPageVisibleAfterRelaunchBudget', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const startTime: number = Date.now();
        await launchEntryAbility();
        const stable: boolean = await waitForIndexPageStable(driver, TIMEOUT_PAGE_RENDER);
        const elapsed: number = measureElapsed(startTime);
        expect(stable).assertTrue();
        expect(isWithinBudget(elapsed, TIMEOUT_ABILITY_LAUNCH + TIMEOUT_PAGE_RENDER)).assertTrue();
        expect(await isIndexPageVisible(driver)).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_2900
     * @tc.name testWelcomeTextPersistsAfterDelay
     * @tc.desc Verify switched text persistence: welcome remains visible after a 300 ms delay and component count stays above zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testWelcomeTextPersistsAfterDelay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        await performTextSwitch(driver);
        await serializedDelay(driver, 300);
        const stillVisible: boolean = await checkTextContent(driver, PAGE_TEXT_CLICKED);
        const count: number = await pageComponentCount(driver);
        expect(stillVisible).assertTrue();
        expect(count >= 1).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_3000
     * @tc.name testRecordedTransitionMatchesMeasuredSwitch
     * @tc.desc Verify a real switch record: recorded duration equals the measured elapsed and its frame count matches the estimate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testRecordedTransitionMatchesMeasuredSwitch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const ready: boolean = await ensureIndexPage(driver);
        expect(ready).assertTrue();
        const elapsed: number = await performTextSwitch(driver);
        transitionRecorder.clear();
        const record: TextTransitionRecord = transitionRecorder.record(PAGE_TEXT_INITIAL, PAGE_TEXT_CLICKED, elapsed);
        const policy: AnimationDurationPolicy = new AnimationDurationPolicy();
        expect(record.durationMs).assertEqual(elapsed);
        expect(record.frameCount).assertEqual(policy.estimateFrameCount(elapsed));
        expect(record.sequence).assertEqual(transitionRecorder.getCount());
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_3100
     * @tc.name testAverageFpsForUniformBaseline
     * @tc.desc Verify fps conversion for uniform 16.7 ms frames: average fps equals 1000 divided by 16.7 within 0.01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testAverageFpsForUniformBaseline', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        for (let i = 0; i < 10; i++) {
          series.add(FRAME_BASELINE_MS);
        }
        const fps: number = series.getAverageFps();
        expect(series.getCount()).assertEqual(10);
        expect(Math.abs(fps - 1000 / FRAME_BASELINE_MS) <= 0.01).assertTrue();
        expect(series.isSmooth()).assertTrue();
      } finally {
        done();
      }
    });

    /**
     * @tc.number SUB_ABILITYSTAGE_ANIMPERF_3200
     * @tc.name testFrameDebtAccumulation
     * @tc.desc Verify accumulated frame debt for deltas 20, 40 and 10 ms against a 16.7 ms baseline: debt total is 26.6 ms within 0.01
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFrameDebtAccumulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) => {
      try {
        const series: FrameIntervalSeries = new FrameIntervalSeries(FRAME_BASELINE_MS);
        series.add(20);
        series.add(40);
        series.add(10);
        const debt: number = series.getFrameDebtTotal();
        expect(series.getCount()).assertEqual(3);
        expect(Math.abs(debt - 26.6) <= 0.01).assertTrue();
        expect(new FrameIntervalSample(0, 10).getFrameDebt(FRAME_BASELINE_MS)).assertEqual(0);
      } finally {
        done();
      }
    });
  });
}
