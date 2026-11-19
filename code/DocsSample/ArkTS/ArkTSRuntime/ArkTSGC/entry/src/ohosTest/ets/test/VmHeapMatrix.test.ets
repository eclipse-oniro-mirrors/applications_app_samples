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

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1700
     * @tc.name      testVmHeapRetainGrow0003
     * @tc.desc      Keep two equal stages and verify current object bytes cover all held payload at each stage,
     *               each allocation counter delta covers its batch and every array retains its end values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const bytesBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const firstStage: number[][] = retainArrays(2, 131072);
      await paceTurn();
      const afterFirst: VmSample = VmSample.read();
      const bytesFirst: number = gcStat(KEY_BYTES_ALLOCATED);
      const secondStage: number[][] = retainArrays(2, 131072);
      await paceTurn();
      const afterSecond: VmSample = VmSample.read();
      const bytesSecond: number = gcStat(KEY_BYTES_ALLOCATED);
      const stageKb: number = payloadKb(2, 131072);
      const firstAllocated: number = byteCounterDelta(bytesFirst, bytesBefore);
      const secondAllocated: number = byteCounterDelta(bytesSecond, bytesFirst);
      logCase('testVmHeapRetainGrow0003', 'stageKb=' + stageKb + ' objectKb=' + afterFirst.objectKb + '/' +
        afterSecond.objectKb + ' allocatedBytes=' + firstAllocated + '/' + secondAllocated);
      expect(firstStage.length).assertEqual(2);
      expect(secondStage.length).assertEqual(2);
      expect(afterFirst.objectKb >= stageKb).assertTrue();
      expect(afterSecond.objectKb >= 2 * stageKb).assertTrue();
      expect(firstAllocated >= stageKb * KB && secondAllocated >= stageKb * KB).assertTrue();
      expect(payloadHolds(firstStage, 2, 131072, 2)).assertTrue();
      expect(payloadHolds(secondStage, 2, 131072, 2)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1800
     * @tc.name      testVmHeapRetainGrow0004
     * @tc.desc      Keep a single one million element array and check the used heap absorbs at least half of the
     *               eight megabyte payload without breaking the used ratio bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const window: HeapWindow = new HeapWindow(VmSample.read(), VmSample.read());
      const kept: number[][] = retainArrays(1, 1048576);
      await paceTurn();
      window.after = VmSample.read();
      const payload: number = payloadKb(1, 1048576);
      logCase('testVmHeapRetainGrow0004', 'payloadKb=' + payload + ' deltaKb=' + window.usedDeltaKb() +
        ' arrayDeltaKb=' + window.arrayDeltaKb());
      expect(kept.length).assertEqual(1);
      expect(kept[0].length).assertEqual(1048576);
      expect(window.usedDeltaKb() >= payload / 2).assertTrue();
      expect(window.after.usedKb <= window.after.totalKb).assertTrue();
      expect(within(window.after.usedRatio(), 0, 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_1900
     * @tc.name      testVmHeapRetainGrow0005
     * @tc.desc      Keep sixty four arrays of eight thousand one hundred ninety two elements and check the
     *               allocated counter, the used heap and the element shape all reflect the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await collectSettled(1, 20);
      const gaugeStart: GcSnapshot = new GcSnapshot();
      const heapStart: VmSample = VmSample.read();
      const batch: number[][] = retainArrays(64, 8192);
      const heapStop: VmSample = await peakUsedSample(6);
      const gaugeStop: GcSnapshot = new GcSnapshot();
      const oracle: StatPair = new StatPair(gaugeStart, gaugeStop);
      const expected: number = payloadBytes(64, 8192);
      logCase('testVmHeapRetainGrow0005', 'expectedBytes=' + expected + ' ' + oracle.detail() +
        ' usedDeltaKb=' + (heapStop.usedKb - heapStart.usedKb));
      expect(oracle.allocatedDelta() >= expected).assertTrue();
      expect(batch.length).assertEqual(64);
      expect(shapeHolds(batch, 8192)).assertTrue();
      expect(heapStop.usedKb - heapStart.usedKb >= expected / KB / 2).assertTrue();
      expect(oracle.countDelta() >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2000
     * @tc.name      testVmHeapRetainGrow0006
     * @tc.desc      Grow the kept set through three batches of sixty four thousand elements and check the used
     *               heap never dips between batches and ends at least one payload above the origin
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const seen: VmSample[] = [VmSample.read()];
      let pool: number[][] = retainArrays(2, 65536);
      await paceTurn();
      seen.push(VmSample.read());
      pool = pool.concat(retainArrays(4, 65536));
      await paceTurn();
      seen.push(VmSample.read());
      pool = pool.concat(retainArrays(6, 65536));
      await paceTurn();
      seen.push(VmSample.read());
      const usedTrail: number[] = usedList(seen);
      const stepDown: number[] = [
        usedTrail[1] - usedTrail[0],
        usedTrail[2] - usedTrail[1],
        usedTrail[3] - usedTrail[2]
      ];
      logCase('testVmHeapRetainGrow0006', 'usedTrailKb=' + usedTrail.join('/') + ' poolCount=' + pool.length +
        ' minStepKb=' + minOf(stepDown));
      expect(pool.length).assertEqual(12);
      expect(minOf(stepDown) >= -USED_SLACK_KB).assertTrue();
      expect(usedTrail[3] - usedTrail[0] >= payloadKb(2, 65536)).assertTrue();
      expect(allOrdered(seen)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2100
     * @tc.name      testVmHeapRetainGrow0007
     * @tc.desc      Keep twelve arrays of thirty two thousand seven hundred sixty eight elements and check the
     *               used heap delta covers at least half of the array size delta
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const opening: VmSample = VmSample.read();
      const held: number[][] = retainArrays(12, 32768);
      await paceTurn();
      const closing: VmSample = VmSample.read();
      const usedGain: number = closing.usedKb - opening.usedKb;
      const arrayGain: number = closing.arrayKb - opening.arrayKb;
      logCase('testVmHeapRetainGrow0007', 'usedGainKb=' + usedGain + ' arrayGainKb=' + arrayGain +
        ' payloadKb=' + payloadKb(12, 32768));
      expect(held.length).assertEqual(12);
      expect(usedGain >= payloadKb(12, 32768) / 2).assertTrue();
      expect(usedGain >= arrayGain / 2).assertTrue();
      expect(closing.arrayKb >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2200
     * @tc.name      testVmHeapRetainGrow0008
     * @tc.desc      Keep a sixteen megabyte payload made of one large array and check the used heap grows by at
     *               least eight megabytes while the reading stays ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(1, 20);
      const quiet: VmSample = VmSample.read();
      const large: number[][] = retainArrays(1, 2097152);
      await paceTurn();
      const noisy: VmSample = VmSample.read();
      const grown: number = noisy.usedKb - quiet.usedKb;
      const halfPayload: number = payloadKb(1, 2097152) / 2;
      logCase('testVmHeapRetainGrow0008', 'grownKb=' + grown + ' halfPayloadKb=' + halfPayload +
        ' hugeLength=' + large[0].length);
      expect(grown >= halfPayload).assertTrue();
      expect(halfPayload).assertEqual(8192);
      expect(noisy.usedKb <= noisy.totalKb).assertTrue();
      expect(noisy.totalKb >= quiet.totalKb - TOTAL_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2300
     * @tc.name      testVmHeapRetainGrow0009
     * @tc.desc      Fill a four array pool of half million element vectors in two halves and check each half adds
     *               live bytes and the final used heap clears half of the combined payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const startLine: VmSample = VmSample.read();
      let vectors: number[][] = retainArrays(2, 524288);
      const halfLine: VmSample = await peakUsedSample(6);
      vectors = vectors.concat(retainArrays(2, 524288));
      const endLine: VmSample = await peakUsedSample(6);
      const halfKb: number = payloadKb(2, 524288);
      logCase('testVmHeapRetainGrow0009', 'halfKb=' + halfKb + ' firstHalf=' + (halfLine.usedKb - startLine.usedKb) +
        ' secondHalf=' + (endLine.usedKb - halfLine.usedKb) + ' pool=' + vectors.length);
      expect(vectors.length).assertEqual(4);
      expect(halfLine.usedKb - startLine.usedKb >= halfKb / 4).assertTrue();
      expect(endLine.usedKb - halfLine.usedKb >= halfKb / 4).assertTrue();
      expect(endLine.usedKb - startLine.usedKb >= halfKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2400
     * @tc.name      testVmHeapRetainGrow0010
     * @tc.desc      Keep thirty two arrays of sixteen thousand three hundred eighty four elements and check the
     *               filled values survive while the heap sample reports growth and stays ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pre: VmSample = VmSample.read();
      const slabs: number[][] = retainArrays(32, 16384);
      await paceTurn();
      const post: VmSample = VmSample.read();
      const sampleValues: number[] = [slabs[0][0], slabs[7][0], slabs[31][0]];
      logCase('testVmHeapRetainGrow0010', 'sampleValues=' + sampleValues.join('/') + ' slabs=' + slabs.length +
        ' usedDeltaKb=' + (post.usedKb - pre.usedKb));
      expect(sampleValues[0]).assertEqual(0);
      expect(sampleValues[1]).assertEqual(7);
      expect(sampleValues[2]).assertEqual(31);
      expect(post.usedKb - pre.usedKb >= payloadKb(32, 16384) / 2).assertTrue();
      expect(post.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2500
     * @tc.name      testVmHeapRetainGrow0011
     * @tc.desc      Keep five arrays and check current object bytes and allocated bytes cover their full payload;
     *               verify live end values while preserving the array and reserved-heap drift checks
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const initialCycles: number = await collectSettled(2, 25);
      expect(initialCycles >= 2).assertTrue();
      const frame: HeapWindow = new HeapWindow(VmSample.read(), VmSample.read());
      const allocatedBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const kept: number[][] = retainArrays(5, 131072);
      await paceTurn();
      frame.after = VmSample.read();
      const allocated: number = byteCounterDelta(gcStat(KEY_BYTES_ALLOCATED), allocatedBefore);
      const payload: number = payloadKb(5, 131072);
      logCase('testVmHeapRetainGrow0011', frame.gauge() + ' payloadKb=' + payload +
        ' objectKb=' + frame.after.objectKb + ' allocatedBytes=' + allocated +
        ' arrayDeltaKb=' + frame.arrayDeltaKb());
      expect(kept.length).assertEqual(5);
      expect(frame.after.objectKb >= payload).assertTrue();
      expect(frame.arrayDeltaKb() >= -USED_SLACK_KB).assertTrue();
      expect(frame.totalDeltaKb() <= TOTAL_SLACK_KB).assertTrue();
      expect(frame.after.sane()).assertTrue();
      expect(allocated >= payload * KB).assertTrue();
      expect(payloadHolds(kept, 5, 131072, 5)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2600
     * @tc.name      testVmHeapRetainGrow0012
     * @tc.desc      Keep a one million element array, restate its payload through the byte helper and check the
     *               heap growth clears half of that independent expectation
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const beforeStat: GcSnapshot = new GcSnapshot();
      const beforeHeap: VmSample = VmSample.read();
      const block: number[][] = retainArrays(1, 1000000);
      await paceTurn();
      const afterHeap: VmSample = VmSample.read();
      const afterStat: GcSnapshot = new GcSnapshot();
      const expectedKb: number = kbFromBytes(payloadBytes(1, 1000000));
      const grownKb: number = afterHeap.usedKb - beforeHeap.usedKb;
      const ledger: StatPair = new StatPair(beforeStat, afterStat);
      logCase('testVmHeapRetainGrow0012', 'expectedKb=' + expectedKb + ' grownKb=' + grownKb + ' ' +
        ledger.detail());
      expect(block[0].length).assertEqual(1000000);
      expect(grownKb >= expectedKb / 2).assertTrue();
      expect(ledger.allocatedDelta() >= payloadBytes(1, 1000000)).assertTrue();
      expect(ledger.monotonous()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2700
     * @tc.name      testVmHeapRetainGrow0013
     * @tc.desc      Keep nine arrays of sixty five thousand five hundred thirty six elements while also throwing
     *               garbage away and check the retained growth still shows through the noise
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const baseline: VmSample = VmSample.read();
      const retained: number[][] = retainArrays(9, 65536);
      const sink: number = allocatePressure();
      const sampled: VmSample = await peakUsedSample(6);
      const gain: number = sampled.usedKb - baseline.usedKb;
      const floorKb: number = payloadKb(9, 65536) / 2;
      logCase('testVmHeapRetainGrow0013', 'sink=' + sink + ' retained=' + retained.length + ' gainKb=' + gain +
        ' floorKb=' + floorKb);
      expect(retained.length).assertEqual(9);
      expect(gain >= floorKb).assertTrue();
      expect(sampled.ordered()).assertTrue();
      expect(shapeHolds(retained, 65536)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2800
     * @tc.name      testVmHeapRetainGrow0014
     * @tc.desc      Keep six arrays and verify full retained payload through current object bytes, allocated bytes
     *               and end values; separately keep the original array/used share tolerance of 0.05
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const initialCycles: number = await collectSettled(2, 25);
      expect(initialCycles >= 2).assertTrue();
      const lean: VmSample = VmSample.read();
      const allocatedBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const shared: number[][] = retainArrays(6, 131072);
      await paceTurn();
      const heavy: VmSample = VmSample.read();
      const allocated: number = byteCounterDelta(gcStat(KEY_BYTES_ALLOCATED), allocatedBefore);
      const shareBefore: number = lean.arrayShare();
      const shareAfter: number = heavy.arrayShare();
      logCase('testVmHeapRetainGrow0014', 'shareBefore=' + shareBefore + ' shareAfter=' + shareAfter +
        ' objectKb=' + heavy.objectKb + ' payloadKb=' + payloadKb(6, 131072) + ' allocatedBytes=' + allocated);
      expect(shared.length).assertEqual(6);
      expect(heavy.objectKb >= payloadKb(6, 131072)).assertTrue();
      expect(shareAfter >= shareBefore - SHARE_TOLERANCE).assertTrue();
      expect(within(shareAfter, 0, 1)).assertTrue();
      expect(allocated >= payloadBytes(6, 131072)).assertTrue();
      expect(payloadHolds(shared, 6, 131072, 6)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_2900
     * @tc.name      testVmHeapRetainGrow0015
     * @tc.desc      Keep four arrays of two hundred thousand elements and check the rounded payload estimate,
     *               the measured growth and the array shape all agree
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const snapshotBefore: VmSample = VmSample.read();
      const odd: number[][] = retainArrays(4, 200000);
      await paceTurn();
      const snapshotAfter: VmSample = VmSample.read();
      const estimated: number = payloadKb(4, 200000);
      const measured: number = snapshotAfter.usedKb - snapshotBefore.usedKb;
      logCase('testVmHeapRetainGrow0015', 'estimatedKb=' + estimated + ' measuredKb=' + measured +
        ' oddCount=' + odd.length);
      expect(within(estimated, 6000, 6500)).assertTrue();
      expect(measured >= estimated / 2).assertTrue();
      expect(odd.length).assertEqual(4);
      expect(shapeHolds(odd, 200000)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3000
     * @tc.name      testVmHeapRetainGrow0016
     * @tc.desc      Keep sixteen arrays of thirty two thousand seven hundred sixty eight elements in two halves
     *               and check the middle and final samples both sit above the starting sample
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const seed: VmSample = VmSample.read();
      const lowerHalf: number[][] = retainArrays(8, 32768);
      const middle: VmSample = await peakUsedSample(4);
      const upperHalf: number[][] = retainArrays(8, 32768);
      const top: VmSample = await peakUsedSample(4);
      const combined: VmSample[] = [seed, middle, top];
      logCase('testVmHeapRetainGrow0016', 'usedKb=' + usedList(combined).join('/') + ' halves=' +
        lowerHalf.length + '+' + upperHalf.length + ' payloadKb=' + payloadKb(16, 32768));
      expect(lowerHalf.length + upperHalf.length).assertEqual(16);
      expect(middle.usedKb >= seed.usedKb - USED_SLACK_KB).assertTrue();
      expect(top.usedKb >= middle.usedKb - USED_SLACK_KB).assertTrue();
      expect(top.usedKb - seed.usedKb >= payloadKb(16, 32768) / 2).assertTrue();
      expect(allSane(combined)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3100
     * @tc.name      testVmHeapRetainGrow0017
     * @tc.desc      Keep two very large arrays of one million elements each and check the used heap absorbs at
     *               least seven megabytes while the used ratio stays inside the unit interval
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(1, 20);
      const opening: VmSample = VmSample.read();
      const twins: number[][] = retainArrays(2, 1000000);
      await paceTurn();
      const closing: VmSample = VmSample.read();
      const absorbed: number = closing.usedKb - opening.usedKb;
      logCase('testVmHeapRetainGrow0017', 'absorbedKb=' + absorbed + ' twins=' + twins.length +
        ' closingRatio=' + closing.usedRatio());
      expect(twins.length).assertEqual(2);
      expect(absorbed >= 7000).assertTrue();
      expect(closing.usedKb <= closing.totalKb).assertTrue();
      expect(closing.usedRatio() > 0 && closing.usedRatio() <= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3200
     * @tc.name      testVmHeapRetainGrow0018
     * @tc.desc      Keep seven arrays of one hundred thirty one thousand seventy two elements and check the stat
     *               oracle stays monotone while its allocated delta covers the payload bytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const ledgerOpen: GcSnapshot = new GcSnapshot();
      const heapOpen: VmSample = VmSample.read();
      const seven: number[][] = retainArrays(7, 131072);
      const heapClose: VmSample = await peakUsedSample(6);
      const ledgerClose: GcSnapshot = new GcSnapshot();
      const ledger: StatPair = new StatPair(ledgerOpen, ledgerClose);
      const payload: number = payloadBytes(7, 131072);
      logCase('testVmHeapRetainGrow0018', 'payloadBytes=' + payload + ' ' + ledger.detail() +
        ' heapDeltaKb=' + (heapClose.usedKb - heapOpen.usedKb));
      expect(ledger.monotonous()).assertTrue();
      expect(ledger.allocatedDelta() >= payload).assertTrue();
      expect(heapClose.usedKb - heapOpen.usedKb >= payload / KB / 2).assertTrue();
      expect(seven.length).assertEqual(7);
      expect(seven[6].length).assertEqual(131072);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3300
     * @tc.name      testVmHeapRetainGrow0019
     * @tc.desc      Keep three arrays of three hundred forty nine thousand five hundred twenty five elements and
     *               check the measured growth clears two fifths of the estimate while array bytes do not shrink
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const prior: VmSample = VmSample.read();
      const triples: number[][] = retainArrays(3, 349525);
      await paceTurn();
      const later: VmSample = VmSample.read();
      const estimate: number = payloadKb(3, 349525);
      const growth: number = later.usedKb - prior.usedKb;
      const arrayDrift: number = later.arrayKb - prior.arrayKb;
      logCase('testVmHeapRetainGrow0019', 'estimateKb=' + estimate + ' growthKb=' + growth +
        ' arrayDriftKb=' + arrayDrift + ' triples=' + triples.length);
      expect(triples.length).assertEqual(3);
      expect(growth >= estimate * 2 / 5).assertTrue();
      expect(arrayDrift >= -USED_SLACK_KB).assertTrue();
      expect(later.arrayKb <= later.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3400
     * @tc.name      testVmHeapRetainGrow0020
     * @tc.desc      Keep forty arrays of ten thousand elements and take two paced readings afterwards to check
     *               both stay above the origin plus a quarter of the payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ground: VmSample = VmSample.read();
      const stack: number[][] = retainArrays(40, 10000);
      await paceTurn();
      const probeOne: VmSample = VmSample.read();
      await paceTurn();
      const probeTwo: VmSample = VmSample.read();
      const probes: number[] = [probeOne.usedKb, probeTwo.usedKb];
      const floorKb: number = ground.usedKb + payloadKb(40, 10000) / 4;
      logCase('testVmHeapRetainGrow0020', 'probesKb=' + probes.join('/') + ' floorKb=' + floorKb +
        ' stack=' + stack.length);
      expect(stack.length).assertEqual(40);
      expect(minOf(probes) >= floorKb).assertTrue();
      expect(spreadOf(probes) <= USED_SLACK_KB).assertTrue();
      expect(probeTwo.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3500
     * @tc.name      testVmHeapRetainGrow0021
     * @tc.desc      Keep two half-million-element arrays in stages and verify current object bytes cover all held
     *               payload, both stage allocation deltas cover a full array and both arrays stay intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesZero: number = gcStat(KEY_BYTES_ALLOCATED);
      const one: number[][] = retainArrays(1, 500000);
      await paceTurn();
      const oneSample: VmSample = VmSample.read();
      const bytesOne: number = gcStat(KEY_BYTES_ALLOCATED);
      const two: number[][] = retainArrays(1, 500000);
      await paceTurn();
      const twoSample: VmSample = VmSample.read();
      const bytesTwo: number = gcStat(KEY_BYTES_ALLOCATED);
      const unitKb: number = payloadKb(1, 500000);
      const allocatedOne: number = byteCounterDelta(bytesOne, bytesZero);
      const allocatedTwo: number = byteCounterDelta(bytesTwo, bytesOne);
      logCase('testVmHeapRetainGrow0021', 'unitKb=' + unitKb + ' objectKb=' + oneSample.objectKb + '/' +
        twoSample.objectKb + ' allocatedBytes=' + allocatedOne + '/' + allocatedTwo);
      expect(one[0].length).assertEqual(500000);
      expect(two[0].length).assertEqual(500000);
      expect(oneSample.objectKb >= unitKb).assertTrue();
      expect(twoSample.objectKb >= 2 * unitKb).assertTrue();
      expect(allocatedOne >= unitKb * KB && allocatedTwo >= unitKb * KB).assertTrue();
      expect(payloadHolds(one, 1, 500000, 1)).assertTrue();
      expect(payloadHolds(two, 1, 500000, 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3600
     * @tc.name      testVmHeapRetainGrow0022
     * @tc.desc      Keep twenty four arrays of eight thousand one hundred ninety two elements and check the GC
     *               counter delta, the allocated bytes and the used heap all move consistently
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const countA: number = gcStat(KEY_GC_COUNT);
      const bytesA: number = gcStat(KEY_BYTES_ALLOCATED);
      const heapA: VmSample = VmSample.read();
      const pack: number[][] = retainArrays(24, 8192);
      const heapB: VmSample = await peakUsedSample(6);
      const bytesB: number = gcStat(KEY_BYTES_ALLOCATED);
      const countB: number = gcStat(KEY_GC_COUNT);
      const allocatedKb: number = kbFromBytes(bytesB - bytesA);
      logCase('testVmHeapRetainGrow0022', 'allocatedKb=' + allocatedKb + ' gcCount=' + countA + '->' + countB +
        ' usedKb=' + heapA.usedKb + '->' + heapB.usedKb);
      expect(pack.length).assertEqual(24);
      expect(allocatedKb >= payloadKb(24, 8192)).assertTrue();
      expect(countB >= countA).assertTrue();
      expect(heapB.usedKb - heapA.usedKb >= payloadKb(24, 8192) / 4).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3700
     * @tc.name      testVmHeapRetainGrow0023
     * @tc.desc      Keep two arrays of seven hundred eighty six thousand four hundred thirty two elements and
     *               check the twelve megabyte payload lifts the used heap by at least six megabytes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const anchor: VmSample = VmSample.read();
      const bulk: number[][] = retainArrays(2, 786432);
      await paceTurn();
      const lifted: VmSample = VmSample.read();
      const payload: number = payloadKb(2, 786432);
      logCase('testVmHeapRetainGrow0023', 'payloadKb=' + payload + ' liftedKb=' + (lifted.usedKb - anchor.usedKb) +
        ' bulkCount=' + bulk.length);
      expect(payload).assertEqual(12288);
      expect(bulk.length).assertEqual(2);
      expect(lifted.usedKb - anchor.usedKb >= payload / 2).assertTrue();
      expect(lifted.usedKb <= lifted.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3800
     * @tc.name      testVmHeapRetainGrow0024
     * @tc.desc      Keep forty eight arrays of four thousand ninety six elements and check the summed element
     *               count matches the expectation while the heap sample reports growth and ordering
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const quiet: VmSample = VmSample.read();
      const rows: number[][] = retainArrays(48, 4096);
      await paceTurn();
      const loud: VmSample = VmSample.read();
      const elementSum: number = rows.reduce((acc: number, row: number[]) => acc + row.length, 0);
      logCase('testVmHeapRetainGrow0024', 'elementSum=' + elementSum + ' expected=' + (48 * 4096) +
        ' usedDeltaKb=' + (loud.usedKb - quiet.usedKb));
      expect(elementSum).assertEqual(48 * 4096);
      expect(rows.length).assertEqual(48);
      expect(loud.usedKb - quiet.usedKb >= payloadKb(48, 4096) / 2).assertTrue();
      expect(loud.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_3900
     * @tc.name      testVmHeapRetainGrow0025
     * @tc.desc      Keep one four hundred thousand element array, ask for a collection and check the retained
     *               bytes are still visible in the used heap afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const startPoint: VmSample = VmSample.read();
      const surviving: number[][] = retainArrays(1, 400000);
      hintGC();
      await paceTurn();
      const afterHint: VmSample = VmSample.read();
      logCase('testVmHeapRetainGrow0025', 'usedStartKb=' + startPoint.usedKb + ' usedAfterHintKb=' +
        afterHint.usedKb + ' survivingLength=' + surviving[0].length);
      expect(surviving[0].length).assertEqual(400000);
      expect(afterHint.usedKb >= startPoint.usedKb + payloadKb(1, 400000) / 2).assertTrue();
      expect(afterHint.ordered()).assertTrue();
      expect(afterHint.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4000
     * @tc.name      testVmHeapRetainGrow0026
     * @tc.desc      Keep ten arrays of one hundred thirty one thousand seventy two elements and check the
     *               allocated byte delta is at least the payload while the used heap clears half of it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const statFloor: GcSnapshot = new GcSnapshot();
      const heapFloor: VmSample = VmSample.read();
      const ten: number[][] = retainArrays(10, 131072);
      const heapCeiling: VmSample = await peakUsedSample(6);
      const statCeiling: GcSnapshot = new GcSnapshot();
      const bytesWanted: number = payloadBytes(10, 131072);
      const ledger: StatPair = new StatPair(statFloor, statCeiling);
      logCase('testVmHeapRetainGrow0026', 'bytesWanted=' + bytesWanted + ' allocated=' +
        ledger.allocatedDelta() + ' usedDeltaKb=' + (heapCeiling.usedKb - heapFloor.usedKb));
      expect(ten.length).assertEqual(10);
      expect(ledger.allocatedDelta() >= bytesWanted).assertTrue();
      expect(kbFromBytes(ledger.allocatedDelta()) >= payloadKb(10, 131072)).assertTrue();
      expect(heapCeiling.usedKb - heapFloor.usedKb >= bytesWanted / KB / 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4100
     * @tc.name      testVmHeapRelease0001
     * @tc.desc      Verify four live arrays, synchronously probe their first and last targets, drop all holders
     *               and require weak clearing, a real GC and freed bytes covering the full released payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const allocatedBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const held: number[][] = retainArrays(4, 131072);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      const intact: boolean = payloadHolds(held, 4, 131072, 4);
      const refs: WeakRef<number[]>[] = payloadRefs(held);
      const beforeDrop: GcSnapshot = new GcSnapshot();
      const dropped: number = releaseAll(held);
      const rounds: number = await collectUntil(() => allCleared(refs), 25);
      const afterDrop: GcSnapshot = new GcSnapshot();
      const settled: VmSample = VmSample.read();
      const freed: number = byteCounterDelta(afterDrop.freed, beforeDrop.freed);
      const allocated: number = byteCounterDelta(beforeDrop.allocated, allocatedBefore);
      logCase('testVmHeapRelease0001', 'dropped=' + dropped + ' rounds=' + rounds + ' freedBytes=' + freed +
        ' allocatedBytes=' + allocated + ' gcDelta=' + (afterDrop.count - beforeDrop.count) +
        ' peakObjectKb=' + peak.objectKb + ' settledObjectKb=' + settled.objectKb);
      expect(dropped).assertEqual(4);
      expect(refs.length).assertEqual(2);
      expect(intact && peak.objectKb >= payloadKb(4, 131072)).assertTrue();
      expect(allocated >= payloadBytes(4, 131072)).assertTrue();
      expect(rounds > 0 && allCleared(refs)).assertTrue();
      expect(afterDrop.count > beforeDrop.count).assertTrue();
      expect(freed >= payloadBytes(4, 131072)).assertTrue();
      expect(freed <= peak.objectKb * KB + byteCounterDelta(afterDrop.allocated, beforeDrop.allocated) + KB)
        .assertTrue();
      expect(settled.objectKb <= peak.objectKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4200
     * @tc.name      testVmHeapRelease0002
     * @tc.desc      Keep eight arrays of sixty five thousand five hundred thirty six elements, drop them and take
     *               two paced readings to check neither drifts far above the peak
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRelease0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const freshly: number[][] = retainArrays(8, 65536);
      await paceTurn();
      const apex: VmSample = VmSample.read();
      const gone: number = releaseAll(freshly);
      await paceTurn();
      const tailOne: VmSample = VmSample.read();
      await paceTurn();
      const tailTwo: VmSample = VmSample.read();
      const tails: number[] = [tailOne.usedKb, tailTwo.usedKb];
      logCase('testVmHeapRelease0002', 'gone=' + gone + ' apexKb=' + apex.usedKb + ' tailsKb=' +
        tails.join('/') + ' tailSpreadKb=' + spreadOf(tails));
      expect(gone).assertEqual(8);
      expect(maxOf(tails) <= apex.usedKb + USED_SLACK_KB).assertTrue();
      expect(spreadOf(tails) <= USED_SLACK_KB).assertTrue();
      expect(tailTwo.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4300
     * @tc.name      testVmHeapRelease0003
     * @tc.desc      Keep two batches of sixty five thousand five hundred thirty six element arrays, drop only
     *               one batch and check the surviving batch keeps the used heap above the starting line
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const origin: VmSample = VmSample.read();
      const victimBatch: number[][] = retainArrays(4, 65536);
      const keeperBatch: number[][] = retainArrays(4, 65536);
      await paceTurn();
      const bothLive: VmSample = VmSample.read();
      const victimDropped: number = releaseAll(victimBatch);
      hintGC();
      await paceTurn();
      const onlyKeeper: VmSample = VmSample.read();
      logCase('testVmHeapRelease0003', 'victimDropped=' + victimDropped + ' keeper=' + keeperBatch.length +
        ' bothLiveKb=' + bothLive.usedKb + ' onlyKeeperKb=' + onlyKeeper.usedKb);
      expect(victimDropped).assertEqual(4);
      expect(onlyKeeper.usedKb >= origin.usedKb + payloadKb(4, 65536) / 4).assertTrue();
      expect(onlyKeeper.usedKb <= bothLive.usedKb + USED_SLACK_KB).assertTrue();
      expect(onlyKeeper.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4400
     * @tc.name      testVmHeapRelease0004
     * @tc.desc      Keep six arrays of two hundred fifty thousand elements, release them and run collection
     *               cycles to check freed bytes move forward with a monotone GC counter
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const registerOpen: GcSnapshot = new GcSnapshot();
      const bulk: number[][] = retainArrays(6, 250000);
      await paceTurn();
      const apex: VmSample = VmSample.read();
      releaseAll(bulk);
      const cycles: number = await runGcCycles(1, 20);
      const registerClose: GcSnapshot = new GcSnapshot();
      const settled: VmSample = VmSample.read();
      const ledger: StatPair = new StatPair(registerOpen, registerClose);
      logCase('testVmHeapRelease0004', 'cycles=' + cycles + ' ' + ledger.detail() + ' apexKb=' + apex.usedKb +
        ' settledKb=' + settled.usedKb);
      expect(cycles >= 1).assertTrue();
      expect(ledger.freedDelta() >= 0).assertTrue();
      expect(ledger.countDelta() >= 1).assertTrue();
      expect(settled.usedKb <= apex.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4500
     * @tc.name      testVmHeapRelease0005
     * @tc.desc      Keep twelve arrays of thirty two thousand seven hundred sixty eight elements, release them
     *               and push a pressure batch so a collection happens before the heap is read again
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const countStart: number = gcStat(KEY_GC_COUNT);
      const twelve: number[][] = retainArrays(12, 32768);
      await paceTurn();
      const apex: VmSample = VmSample.read();
      releaseAll(twelve);
      const squeezed: number = allocatePressure();
      await collectSettled(1, 20);
      const after: VmSample = VmSample.read();
      const countEnd: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapRelease0005', 'squeezed=' + squeezed + ' gcCount=' + countStart + '->' + countEnd +
        ' apexKb=' + apex.usedKb + ' afterKb=' + after.usedKb);
      expect(squeezed > 0).assertTrue();
      expect(countEnd >= countStart).assertTrue();
      expect(after.usedKb <= apex.usedKb + USED_SLACK_KB).assertTrue();
      expect(after.arrayKb >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4600
     * @tc.name      testVmHeapRelease0006
     * @tc.desc      Keep three arrays of five hundred twenty four thousand two hundred eighty eight elements,
     *               release them and check two paced readings both stay under the peak band
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const crew: number[][] = retainArrays(3, 524288);
      await paceTurn();
      const highWater: VmSample = VmSample.read();
      const releasedCount: number = releaseAll(crew);
      await paceTurn();
      const watchOne: VmSample = VmSample.read();
      await paceTurn();
      const watchTwo: VmSample = VmSample.read();
      const watches: VmSample[] = [watchOne, watchTwo];
      logCase('testVmHeapRelease0006', 'releasedCount=' + releasedCount + ' highWaterKb=' + highWater.usedKb +
        ' watchesKb=' + usedList(watches).join('/'));
      expect(releasedCount).assertEqual(3);
      expect(watches.every((item: VmSample) => item.usedKb <= highWater.usedKb + USED_SLACK_KB)).assertTrue();
      expect(allSane(watches)).assertTrue();
      expect(allOrdered(watches)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4700
     * @tc.name      testVmHeapRelease0007
     * @tc.desc      Keep six arrays of one hundred thousand elements, release them and check the array size
     *               reported by the heap does not run past the peak band
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const chunk: number[][] = retainArrays(6, 100000);
      await paceTurn();
      const preRelease: VmSample = VmSample.read();
      const count: number = releaseAll(chunk);
      hintGC();
      await paceTurn();
      await paceTurn();
      const postRelease: VmSample = VmSample.read();
      logCase('testVmHeapRelease0007', 'count=' + count + ' preArrayKb=' + preRelease.arrayKb +
        ' postArrayKb=' + postRelease.arrayKb + ' postUsedKb=' + postRelease.usedKb);
      expect(count).assertEqual(6);
      expect(postRelease.arrayKb <= preRelease.arrayKb + USED_SLACK_KB).assertTrue();
      expect(postRelease.usedKb <= preRelease.usedKb + USED_SLACK_KB).assertTrue();
      expect(postRelease.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4800
     * @tc.name      testVmHeapRelease0008
     * @tc.desc      Keep seven arrays of one hundred fifty thousand elements, release them and compare the stat
     *               ledger deltas with the heap band that follows the release
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledgerStart: GcSnapshot = new GcSnapshot();
      const yard: number[][] = retainArrays(7, 150000);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      releaseAll(yard);
      hintGC();
      await paceTurn();
      const ledgerEnd: GcSnapshot = new GcSnapshot();
      const resting: VmSample = VmSample.read();
      const ledger: StatPair = new StatPair(ledgerStart, ledgerEnd);
      logCase('testVmHeapRelease0008', ledger.detail() + ' peakKb=' + peak.usedKb + ' restingKb=' +
        resting.usedKb);
      expect(ledger.freedDelta() >= 0).assertTrue();
      expect(ledger.countDelta() >= 0).assertTrue();
      expect(ledger.longFullDelta() >= 0).assertTrue();
      expect(resting.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_4900
     * @tc.name      testVmHeapRelease0009
     * @tc.desc      Keep twenty arrays of sixteen thousand three hundred eighty four elements, release them and
     *               check the used heap falls back into the slack band around the peak
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const ground: VmSample = VmSample.read();
      const twenty: number[][] = retainArrays(20, 16384);
      await paceTurn();
      const crest: VmSample = VmSample.read();
      const freedCount: number = releaseAll(twenty);
      await paceTurn();
      const trough: VmSample = VmSample.read();
      const fallKb: number = crest.usedKb - trough.usedKb;
      logCase('testVmHeapRelease0009', 'freedCount=' + freedCount + ' fallKb=' + fallKb +
        ' groundedDeltaKb=' + (trough.usedKb - ground.usedKb));
      expect(freedCount).assertEqual(20);
      expect(fallKb >= -USED_SLACK_KB).assertTrue();
      expect(trough.usedKb <= crest.usedKb + USED_SLACK_KB).assertTrue();
      expect(trough.usedKb >= ground.usedKb - USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5000
     * @tc.name      testVmHeapRelease0010
     * @tc.desc      Run three allocate and release rounds with a reading after each round and check the readings
     *               stay ordered and bounded by the first peak band plus the round allowance
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const rounds: VmSample[] = [];
      let firstPeak: number = 0;
      for (let round = 0; round < 3; round++) {
        const load: number[][] = retainArrays(4, 65536);
        await paceTurn();
        const peak: VmSample = VmSample.read();
        if (round === 0) {
          firstPeak = peak.usedKb;
        }
        releaseAll(load);
        hintGC();
        await paceTurn();
        rounds.push(VmSample.read());
      }
      const readings: number[] = usedList(rounds);
      logCase('testVmHeapRelease0010', 'firstPeakKb=' + firstPeak + ' readingsKb=' + readings.join('/'));
      expect(rounds.length).assertEqual(3);
      expect(maxOf(readings) <= firstPeak + 3 * USED_SLACK_KB).assertTrue();
      expect(allSane(rounds)).assertTrue();
      expect(allOrdered(rounds)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5100
     * @tc.name      testVmHeapRelease0011
     * @tc.desc      Keep two arrays of two hundred sixty two thousand one hundred forty four elements, release
     *               them and check the allocated counter grew while the freed counter did not regress
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const allocatedBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const freedBefore: number = gcStat(KEY_BYTES_FREED);
      const pairOfArrays: number[][] = retainArrays(2, 262144);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      releaseAll(pairOfArrays);
      hintGC();
      await paceTurn();
      const settled: VmSample = VmSample.read();
      const allocatedAfter: number = gcStat(KEY_BYTES_ALLOCATED);
      const freedAfter: number = gcStat(KEY_BYTES_FREED);
      logCase('testVmHeapRelease0011', 'allocatedDelta=' + (allocatedAfter - allocatedBefore) + ' freedDelta=' +
        (freedAfter - freedBefore) + ' peakKb=' + peak.usedKb + ' settledKb=' + settled.usedKb);
      expect(allocatedAfter - allocatedBefore >= payloadBytes(2, 262144)).assertTrue();
      expect(freedAfter >= freedBefore).assertTrue();
      expect(settled.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5200
     * @tc.name      testVmHeapRelease0012
     * @tc.desc      Keep sixteen arrays of eight thousand one hundred ninety two elements, release them, keep a
     *               smaller batch and check the second peak stays inside the first peak band
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const big: number[][] = retainArrays(16, 8192);
      await paceTurn();
      const bigPeak: VmSample = VmSample.read();
      releaseAll(big);
      const small: number[][] = retainArrays(4, 8192);
      await paceTurn();
      const smallPeak: VmSample = VmSample.read();
      logCase('testVmHeapRelease0012', 'big=' + (big.length) + ' small=' + small.length + ' bigPeakKb=' +
        bigPeak.usedKb + ' smallPeakKb=' + smallPeak.usedKb);
      expect(big.length).assertEqual(0);
      expect(small.length).assertEqual(4);
      expect(shapeHolds(small, 8192)).assertTrue();
      expect(smallPeak.usedKb <= bigPeak.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5300
     * @tc.name      testVmHeapRelease0013
     * @tc.desc      Keep five arrays of one hundred thirty one thousand seventy two elements, release them and
     *               check the array share of used heap does not rise above the share seen at the peak
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const floorLine: VmSample = VmSample.read();
      const five: number[][] = retainArrays(5, 131072);
      await paceTurn();
      const topLine: VmSample = VmSample.read();
      const removed: number = releaseAll(five);
      await paceTurn();
      const bottomLine: VmSample = VmSample.read();
      logCase('testVmHeapRelease0013', 'removed=' + removed + ' shareFloor=' + floorLine.arrayShare() +
        ' shareTop=' + topLine.arrayShare() + ' shareBottom=' + bottomLine.arrayShare());
      expect(removed).assertEqual(5);
      expect(bottomLine.arrayShare() <= topLine.arrayShare() + SHARE_TOLERANCE).assertTrue();
      expect(within(bottomLine.arrayShare(), 0, 1)).assertTrue();
      expect(bottomLine.usedKb <= topLine.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5400
     * @tc.name      testVmHeapRelease0014
     * @tc.desc      Keep three arrays of two hundred thousand elements, release them and run a collection cycle
     *               to check the counter ledger and the heap band after collection
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const three: number[][] = retainArrays(3, 200000);
      await paceTurn();
      const ceiling: VmSample = VmSample.read();
      releaseAll(three);
      const cycles: number = await runGcCycles(1, 20);
      const floorNow: VmSample = VmSample.read();
      logCase('testVmHeapRelease0014', 'cycles=' + cycles + ' ceilingKb=' + ceiling.usedKb + ' floorKb=' +
        floorNow.usedKb + ' freedKb=' + gcStat(KEY_BYTES_FREED) / KB);
      expect(cycles >= 1).assertTrue();
      expect(floorNow.usedKb <= ceiling.usedKb + USED_SLACK_KB).assertTrue();
      expect(gcStat(KEY_BYTES_FREED) >= 0).assertTrue();
      expect(floorNow.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5500
     * @tc.name      testVmHeapRelease0015
     * @tc.desc      Keep eight arrays of thirty two thousand seven hundred sixty eight elements, release them
     *               then hint and push pressure before reading the heap band again
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const countAtStart: number = gcStat(KEY_GC_COUNT);
      const eight: number[][] = retainArrays(8, 32768);
      await paceTurn();
      const apex: VmSample = VmSample.read();
      releaseAll(eight);
      allocatePressure();
      await collectSettled(1, 20);
      const banded: VmSample = VmSample.read();
      const countAtEnd: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapRelease0015', 'gcCount=' + countAtStart + '->' + countAtEnd + ' apexKb=' +
        apex.usedKb + ' bandedKb=' + banded.usedKb);
      expect(countAtEnd >= countAtStart).assertTrue();
      expect(banded.usedKb <= apex.usedKb + USED_SLACK_KB).assertTrue();
      expect(banded.usedRatio() > 0 && banded.usedRatio() <= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5600
     * @tc.name      testVmHeapRelease0016
     * @tc.desc      Keep four arrays of four hundred thousand elements, release them, wait two paced turns and
     *               check the holder is empty while the heap band holds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const quadrant: number[][] = retainArrays(4, 400000);
      await paceTurn();
      const summit: VmSample = VmSample.read();
      releaseAll(quadrant);
      await paceTurn();
      await paceTurn();
      const valley: VmSample = VmSample.read();
      logCase('testVmHeapRelease0016', 'holderLength=' + quadrant.length + ' summitKb=' + summit.usedKb +
        ' valleyKb=' + valley.usedKb + ' valleyTotalKb=' + valley.totalKb);
      expect(quadrant.length).assertEqual(0);
      expect(valley.usedKb <= summit.usedKb + USED_SLACK_KB).assertTrue();
      expect(valley.totalKb >= valley.usedKb).assertTrue();
      expect(valley.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5700
     * @tc.name      testVmHeapRelease0017
     * @tc.desc      Keep ten arrays of fifty thousand elements, release them and take two readings around a
     *               pressure batch to check the array size never runs past the peak band
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const haystack: number[][] = retainArrays(10, 50000);
      await paceTurn();
      const crest: VmSample = VmSample.read();
      const swept: number = releaseAll(haystack);
      await paceTurn();
      const firstLook: VmSample = VmSample.read();
      allocatePressure();
      await collectSettled(1, 20);
      const secondLook: VmSample = VmSample.read();
      logCase('testVmHeapRelease0017', 'swept=' + swept + ' crestKb=' + crest.usedKb + ' looksKb=' +
        firstLook.usedKb + '/' + secondLook.usedKb);
      expect(swept).assertEqual(10);
      expect(secondLook.arrayKb <= crest.arrayKb + USED_SLACK_KB).assertTrue();
      expect(secondLook.usedKb <= crest.usedKb + USED_SLACK_KB).assertTrue();
      expect(firstLook.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5800
     * @tc.name      testVmHeapRelease0018
     * @tc.desc      Keep two unequal batches, release both and check the holders end up empty while the used
     *               heap and the freed counter both stay inside their bands
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRelease0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const freedAtStart: number = gcStat(KEY_BYTES_FREED);
      const wide: number[][] = retainArrays(2, 400000);
      const narrow: number[][] = retainArrays(2, 200000);
      await paceTurn();
      const crest: VmSample = VmSample.read();
      const wideGone: number = releaseAll(wide);
      const narrowGone: number = releaseAll(narrow);
      hintGC();
      await paceTurn();
      const cleared: VmSample = VmSample.read();
      const freedAtEnd: number = gcStat(KEY_BYTES_FREED);
      logCase('testVmHeapRelease0018', 'wideGone=' + wideGone + ' narrowGone=' + narrowGone + ' freedDelta=' +
        (freedAtEnd - freedAtStart) + ' crestKb=' + crest.usedKb + ' clearedKb=' + cleared.usedKb);
      expect(wideGone).assertEqual(2);
      expect(narrowGone).assertEqual(2);
      expect(wide.length + narrow.length).assertEqual(0);
      expect(freedAtEnd >= freedAtStart).assertTrue();
      expect(cleared.usedKb <= crest.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_5900
     * @tc.name      testVmHeapByteCounter0001
     * @tc.desc      Keep four arrays of one hundred thirty one thousand seventy two elements and check the
     *               allocated byte counter delta covers the payload and bounds the used heap delta
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapByteCounter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledgerOpen: GcSnapshot = new GcSnapshot();
      const heapOpen: VmSample = VmSample.read();
      const payload: number[][] = retainArrays(4, 131072);
      await paceTurn();
      const heapClose: VmSample = VmSample.read();
      const ledgerClose: GcSnapshot = new GcSnapshot();
      const ledger: StatPair = new StatPair(ledgerOpen, ledgerClose);
      const payloadByteCount: number = payloadBytes(4, 131072);
      const usedDeltaKb: number = heapClose.usedKb - heapOpen.usedKb;
      logCase('testVmHeapByteCounter0001', ledger.detail() + ' payloadBytes=' + payloadByteCount +
        ' usedDeltaKb=' + usedDeltaKb);
      expect(payload.length).assertEqual(4);
      expect(ledger.allocatedDelta() >= payloadByteCount).assertTrue();
      expect(usedDeltaKb <= kbFromBytes(ledger.allocatedDelta()) + USED_SLACK_KB).assertTrue();
      expect(ledger.countDelta() >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6000
     * @tc.name      testVmHeapByteCounter0002
     * @tc.desc      Allocate a six megabyte payload, release it and check the freed counter advances while the
     *               GC count delta can only grow
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapByteCounter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const freedFirst: number = gcStat(KEY_BYTES_FREED);
      const countFirst: number = gcStat(KEY_GC_COUNT);
      const payload: number[][] = retainArrays(3, 262144);
      await paceTurn();
      releaseAll(payload);
      const cycles: number = await runGcCycles(1, 20);
      const freedLast: number = gcStat(KEY_BYTES_FREED);
      const countLast: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapByteCounter0002', 'freedKb=' + freedFirst / KB + '->' + freedLast / KB +
        ' gcCount=' + countFirst + '->' + countLast + ' cycles=' + cycles);
      expect(freedLast >= freedFirst).assertTrue();
      expect(countLast - countFirst >= 1).assertTrue();
      expect(cycles >= 1).assertTrue();
      expect(freedLast - freedFirst >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6100
     * @tc.name      testVmHeapByteCounter0003
     * @tc.desc      Compute the live byte delta twice, once through the stat pair helper and once from the raw
     *               counters, and check both derivations land on the same number
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapByteCounter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const openBook: GcSnapshot = new GcSnapshot();
      const load: number[][] = retainArrays(2, 200000);
      await paceTurn();
      const closeBook: GcSnapshot = new GcSnapshot();
      const ledger: StatPair = new StatPair(openBook, closeBook);
      const liveBefore: number = openBook.allocated - openBook.freed;
      const liveAfter: number = closeBook.allocated - closeBook.freed;
      const liveDelta: number = liveAfter - liveBefore;
      logCase('testVmHeapByteCounter0003', 'helperNet=' + ledger.netBytes() + ' rawNet=' + liveDelta +
        ' load=' + load.length);
      expect(ledger.netBytes()).assertEqual(liveDelta);
      expect(liveAfter >= 0).assertTrue();
      expect(ledger.allocatedDelta() >= payloadBytes(2, 200000)).assertTrue();
      expect(ledger.monotonous()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6200
     * @tc.name      testVmHeapByteCounter0004
     * @tc.desc      Keep a four megabyte payload and check the net live bytes never exceed the allocated delta
     *               while the used heap delta stays under the allocated kilobytes plus slack
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const statFloor: GcSnapshot = new GcSnapshot();
      const vmFloor: VmSample = VmSample.read();
      const block: number[][] = retainArrays(8, 65536);
      await paceTurn();
      const vmCeil: VmSample = VmSample.read();
      const statCeil: GcSnapshot = new GcSnapshot();
      const ledger: StatPair = new StatPair(statFloor, statCeil);
      const allocatedKb: number = kbFromBytes(ledger.allocatedDelta());
      logCase('testVmHeapByteCounter0004', 'allocatedKb=' + allocatedKb + ' netKb=' +
        kbFromBytes(ledger.netBytes()) + ' usedDeltaKb=' + (vmCeil.usedKb - vmFloor.usedKb));
      expect(block.length).assertEqual(8);
      expect(ledger.netBytes() <= ledger.allocatedDelta()).assertTrue();
      expect(ledger.freedDelta() >= 0).assertTrue();
      expect(vmCeil.usedKb - vmFloor.usedKb <= allocatedKb + USED_SLACK_KB).assertTrue();
      expect(vmCeil.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6300
     * @tc.name      testVmHeapByteCounter0005
     * @tc.desc      Retain a five megabyte payload, then verify the allocated kilobytes cover the payload while
     *               the used kilobytes delta stays below that same figure plus slack
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesOpen: number = gcStat(KEY_BYTES_ALLOCATED);
      const beforeHeap: VmSample = VmSample.read();
      const cargo: number[][] = retainArrays(5, 131072);
      await paceTurn();
      const afterHeap: VmSample = VmSample.read();
      const bytesClose: number = gcStat(KEY_BYTES_ALLOCATED);
      const allottedKb: number = kbFromBytes(bytesClose - bytesOpen);
      const consumedKb: number = afterHeap.usedKb - beforeHeap.usedKb;
      logCase('testVmHeapByteCounter0005', 'allottedKb=' + allottedKb + ' consumedKb=' + consumedKb +
        ' wantedKb=' + payloadKb(5, 131072));
      expect(allottedKb >= payloadKb(5, 131072)).assertTrue();
      expect(consumedKb <= allottedKb + USED_SLACK_KB).assertTrue();
      expect(cargo.length).assertEqual(5);
      expect(afterHeap.usedKb <= afterHeap.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6400
     * @tc.name      testVmHeapByteCounter0006
     * @tc.desc      Drive one collection cycle and check the allocated counter still moves forward while the GC
     *               count delta and the heap ordering both hold
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const allocatedStart: number = gcStat(KEY_BYTES_ALLOCATED);
      const countStart: number = gcStat(KEY_GC_COUNT);
      const cycles: number = await runGcCycles(1, 20);
      const countEnd: number = gcStat(KEY_GC_COUNT);
      const allocatedEnd: number = gcStat(KEY_BYTES_ALLOCATED);
      const heapNow: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0006', 'allocatedKb=' + allocatedStart / KB + '->' + allocatedEnd / KB +
        ' gcDelta=' + (countEnd - countStart) + ' cycles=' + cycles);
      expect(cycles >= 1).assertTrue();
      expect(countEnd - countStart >= 1).assertTrue();
      expect(allocatedEnd >= allocatedStart).assertTrue();
      expect(heapNow.usedKb <= heapNow.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6500
     * @tc.name      testVmHeapByteCounter0007
     * @tc.desc      Read the long full collection counter around a pressure burst and check it never regresses
     *               while the heap sample stays non negative and ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const longStart: number = gcStat(KEY_FULL_GC_LONG);
      const burst: number[][] = retainArrays(4, 100000);
      allocatePressure();
      allocatePressure();
      await paceTurn();
      const longEnd: number = gcStat(KEY_FULL_GC_LONG);
      const sample: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0007', 'longFull=' + longStart + '->' + longEnd + ' burst=' + burst.length +
        ' ' + sample.detail());
      expect(longEnd >= longStart).assertTrue();
      expect(sample.sane()).assertTrue();
      expect(sample.ordered()).assertTrue();
      expect(sample.arrayKb <= sample.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6600
     * @tc.name      testVmHeapByteCounter0008
     * @tc.desc      Keep eight arrays of two hundred thousand elements, release them and check the freed
     *               counter keeps its footing while the allocated counter stays ahead of it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const freedStart: number = gcStat(KEY_BYTES_FREED);
      const heavy: number[][] = retainArrays(8, 200000);
      await paceTurn();
      const apex: VmSample = VmSample.read();
      releaseAll(heavy);
      await runGcCycles(2, 25);
      const freedEnd: number = gcStat(KEY_BYTES_FREED);
      const allocatedNow: number = gcStat(KEY_BYTES_ALLOCATED);
      const resting: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0008', 'freedDelta=' + (freedEnd - freedStart) + ' allocatedNow=' +
        allocatedNow + ' apexKb=' + apex.usedKb + ' restingKb=' + resting.usedKb);
      expect(freedEnd >= freedStart).assertTrue();
      expect(allocatedNow >= freedEnd).assertTrue();
      expect(resting.usedKb <= apex.usedKb + USED_SLACK_KB).assertTrue();
      expect(resting.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6700
     * @tc.name      testVmHeapByteCounter0009
     * @tc.desc      Keep a payload and check the used heap delta expressed in kilobytes does not run past the
     *               allocated byte delta expressed in kilobytes plus slack
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const windowOpenStat: GcSnapshot = new GcSnapshot();
      const windowOpenHeap: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(6, 100000);
      await paceTurn();
      const windowCloseHeap: VmSample = VmSample.read();
      const windowCloseStat: GcSnapshot = new GcSnapshot();
      const span: StatPair = new StatPair(windowOpenStat, windowCloseStat);
      const heapGrowthKb: number = windowCloseHeap.usedKb - windowOpenHeap.usedKb;
      const allocatedGrowthKb: number = kbFromBytes(span.allocatedDelta());
      logCase('testVmHeapByteCounter0009', 'heapGrowthKb=' + heapGrowthKb + ' allocatedGrowthKb=' +
        allocatedGrowthKb + ' kept=' + kept.length);
      expect(heapGrowthKb <= allocatedGrowthKb + USED_SLACK_KB).assertTrue();
      expect(ratioOf(heapGrowthKb, allocatedGrowthKb) <= 1 + SHARE_TOLERANCE).assertTrue();
      expect(kept.length).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6800
     * @tc.name      testVmHeapByteCounter0010
     * @tc.desc      Throw away twenty pressure bursts and check the allocated counter climbs by at least the
     *               narrow payload of every burst while the used heap grows far less
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesBeforeBursts: number = gcStat(KEY_BYTES_ALLOCATED);
      const heapBeforeBursts: VmSample = VmSample.read();
      let sink: number = 0;
      for (let burst = 0; burst < 20; burst++) {
        sink += allocatePressure();
        await paceTurn();
      }
      const heapAfterBursts: VmSample = VmSample.read();
      const bytesAfterBursts: number = gcStat(KEY_BYTES_ALLOCATED);
      const burstFloorBytes: number = 20 * 20000 * 16 * 8;
      const thrownKb: number = burstFloorBytes / KB;
      const grownKb: number = heapAfterBursts.usedKb - heapBeforeBursts.usedKb;
      logCase('testVmHeapByteCounter0010', 'sink=' + sink + ' allocatedDeltaKb=' +
        kbFromBytes(bytesAfterBursts - bytesBeforeBursts) + ' grownKb=' + grownKb + ' thrownKb=' + thrownKb);
      expect(sink > 0).assertTrue();
      expect(bytesAfterBursts - bytesBeforeBursts >= burstFloorBytes).assertTrue();
      expect(grownKb < thrownKb).assertTrue();
      expect(heapAfterBursts.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_6900
     * @tc.name      testVmHeapByteCounter0011
     * @tc.desc      Observe six retained arrays and real pressure garbage with equal six-turn sampling windows;
     *               separately verify retained object payload, both allocation deltas and weak-confirmed GC release
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const initialCycles: number = await collectSettled(2, 25);
      expect(initialCycles >= 2).assertTrue();
      const keepOpen: GcSnapshot = new GcSnapshot();
      const stored: number[][] = retainArrays(6, 131072);
      const keepHeapClose: VmSample = await objectSampleAfterTurns(6);
      const keepClose: GcSnapshot = new GcSnapshot();
      const refs: WeakRef<RingNode>[] = [];
      const junkHeapOpen: VmSample = VmSample.read();
      const junkOpen: GcSnapshot = new GcSnapshot();
      const sink: number = allocatePressure(refs);
      const junkHeapClose: VmSample = await objectSampleAfterTurns(6);
      const junkClose: GcSnapshot = new GcSnapshot();
      const keepSpan: StatPair = new StatPair(keepOpen, keepClose);
      const junkSpan: StatPair = new StatPair(junkOpen, junkClose);
      const rounds: number = await collectUntil(() => allCleared(refs), 25);
      const afterRelease: GcSnapshot = new GcSnapshot();
      const freed: number = byteCounterDelta(afterRelease.freed, junkOpen.freed);
      const settled: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0011', 'keepObjectKb=' + keepHeapClose.objectKb + ' junkObjectKb=' +
        junkHeapClose.objectKb + ' settledObjectKb=' + settled.objectKb + ' stored=' + stored.length +
        ' keepAllocatedBytes=' + keepSpan.allocatedDelta() + ' junkAllocatedBytes=' + junkSpan.allocatedDelta() +
        ' sink=' + sink + ' clearRounds=' + rounds + ' freedBytes=' + freed +
        ' gcDelta=' + (afterRelease.count - junkOpen.count));
      expect(keepSpan.allocatedDelta() >= payloadBytes(6, 131072)).assertTrue();
      expect(junkSpan.allocatedDelta() > 0).assertTrue();
      expect(keepHeapClose.objectKb >= payloadKb(6, 131072)).assertTrue();
      expect(keepHeapClose.ordered()).assertTrue();
      expect(refs.length).assertEqual(2);
      expect(sink > 0 && rounds > 0 && allCleared(refs)).assertTrue();
      expect(afterRelease.count > junkOpen.count).assertTrue();
      expect(freed > 0).assertTrue();
      expect(freed <= junkHeapOpen.objectKb * KB + byteCounterDelta(afterRelease.allocated, junkOpen.allocated) + KB)
        .assertTrue();
      expect(settled.objectKb >= payloadKb(6, 131072)).assertTrue();
      expect(payloadHolds(stored, 6, 131072, 6)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7000
     * @tc.name      testVmHeapByteCounter0012
     * @tc.desc      Read both byte counters without allocating and check the lifetime freed bytes never run past
     *               the lifetime allocated bytes while both stay monotone
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapByteCounter0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const allocatedA: number = gcStat(KEY_BYTES_ALLOCATED);
      const freedA: number = gcStat(KEY_BYTES_FREED);
      await paceTurn();
      const allocatedB: number = gcStat(KEY_BYTES_ALLOCATED);
      const freedB: number = gcStat(KEY_BYTES_FREED);
      const heapNow: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0012', 'allocated=' + allocatedA + '/' + allocatedB + ' freed=' + freedA +
        '/' + freedB + ' ' + heapNow.detail());
      expect(allocatedB >= allocatedA).assertTrue();
      expect(freedB >= freedA).assertTrue();
      expect(freedA <= allocatedA).assertTrue();
      expect(freedB <= allocatedB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7100
     * @tc.name      testVmHeapByteCounter0013
     * @tc.desc      Keep two arrays of five hundred thousand elements and check the allocated counter covers the
     *               payload twice in a row while the heap sample stays usable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probeOne: number = gcStat(KEY_BYTES_ALLOCATED);
      const twins: number[][] = retainArrays(2, 500000);
      const probeTwo: number = gcStat(KEY_BYTES_ALLOCATED);
      await paceTurn();
      const probeThree: number = gcStat(KEY_BYTES_ALLOCATED);
      const sample: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0013', 'probes=' + probeOne + '/' + probeTwo + '/' + probeThree +
        ' wantedBytes=' + payloadBytes(2, 500000));
      expect(probeTwo >= probeOne).assertTrue();
      expect(probeThree >= probeTwo).assertTrue();
      expect(probeThree - probeOne >= payloadBytes(2, 500000)).assertTrue();
      expect(twins.length).assertEqual(2);
      expect(sample.arrayKb >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7200
     * @tc.name      testVmHeapByteCounter0014
     * @tc.desc      Keep sixteen arrays of sixty four thousand elements and check the allocated delta, the used
     *               heap delta and the GC count delta tell the same story
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const triStart: GcSnapshot = new GcSnapshot();
      const heapStart: VmSample = VmSample.read();
      const sixteen: number[][] = retainArrays(16, 64000);
      await paceTurn();
      const heapEnd: VmSample = VmSample.read();
      const triEnd: GcSnapshot = new GcSnapshot();
      const span: StatPair = new StatPair(triStart, triEnd);
      const want: number = payloadBytes(16, 64000);
      logCase('testVmHeapByteCounter0014', 'wantBytes=' + want + ' allocated=' + span.allocatedDelta() +
        ' usedDeltaKb=' + (heapEnd.usedKb - heapStart.usedKb) + ' countDelta=' + span.countDelta());
      expect(span.allocatedDelta() >= want).assertTrue();
      expect(heapEnd.usedKb - heapStart.usedKb >= want / KB / 2).assertTrue();
      expect(span.countDelta() >= 0).assertTrue();
      expect(sixteen.length).assertEqual(16);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7400
     * @tc.name      testVmHeapByteCounter0016
     * @tc.desc      Ask for a collection over an idle heap and check the used heap does not rise while the freed
     *               counter and GC counter stay monotone
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapByteCounter0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const heapBeforeHint: VmSample = VmSample.read();
      const freedBeforeHint: number = gcStat(KEY_BYTES_FREED);
      const countBeforeHint: number = gcStat(KEY_GC_COUNT);
      hintGC();
      await paceTurn();
      const heapAfterHint: VmSample = VmSample.read();
      const freedAfterHint: number = gcStat(KEY_BYTES_FREED);
      const countAfterHint: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapByteCounter0016', 'usedKb=' + heapBeforeHint.usedKb + '->' + heapAfterHint.usedKb +
        ' freedDelta=' + (freedAfterHint - freedBeforeHint) + ' countDelta=' +
        (countAfterHint - countBeforeHint));
      expect(heapAfterHint.usedKb <= heapBeforeHint.usedKb + USED_SLACK_KB).assertTrue();
      expect(freedAfterHint >= freedBeforeHint).assertTrue();
      expect(countAfterHint >= countBeforeHint).assertTrue();
      expect(heapAfterHint.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7500
     * @tc.name      testVmHeapByteCounter0017
     * @tc.desc      Keep a five megabyte payload then release it and check the allocated window covers the
     *               payload while the final heap reading stays under the peak band
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const openLedger: GcSnapshot = new GcSnapshot();
      const origin: VmSample = VmSample.read();
      const block: number[][] = retainArrays(5, 131072);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      releaseAll(block);
      await runGcCycles(1, 20);
      const closeLedger: GcSnapshot = new GcSnapshot();
      const finish: VmSample = VmSample.read();
      const ledger: StatPair = new StatPair(openLedger, closeLedger);
      logCase('testVmHeapByteCounter0017', 'allocatedKb=' + kbFromBytes(ledger.allocatedDelta()) +
        ' freedKb=' + kbFromBytes(ledger.freedDelta()) + ' peakKb=' + peak.usedKb + ' finishKb=' + finish.usedKb);
      expect(ledger.allocatedDelta() >= payloadBytes(5, 131072)).assertTrue();
      expect(ledger.freedDelta() >= 0).assertTrue();
      expect(finish.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
      expect(finish.usedKb >= origin.usedKb - USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7600
     * @tc.name      testVmHeapByteCounter0018
     * @tc.desc      Keep fourteen arrays of twelve thousand elements and check the allocated bytes, the used
     *               heap and the array shape report the same batch
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesFirst: number = gcStat(KEY_BYTES_ALLOCATED);
      const heapFirst: VmSample = VmSample.read();
      const fourteen: number[][] = retainArrays(14, 12000);
      await paceTurn();
      const heapSecond: VmSample = VmSample.read();
      const bytesSecond: number = gcStat(KEY_BYTES_ALLOCATED);
      const wanted: number = payloadBytes(14, 12000);
      const allocatedKbNow: number = kbFromBytes(bytesSecond - bytesFirst);
      logCase('testVmHeapByteCounter0018', 'wanted=' + wanted + ' allocatedKb=' + allocatedKbNow +
        ' usedDeltaKb=' + (heapSecond.usedKb - heapFirst.usedKb) + ' fourteen=' + fourteen.length);
      expect(allocatedKbNow >= wanted / KB).assertTrue();
      expect(heapSecond.usedKb - heapFirst.usedKb >= 0).assertTrue();
      expect(shapeHolds(fourteen, 12000)).assertTrue();
      expect(fourteen.length).assertEqual(14);
      expect(heapSecond.usedKb <= heapSecond.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7700
     * @tc.name      testVmHeapByteCounter0019
     * @tc.desc      Release a six megabyte payload and check the live byte delta matches between the helper and
     *               the raw counters while collection actually ran
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const freedFirst: number = gcStat(KEY_BYTES_FREED);
      const bookOpen: GcSnapshot = new GcSnapshot();
      const cargo: number[][] = retainArrays(3, 262144);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      releaseAll(cargo);
      const cycles: number = await runGcCycles(1, 20);
      const bookClose: GcSnapshot = new GcSnapshot();
      const freedLast: number = gcStat(KEY_BYTES_FREED);
      const ledger: StatPair = new StatPair(bookOpen, bookClose);
      const allocationDifference: number = bookClose.allocated - bookOpen.allocated;
      const releaseDifference: number = bookClose.freed - bookOpen.freed;
      const rawLiveDelta: number = allocationDifference - releaseDifference +
        (allocationDifference < 0 ? 0x100000000 : 0) - (releaseDifference < 0 ? 0x100000000 : 0);
      const resting: VmSample = VmSample.read();
      logCase('testVmHeapByteCounter0019', 'cycles=' + cycles + ' helperNet=' + ledger.netBytes() +
        ' rawNet=' + rawLiveDelta + ' freedDelta=' + (freedLast - freedFirst));
      expect(ledger.netBytes()).assertEqual(rawLiveDelta);
      expect(freedLast >= freedFirst).assertTrue();
      expect(ledger.countDelta() >= 1).assertTrue();
      expect(resting.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7800
     * @tc.name      testVmHeapByteCounter0020
     * @tc.desc      Run two identical allocation windows back to back and check both windows charge at least the
     *               payload while each lifts the used heap by half of it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const payloadKbEach: number = payloadKb(4, 75000);
      const byteNeeded: number = payloadBytes(4, 75000);
      const firstOpen: GcSnapshot = new GcSnapshot();
      const firstHeap: VmSample = VmSample.read();
      const firstBatch: number[][] = retainArrays(4, 75000);
      await paceTurn();
      const firstHeapEnd: VmSample = VmSample.read();
      const firstClose: GcSnapshot = new GcSnapshot();
      const secondOpen: GcSnapshot = new GcSnapshot();
      const secondHeap: VmSample = VmSample.read();
      const secondBatch: number[][] = retainArrays(4, 75000);
      await paceTurn();
      const secondHeapEnd: VmSample = VmSample.read();
      const secondClose: GcSnapshot = new GcSnapshot();
      const firstSpan: StatPair = new StatPair(firstOpen, firstClose);
      const secondSpan: StatPair = new StatPair(secondOpen, secondClose);
      logCase('testVmHeapByteCounter0020', 'payloadKbEach=' + payloadKbEach + ' first=' +
        firstSpan.allocatedDelta() + ' second=' + secondSpan.allocatedDelta() + ' batches=' +
        (firstBatch.length + secondBatch.length));
      expect(firstSpan.allocatedDelta() >= byteNeeded).assertTrue();
      expect(secondSpan.allocatedDelta() >= byteNeeded).assertTrue();
      expect(firstHeapEnd.usedKb - firstHeap.usedKb >= payloadKbEach / 2).assertTrue();
      expect(secondHeapEnd.usedKb - secondHeap.usedKb >= payloadKbEach / 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_7900
     * @tc.name      testVmHeapByteCounter0021
     * @tc.desc      Interleave stat and heap reads around one allocation burst and check the counters stay
     *               monotone while the heap growth stays inside the byte growth plus slack
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const statOne: GcSnapshot = new GcSnapshot();
      const heapOne: VmSample = VmSample.read();
      const burst: number[][] = retainArrays(10, 100000);
      const statTwo: GcSnapshot = new GcSnapshot();
      await paceTurn();
      const heapTwo: VmSample = VmSample.read();
      const statThree: GcSnapshot = new GcSnapshot();
      const sampleTrail: VmSample[] = [heapOne, heapTwo];
      const span: StatPair = new StatPair(statOne, statThree);
      logCase('testVmHeapByteCounter0021', 'statMiddleAllocated=' + statTwo.allocated + ' allocated=' +
        statOne.allocated + '/' + statTwo.allocated + '/' + statThree.allocated + ' burst=' + burst.length);
      expect(statTwo.allocated >= statOne.allocated).assertTrue();
      expect(statThree.allocated >= statTwo.allocated).assertTrue();
      expect(allOrdered(sampleTrail)).assertTrue();
      expect(heapTwo.usedKb - heapOne.usedKb <= kbFromBytes(span.allocatedDelta()) + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8000
     * @tc.name      testVmHeapByteCounter0022
     * @tc.desc      Throw a pressure burst with no retained payload and check the allocated counter covers the
     *               burst floor while the used heap delta remains under the allocated kilobytes plus slack
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapByteCounter0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const byteFloor: number = gcStat(KEY_BYTES_ALLOCATED);
      const countFloor: number = gcStat(KEY_GC_COUNT);
      const heapFloor: VmSample = VmSample.read();
      const sink: number = allocatePressure();
      await paceTurn();
      const heapRise: VmSample = VmSample.read();
      const byteCeil: number = gcStat(KEY_BYTES_ALLOCATED);
      const countCeil: number = gcStat(KEY_GC_COUNT);
      const burstFloor: number = 20000 * 16 * 8;
      logCase('testVmHeapByteCounter0022', 'sink=' + sink + ' allocatedDelta=' + (byteCeil - byteFloor) +
        ' usedDeltaKb=' + (heapRise.usedKb - heapFloor.usedKb) + ' gcCount=' + countFloor + '->' + countCeil);
      expect(byteCeil - byteFloor >= burstFloor).assertTrue();
      expect(countCeil >= countFloor).assertTrue();
      expect(heapRise.usedKb - heapFloor.usedKb <= kbFromBytes(byteCeil - byteFloor) + USED_SLACK_KB).assertTrue();
      expect(heapRise.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8100
     * @tc.name      testVmHeapSampling0001
     * @tc.desc      Take five paced heap readings back to back and check the used spread stays below the largest
     *               reading while every sample keeps used at or below total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapSampling0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const trail: VmSample[] = [];
      for (let step = 0; step < 5; step++) {
        trail.push(VmSample.read());
        await paceTurn();
      }
      const usedTrail: number[] = usedList(trail);
      const usedSpread: number = spreadOf(usedTrail);
      logCase('testVmHeapSampling0001', 'usedKb=' + usedTrail.join('/') + ' spreadKb=' + usedSpread +
        ' peakKb=' + maxOf(usedTrail));
      expect(trail.length).assertEqual(5);
      expect(usedSpread <= maxOf(usedTrail)).assertTrue();
      expect(allOrdered(trail)).assertTrue();
      expect(minOf(usedTrail) > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8200
     * @tc.name      testVmHeapSampling0002
     * @tc.desc      Take six current-object readings while retaining one-megabyte batches and require each sample
     *               to cover all held payload, each allocation delta to cover its batch and all arrays to stay intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const readings: number[] = [];
      const allocated: number[] = [];
      const intact: boolean[] = [];
      const stash: number[][] = [];
      let previousAllocated: number = gcStat(KEY_BYTES_ALLOCATED);
      for (let step = 0; step < 6; step++) {
        stash.push(retainArrays(1, 131072)[0]);
        await paceTurn();
        readings.push(VmSample.read().objectKb);
        const nowAllocated: number = gcStat(KEY_BYTES_ALLOCATED);
        allocated.push(byteCounterDelta(nowAllocated, previousAllocated));
        previousAllocated = nowAllocated;
        intact.push(payloadHolds(stash, step + 1, 131072, 1));
      }
      logCase('testVmHeapSampling0002', 'objectReadingsKb=' + readings.join('/') + ' allocatedBytes=' +
        allocated.join('/') + ' stashSize=' + stash.length);
      expect(readings.length).assertEqual(6);
      expect(stash.length).assertEqual(6);
      expect(readings.every((value: number, index: number) => value >= payloadKb(index + 1, 131072))).assertTrue();
      expect(allocated.every((value: number) => value >= payloadBytes(1, 131072))).assertTrue();
      expect(intact.length === 6 && intact.every((value: boolean) => value)).assertTrue();
      expect(payloadHolds(stash, 6, 131072, 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8300
     * @tc.name      testVmHeapSampling0003
     * @tc.desc      Take eight readings with a pressure batch before each and check the array size never dips
     *               below the slack band around the first reading
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: VmSample[] = [];
      for (let round = 0; round < 8; round++) {
        allocatePressure();
        await paceTurn();
        series.push(VmSample.read());
      }
      const arrays: number[] = series.map((item: VmSample) => item.arrayKb);
      logCase('testVmHeapSampling0003', 'arrayTrailKb=' + arrays.join('/') + ' minArrayKb=' + minOf(arrays) +
        ' firstArrayKb=' + series[0].arrayKb);
      expect(series.length).assertEqual(8);
      expect(minOf(arrays) >= series[0].arrayKb - USED_SLACK_KB).assertTrue();
      expect(allSane(series)).assertTrue();
      expect(allOrdered(series)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8400
     * @tc.name      testVmHeapSampling0004
     * @tc.desc      Sample the heap four times while the retained set keeps growing and check the last reading
     *               clears the first by at least half of the total retained payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const growing: number[][] = [];
      await collectSettled(1, 20);
      const marks: VmSample[] = [VmSample.read()];
      for (let stage = 0; stage < 3; stage++) {
        const pair: number[][] = retainArrays(2, 131072);
        growing.push(pair[0], pair[1]);
        marks.push(await peakUsedSample(3));
      }
      const flatSeed: number[] = [];
      const flat: number[] = growing.reduce((acc: number[], part: number[]) => acc.concat(part), flatSeed);
      logCase('testVmHeapSampling0004', 'marksKb=' + usedList(marks).join('/') + ' flatSize=' + flat.length +
        ' payloadKb=' + payloadKb(6, 131072));
      expect(growing.length).assertEqual(6);
      expect(marks[3].usedKb - marks[0].usedKb >= payloadKb(6, 131072) / 2).assertTrue();
      expect(marks[3].usedKb > marks[0].usedKb).assertTrue();
      expect(allOrdered(marks)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8500
     * @tc.name      testVmHeapSampling0005
     * @tc.desc      Take ten rapid readings with no allocation in between and check the spread stays inside twice
     *               the slack while every ratio stays in the unit interval
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapSampling0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const rapid: VmSample[] = [];
      for (let step = 0; step < 10; step++) {
        rapid.push(VmSample.read());
      }
      const values: number[] = usedList(rapid);
      logCase('testVmHeapSampling0005', 'count=' + rapid.length + ' spreadKb=' + spreadOf(values) +
        ' ratios=' + rapid.map((item: VmSample) => item.usedRatio()).length);
      expect(rapid.length).assertEqual(10);
      expect(spreadOf(values) <= 2 * USED_SLACK_KB).assertTrue();
      expect(rapid.every((item: VmSample) => within(item.usedRatio(), 0, 1))).assertTrue();
      expect(allSane(rapid)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8600
     * @tc.name      testVmHeapSampling0006
     * @tc.desc      Sample before and after a collection hint in four steps and check the post hint reading stays
     *               inside the pre hint band while the freed counter holds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const beforeOne: VmSample = VmSample.read();
      await paceTurn();
      const beforeTwo: VmSample = VmSample.read();
      const freedMark: number = gcStat(KEY_BYTES_FREED);
      hintGC();
      await paceTurn();
      const afterOne: VmSample = VmSample.read();
      const freedLater: number = gcStat(KEY_BYTES_FREED);
      const preBand: number = maxOf([beforeOne.usedKb, beforeTwo.usedKb]);
      logCase('testVmHeapSampling0006', 'preKb=' + beforeOne.usedKb + '/' + beforeTwo.usedKb + ' postKb=' +
        afterOne.usedKb + ' freedDelta=' + (freedLater - freedMark));
      expect(afterOne.usedKb <= preBand + USED_SLACK_KB).assertTrue();
      expect(freedLater >= freedMark).assertTrue();
      expect(afterOne.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8700
     * @tc.name      testVmHeapSampling0007
     * @tc.desc      Collect seven spaced readings and check the average used heap sits between the smallest and
     *               largest reading while the total reserve stays positive throughout
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const spaced: VmSample[] = [];
      for (let slot = 0; slot < 7; slot++) {
        spaced.push(VmSample.read());
        allocatePressure();
        await paceTurn();
      }
      const values: number[] = usedList(spaced);
      const mean: number = avgOf(values);
      logCase('testVmHeapSampling0007', 'meanKb=' + mean + ' minKb=' + minOf(values) + ' maxKb=' +
        maxOf(values) + ' slots=' + spaced.length);
      expect(spaced.length).assertEqual(7);
      expect(within(mean, minOf(values), maxOf(values))).assertTrue();
      expect(spreadOf(values) <= maxOf(values)).assertTrue();
      expect(minOf(values) > 0).assertTrue();
      expect(spaced.every((item: VmSample) => item.totalKb > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8800
     * @tc.name      testVmHeapSampling0008
     * @tc.desc      Take twelve readings while small arrays come and go and check every reading stays ordered
     *               with a non negative array size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const flicker: VmSample[] = [];
      for (let step = 0; step < 12; step++) {
        const transient: number[][] = retainArrays(3, 2048);
        flicker.push(VmSample.read());
        releaseAll(transient);
        await paceTurn();
      }
      const arraySizes: number[] = flicker.map((item: VmSample) => item.arrayKb);
      logCase('testVmHeapSampling0008', 'count=' + flicker.length + ' minArrayKb=' + minOf(arraySizes) +
        ' maxArrayKb=' + maxOf(arraySizes));
      expect(flicker.length).assertEqual(12);
      expect(minOf(arraySizes) >= 0).assertTrue();
      expect(allOrdered(flicker)).assertTrue();
      expect(flicker.every((item: VmSample) => item.usedKb <= item.totalKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_8900
     * @tc.name      testVmHeapSampling0009
     * @tc.desc      Sample after five separate collection cycles and check the reserved heap totals never shrink
     *               past the slack while each reading stays ordered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const reserves: number[] = [];
      const heights: number[] = [];
      for (let round = 0; round < 5; round++) {
        await runGcCycles(1, 20);
        const read: VmSample = VmSample.read();
        reserves.push(read.totalKb);
        heights.push(read.usedKb);
      }
      const reserveDrops: number[] = [];
      for (let index = 1; index < reserves.length; index++) {
        reserveDrops.push(reserves[index] - reserves[index - 1]);
      }
      logCase('testVmHeapSampling0009', 'reservesKb=' + reserves.join('/') + ' heightsKb=' + heights.join('/'));
      expect(reserves.length).assertEqual(5);
      expect(minOf(reserveDrops) >= -TOTAL_SLACK_KB).assertTrue();
      expect(minOf(heights) > 0).assertTrue();
      expect(reserves.every((value: number) => value > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9000
     * @tc.name      testVmHeapSampling0010
     * @tc.desc      Keep a payload, release it midway through a five step sampling run and check the readings
     *               after the release stay under the recorded peak band
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const phase: VmSample[] = [];
      const load: number[][] = retainArrays(6, 131072);
      phase.push(VmSample.read());
      await paceTurn();
      phase.push(VmSample.read());
      const peakKb: number = maxOf(usedList(phase));
      releaseAll(load);
      await paceTurn();
      phase.push(VmSample.read());
      allocatePressure();
      await collectSettled(1, 20);
      phase.push(VmSample.read());
      await paceTurn();
      phase.push(VmSample.read());
      logCase('testVmHeapSampling0010', 'peakKb=' + peakKb + ' trailKb=' + usedList(phase).join('/') +
        ' loadSize=' + load.length);
      expect(phase.length).assertEqual(5);
      expect(phase[4].usedKb <= peakKb + USED_SLACK_KB).assertTrue();
      expect(phase[2].usedKb <= peakKb + USED_SLACK_KB).assertTrue();
      expect(load.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9100
     * @tc.name      testVmHeapSampling0011
     * @tc.desc      Take nine readings while small batches are created and dropped and check the allocated
     *               counter grows while every reading keeps its ratio inside the unit interval
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesOpen: number = gcStat(KEY_BYTES_ALLOCATED);
      const checks: boolean[] = [];
      let lastSample: VmSample = VmSample.read();
      for (let step = 0; step < 9; step++) {
        const batch: number[][] = retainArrays(2, 4096);
        releaseAll(batch);
        allocatePressure();
        await paceTurn();
        lastSample = VmSample.read();
        checks.push(lastSample.usedRatio() <= 1 && lastSample.arrayKb >= 0);
      }
      const bytesClose: number = gcStat(KEY_BYTES_ALLOCATED);
      logCase('testVmHeapSampling0011', 'rounds=' + checks.length + ' allocatedDeltaKb=' +
        kbFromBytes(bytesClose - bytesOpen) + ' lastUsedKb=' + lastSample.usedKb);
      expect(checks.length).assertEqual(9);
      expect(checks.every((flag: boolean) => flag)).assertTrue();
      expect(bytesClose >= bytesOpen).assertTrue();
      expect(lastSample.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9200
     * @tc.name      testVmHeapSampling0012
     * @tc.desc      Interleave direct and snapshot based readings six times and check both families stay ordered
     *               with averages that agree inside the slack
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const directSide: VmSample[] = [];
      const snapshotSide: VmSample[] = [];
      for (let slot = 0; slot < 3; slot++) {
        directSide.push(VmSample.read());
        await paceTurn();
        snapshotSide.push(VmSample.fromHeap(new HeapSnapshot()));
        await paceTurn();
      }
      const directMean: number = avgOf(usedList(directSide));
      const snapshotMean: number = avgOf(usedList(snapshotSide));
      logCase('testVmHeapSampling0012', 'directMeanKb=' + directMean + ' snapshotMeanKb=' + snapshotMean +
        ' directCount=' + directSide.length + ' snapshotCount=' + snapshotSide.length);
      expect(directSide.length).assertEqual(3);
      expect(snapshotSide.length).assertEqual(3);
      expect(allOrdered(directSide) && allOrdered(snapshotSide)).assertTrue();
      expect(Math.abs(directMean - snapshotMean) <= 2 * USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9300
     * @tc.name      testVmHeapSampling0013
     * @tc.desc      Take readings while garbage accumulates and check the array share of used heap stays inside
     *               the unit interval with a non negative array size at every step
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const shares: number[] = [];
      let arrayFloor: number = 0;
      for (let step = 0; step < 6; step++) {
        const junk: number[][] = retainArrays(8, 8192);
        junk.length = 0;
        allocatePressure();
        await paceTurn();
        const read: VmSample = VmSample.read();
        shares.push(read.arrayShare());
        arrayFloor = step === 0 ? read.arrayKb : Math.min(arrayFloor, read.arrayKb);
      }
      logCase('testVmHeapSampling0013', 'shareSamples=' + shares.length + ' minShare=' + minOf(shares) +
        ' arrayFloorKb=' + arrayFloor);
      expect(shares.length).assertEqual(6);
      expect(minOf(shares) >= 0).assertTrue();
      expect(maxOf(shares) <= 1).assertTrue();
      expect(arrayFloor >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9400
     * @tc.name      testVmHeapSampling0014
     * @tc.desc      Alternate paced readings with pressure batches and check the GC counter finished higher
     *               while every reading keeps used above zero and below total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const countOpen: number = gcStat(KEY_GC_COUNT);
      const collected: VmSample[] = [];
      for (let turn = 0; turn < 4; turn++) {
        allocatePressure();
        allocatePressure();
        await paceTurn();
        collected.push(VmSample.read());
      }
      const countClose: number = gcStat(KEY_GC_COUNT);
      const heights: number[] = usedList(collected);
      logCase('testVmHeapSampling0014', 'gcCount=' + countOpen + '->' + countClose + ' heightsKb=' +
        heights.join('/'));
      expect(countClose >= countOpen).assertTrue();
      expect(minOf(heights) > 0).assertTrue();
      expect(allOrdered(collected)).assertTrue();
      expect(collected.every((item: VmSample) => item.usedKb < item.totalKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9500
     * @tc.name      testVmHeapSampling0015
     * @tc.desc      Read an empty heap, then load a payload and read four more times to check the loaded band
     *               stays above the empty reading
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const emptyRead: VmSample = VmSample.read();
      const cargo: number[][] = retainArrays(8, 100000);
      const loadedBand: VmSample[] = [];
      for (let step = 0; step < 4; step++) {
        await paceTurn();
        loadedBand.push(VmSample.read());
      }
      const bandHeights: number[] = usedList(loadedBand);
      logCase('testVmHeapSampling0015', 'emptyKb=' + emptyRead.usedKb + ' bandKb=' + bandHeights.join('/') +
        ' cargo=' + cargo.length);
      expect(cargo.length).assertEqual(8);
      expect(minOf(bandHeights) >= emptyRead.usedKb - USED_SLACK_KB).assertTrue();
      expect(maxOf(bandHeights) - minOf(bandHeights) <= USED_SLACK_KB).assertTrue();
      expect(loadedBand[3].ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9600
     * @tc.name      testVmHeapSampling0016
     * @tc.desc      Compute free head room for five readings and check each head room is non negative while the
     *               summed head room and used heap add up to the summed reserve
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapSampling0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const batch: VmSample[] = [];
      for (let step = 0; step < 5; step++) {
        batch.push(VmSample.read());
        await paceTurn();
      }
      const headrooms: number[] = batch.map((item: VmSample) => item.headroomKb());
      const usedSum: number = sumOf(usedList(batch));
      const totalSum: number = sumOf(batch.map((item: VmSample) => item.totalKb));
      logCase('testVmHeapSampling0016', 'headroomsKb=' + headrooms.join('/') + ' headroomSum=' +
        sumOf(headrooms) + ' usedSum=' + usedSum);
      expect(batch.length).assertEqual(5);
      expect(minOf(headrooms) >= 0).assertTrue();
      expect(sumOf(headrooms) + usedSum).assertEqual(totalSum);
      expect(batch.every((item: VmSample) => item.headroomKb() < item.totalKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9700
     * @tc.name      testVmHeapInterplay0001
     * @tc.desc      Allocate equal batches in two rounds, require the first batch's weak probes to clear before
     *               round two, and verify full object payload bounds, per-round allocation and actual GC release
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesStart: number = gcStat(KEY_BYTES_ALLOCATED);
      const firstRound: number[][] = retainArrays(4, 163840);
      await paceTurn();
      const firstPeak: VmSample = VmSample.read();
      const firstIntact: boolean = payloadHolds(firstRound, 4, 163840, 4);
      const refs: WeakRef<number[]>[] = payloadRefs(firstRound);
      const beforeDrop: GcSnapshot = new GcSnapshot();
      const dropped: number = releaseAll(firstRound);
      const rounds: number = await collectUntil(() => allCleared(refs), 25);
      const afterDrop: GcSnapshot = new GcSnapshot();
      const freed: number = byteCounterDelta(afterDrop.freed, beforeDrop.freed);
      logCase('testVmHeapInterplay0001', 'releaseRounds=' + rounds + ' freedBytes=' + freed +
        ' gcDelta=' + (afterDrop.count - beforeDrop.count));
      expect(dropped).assertEqual(4);
      expect(refs.length).assertEqual(2);
      expect(rounds > 0 && allCleared(refs)).assertTrue();
      expect(afterDrop.count > beforeDrop.count).assertTrue();
      expect(freed >= payloadBytes(4, 163840)).assertTrue();
      expect(freed <= firstPeak.objectKb * KB + byteCounterDelta(afterDrop.allocated, beforeDrop.allocated) + KB)
        .assertTrue();
      expect(firstIntact && firstPeak.objectKb >= payloadKb(4, 163840)).assertTrue();
      expect(byteCounterDelta(beforeDrop.allocated, bytesStart) >= payloadBytes(4, 163840)).assertTrue();
      const bytesSecondStart: number = gcStat(KEY_BYTES_ALLOCATED);
      const secondRound: number[][] = retainArrays(4, 163840);
      await paceTurn();
      const secondPeak: VmSample = VmSample.read();
      const bytesEnd: number = gcStat(KEY_BYTES_ALLOCATED);
      const secondAllocated: number = byteCounterDelta(bytesEnd, bytesSecondStart);
      const totalAllocated: number = byteCounterDelta(bytesEnd, bytesStart);
      logCase('testVmHeapInterplay0001', 'firstObjectKb=' + firstPeak.objectKb + ' secondObjectKb=' +
        secondPeak.objectKb + ' secondAllocatedBytes=' + secondAllocated + ' totalAllocatedBytes=' + totalAllocated);
      expect(secondRound.length).assertEqual(4);
      expect(secondPeak.objectKb >= payloadKb(4, 163840)).assertTrue();
      expect(secondAllocated >= payloadBytes(4, 163840)).assertTrue();
      expect(totalAllocated >= 2 * payloadBytes(4, 163840)).assertTrue();
      expect(payloadHolds(secondRound, 4, 163840, 4)).assertTrue();
      expect(secondPeak.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9800
     * @tc.name      testVmHeapInterplay0002
     * @tc.desc      Keep a payload, bury it under garbage, hint a collection and check the retained bytes are
     *               still counted in the used heap afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const ground: VmSample = VmSample.read();
      const survivor: number[][] = retainArrays(4, 250000);
      allocatePressure();
      allocatePressure();
      await collectSettled(1, 20);
      const afterBury: VmSample = VmSample.read();
      const freedNow: number = gcStat(KEY_BYTES_FREED);
      logCase('testVmHeapInterplay0002', 'survivor=' + survivor.length + ' afterBuryKb=' + afterBury.usedKb +
        ' groundKb=' + ground.usedKb + ' freedKb=' + freedNow / KB);
      expect(survivor.length).assertEqual(4);
      expect(shapeHolds(survivor, 250000)).assertTrue();
      expect(afterBury.usedKb >= ground.usedKb + payloadKb(4, 250000) / 2).assertTrue();
      expect(freedNow >= 0).assertTrue();
      expect(afterBury.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_9900
     * @tc.name      testVmHeapInterplay0003
     * @tc.desc      Ask for two collection hints in a row and then push pressure to check the heap reading does
     *               not climb past the starting band and the GC counter never regresses
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const opening: VmSample = VmSample.read();
      const countOpening: number = gcStat(KEY_GC_COUNT);
      hintGC();
      hintGC();
      allocatePressure();
      await collectSettled(1, 20);
      const closing: VmSample = VmSample.read();
      const countClosing: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapInterplay0003', 'openingKb=' + opening.usedKb + ' closingKb=' + closing.usedKb +
        ' gcCount=' + countOpening + '->' + countClosing);
      expect(closing.usedKb <= opening.usedKb + USED_SLACK_KB).assertTrue();
      expect(countClosing >= countOpening).assertTrue();
      expect(closing.usedRatio() > 0 && closing.usedRatio() <= 1).assertTrue();
      expect(closing.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10000
     * @tc.name      testVmHeapInterplay0004
     * @tc.desc      Swap a two megabyte payload for a four megabyte payload and check the second phase lifts the
     *               used heap while the holders report the right sizes
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const origin: VmSample = VmSample.read();
      let payload: number[][] = retainArrays(2, 131072);
      await paceTurn();
      const smallPhase: VmSample = VmSample.read();
      releaseAll(payload);
      payload = retainArrays(4, 131072);
      await paceTurn();
      const largePhase: VmSample = VmSample.read();
      logCase('testVmHeapInterplay0004', 'smallKb=' + smallPhase.usedKb + ' largeKb=' + largePhase.usedKb +
        ' originKb=' + origin.usedKb + ' holder=' + payload.length);
      expect(payload.length).assertEqual(4);
      expect(smallPhase.usedKb - origin.usedKb >= payloadKb(2, 131072) / 2).assertTrue();
      expect(largePhase.usedKb - smallPhase.usedKb >= payloadKb(2, 131072) / 2).assertTrue();
      expect(largePhase.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10100
     * @tc.name      testVmHeapInterplay0005
     * @tc.desc      Read all three counters before and after a payload lands and check the count, allocated and
     *               freed deltas all stay consistent with a fill that keeps every array alive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const heapBefore: VmSample = VmSample.read();
      const landed: number[][] = retainArrays(6, 150000);
      await paceTurn();
      const heapAfter: VmSample = VmSample.read();
      const after: GcSnapshot = new GcSnapshot();
      const ledger: StatPair = new StatPair(before, after);
      const wanted: number = payloadBytes(6, 150000);
      logCase('testVmHeapInterplay0005', ledger.detail() + ' wanted=' + wanted + ' landed=' + landed.length);
      expect(ledger.allocatedDelta() >= wanted).assertTrue();
      expect(ledger.countDelta() >= 0).assertTrue();
      expect(ledger.freedDelta() >= 0).assertTrue();
      expect(heapAfter.usedKb - heapBefore.usedKb >= wanted / KB / 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10200
     * @tc.name      testVmHeapInterplay0006
     * @tc.desc      Walk a three megabyte payload through four checkpoints, fill, hint, release and settle, and
     *               check the band never runs past the peak
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const checkpoints: VmSample[] = [];
      const cargo: number[][] = retainArrays(3, 131072);
      checkpoints.push(VmSample.read());
      hintGC();
      await paceTurn();
      checkpoints.push(VmSample.read());
      releaseAll(cargo);
      hintGC();
      await paceTurn();
      checkpoints.push(VmSample.read());
      await paceTurn();
      checkpoints.push(VmSample.read());
      const peakKb: number = maxOf(usedList(checkpoints));
      logCase('testVmHeapInterplay0006', 'trailKb=' + usedList(checkpoints).join('/') + ' peakKb=' + peakKb +
        ' cargoLeft=' + cargo.length);
      expect(checkpoints.length).assertEqual(4);
      expect(peakKb <= checkpoints[0].usedKb + payloadKb(3, 131072) + USED_SLACK_KB).assertTrue();
      expect(checkpoints[3].usedKb <= peakKb + USED_SLACK_KB).assertTrue();
      expect(checkpoints[3].ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10400
     * @tc.name      testVmHeapInterplay0008
     * @tc.desc      Keep the full payload across at least two confirmed GC cycles and verify current object bytes,
     *               the batch's allocation delta and every retained array's shape and end values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const initialCycles: number = await collectSettled(2, 25);
      expect(initialCycles >= 2).assertTrue();
      const bytesBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const anchored: number[][] = retainArrays(3, 262144);
      const allocated: number = byteCounterDelta(gcStat(KEY_BYTES_ALLOCATED), bytesBefore);
      const cycles: number = await runGcCycles(2, 25);
      const heldLine: VmSample = await objectSampleAfterTurns(4);
      logCase('testVmHeapInterplay0008', 'cycles=' + cycles + ' objectKb=' + heldLine.objectKb +
        ' payloadKb=' + payloadKb(3, 262144) + ' allocatedBytes=' + allocated + ' anchored=' + anchored.length);
      expect(cycles >= 2).assertTrue();
      expect(anchored.length).assertEqual(3);
      expect(payloadHolds(anchored, 3, 262144, 3)).assertTrue();
      expect(heldLine.objectKb >= payloadKb(3, 262144)).assertTrue();
      expect(allocated >= payloadBytes(3, 262144)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10500
     * @tc.name      testVmHeapInterplay0009
     * @tc.desc      Alternate keep and release four times and check the last reading stays inside the first peak
     *               band plus the round allowance while the allocated counter advances
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bytesOpen: number = gcStat(KEY_BYTES_ALLOCATED);
      const marks: number[] = [];
      for (let round = 0; round < 4; round++) {
        const slot: number[][] = retainArrays(2, 100000);
        await paceTurn();
        marks.push(VmSample.read().usedKb);
        releaseAll(slot);
        await paceTurn();
      }
      const bytesClose: number = gcStat(KEY_BYTES_ALLOCATED);
      const lastRead: VmSample = VmSample.read();
      logCase('testVmHeapInterplay0009', 'marksKb=' + marks.join('/') + ' lastKb=' + lastRead.usedKb +
        ' allocatedDeltaKb=' + kbFromBytes(bytesClose - bytesOpen));
      expect(marks.length).assertEqual(4);
      expect(lastRead.usedKb <= marks[0] + 4 * USED_SLACK_KB).assertTrue();
      expect(bytesClose >= bytesOpen).assertTrue();
      expect(lastRead.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10600
     * @tc.name      testVmHeapInterplay0010
     * @tc.desc      Run a storm of pressure batches and check the heap reading afterwards keeps the array size
     *               below the reserve and the used ratio inside the unit interval
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const countAtEntry: number = gcStat(KEY_GC_COUNT);
      for (let squall = 0; squall < 5; squall++) {
        allocatePressure();
      }
      await paceTurn();
      const afterStorm: VmSample = VmSample.read();
      const countAtExit: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapInterplay0010', 'gcCount=' + countAtEntry + '->' + countAtExit + ' ' +
        afterStorm.detail() + ' share=' + afterStorm.arrayShare());
      expect(countAtExit >= countAtEntry).assertTrue();
      expect(afterStorm.arrayKb <= afterStorm.totalKb).assertTrue();
      expect(afterStorm.usedRatio() > 0 && afterStorm.usedRatio() <= 1).assertTrue();
      expect(within(afterStorm.arrayShare(), 0, 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10700
     * @tc.name      testVmHeapInterplay0011
     * @tc.desc      Downgrade a payload from four megabytes to two megabytes and check the used heap settles at
     *               or under the larger band while the smaller payload still shows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const origin: VmSample = VmSample.read();
      const heavy: number[][] = retainArrays(4, 131072);
      await paceTurn();
      const heavyLine: VmSample = VmSample.read();
      releaseAll(heavy);
      const light: number[][] = retainArrays(2, 131072);
      await collectSettled(1, 20);
      const lightLine: VmSample = VmSample.read();
      logCase('testVmHeapInterplay0011', 'heavyKb=' + heavyLine.usedKb + ' lightKb=' + lightLine.usedKb +
        ' originKb=' + origin.usedKb + ' lightCount=' + light.length);
      expect(light.length).assertEqual(2);
      expect(lightLine.usedKb <= heavyLine.usedKb + USED_SLACK_KB).assertTrue();
      expect(lightLine.usedKb >= origin.usedKb + payloadKb(2, 131072) / 4).assertTrue();
      expect(heavy.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_10800
     * @tc.name      testVmHeapInterplay0012
     * @tc.desc      Take three checkpoints while retaining two four-array batches and verify each current-object
     *               sample covers all held payload, each allocation delta covers its batch and end values survive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const initialCycles: number = await collectSettled(2, 25);
      expect(initialCycles >= 2).assertTrue();
      const heaps: VmSample[] = [VmSample.read()];
      const allocs: number[] = [gcStat(KEY_BYTES_ALLOCATED)];
      const intact: boolean[] = [];
      const chunks: number[][] = [];
      for (let step = 0; step < 2; step++) {
        const quad: number[][] = retainArrays(4, 131072);
        chunks.push(quad[0], quad[1], quad[2], quad[3]);
        heaps.push(await objectSampleAfterTurns(3));
        allocs.push(gcStat(KEY_BYTES_ALLOCATED));
        intact.push(payloadHolds(chunks, (step + 1) * 4, 131072, 4));
      }
      const heights: number[] = heaps.map((item: VmSample) => item.objectKb);
      const firstAllocated: number = byteCounterDelta(allocs[1], allocs[0]);
      const secondAllocated: number = byteCounterDelta(allocs[2], allocs[1]);
      logCase('testVmHeapInterplay0012', 'objectHeightsKb=' + heights.join('/') + ' allocatedBytes=' +
        firstAllocated + '/' + secondAllocated + ' chunks=' + chunks.length);
      expect(heights.length).assertEqual(3);
      expect(heights[1] >= payloadKb(4, 131072)).assertTrue();
      expect(heights[2] >= payloadKb(8, 131072)).assertTrue();
      expect(firstAllocated >= payloadBytes(4, 131072) && secondAllocated >= payloadBytes(4, 131072)).assertTrue();
      expect(byteCounterDelta(allocs[2], allocs[0]) >= payloadBytes(8, 131072)).assertTrue();
      expect(intact.length === 2 && intact.every((value: boolean) => value)).assertTrue();
      expect(payloadHolds(chunks, 8, 131072, 4)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_11000
     * @tc.name      testVmHeapInterplay0014
     * @tc.desc      Hint a collection while a payload is alive and check the used heap keeps showing at least
     *               half of that payload afterwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zeroPoint: VmSample = VmSample.read();
      const countZero: number = gcStat(KEY_GC_COUNT);
      const alive: number[][] = retainArrays(5, 163840);
      hintGC();
      allocatePressure();
      await paceTurn();
      const alivePoint: VmSample = VmSample.read();
      const countNow: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapInterplay0014', 'zeroKb=' + zeroPoint.usedKb + ' aliveKb=' + alivePoint.usedKb +
        ' gcCount=' + countZero + '->' + countNow + ' alive=' + alive.length);
      expect(alivePoint.usedKb >= zeroPoint.usedKb + payloadKb(5, 163840) / 2).assertTrue();
      expect(countNow >= countZero).assertTrue();
      expect(alivePoint.ordered()).assertTrue();
      expect(alivePoint.sane()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_11100
     * @tc.name      testVmHeapInterplay0015
     * @tc.desc      Replace a large payload with a smaller one and check the heap reading does not run past the
     *               large band while the freed counter keeps its footing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const big: number[][] = retainArrays(6, 131072);
      await paceTurn();
      const bigBand: VmSample = VmSample.read();
      const freedBeforeSwap: number = gcStat(KEY_BYTES_FREED);
      releaseAll(big);
      const small: number[][] = retainArrays(2, 65536);
      allocatePressure();
      await paceTurn();
      const smallBand: VmSample = VmSample.read();
      const freedAfterSwap: number = gcStat(KEY_BYTES_FREED);
      logCase('testVmHeapInterplay0015', 'bigKb=' + bigBand.usedKb + ' smallKb=' + smallBand.usedKb +
        ' freedDelta=' + (freedAfterSwap - freedBeforeSwap) + ' smallCount=' + small.length);
      expect(small.length).assertEqual(2);
      expect(smallBand.usedKb <= bigBand.usedKb + USED_SLACK_KB).assertTrue();
      expect(freedAfterSwap >= freedBeforeSwap).assertTrue();
      expect(smallBand.arrayKb >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_11200
     * @tc.name      testVmHeapInterplay0016
     * @tc.desc      Repeat a keep and drop round three times and check each round peak clears the base plus half
     *               of the round payload while every post round reading keeps its footing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const base: VmSample = VmSample.read();
      const peaks: number[] = [];
      const troughs: number[] = [];
      const roundKb: number = payloadKb(2, 98304);
      for (let round = 0; round < 3; round++) {
        const load: number[][] = retainArrays(2, 98304);
        await paceTurn();
        peaks.push(VmSample.read().usedKb);
        releaseAll(load);
        await paceTurn();
        troughs.push(VmSample.read().usedKb);
      }
      logCase('testVmHeapInterplay0016', 'peaksKb=' + peaks.join('/') + ' troughsKb=' + troughs.join('/') +
        ' roundKb=' + roundKb);
      expect(peaks.length).assertEqual(3);
      expect(minOf(peaks) >= base.usedKb + roundKb / 2).assertTrue();
      expect(minOf(troughs) >= base.usedKb - USED_SLACK_KB).assertTrue();
      expect(maxOf(troughs) <= maxOf(peaks) + USED_SLACK_KB).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_11300
     * @tc.name      testVmHeapInterplay0017
     * @tc.desc      Keep a six megabyte payload, pound it with three pressure batches and check the retained
     *               bytes are still reported while the GC counter only moves forward
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const floor: VmSample = VmSample.read();
      const countFloor: number = gcStat(KEY_GC_COUNT);
      const guarded: number[][] = retainArrays(6, 131072);
      allocatePressure();
      allocatePressure();
      allocatePressure();
      await paceTurn();
      const afterPound: VmSample = VmSample.read();
      const countNow: number = gcStat(KEY_GC_COUNT);
      logCase('testVmHeapInterplay0017', 'floorKb=' + floor.usedKb + ' afterKb=' + afterPound.usedKb +
        ' gcCount=' + countFloor + '->' + countNow + ' guarded=' + guarded.length);
      expect(guarded.length).assertEqual(6);
      expect(afterPound.usedKb >= floor.usedKb + payloadKb(6, 131072) / 2).assertTrue();
      expect(countNow >= countFloor).assertTrue();
      expect(afterPound.ordered()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_11400
     * @tc.name      testVmHeapInterplay0018
     * @tc.desc      Read the heap, read both byte counters and read the heap again to check that reading the
     *               runtime stats leaves the heap sample unchanged within slack
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapInterplay0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const firstHeap: VmSample = VmSample.read();
      const allocated: number = gcStat(KEY_BYTES_ALLOCATED);
      const freed: number = gcStat(KEY_BYTES_FREED);
      await paceTurn();
      const secondHeap: VmSample = VmSample.read();
      logCase('testVmHeapInterplay0018', 'allocatedKb=' + allocated / KB + ' freedKb=' + freed / KB +
        ' firstKb=' + firstHeap.usedKb + ' secondKb=' + secondHeap.usedKb);
      expect(Math.abs(secondHeap.usedKb - firstHeap.usedKb) <= USED_SLACK_KB).assertTrue();
      expect(allocated >= freed).assertTrue();
      expect(secondHeap.sane() && firstHeap.sane()).assertTrue();
      expect(secondHeap.arrayKb <= secondHeap.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMHEAP_11500
     * @tc.name      testVmHeapInterplay0019
     * @tc.desc      Combine collection cycles, a retained payload, a release and a hint in one run and check
     *               every counter source stays inside its own band at the end
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapInterplay0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await collectSettled(1, 20);
      const startHeap: VmSample = VmSample.read();
      const startFreed: number = gcStat(KEY_BYTES_FREED);
      const cycles: number = await runGcCycles(1, 20);
      const keeper: number[][] = retainArrays(4, 120000);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      const spare: number[][] = retainArrays(2, 120000);
      releaseAll(spare);
      hintGC();
      await paceTurn();
      const finish: VmSample = VmSample.read();
      const finishFreed: number = gcStat(KEY_BYTES_FREED);
      logCase('testVmHeapInterplay0019', 'cycles=' + cycles + ' keeper=' + keeper.length + ' peakKb=' +
        peak.usedKb + ' finishKb=' + finish.usedKb + ' freedDelta=' + (finishFreed - startFreed));
      expect(cycles >= 1).assertTrue();
      expect(keeper.length).assertEqual(4);
      expect(shapeHolds(keeper, 120000)).assertTrue();
      expect(finishFreed >= startFreed).assertTrue();
      expect(finish.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
      expect(finish.usedKb >= startHeap.usedKb - USED_SLACK_KB).assertTrue();
    });
  });
}
