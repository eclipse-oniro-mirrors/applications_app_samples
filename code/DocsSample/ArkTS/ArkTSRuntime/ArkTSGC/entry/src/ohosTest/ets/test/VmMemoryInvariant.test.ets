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
  allocatePressure, byteCounterDelta, COLLECT_ROUNDS, gcStat, HeapSnapshot, hintGC, KB,
  KEY_BYTES_ALLOCATED, retainArrays, runGcCycles
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const RETAIN_LENGTH: number = 10000;
const DOUBLE_BYTES: number = 8;
const SAMPLE_ROUNDS: number = 20;

function retainedKb(count: number): number {
  return count * RETAIN_LENGTH * DOUBLE_BYTES / KB;
}

// tiny allocation nudge so hintGC has young garbage to collect without adding megabytes
function nudgeVm(): number {
  let sink: number = 0;
  for (let i = 0; i < 200; i++) {
    const junk: number[] = new Array<number>(8).fill(i);
    sink += junk[7];
  }
  return sink;
}

// drop leftover garbage from earlier cases so growth checks start quiet
async function settleVmHeap(rounds: number): Promise<void> {
  for (let i = 0; i < rounds; i++) {
    hintGC();
    nudgeVm();
    await paceTurn();
  }
}

// Check every array's shape and both end values, not just the outer holder length.
function retainedPayloadHolds(kept: number[][], count: number): boolean {
  return kept.length === count && kept.every((values: number[], index: number) =>
    values.length === RETAIN_LENGTH && values[0] === index && values[RETAIN_LENGTH - 1] === index);
}

// Use the current object reading after the same paced sampling turns, without selecting a net heap peak.
async function heapAfterTurns(rounds: number): Promise<HeapSnapshot> {
  for (let i = 0; i < rounds; i++) {
    await paceTurn();
  }
  return new HeapSnapshot();
}

