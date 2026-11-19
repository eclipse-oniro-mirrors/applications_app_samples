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
import { allocatePressure, COLLECT_ROUNDS, HeapSnapshot, KB, retainArrays, runGcCycles } from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const RETAIN_LENGTH: number = 10000;
const DOUBLE_BYTES: number = 8;
const SAMPLE_ROUNDS: number = 20;

function retainedKb(count: number): number {
  return count * RETAIN_LENGTH * DOUBLE_BYTES / KB;
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
     * @tc.desc      Keep about sixteen megabytes of number arrays and check the used heap grows by at least half of
     *               that
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testVmMemoryRetainGrows0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      // collect leftovers of earlier cases first so releasing them hides less of the growth
      await runGcCycles(1, COLLECT_ROUNDS);
      const before: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(200, RETAIN_LENGTH);
      await paceTurn();
      const after: HeapSnapshot = new HeapSnapshot();
      logCase('testVmMemoryRetainGrows0001', `keptLength=${kept.length} lastLength=${kept[199].length} ` +
        `beforeUsedKb=${before.usedKb} afterUsedKb=${after.usedKb} afterTotalKb=${after.totalKb}`);
      expect(kept[199].length).assertEqual(RETAIN_LENGTH);
      expect(after.usedKb - before.usedKb >= retainedKb(200) / 2).assertTrue();
      expect(after.usedKb <= after.totalKb).assertTrue();
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
     * @tc.desc      Keep eight then sixteen megabytes and check the heap grows at each step and by at least half of the
     *               total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testVmMemoryScaled0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(1, COLLECT_ROUNDS);
      const base: HeapSnapshot = new HeapSnapshot();
      const first: number[][] = retainArrays(100, RETAIN_LENGTH);
      await paceTurn();
      const middle: HeapSnapshot = new HeapSnapshot();
      const second: number[][] = retainArrays(100, RETAIN_LENGTH);
      await paceTurn();
      const top: HeapSnapshot = new HeapSnapshot();
      logCase('testVmMemoryScaled0001', `firstLength=${first.length} secondLength=${second.length} ` +
        `usedKb=${base.usedKb}/${middle.usedKb}/${top.usedKb} topTotalKb=${top.totalKb}`);
      expect(first.length + second.length).assertEqual(200);
      expect(middle.usedKb - base.usedKb >= retainedKb(100) / 4).assertTrue();
      expect(top.usedKb - base.usedKb >= retainedKb(200) / 2).assertTrue();
      expect(top.usedKb > middle.usedKb && top.totalKb >= top.usedKb).assertTrue();
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
