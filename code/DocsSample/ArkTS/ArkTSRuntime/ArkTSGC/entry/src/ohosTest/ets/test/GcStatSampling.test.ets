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
  gcStat,
  GcSnapshot,
  GC_STAT_KEYS,
  hintGC,
  KEY_BYTES_ALLOCATED,
  KEY_BYTES_FREED,
  KEY_FULL_GC_LONG,
  KEY_GC_COUNT,
  KEY_GC_TIME,
  retainArrays,
  runGcCycles
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

function snapshotDrops(series: GcSnapshot[]): number[] {
  const drops: number[] = [];
  for (let i = 1; i < series.length; i++) {
    if (!series[i].notBefore(series[i - 1])) {
      drops.push(i);
    }
  }
  return drops;
}

function counts(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.count);
}

function times(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.time);
}

function allocatedSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.allocated);
}

function freedSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.freed);
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

async function runStep(step: SampleStep): Promise<number> {
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
      sink += kept.length;
    } else if (step.op === OP_COLLECT) {
      const cycles: number = await runGcCycles(1, GC_ROUNDS_BUDGET);
      sink += cycles;
    }
  }
  if (step.waitMs > 0) {
    await sleepMs(step.waitMs);
  }
  return sink;
}

async function runSteps(steps: SampleStep[]): Promise<GcSnapshot[]> {
  const series: GcSnapshot[] = [new GcSnapshot()];
  for (let i = 0; i < steps.length; i++) {
    await runStep(steps[i]);
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
     * @tc.desc      Read the allocated byte key on its own and check it is a positive integer below the sanity bound
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const before: number = gcStat(KEY_BYTES_ALLOCATED);
      touchSmall(1);
      const after: number = gcStat(KEY_BYTES_ALLOCATED);
      const delta: number = after - before;
      logCase('testStatSample0003', `before=${before} after=${after} delta=${delta}`);
      expect(before > 0).assertTrue();
      expect(delta >= 0).assertTrue();
      expect(Number.isInteger(before) && Number.isInteger(after)).assertTrue();
      expect(after < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0400
     * @tc.name      testStatSample0004
     * @tc.desc      Read the freed byte key on its own and check it stays below the allocated byte key
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const freed: number = gcStat(KEY_BYTES_FREED);
      const allocated: number = gcStat(KEY_BYTES_ALLOCATED);
      const held: number = allocated - freed;
      logCase('testStatSample0004', `freed=${freed} allocated=${allocated} held=${held}`);
      expect(isFiniteNonNegative(freed)).assertTrue();
      expect(freed <= allocated).assertTrue();
      expect(held > 0).assertTrue();
      expect(Number.isInteger(freed)).assertTrue();
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
     * @tc.desc      Build one snapshot and compare it field by field with five fresh single key reads taken right
     *               after it
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const snap: GcSnapshot = new GcSnapshot();
      const base: number[] = snap.values();
      const fresh: number[] = keyValues();
      const ordered: boolean = fresh.every((value: number, index: number) => value >= base[index]);
      logCase('testStatSample0008', `base=${base.join(',')} fresh=${fresh.join(',')} ordered=${ordered}`);
      expect(fresh.length).assertEqual(base.length);
      expect(ordered).assertTrue();
      expect(allFiniteNonNegative(fresh)).assertTrue();
      expect(snapshotDrops([snap, new GcSnapshot()]).length).assertEqual(EXPECTED_DROPS_NONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_0900
     * @tc.name      testStatSample0009
     * @tc.desc      Check the internal relations of one snapshot: freed below allocated, long full below count and a
     *               positive allocated total
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const snap: GcSnapshot = new GcSnapshot();
      const held: number = snap.allocated - snap.freed;
      logCase('testStatSample0009', `count=${snap.count} allocated=${snap.allocated} freed=${snap.freed} ` +
        `held=${held} longFull=${snap.longFullGc}`);
      expect(snap.freed <= snap.allocated).assertTrue();
      expect(snap.longFullGc <= snap.count).assertTrue();
      expect(held > 0).assertTrue();
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
     * @tc.desc      Read the allocated byte key twelve times in a row and check the series is monotonic with a
     *               positive start
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_BYTES_ALLOCATED));
      }
      const drops: number[] = valueDrops(values);
      const stepTotal: number = total(deltas(values));
      logCase('testStatSample0013', `reads=${values.length} drops=${drops.join(',')} totalDelta=${stepTotal}`);
      expect(values.length).assertEqual(REPEAT_READS);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(values[0] > 0).assertTrue();
      expect(stepTotal >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1400
     * @tc.name      testStatSample0014
     * @tc.desc      Read the freed byte key twelve times in a row and check monotonicity and the allocated bound
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: number[] = [];
      for (let i = 0; i < REPEAT_READS; i++) {
        values.push(gcStat(KEY_BYTES_FREED));
      }
      const allocated: number = gcStat(KEY_BYTES_ALLOCATED);
      const drops: number[] = valueDrops(values);
      logCase('testStatSample0014', `reads=${values.length} drops=${drops.join(',')} allocated=${allocated} ` +
        `lastFreed=${values[values.length - 1]}`);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(values[values.length - 1] <= allocated).assertTrue();
      expect(allFiniteNonNegative(values)).assertTrue();
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
     * @tc.desc      Take one hintGC between two samples and check the count delta is small and every field is ordered
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const before: GcSnapshot = new GcSnapshot();
      hintGC();
      const after: GcSnapshot = new GcSnapshot();
      const delta: number = after.count - before.count;
      logCase('testStatSample0016', `countDelta=${delta} beforeCount=${before.count} afterCount=${after.count}`);
      expect(after.notBefore(before)).assertTrue();
      expect(delta >= 0).assertTrue();
      expect(delta <= HINT_COUNT_CAP).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1700
     * @tc.name      testStatSample0017
     * @tc.desc      Run the second hint burst row and check the allocated byte delta and the field ordering
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const series: GcSnapshot[] = await runSteps(HINT_STEPS[1]);
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0017', `steps=${HINT_STEPS[1].length} samples=${series.length} ` +
        `allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(HINT_STEPS[1].length + 1);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocDelta >= 0).assertTrue();
      expect(allFiniteNonNegative(series[1].values())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_1800
     * @tc.name      testStatSample0018
     * @tc.desc      Run the third hint burst row and check the freed byte delta never runs ahead of the allocated
     *               delta
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(HINT_STEPS[2]);
      const freedDelta: number = series[1].freed - series[0].freed;
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0018', `freedDelta=${freedDelta} allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(freedDelta >= 0).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
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
      const longDelta: number = series[1].longFullGc - series[0].longFullGc;
      const drops: number[] = snapshotDrops(series);
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
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const countDelta: number = series[1].count - series[0].count;
      logCase('testStatSample0021', `allocDelta=${allocDelta} lowerBound=${PRESSURE_MIN_BYTES} ` +
        `countDelta=${countDelta}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES).assertTrue();
      expect(countDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0])).assertTrue();
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
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const freedDelta: number = series[1].freed - series[0].freed;
      logCase('testStatSample0022', `allocDelta=${allocDelta} freedDelta=${freedDelta} ` +
        `expectedAtLeast=${PRESSURE_MIN_BYTES * 2}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES * 2).assertTrue();
      expect(freedDelta >= 0).assertTrue();
      expect(series[1].allocated - series[1].freed > 0).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_2300
     * @tc.name      testStatSample0023
     * @tc.desc      Apply three pressure bursts and check the sample count, the count delta and the held byte total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(PRESSURE_STEPS[4]);
      const countDelta: number = series[1].count - series[0].count;
      const held: number = series[1].allocated - series[1].freed;
      logCase('testStatSample0023', `countDelta=${countDelta} held=${held} ` +
        `allocated=${series[1].allocated} freed=${series[1].freed}`);
      expect(series.length).assertEqual(PRESSURE_STEPS[4].length + 1);
      expect(countDelta >= 0).assertTrue();
      expect(held > 0).assertTrue();
      expect(snapshotDrops(series).length).assertEqual(EXPECTED_DROPS_NONE);
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
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const timeDelta: number = series[1].time - series[0].time;
      logCase('testStatSample0024', `allocDelta=${allocDelta} timeDelta=${timeDelta} ` +
        `waitMs=${PRESSURE_STEPS[1][0].waitMs}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES).assertTrue();
      expect(timeDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0])).assertTrue();
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
      const freedDelta: number = series[1].freed - series[0].freed;
      const allocDelta: number = series[1].allocated - series[0].allocated;
      logCase('testStatSample0025', `freedDelta=${freedDelta} allocDelta=${allocDelta} ` +
        `longFullDelta=${series[1].longFullGc - series[0].longFullGc}`);
      expect(freedDelta >= 0).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
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
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[3]);
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const held: number = series[1].allocated - series[1].freed;
      logCase('testStatSample0026', `allocDelta=${allocDelta} retainedBytes=${RETAIN_SMALL_BYTES} held=${held}`);
      expect(allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(held >= RETAIN_HALF_BYTES).assertTrue();
      expect(series[1].notBefore(series[0])).assertTrue();
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
      const series: GcSnapshot[] = await runSteps(steps);
      const allocDelta: number = series[1].allocated - series[0].allocated;
      logCase('testStatSample0027', `steps=${steps.length} allocDelta=${allocDelta} ` +
        `oneBlock=${RETAIN_SMALL_BYTES}`);
      expect(allocDelta >= RETAIN_SMALL_BYTES).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
      expect(snapshotDrops(series).length).assertEqual(EXPECTED_DROPS_NONE);
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
      const series: GcSnapshot[] = await runSteps(steps);
      const allocDelta: number = series[2].allocated - series[0].allocated;
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0028', `samples=${series.length} allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(steps.length + 1);
      expect(allocDelta >= RETAIN_HALF_BYTES).assertTrue();
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
      const countDelta: number = series[1].count - series[0].count;
      const allocDelta: number = series[1].allocated - series[0].allocated;
      logCase('testStatSample0029', `waitMs=${WAIT_STEPS[2][0].waitMs} countDelta=${countDelta} ` +
        `allocDelta=${allocDelta}`);
      expect(countDelta >= 0).assertTrue();
      expect(allocDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0])).assertTrue();
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
      const freedDelta: number = series[1].freed - series[0].freed;
      const allocDelta: number = series[1].allocated - series[0].allocated;
      logCase('testStatSample0030', `waitMs=${WAIT_STEPS[4][0].waitMs} freedDelta=${freedDelta} ` +
        `allocDelta=${allocDelta}`);
      expect(freedDelta >= 0).assertTrue();
      expect(allocDelta >= 0).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
      expect(series[0].freed <= series[0].allocated).assertTrue();
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
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[5]);
      const countDelta: number = series[1].count - series[0].count;
      const freedDelta: number = series[1].freed - series[0].freed;
      logCase('testStatSample0032', `countDelta=${countDelta} freedDelta=${freedDelta} ` +
        `allocDelta=${series[1].allocated - series[0].allocated}`);
      expect(countDelta >= 0).assertTrue();
      expect(freedDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0])).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
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
      expect(cycles >= 0).assertTrue();
      expect(countDelta >= cycles).assertTrue();
      expect(after.time >= before.time).assertTrue();
      expect(after.freed >= before.freed).assertTrue();
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
      const allocDelta: number = series[2].allocated - series[0].allocated;
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0034', `samples=${series.length} allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(MIXED_STEPS[0].length + 1);
      expect(allocDelta >= 0).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[2].freed <= series[2].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_3500
     * @tc.name      testStatSample0035
     * @tc.desc      Hint first and then apply eight light touches and check the allocated byte delta is positive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await runSteps(MIXED_STEPS[1]);
      const touchDelta: number = series[1].allocated - series[0].allocated;
      const countDelta: number = series[1].count - series[0].count;
      logCase('testStatSample0035', `touchDelta=${touchDelta} countDelta=${countDelta} ` +
        `held=${series[1].allocated - series[1].freed}`);
      expect(touchDelta >= 0).assertTrue();
      expect(countDelta >= 0).assertTrue();
      expect(series[1].notBefore(series[0])).assertTrue();
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
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const drops: number[] = snapshotDrops(series);
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
      const allocDelta: number = series[2].allocated - series[0].allocated;
      const timeDelta: number = series[2].time - series[0].time;
      logCase('testStatSample0037', `samples=${series.length} allocDelta=${allocDelta} timeDelta=${timeDelta}`);
      expect(series.length).assertEqual(MIXED_STEPS[4].length + 1);
      expect(allocDelta >= 0).assertTrue();
      expect(timeDelta >= 0).assertTrue();
      expect(series[2].notBefore(series[1])).assertTrue();
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
      const allocDelta: number = series[series.length - 1].allocated - series[0].allocated;
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0038', `samples=${series.length} allocDelta=${allocDelta} ` +
        `budget=${QUIET_BUDGET_BYTES} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(QUIET_STEPS[3].length + 1);
      expect(allocDelta >= 0 && allocDelta <= QUIET_BUDGET_BYTES).assertTrue();
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
      const series: GcSnapshot[] = await runSteps(TOUCH_STEPS[5]);
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const countDelta: number = series[1].count - series[0].count;
      logCase('testStatSample0039', `touches=${TOUCH_STEPS[5][0].repeat} allocDelta=${allocDelta} ` +
        `countDelta=${countDelta}`);
      expect(allocDelta > 0).assertTrue();
      expect(countDelta >= 0).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
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
      const series: GcSnapshot[] = await runSteps(steps);
      const drops: number[] = snapshotDrops(series);
      const allocDelta: number = series[series.length - 1].allocated - series[0].allocated;
      logCase('testStatSample0040', `steps=${steps.length} samples=${series.length} ` +
        `allocDelta=${allocDelta} drops=${drops.join(',')}`);
      expect(series.length).assertEqual(steps.length + 1);
      expect(allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[series.length - 1].count >= series[0].count).assertTrue();
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
      const drops: number[] = snapshotDrops(series);
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
      const allocated: number[] = allocatedSeries(series);
      const drops: number[] = valueDrops(allocated);
      logCase('testStatSample0042', `samples=${series.length} drops=${drops.join(',')} ` +
        `firstAllocated=${allocated[0]} lastAllocated=${allocated[SAMPLE_120 - 1]}`);
      expect(series.length).assertEqual(SAMPLE_120);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(minOf(allocated) > 0).assertTrue();
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
      const drops: number[] = snapshotDrops(series);
      const allocDelta: number = series[SAMPLE_50 - 1].allocated - series[0].allocated;
      logCase('testStatSample0044', `samples=${series.length} drops=${drops.length} allocDelta=${allocDelta}`);
      expect(series.length).assertEqual(SAMPLE_50);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocDelta > 0).assertTrue();
      expect(series[SAMPLE_50 - 1].freed <= series[SAMPLE_50 - 1].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_4500
     * @tc.name      testStatSample0045
     * @tc.desc      Sample one hundred times with light touches and check the freed bytes never overtake the
     *               allocated bytes at any sample
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = await sampleWithTouches(SAMPLE_100, 0);
      const drops: number[] = snapshotDrops(series);
      const bounded: boolean = series.every((snap: GcSnapshot) => snap.freed <= snap.allocated);
      logCase('testStatSample0045', `samples=${series.length} drops=${drops.length} bounded=${bounded} ` +
        `held=${series[SAMPLE_100 - 1].allocated - series[SAMPLE_100 - 1].freed}`);
      expect(series.length).assertEqual(SAMPLE_100);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(bounded).assertTrue();
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
      const countDrops: number[] = valueDrops(counts(series));
      const allocDrops: number[] = valueDrops(allocatedSeries(series));
      const freedDrops: number[] = valueDrops(freedSeries(series));
      logCase('testStatSample0046', `samples=${series.length} countDrops=${countDrops.length} ` +
        `allocDrops=${allocDrops.length} freedDrops=${freedDrops.length}`);
      expect(series.length).assertEqual(SAMPLE_150);
      expect(countDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(freedDrops.length).assertEqual(EXPECTED_DROPS_NONE);
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
      const allocDeltas: number[] = deltas(allocatedSeries(series));
      const negative: number[] = allocDeltas.filter((value: number) => value < 0);
      logCase('testStatSample0048', `samples=${series.length} deltas=${allocDeltas.length} ` +
        `negative=${negative.length} totalDelta=${total(allocDeltas)}`);
      expect(series.length).assertEqual(SAMPLE_90);
      expect(negative.length).assertEqual(EXPECTED_DROPS_NONE);
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
      const drops: number[] = valueDrops(counts(series));
      const allocGrowth: number = series[SAMPLE_6 - 1].allocated - series[0].allocated;
      logCase('testStatSample0049', `samples=${series.length} drops=${drops.join(',')} ` +
        `allocGrowth=${allocGrowth}`);
      expect(series.length).assertEqual(SAMPLE_6);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(allocGrowth > 0).assertTrue();
      expect(series[SAMPLE_6 - 1].freed <= series[SAMPLE_6 - 1].allocated).assertTrue();
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
      const freedDrops: number[] = valueDrops(freedSeries(series));
      const timeDrops: number[] = valueDrops(times(series));
      logCase('testStatSample0050', `samples=${series.length} freedDrops=${freedDrops.length} ` +
        `timeDrops=${timeDrops.length}`);
      expect(series.length).assertEqual(SAMPLE_8);
      expect(freedDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(timeDrops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[SAMPLE_8 - 1].freed <= series[SAMPLE_8 - 1].allocated).assertTrue();
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
      expect(stepTotal >= 0).assertTrue();
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
      const allocated: number[] = allocatedSeries(series);
      logCase('testStatSample0053', `samples=${allocated.length} drops=${valueDrops(allocated).length} ` +
        `stepTotal=${total(deltas(allocated))}`);
      expect(allocated.length).assertEqual(SAMPLE_200);
      expect(valueDrops(allocated).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(minOf(allocated) > 0).assertTrue();
      expect(maxOf(allocated) < LARGE_BOUND).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5400
     * @tc.name      testStatSample0054
     * @tc.desc      Look only at the freed bytes across two hundred samples and check the series is monotonic and
     *               stays under the final allocated total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_200);
      const freed: number[] = freedSeries(series);
      const lastAllocated: number = series[SAMPLE_200 - 1].allocated;
      logCase('testStatSample0054', `samples=${freed.length} drops=${valueDrops(freed).length} ` +
        `lastFreed=${freed[SAMPLE_200 - 1]} lastAllocated=${lastAllocated}`);
      expect(freed.length).assertEqual(SAMPLE_200);
      expect(valueDrops(freed).length).assertEqual(EXPECTED_DROPS_NONE);
      expect(freed[SAMPLE_200 - 1] <= lastAllocated).assertTrue();
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
        row.length === RETAIN_SMALL_LENGTH && row[0] === index);
      const drops: number[] = snapshotDrops(series);
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
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0057', `samples=${series.length} cadenceMs=${CADENCE_5} drops=${drops.length} ` +
        `allocDelta=${series[SAMPLE_50 - 1].allocated - series[0].allocated}`);
      expect(series.length).assertEqual(SAMPLE_50);
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(series[SAMPLE_50 - 1].count >= series[0].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_5800
     * @tc.name      testStatSample0058
     * @tc.desc      Take sixty samples on a ten millisecond cadence and check the freed bytes stay bounded by the
     *               allocated bytes throughout
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = await samplePaced(SAMPLE_60, CADENCE_10);
      const bounded: boolean = series.every((snap: GcSnapshot) => snap.freed <= snap.allocated);
      const drops: number[] = snapshotDrops(series);
      logCase('testStatSample0058', `samples=${series.length} cadenceMs=${CADENCE_10} bounded=${bounded} ` +
        `drops=${drops.length}`);
      expect(series.length).assertEqual(SAMPLE_60);
      expect(bounded).assertTrue();
      expect(drops.length).assertEqual(EXPECTED_DROPS_NONE);
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
      const ordered: boolean = snapshotDrops(series).length === EXPECTED_DROPS_NONE;
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
      const countDeltas: number[] = deltas(counts(series));
      const allocDeltas: number[] = deltas(allocatedSeries(series));
      const freedDeltas: number[] = deltas(freedSeries(series));
      const longDeltas: number[] = deltas(longFullSeries(series));
      const negative: number = countDeltas.concat(allocDeltas).concat(freedDeltas).concat(longDeltas)
        .filter((value: number) => value < 0).length;
      logCase('testStatSample0060', `samples=${series.length} deltasPerField=${countDeltas.length} ` +
        `negative=${negative}`);
      expect(countDeltas.length).assertEqual(SAMPLE_200 - 1);
      expect(negative).assertEqual(EXPECTED_DROPS_NONE);
      expect(total(countDeltas) >= 0).assertTrue();
      expect(total(allocDeltas) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6100
     * @tc.name      testStatSample0061
     * @tc.desc      Take twenty quiet samples and check freed bytes stay at or below allocated bytes in every one of
     *               them
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStatSample0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const series: GcSnapshot[] = sampleQuiet(SAMPLE_20);
      const violations: number[] = series
        .filter((snap: GcSnapshot) => snap.freed > snap.allocated)
        .map((snap: GcSnapshot) => snap.freed);
      const ratios: number[] = series.map((snap: GcSnapshot) => percentOf(snap.freed, snap.allocated));
      logCase('testStatSample0061', `samples=${series.length} violations=${violations.length} ` +
        `minRatio=${minOf(ratios)} maxRatio=${maxOf(ratios)}`);
      expect(series.length).assertEqual(SAMPLE_20);
      expect(violations.length).assertEqual(EXPECTED_DROPS_NONE);
      expect(maxOf(ratios) <= PERCENT_FULL).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6200
     * @tc.name      testStatSample0062
     * @tc.desc      Apply two pressure bursts and check the freed bytes still stay below the allocated bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      allocatePressure();
      allocatePressure();
      const snap: GcSnapshot = new GcSnapshot();
      const held: number = snap.allocated - snap.freed;
      logCase('testStatSample0062', `allocated=${snap.allocated} freed=${snap.freed} held=${held} ` +
        `freedShare=${percentOf(snap.freed, snap.allocated)}`);
      expect(snap.freed <= snap.allocated).assertTrue();
      expect(held > 0).assertTrue();
      expect(snap.allocated > PRESSURE_MIN_BYTES).assertTrue();
      expect(percentOf(snap.freed, snap.allocated) <= PERCENT_FULL).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6300
     * @tc.name      testStatSample0063
     * @tc.desc      Keep a retained block alive and check the freed bytes stay below the allocated bytes while the
     *               block is still reachable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const kept: number[][] = retainArrays(RETAIN_SMALL_COUNT, RETAIN_SMALL_LENGTH);
      const snap: GcSnapshot = new GcSnapshot();
      const intact: boolean = kept.every((row: number[], index: number) => row[RETAIN_SMALL_LENGTH - 1] === index);
      logCase('testStatSample0063', `kept=${kept.length} intact=${intact} allocated=${snap.allocated} ` +
        `freed=${snap.freed}`);
      expect(intact).assertTrue();
      expect(snap.freed <= snap.allocated).assertTrue();
      expect(snap.allocated - snap.freed >= RETAIN_HALF_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6400
     * @tc.name      testStatSample0064
     * @tc.desc      Check the held byte total derived from the two byte counters is positive and below the allocated
     *               total at rest
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStatSample0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const snap: GcSnapshot = new GcSnapshot();
      const held: number = snap.allocated - snap.freed;
      const share: number = percentOf(held, snap.allocated);
      logCase('testStatSample0064', `held=${held} allocated=${snap.allocated} share=${share}`);
      expect(held > 0).assertTrue();
      expect(held <= snap.allocated).assertTrue();
      expect(share >= 0 && share <= PERCENT_FULL).assertTrue();
      expect(Number.isInteger(held)).assertTrue();
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
      const allocDelta: number = after.allocated - before.allocated;
      logCase('testStatSample0065', `kept=${kept.length} allocDelta=${allocDelta} ` +
        `retainedBytes=${RETAIN_SMALL_BYTES}`);
      expect(kept.length).assertEqual(RETAIN_SMALL_COUNT);
      expect(allocDelta >= RETAIN_HALF_BYTES).assertTrue();
      expect(after.allocated >= before.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_6600
     * @tc.name      testStatSample0066
     * @tc.desc      Force collection cycles after dropping garbage and check the freed byte counter advanced without
     *               passing the allocated counter
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStatSample0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      await runGcCycles(1, GC_ROUNDS_BUDGET);
      const after: GcSnapshot = new GcSnapshot();
      const freedDelta: number = after.freed - before.freed;
      const allocDelta: number = after.allocated - before.allocated;
      logCase('testStatSample0066', `freedDelta=${freedDelta} allocDelta=${allocDelta} ` +
        `freed=${before.freed}->${after.freed}`);
      expect(freedDelta >= 0).assertTrue();
      expect(allocDelta >= 0).assertTrue();
      expect(before.freed <= before.allocated).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
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
      const allocDelta: number = series[1].allocated - series[0].allocated;
      const share: number = percentOf(allocDelta, series[1].allocated);
      logCase('testStatSample0069', `allocDelta=${allocDelta} bound=${PRESSURE_MIN_BYTES} ` +
        `shareOfTotal=${share}`);
      expect(allocDelta >= PRESSURE_MIN_BYTES * 2).assertTrue();
      expect(share > 0).assertTrue();
      expect(series[1].freed <= series[1].allocated).assertTrue();
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
      const last: GcSnapshot = series[series.length - 1];
      const freedDelta: number = last.freed - series[0].freed;
      const allocDelta: number = last.allocated - series[0].allocated;
      logCase('testStatSample0070', `freedDelta=${freedDelta} allocDelta=${allocDelta} ` +
        `held=${last.allocated - last.freed}`);
      expect(last.freed <= last.allocated).assertTrue();
      expect(freedDelta >= 0).assertTrue();
      expect(last.allocated - last.freed > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_STATSAMPLE_7100
     * @tc.name      testStatSample0071
     * @tc.desc      Retain a block, keep it reachable through two samples and check the held byte total covers half of
     *               the block