export default function vmMemoryInvariantTest() {
  describe('VmMemoryInvariant', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMMEMORY_0100
     * @tc.name      testVmMemoryShape0001
     * @tc.desc      Read the VM heap info and check total and used heap are positive with used never above total
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testVmMemoryShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testVmMemoryShape0001', `totalKb=${heap.totalKb} usedKb=${heap.usedKb} arrayKb=${heap.arrayKb}`);
      expect(heap.totalKb > 0).assertTrue();
      expect(heap.usedKb > 0 && heap.usedKb <= heap.totalKb).assertTrue();
      expect(heap.arrayKb >= 0 && Number.isInteger(heap.arrayKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMMEMORY_0200
     * @tc.name      testVmMemoryRetainGrows0001
     * @tc.desc      Keep two hundred number arrays and verify full retained payload through current object bytes,
     *               the allocation delta and every array's shape and end values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmMemoryRetainGrows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const initialCycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      expect(initialCycles >= 2).assertTrue();
      const allocatedBefore: number = gcStat(KEY_BYTES_ALLOCATED);
      const kept: number[][] = retainArrays(200, RETAIN_LENGTH);
      await paceTurn();
      const after: HeapSnapshot = new HeapSnapshot();
      const allocated: number = byteCounterDelta(gcStat(KEY_BYTES_ALLOCATED), allocatedBefore);
      logCase('testVmMemoryRetainGrows0001', `keptLength=${kept.length} lastLength=${kept[199].length} ` +
        `objectKb=${after.objectKb} payloadKb=${retainedKb(200)} allocatedBytes=${allocated} ` +
        `afterUsedKb=${after.usedKb} afterTotalKb=${after.totalKb}`);
      expect(kept[199].length).assertEqual(RETAIN_LENGTH);
      expect(after.objectKb >= retainedKb(200)).assertTrue();
      expect(after.usedKb <= after.totalKb).assertTrue();
      expect(allocated >= retainedKb(200) * KB).assertTrue();
      expect(retainedPayloadHolds(kept, 200)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMMEMORY_0300
     * @tc.name      testVmMemorySampled0001
     * @tc.desc      Sample the heap twenty times while allocating garbage and check every sample keeps used within
     *               total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmMemorySampled0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const samples: HeapSnapshot[] = [];
      for (let round = 0; round < SAMPLE_ROUNDS; round++) {
        allocatePressure();
        samples.push(new HeapSnapshot());
        await paceTurn();
      }
      logCase('testVmMemorySampled0001', `samplesLength=${samples.length} expectedRounds=${SAMPLE_ROUNDS}`);
      expect(samples.length).assertEqual(SAMPLE_ROUNDS);
      expect(samples.every((heap: HeapSnapshot) => heap.usedKb > 0 && heap.usedKb <= heap.totalKb)).assertTrue();
      expect(samples.every((heap: HeapSnapshot) => heap.arrayKb >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMMEMORY_0400
     * @tc.name      testVmMemoryScaled0001
     * @tc.desc      Keep one hundred then two hundred arrays and verify current object bytes cover all retained
     *               payload at each stage, stage allocation deltas cover each batch and all end values survive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmMemoryScaled0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const initialCycles: number = await runGcCycles(2, 25);
      expect(initialCycles >= 2).assertTrue();
      await settleVmHeap(4);
      const bytesBase: number = gcStat(KEY_BYTES_ALLOCATED);
      const first: number[][] = retainArrays(100, RETAIN_LENGTH);
      const middle: HeapSnapshot = await heapAfterTurns(4);
      const bytesMiddle: number = gcStat(KEY_BYTES_ALLOCATED);
      const firstIntact: boolean = retainedPayloadHolds(first, 100);
      const second: number[][] = retainArrays(100, RETAIN_LENGTH);
      const top: HeapSnapshot = await heapAfterTurns(4);
      const bytesTop: number = gcStat(KEY_BYTES_ALLOCATED);
      const firstAllocated: number = byteCounterDelta(bytesMiddle, bytesBase);
      const secondAllocated: number = byteCounterDelta(bytesTop, bytesMiddle);
      logCase('testVmMemoryScaled0001', `firstLength=${first.length} secondLength=${second.length} ` +
        `objectKb=${middle.objectKb}/${top.objectKb} payloadKb=${retainedKb(100)}/${retainedKb(200)} ` +
        `allocatedBytes=${firstAllocated}/${secondAllocated} topUsedKb=${top.usedKb} topTotalKb=${top.totalKb}`);
      expect(first.length + second.length).assertEqual(200);
      expect(middle.objectKb >= retainedKb(100)).assertTrue();
      expect(top.objectKb >= retainedKb(200)).assertTrue();
      expect(top.totalKb >= top.usedKb).assertTrue();
      expect(firstAllocated >= retainedKb(100) * KB && secondAllocated >= retainedKb(100) * KB).assertTrue();
      expect(firstIntact && retainedPayloadHolds(first, 100)).assertTrue();
      expect(retainedPayloadHolds(second, 100)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_VMMEMORY_0500
     * @tc.name      testVmMemoryGarbageBounded0001
     * @tc.desc      Allocate garbage that is never kept and check the used heap grows far less than the bytes thrown
     *               away
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmMemoryGarbageBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: HeapSnapshot = new HeapSnapshot();
      let sink: number = 0;
      for (let round = 0; round < SAMPLE_ROUNDS; round++) {
        sink += retainArrays(20, RETAIN_LENGTH).length;
        await paceTurn();
      }
      const after: HeapSnapshot = new HeapSnapshot();
      const thrownKb: number = retainedKb(20) * SAMPLE_ROUNDS;
      logCase('testVmMemoryGarbageBounded0001', `sink=${sink} thrownKb=${thrownKb} beforeUsedKb=${before.usedKb} ` +
        `afterUsedKb=${after.usedKb} afterTotalKb=${after.totalKb}`);
      expect(sink).assertEqual(20 * SAMPLE_ROUNDS);
      expect(after.usedKb - before.usedKb < thrownKb / 2).assertTrue();
      expect(after.usedKb <= after.totalKb).assertTrue();
    });
  });
}
