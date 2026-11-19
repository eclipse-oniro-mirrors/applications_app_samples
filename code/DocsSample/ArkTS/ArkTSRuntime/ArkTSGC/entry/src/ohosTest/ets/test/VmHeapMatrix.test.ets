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
import { hidebug } from '@kit.PerformanceAnalysisKit';
import {
  allocatePressure,
  allCleared,
  byteCounterDelta,
  collectUntil,
  gcStat,
  GcSnapshot,
  HeapSnapshot,
  hintGC,
  KB,
  KEY_BYTES_ALLOCATED,
  KEY_BYTES_FREED,
  KEY_FULL_GC_LONG,
  KEY_GC_COUNT,
  retainArrays,
  RingNode,
  runGcCycles
} from './shared/GcProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const DOUBLE_BYTES: number = 8;
const USED_SLACK_KB: number = 2048;
const TOTAL_SLACK_KB: number = 8192;
const SHARE_TOLERANCE: number = 0.05;

// Keep heapUsed (last live/survived accounting) separate from current VM object bytes.
class VmSample {
  totalKb: number;
  usedKb: number;
  arrayKb: number;
  objectKb: number;

  constructor(totalKb: number, usedKb: number, arrayKb: number, objectKb: number) {
    this.totalKb = totalKb;
    this.usedKb = usedKb;
    this.arrayKb = arrayKb;
    this.objectKb = objectKb;
  }

  static read(): VmSample {
    const info: hidebug.VMMemoryInfo = hidebug.getAppVMMemoryInfo();
    return new VmSample(Number(info.totalHeap), Number(info.heapUsed), Number(info.allArraySize),
      Number(hidebug.getAppVMObjectUsedSize()));
  }

  static fromHeap(heap: HeapSnapshot): VmSample {
    return new VmSample(heap.totalKb, heap.usedKb, heap.arrayKb, heap.objectKb);
  }

  headroomKb(): number {
    return this.totalKb - this.usedKb;
  }

  usedRatio(): number {
    return this.totalKb > 0 ? this.usedKb / this.totalKb : 0;
  }

  arrayShare(): number {
    return this.usedKb > 0 ? this.arrayKb / this.usedKb : 0;
  }

  usedBytes(): number {
    return this.usedKb * KB;
  }

  totalBytes(): number {
    return this.totalKb * KB;
  }

  ordered(): boolean {
    return this.usedKb <= this.totalKb;
  }

  sane(): boolean {
    return this.counters().every((value: number) => Number.isFinite(value) && value >= 0);
  }

  counters(): number[] {
    return [this.totalKb, this.usedKb, this.arrayKb];
  }

  detail(): string {
    return 'totalKb=' + this.totalKb + ' usedKb=' + this.usedKb + ' arrayKb=' + this.arrayKb +
      ' objectKb=' + this.objectKb;
  }
}

// Difference between two runtime stat readings, used as an independent oracle for the heap sample
class StatPair {
  before: GcSnapshot;
  after: GcSnapshot;

  constructor(before: GcSnapshot, after: GcSnapshot) {
    this.before = before;
    this.after = after;
  }

  allocatedDelta(): number {
    return byteCounterDelta(this.after.allocated, this.before.allocated);
  }

  freedDelta(): number {
    return byteCounterDelta(this.after.freed, this.before.freed);
  }

  countDelta(): number {
    return this.after.count - this.before.count;
  }

  longFullDelta(): number {
    return this.after.longFullGc - this.before.longFullGc;
  }

  netBytes(): number {
    return this.allocatedDelta() - this.freedDelta();
  }

  monotonous(): boolean {
    return this.after.notBefore(this.before);
  }

  detail(): string {
    return 'allocatedDelta=' + this.allocatedDelta() + ' freedDelta=' + this.freedDelta() +
      ' countDelta=' + this.countDelta() + ' longFullDelta=' + this.longFullDelta();
  }
}

// Two heap samples with the deltas that a growth or release case cares about
class HeapWindow {
  before: VmSample;
  after: VmSample;

  constructor(before: VmSample, after: VmSample) {
    this.before = before;
    this.after = after;
  }

  usedDeltaKb(): number {
    return this.after.usedKb - this.before.usedKb;
  }

  arrayDeltaKb(): number {
    return this.after.arrayKb - this.before.arrayKb;
  }

  totalDeltaKb(): number {
    return this.after.totalKb - this.before.totalKb;
  }

