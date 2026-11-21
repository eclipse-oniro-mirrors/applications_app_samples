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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  allocatePressure,
  allCleared,
  arrayAllocationLimitBytes,
  byteCounterDelta,
  byteCounterInWindow,
  gcStat,
  GcSnapshot,
  GC_STAT_KEYS,
  hintGC,
  KEY_BYTES_ALLOCATED,
  KEY_BYTES_FREED,
  KEY_FULL_GC_LONG,
  KEY_GC_COUNT,
  KEY_GC_TIME,
  KB,
  PRESSURE_ALLOCATION_LIMIT_BYTES,
  retainArrays,
  RingNode,
  runGcCycles,
  STAT_READ_ALLOCATION_LIMIT_BYTES
} from './shared/GcProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const OP_IDLE: number = 0;
const OP_TOUCH: number = 1;
const OP_PRESSURE: number = 2;
const OP_HINT: number = 3;
const OP_RETAIN: number = 4;
const OP_WAIT: number = 5;
const OP_COLLECT: number = 6;

const EXPECTED_KEY_COUNT: number = 5;
const EXPECTED_DROPS_NONE: number = 0;
const EXPECTED_INDEX_FIRST: number = 0;
const KEY_PREFIX: string = 'ark.gc.';
const SMALL_PAYLOAD: number = 64;
const LIGHT_TOUCHES: number = 8;
const RETAIN_SMALL_COUNT: number = 8;
const RETAIN_SMALL_LENGTH: number = 4096;
const DOUBLE_BYTES: number = 8;
const RETAIN_SMALL_BYTES: number = RETAIN_SMALL_COUNT * RETAIN_SMALL_LENGTH * DOUBLE_BYTES;
const RETAIN_HALF_BYTES: number = RETAIN_SMALL_BYTES / 2;
const PRESSURE_MIN_BYTES: number = 524288;
const QUIET_BUDGET_BYTES: number = 4194304;
const HINT_COUNT_CAP: number = 2;
const GC_ROUNDS_BUDGET: number = 20;
const REPEAT_READS: number = 12;
const SAMPLE_4: number = 4;
const SAMPLE_6: number = 6;
const SAMPLE_8: number = 8;
const RETAIN_BLOCKS: number = 4;
const SAMPLE_20: number = 20;
const SAMPLE_40: number = 40;
const SAMPLE_50: number = 50;
const SAMPLE_60: number = 60;
const SAMPLE_90: number = 90;
const SAMPLE_100: number = 100;
const SAMPLE_120: number = 120;
const SAMPLE_150: number = 150;
const SAMPLE_200: number = 200;
const CADENCE_5: number = 5;
const CADENCE_10: number = 10;
const CADENCE_20: number = 20;
const CADENCE_30: number = 30;
const CADENCE_40: number = 40;
const CADENCE_60: number = 60;
const CADENCE_100: number = 100;
const CADENCE_SLACK_MS: number = 6;
const CADENCE_BUDGET_MS: number = 30000;
const LARGE_BOUND: number = 1e15;
const PERCENT_FULL: number = 100;
const TOUCH_ALLOCATION_LIMIT_BYTES: number = arrayAllocationLimitBytes(LIGHT_TOUCHES, SMALL_PAYLOAD);
const RETAIN_ALLOCATION_LIMIT_BYTES: number = arrayAllocationLimitBytes(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
const COLLECT_ALLOCATION_LIMIT_BYTES: number = GC_ROUNDS_BUDGET * PRESSURE_ALLOCATION_LIMIT_BYTES +
  STAT_READ_ALLOCATION_LIMIT_BYTES;

class SampleStep {
  readonly op: number;
  readonly repeat: number;
  readonly waitMs: number;

  constructor(op: number, repeat: number, waitMs: number) {
    this.op = op;
    this.repeat = repeat;
    this.waitMs = waitMs;
  }
}

function isFiniteNonNegative(value: number): boolean {
  return Number.isFinite(value) && value >= 0;
}

function allFiniteNonNegative(values: number[]): boolean {
  return values.every((value: number) => isFiniteNonNegative(value));
}

function allIntegers(values: number[]): boolean {
  return values.every((value: number) => Number.isInteger(value));
}

function keyValues(): number[] {
  return GC_STAT_KEYS.map((key: string) => gcStat(key));
}

function valueDrops(values: number[]): number[] {
  const drops: number[] = [];
  for (let i = 1; i < values.length; i++) {
    if (values[i] < values[i - 1]) {
      drops.push(i);
    }
  }
  return drops;
}

function stepAllocationLimit(step: SampleStep): number {
  let workload: number = 0;
  if (step.op === OP_TOUCH) {
    workload = step.repeat * TOUCH_ALLOCATION_LIMIT_BYTES;
  } else if (step.op === OP_RETAIN) {
    workload = step.repeat * RETAIN_ALLOCATION_LIMIT_BYTES;
  } else if (step.op === OP_PRESSURE) {
    workload = step.repeat * PRESSURE_ALLOCATION_LIMIT_BYTES;
  } else if (step.op === OP_COLLECT) {
    workload = step.repeat * GC_ROUNDS_BUDGET * PRESSURE_ALLOCATION_LIMIT_BYTES;
  }
  return workload + STAT_READ_ALLOCATION_LIMIT_BYTES;
}

function stepLimits(steps: SampleStep[]): number[] {
  return steps.map((step: SampleStep) => stepAllocationLimit(step));
}

function sampleLimits(series: GcSnapshot[], workload: number): number[] {
  const limits: number[] = [];
  for (let i = 1; i < series.length; i++) {
    limits.push(workload + STAT_READ_ALLOCATION_LIMIT_BYTES);
  }
  return limits;
}

function byteDomain(value: number): boolean {
  return Number.isSafeInteger(value) && value >= 0;
}

function snapshotDrops(series: GcSnapshot[], limits: number[]): number[] {
  const drops: number[] = [];
  if (limits.length !== series.length - 1) {
    throw new Error('Allocation limits must describe every adjacent sample window');
  }
  for (let i = 1; i < series.length; i++) {
    if (!series[i].notBefore(series[i - 1], limits[i - 1])) {
      drops.push(i);
    }
  }
  return drops;
}

// Validate A independently before using its delta in the physical F bound; never unfold raw drops first.
function byteFailures(series: GcSnapshot[], limits: number[]): number[] {
  const failures: number[] = [];
  if (series.length === 0 || limits.length !== series.length - 1 ||
    !byteDomain(series[0].allocated) || !byteDomain(series[0].freed)) {
    failures.push(0);
    return failures;
  }
  for (let i = 1; i < series.length; i++) {
    if (!series[i].bytesInWindow(series[i - 1], limits[i - 1])) {
      failures.push(i);
    }
  }
  return failures;
}

// Returns an empty series when any adjacent window is untrusted, so callers assert the full length.
function unfoldedBytes(series: GcSnapshot[], limits: number[], freed: boolean): number[] {
  if (byteFailures(series, limits).length !== EXPECTED_DROPS_NONE) {
    return [];
  }
  const values: number[] = [freed ? series[0].freed : series[0].allocated];
  for (let i = 1; i < series.length; i++) {
    const delta: number = freed ? byteCounterDelta(series[i].freed, series[i - 1].freed) :
      byteCounterDelta(series[i].allocated, series[i - 1].allocated);
    values.push(values[i - 1] + delta);
    if (!Number.isSafeInteger(values[i])) {
      return [];
    }
  }
  return values;
}

// Raw single-key reads: every adjacent window is checked before its modular delta is unfolded.
function rawByteFailures(values: number[], maximum: number, wrapAllowed: boolean): number[] {
  const failures: number[] = [];
  if (values.length === 0 || !byteDomain(values[0])) {
    failures.push(0);
    return failures;
  }
  for (let i = 1; i < values.length; i++) {
    if (!byteCounterInWindow(values[i], values[i - 1], maximum) || (values[i] < values[i - 1] && !wrapAllowed)) {
      failures.push(i);
    }
  }
  return failures;
}

function unfoldRawBytes(values: number[], maximum: number, wrapAllowed: boolean): number[] {
  if (rawByteFailures(values, maximum, wrapAllowed).length !== EXPECTED_DROPS_NONE) {
    return [];
  }
  const out: number[] = [values[0]];
  for (let i = 1; i < values.length; i++) {
    out.push(out[i - 1] + byteCounterDelta(values[i], values[i - 1]));
  }
  return out;
}

// Physical F ceiling: live objects at the anchor plus the trusted A delta since the anchor plus one KB rounding.
function freedCap(anchor: GcSnapshot, laterAllocated: number): number {
  return anchor.objectKb * KB + byteCounterDelta(laterAllocated, anchor.allocated) + KB;
}

function spanOf(values: number[]): number {
  return values.length === 0 ? -1 : values[values.length - 1] - values[0];
}

// keyValues order is count, time, allocated, freed, long full; anchor is read no later than first.
function rawPairInWindow(anchor: GcSnapshot, first: number[], second: number[], maximum: number): boolean {
  const combinedMaximum: number = maximum + STAT_READ_ALLOCATION_LIMIT_BYTES;
  if (!byteCounterInWindow(first[2], anchor.allocated, STAT_READ_ALLOCATION_LIMIT_BYTES) ||
    !byteCounterInWindow(second[2], first[2], maximum) ||
    !byteCounterInWindow(second[2], anchor.allocated, combinedMaximum) ||
    !Number.isFinite(anchor.objectKb) || anchor.objectKb < 0) {
    return false;
  }
  const firstFreedTrusted: boolean = byteCounterInWindow(first[3], anchor.freed, freedCap(anchor, first[2])) &&
    (first[3] >= anchor.freed || first[0] > anchor.count);
  const secondFreedTrusted: boolean = byteCounterInWindow(second[3], first[3], freedCap(anchor, second[2])) &&
    (second[3] >= first[3] || second[0] > first[0]);
  const totalFreedTrusted: boolean = byteCounterInWindow(second[3], anchor.freed, freedCap(anchor, second[2])) &&
    (second[3] >= anchor.freed || second[0] > anchor.count);
  return firstFreedTrusted && secondFreedTrusted && totalFreedTrusted;
}

function rawNonByteOrdered(first: number[], second: number[]): boolean {
  return second[0] >= first[0] && second[1] >= first[1] && second[4] >= first[4];
}

function retainedIntact(blocks: number[][][], expectedBlocks: number): boolean {
  return blocks.length === expectedBlocks && blocks.every((block: number[][]) =>
    block.length === RETAIN_SMALL_COUNT && block.every((row: number[], index: number) =>
      row.length === RETAIN_SMALL_LENGTH && row[0] === index && row[RETAIN_SMALL_LENGTH - 1] === index));
}

// Closed form of touchSmall(seed): seed + sum(seed + i) for i in [0, LIGHT_TOUCHES).
function touchResult(seed: number): number {
  return (LIGHT_TOUCHES + 1) * seed + LIGHT_TOUCHES * (LIGHT_TOUCHES - 1) / 2;
}

// Closed form of one OP_TOUCH step, which calls touchSmall(repeat + i).
function expectedTouchResult(repeat: number): number {
  let sink: number = 0;
  for (let i = 0; i < repeat; i++) {
    sink += touchResult(repeat + i);
  }
  return sink;
}

function counts(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.count);
}

function times(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.time);
}

function allocatedSeries(series: GcSnapshot[], limits: number[]): number[] {
  return unfoldedBytes(series, limits, false);
}

function freedSeries(series: GcSnapshot[], limits: number[]): number[] {
  return unfoldedBytes(series, limits, true);
}

function longFullSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.longFullGc);
}

function deltas(values: number[]): number[] {
  const out: number[] = [];
  for (let i = 1; i < values.length; i++) {
    out.push(values[i] - values[i - 1]);
  }
  return out;
}

function total(values: number[]): number {
  let sum: number = 0;
  for (let i = 0; i < values.length; i++) {
    sum += values[i];
  }
  return sum;
}

function minOf(values: number[]): number {
  let best: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] < best) {
      best = values[i];
    }
  }
  return best;
}

function maxOf(values: number[]): number {
  let best: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] > best) {
      best = values[i];
    }
  }
  return best;
}

function percentOf(part: number, whole: number): number {
  if (whole <= 0) {
    return 0;
  }
  return Math.floor(part * PERCENT_FULL / whole);
}

function touchSmall(seed: number): number {
  let sink: number = seed;
  for (let i = 0; i < LIGHT_TOUCHES; i++) {
    const chunk: number[] = new Array<number>(SMALL_PAYLOAD).fill(seed + i);
    sink += chunk[SMALL_PAYLOAD - 1];
  }
  return sink;
}

