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
  runGcCycles
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const DOUBLE_BYTES: number = 8;
const USED_SLACK_KB: number = 2048;
const TOTAL_SLACK_KB: number = 8192;
const SHARE_TOLERANCE: number = 0.05;

// Thin readable view over hidebug.getAppVMMemoryInfo: one call fills total, used and array sizes
class VmSample {
  totalKb: number;
  usedKb: number;
  arrayKb: number;

  constructor(totalKb: number, usedKb: number, arrayKb: number) {
    this.totalKb = totalKb;
    this.usedKb = usedKb;
    this.arrayKb = arrayKb;
  }

  static read(): VmSample {
    const info: hidebug.VMMemoryInfo = hidebug.getAppVMMemoryInfo();
    return new VmSample(Number(info.totalHeap), Number(info.heapUsed), Number(info.allArraySize));
  }

  static fromHeap(heap: HeapSnapshot): VmSample {
    return new VmSample(heap.totalKb, heap.usedKb, heap.arrayKb);
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
    return 'totalKb=' + this.totalKb + ' usedKb=' + this.usedKb + ' arrayKb=' + this.arrayKb;
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
    return this.after.allocated - this.before.allocated;
  }

  freedDelta(): number {
    return this.after.freed - this.before.freed;
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

// empties the outer holder and reports how many payload arrays were dropped
function releaseAll(kept: number[][]): number {
  const dropped: number = kept.length;
  kept.length = 0;
  return dropped;
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
      await runGcCycles(1, 20);
      const base: VmSample = VmSample.read();
      const kept: number[][] = retainArrays(4, 262144);
      await paceTurn();
      const loaded: VmSample = VmSample.read();
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
     * @tc.desc      Keep arrays in two separate stages and check the used heap climbs after each stage by at least
     *               a quarter of that stage payload while the running total clears half of the whole payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const origin: VmSample = VmSample.read();
      const firstStage: number[][] = retainArrays(2, 131072);
      await paceTurn();
      const afterFirst: VmSample = VmSample.read();
      const secondStage: number[][] = retainArrays(2, 131072);
      await paceTurn();
      const afterSecond: VmSample = VmSample.read();
      const stageKb: number = payloadKb(2, 131072);
      const firstStep: number = afterFirst.usedKb - origin.usedKb;
      const secondStep: number = afterSecond.usedKb - afterFirst.usedKb;
      logCase('testVmHeapRetainGrow0003', 'stageKb=' + stageKb + ' firstStep=' + firstStep + ' secondStep=' +
        secondStep + ' afterSecondTotalKb=' + afterSecond.totalKb);
      expect(firstStage.length).assertEqual(2);
      expect(secondStage.length).assertEqual(2);
      expect(firstStep >= stageKb / 4).assertTrue();
      expect(secondStep >= stageKb / 4).assertTrue();
      expect(afterSecond.usedKb - origin.usedKb >= stageKb).assertTrue();
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
      const gaugeStart: GcSnapshot = new GcSnapshot();
      const heapStart: VmSample = VmSample.read();
      const batch: number[][] = retainArrays(64, 8192);
      await paceTurn();
      const heapStop: VmSample = VmSample.read();
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
      const startLine: VmSample = VmSample.read();
      let vectors: number[][] = retainArrays(2, 524288);
      await paceTurn();
      const halfLine: VmSample = VmSample.read();
      vectors = vectors.concat(retainArrays(2, 524288));
      await paceTurn();
      const endLine: VmSample = VmSample.read();
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
     * @tc.desc      Keep five arrays of one hundred thirty one thousand seventy two elements and inspect the
     *               growth window for used bytes, array bytes and reserved heap drift
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRetainGrow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const frame: HeapWindow = new HeapWindow(VmSample.read(), VmSample.read());
      const kept: number[][] = retainArrays(5, 131072);
      await paceTurn();
      frame.after = VmSample.read();
      const payload: number = payloadKb(5, 131072);
      logCase('testVmHeapRetainGrow0011', frame.gauge() + ' payloadKb=' + payload +
        ' usedDeltaKb=' + frame.usedDeltaKb() + ' arrayDeltaKb=' + frame.arrayDeltaKb());
      expect(kept.length).assertEqual(5);
      expect(frame.usedDeltaKb() >= payload / 2).assertTrue();
      expect(frame.arrayDeltaKb() >= -USED_SLACK_KB).assertTrue();
      expect(frame.totalDeltaKb() <= TOTAL_SLACK_KB).assertTrue();
      expect(frame.after.sane()).assertTrue();
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
      const baseline: VmSample = VmSample.read();
      const retained: number[][] = retainArrays(9, 65536);
      const sink: number = allocatePressure();
      await paceTurn();
      const sampled: VmSample = VmSample.read();
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
     * @tc.desc      Keep six arrays of one hundred thirty one thousand seventy two elements and check the array
     *               share of used heap does not collapse after the payload lands
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const lean: VmSample = VmSample.read();
      const shared: number[][] = retainArrays(6, 131072);
      await paceTurn();
      const heavy: VmSample = VmSample.read();
      const shareBefore: number = lean.arrayShare();
      const shareAfter: number = heavy.arrayShare();
      logCase('testVmHeapRetainGrow0014', 'shareBefore=' + shareBefore + ' shareAfter=' + shareAfter +
        ' usedDeltaKb=' + (heavy.usedKb - lean.usedKb));
      expect(shared.length).assertEqual(6);
      expect(heavy.usedKb - lean.usedKb >= payloadKb(6, 131072) / 2).assertTrue();
      expect(shareAfter >= shareBefore - SHARE_TOLERANCE).assertTrue();
      expect(within(shareAfter, 0, 1)).assertTrue();
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
      const seed: VmSample = VmSample.read();
      const lowerHalf: number[][] = retainArrays(8, 32768);
      await paceTurn();
      const middle: VmSample = VmSample.read();
      const upperHalf: number[][] = retainArrays(8, 32768);
      await paceTurn();
      const top: VmSample = VmSample.read();
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
      const ledgerOpen: GcSnapshot = new GcSnapshot();
      const heapOpen: VmSample = VmSample.read();
      const seven: number[][] = retainArrays(7, 131072);
      await paceTurn();
      const heapClose: VmSample = VmSample.read();
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
     * @tc.desc      Keep two half million element arrays one after the other and check every single step lifts
     *               the used heap while the pair together clears half of their payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmHeapRetainGrow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const zero: VmSample = VmSample.read();
      const one: number[][] = retainArrays(1, 500000);
      await paceTurn();
      const oneSample: VmSample = VmSample.read();
      const two: number[][] = retainArrays(1, 500000);
      await paceTurn();
      const twoSample: VmSample = VmSample.read();
      const unitKb: number = payloadKb(1, 500000);
      logCase('testVmHeapRetainGrow0021', 'unitKb=' + unitKb + ' stepOne=' + (oneSample.usedKb - zero.usedKb) +
        ' stepTwo=' + (twoSample.usedKb - oneSample.usedKb) + ' lengths=' + one[0].length + ',' + two[0].length);
      expect(one[0].length).assertEqual(500000);
      expect(two[0].length).assertEqual(500000);
      expect(oneSample.usedKb - zero.usedKb >= unitKb / 8).assertTrue();
      expect(twoSample.usedKb - oneSample.usedKb >= unitKb / 8).assertTrue();
      expect(twoSample.usedKb - zero.usedKb >= unitKb).assertTrue();
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
      const countA: number = gcStat(KEY_GC_COUNT);
      const bytesA: number = gcStat(KEY_BYTES_ALLOCATED);
      const heapA: VmSample = VmSample.read();
      const pack: number[][] = retainArrays(24, 8192);
      await paceTurn();
      const heapB: VmSample = VmSample.read();
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
      const statFloor: GcSnapshot = new GcSnapshot();
      const heapFloor: VmSample = VmSample.read();
      const ten: number[][] = retainArrays(10, 131072);
      await paceTurn();
      const heapCeiling: VmSample = VmSample.read();
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
     * @tc.desc      Keep four arrays of one hundred thirty one thousand seventy two elements, drop them, collect
     *               and check the used heap returns to within slack of the pre-release peak
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmHeapRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const freedBefore: number = gcStat(KEY_BYTES_FREED);
      const base: VmSample = VmSample.read();
      const held: number[][] = retainArrays(4, 131072);
      await paceTurn();
      const peak: VmSample = VmSample.read();
      const dropped: number = releaseAll(held);
      await runGcCycles(1, 20);
      const settled: VmSample = VmSample.read();
      const freedAfter: number = gcStat(KEY_BYTES_FREED);
      logCase('testVmHeapRelease0001', 'dropped=' + dropped + ' freedDelta=' + (freedAfter - freedBefore) +
        ' peakUsedKb=' + peak.usedKb + ' settledUsedKb=' + settled.usedKb);
      expect(dropped).assertEqual(4);
      expect(freedAfter >= freedBefore).assertTrue();
      expect(settled.usedKb <= peak.usedKb + USED_SLACK_KB).assertTrue();
      expect(settled.usedKb >= base.usedKb - USED_SLACK_KB).assertTrue();
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
      await paceTurn();
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
      hintGC();
      allocatePressure();
      await paceTurn();
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
      await paceTurn();
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