  gauge(): string {
    return 'usedKb ' + this.before.usedKb + '->' + this.after.usedKb + ' totalKb ' +
      this.before.totalKb + '->' + this.after.totalKb;
  }
}

function payloadBytes(count: number, length: number): number {
  return count * length * DOUBLE_BYTES;
}

function payloadKb(count: number, length: number): number {
  return payloadBytes(count, length) / KB;
}

function within(value: number, low: number, high: number): boolean {
  return value >= low && value <= high;
}

function ratioOf(part: number, whole: number): number {
  return whole > 0 ? part / whole : 0;
}

function kbFromBytes(bytes: number): number {
  return bytes / KB;
}

function minOf(values: number[]): number {
  let result: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] < result) {
      result = values[i];
    }
  }
  return result;
}

function maxOf(values: number[]): number {
  let result: number = values[0];
  for (let i = 1; i < values.length; i++) {
    if (values[i] > result) {
      result = values[i];
    }
  }
  return result;
}

function sumOf(values: number[]): number {
  let total: number = 0;
  for (let i = 0; i < values.length; i++) {
    total += values[i];
  }
  return total;
}

function spreadOf(values: number[]): number {
  return maxOf(values) - minOf(values);
}

function avgOf(values: number[]): number {
  return values.length > 0 ? sumOf(values) / values.length : 0;
}

function allOrdered(samples: VmSample[]): boolean {
  return samples.every((item: VmSample) => item.ordered());
}

function allSane(samples: VmSample[]): boolean {
  return samples.every((item: VmSample) => item.sane());
}

function shapeHolds(kept: number[][], length: number): boolean {
  return kept.every((values: number[]) => values.length === length);
}

// Groups returned by retainArrays repeat fill values from zero; verify both ends of every live array.
function payloadHolds(kept: number[][], count: number, length: number, groupSize: number): boolean {
  return kept.length === count && kept.every((values: number[], index: number) =>
    values.length === length && values[0] === index % groupSize && values[length - 1] === index % groupSize);
}

// Do not deref in the async owner frame: only WeakRefs escape this synchronous helper.
function payloadRefs(kept: number[][]): WeakRef<number[]>[] {
  return [new WeakRef<number[]>(kept[0]), new WeakRef<number[]>(kept[kept.length - 1])];
}

// Current object accounting needs no best-of net heap selection; preserve the paced observation window.
async function objectSampleAfterTurns(rounds: number): Promise<VmSample> {
  for (let i = 0; i < rounds; i++) {
    await paceTurn();
  }
  return VmSample.read();
}

// empties the outer holder and reports how many payload arrays were dropped
function releaseAll(kept: number[][]): number {
  const dropped: number = kept.length;
  kept.length = 0;
  return dropped;
}

// tiny allocation nudge so hintGC has young garbage to collect without adding megabytes
function nudgePressure(): number {
  let sink: number = 0;
  for (let i = 0; i < 200; i++) {
    const junk: number[] = new Array<number>(8).fill(i);
    sink += junk[7];
  }
  return sink;
}

// drop leftover garbage from earlier cases and pressure batches so band checks start quiet
async function settleHeap(rounds: number): Promise<void> {
  for (let i = 0; i < rounds; i++) {
    hintGC();
    nudgePressure();
    await sleepMs(30);
  }
}

// run at least minCycles collections and then settle, so readings reflect released memory
async function collectSettled(minCycles: number, maxRounds: number): Promise<number> {
  const cycles: number = await runGcCycles(minCycles, maxRounds);
  await settleHeap(4);
  return cycles;
}

// sample a few paced turns and report the highest used reading, so slow accounting still shows growth
async function peakUsedSample(rounds: number): Promise<VmSample> {
  let best: VmSample = VmSample.read();
  for (let i = 0; i < rounds; i++) {
    await paceTurn();
    const now: VmSample = VmSample.read();
    if (now.usedKb > best.usedKb) {
      best = now;
    }
  }
  return best;
}

function usedList(samples: VmSample[]): number[] {
  return samples.map((item: VmSample) => item.usedKb);
}