async function runStep(step: SampleStep, retained: number[][][], probes: WeakRef<RingNode>[]): Promise<number> {
  let sink: number = 0;
  for (let i = 0; i < step.repeat; i++) {
    if (step.op === OP_TOUCH) {
      sink += touchSmall(step.repeat + i);
    } else if (step.op === OP_PRESSURE) {
      sink += allocatePressure();
    } else if (step.op === OP_HINT) {
      hintGC();
    } else if (step.op === OP_RETAIN) {
      const kept: number[][] = retainArrays(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
      retained.push(kept);
      sink += kept.length;
    } else if (step.op === OP_COLLECT) {
      const cycles: number = await runObservedCycles(probes);
      sink += cycles;
    }
  }
  if (step.waitMs > 0) {
    await sleepMs(step.waitMs);
  }
  return sink;
}

// Observe the existing collection-pressure targets, not a second artificial garbage workload.
async function runObservedCycles(probes: WeakRef<RingNode>[]): Promise<number> {
  const start: number = gcStat(KEY_GC_COUNT);
  for (let round = 0; round < GC_ROUNDS_BUDGET; round++) {
    await sleepMs(CADENCE_30);
    hintGC();
    allocatePressure(round === 0 ? probes : undefined);
    await sleepMs(CADENCE_30);
    const cycles: number = gcStat(KEY_GC_COUNT) - start;
    if (cycles >= 1 && allCleared(probes)) {
      return cycles;
    }
  }
  return gcStat(KEY_GC_COUNT) - start;
}

async function runSteps(steps: SampleStep[], retained: number[][][] = [],
  results: number[] = [], probes: WeakRef<RingNode>[] = []): Promise<GcSnapshot[]> {
  const series: GcSnapshot[] = [new GcSnapshot()];
  for (let i = 0; i < steps.length; i++) {
    results.push(await runStep(steps[i], retained, probes));
    series.push(new GcSnapshot());
  }
  return series;
}

function hintMatrix(): SampleStep[][] {
  const bursts: number[] = [1, 2, 3, 4, 5, 6, 8, 10, 12, 16];
  const matrix: SampleStep[][] = [];
  for (let i = 0; i < bursts.length; i++) {
    matrix.push([new SampleStep(OP_HINT, bursts[i], 0), new SampleStep(OP_IDLE, 1, 0)]);
  }
  return matrix;
}

function pressureMatrix(): SampleStep[][] {
  const calls: number[] = [1, 1, 2, 2, 3, 4];
  const waits: number[] = [0, CADENCE_10, 0, CADENCE_20, 0, CADENCE_30];
  const matrix: SampleStep[][] = [];
  for (let i = 0; i < calls.length; i++) {
    matrix.push([new SampleStep(OP_PRESSURE, calls[i], waits[i]), new SampleStep(OP_IDLE, 1, 0)]);
  }
  return matrix;
}

function mixedMatrix(): SampleStep[][] {
  const matrix: SampleStep[][] = [];
  matrix.push([new SampleStep(OP_TOUCH, 4, 0), new SampleStep(OP_HINT, 2, 0), new SampleStep(OP_IDLE, 1, 0)]);
  matrix.push([new SampleStep(OP_HINT, 1, 0), new SampleStep(OP_TOUCH, 8, 0), new SampleStep(OP_IDLE, 1, 0)]);
  matrix.push([new SampleStep(OP_PRESSURE, 1, CADENCE_10), new SampleStep(OP_HINT, 2, CADENCE_10)]);
  matrix.push([new SampleStep(OP_RETAIN, 1, 0), new SampleStep(OP_TOUCH, 6, 0), new SampleStep(OP_IDLE, 1, 0)]);
  matrix.push([new SampleStep(OP_WAIT, 1, CADENCE_20), new SampleStep(OP_TOUCH, 4, 0), new SampleStep(OP_IDLE, 1, 0)]);
  matrix.push([new SampleStep(OP_COLLECT, 1, 0), new SampleStep(OP_TOUCH, 4, 0), new SampleStep(OP_IDLE, 1, 0)]);
  return matrix;
}

function waitMatrix(): SampleStep[][] {
  const waits: number[] = [CADENCE_5, CADENCE_10, CADENCE_20, CADENCE_30, CADENCE_40, 50, CADENCE_60, 80,
    CADENCE_100, SAMPLE_120];
  const matrix: SampleStep[][] = [];
  for (let i = 0; i < waits.length; i++) {
    matrix.push([new SampleStep(OP_WAIT, 1, waits[i]), new SampleStep(OP_IDLE, 1, 0)]);
  }
  return matrix;
}

function touchMatrix(): SampleStep[][] {
  const touches: number[] = [4, 6, 8, 10, 12, 16];
  const matrix: SampleStep[][] = [];
  for (let i = 0; i < touches.length; i++) {
    matrix.push([new SampleStep(OP_TOUCH, touches[i], 0), new SampleStep(OP_IDLE, 1, 0)]);
  }
  return matrix;
}

function quietMatrix(): SampleStep[][] {
  const pads: number[] = [1, 2, 3, 4];
  const matrix: SampleStep[][] = [];
  for (let i = 0; i < pads.length; i++) {
    const row: SampleStep[] = [];
    for (let j = 0; j < pads[i]; j++) {
      row.push(new SampleStep(OP_IDLE, 1, 0));
    }
    matrix.push(row);
  }
  return matrix;
}

function sampleQuiet(rounds: number): GcSnapshot[] {
  const series: GcSnapshot[] = [];
  for (let round = 0; round < rounds; round++) {
    series.push(new GcSnapshot());
  }
  return series;
}

async function sampleWithTouches(rounds: number, waitMs: number): Promise<GcSnapshot[]> {
  const series: GcSnapshot[] = [];
  for (let round = 0; round < rounds; round++) {
    touchSmall(round);
    if (round % 10 === 0) {
      hintGC();
    }
    if (waitMs > 0 && round % 25 === 0) {
      await sleepMs(waitMs);
    }
    series.push(new GcSnapshot());
  }
  return series;
}

async function samplePaced(rounds: number, waitMs: number): Promise<GcSnapshot[]> {
  const series: GcSnapshot[] = [];
  for (let round = 0; round < rounds; round++) {
    await sleepMs(waitMs);
    series.push(new GcSnapshot());
  }
  return series;
}

const HINT_STEPS: SampleStep[][] = hintMatrix();
const PRESSURE_STEPS: SampleStep[][] = pressureMatrix();
const MIXED_STEPS: SampleStep[][] = mixedMatrix();
const WAIT_STEPS: SampleStep[][] = waitMatrix();
const TOUCH_STEPS: SampleStep[][] = touchMatrix();
const QUIET_STEPS: SampleStep[][] = quietMatrix();

export default function gcStatSamplingTest() {
  describe('GcStatSampling', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0100
     * @tc.name      testStatSample0001
     * @tc.desc      Read the collection count key on its own and check the value is finite, integral and never goes
     *               down
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const first: number = gcStat(KEY_GC_COUNT);
      const second: number = gcStat(KEY_GC_COUNT);
      const delta: number = second - first;
      logCase('testStatSample0001', `first=${first} second=${second} delta=${delta}`);
      expect(isFiniteNonNegative(first)).assertTrue();
      expect(delta >= 0).assertTrue();
      expect(Number.isInteger(first) && Number.isInteger(second)).assertTrue();
      expect(first < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0200
     * @tc.name      testStatSample0002
     * @tc.desc      Read the collection time key on its own and check it is finite, non negative and non decreasing
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const first: number = gcStat(KEY_GC_TIME);
      const second: number = gcStat(KEY_GC_TIME);
      const delta: number = second - first;
      logCase('testStatSample0002', `first=${first} second=${second} delta=${delta}`);
      expect(isFiniteNonNegative(first)).assertTrue();
      expect(delta >= 0).assertTrue();
      expect(allFiniteNonNegative([first, second])).assertTrue();
      expect(first < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0300
     * @tc.name      testStatSample0003
     * @tc.desc      Read the allocated byte key around one light touch and check both reads are safe non negative
     *               integers whose modular window stays inside the touch plus read budget
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const before: number = gcStat(KEY_BYTES_ALLOCATED);
      const touched: number = touchSmall(1);
      const after: number = gcStat(KEY_BYTES_ALLOCATED);
      const delta: number = byteCounterDelta(after, before);
      const maximum: number = TOUCH_ALLOCATION_LIMIT_BYTES + STAT_READ_ALLOCATION_LIMIT_BYTES;
      logCase('testStatSample0003', `before=${before} after=${after} delta=${delta} maximum=${maximum} ` +
        `touched=${touched}`);
      expect(byteDomain(before) && byteDomain(after)).assertTrue();
      expect(byteCounterInWindow(after, before, maximum)).assertTrue();
      expect(touched).assertEqual(touchResult(1));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0400
     * @tc.name      testStatSample0004
     * @tc.desc      Read the freed byte key on its own between two snapshots and check its windows stay inside the
     *               object bytes present at the start plus the trusted allocation window
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const start: GcSnapshot = new GcSnapshot();
      const freed: number = gcStat(KEY_BYTES_FREED);
      const end: GcSnapshot = new GcSnapshot();
      const trusted: boolean = end.bytesInWindow(start, STAT_READ_ALLOCATION_LIMIT_BYTES);
      const cap: number = freedCap(start, end.allocated);
      const progressed: boolean = end.count > start.countAtStart;
      logCase('testStatSample0004', `freed=${start.freed}->${freed}->${end.freed} cap=${cap} trusted=${trusted} ` +
        `objectKb=${start.objectKb}`);
      expect(byteDomain(freed)).assertTrue();
      expect(trusted).assertTrue();
      expect(byteCounterInWindow(freed, start.freed, cap) && (freed >= start.freed || progressed)).assertTrue();
      expect(byteCounterInWindow(end.freed, freed, cap) && (end.freed >= freed || progressed)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0500
     * @tc.name      testStatSample0005
     * @tc.desc      Read the long full GC key on its own and check it is a finite integer that never exceeds the
     *               collection count
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const longFull: number = gcStat(KEY_FULL_GC_LONG);
      const count: number = gcStat(KEY_GC_COUNT);
      const share: number = percentOf(longFull, count);
      logCase('testStatSample0005', `longFull=${longFull} count=${count} sharePercent=${share}`);
      expect(isFiniteNonNegative(longFull)).assertTrue();
      expect(longFull <= count).assertTrue();
      expect(Number.isInteger(longFull)).assertTrue();
      expect(share >= 0 && share <= PERCENT_FULL).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0600
     * @tc.name      testStatSample0006
     * @tc.desc      Read all five documented keys in one pass and check the array holds five finite non negative
     *               integral values
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const values: number[] = keyValues();
      const last: number = values[EXPECTED_KEY_COUNT - 1];
      const integral: number[] = [values[0], values[2], values[3], values[4]];
      logCase('testStatSample0006', `length=${values.length} values=${values.join(',')}`);
      expect(values.length).assertEqual(EXPECTED_KEY_COUNT);
      expect(allFiniteNonNegative(values)).assertTrue();
      expect(allIntegers(integral)).assertTrue();
      expect(last <= values[EXPECTED_INDEX_FIRST]).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0700
     * @tc.name      testStatSample0007
     * @tc.desc      Inspect the documented key list itself and check the count, the shared prefix and the absence of
     *               duplicates
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const unique: string[] = GC_STAT_KEYS.filter((key: string, index: number) =>
        GC_STAT_KEYS.indexOf(key) === index);
      const prefixed: boolean = GC_STAT_KEYS.every((key: string) => key.startsWith(KEY_PREFIX));
      const names: string[] = GC_STAT_KEYS.map((key: string) => key.substring(KEY_PREFIX.length));
      logCase('testStatSample0007', `unique=${unique.length} prefixed=${prefixed} names=${names.join(',')}`);
      expect(GC_STAT_KEYS.length).assertEqual(EXPECTED_KEY_COUNT);
      expect(unique.length).assertEqual(EXPECTED_KEY_COUNT);
      expect(prefixed).assertTrue();
      expect(names.every((name: string) => name.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0800
     * @tc.name      testStatSample0008
     * @tc.desc      Build one snapshot and compare it with five fresh single key reads: count, time and long full stay
     *               raw monotonic while both byte keys stay inside the read budget window
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const snap: GcSnapshot = new GcSnapshot();
      const base: number[] = snap.values();
      const fresh: number[] = keyValues();
      const ordered: boolean = rawNonByteOrdered(base, fresh);
      const bytesTrusted: boolean = rawPairInWindow(snap, base, fresh, STAT_READ_ALLOCATION_LIMIT_BYTES);
      const tail: GcSnapshot = new GcSnapshot();
      logCase('testStatSample0008', `base=${base.join(',')} fresh=${fresh.join(',')} ordered=${ordered} ` +
        `bytesTrusted=${bytesTrusted}`);
      expect(fresh.length).assertEqual(base.length);
      expect(ordered).assertTrue();
      expect(bytesTrusted).assertTrue();
      expect(allFiniteNonNegative(fresh) && byteDomain(fresh[2]) && byteDomain(fresh[3])).assertTrue();
      expect(snapshotDrops([snap, tail], [STAT_READ_ALLOCATION_LIMIT_BYTES]).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0900
     * @tc.name      testStatSample0009
     * @tc.desc      Check one snapshot: long full below count, byte keys in the safe non negative integer domain and a
     *               trusted read window to the next snapshot
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const snap: GcSnapshot = new GcSnapshot();
      const next: GcSnapshot = new GcSnapshot();
      const freedDelta: number = byteCounterDelta(next.freed, snap.freed);
      logCase('testStatSample0009', `count=${snap.count} allocated=${snap.allocated} freed=${snap.freed} ` +
        `objectKb=${snap.objectKb} longFull=${snap.longFullGc} freedDelta=${freedDelta}`);
      expect(snap.longFullGc <= snap.count).assertTrue();
      expect(byteDomain(snap.allocated) && byteDomain(snap.freed)).assertTrue();
      expect(next.notBefore(snap, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(allFiniteNonNegative(snap.values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1000
     * @tc.name      testStatSample0010
     * @tc.desc      Read the count and time keys as a pair and check a snapshot taken straight after is never lower
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const count: number = gcStat(KEY_GC_COUNT);
      const time: number = gcStat(KEY_GC_TIME);
      const snap: GcSnapshot = new GcSnapshot();
      const countGap: number = snap.count - count;
      const timeGap: number = snap.time - time;
      logCase('testStatSample0010', `count=${count}->${snap.count} gap=${countGap} ` +
        `time=${time}->${snap.time} gap=${timeGap}`);
      expect(countGap >= 0).assertTrue();
      expect(timeGap >= 0).assertTrue();
      expect(isFiniteNonNegative(count) && isFiniteNonNegative(time)).assertTrue();
      expect(Number.isInteger(count) && Number.isInteger(snap.count)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1100
     * @tc.name      testStatSample0011
     * @tc.desc      Read the count key twelve times in a row and check the series never drops and stays integral
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_GC_COUNT));
      }
      const drops: number[] = valueDrops(values);
      logCase('testStatSample0011', `reads=${values.length} drops=${drops.join(',')} ` +
        `first=${values[0]} last=${values[values.length - 1]}`);
      expect(values.length).assertEqual(REPEAT_READS);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allIntegers(values)).assertTrue();
      expect(deltas(values).every((delta: number) => delta >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1200
     * @tc.name      testStatSample0012
     * @tc.desc      Read the time key twelve times in a row and check monotonicity plus a finite non negative series
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_GC_TIME));
      }
      const drops: number[] = valueDrops(values);
      logCase('testStatSample0012', `reads=${values.length} drops=${drops.join(',')} ` +
        `first=${values[0]} last=${values[values.length - 1]}`);
      expect(values.length).assertEqual(REPEAT_READS);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allFiniteNonNegative(values)).assertTrue();
      expect(maxOf(values) < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1300
     * @tc.name      testStatSample0013
     * @tc.desc      Read the allocated byte key twelve times and validate every adjacent modular window before
     *               unfolding the byte deltas
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_BYTES_ALLOCATED));
      }
      const unfolded: number[] = unfoldRawBytes(values, STAT_READ_ALLOCATION_LIMIT_BYTES, true);
      const stepTotal: number = spanOf(unfolded);
      logCase('testStatSample0013', `reads=${values.length} trusted=${unfolded.length} totalDelta=${stepTotal}`);
      expect(values.length).assertEqual(REPEAT_READS);
      expect(unfolded.length).assertEqual(REPEAT_READS);
      expect(values.every((value: number) => byteDomain(value))).assertTrue();
      expect(stepTotal >= 0 && stepTotal <= (REPEAT_READS - 1) * STAT_READ_ALLOCATION_LIMIT_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1400
     * @tc.name      testStatSample0014
     * @tc.desc      Read the freed byte key twelve times between two anchor snapshots and check every adjacent window
     *               unfolds inside the object bytes at the anchor plus the trusted allocation window
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const anchor: GcSnapshot = new GcSnapshot();
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_BYTES_FREED));
      }
      const end: GcSnapshot = new GcSnapshot();
      const trusted: boolean = end.bytesInWindow(anchor, STAT_READ_ALLOCATION_LIMIT_BYTES);
      const cap: number = freedCap(anchor, end.allocated);
      const unfolded: number[] = unfoldRawBytes([anchor.freed].concat(values).concat([end.freed]), cap,
        end.count > anchor.countAtStart);
      logCase('testStatSample0014', `reads=${values.length} trusted=${trusted} unfolded=${unfolded.length} ` +
        `cap=${cap} freedSpan=${spanOf(unfolded)}`);
      expect(trusted).assertTrue();
      expect(unfolded.length).assertEqual(REPEAT_READS + 2);
      expect(spanOf(unfolded) <= cap).assertTrue();
      expect(values.every((value: number) => byteDomain(value))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1500
     * @tc.name      testStatSample0015
     * @tc.desc      Read the long full GC key twelve times in a row and check monotonicity plus the collection count
     *               bound
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_FULL_GC_LONG));
      }
      const count: number = gcStat(KEY_GC_COUNT);
      const drops: number[] = valueDrops(values);
      logCase('testStatSample0015', `reads=${values.length} drops=${drops.join(',')} count=${count} ` +
        `lastLongFull=${values[values.length - 1]}`);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(values[values.length - 1] <= count).assertTrue();
      expect(allIntegers(values)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1600
     * @tc.name      testStatSample0016
     * @tc.desc      Take one hintGC between two samples and check the count delta is small, raw counters are ordered
     *               and both byte keys stay inside the read budget window
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const before: GcSnapshot = new GcSnapshot();
      hintGC();
      const after: GcSnapshot = new GcSnapshot();
      const delta: number = after.count - before.count;
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      logCase('testStatSample0016', `countDelta=${delta} beforeCount=${before.count} afterCount=${after.count} ` +
        `freedDelta=${freedDelta} cap=${freedCap(before, after.allocated)}`);
      expect(after.notBefore(before, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(delta >= 0).assertTrue();
      expect(delta <= HINT_COUNT_CAP).assertTrue();
      expect(after.longFullGc <= after.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1700
     * @tc.name      testStatSample0017
     * @tc.desc      Run the second hint burst row and check the allocated byte window stays inside the hint plus read
     *               budget and every adjacent window is ordered
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const series: GcSnapshot[] = await runSteps(HINT_STEPS[1]);
      const limits: number[] = stepLimits(HINT_STEPS[1]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0017', `steps=${HINT_STEPS[1].length} samples=${series.length} ` +
        `allocDelta=${allocDelta} limit=${limits[0]} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(HINT_STEPS[1].length + 1);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[1].bytesInWindow(series[0], limits[0]) && allocDelta <= limits[0]).assertTrue();
      expect(allFiniteNonNegative(series[1].values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1800
     * @tc.name      testStatSample0018
     * @tc.desc      Run the third hint burst row and check the freed byte delta stays below the object bytes at the
     *               start plus the trusted allocated delta
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(HINT_STEPS[2]);
      const limits: number[] = stepLimits(HINT_STEPS[2]);
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0018', `freedDelta=${freedDelta} allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series[1].bytesInWindow(series[0], limits[0])).assertTrue();
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1900
     * @tc.name      testStatSample0019
     * @tc.desc      Run the fourth hint burst row and check the collection time delta and the cumulative ordering
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(HINT_STEPS[3]);
      const timeDelta: number = series[1].time - series[0].time;
      const countDelta: number = series[1].count - series[0].count;
      logCase('testStatSample0019', `timeDelta=${timeDelta} countDelta=${countDelta} ` +
        `time=${series[0].time}->${series[1].time}`);
      expect(timeDelta >= 0).assertTrue();
      expect(countDelta >= 0).assertTrue();
      expect(series[1].count - series[0].count <= HINT_COUNT_CAP * 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2000
     * @tc.name      testStatSample0020
     * @tc.desc      Run the tenth hint burst row and check the long full GC delta and the count relation afterwards
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(HINT_STEPS[7]);
      const limits: number[] = stepLimits(HINT_STEPS[7]);
      const longDelta: number = series[1].longFullGc - series[0].longFullGc;
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0020', `longDelta=${longDelta} longFull=${series[1].longFullGc} ` +
        `count=${series[1].count}`);
      expect(longDelta >= 0).assertTrue();
      expect(series[1].longFullGc <= series[1].count).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2100
     * @tc.name      testStatSample0021
     * @tc.desc      Apply one allocatePressure burst and check the allocated byte delta clears the lower bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[0]);
      const limits: number[] = stepLimits(PRESSURE_STEPS[0]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const countDelta: number = series[1].count - series[0].count;
      logCase('testStatSample0021', `allocDelta=${allocDelta} lowerBound=${PRESSURE_MIN_BYTES} ` +
        `countDelta=${countDelta}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES).assertTrue();
      expect(countDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0], limits[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2200
     * @tc.name      testStatSample0022
     * @tc.desc      Apply two pressure bursts in one row and check the allocated delta covers twice the single burst
     *               bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[2]);
      const limits: number[] = stepLimits(PRESSURE_STEPS[2]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      const cap: number = series[0].objectKb * KB + allocDelta + KB;
      logCase('testStatSample0022', `allocDelta=${allocDelta} freedDelta=${freedDelta} cap=${cap}`);
      expect(series[1].bytesInWindow(series[0], limits[0])).assertTrue();
      expect(allocDelta >= PRESSURE_MIN_BYTES * 2).assertTrue();
      expect(freedDelta <= cap).assertTrue();
      expect(byteDomain(series[1].freed) && byteDomain(series[1].allocated)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2300
     * @tc.name      testStatSample0023
     * @tc.desc      Apply three pressure bursts and check the sample count, count delta and trusted allocation growth
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[4]);
      const limits: number[] = stepLimits(PRESSURE_STEPS[4]);
      const countDelta: number = series[1].count - series[0].count;
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      logCase('testStatSample0023', `countDelta=${countDelta} allocDelta=${allocDelta} ` +
        `allocated=${series[1].allocated} freed=${series[1].freed}`);
      expect(series.length).assertEqual(PRESSURE_STEPS[4].length + 1);
      expect(countDelta >= 0).assertTrue();
      expect(allocDelta >= PRESSURE_MIN_BYTES * 3).assertTrue();
      expect(snapshotDrops(series, limits).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2400
     * @tc.name      testStatSample0024
     * @tc.desc      Apply one pressure burst followed by a ten millisecond wait and check the allocated delta and
     *               ordering
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[1]);
      const limits: number[] = stepLimits(PRESSURE_STEPS[1]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const timeDelta: number = series[1].time - series[0].time;
      logCase('testStatSample0024', `allocDelta=${allocDelta} timeDelta=${timeDelta} ` +
        `waitMs=${PRESSURE_STEPS[1][0].waitMs}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES).assertTrue();
      expect(timeDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0], limits[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2500
     * @tc.name      testStatSample0025
     * @tc.desc      Apply four pressure bursts with a thirty millisecond wait and check the freed delta and the
     *               allocated bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[5]);
      const limits: number[] = stepLimits(PRESSURE_STEPS[5]);
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const cap: number = series[0].objectKb * KB + allocDelta + KB;
      logCase('testStatSample0025', `freedDelta=${freedDelta} allocDelta=${allocDelta} cap=${cap}`);
      expect(series[1].bytesInWindow(series[0], limits[0])).assertTrue();
      expect(freedDelta <= cap).assertTrue();
      expect(series[1].longFullGc <= series[1].count).assertTrue();
      expect(allFiniteNonNegative(series[1].values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2600
     * @tc.name      testStatSample0026
     * @tc.desc      Keep the small retained array block alive and check the allocated delta covers half of the
     *               retained bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const retained: number[][][] = [];
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[3], retained);
      const limits: number[] = stepLimits(MIXED_STEPS[3]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      logCase('testStatSample0026', `allocDelta=${allocDelta} retainedBytes=${RETAIN_SMALL_BYTES} ` +
        `objectBytes=${series[series.length - 1].objectKb * KB}`);
      expect(allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(series[series.length - 1].objectKb * KB >= RETAIN_SMALL_BYTES).assertTrue();
      expect(retainedIntact(retained, 1)).assertTrue();
      expect(series[1].notBefore(series[0], limits[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2700
     * @tc.name      testStatSample0027
     * @tc.desc      Retain two small blocks in one row and check the allocated delta covers one full block
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const steps: SampleStep[] = [new SampleStep(OP_RETAIN, 2, 0), new SampleStep(OP_IDLE, 1, 0)];
      const retained: number[][][] = [];
      const series: GcSnapshot[] = await runSteps(steps, retained);
      const limits: number[] = stepLimits(steps);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      logCase('testStatSample0027', `steps=${steps.length} allocDelta=${allocDelta} ` +
        `objectBytes=${series[series.length - 1].objectKb * KB}`);
      expect(allocDelta >= RETAIN_SMALL_BYTES).assertTrue();
      expect(series[series.length - 1].objectKb * KB >= 2 * RETAIN_SMALL_BYTES).assertTrue();
      expect(retainedIntact(retained, 2)).assertTrue();
      expect(snapshotDrops(series, limits).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2800
     * @tc.name      testStatSample0028
     * @tc.desc      Retain a block and then hint a collection and check the retained bytes were really accounted for
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const steps: SampleStep[] = [new SampleStep(OP_RETAIN, 1, 0), new SampleStep(OP_HINT, 2, 0),
        new SampleStep(OP_IDLE, 1, 0)];
      const retained: number[][][] = [];
      const series: GcSnapshot[] = await runSteps(steps, retained);
      const limits: number[] = stepLimits(steps);
      const firstTwoLimit: number = limits[0] + limits[1];
      const allocDelta: number = byteCounterDelta(series[2].allocated, series[0].allocated);
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0028', `samples=${series.length} allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(steps.length + 1);
      expect(byteCounterInWindow(series[2].allocated, series[0].allocated, firstTwoLimit) &&
        allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(retainedIntact(retained, 1)).assertTrue();
      expect(series[series.length - 1].objectKb * KB >= RETAIN_SMALL_BYTES).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2900
     * @tc.name      testStatSample0029
     * @tc.desc      Sample across a twenty millisecond async gap and check no counter moved backwards and all stayed
     *               finite
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(WAIT_STEPS[2]);
      const limits: number[] = stepLimits(WAIT_STEPS[2]);
      const countDelta: number = series[1].count - series[0].count;
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      logCase('testStatSample0029', `waitMs=${WAIT_STEPS[2][0].waitMs} countDelta=${countDelta} ` +
        `allocDelta=${allocDelta}`);
      expect(countDelta >= 0).assertTrue();
      expect(series[1].bytesInWindow(series[0], limits[0])).assertTrue();
      expect(allFiniteNonNegative(series[1].values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3000
     * @tc.name      testStatSample0030
     * @tc.desc      Sample across a forty millisecond async gap and check the freed and allocated deltas both stay
     *               ordered
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(WAIT_STEPS[4]);
      const limits: number[] = stepLimits(WAIT_STEPS[4]);
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const cap: number = series[0].objectKb * KB + allocDelta + KB;
      logCase('testStatSample0030', `waitMs=${WAIT_STEPS[4][0].waitMs} freedDelta=${freedDelta} cap=${cap}`);
      expect(series[1].bytesInWindow(series[0], limits[0])).assertTrue();
      expect(freedDelta <= cap).assertTrue();
      expect(byteDomain(series[1].freed) && byteDomain(series[1].allocated)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3100
     * @tc.name      testStatSample0031
     * @tc.desc      Sample across a sixty millisecond async gap and check the time counter delta and the finite value
     *               set
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(WAIT_STEPS[6]);
      const timeDelta: number = series[1].time - series[0].time;
      const longDelta: number = series[1].longFullGc - series[0].longFullGc;
      logCase('testStatSample0031', `waitMs=${WAIT_STEPS[6][0].waitMs} timeDelta=${timeDelta} ` +
        `longDelta=${longDelta}`);
      expect(timeDelta >= 0).assertTrue();
      expect(longDelta >= 0).assertTrue();
      expect(allFiniteNonNegative(series[1].values())).assertTrue();
      expect(series[1].longFullGc <= series[1].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3200
     * @tc.name      testStatSample0032
     * @tc.desc      Drive one forced collection cycle and check the count and freed deltas reported by the samples
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probes: WeakRef<RingNode>[] = [];
      const results: number[] = [];
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[5], [], results, probes);
      const limits: number[] = stepLimits(MIXED_STEPS[5]);
      const countDelta: number = series[1].count - series[0].count;
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      logCase('testStatSample0032', `cycles=${results[0]} countDelta=${countDelta} freedDelta=${freedDelta}`);
      expect(results[0] >= 1 && countDelta >= results[0]).assertTrue();
      expect(probes.length > 0 && allCleared(probes)).assertTrue();
      expect(series[1].bytesInWindow(series[0], limits[0]) && freedDelta > 0).assertTrue();
      expect(series[1].notBefore(series[0], limits[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3300
     * @tc.name      testStatSample0033
     * @tc.desc      Run runGcCycles for at least one cycle and check the reported cycle count and the sampled count
     *               delta agree
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const cycles: number = await runGcCycles(1, GC_ROUNDS_BUDGET);
      const after: GcSnapshot = new GcSnapshot();
      const countDelta: number = after.count - before.count;
      logCase('testStatSample0033', `cycles=${cycles} countDelta=${countDelta} budget=${GC_ROUNDS_BUDGET}`);
      expect(cycles >= 1).assertTrue();
      expect(countDelta >= cycles).assertTrue();
      expect(after.time >= before.time).assertTrue();
      expect(after.bytesInWindow(before, COLLECT_ALLOCATION_LIMIT_BYTES)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3400
     * @tc.name      testStatSample0034
     * @tc.desc      Run four light touches with two hints and check the allocated delta and the sample ordering
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[0]);
      const limits: number[] = stepLimits(MIXED_STEPS[0]);
      const allocDelta: number = byteCounterDelta(series[2].allocated, series[0].allocated);
      const freedDelta: number = byteCounterDelta(series[2].freed, series[0].freed);
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0034', `samples=${series.length} allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(MIXED_STEPS[0].length + 1);
      expect(byteCounterInWindow(series[2].allocated, series[0].allocated, limits[0] + limits[1])).assertTrue();
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3500
     * @tc.name      testStatSample0035
     * @tc.desc      Hint first, apply eight light touches, and validate the touch result and its byte window
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const results: number[] = [];
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[1], [], results);
      const limits: number[] = stepLimits(MIXED_STEPS[1]);
      const touchDelta: number = byteCounterDelta(series[2].allocated, series[1].allocated);
      const countDelta: number = series[2].count - series[1].count;
      logCase('testStatSample0035', `touchDelta=${touchDelta} countDelta=${countDelta} result=${results[1]}`);
      expect(series[2].notBefore(series[1], limits[1])).assertTrue();
      expect(touchDelta > 0).assertTrue();
      expect(results[1]).assertEqual(expectedTouchResult(8));
      expect(countDelta >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3600
     * @tc.name      testStatSample0036
     * @tc.desc      Combine one pressure burst with two hints and check the allocated delta still clears the lower
     *               bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[2]);
      const limits: number[] = stepLimits(MIXED_STEPS[2]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0036', `allocDelta=${allocDelta} countDelta=${series[1].count - series[0].count} ` +
        `drops=${drops.join(',')}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[1].longFullGc <= series[1].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3700
     * @tc.name      testStatSample0037
     * @tc.desc      Wait twenty milliseconds and then touch four times and check both deltas remain ordered
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[4]);
      const limits: number[] = stepLimits(MIXED_STEPS[4]);
      const allocDelta: number = byteCounterDelta(series[2].allocated, series[0].allocated);
      const timeDelta: number = series[2].time - series[0].time;
      logCase('testStatSample0037', `samples=${series.length} allocDelta=${allocDelta} timeDelta=${timeDelta}`);
      expect(series.length).assertEqual(MIXED_STEPS[4].length + 1);
      expect(snapshotDrops(series, limits).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(timeDelta >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3800
     * @tc.name      testStatSample0038
     * @tc.desc      Sample with no work at all and check the allocated byte delta stays inside the quiet budget
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(QUIET_STEPS[3].length + 1);
      const last: GcSnapshot = series[series.length - 1];
      const allocDelta: number = byteCounterDelta(last.allocated, series[0].allocated);
      const drops: number[] = snapshotDrops(series, sampleLimits(series, 0));
      logCase('testStatSample0038', `samples=${series.length} allocDelta=${allocDelta} ` +
        `budget=${QUIET_BUDGET_BYTES} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(QUIET_STEPS[3].length + 1);
      expect(byteCounterInWindow(last.allocated, series[0].allocated, QUIET_BUDGET_BYTES) &&
        allocDelta <= QUIET_BUDGET_BYTES).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3900
     * @tc.name      testStatSample0039
     * @tc.desc      Apply sixteen light touches and check the allocated delta is positive while the collection count
     *               delta stays small
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const results: number[] = [];
      const series: GcSnapshot[] = await runSteps(TOUCH_STEPS[5], [], results);
      const limits: number[] = stepLimits(TOUCH_STEPS[5]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      logCase('testStatSample0039', `touches=${TOUCH_STEPS[5][0].repeat} allocDelta=${allocDelta} ` +
        `result=${results[0]}`);
      expect(series[1].bytesInWindow(series[0], limits[0]) && allocDelta > 0).assertTrue();
      expect(results[0]).assertEqual(expectedTouchResult(16));
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4000
     * @tc.name      testStatSample0040
     * @tc.desc      Run a long mixed row of touches, hints, retention and a wait and check every sampled field only
     *               moves forward
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const steps: SampleStep[] = [new SampleStep(OP_TOUCH, 6, 0), new SampleStep(OP_RETAIN, 1, 0),
        new SampleStep(OP_HINT, 1, CADENCE_10), new SampleStep(OP_WAIT, 1, CADENCE_10),
        new SampleStep(OP_IDLE, 1, 0)];
      const retained: number[][][] = [];
      const series: GcSnapshot[] = await runSteps(steps, retained);
      const limits: number[] = stepLimits(steps);
      const allocated: number[] = allocatedSeries(series, limits);
      const drops: number[] = snapshotDrops(series, limits);
      const allocDelta: number = spanOf(allocated);
      logCase('testStatSample0040', `steps=${steps.length} samples=${series.length} ` +
        `allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(steps.length + 1);
      expect(allocated.length === series.length && allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(retainedIntact(retained, 1)).assertTrue();
      expect(series[series.length - 1].objectKb * KB >= RETAIN_SMALL_BYTES).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4100
     * @tc.name      testStatSample0041
     * @tc.desc      Take fifty consecutive quiet samples and check every field is monotonic and finite
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_50);
      const drops: number[] = snapshotDrops(series, sampleLimits(series, 0));
      const finite: boolean = series.every((snap: GcSnapshot) => allFiniteNonNegative(snap.values()));
      logCase('testStatSample0041', `samples=${series.length} drops=${drops.length} finite=${finite} ` +
        `firstCount=${series[0].count} lastCount=${series[SAMPLE_50 - 1].count}`);
      expect(series.length).assertEqual(SAMPLE_50);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(finite).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4200
     * @tc.name      testStatSample0042
     * @tc.desc      Take one hundred and twenty consecutive quiet samples and check the allocated byte series never
     *               drops
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_120);
      const allocated: number[] = allocatedSeries(series, sampleLimits(series, 0));
      const allocatedSpan: number = spanOf(allocated);
      logCase('testStatSample0042', `samples=${series.length} span=${allocatedSpan} ` +
        `firstAllocated=${allocated[0]} lastAllocated=${allocated[SAMPLE_120 - 1]}`);
      expect(series.length).assertEqual(SAMPLE_120);
      expect(allocated.length).assertEqual(SAMPLE_120);
      expect(allocatedSpan <= (SAMPLE_120 - 1) * STAT_READ_ALLOCATION_LIMIT_BYTES).assertTrue();
      expect(byteDomain(allocated[0]) && maxOf(allocated) < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4300
     * @tc.name      testStatSample0043
     * @tc.desc      Take two hundred consecutive quiet samples and check the collection count series is monotonic and
     *               integral
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const countSeries: number[] = counts(series);
      const drops: number[] = valueDrops(countSeries);
      logCase('testStatSample0043', `samples=${series.length} drops=${drops.join(',')} ` +
        `min=${minOf(countSeries)} max=${maxOf(countSeries)}`);
      expect(series.length).assertEqual(SAMPLE_200);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allIntegers(countSeries)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4400
     * @tc.name      testStatSample0044
     * @tc.desc      Sample fifty times with light touches and check the whole series stays ordered and the allocated
     *               series grows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_50, 0);
      const limits: number[] = sampleLimits(series, TOUCH_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const allocDelta: number = spanOf(allocated);
      const freedDelta: number = spanOf(freed);
      logCase('testStatSample0044', `samples=${series.length} allocDelta=${allocDelta} freedDelta=${freedDelta}`);
      expect(allocated.length).assertEqual(SAMPLE_50);
      expect(freed.length).assertEqual(SAMPLE_50);
      expect(allocDelta > 0).assertTrue();
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4500
     * @tc.name      testStatSample0045
     * @tc.desc      Sample one hundred times with light touches and check unfolded freed bytes stay within the
     *               start-object plus trusted-allocation ceiling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_100, 0);
      const limits: number[] = sampleLimits(series, TOUCH_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const allocDelta: number = spanOf(allocated);
      const freedDelta: number = spanOf(freed);
      logCase('testStatSample0045', `samples=${series.length} allocDelta=${allocDelta} freedDelta=${freedDelta}`);
      expect(series.length).assertEqual(SAMPLE_100);
      expect(allocated.length).assertEqual(SAMPLE_100);
      expect(freed.length).assertEqual(SAMPLE_100);
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4600
     * @tc.name      testStatSample0046
     * @tc.desc      Sample one hundred and fifty times with light touches and check all five fields stay monotonic
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_150, 0);
      const limits: number[] = sampleLimits(series, TOUCH_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const countDrops: number[] = valueDrops(counts(series));
      logCase('testStatSample0046', `samples=${series.length} countDrops=${countDrops.length} ` +
        `allocated=${allocated.length} freed=${freed.length}`);
      expect(series.length).assertEqual(SAMPLE_150);
      expect(countDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocated.length).assertEqual(SAMPLE_150);
      expect(freed.length).assertEqual(SAMPLE_150);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4700
     * @tc.name      testStatSample0047
     * @tc.desc      Sample sixty times with touches and periodic hints and check the long full GC series never drops
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_60, 0);
      const longDrops: number[] = valueDrops(longFullSeries(series));
      const timeDrops: number[] = valueDrops(times(series));
      logCase('testStatSample0047', `samples=${series.length} longDrops=${longDrops.length} ` +
        `timeDrops=${timeDrops.length} longFull=${series[SAMPLE_60 - 1].longFullGc}`);
      expect(series.length).assertEqual(SAMPLE_60);
      expect(longDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(timeDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[SAMPLE_60 - 1].longFullGc <= series[SAMPLE_60 - 1].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4800
     * @tc.name      testStatSample0048
     * @tc.desc      Sample ninety times with touches and periodic hints and check the sample count plus the total
     *               allocated delta
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_90, 0);
      const allocated: number[] = allocatedSeries(series, sampleLimits(series, TOUCH_ALLOCATION_LIMIT_BYTES));
      const allocDeltas: number[] = deltas(allocated);
      logCase('testStatSample0048', `samples=${series.length} deltas=${allocDeltas.length} ` +
        `totalDelta=${total(allocDeltas)}`);
      expect(series.length).assertEqual(SAMPLE_90);
      expect(allocated.length).assertEqual(SAMPLE_90);
      expect(allocDeltas.length).assertEqual(SAMPLE_90 - 1);
      expect(total(allocDeltas) > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4900
     * @tc.name      testStatSample0049
     * @tc.desc      Take six samples across pressure bursts and pauses and check the count series never drops
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [];
      for (let round = 0; round < SAMPLE_6; round++) {
        allocatePressure();
        await sleepMs(CADENCE_5);
        series.push(new GcSnapshot());
      }
      const limits: number[] = sampleLimits(series, PRESSURE_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const drops: number[] = valueDrops(counts(series));
      const allocGrowth: number = spanOf(allocated);
      logCase('testStatSample0049', `samples=${series.length} drops=${drops.join(',')} ` +
        `allocGrowth=${allocGrowth}`);
      expect(series.length).assertEqual(SAMPLE_6);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocated.length === SAMPLE_6 && allocGrowth > 0).assertTrue();
      expect(spanOf(freed) <= series[0].objectKb * KB + allocGrowth + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5000
     * @tc.name      testStatSample0050
     * @tc.desc      Take eight samples between pressure bursts with longer pauses and check the freed series and the
     *               time series
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [];
      for (let round = 0; round < SAMPLE_8; round++) {
        allocatePressure();
        hintGC();
        await sleepMs(CADENCE_10);
        series.push(new GcSnapshot());
      }
      const limits: number[] = sampleLimits(series, PRESSURE_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const timeDrops: number[] = valueDrops(times(series));
      logCase('testStatSample0050', `samples=${series.length} freed=${freed.length} ` +
        `timeDrops=${timeDrops.length}`);
      expect(series.length).assertEqual(SAMPLE_8);
      expect(allocated.length).assertEqual(SAMPLE_8);
      expect(freed.length).assertEqual(SAMPLE_8);
      expect(timeDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(spanOf(freed) <= series[0].objectKb * KB + spanOf(allocated) + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5100
     * @tc.name      testStatSample0051
     * @tc.desc      Look only at the collection count across two hundred samples and check it is a monotonic integer
     *               series
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const countSeries: number[] = counts(series);
      const stepTotal: number = total(deltas(countSeries));
      logCase('testStatSample0051', `samples=${countSeries.length} stepTotal=${stepTotal} ` +
        `min=${minOf(countSeries)} max=${maxOf(countSeries)}`);
      expect(countSeries.length).assertEqual(SAMPLE_200);
      expect(valueDrops(countSeries).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allIntegers(countSeries)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5200
     * @tc.name      testStatSample0052
     * @tc.desc      Look only at the collection time across two hundred samples and check it is a monotonic finite
     *               series
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const timeSeries: number[] = times(series);
      logCase('testStatSample0052', `samples=${timeSeries.length} drops=${valueDrops(timeSeries).length} ` +
        `min=${minOf(timeSeries)} max=${maxOf(timeSeries)}`);
      expect(timeSeries.length).assertEqual(SAMPLE_200);
      expect(valueDrops(timeSeries).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allFiniteNonNegative(timeSeries)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5300
     * @tc.name      testStatSample0053
     * @tc.desc      Look only at the allocated bytes across two hundred samples and check the series grows or holds
     *               but never shrinks
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const allocated: number[] = allocatedSeries(series, sampleLimits(series, 0));
      const allocatedSpan: number = spanOf(allocated);
      logCase('testStatSample0053', `samples=${allocated.length} span=${allocatedSpan} ` +
        `stepTotal=${total(deltas(allocated))}`);
      expect(allocated.length).assertEqual(SAMPLE_200);
      expect(allocatedSpan <= (SAMPLE_200 - 1) * STAT_READ_ALLOCATION_LIMIT_BYTES).assertTrue();
      expect(byteDomain(allocated[0])).assertTrue();
      expect(maxOf(allocated) < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5400
     * @tc.name      testStatSample0054
     * @tc.desc      Look only at freed bytes across two hundred samples and check the unfolded span stays within its
     *               physical ceiling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const limits: number[] = sampleLimits(series, 0);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      logCase('testStatSample0054', `samples=${freed.length} allocDelta=${spanOf(allocated)} ` +
        `freedDelta=${spanOf(freed)}`);
      expect(allocated.length).assertEqual(SAMPLE_200);
      expect(freed.length).assertEqual(SAMPLE_200);
      expect(spanOf(freed) <= series[0].objectKb * KB + spanOf(allocated) + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5500
     * @tc.name      testStatSample0055
     * @tc.desc      Look only at the long full GC count across two hundred samples and check it is monotonic and
     *               bounded by the collection count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const longFull: number[] = longFullSeries(series);
      const bounded: boolean = series.every((snap: GcSnapshot) => snap.longFullGc <= snap.count);
      logCase('testStatSample0055', `samples=${longFull.length} drops=${valueDrops(longFull).length} ` +
        `bounded=${bounded} max=${maxOf(longFull)}`);
      expect(longFull.length).assertEqual(SAMPLE_200);
      expect(valueDrops(longFull).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(bounded).assertTrue();
      expect(allIntegers(longFull)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5600
     * @tc.name      testStatSample0056
     * @tc.desc      Keep four blocks reachable while sixty samples are taken and check the arrays survive and the
     *               counters only grow
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const kept: number[][] = retainArrays(RETAIN_BLOCKS, RETAIN_SMALL_LENGTH);
      const series: GcSnapshot[] = [];
      for (let round = 0; round < SAMPLE_60; round++) {
        if (round % 15 === 0) {
          hintGC();
        }
        series.push(new GcSnapshot());
      }
      const intact: boolean = kept.every((row: number[], index: number) =>
        row.length === RETAIN_SMALL_LENGTH && row[0] === index && row[RETAIN_SMALL_LENGTH - 1] === index);
      const drops: number[] = snapshotDrops(series, sampleLimits(series, 0));
      logCase('testStatSample0056', `kept=${kept.length} intact=${intact} samples=${series.length} ` +
        `drops=${drops.length}`);
      expect(kept.length).assertEqual(RETAIN_BLOCKS);
      expect(intact).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5700
     * @tc.name      testStatSample0057
     * @tc.desc      Take fifty samples on a five millisecond cadence and check the series is ordered and the sample
     *               count is exact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await samplePaced(SAMPLE_50, CADENCE_5);
      const limits: number[] = sampleLimits(series, 0);
      const allocated: number[] = allocatedSeries(series, limits);
      const drops: number[] = snapshotDrops(series, limits);
      logCase('testStatSample0057', `samples=${series.length} cadenceMs=${CADENCE_5} drops=${drops.length} ` +
        `allocDelta=${spanOf(allocated)}`);
      expect(series.length).assertEqual(SAMPLE_50);
      expect(allocated.length).assertEqual(SAMPLE_50);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[SAMPLE_50 - 1].count >= series[0].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5800
     * @tc.name      testStatSample0058
     * @tc.desc      Take sixty samples on a ten millisecond cadence and check unfolded freed bytes stay within the
     *               start-object plus trusted-allocation ceiling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await samplePaced(SAMPLE_60, CADENCE_10);
      const limits: number[] = sampleLimits(series, 0);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      logCase('testStatSample0058', `samples=${series.length} cadenceMs=${CADENCE_10} ` +
        `freedDelta=${spanOf(freed)}`);
      expect(series.length).assertEqual(SAMPLE_60);
      expect(allocated.length).assertEqual(SAMPLE_60);
      expect(freed.length).assertEqual(SAMPLE_60);
      expect(spanOf(freed) <= series[0].objectKb * KB + spanOf(allocated) + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5900
     * @tc.name      testStatSample0059
     * @tc.desc      Collect two hundred samples and check every single sample carries five finite ordered field
     *               values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const fiveField: boolean = series.every((snap: GcSnapshot) => snap.values().length === EXPECTED_KEY_COUNT);
      const finite: boolean = series.every((snap: GcSnapshot) => allFiniteNonNegative(snap.values()));
      const ordered: boolean = snapshotDrops(series, sampleLimits(series, 0)).length === EXPECTED_DROPS_NONE;
      logCase('testStatSample0059', `samples=${series.length} fiveField=${fiveField} finite=${finite} ` +
        `ordered=${ordered}`);
      expect(series.length).assertEqual(SAMPLE_200);
      expect(fiveField).assertTrue();
      expect(finite).assertTrue();
      expect(ordered).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6000
     * @tc.name      testStatSample0060
     * @tc.desc      Build deltas from two hundred quiet samples and check none of the four deltas is negative for any
     *               field
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const limits: number[] = sampleLimits(series, 0);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const countDeltas: number[] = deltas(counts(series));
      const longDeltas: number[] = deltas(longFullSeries(series));
      const nonByteNegative: number = countDeltas.concat(longDeltas)
        .filter((value: number) => value < 0).length;
      logCase('testStatSample0060', `samples=${series.length} deltasPerField=${countDeltas.length} ` +
        `nonByteNegative=${nonByteNegative}`);
      expect(countDeltas.length).assertEqual(SAMPLE_200 - 1);
      expect(nonByteNegative).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocated.length).assertEqual(SAMPLE_200);
      expect(freed.length).assertEqual(SAMPLE_200);
      expect(spanOf(allocated) <= (SAMPLE_200 - 1) * STAT_READ_ALLOCATION_LIMIT_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6100
     * @tc.name      testStatSample0061
     * @tc.desc      Take twenty quiet samples and check every freed-byte window stays within its physical ceiling
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_20);
      const violations: number[] = [];
      const ratios: number[] = [];
      for (let i = 1; i < series.length; i++) {
        const allocDelta: number = byteCounterDelta(series[i].allocated, series[i - 1].allocated);
        const freedDelta: number = byteCounterDelta(series[i].freed, series[i - 1].freed);
        const cap: number = series[i - 1].objectKb * KB + allocDelta + KB;
        if (!series[i].bytesInWindow(series[i - 1], STAT_READ_ALLOCATION_LIMIT_BYTES) || freedDelta > cap) {
          violations.push(i);
        }
        ratios.push(percentOf(freedDelta, cap));
      }
      logCase('testStatSample0061', `samples=${series.length} violations=${violations.length} ` +
        `minRatio=${minOf(ratios)} maxRatio=${maxOf(ratios)}`);
      expect(series.length).assertEqual(SAMPLE_20);
      expect(violations.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(maxOf(ratios) <= PERCENT_FULL).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6200
     * @tc.name      testStatSample0062
     * @tc.desc      Apply two pressure bursts and check allocation growth plus the physical freed-byte ceiling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const before: GcSnapshot = new GcSnapshot();
      allocatePressure();
      allocatePressure();
      const after: GcSnapshot = new GcSnapshot();
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      const cap: number = before.objectKb * KB + allocDelta + KB;
      const budget: number = 2 * PRESSURE_ALLOCATION_LIMIT_BYTES + STAT_READ_ALLOCATION_LIMIT_BYTES;
      logCase('testStatSample0062', `allocDelta=${allocDelta} freedDelta=${freedDelta} cap=${cap}`);
      expect(after.bytesInWindow(before, budget)).assertTrue();
      expect(allocDelta >= PRESSURE_MIN_BYTES * 2).assertTrue();
      expect(freedDelta <= cap).assertTrue();
      expect(percentOf(freedDelta, cap) <= PERCENT_FULL).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6300
     * @tc.name      testStatSample0063
     * @tc.desc      Keep a retained block alive and check its contents, current object bytes and byte domains
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const kept: number[][] = retainArrays(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
      const snap: GcSnapshot = new GcSnapshot();
      const intact: boolean = retainedIntact([kept], 1);
      logCase('testStatSample0063', `kept=${kept.length} intact=${intact} objectBytes=${snap.objectKb * KB}`);
      expect(intact).assertTrue();
      expect(snap.objectKb * KB >= RETAIN_HALF_BYTES).assertTrue();
      expect(byteDomain(snap.allocated) && byteDomain(snap.freed)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6400
     * @tc.name      testStatSample0064
     * @tc.desc      Compare two resting snapshots and check the freed-byte delta stays within its physical ceiling
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const before: GcSnapshot = new GcSnapshot();
      const after: GcSnapshot = new GcSnapshot();
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      const cap: number = before.objectKb * KB + allocDelta + KB;
      const share: number = percentOf(freedDelta, cap);
      logCase('testStatSample0064', `allocDelta=${allocDelta} freedDelta=${freedDelta} share=${share}`);
      expect(after.bytesInWindow(before, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(freedDelta <= cap).assertTrue();
      expect(share >= 0 && share <= PERCENT_FULL).assertTrue();
      expect(byteDomain(after.allocated) && byteDomain(after.freed)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6500
     * @tc.name      testStatSample0065
     * @tc.desc      Retain a fresh block after a baseline sample and check allocated bytes grew by at least half of
     *               the retained bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const before: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
      const after: GcSnapshot = new GcSnapshot();
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const budget: number = RETAIN_ALLOCATION_LIMIT_BYTES + STAT_READ_ALLOCATION_LIMIT_BYTES;
      logCase('testStatSample0065', `kept=${kept.length} allocDelta=${allocDelta} ` +
        `retainedBytes=${RETAIN_SMALL_BYTES}`);
      expect(retainedIntact([kept], 1)).assertTrue();
      expect(after.bytesInWindow(before, budget)).assertTrue();
      expect(allocDelta >= RETAIN_HALF_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6600
     * @tc.name      testStatSample0066
     * @tc.desc      Force collection cycles, observe the original weak targets clear and check trusted freed growth
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probes: WeakRef<RingNode>[] = [];
      const before: GcSnapshot = new GcSnapshot();
      const cycles: number = await runObservedCycles(probes);
      const after: GcSnapshot = new GcSnapshot();
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      logCase('testStatSample0066', `cycles=${cycles} freedDelta=${freedDelta} allocDelta=${allocDelta}`);
      expect(cycles >= 1).assertTrue();
      expect(probes.length > 0 && allCleared(probes)).assertTrue();
      expect(after.bytesInWindow(before, COLLECT_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(freedDelta > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6700
     * @tc.name      testStatSample0067
     * @tc.desc      Check the long full GC counter never exceeds the collection count at rest and stays below the
     *               sanity bound
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_20);
      const violations: number[] = series
        .filter((snap: GcSnapshot) => snap.longFullGc > snap.count)
        .map((snap: GcSnapshot) => snap.longFullGc);
      logCase('testStatSample0067', `samples=${series.length} violations=${violations.length} ` +
        `longFull=${series[SAMPLE_20 - 1].longFullGc} count=${series[SAMPLE_20 - 1].count}`);
      expect(violations.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[SAMPLE_20 - 1].longFullGc <= series[SAMPLE_20 - 1].count).assertTrue();
      expect(series[SAMPLE_20 - 1].longFullGc < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6800
     * @tc.name      testStatSample0068
     * @tc.desc      Force a collection cycle with garbage on the heap and check the long full GC counter still stays
     *               below the collection count
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      allocatePressure();
      hintGC();
      await sleepMs(CADENCE_20);
      const snap: GcSnapshot = new GcSnapshot();
      const spare: number = snap.count - snap.longFullGc;
      logCase('testStatSample0068', `count=${snap.count} longFull=${snap.longFullGc} spare=${spare} ` +
        `time=${snap.time}`);
      expect(snap.longFullGc <= snap.count).assertTrue();
      expect(spare >= 0).assertTrue();
      expect(snap.time >= 0).assertTrue();
      expect(snap.count > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6900
     * @tc.name      testStatSample0069
     * @tc.desc      Run the two burst pressure row and check the allocated delta against the documented lower bound
     *               of one burst
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[3]);
      const limits: number[] = stepLimits(PRESSURE_STEPS[3]);
      const allocDelta: number = byteCounterDelta(series[1].allocated, series[0].allocated);
      const freedDelta: number = byteCounterDelta(series[1].freed, series[0].freed);
      const share: number = percentOf(allocDelta, limits[0]);
      logCase('testStatSample0069', `allocDelta=${allocDelta} bound=${PRESSURE_MIN_BYTES} ` +
        `shareOfBudget=${share}`);
      expect(series[1].bytesInWindow(series[0], limits[0])).assertTrue();
      expect(allocDelta >= PRESSURE_MIN_BYTES * 2 && allocDelta <= limits[0]).assertTrue();
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7000
     * @tc.name      testStatSample0070
     * @tc.desc      Compare the cumulative freed and allocated deltas over a mixed row and check freed never runs
     *               ahead
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[0]);
      const limits: number[] = stepLimits(MIXED_STEPS[0]);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const allocDelta: number = spanOf(allocated);
      const freedDelta: number = spanOf(freed);
      logCase('testStatSample0070', `freedDelta=${freedDelta} allocDelta=${allocDelta}`);
      expect(allocated.length).assertEqual(series.length);
      expect(freed.length).assertEqual(series.length);
      expect(freedDelta <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
      expect(snapshotDrops(series, limits).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7100
     * @tc.name      testStatSample0071
     * @tc.desc      Retain a block and check trusted allocation growth, intact rows and current object bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const before: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
      hintGC();
      const after: GcSnapshot = new GcSnapshot();
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const budget: number = RETAIN_ALLOCATION_LIMIT_BYTES + STAT_READ_ALLOCATION_LIMIT_BYTES;
      logCase('testStatSample0071', `kept=${kept.length} allocDelta=${allocDelta} ` +
        `objectBytes=${after.objectKb * KB}`);
      expect(after.bytesInWindow(before, budget) && allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(retainedIntact([kept], 1)).assertTrue();
      expect(after.objectKb * KB >= RETAIN_HALF_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7200
     * @tc.name      testStatSample0072
     * @tc.desc      Retain a block through a collection and check cycles, intact rows, object bytes and byte windows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
      const cycles: number = await runGcCycles(1, GC_ROUNDS_BUDGET);
      const after: GcSnapshot = new GcSnapshot();
      const budget: number = RETAIN_ALLOCATION_LIMIT_BYTES + COLLECT_ALLOCATION_LIMIT_BYTES;
      logCase('testStatSample0072', `kept=${kept.length} cycles=${cycles} objectBytes=${after.objectKb * KB}`);
      expect(cycles >= 1).assertTrue();
      expect(retainedIntact([kept], 1)).assertTrue();
      expect(after.objectKb * KB >= RETAIN_SMALL_BYTES).assertTrue();
      expect(after.bytesInWindow(before, budget)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7300
     * @tc.name      testStatSample0073
     * @tc.desc      Sleep twenty milliseconds and check the elapsed wall time matches the requested cadence and the
     *               sample stays valid
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const start: number = Date.now();
      await sleepMs(CADENCE_20);
      const elapsed: number = Date.now() - start;
      const snap: GcSnapshot = new GcSnapshot();
      logCase('testStatSample0073', `requestedMs=${CADENCE_20} elapsed=${elapsed} slack=${CADENCE_SLACK_MS}`);
      expect(elapsed >= CADENCE_20 - CADENCE_SLACK_MS).assertTrue();
      expect(elapsed < CADENCE_BUDGET_MS).assertTrue();
      expect(allFiniteNonNegative(snap.values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7400
     * @tc.name      testStatSample0074
     * @tc.desc      Sleep forty milliseconds and check the cadence lower bound plus the counter ordering around the
     *               wait
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const start: number = Date.now();
      await sleepMs(CADENCE_40);
      const elapsed: number = Date.now() - start;
      const after: GcSnapshot = new GcSnapshot();
      logCase('testStatSample0074', `requestedMs=${CADENCE_40} elapsed=${elapsed} ` +
        `count=${before.count}->${after.count}`);
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      expect(elapsed >= CADENCE_40 - CADENCE_SLACK_MS).assertTrue();
      expect(after.bytesInWindow(before, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(freedDelta <= before.objectKb * KB + allocDelta + KB).assertTrue();
      expect(elapsed < CADENCE_BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7500
     * @tc.name      testStatSample0075
     * @tc.desc      Sleep sixty milliseconds and check the cadence lower bound plus the allocated and freed ordering
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const start: number = Date.now();
      await sleepMs(CADENCE_60);
      const elapsed: number = Date.now() - start;
      const after: GcSnapshot = new GcSnapshot();
      logCase('testStatSample0075', `requestedMs=${CADENCE_60} elapsed=${elapsed} ` +
        `allocated=${before.allocated}->${after.allocated}`);
      expect(elapsed >= CADENCE_60 - CADENCE_SLACK_MS).assertTrue();
      expect(after.bytesInWindow(before, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(byteDomain(after.allocated) && byteDomain(after.freed)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7600
     * @tc.name      testStatSample0076
     * @tc.desc      Walk three cadence rows from the wait matrix and check each requested sleep is actually spent and
     *               the samples stay ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const shortfalls: number[] = [];
      const startAll: number = Date.now();
      for (let row = 0; row < 3; row++) {
        const waitMs: number = WAIT_STEPS[row][0].waitMs;
        const start: number = Date.now();
        const series: GcSnapshot[] = await runSteps(WAIT_STEPS[row]);
        const elapsed: number = Date.now() - start;
        if (elapsed < waitMs - CADENCE_SLACK_MS) {
          shortfalls.push(row);
        }
        if (snapshotDrops(series, stepLimits(WAIT_STEPS[row])).length !== EXPECTED_DROPS_NONE) {
          shortfalls.push(row + 100);
        }
      }
      const elapsedAll: number = Date.now() - startAll;
      logCase('testStatSample0076', `rows=3 shortfalls=${shortfalls.join(',')} elapsedAll=${elapsedAll}`);
      expect(shortfalls.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(elapsedAll > 0).assertTrue();
      expect(elapsedAll < CADENCE_BUDGET_MS).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7700
     * @tc.name      testStatSample0077
     * @tc.desc      Take twenty paced samples ten milliseconds apart and check the wall time budget, the sample count
     *               and the ordering
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testStatSample0077', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const expectedMs: number = SAMPLE_20 * CADENCE_10;
      const start: number = Date.now();
      const series: GcSnapshot[] = await samplePaced(SAMPLE_20, CADENCE_10);
      const elapsed: number = Date.now() - start;
      logCase('testStatSample0077', `samples=${series.length} expectedMs=${expectedMs} elapsed=${elapsed}`);
      expect(series.length).assertEqual(SAMPLE_20);
      expect(elapsed >= expectedMs / 2).assertTrue();
      expect(snapshotDrops(series, sampleLimits(series, 0)).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allFiniteNonNegative(series[SAMPLE_20 - 1].values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7800
     * @tc.name      testStatSample0078
     * @tc.desc      Take paced samples while hinting periodically and check the counters are never lost across the
     *               cadence
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await samplePaced(SAMPLE_20, CADENCE_5);
      const countSeries: number[] = counts(series);
      const allocated: number[] = allocatedSeries(series, sampleLimits(series, 0));
      const allocDelta: number = spanOf(allocated);
      logCase('testStatSample0078', `samples=${series.length} countDrops=${valueDrops(countSeries).length} ` +
        `allocDelta=${allocDelta}`);
      expect(countSeries.length).assertEqual(SAMPLE_20);
      expect(valueDrops(countSeries).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocated.length).assertEqual(SAMPLE_20);
      expect(byteDomain(allocated[0]) && allocDelta >= 0 &&
        allocDelta <= (SAMPLE_20 - 1) * STAT_READ_ALLOCATION_LIMIT_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7900
     * @tc.name      testStatSample0079
     * @tc.desc      Bound the cost of a paced short series and check the wall time stays inside the overall sampling
     *               budget
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testStatSample0079', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: number = Date.now();
      const series: GcSnapshot[] = await samplePaced(SAMPLE_20, CADENCE_5);
      const elapsed: number = Date.now() - start;
      logCase('testStatSample0079', `samples=${series.length} elapsed=${elapsed} budget=${CADENCE_BUDGET_MS}`);
      expect(elapsed < CADENCE_BUDGET_MS).assertTrue();
      expect(elapsed >= SAMPLE_20 * CADENCE_5 / 2).assertTrue();
      expect(series.length).assertEqual(SAMPLE_20);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8000
     * @tc.name      testStatSample0080
     * @tc.desc      Sample across a one hundred millisecond idle gap and check all fields stay ordered afterwards
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      await sleepMs(CADENCE_100);
      const after: GcSnapshot = new GcSnapshot();
      const elapsedGap: number = after.time - before.time;
      logCase('testStatSample0080', `gapMs=${CADENCE_100} timeDelta=${elapsedGap} ` +
        `allocDelta=${byteCounterDelta(after.allocated, before.allocated)}`);
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      expect(after.bytesInWindow(before, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(elapsedGap >= 0).assertTrue();
      expect(freedDelta <= before.objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8100
     * @tc.name      testStatSample0081
     * @tc.desc      Interleave sleeps and pressure bursts and check the sample series keeps growing while the
     *               allocated delta stays positive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [];
      for (let round = 0; round < SAMPLE_4; round++) {
        allocatePressure();
        await sleepMs(CADENCE_10);
        series.push(new GcSnapshot());
      }
      const limits: number[] = sampleLimits(series, PRESSURE_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const allocDelta: number = spanOf(allocated);
      logCase('testStatSample0081', `samples=${series.length} allocDelta=${allocDelta} freed=${freed.length}`);
      expect(series.length).assertEqual(SAMPLE_4);
      expect(allocated.length === SAMPLE_4 && allocDelta > 0).assertTrue();
      expect(freed.length).assertEqual(SAMPLE_4);
      expect(spanOf(freed) <= series[0].objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8200
     * @tc.name      testStatSample0082
     * @tc.desc      Take one sample, wait thirty milliseconds and take another, then check no key lost its earlier
     *               value across the gap
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const anchor: GcSnapshot = new GcSnapshot();
      const first: number[] = keyValues();
      const start: number = Date.now();
      await sleepMs(CADENCE_30);
      const elapsed: number = Date.now() - start;
      const second: number[] = keyValues();
      logCase('testStatSample0082', `elapsed=${elapsed} pairs=${first.length}`);
      expect(elapsed >= CADENCE_30 - CADENCE_SLACK_MS).assertTrue();
      expect(rawNonByteOrdered(first, second)).assertTrue();
      expect(rawPairInWindow(anchor, first, second, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(allFiniteNonNegative(second) && second.length === EXPECTED_KEY_COUNT).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8300
     * @tc.name      testStatSample0083
     * @tc.desc      Read all five keys at rest and check none of them is NaN, infinite or negative
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const values: number[] = keyValues();
      const nanCount: number = values.filter((value: number) => Number.isNaN(value)).length;
      const infiniteCount: number = values.filter((value: number) => !Number.isFinite(value)).length;
      const negativeCount: number = values.filter((value: number) => value < 0).length;
      logCase('testStatSample0083', `values=${values.join(',')} nan=${nanCount} infinite=${infiniteCount} ` +
        `negative=${negativeCount}`);
      expect(nanCount).assertEqual(EXPECTED_DROPS_NONE);
      expect(infiniteCount).assertEqual(EXPECTED_DROPS_NONE);
      expect(negativeCount).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8400
     * @tc.name      testStatSample0084
     * @tc.desc      Read all five keys after two pressure bursts and check domains plus trusted byte windows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const anchor: GcSnapshot = new GcSnapshot();
      allocatePressure();
      allocatePressure();
      const values: number[] = keyValues();
      const budget: number = 2 * PRESSURE_ALLOCATION_LIMIT_BYTES + STAT_READ_ALLOCATION_LIMIT_BYTES;
      const allocDelta: number = byteCounterDelta(values[2], anchor.allocated);
      const freedDelta: number = byteCounterDelta(values[3], anchor.freed);
      const freedTrusted: boolean = byteCounterInWindow(values[3], anchor.freed, freedCap(anchor, values[2])) &&
        (values[3] >= anchor.freed || values[0] > anchor.countAtStart);
      logCase('testStatSample0084', `values=${values.join(',')} allocDelta=${allocDelta} freedDelta=${freedDelta}`);
      expect(allFiniteNonNegative(values)).assertTrue();
      expect(byteCounterInWindow(values[2], anchor.allocated, budget) &&
        allocDelta >= PRESSURE_MIN_BYTES * 2).assertTrue();
      expect(freedTrusted && freedDelta <= freedCap(anchor, values[2])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8500
     * @tc.name      testStatSample0085
     * @tc.desc      Read all five keys after a forced collection and check raw non-byte order plus trusted byte windows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const anchor: GcSnapshot = new GcSnapshot();
      const before: number[] = keyValues();
      const cycles: number = await runGcCycles(1, GC_ROUNDS_BUDGET);
      const after: number[] = keyValues();
      logCase('testStatSample0085', `before=${before.join(',')} after=${after.join(',')} cycles=${cycles}`);
      expect(cycles >= 1).assertTrue();
      expect(rawNonByteOrdered(before, after)).assertTrue();
      expect(rawPairInWindow(anchor, before, after, COLLECT_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(allFiniteNonNegative(after)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8600
     * @tc.name      testStatSample0086
     * @tc.desc      Take twenty quiet snapshots and check every field of every snapshot is finite and non negative
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_20);
      const limits: number[] = sampleLimits(series, 0);
      const bad: number[] = [];
      series.forEach((snap: GcSnapshot, index: number) => {
        if (!allFiniteNonNegative(snap.values()) || !byteDomain(snap.allocated) || !byteDomain(snap.freed)) {
          bad.push(index);
        }
      });
      logCase('testStatSample0086', `samples=${series.length} bad=${bad.join(',')} ` +
        `firstAllocated=${series[0].allocated}`);
      expect(bad.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series.length).assertEqual(SAMPLE_20);
      expect(byteDomain(series[0].allocated)).assertTrue();
      expect(byteFailures(series, limits).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8700
     * @tc.name      testStatSample0087
     * @tc.desc      Flatten two hundred quiet samples and check not one of the thousand field values is NaN
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const flat: number[] = [];
      series.forEach((snap: GcSnapshot) => {
        snap.values().forEach((value: number) => {
          flat.push(value);
        });
      });
      const nanCount: number = flat.filter((value: number) => Number.isNaN(value)).length;
      logCase('testStatSample0087', `samples=${series.length} values=${flat.length} nan=${nanCount}`);
      expect(flat.length).assertEqual(SAMPLE_200 * EXPECTED_KEY_COUNT);
      expect(nanCount).assertEqual(EXPECTED_DROPS_NONE);
      expect(allFiniteNonNegative(flat)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8800
     * @tc.name      testStatSample0088
     * @tc.desc      Flatten two hundred quiet samples and check none of the field values is infinite
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const flat: number[] = [];
      series.forEach((snap: GcSnapshot) => {
        flat.push(snap.count, snap.time, snap.allocated, snap.freed, snap.longFullGc);
      });
      const infiniteCount: number = flat.filter((value: number) => !Number.isFinite(value)).length;
      logCase('testStatSample0088', `values=${flat.length} infinite=${infiniteCount} ` +
        `maxSeen=${maxOf(flat)}`);
      expect(infiniteCount).assertEqual(EXPECTED_DROPS_NONE);
      expect(flat.length).assertEqual(SAMPLE_200 * EXPECTED_KEY_COUNT);
      expect(maxOf(flat) < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_8900
     * @tc.name      testStatSample0089
     * @tc.desc      Check the byte and count keys are integral while the time key is simply finite and non negative
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const snap: GcSnapshot = new GcSnapshot();
      const integral: boolean = Number.isInteger(snap.count) && Number.isInteger(snap.allocated) &&
        Number.isInteger(snap.freed) && Number.isInteger(snap.longFullGc);
      const timeFinite: boolean = Number.isFinite(snap.time) && snap.time >= 0;
      logCase('testStatSample0089', `count=${snap.count} allocated=${snap.allocated} freed=${snap.freed} ` +
        `longFull=${snap.longFullGc} time=${snap.time}`);
      expect(integral).assertTrue();
      expect(timeFinite).assertTrue();
      expect(byteDomain(snap.allocated) && byteDomain(snap.freed)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9000
     * @tc.name      testStatSample0090
     * @tc.desc      Sample fifty times with touches and check every allocated byte delta is non negative
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_50, 0);
      const limits: number[] = sampleLimits(series, TOUCH_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const allocDeltas: number[] = deltas(allocated);
      const positive: number[] = allocDeltas.filter((value: number) => value > 0);
      logCase('testStatSample0090', `samples=${series.length} deltas=${allocDeltas.length} ` +
        `trusted=${allocated.length} positive=${positive.length}`);
      expect(allocated.length).assertEqual(SAMPLE_50);
      expect(byteFailures(series, limits).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(positive.length > 0).assertTrue();
      expect(allocDeltas.length).assertEqual(SAMPLE_50 - 1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9100
     * @tc.name      testStatSample0091
     * @tc.desc      Sample fifty times with touches and check unfolded freed bytes stay within the physical ceiling
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_50, 0);
      const limits: number[] = sampleLimits(series, TOUCH_ALLOCATION_LIMIT_BYTES);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      logCase('testStatSample0091', `samples=${series.length} freed=${freed.length} total=${spanOf(freed)}`);
      expect(allocated.length).assertEqual(SAMPLE_50);
      expect(freed.length).assertEqual(SAMPLE_50);
      expect(spanOf(freed) <= series[0].objectKb * KB + spanOf(allocated) + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9200
     * @tc.name      testStatSample0092
     * @tc.desc      Take forty samples under pressure and check every value stays well below the sanity bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = [];
      for (let round = 0; round < SAMPLE_40; round++) {
        if (round % 8 === 0) {
          allocatePressure();
        }
        series.push(new GcSnapshot());
      }
      const flat: number[] = [];
      series.forEach((snap: GcSnapshot) => {
        snap.values().forEach((value: number) => {
          flat.push(value);
        });
      });
      const overBound: number[] = flat.filter((value: number) => value >= LARGE_BOUND);
      logCase('testStatSample0092', `samples=${series.length} values=${flat.length} ` +
        `overBound=${overBound.length} maxSeen=${maxOf(flat)}`);
      expect(overBound.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series.length).assertEqual(SAMPLE_40);
      expect(minOf(flat) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9300
     * @tc.name      testStatSample0093
     * @tc.desc      Read five quiet snapshots and check allocation windows, the freed ceiling and raw count order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(5);
      const allocDelta: number = byteCounterDelta(series[4].allocated, series[0].allocated);
      const freedDelta: number = byteCounterDelta(series[4].freed, series[0].freed);
      const countDelta: number = series[4].count - series[0].count;
      const cap: number = series[0].objectKb * KB + allocDelta + KB;
      logCase('testStatSample0093', `samples=${series.length} allocDelta=${allocDelta} ` +
        `freedDelta=${freedDelta} countDelta=${countDelta}`);
      expect(series[4].bytesInWindow(series[0], QUIET_BUDGET_BYTES)).assertTrue();
      expect(freedDelta <= cap).assertTrue();
      expect(countDelta >= 0).assertTrue();
      expect(snapshotDrops(series, sampleLimits(series, 0)).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9400
     * @tc.name      testStatSample0094
     * @tc.desc      Read the collection count twelve times with no allocation and check the spread across the reads is
     *               small and non negative
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_GC_COUNT));
      }
      const spread: number = maxOf(values) - minOf(values);
      const deltaTotal: number = total(deltas(values));
      logCase('testStatSample0094', `reads=${values.length} min=${minOf(values)} max=${maxOf(values)} ` +
        `spread=${spread} deltaTotal=${deltaTotal}`);
      expect(values.length).assertEqual(REPEAT_READS);
      expect(spread >= 0).assertTrue();
      expect(deltaTotal).assertEqual(spread);
      expect(valueDrops(values).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9500
     * @tc.name      testStatSample0095
     * @tc.desc      Take two back to back snapshots and check the allocated byte delta is negligible and the field
     *               relations still hold
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: GcSnapshot = new GcSnapshot();
      const second: GcSnapshot = new GcSnapshot();
      const allocDelta: number = byteCounterDelta(second.allocated, first.allocated);
      const pair: GcSnapshot[] = [first, second];
      logCase('testStatSample0095', `allocDelta=${allocDelta} budget=${QUIET_BUDGET_BYTES} ` +
        `countDelta=${second.count - first.count}`);
      const freedDelta: number = byteCounterDelta(second.freed, first.freed);
      expect(allocDelta <= QUIET_BUDGET_BYTES).assertTrue();
      expect(snapshotDrops(pair, [STAT_READ_ALLOCATION_LIMIT_BYTES]).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(freedDelta <= first.objectKb * KB + allocDelta + KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9600
     * @tc.name      testStatSample0096
     * @tc.desc      Put one hint between two quiet reads and check the pair is still ordered and the count delta stays
     *               capped
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: GcSnapshot = new GcSnapshot();
      hintGC();
      const second: GcSnapshot = new GcSnapshot();
      const countDelta: number = second.count - first.count;
      logCase('testStatSample0096', `countDelta=${countDelta} cap=${HINT_COUNT_CAP} ` +
        `longFullDelta=${second.longFullGc - first.longFullGc}`);
      expect(second.notBefore(first, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(countDelta >= 0 && countDelta <= HINT_COUNT_CAP).assertTrue();
      expect(second.longFullGc - first.longFullGc >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9700
     * @tc.name      testStatSample0097
     * @tc.desc      Read the freed byte key twenty times with no allocation and check the series is finite, monotonic
     *               and non negative
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const anchor: GcSnapshot = new GcSnapshot();
      const values: number[] = [];
      for (let i = 0; i < SAMPLE_20; i++) {
        values.push(gcStat(KEY_BYTES_FREED));
      }
      const end: GcSnapshot = new GcSnapshot();
      const cap: number = freedCap(anchor, end.allocated);
      const raw: number[] = [anchor.freed].concat(values).concat([end.freed]);
      const unfolded: number[] = unfoldRawBytes(raw, cap, end.count > anchor.countAtStart);
      const spread: number = spanOf(unfolded);
      logCase('testStatSample0097', `reads=${values.length} spread=${spread} cap=${cap}`);
      expect(values.length).assertEqual(SAMPLE_20);
      expect(byteCounterInWindow(end.allocated, anchor.allocated, STAT_READ_ALLOCATION_LIMIT_BYTES)).assertTrue();
      expect(unfolded.length).assertEqual(SAMPLE_20 + 2);
      expect(spread >= 0 && spread <= cap).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9800
     * @tc.name      testStatSample0098
     * @tc.desc      Take a quiet triple of samples and check every per field delta is bounded and never negative
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_4 - 1);
      const limits: number[] = [QUIET_BUDGET_BYTES, QUIET_BUDGET_BYTES];
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const allocDeltas: number[] = deltas(allocated);
      const countDeltas: number[] = deltas(counts(series));
      const freedCapBytes: number = series[0].objectKb * KB + spanOf(allocated) + KB;
      logCase('testStatSample0098', `allocDeltas=${allocDeltas.join(',')} ` +
        `freedDelta=${spanOf(freed)} freedCap=${freedCapBytes} countDeltas=${countDeltas.join(',')}`);
      expect(allocated.length).assertEqual(series.length);
      expect(freed.length).assertEqual(series.length);
      expect(spanOf(freed) <= freedCapBytes).assertTrue();
      expect(countDeltas.every((value: number) => value >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_9900
     * @tc.name      testStatSample0099
     * @tc.desc      Read all five keys on both sides of a thirty millisecond gap and check every key delta is bounded
     *               by the quiet budget
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const anchor: GcSnapshot = new GcSnapshot();
      const first: number[] = keyValues();
      await sleepMs(CADENCE_30);
      const second: number[] = keyValues();
      logCase('testStatSample0099', `first=${first.join(',')} second=${second.join(',')}`);
      expect(rawPairInWindow(anchor, first, second, QUIET_BUDGET_BYTES)).assertTrue();
      expect(rawNonByteOrdered(first, second)).assertTrue();
      expect(allFiniteNonNegative(second)).assertTrue();
      expect(second.length).assertEqual(EXPECTED_KEY_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_10000
     * @tc.name      testStatSample0100
     * @tc.desc      Touch memory once and then read five snapshots and check the deltas stay ordered and bounded by
     *               the quiet budget
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const touched: number = touchSmall(99);
      const series: GcSnapshot[] = sampleQuiet(5);
      const allocDelta: number = byteCounterDelta(series[4].allocated, series[0].allocated);
      const drops: number[] = snapshotDrops(series, sampleLimits(series, 0));
      logCase('testStatSample0100', `samples=${series.length} allocDelta=${allocDelta} ` +
        `drops=${drops.length} countDelta=${series[4].count - series[0].count}`);
      expect(touched).assertEqual(touchResult(99));
      expect(byteCounterInWindow(series[4].allocated, series[0].allocated, QUIET_BUDGET_BYTES)).assertTrue();
      expect(allocDelta <= QUIET_BUDGET_BYTES).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_10100
     * @tc.name      testStatSample0101
     * @tc.desc      Run the quietest matrix row and check the resulting pair of samples carries no negative delta
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(QUIET_STEPS[0]);
      const limits: number[] = stepLimits(QUIET_STEPS[0]);
      const last: GcSnapshot = series[series.length - 1];
      const allocDelta: number = byteCounterDelta(last.allocated, series[0].allocated);
      logCase('testStatSample0101', `steps=${QUIET_STEPS[0].length} samples=${series.length} ` +
        `allocDelta=${allocDelta}`);
      expect(series.length).assertEqual(QUIET_STEPS[0].length + 1);
      expect(last.notBefore(series[0], total(limits))).assertTrue();
      expect(byteDomain(last.allocated) && byteDomain(last.freed)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_10200
     * @tc.name      testStatSample0102
     * @tc.desc      Read a snapshot on both sides of a twenty millisecond wait and check the deltas stay tiny and the
     *               relations hold
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      await sleepMs(CADENCE_20);
      const after: GcSnapshot = new GcSnapshot();
      const allocDelta: number = byteCounterDelta(after.allocated, before.allocated);
      const timeDelta: number = after.time - before.time;
      logCase('testStatSample0102', `allocDelta=${allocDelta} timeDelta=${timeDelta} ` +
        `freedDelta=${byteCounterDelta(after.freed, before.freed)}`);
      const freedDelta: number = byteCounterDelta(after.freed, before.freed);
      expect(after.bytesInWindow(before, QUIET_BUDGET_BYTES) && allocDelta <= QUIET_BUDGET_BYTES).assertTrue();
      expect(freedDelta <= before.objectKb * KB + allocDelta + KB).assertTrue();
      expect(timeDelta >= 0).assertTrue();
      expect(after.longFullGc <= after.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_10300
     * @tc.name      testStatSample0103
     * @tc.desc      Read the count and long full keys ten times as a pair and check the difference never changes sign
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const countsSeen: number[] = [];
      const longSeen: number[] = [];
      for (let i = 0; i < 10; i++) {
        countsSeen.push(gcStat(KEY_GC_COUNT));
        longSeen.push(gcStat(KEY_FULL_GC_LONG));
      }
      const negativeGaps: number[] = countsSeen
        .map((value: number, index: number) => value - longSeen[index])
        .filter((gap: number) => gap < 0);
      logCase('testStatSample0103', `reads=${countsSeen.length} count=${countsSeen[9]} ` +
        `longFull=${longSeen[9]} negativeGaps=${negativeGaps.length}`);
      expect(negativeGaps.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(valueDrops(countsSeen).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(valueDrops(longSeen).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_10400
     * @tc.name      testStatSample0104
     * @tc.desc      Read allocated and freed keys ten times and unfold both through independently bounded windows
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const anchor: GcSnapshot = new GcSnapshot();
      const allocatedSeen: number[] = [];
      const freedSeen: number[] = [];
      for (let i = 0; i < 10; i++) {
        allocatedSeen.push(gcStat(KEY_BYTES_ALLOCATED));
        freedSeen.push(gcStat(KEY_BYTES_FREED));
      }
      const end: GcSnapshot = new GcSnapshot();
      const rawAllocated: number[] = [anchor.allocated].concat(allocatedSeen).concat([end.allocated]);
      const rawFreed: number[] = [anchor.freed].concat(freedSeen).concat([end.freed]);
      const allocated: number[] = unfoldRawBytes(rawAllocated, STAT_READ_ALLOCATION_LIMIT_BYTES, true);
      const allocTrusted: boolean = byteCounterInWindow(end.allocated, anchor.allocated,
        STAT_READ_ALLOCATION_LIMIT_BYTES);
      const cap: number = allocTrusted ? freedCap(anchor, end.allocated) : 0;
      const freed: number[] = unfoldRawBytes(rawFreed, cap, end.count > anchor.countAtStart);
      logCase('testStatSample0104', `reads=${allocatedSeen.length} allocDelta=${spanOf(allocated)} ` +
        `freedDelta=${spanOf(freed)}`);
      expect(allocatedSeen.length).assertEqual(10);
      expect(allocTrusted && allocated.length === 12).assertTrue();
      expect(freed.length).assertEqual(12);
      expect(byteDomain(allocatedSeen[0]) && byteDomain(freedSeen[0])).assertTrue();
      expect(spanOf(freed) <= cap).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_10500
     * @tc.name      testStatSample0105
     * @tc.desc      Combine one hundred quiet samples and audit count, trusted byte windows, finiteness and freed cap
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_100);
      const last: GcSnapshot = series[SAMPLE_100 - 1];
      const limits: number[] = sampleLimits(series, 0);
      const allocated: number[] = allocatedSeries(series, limits);
      const freed: number[] = freedSeries(series, limits);
      const drops: number[] = snapshotDrops(series, limits);
      const finite: boolean = series.every((snap: GcSnapshot) => allFiniteNonNegative(snap.values()));
      logCase('testStatSample0105', `samples=${series.length} drops=${drops.length} finite=${finite} ` +
        `allocDelta=${spanOf(allocated)} freedDelta=${spanOf(freed)}`);
      expect(series.length).assertEqual(SAMPLE_100);
      expect(allocated.length === SAMPLE_100 && freed.length === SAMPLE_100).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(finite).assertTrue();
      expect(spanOf(freed) <= series[0].objectKb * KB + spanOf(allocated) + KB).assertTrue();
      expect(last.longFullGc <= last.count).assertTrue();
    });
  });
}