export default function vmHeapMatrixTest() {
  describe('VmHeapMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0100
     * @tc.name      testVmHeapBaseline0001
     * @tc.desc      Read the VM heap once and check the total and used heap are positive, used stays at or below
     *               total and the used ratio sits inside the unit interval
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testVmHeapBaseline0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sample: VmSample = VmSample.read();
      const ratio: number = sample.usedRatio();
      logCase('testVmHeapBaseline0001', sample.detail() + ' ratio=' + ratio);
      expect(sample.totalKb > 0).assertTrue();
      expect(sample.usedKb > 0).assertTrue();
      expect(sample.usedKb <= sample.totalKb).assertTrue();
      expect(sample.arrayKb >= 0).assertTrue();
      expect(ratio > 0 && ratio <= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0200
     * @tc.name      testVmHeapBaseline0002
     * @tc.desc      Take two heap readings one paced turn apart with no allocation in between and check the used
     *               and total drift stays inside the sampling slack
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testVmHeapBaseline0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const first: HeapSnapshot = new HeapSnapshot();
      await paceTurn();
      const second: HeapSnapshot = new HeapSnapshot();
      const usedDrift: number = Math.abs(second.usedKb - first.usedKb);
      const totalDrift: number = Math.abs(second.totalKb - first.totalKb);
      logCase('testVmHeapBaseline0002', 'usedDriftKb=' + usedDrift + ' totalDriftKb=' + totalDrift +
        ' usedKb=' + first.usedKb + '/' + second.usedKb);
      expect(usedDrift <= 2 * USED_SLACK_KB).assertTrue();
      expect(totalDrift <= TOTAL_SLACK_KB).assertTrue();
      expect(second.usedKb <= second.totalKb && first.usedKb <= first.totalKb).assertTrue();
      expect(second.arrayKb >= 0 && first.arrayKb >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0300
     * @tc.name      testVmHeapBaseline0003
     * @tc.desc      Compare a direct heap sample with one bridged through a snapshot object and check both views
     *               stay sane, ordered and inside the unit interval
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testVmHeapBaseline0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const direct: VmSample = VmSample.read();
      await paceTurn();
      const bridged: VmSample = VmSample.fromHeap(new HeapSnapshot());
      const widened: VmSample[] = [direct, bridged];
      logCase('testVmHeapBaseline0003', 'directUsedKb=' + direct.usedKb + ' bridgedUsedKb=' + bridged.usedKb +
        ' bridgedArrayKb=' + bridged.arrayKb);
      expect(direct.counters().length).assertEqual(3);
      expect(allSane(widened)).assertTrue();
      expect(allOrdered(widened)).assertTrue();
      expect(within(direct.usedRatio(), 0, 1) && within(bridged.usedRatio(), 0, 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0400
     * @tc.name      testVmHeapBaseline0004
     * @tc.desc      Check the free head room reported by the heap sample equals total minus used and stays
     *               non negative but smaller than total
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testVmHeapBaseline0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sample: VmSample = VmSample.read();
      const expectedHeadroom: number = sample.totalKb - sample.usedKb;
      const reportedHeadroom: number = sample.headroomKb();
      logCase('testVmHeapBaseline0004', 'reportedHeadroomKb=' + reportedHeadroom + ' expectedHeadroomKb=' +
        expectedHeadroom + ' ' + sample.detail());
      expect(reportedHeadroom).assertEqual(expectedHeadroom);
      expect(reportedHeadroom >= 0).assertTrue();
      expect(reportedHeadroom < sample.totalKb).assertTrue();
      expect(sample.usedKb + reportedHeadroom).assertEqual(sample.totalKb);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0500
     * @tc.name      testVmHeapBaseline0005
     * @tc.desc      Verify the three heap counters arrive as integral kilobyte values with a positive total and
     *               an array size that never exceeds the reserved heap
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testVmHeapBaseline0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const sample: VmSample = VmSample.read();
      const integral: number = sample.counters().filter((value: number) => Number.isInteger(value)).length;
      logCase('testVmHeapBaseline0005', 'integralCounters=' + integral + ' ' + sample.detail());
      expect(integral).assertEqual(3);
      expect(sample.totalKb > 0).assertTrue();
      expect(sample.usedKb > 0).assertTrue();
      expect(sample.arrayKb <= sample.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0600
     * @tc.name      testVmHeapBaseline0006
     * @tc.desc      Cross check the array share of used heap against the array share of total heap and confirm
     *               both derivations agree within the share tolerance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sample: VmSample = VmSample.read();
      const shareOfUsed: number = sample.arrayShare();
      const shareOfTotal: number = ratioOf(sample.arrayKb, sample.totalKb);
      const product: number = sample.usedRatio() * shareOfUsed;
      logCase('testVmHeapBaseline0006', 'shareOfUsed=' + shareOfUsed + ' shareOfTotal=' + shareOfTotal +
        ' product=' + product);
      expect(within(shareOfUsed, 0, 1)).assertTrue();
      expect(Math.abs(product - shareOfTotal) <= SHARE_TOLERANCE).assertTrue();
      expect(sample.arrayKb <= sample.totalKb).assertTrue();
      expect(shareOfUsed >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0700
     * @tc.name      testVmHeapBaseline0007
     * @tc.desc      Keep two short number arrays and check the heap sample afterwards still reports ordered
     *               counters and a used heap that did not fall below the earlier reading by more than slack
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const base: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(2, 8);
      await paceTurn();
      const grown: VmSample = VmSample.read();
      const usedShift: number = grown.usedKb - base.usedKb;
      logCase('testVmHeapBaseline0007', 'usedShiftKb=' + usedShift + ' keptLength=' + kept.length +
        ' ' + grown.detail());
      expect(shapeHolds(kept, 8)).assertTrue();
      expect(usedShift >= -USED_SLACK_KB).assertTrue();
      expect(grown.ordered()).assertTrue();
      expect(grown.sane() && base.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0800
     * @tc.name      testVmHeapBaseline0008
     * @tc.desc      Keep three short arrays, drop every reference and ask for a collection, then check the used
     *               heap settles at or below the pre-release peak
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const base: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(3, 16);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      const dropped: number = releaseAll(kept);
      hintGC();
      await paceTurn();
      const settled: VmSample = VmSample.read();
      logCase('testVmHeapBaseline0008', 'dropped=' + dropped + ' peakUsedKb=' + peak.usedKb +
        ' settledUsedKb=' + settled.usedKb + ' baseTotalKb=' + base.totalKb);
      expect(dropped).assertEqual(3);
      expect(settled.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
      expect(settled.ordered()).assertTrue();
      expect(settled.totalKb + TOTAL_SLACK_KB >= base.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_0900
     * @tc.name      testVmHeapBaseline0009
     * @tc.desc      Ask for a collection hint and check the GC counter never regresses while the heap sample
     *               afterwards stays sane, ordered and inside the unit interval
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const countBefore: number = gcStat(KEY_GC_COUNT);
      hintGC();
      await paceTurn();
      const sample: VmSample = VmSample.read();
      const countAfter: number = gcStat(KEY_GC_COUNT);
      const gcDelta: number = countAfter - countBefore;
      logCase('testVmHeapBaseline0009', 'gcCount ' + countBefore + '->' + countAfter + ' gcDelta=' + gcDelta +
        ' ' + sample.detail());
      expect(countAfter >= countBefore).assertTrue();
      expect(sample.sane()).assertTrue();
      expect(sample.ordered()).assertTrue();
      expect(within(sample.usedRatio(), 0, 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1000
     * @tc.name      testVmHeapBaseline0010
     * @tc.desc      Take three paced heap readings and check the reserved heap totals stay positive and close to
     *               each other while every reading keeps used below total
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const reads: VmSample[] = [];
      for (let turn = 0; turn < 3; turn++) {
        reads.push(VmSample.read());
        await paceTurn();
      }
      const totals: number[] = reads.map((item: VmSample) => item.totalKb);
      const totalSpread: number = spreadOf(totals);
      logCase('testVmHeapBaseline0010', 'totalsKb=' + totals.join('/') + ' totalSpreadKb=' + totalSpread +
        ' usedKb=' + usedList(reads).join('/'));
      expect(reads.length).assertEqual(3);
      expect(allOrdered(reads)).assertTrue();
      expect(totalSpread <= TOTAL_SLACK_KB).assertTrue();
      expect(minOf(totals) > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1100
     * @tc.name      testVmHeapBaseline0011
     * @tc.desc      Convert the kilobyte counters of the heap sample back into bytes and check the conversion is
     *               reversible while the byte totals keep the same ordering
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sample: VmSample = VmSample.read();
      const usedBytes: number = sample.usedBytes();
      const totalBytes: number = sample.totalBytes();
      logCase('testVmHeapBaseline0011', 'usedBytes=' + usedBytes + ' totalBytes=' + totalBytes +
        ' ratio=' + ratioOf(usedBytes, totalBytes));
      expect(usedBytes / KB).assertEqual(sample.usedKb);
      expect(totalBytes / KB).assertEqual(sample.totalKb);
      expect(usedBytes <= totalBytes).assertTrue();
      expect(totalBytes > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1200
     * @tc.name      testVmHeapBaseline0012
     * @tc.desc      Throw away a pressure batch of short lived nodes and check the GC counter did not regress and
     *               the heap sample stays ordered afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapBaseline0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const countBefore: number = gcStat(KEY_GC_COUNT);
      const sink: number = allocatePressure();
      await paceTurn();
      const sample: VmSample = VmSample.read();
      const countAfter: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapBaseline0012', 'sink=' + sink + ' gcDelta=' + (countAfter - countBefore) +
        ' ' + sample.detail());
      expect(sink > 0).assertTrue();
      expect(countAfter >= countBefore).assertTrue();
      expect(sample.ordered()).assertTrue();
      expect(sample.usedRatio() > 0 && sample.usedRatio() <= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1300
     * @tc.name      testVmHeapBaseline0013
     * @tc.desc      Keep sixteen arrays of four thousand ninety six elements and check the reported array size
     *               does not fall behind the earlier reading
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapBaseline0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(16, 4096);
      await paceTurn();
      const after: VmSample = VmSample.read();
      const arrayShift: number = after.arrayKb - before.arrayKb;
      logCase('testVmHeapBaseline0013', 'keptCount=' + kept.length + ' arrayShiftKb=' + arrayShift +
        ' beforeArrayKb=' + before.arrayKb + ' afterArrayKb=' + after.arrayKb);
      expect(kept.length).assertEqual(16);
      expect(shapeHolds(kept, 4096)).assertTrue();
      expect(arrayShift >= -USED_SLACK_KB).assertTrue();
      expect(after.arrayKb >= 0).assertTrue();
      expect(after.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1400
     * @tc.name      testVmHeapBaseline0014
     * @tc.desc      Run at least one collection cycle and check the heap reading afterwards does not exceed the
     *               earlier reading by more than slack, remains sane and stays ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapBaseline0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: VmSample = VmSample.read();
      const cycles: number = await runGcCycles(1, 20);
      const after: VmSample = VmSample.read();
      logCase('testVmHeapBaseline0014', 'cycles=' + cycles + ' beforeUsedKb=' + before.usedKb +
        ' afterUsedKb=' + after.usedKb + ' afterTotalKb=' + after.totalKb);
      expect(cycles >= 1).assertTrue();
      expect(after.usedKb <= before.usedKb + USED_SLACK_KB).assertTrue();
      expect(after.ordered()).assertTrue();
      expect(after.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1500
     * @tc.name      testVmHeapRetainGrow0001
     * @tc.desc      Collect leftovers, keep four arrays of two hundred sixty two thousand one hundred forty four
     *               elements and check the used heap grows by at least half of the expected eight megabytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collectSettled(1, 20);
      const base: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(4, 262144);
      const loaded: VmSample = await peakUsedSample(6);
      const expectedKb: number = payloadKb(4, 262144);
      const grownKb: number = loaded.usedKb - base.usedKb;
      logCase('testVmHeapRetainGrow0001', 'expectedKb=' + expectedKb + ' grownKb=' + grownKb +
        ' loadedTotalKb=' + loaded.totalKb);
      expect(kept.length).assertEqual(4);
      expect(kept[3].length).assertEqual(262144);
      expect(grownKb >= expectedKb / 2).assertTrue();
      expect(loaded.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1600
     * @tc.name      testVmHeapRetainGrow0002
     * @tc.desc      Keep eight arrays of one hundred thirty one thousand seventy two elements and check the
     *               allocated byte counter covers the payload while the used heap grows by at least half
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const statBefore: GcSnapshot = new GcSnapshot();
      const vmBefore: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(8, 131072);
      await paceTurn();
      const statAfter: GcSnapshot = new GcSnapshot();
      const vmAfter: VmSample = VmSample.read();
      const pair: StatPair = new StatPair(statBefore, statAfter);
      const expectedBytes: number = payloadBytes(8, 131072);
      logCase('testVmHeapRetainGrow0002', pair.detail() + ' expectedBytes=' + expectedBytes +
        ' keptCount=' + kept.length);
      expect(pair.allocatedDelta() >= expectedBytes).assertTrue();
      expect(vmAfter.usedKb - vmBefore.usedKb >= expectedBytes / KB / 2).assertTrue();
      expect(vmAfter.ordered()).assertTrue();
      expect(shapeHolds(kept, 131072)).assertTrue();
    });

