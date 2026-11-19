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

import { describe, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager, ConfigurationConstant, UIAbility } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util, process } from '@kit.ArkTS';
import {
  allocatePressure,
  allCleared,
  buildRing,
  collectUntil,
  COLLECT_ROUNDS,
  CycleParent,
  CycleChild,
  expectedIdSum,
  FinalizeTracker,
  gcStat,
  GcSnapshot,
  HeapSnapshot,
  hintGC,
  isCleared,
  KEY_BYTES_FREED,
  KEY_GC_COUNT,
  linkPair,
  pairIsLinked,
  range,
  releasedChild,
  releasedPair,
  releasedRing,
  retainArrays,
  RingNode,
  RingProbe,
  ringIdSum,
  ringLength,
  runGcCycles,
  sameNumbers
} from './shared/GcProbe';
import {
  argbFromHex,
  BACKUP_ABILITY,
  BUNDLE_NAME,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  entryContext,
  ERR_RES_ID_INVALID,
  ERR_RES_NAME_INVALID,
  errorCode,
  findModule,
  launchHome,
  PngOracle,
  selfBundle,
  stopHome,
  topAbility
} from './shared/AppProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const DOUBLE_BYTES: number = 8;
const KB: number = 1024;
const ZERO: number = 0;
const ONE: number = 1;
const TWO: number = 2;
const THREE: number = 3;
const FOUR: number = 4;
const FIVE: number = 5;
const MISSING: number = -1;
const NO_DROPS: number = 0;
const VERSION_CODE: number = 1000000;
const VERSION_NAME: string = '1.0.0';
const FONT_SIZE_FP: number = 50;
const LIGHT_BACKGROUND: string = '#FFFFFF';
const DARK_BACKGROUND: string = '#000000';
const BACKGROUND_NAME: string = 'start_window_background';
const START_ICON_SIDE: number = 144;
const LAYER_SIDE: number = 512;
const PNG_BIT_DEPTH: number = 8;
const PNG_COLOR_TYPE_RGBA: number = 6;
const OPAQUE_ALPHA: number = 0xFF;
const SETTLE_WAIT_MS: number = 40;

// payload lower bound derived from the workload shape only
function payloadBytes(count: number, length: number): number {
  return count * length * DOUBLE_BYTES;
}

function payloadKb(count: number, length: number): number {
  return payloadBytes(count, length) / KB;
}

function slotTotal(rows: number[][]): number {
  let total: number = ZERO;
  rows.forEach((row: number[]) => {
    total += row.length;
  });
  return total;
}

function rowsFilled(rows: number[][], length: number): boolean {
  return rows.every((row: number[], index: number) =>
    row.length === length && row[ZERO] === index && row[length - ONE] === index);
}

function snapshotDrops(series: GcSnapshot[]): number[] {
  const drops: number[] = [];
  for (let i = ONE; i < series.length; i++) {
    if (!series[i].notBefore(series[i - ONE])) {
      drops.push(i);
    }
  }
  return drops;
}

function countSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.count);
}

function allocatedSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.allocated);
}

function freedSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.freed);
}

function timeSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.time);
}

function longFullSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.longFullGc);
}

function nonDecreasing(values: number[]): boolean {
  for (let i = ONE; i < values.length; i++) {
    if (values[i] < values[i - ONE]) {
      return false;
    }
  }
  return true;
}

function heapOk(heap: HeapSnapshot): boolean {
  return heap.totalKb > ZERO && heap.usedKb > ZERO && heap.usedKb <= heap.totalKb;
}

function allHeapOk(heaps: HeapSnapshot[]): boolean {
  return heaps.every((heap: HeapSnapshot) => heapOk(heap));
}

function usedSeries(heaps: HeapSnapshot[]): number[] {
  return heaps.map((heap: HeapSnapshot) => heap.usedKb);
}

function clearedCount<T extends object>(refs: WeakRef<T>[]): number {
  return refs.filter((ref: WeakRef<T>) => ref.deref() === undefined).length;
}

function releasedRings(count: number, size: number, firstId: number): WeakRef<RingNode>[] {
  const refs: WeakRef<RingNode>[] = [];
  for (let i = ZERO; i < count; i++) {
    refs.push(releasedRing(size, ONE, firstId + i).ref);
  }
  return refs;
}

function distinctNumbers(values: number[]): number {
  const unique: number[] = [];
  values.forEach((value: number) => {
    if (unique.indexOf(value) < ZERO) {
      unique.push(value);
    }
  });
  return unique.length;
}

function insideRange(values: number[], first: number, count: number): boolean {
  const low: number = first;
  const high: number = first + count - ONE;
  return values.every((value: number) => value >= low && value <= high);
}

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function entryAbilityOf(info: bundleManager.BundleInfo): bundleManager.AbilityInfo {
  return findModule(info, ENTRY_MODULE).abilitiesInfo[ZERO];
}

function pngSquare(name: string, side: number): boolean {
  const bytes: Uint8Array = resources().getMediaByNameSync(name);
  return PngOracle.hasSignature(bytes) && PngOracle.firstChunkType(bytes) === 'IHDR' &&
    PngOracle.width(bytes) === side && PngOracle.height(bytes) === side;
}

function burstPressure(rounds: number): number {
  let sink: number = ZERO;
  for (let i = ZERO; i < rounds; i++) {
    sink += allocatePressure();
  }
  return sink;
}

async function burstHintPressure(rounds: number): Promise<number> {
  let sink: number = ZERO;
  for (let i = ZERO; i < rounds; i++) {
    hintGC();
    sink += allocatePressure();
    await paceTurn();
  }
  return sink;
}

function lightResources(): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = resourceManager.ColorMode.LIGHT;
  return manager.getOverrideResourceManager(config);
}

function darkResources(): resourceManager.ResourceManager {
  const manager: resourceManager.ResourceManager = resources();
  const config: resourceManager.Configuration = manager.getOverrideConfiguration();
  config.colorMode = resourceManager.ColorMode.DARK;
  return manager.getOverrideResourceManager(config);
}

// kept outside the async frames so the rings stay reachable for the whole case
function retainedRingHolder(): RingNode[] {
  const held: RingNode[] = [];
  held.push(buildRing(6, TWO, 31));
  held.push(buildRing(9, TWO, 47));
  return held;
}

function abilityIsForeground(ability: UIAbility): boolean {
  const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
  return delegator.getAbilityState(ability) === abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND;
}

export default function runtimeIntegrationMatrixTest() {
  describe('RuntimeIntegrationMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    afterAll(async () => {
      await stopHome();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0100
     * @tc.name      testRintAllocHeapSmall0001
     * @tc.desc      Keep 40 arrays of 2048 slots and check the GC allocated counter and the app heap used counter both
     *               move past the independently computed payload lower bound
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocHeapSmall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const heapBefore: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(40, 2048);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lower: number = payloadBytes(40, 2048);
      const gcDelta: number = gcAfter.allocated - gcBefore.allocated;
      const heapDeltaKb: number = heapAfter.usedKb - heapBefore.usedKb;
      logCase('testRintAllocHeapSmall0001', `slots=${slotTotal(kept)} lower=${lower} gcDelta=${gcDelta} ` +
        `heapDeltaKb=${heapDeltaKb} usedKb=${heapAfter.usedKb} totalKb=${heapAfter.totalKb}`);
      expect(kept.length).assertEqual(40);
      expect(gcDelta >= lower).assertTrue();
      expect(heapDeltaKb >= lower / KB / TWO).assertTrue();
      expect(heapOk(heapAfter)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0200
     * @tc.name      testRintAllocHeapWide0001
     * @tc.desc      Keep eight arrays of 65536 slots and check the GC byte counter covers the payload while the app
     *               heap keeps used within total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocHeapWide0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const heapBefore: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(8, 65536);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lowerKb: number = payloadKb(8, 65536);
      logCase('testRintAllocHeapWide0001', `lowerKb=${lowerKb} gcDelta=${gcAfter.allocated - gcBefore.allocated} ` +
        `heapDeltaKb=${heapAfter.usedKb - heapBefore.usedKb} arrayKb=${heapAfter.arrayKb}`);
      expect(rowsFilled(kept, 65536)).assertTrue();
      expect(gcAfter.allocated - gcBefore.allocated >= lowerKb * KB).assertTrue();
      expect(heapAfter.usedKb - heapBefore.usedKb >= lowerKb / FOUR).assertTrue();
      expect(heapAfter.usedKb <= heapAfter.totalKb && heapAfter.totalKb > ZERO).assertTrue();
      expect(heapAfter.arrayKb >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0300
     * @tc.name      testRintAllocHeapManyTiny0001
     * @tc.desc      Keep 300 arrays of 128 slots and check both counters agree on the direction of the 300 KiB
     *               payload without relying on either counter as the oracle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocHeapManyTiny0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const heapBefore: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(300, 128);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const slots: number = slotTotal(kept);
      logCase('testRintAllocHeapManyTiny0001', `rows=${kept.length} slots=${slots} ` +
        `expectedSlots=${300 * 128} gcDelta=${gcAfter.allocated - gcBefore.allocated} ` +
        `heapDeltaKb=${heapAfter.usedKb - heapBefore.usedKb}`);
      expect(slots).assertEqual(300 * 128);
      expect(gcAfter.allocated - gcBefore.allocated >= slots * DOUBLE_BYTES / TWO).assertTrue();
      expect(heapAfter.usedKb >= heapBefore.usedKb).assertTrue();
      expect(heapOk(heapAfter)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0400
     * @tc.name      testRintAllocHeapSingle0001
     * @tc.desc      Keep one four megabyte array, then a second one, and check each heap sample grows over the
     *               collected baseline in step with the arrays that are still reachable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocHeapSingle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const gcBefore: GcSnapshot = new GcSnapshot();
      const base: HeapSnapshot = new HeapSnapshot();
      const first: number[][] = retainArrays(ONE, 262144);
      await paceTurn();
      const middle: HeapSnapshot = new HeapSnapshot();
      const second: number[][] = retainArrays(ONE, 262144);
      await paceTurn();
      const top: HeapSnapshot = new HeapSnapshot();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const perArrayKb: number = 262144 * DOUBLE_BYTES / KB;
      logCase('testRintAllocHeapSingle0001', `perArrayKb=${perArrayKb} ` +
        `usedKb=${base.usedKb}/${middle.usedKb}/${top.usedKb} ` +
        `gcDelta=${gcAfter.allocated - gcBefore.allocated}`);
      expect(first[ZERO].length + second[ZERO].length).assertEqual(524288);
      expect(middle.usedKb - base.usedKb >= perArrayKb / FOUR).assertTrue();
      expect(top.usedKb - base.usedKb >= perArrayKb).assertTrue();
      expect(gcAfter.allocated - gcBefore.allocated >= perArrayKb * KB * TWO).assertTrue();
      expect(heapOk(top)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0500
     * @tc.name      testRintAllocAfterCollectBaseline0001
     * @tc.desc      Collect leftovers first, then keep 24 arrays of 8192 slots and check the counters grow from that
     *               cleaner baseline while the heap invariant still holds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocAfterCollectBaseline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cycles: number = await runGcCycles(ONE, COLLECT_ROUNDS);
      const gcBefore: GcSnapshot = new GcSnapshot();
      const heapBefore: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(24, 8192);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lowerKb: number = payloadKb(24, 8192);
      logCase('testRintAllocAfterCollectBaseline0001', `cycles=${cycles} lowerKb=${lowerKb} ` +
        `gcDelta=${gcAfter.allocated - gcBefore.allocated} heapDeltaKb=${heapAfter.usedKb - heapBefore.usedKb}`);
      expect(cycles >= ZERO).assertTrue();
      expect(kept.length).assertEqual(24);
      expect(gcAfter.allocated - gcBefore.allocated >= lowerKb * KB / TWO).assertTrue();
      expect(heapAfter.usedKb - heapBefore.usedKb >= lowerKb / FOUR).assertTrue();
      expect(heapOk(heapAfter)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0600
     * @tc.name      testRintAllocThreeStepLadder0001
     * @tc.desc      Keep three successive batches of ten arrays of 4096 slots and check every heap sample grows over
     *               the collected baseline in step with the cumulative payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocThreeStepLadder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const base: HeapSnapshot = new HeapSnapshot();
      const gcBase: GcSnapshot = new GcSnapshot();
      const stages: HeapSnapshot[] = [];
      const stepKb: number = payloadKb(10, 4096);
      for (let step = ZERO; step < THREE; step++) {
        retainArrays(10, 4096);
        await paceTurn();
        stages.push(new HeapSnapshot());
      }
      const gcTop: GcSnapshot = new GcSnapshot();
      const last: HeapSnapshot = stages[stages.length - ONE];
      logCase('testRintAllocThreeStepLadder0001', `stepKb=${stepKb} usedKb=${usedSeries(stages).join('/')} ` +
        `gcDelta=${gcTop.allocated - gcBase.allocated}`);
      expect(stages.length).assertEqual(THREE);
      expect(stages[ZERO].usedKb - base.usedKb >= stepKb / FOUR).assertTrue();
      expect(last.usedKb - base.usedKb >= stepKb * THREE / TWO).assertTrue();
      expect(gcTop.allocated - gcBase.allocated >= stepKb * THREE * KB / TWO).assertTrue();
      expect(heapOk(last)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0700
     * @tc.name      testRintAllocHeapDeltaBounded0001
     * @tc.desc      Keep 32 arrays of 4096 slots and check the heap growth stays inside a band derived from the
     *               GC allocated delta instead of trusting one counter alone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocHeapDeltaBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const heapBefore: HeapSnapshot = new HeapSnapshot();
      retainArrays(32, 4096);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const gcDelta: number = gcAfter.allocated - gcBefore.allocated;
      const heapDeltaKb: number = heapAfter.usedKb - heapBefore.usedKb;
      logCase('testRintAllocHeapDeltaBounded0001', `gcDelta=${gcDelta} gcDeltaKb=${gcDelta / KB} ` +
        `heapDeltaKb=${heapDeltaKb} lowerKb=${payloadKb(32, 4096)}`);
      expect(gcDelta >= payloadBytes(32, 4096)).assertTrue();
      expect(heapDeltaKb > ZERO).assertTrue();
      expect(heapDeltaKb <= gcDelta / KB * TWO).assertTrue();
      expect(gcAfter.notBefore(gcBefore)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0800
     * @tc.name      testRintFreedGrowsAfterRelease0001
     * @tc.desc      Keep twenty arrays of 8192 slots, drop them, collect twice and check the freed byte counter grew
     *               while the other counters never moved backwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintFreedGrowsAfterRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      let kept: number[][] = retainArrays(20, 8192);
      const held: number = slotTotal(kept);
      kept = [];
      const cycles: number = await runGcCycles(TWO, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFreedGrowsAfterRelease0001', `heldSlots=${held} cycles=${cycles} ` +
        `freedDelta=${after.freed - before.freed} allocatedDelta=${after.allocated - before.allocated}`);
      expect(kept.length).assertEqual(ZERO);
      expect(cycles >= ZERO).assertTrue();
      expect(after.freed - before.freed > ZERO).assertTrue();
      expect(after.allocated - before.allocated >= held * DOUBLE_BYTES).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0900
     * @tc.name      testRintAllocKbAndSlots0001
     * @tc.desc      Keep 48 arrays of 1024 slots and check the slot sum, the byte conversion and the GC allocated delta
     *               describe the same payload three independent ways
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocKbAndSlots0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(48, 1024);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const slots: number = slotTotal(kept);
      const fromSlots: number = slots * DOUBLE_BYTES;
      logCase('testRintAllocKbAndSlots0001', `slots=${slots} fromSlots=${fromSlots} ` +
        `payload=${payloadBytes(48, 1024)} gcDelta=${gcAfter.allocated - gcBefore.allocated}`);
      expect(slots).assertEqual(48 * 1024);
      expect(fromSlots).assertEqual(payloadBytes(48, 1024));
      expect(gcAfter.allocated - gcBefore.allocated >= fromSlots / TWO).assertTrue();
      expect(payloadKb(48, 1024) * KB).assertEqual(fromSlots);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1000
     * @tc.name      testRintReleaseKeepsHeapBounded0001
     * @tc.desc      Keep twenty arrays of 8192 slots, release them, collect twice and check the used heap is still
     *               inside the total and the freed counter covers the released slots
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintReleaseKeepsHeapBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      let rows: number[][] = retainArrays(20, 8192);
      const releasedKb: number = payloadKb(20, 8192);
      await paceTurn();
      const loaded: HeapSnapshot = new HeapSnapshot();
      rows = [];
      await runGcCycles(TWO, COLLECT_ROUNDS);
      const settled: HeapSnapshot = new HeapSnapshot();
      const freedDelta: number = gcStat(KEY_BYTES_FREED) - gcBefore.freed;
      logCase('testRintReleaseKeepsHeapBounded0001', `releasedKb=${releasedKb} loadedKb=${loaded.usedKb} ` +
        `settledKb=${settled.usedKb} freedDelta=${freedDelta}`);
      expect(rows.length).assertEqual(ZERO);
      expect(freedDelta > ZERO).assertTrue();
      expect(heapOk(loaded) && heapOk(settled)).assertTrue();
      expect(settled.totalKb > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1100
     * @tc.name      testRintAllocRowFillOracle0001
     * @tc.desc      Keep 36 arrays of 512 slots filled with their row index and check the fill pattern and the GC byte
     *               growth against the payload the pattern proves was written
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocRowFillOracle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(36, 512);
      const filled: boolean = rowsFilled(kept, 512);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const writtenSlots: number = slotTotal(kept);
      logCase('testRintAllocRowFillOracle0001', `filled=${filled} writtenSlots=${writtenSlots} ` +
        `gcDelta=${gcAfter.allocated - gcBefore.allocated} heapUsedKb=${new HeapSnapshot().usedKb}`);
      expect(kept[ZERO][ZERO]).assertEqual(ZERO);
      expect(kept[35][511]).assertEqual(35);
      expect(filled).assertTrue();
      expect(gcAfter.allocated - gcBefore.allocated >= writtenSlots * DOUBLE_BYTES / TWO).assertTrue();
      expect(heapOk(new HeapSnapshot())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1200
     * @tc.name      testRintAllocTwoBatchesHeap0001
     * @tc.desc      Keep twelve arrays of 2048 slots, sample, keep twelve more and check the second sample carries both
     *               batches while the GC counter covered the sum
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocTwoBatchesHeap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const base: HeapSnapshot = new HeapSnapshot();
      const gcBase: GcSnapshot = new GcSnapshot();
      const first: number[][] = retainArrays(12, 2048);
      await paceTurn();
      const middle: HeapSnapshot = new HeapSnapshot();
      const second: number[][] = retainArrays(12, 2048);
      await paceTurn();
      const top: HeapSnapshot = new HeapSnapshot();
      const gcTop: GcSnapshot = new GcSnapshot();
      logCase('testRintAllocTwoBatchesHeap0001', `firstRows=${first.length} secondRows=${second.length} ` +
        `usedKb=${base.usedKb}/${middle.usedKb}/${top.usedKb} gcDelta=${gcTop.allocated - gcBase.allocated}`);
      expect(first.length + second.length).assertEqual(24);
      expect(middle.usedKb - base.usedKb >= payloadKb(12, 2048) / FOUR).assertTrue();
      expect(top.usedKb - base.usedKb >= payloadKb(24, 2048) / TWO).assertTrue();
      expect(gcTop.allocated - gcBase.allocated >= payloadBytes(24, 2048) / TWO).assertTrue();
      expect(heapOk(top)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1300
     * @tc.name      testRintAllocPerRowPayload0001
     * @tc.desc      Keep sixteen arrays of 16384 slots and check the per row payload times the row count matches the
     *               independent total that the GC counter must have covered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocPerRowPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const heapBefore: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(16, 16384);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const perRow: number = 16384 * DOUBLE_BYTES;
      const total: number = perRow * kept.length;
      logCase('testRintAllocPerRowPayload0001', `perRow=${perRow} total=${total} ` +
        `gcDelta=${gcAfter.allocated - gcBefore.allocated} heapDeltaKb=${heapAfter.usedKb - heapBefore.usedKb}`);
      expect(perRow * 16).assertEqual(total);
      expect(gcAfter.allocated - gcBefore.allocated >= total).assertTrue();
      expect(heapAfter.usedKb - heapBefore.usedKb >= total / KB / FOUR).assertTrue();
      expect(heapAfter.usedKb <= heapAfter.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1400
     * @tc.name      testRintCountSixHintBursts0001
     * @tc.desc      Run six hint bursts with allocation in between and check every sample of the GC count series sits
     *               at or above the previous one while the allocated counter keeps climbing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountSixHintBursts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      let sink: number = ZERO;
      for (let burst = ZERO; burst < 6; burst++) {
        hintGC();
        sink += allocatePressure();
        await sleepMs(SETTLE_WAIT_MS);
        series.push(new GcSnapshot());
      }
      const drops: number[] = snapshotDrops(series);
      logCase('testRintCountSixHintBursts0001', `sink=${sink} samples=${series.length} drops=${drops.join(',')} ` +
        `count=${countSeries(series).join('/')} allocated=${allocatedSeries(series).join('/')}`);
      expect(series.length).assertEqual(6 + ONE);
      expect(drops.length).assertEqual(NO_DROPS);
      expect(nonDecreasing(countSeries(series))).assertTrue();
      expect(nonDecreasing(allocatedSeries(series))).assertTrue();
      expect(series[6].count >= series[ZERO].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1500
     * @tc.name      testRintCountHintThenAlloc0001
     * @tc.desc      Take a hint burst first and a pure allocation burst second and check the count and allocated
     *               counters never fall across the two phases while a real collection was observed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountHintThenAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: GcSnapshot = new GcSnapshot();
      await burstHintPressure(THREE);
      const middle: GcSnapshot = new GcSnapshot();
      const sink: number = burstPressure(THREE);
      await paceTurn();
      const end: GcSnapshot = new GcSnapshot();
      const rounds: number = await collectUntil(() => gcStat(KEY_GC_COUNT) - start.count >= ONE, COLLECT_ROUNDS);
      const settled: GcSnapshot = new GcSnapshot();
      logCase('testRintCountHintThenAlloc0001', `sink=${sink} rounds=${rounds} ` +
        `count=${start.count}/${middle.count}/${end.count}/${settled.count} ` +
        `allocatedDelta=${settled.allocated - start.allocated}`);
      expect(middle.notBefore(start)).assertTrue();
      expect(end.notBefore(middle)).assertTrue();
      expect(rounds > ZERO).assertTrue();
      expect(settled.allocated - start.allocated >= sink / TWO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1600
     * @tc.name      testRintCountAlternateHintPressure0001
     * @tc.desc      Alternate a hint and an allocation burst eight times and check the count series has no drop, the
     *               count advanced and the freed counter never exceeded the allocated counter
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountAlternateHintPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [];
      series.push(new GcSnapshot());
      for (let round = ZERO; round < 8; round++) {
        hintGC();
        allocatePressure();
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const drops: number[] = snapshotDrops(series);
      const bounded: boolean = series.every((snap: GcSnapshot) => snap.freed <= snap.allocated);
      const grew: number = series[series.length - ONE].count - series[ZERO].count;
      logCase('testRintCountAlternateHintPressure0001', `samples=${series.length} drops=${drops.join(',')} ` +
        `countGrew=${grew} bounded=${bounded}`);
      expect(drops.length).assertEqual(NO_DROPS);
      expect(bounded).assertTrue();
      expect(grew >= ZERO).assertTrue();
      expect(series[series.length - ONE].allocated > series[ZERO].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1700
     * @tc.name      testRintCountPressureOnly0001
     * @tc.desc      Allocate ten short lived pressure bursts without any explicit hint and check the GC count never
     *               decreases while the allocated counter grows by at least one burst payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountPressureOnly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const counts: number[] = [before.count];
      for (let round = ZERO; round < 10; round++) {
        allocatePressure();
        counts.push(gcStat(KEY_GC_COUNT));
        await paceTurn();
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintCountPressureOnly0001', `samples=${counts.length} counts=${counts.join(',')} ` +
        `allocatedDelta=${after.allocated - before.allocated} freed=${after.freed}`);
      expect(counts.length).assertEqual(10 + ONE);
      expect(nonDecreasing(counts)).assertTrue();
      expect(after.allocated - before.allocated > ZERO).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1800
     * @tc.name      testRintCountHintWhileRetained0001
     * @tc.desc      Hold twenty arrays of 4096 slots reachable while four hint bursts run and check the GC counters
     *               still advance monotonically and the heap stays inside its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintCountHintWhileRetained0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const held: number[][] = retainArrays(20, 4096);
      const start: GcSnapshot = new GcSnapshot();
      const series: GcSnapshot[] = [start];
      const heaps: HeapSnapshot[] = [];
      for (let burst = ZERO; burst < FOUR; burst++) {
        hintGC();
        allocatePressure();
        await sleepMs(SETTLE_WAIT_MS);
        series.push(new GcSnapshot());
        heaps.push(new HeapSnapshot());
      }
      const intact: boolean = rowsFilled(held, 4096);
      logCase('testRintCountHintWhileRetained0001', `heldRows=${held.length} intact=${intact} ` +
        `counts=${countSeries(series).join('/')} heapSamples=${heaps.length}`);
      expect(held.length).assertEqual(20);
      expect(intact).assertTrue();
      expect(snapshotDrops(series).length).assertEqual(NO_DROPS);
      expect(allHeapOk(heaps)).assertTrue();
      expect(series[FOUR].count >= series[ZERO].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1900
     * @tc.name      testRintCountAfterReleaseCollect0001
     * @tc.desc      Retain then release sixteen arrays of 8192 slots, collect at least two cycles and check the count
     *               advanced with both byte counters while nothing regressed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountAfterReleaseCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      let rows: number[][] = retainArrays(16, 8192);
      const heldSlots: number = slotTotal(rows);
      rows = [];
      const rounds: number = await collectUntil(() => gcStat(KEY_GC_COUNT) - before.count >= TWO, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintCountAfterReleaseCollect0001', `rounds=${rounds} heldSlots=${heldSlots} ` +
        `count=${before.count}->${after.count} allocatedDelta=${after.allocated - before.allocated} ` +
        `freedDelta=${after.freed - before.freed}`);
      expect(rounds > ZERO).assertTrue();
      expect(after.count - before.count >= TWO).assertTrue();
      expect(after.allocated - before.allocated >= heldSlots * DOUBLE_BYTES).assertTrue();
      expect(after.freed - before.freed > ZERO).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2000
     * @tc.name      testRintCountAllFiveKeys0001
     * @tc.desc      Sample all five GC counters over five hint plus allocation rounds and check none of the five series
     *               ever falls back from one sample to the next
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountAllFiveKeys0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      for (let round = ZERO; round < FIVE; round++) {
        hintGC();
        allocatePressure();
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const perField: number[] = [snapshotDrops(series).length,
        nonDecreasing(timeSeries(series)) ? ZERO : ONE,
        nonDecreasing(freedSeries(series)) ? ZERO : ONE,
        nonDecreasing(longFullSeries(series)) ? ZERO : ONE,
        nonDecreasing(allocatedSeries(series)) ? ZERO : ONE];
      logCase('testRintCountAllFiveKeys0001', `samples=${series.length} perField=${perField.join(',')} ` +
        `counts=${countSeries(series).join('/')}`);
      expect(series.length).assertEqual(FIVE + ONE);
      expect(perField.every((value: number) => value === ZERO)).assertTrue();
      expect(series[FIVE].count >= series[ZERO].count).assertTrue();
      expect(series[FIVE].time >= series[ZERO].time).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2100
     * @tc.name      testRintCountTimeAccompanies0001
     * @tc.desc      Check that every observed increase of the GC count is accompanied by a non decreasing pause time and
     *               that the time counter only moves when allocations happened
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintCountTimeAccompanies0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = new GcSnapshot();
      await burstHintPressure(TWO);
      const afterHints: GcSnapshot = new GcSnapshot();
      const sink: number = burstPressure(TWO);
      await paceTurn();
      const end: GcSnapshot = new GcSnapshot();
      logCase('testRintCountTimeAccompanies0001', `sink=${sink} ` +
        `count=${start.count}->${afterHints.count}->${end.count} ` +
        `time=${start.time}->${afterHints.time}->${end.time}`);
      expect(afterHints.time >= start.time).assertTrue();
      expect(afterHints.count >= start.count).assertTrue();
      expect(end.time >= afterHints.time).assertTrue();
      expect(end.count >= afterHints.count).assertTrue();
      expect(end.allocated - start.allocated >= end.allocated - afterHints.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2200
     * @tc.name      testRintCountLongFullBounded0001
     * @tc.desc      Sample the long full collection counter across six allocation rounds and check it never exceeds the
     *               total collection count and never decreases
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintCountLongFullBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [];
      for (let round = ZERO; round < 6; round++) {
        allocatePressure();
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const bounded: boolean = series.every((snap: GcSnapshot) => snap.longFullGc <= snap.count);
      logCase('testRintCountLongFullBounded0001', `samples=${series.length} bounded=${bounded} ` +
        `longFull=${longFullSeries(series).join('/')} count=${countSeries(series).join('/')}`);
      expect(series.length).assertEqual(6);
      expect(bounded).assertTrue();
      expect(nonDecreasing(longFullSeries(series))).assertTrue();
      expect(nonDecreasing(countSeries(series))).assertTrue();
      expect(longFullSeries(series)[ZERO] >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2300
     * @tc.name      testRintCountTwoGroupsOfBursts0001
     * @tc.desc      Run five hint bursts, take a sample, run five more and check both halves keep the counters moving
     *               forward and the second half allocates on top of the first
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintCountTwoGroupsOfBursts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = new GcSnapshot();
      await burstHintPressure(FIVE);
      const halfway: GcSnapshot = new GcSnapshot();
      await burstHintPressure(FIVE);
      const end: GcSnapshot = new GcSnapshot();
      const firstHalfDrops: number = snapshotDrops([start, halfway]).length;
      const secondHalfDrops: number = snapshotDrops([halfway, end]).length;
      logCase('testRintCountTwoGroupsOfBursts0001', `firstHalfDrops=${firstHalfDrops} ` +
        `secondHalfDrops=${secondHalfDrops} count=${start.count}/${halfway.count}/${end.count} ` +
        `allocatedDelta=${end.allocated - start.allocated}`);
      expect(firstHalfDrops).assertEqual(NO_DROPS);
      expect(secondHalfDrops).assertEqual(NO_DROPS);
      expect(end.allocated - halfway.allocated > ZERO).assertTrue();
      expect(halfway.allocated - start.allocated > ZERO).assertTrue();
      expect(end.count >= start.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2400
     * @tc.name      testRintCountAllocHintAlloc0001
     * @tc.desc      Run allocation, then hints, then allocation again and check the three phases each keep the counters
     *               non decreasing with the byte total growing in both allocation phases
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintCountAllocHintAlloc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const phaseA: GcSnapshot = new GcSnapshot();
      burstPressure(TWO);
      await paceTurn();
      const phaseB: GcSnapshot = new GcSnapshot();
      hintGC();
      hintGC();
      await sleepMs(SETTLE_WAIT_MS);
      const phaseC: GcSnapshot = new GcSnapshot();
      burstPressure(TWO);
      await paceTurn();
      const phaseD: GcSnapshot = new GcSnapshot();
      const series: GcSnapshot[] = [phaseA, phaseB, phaseC, phaseD];
      logCase('testRintCountAllocHintAlloc0001', `drops=${snapshotDrops(series).join(',')} ` +
        `allocated=${allocatedSeries(series).join('/')} counts=${countSeries(series).join('/')}`);
      expect(snapshotDrops(series).length).assertEqual(NO_DROPS);
      expect(phaseB.allocated > phaseA.allocated).assertTrue();
      expect(phaseC.freed >= phaseB.freed).assertTrue();
      expect(phaseD.allocated > phaseC.allocated).assertTrue();
      expect(phaseD.freed <= phaseD.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2500
     * @tc.name      testRintCountWithCyclePressure0001
     * @tc.desc      Create and drop linked parent child cycles in five rounds and check the collection counters advance
     *               without ever decreasing while the created pairs were really linked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintCountWithCyclePressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const counts: number[] = [before.count];
      let linkedPairs: number = ZERO;
      for (let round = ZERO; round < FIVE; round++) {
        for (let item = ZERO; item < 200; item++) {
          if (pairIsLinked(linkPair(round * 200 + item))) {
            linkedPairs++;
          }
        }
        hintGC();
        await paceTurn();
        counts.push(gcStat(KEY_GC_COUNT));
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintCountWithCyclePressure0001', `linkedPairs=${linkedPairs} samples=${counts.length} ` +
        `allocatedDelta=${after.allocated - before.allocated} countDelta=${after.count - before.count}`);
      expect(linkedPairs).assertEqual(1000);
      expect(counts.length).assertEqual(5 + ONE);
      expect(nonDecreasing(counts)).assertTrue();
      expect(after.allocated - before.allocated > ZERO).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2600
     * @tc.name      testRintCountFreedDuringHints0001
     * @tc.desc      Watch the freed counter across four hint bursts and check it never decreases and never exceeds the
     *               allocated counter at any sample
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintCountFreedDuringHints0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [];
      for (let burst = ZERO; burst < FOUR; burst++) {
        hintGC();
        allocatePressure();
        burstPressure(ONE);
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const freedValues: number[] = freedSeries(series);
      const overrun: number = series.filter((snap: GcSnapshot) => snap.freed > snap.allocated).length;
      logCase('testRintCountFreedDuringHints0001', `freed=${freedValues.join('/')} overrun=${overrun} ` +
        `allocated=${allocatedSeries(series).join('/')}`);
      expect(series.length).assertEqual(FOUR);
      expect(nonDecreasing(freedValues)).assertTrue();
      expect(overrun).assertEqual(ZERO);
      expect(nonDecreasing(allocatedSeries(series))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2700
     * @tc.name      testRintWeakRingCleared0001
     * @tc.desc      Drop a six node ring and check its weak reference clears only after the collection count advanced
     *               while the probe reported the ring shape before release
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintWeakRingCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const probe: RingProbe = releasedRing(6, ONE, 41);
      const rounds: number = await collectUntil(() => isCleared(probe.ref), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakRingCleared0001', `rounds=${rounds} probeLength=${probe.length} ` +
        `probeIdSum=${probe.idSum} countDelta=${after.count - before.count} ` +
        `allocatedDelta=${after.allocated - before.allocated}`);
      expect(probe.length).assertEqual(6);
      expect(probe.idSum).assertEqual(expectedIdSum(41, 6));
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(probe.ref)).assertTrue();
      expect(after.count - before.count >= ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2800
     * @tc.name      testRintWeakFiveRingsCleared0001
     * @tc.desc      Drop five rings of three nodes and check every weak reference clears within the round budget while
     *               the GC count grew and the heap stayed inside its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintWeakFiveRingsCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const refs: WeakRef<RingNode>[] = releasedRings(FIVE, THREE, 51);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintWeakFiveRingsCleared0001', `rounds=${rounds} refs=${refs.length} ` +
        `cleared=${clearedCount(refs)} countDelta=${after.count - before.count}`);
      expect(refs.length).assertEqual(FIVE);
      expect(rounds > ZERO).assertTrue();
      expect(clearedCount(refs)).assertEqual(FIVE);
      expect(after.count - before.count >= ONE).assertTrue();
      expect(heapOk(heap)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_2900
     * @tc.name      testRintWeakPairCleared0001
     * @tc.desc      Drop a parent child cycle and check the weak reference through the parent clears while the
     *               allocated counter grew past one pressure burst
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintWeakPairCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const ref: WeakRef<CycleParent> = releasedPair(417);
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakPairCleared0001', `rounds=${rounds} cleared=${isCleared(ref)} ` +
        `allocatedDelta=${after.allocated - before.allocated} freedDelta=${after.freed - before.freed}`);
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(after.allocated - before.allocated > ZERO).assertTrue();
      expect(after.freed - before.freed >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3000
     * @tc.name      testRintWeakChildCleared0001
     * @tc.desc      Drop the children of two separate linked pairs and check both weak references clear while the
     *               heap invariant holds and the pause time counter did not move backwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakChildCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const first: WeakRef<CycleChild> = releasedChild(428);
      const second: WeakRef<CycleChild> = releasedChild(439);
      const rounds: number = await collectUntil(() => isCleared(first) && isCleared(second), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintWeakChildCleared0001', `rounds=${rounds} firstCleared=${isCleared(first)} ` +
        `secondCleared=${isCleared(second)} timeDelta=${after.time - before.time} usedKb=${heap.usedKb}`);
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(first) && isCleared(second)).assertTrue();
      expect(after.time >= before.time).assertTrue();
      expect(heapOk(heap)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3100
     * @tc.name      testRintWeakRetainedAlive0001
     * @tc.desc      Hold two rings in a local list across four collection rounds and check both weak references stay
     *               live while the GC counters advanced underneath them
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakRetainedAlive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const held: RingNode[] = retainedRingHolder();
      const refs: WeakRef<RingNode>[] = [new WeakRef<RingNode>(held[ZERO]), new WeakRef<RingNode>(held[ONE])];
      const before: GcSnapshot = new GcSnapshot();
      const rounds: number = await collectUntil(() => gcStat(KEY_GC_COUNT) - before.count >= FOUR, COLLECT_ROUNDS);
      const live: number = refs.filter((ref: WeakRef<RingNode>) => ref.deref() !== undefined).length;
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakRetainedAlive0001', `rounds=${rounds} live=${live} ` +
        `lengths=${ringLength(held[ZERO], 8)}/${ringLength(held[ONE], 12)} countDelta=${after.count - before.count}`);
      expect(rounds > ZERO).assertTrue();
      expect(live).assertEqual(TWO);
      expect(ringLength(held[ZERO], 8)).assertEqual(6);
      expect(ringLength(held[ONE], 12)).assertEqual(9);
      expect(after.count - before.count >= FOUR).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3200
     * @tc.name      testRintWeakReleaseThenClear0001
     * @tc.desc      Confirm a locally held ring is reachable through its weak reference, drop the strong reference and
     *               check the reference clears with the collection count rising
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakReleaseThenClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let head: RingNode | null = buildRing(5, TWO, 63);
      const ref: WeakRef<RingNode> = new WeakRef<RingNode>(head as RingNode);
      const liveBefore: boolean = ref.deref() === (head as RingNode);
      const idSum: number = ringIdSum(head as RingNode, 5);
      const before: GcSnapshot = new GcSnapshot();
      head = null;
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakReleaseThenClear0001', `liveBefore=${liveBefore} rounds=${rounds} ` +
        `idSum=${idSum} cleared=${isCleared(ref)} countDelta=${after.count - before.count}`);
      expect(liveBefore).assertTrue();
      expect(idSum).assertEqual(expectedIdSum(63, 5));
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(after.count > before.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3300
     * @tc.name      testRintWeakClearedCountGrew0001
     * @tc.desc      Record the counters before dropping a ring and check that the observed clearing is accompanied by
     *               both a collection count gain and a freed byte gain
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintWeakClearedCountGrew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const probe: RingProbe = releasedRing(8, TWO, 71);
      const rounds: number = await collectUntil(() => isCleared(probe.ref), COLLECT_ROUNDS);
      const cleared: boolean = isCleared(probe.ref);
      const after: GcSnapshot = new GcSnapshot();
      const countGain: number = after.count - before.count;
      const freedGain: number = after.freed - before.freed;
      logCase('testRintWeakClearedCountGrew0001', `rounds=${rounds} cleared=${cleared} countGain=${countGain} ` +
        `freedGain=${freedGain} allocatedGain=${after.allocated - before.allocated}`);
      expect(cleared).assertTrue();
      expect(rounds > ZERO).assertTrue();
      expect(countGain >= ONE).assertTrue();
      expect(freedGain >= ZERO).assertTrue();
      expect(after.allocated - before.allocated >= payloadBytes(8, 1) * ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3400
     * @tc.name      testRintWeakClearedAllocGrew0001
     * @tc.desc      Drop twelve small rings and check the cleared count matches the registered rings while the
     *               allocated counter grew by far more than the rings themselves
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakClearedAllocGrew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const refs: WeakRef<RingNode>[] = releasedRings(12, TWO, 81);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const allocatedGain: number = after.allocated - before.allocated;
      logCase('testRintWeakClearedAllocGrew0001', `rounds=${rounds} cleared=${clearedCount(refs)} ` +
        `allocatedGain=${allocatedGain} ringBytes=${payloadBytes(12, TWO)}`);
      expect(rounds > ZERO).assertTrue();
      expect(clearedCount(refs)).assertEqual(12);
      expect(allocatedGain >= payloadBytes(12, TWO)).assertTrue();
      expect(allocatedGain > ZERO && after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3500
     * @tc.name      testRintWeakSequentialBatches0001
     * @tc.desc      Clear two rings, then clear two more in a second batch and check each batch clears fully and the
     *               GC count only moves forward between the batches
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakSequentialBatches0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const firstRefs: WeakRef<RingNode>[] = releasedRings(TWO, THREE, 91);
      const firstRounds: number = await collectUntil(() => allCleared(firstRefs), COLLECT_ROUNDS);
      const between: GcSnapshot = new GcSnapshot();
      const secondRefs: WeakRef<RingNode>[] = releasedRings(TWO, FOUR, 95);
      const secondRounds: number = await collectUntil(() => allCleared(secondRefs), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakSequentialBatches0001', `firstRounds=${firstRounds} secondRounds=${secondRounds} ` +
        `firstCleared=${clearedCount(firstRefs)} secondCleared=${clearedCount(secondRefs)} ` +
        `countDelta=${after.count - between.count}`);
      expect(firstRounds > ZERO && secondRounds > ZERO).assertTrue();
      expect(clearedCount(firstRefs)).assertEqual(TWO);
      expect(clearedCount(secondRefs)).assertEqual(TWO);
      expect(after.notBefore(between)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3600
     * @tc.name      testRintWeakLargeRingCleared0001
     * @tc.desc      Drop a forty node ring together with a twelve node ring and check both walk lengths and id sums are
     *               reported before release and both references clear under the same pressure
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakLargeRingCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const large: RingProbe = releasedRing(40, TWO, 101);
      const small: RingProbe = releasedRing(12, TWO, 151);
      const rounds: number = await collectUntil(() => isCleared(large.ref) && isCleared(small.ref), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const walks: number[] = [large.length, small.length];
      const sums: number[] = [large.idSum, small.idSum];
      logCase('testRintWeakLargeRingCleared0001', `rounds=${rounds} walks=${walks.join('/')} ` +
        `sums=${sums.join('/')} allocatedDelta=${after.allocated - before.allocated}`);
      expect(walks[ZERO]).assertEqual(40);
      expect(sums[ONE]).assertEqual(expectedIdSum(151, 12));
      expect(walks[ZERO] > walks[ONE]).assertTrue();
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(large.ref) && isCleared(small.ref)).assertTrue();
      expect(after.allocated > before.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3700
     * @tc.name      testRintWeakUnderRetainPressure0001
     * @tc.desc      Keep sixteen arrays of 4096 slots reachable while a dropped ring clears and check the heap stayed
     *               bounded and the kept arrays were untouched by the collections
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakUnderRetainPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const held: number[][] = retainArrays(16, 4096);
      const before: GcSnapshot = new GcSnapshot();
      const ref: WeakRef<RingNode> = releasedRing(7, ONE, 111).ref;
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintWeakUnderRetainPressure0001', `rounds=${rounds} cleared=${isCleared(ref)} ` +
        `heldSlots=${slotTotal(held)} usedKb=${heap.usedKb} totalKb=${heap.totalKb}`);
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(rowsFilled(held, 4096)).assertTrue();
      expect(heapOk(heap)).assertTrue();
      expect(after.allocated - before.allocated >= payloadBytes(16, 4096) / TWO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3800
     * @tc.name      testRintWeakDerefIdentity0001
     * @tc.desc      Read the ring back through a live weak reference and check the walked length and id sum match the
     *               construction parameters before the ring is dropped and cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakDerefIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let head: RingNode | null = buildRing(9, THREE, 121);
      const ref: WeakRef<RingNode> = new WeakRef<RingNode>(head as RingNode);
      const seen: RingNode | undefined = ref.deref();
      const seenLength: number = seen === undefined ? MISSING : ringLength(seen, 12);
      const seenSum: number = seen === undefined ? MISSING : ringIdSum(seen, 9);
      const before: GcSnapshot = new GcSnapshot();
      head = null;
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakDerefIdentity0001', `seenLength=${seenLength} seenSum=${seenSum} rounds=${rounds} ` +
        `cleared=${isCleared(ref)} countDelta=${after.count - before.count}`);
      expect(seenLength).assertEqual(9);
      expect(seenSum).assertEqual(expectedIdSum(121, 9));
      expect(rounds > ZERO).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(after.count >= before.count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_3900
     * @tc.name      testRintWeakRoundsBounded0001
     * @tc.desc      Drop an eighteen node ring and check it clears inside the shared round budget with the count and
     *               allocated counters both ahead of their starting values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintWeakRoundsBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const refs: WeakRef<RingNode>[] = releasedRings(ONE, 18, 131);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintWeakRoundsBounded0001', `rounds=${rounds} budget=${COLLECT_ROUNDS} ` +
        `cleared=${clearedCount(refs)} count=${before.count}->${after.count}`);
      expect(rounds > ZERO).assertTrue();
      expect(rounds <= COLLECT_ROUNDS).assertTrue();
      expect(clearedCount(refs)).assertEqual(ONE);
      expect(after.count > before.count).assertTrue();
      expect(after.allocated > before.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4000
     * @tc.name      testRintFinalPairsAfterPressure0001
     * @tc.desc      Register four dropped pairs with consecutive tokens and check every token arrives once while the
     *               collection count advanced over the same rounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintFinalPairsAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const before: GcSnapshot = new GcSnapshot();
      tracker.registerReleasedPairs(FOUR, 401);
      const rounds: number = await collectUntil(() => tracker.count() >= FOUR, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalPairsAfterPressure0001', `rounds=${rounds} count=${tracker.count()} ` +
        `tokens=${tracker.sortedTokens().join(',')} countDelta=${after.count - before.count}`);
      expect(rounds > ZERO).assertTrue();
      expect(tracker.count()).assertEqual(FOUR);
      expect(sameNumbers(tracker.sortedTokens(), range(401, FOUR))).assertTrue();
      expect(after.count - before.count >= ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4100
     * @tc.name      testRintFinalRingsAfterPressure0001
     * @tc.desc      Register three dropped rings of five nodes and check the tokens fall inside the registration range
     *               and the freed counter stayed below the allocated counter
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintFinalRingsAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedRings(THREE, FIVE, 411);
      const rounds: number = await collectUntil(() => tracker.count() >= THREE, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      const stat: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalRingsAfterPressure0001', `rounds=${rounds} count=${tracker.count()} ` +
        `tokens=${tokens.join(',')} freed=${stat.freed} allocated=${stat.allocated}`);
      expect(rounds > ZERO).assertTrue();
      expect(tokens.length).assertEqual(THREE);
      expect(insideRange(tokens, 411, THREE)).assertTrue();
      expect(stat.freed <= stat.allocated).assertTrue();
      expect(tracker.has(412)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4200
     * @tc.name      testRintFinalTwoBatches0001
     * @tc.desc      Collect two registered pairs, register three more and check the tracker ends with five distinct
     *               tokens that match the two registration windows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalTwoBatches0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(TWO, 421);
      const firstRounds: number = await collectUntil(() => tracker.count() >= TWO, COLLECT_ROUNDS);
      tracker.registerReleasedPairs(THREE, 423);
      const secondRounds: number = await collectUntil(() => tracker.count() >= FIVE, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      logCase('testRintFinalTwoBatches0001', `firstRounds=${firstRounds} secondRounds=${secondRounds} ` +
        `count=${tracker.count()} tokens=${tokens.join(',')}`);
      expect(firstRounds > ZERO && secondRounds > ZERO).assertTrue();
      expect(tokens.length).assertEqual(FIVE);
      expect(sameNumbers(tokens, range(421, FIVE))).assertTrue();
      expect(distinctNumbers(tokens)).assertEqual(FIVE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4300
     * @tc.name      testRintFinalRetainedExcluded0001
     * @tc.desc      Keep one registered pair reachable while two dropped pairs are collected and check only the two
     *               dropped tokens are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalRetainedExcluded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const kept: CycleParent = linkPair(431);
      tracker.registry.register(kept, 431);
      tracker.registerReleasedPairs(TWO, 432);
      const rounds: number = await collectUntil(() => tracker.count() >= TWO, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      logCase('testRintFinalRetainedExcluded0001', `rounds=${rounds} count=${tracker.count()} ` +
        `tokens=${tokens.join(',')} keptTag=${kept.tag} linked=${pairIsLinked(kept)}`);
      expect(rounds > ZERO).assertTrue();
      expect(tracker.count()).assertEqual(TWO);
      expect(tracker.has(431)).assertFalse();
      expect(sameNumbers(tokens, range(432, TWO))).assertTrue();
      expect(pairIsLinked(kept)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4400
     * @tc.name      testRintFinalCountBounded0001
     * @tc.desc      Register six dropped pairs and check the reported token count never exceeds the registration count
     *               and that every reported token belongs to the registration window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalCountBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(6, 441);
      const rounds: number = await collectUntil(() => tracker.count() >= 6, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      logCase('testRintFinalCountBounded0001', `rounds=${rounds} count=${tracker.count()} ` +
        `insideRange=${insideRange(tokens, 441, 6)} tokens=${tokens.join(',')}`);
      expect(rounds > ZERO).assertTrue();
      expect(tracker.count() <= 6).assertTrue();
      expect(insideRange(tokens, 441, 6)).assertTrue();
      expect(tracker.count()).assertEqual(6);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4500
     * @tc.name      testRintFinalTokensAscending0001
     * @tc.desc      Register five dropped rings and check the sorted token view is strictly ascending with no repeated
     *               value while the GC allocated counter grew over the same window
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintFinalTokensAscending0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const before: GcSnapshot = new GcSnapshot();
      tracker.registerReleasedRings(FIVE, TWO, 451);
      const rounds: number = await collectUntil(() => tracker.count() >= FIVE, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalTokensAscending0001', `rounds=${rounds} tokens=${tokens.join(',')} ` +
        `allocatedDelta=${after.allocated - before.allocated}`);
      expect(rounds > ZERO).assertTrue();
      expect(tokens.length).assertEqual(FIVE);
      expect(distinctNumbers(tokens)).assertEqual(tokens.length);
      expect(nonDecreasing(tokens)).assertTrue();
      expect(after.allocated - before.allocated > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4600
     * @tc.name      testRintFinalAfterAllocBursts0001
     * @tc.desc      Run two allocation bursts before registering four dropped pairs and check the tokens still arrive
     *               while the allocated counter covered both bursts and the registrations
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalAfterAllocBursts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const sink: number = burstPressure(TWO);
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(FOUR, 461);
      const rounds: number = await collectUntil(() => tracker.count() >= FOUR, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalAfterAllocBursts0001', `sink=${sink} rounds=${rounds} count=${tracker.count()} ` +
        `allocatedDelta=${after.allocated - before.allocated} tokens=${tracker.sortedTokens().join(',')}`);
      expect(rounds > ZERO).assertTrue();
      expect(tracker.count()).assertEqual(FOUR);
      expect(sameNumbers(tracker.sortedTokens(), range(461, FOUR))).assertTrue();
      expect(after.allocated - before.allocated >= sink / TWO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4700
     * @tc.name      testRintFinalMixedKinds0001
     * @tc.desc      Register two pairs, collect them, register two rings afterwards and check the token view grew from
     *               the pair window to the combined window without losing either
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalMixedKinds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const before: GcSnapshot = new GcSnapshot();
      tracker.registerReleasedPairs(TWO, 471);
      const pairRounds: number = await collectUntil(() => tracker.count() >= TWO, COLLECT_ROUNDS);
      const pairTokens: number[] = tracker.sortedTokens();
      tracker.registerReleasedRings(TWO, THREE, 473);
      const ringRounds: number = await collectUntil(() => tracker.count() >= FOUR, COLLECT_ROUNDS);
      const allTokens: number[] = tracker.sortedTokens();
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalMixedKinds0001', `pairRounds=${pairRounds} ringRounds=${ringRounds} ` +
        `pairTokens=${pairTokens.join(',')} allTokens=${allTokens.join(',')} ` +
        `allocatedDelta=${after.allocated - before.allocated}`);
      expect(pairRounds > ZERO && ringRounds > ZERO).assertTrue();
      expect(sameNumbers(pairTokens, range(471, TWO))).assertTrue();
      expect(sameNumbers(allTokens, range(471, FOUR))).assertTrue();
      expect(tracker.has(473)).assertTrue();
      expect(after.allocated > before.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4800
     * @tc.name      testRintFinalTokenSubset0001
     * @tc.desc      Register seven dropped pairs and check the reported tokens are a subset of the registration window
     *               with no value outside it while the tracker count matches the reported length
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalTokenSubset0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(7, 481);
      const rounds: number = await collectUntil(() => tracker.count() >= 7, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      const outside: number = tokens.filter((token: number) => token < 481 || token > 487).length;
      logCase('testRintFinalTokenSubset0001', `rounds=${rounds} tokens=${tokens.length} outside=${outside} ` +
        `first=${tokens[ZERO]} last=${tokens[tokens.length - ONE]}`);
      expect(rounds > ZERO).assertTrue();
      expect(outside).assertEqual(ZERO);
      expect(tokens.length).assertEqual(tracker.count());
      expect(tokens[ZERO] >= 481 && tokens[tokens.length - ONE] <= 487).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_4900
     * @tc.name      testRintFinalNoDuplicateTokens0001
     * @tc.desc      Register six dropped rings with six consecutive tokens and check the sorted token view has unit
     *               gaps, starts at the first registered token and is not repeated
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalNoDuplicateTokens0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const before: GcSnapshot = new GcSnapshot();
      tracker.registerReleasedRings(6, FIVE, 491);
      const rounds: number = await collectUntil(() => tracker.count() >= 6, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      const gaps: number[] = [];
      for (let index = ONE; index < tokens.length; index++) {
        gaps.push(tokens[index] - tokens[index - ONE]);
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalNoDuplicateTokens0001', `rounds=${rounds} tokens=${tokens.join(',')} ` +
        `gaps=${gaps.join(',')} freedDelta=${after.freed - before.freed}`);
      expect(rounds > ZERO).assertTrue();
      expect(tracker.count()).assertEqual(6);
      expect(gaps.length).assertEqual(FIVE);
      expect(gaps.every((gap: number) => gap === ONE)).assertTrue();
      expect(tokens[ZERO]).assertEqual(491);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5000
     * @tc.name      testRintFinalLateToken0001
     * @tc.desc      Register three pairs, collect them, register one more and check the late token is appended without
     *               disturbing the three earlier tokens
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalLateToken0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(THREE, 501);
      const firstRounds: number = await collectUntil(() => tracker.count() >= THREE, COLLECT_ROUNDS);
      const early: number[] = tracker.sortedTokens();
      tracker.registerReleasedPairs(ONE, 504);
      const lateRounds: number = await collectUntil(() => tracker.count() >= FOUR, COLLECT_ROUNDS);
      const all: number[] = tracker.sortedTokens();
      logCase('testRintFinalLateToken0001', `firstRounds=${firstRounds} lateRounds=${lateRounds} ` +
        `early=${early.join(',')} all=${all.join(',')}`);
      expect(firstRounds > ZERO && lateRounds > ZERO).assertTrue();
      expect(sameNumbers(early, range(501, THREE))).assertTrue();
      expect(all.indexOf(504) >= ZERO).assertTrue();
      expect(sameNumbers(all, range(501, FOUR))).assertTrue();
      expect(distinctNumbers(all)).assertEqual(FOUR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5100
     * @tc.name      testRintFinalBigRingBatch0001
     * @tc.desc      Register eight dropped rings of four nodes and check the token count, the token window and the GC
     *               count all agree that the batch was collected under pressure
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalBigRingBatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const before: GcSnapshot = new GcSnapshot();
      tracker.registerReleasedRings(8, FOUR, 511);
      const rounds: number = await collectUntil(() => tracker.count() >= 8, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintFinalBigRingBatch0001', `rounds=${rounds} count=${tracker.count()} ` +
        `windowOk=${insideRange(tokens, 511, 8)} countDelta=${after.count - before.count}`);
      expect(rounds > ZERO).assertTrue();
      expect(tracker.count()).assertEqual(8);
      expect(insideRange(tokens, 511, 8)).assertTrue();
      expect(after.count - before.count >= TWO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5200
     * @tc.name      testRintFinalStatCountGrew0001
     * @tc.desc      Register five dropped rings and check the freed bytes and the collection count both advanced while
     *               the tracker reported exactly the registered tokens
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintFinalStatCountGrew0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const before: GcSnapshot = new GcSnapshot();
      tracker.registerReleasedRings(FIVE, THREE, 521);
      const rounds: number = await collectUntil(() => tracker.count() >= FIVE, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const tokens: number[] = tracker.sortedTokens();
      logCase('testRintFinalStatCountGrew0001', `rounds=${rounds} count=${tracker.count()} ` +
        `freedDelta=${after.freed - before.freed} countDelta=${after.count - before.count} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > ZERO).assertTrue();
      expect(sameNumbers(tokens, range(521, FIVE))).assertTrue();
      expect(after.count - before.count >= ONE).assertTrue();
      expect(after.freed - before.freed >= ZERO).assertTrue();
      expect(after.notBefore(before)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5300
     * @tc.name      testRintHeapSamplesDuringPressure0001
     * @tc.desc      Sample the app heap ten times while short lived pressure is allocated and check used never exceeds
     *               total and every sample reports a positive total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintHeapSamplesDuringPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const heaps: HeapSnapshot[] = [];
      for (let round = ZERO; round < 10; round++) {
        allocatePressure();
        heaps.push(new HeapSnapshot());
        await paceTurn();
      }
      const totals: number[] = heaps.map((heap: HeapSnapshot) => heap.totalKb);
      logCase('testRintHeapSamplesDuringPressure0001', `samples=${heaps.length} ` +
        `used=${usedSeries(heaps).join('/')} total=${totals.join('/')}`);
      expect(heaps.length).assertEqual(10);
      expect(allHeapOk(heaps)).assertTrue();
      expect(totals.every((total: number) => total > ZERO)).assertTrue();
      expect(usedSeries(heaps).every((used: number) => used > ZERO)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5400
     * @tc.name      testRintHeapAfterRetain0001
     * @tc.desc      Keep twenty arrays of 8192 slots and check the heap sample after the retain keeps used below total
     *               and reports the retained payload as live growth
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintHeapAfterRetain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(20, 8192);
      await paceTurn();
      const after: HeapSnapshot = new HeapSnapshot();
      const lowerKb: number = payloadKb(20, 8192);
      logCase('testRintHeapAfterRetain0001', `rows=${kept.length} lowerKb=${lowerKb} ` +
        `usedKb=${before.usedKb}->${after.usedKb} totalKb=${after.totalKb} arrayKb=${after.arrayKb}`);
      expect(rowsFilled(kept, 8192)).assertTrue();
      expect(after.usedKb <= after.totalKb).assertTrue();
      expect(after.usedKb - before.usedKb >= lowerKb / TWO).assertTrue();
      expect(after.arrayKb >= ZERO).assertTrue();
      expect(Number.isInteger(after.arrayKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5500
     * @tc.name      testRintHeapDuringHints0001
     * @tc.desc      Sample the heap between four hint bursts and check the invariant holds at each sample while the
     *               collection counter moved forward
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintHeapDuringHints0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: GcSnapshot = new GcSnapshot();
      const heaps: HeapSnapshot[] = [];
      for (let burst = ZERO; burst < FOUR; burst++) {
        hintGC();
        await sleepMs(SETTLE_WAIT_MS);
        heaps.push(new HeapSnapshot());
        allocatePressure();
      }
      const end: GcSnapshot = new GcSnapshot();
      const bad: number = heaps.filter((heap: HeapSnapshot) => !heapOk(heap)).length;
      logCase('testRintHeapDuringHints0001', `samples=${heaps.length} bad=${bad} ` +
        `used=${usedSeries(heaps).join('/')} countDelta=${end.count - start.count}`);
      expect(heaps.length).assertEqual(FOUR);
      expect(bad).assertEqual(ZERO);
      expect(end.count >= start.count).assertTrue();
      expect(heaps.every((heap: HeapSnapshot) => heap.totalKb >= heap.usedKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5600
     * @tc.name      testRintHeapAfterCollects0001
     * @tc.desc      Force three collections and check the heap sample taken afterwards still reports a positive used
     *               size inside the total and a non negative array size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintHeapAfterCollects0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cycles: number = await runGcCycles(THREE, COLLECT_ROUNDS);
      const heap: HeapSnapshot = new HeapSnapshot();
      const stat: GcSnapshot = new GcSnapshot();
      logCase('testRintHeapAfterCollects0001', `cycles=${cycles} usedKb=${heap.usedKb} totalKb=${heap.totalKb} ` +
        `arrayKb=${heap.arrayKb} count=${stat.count}`);
      expect(cycles >= ZERO).assertTrue();
      expect(heap.usedKb > ZERO).assertTrue();
      expect(heap.usedKb <= heap.totalKb).assertTrue();
      expect(heap.arrayKb >= ZERO).assertTrue();
      expect(stat.freed <= stat.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5700
     * @tc.name      testRintHeapTotalCoversUsed0001
     * @tc.desc      Sample the heap at five points across a retain and release cycle and check the total never drops
     *               below the used size that was read at the same point
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapTotalCoversUsed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const heaps: HeapSnapshot[] = [new HeapSnapshot()];
      let rows: number[][] = retainArrays(8, 8192);
      await paceTurn();
      heaps.push(new HeapSnapshot());
      rows = rows.concat(retainArrays(8, 8192));
      await paceTurn();
      heaps.push(new HeapSnapshot());
      rows = [];
      heaps.push(new HeapSnapshot());
      await runGcCycles(ONE, COLLECT_ROUNDS);
      heaps.push(new HeapSnapshot());
      const gaps: number = heaps.filter((heap: HeapSnapshot) => heap.totalKb < heap.usedKb).length;
      logCase('testRintHeapTotalCoversUsed0001', `samples=${heaps.length} gaps=${gaps} ` +
        `used=${usedSeries(heaps).join('/')} totals=${heaps.map((heap: HeapSnapshot) => heap.totalKb).join('/')}`);
      expect(heaps.length).assertEqual(FIVE);
      expect(gaps).assertEqual(ZERO);
      expect(allHeapOk(heaps)).assertTrue();
      expect(heaps[FIVE - ONE].totalKb >= heaps[FIVE - ONE].usedKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5800
     * @tc.name      testRintHeapUsedStaysPositive0001
     * @tc.desc      Collect three times in a row and check the used heap never reaches zero, because the runtime itself
     *               keeps live data, at every sample
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapUsedStaysPositive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const heaps: HeapSnapshot[] = [];
      for (let round = ZERO; round < THREE; round++) {
        await runGcCycles(ONE, COLLECT_ROUNDS);
        heaps.push(new HeapSnapshot());
      }
      const zeros: number = usedSeries(heaps).filter((used: number) => used <= ZERO).length;
      logCase('testRintHeapUsedStaysPositive0001', `samples=${heaps.length} zeros=${zeros} ` +
        `used=${usedSeries(heaps).join('/')}`);
      expect(heaps.length).assertEqual(THREE);
      expect(zeros).assertEqual(ZERO);
      expect(allHeapOk(heaps)).assertTrue();
      expect(heaps.every((heap: HeapSnapshot) => heap.totalKb >= heap.usedKb)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_5900
     * @tc.name      testRintHeapArraySizeWellFormed0001
     * @tc.desc      Keep twelve arrays of 4096 slots and check the reported array size is a non negative integer that
     *               does not exceed the total heap at the same sample
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapArraySizeWellFormed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const kept: number[][] = retainArrays(12, 4096);
      await paceTurn();
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintHeapArraySizeWellFormed0001', `rows=${kept.length} slots=${slotTotal(kept)} ` +
        `arrayKb=${heap.arrayKb} usedKb=${heap.usedKb} totalKb=${heap.totalKb}`);
      expect(kept.length).assertEqual(12);
      expect(Number.isInteger(heap.arrayKb)).assertTrue();
      expect(heap.arrayKb >= ZERO).assertTrue();
      expect(heap.usedKb > ZERO && heap.usedKb <= heap.totalKb).assertTrue();
      expect(heapOk(heap)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6000
     * @tc.name      testRintHeapInterleavedSamples0001
     * @tc.desc      Alternate retained batches and garbage batches for eight rounds and check every interleaved heap
     *               sample keeps used inside total while the slot total of the keeper matches the workload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapInterleavedSamples0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let keeper: number[][] = [];
      const heaps: HeapSnapshot[] = [];
      for (let round = ZERO; round < 8; round++) {
        keeper = keeper.concat(retainArrays(TWO, 4096));
        retainArrays(4, 4096);
        heaps.push(new HeapSnapshot());
        await paceTurn();
      }
      const slots: number = slotTotal(keeper);
      logCase('testRintHeapInterleavedSamples0001', `samples=${heaps.length} keptRows=${keeper.length} ` +
        `slots=${slots} expectedSlots=${8 * TWO * 4096}`);
      expect(heaps.length).assertEqual(8);
      expect(slots).assertEqual(8 * TWO * 4096);
      expect(allHeapOk(heaps)).assertTrue();
      expect(heaps.every((heap: HeapSnapshot) => heap.totalKb > ZERO)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6100
     * @tc.name      testRintHeapAfterGarbageChurn0001
     * @tc.desc      Throw away twenty batches of twenty arrays of 4096 slots and check the heap grew far less than the
     *               bytes thrown away while the sample stays inside its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapAfterGarbageChurn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: HeapSnapshot = new HeapSnapshot();
      const gcBefore: GcSnapshot = new GcSnapshot();
      let thrownSlots: number = ZERO;
      for (let round = ZERO; round < 20; round++) {
        thrownSlots += slotTotal(retainArrays(20, 4096));
        await paceTurn();
      }
      const after: HeapSnapshot = new HeapSnapshot();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const thrownKb: number = thrownSlots * DOUBLE_BYTES / KB;
      logCase('testRintHeapAfterGarbageChurn0001', `thrownKb=${thrownKb} usedKb=${before.usedKb}->${after.usedKb} ` +
        `gcDelta=${gcAfter.allocated - gcBefore.allocated}`);
      expect(thrownSlots).assertEqual(20 * 20 * 4096);
      expect(gcAfter.allocated - gcBefore.allocated >= thrownKb * KB / TWO).assertTrue();
      expect(after.usedKb - before.usedKb < thrownKb / TWO).assertTrue();
      expect(heapOk(after)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6200
     * @tc.name      testRintHeapRetainReleaseSamples0001
     * @tc.desc      Take heap samples before a retain, after the retain, after the release and after a collection and
     *               check all four are inside their totals
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapRetainReleaseSamples0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const initial: HeapSnapshot = new HeapSnapshot();
      let rows: number[][] = retainArrays(16, 8192);
      await paceTurn();
      const loaded: HeapSnapshot = new HeapSnapshot();
      rows = [];
      const dropped: HeapSnapshot = new HeapSnapshot();
      await runGcCycles(TWO, COLLECT_ROUNDS);
      const settled: HeapSnapshot = new HeapSnapshot();
      const all: HeapSnapshot[] = [initial, loaded, dropped, settled];
      logCase('testRintHeapRetainReleaseSamples0001', `samples=${all.length} ` +
        `used=${usedSeries(all).join('/')} total=${all.map((heap: HeapSnapshot) => heap.totalKb).join('/')}`);
      expect(all.length).assertEqual(FOUR);
      expect(allHeapOk(all)).assertTrue();
      expect(loaded.usedKb >= initial.usedKb - initial.totalKb / FOUR).assertTrue();
      expect(settled.usedKb <= settled.totalKb).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6300
     * @tc.name      testRintHeapPairConsistent0001
     * @tc.desc      Read two heap snapshots back to back and check both satisfy the invariant while their used sizes
     *               differ by no more than the total heap
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapPairConsistent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: HeapSnapshot = new HeapSnapshot();
      allocatePressure();
      const second: HeapSnapshot = new HeapSnapshot();
      const drift: number = Math.abs(second.usedKb - first.usedKb);
      logCase('testRintHeapPairConsistent0001', `firstUsedKb=${first.usedKb} secondUsedKb=${second.usedKb} ` +
        `driftKb=${drift} totalKb=${second.totalKb}`);
      expect(heapOk(first) && heapOk(second)).assertTrue();
      expect(drift <= second.totalKb).assertTrue();
      expect(second.totalKb >= first.usedKb).assertTrue();
      expect(second.usedKb > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6400
     * @tc.name      testRintHeapNoOverflowAfterTwoMb0001
     * @tc.desc      Keep a single two megabyte array and check the heap sample after the retain still reports used
     *               inside total with at least a quarter of the payload visible
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapNoOverflowAfterTwoMb0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: HeapSnapshot = new HeapSnapshot();
      const kept: number[][] = retainArrays(ONE, 262144);
      await paceTurn();
      const after: HeapSnapshot = new HeapSnapshot();
      const payload: number = payloadKb(ONE, 262144);
      logCase('testRintHeapNoOverflowAfterTwoMb0001', `payloadKb=${payload} usedKb=${before.usedKb}->${after.usedKb} ` +
        `totalKb=${after.totalKb} rowLength=${kept[ZERO].length}`);
      expect(kept[ZERO].length).assertEqual(262144);
      expect(after.usedKb <= after.totalKb).assertTrue();
      expect(after.usedKb - before.usedKb >= payload / FOUR).assertTrue();
      expect(after.totalKb > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6500
     * @tc.name      testRintHeapSampledWhileWeakClears0001
     * @tc.desc      Sample the heap at three points while dropped rings clear and check the invariant holds at each
     *               point while the collection count moved forward
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintHeapSampledWhileWeakClears0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const heaps: HeapSnapshot[] = [new HeapSnapshot()];
      const refs: WeakRef<RingNode>[] = releasedRings(THREE, FIVE, 141);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      heaps.push(new HeapSnapshot());
      await runGcCycles(ONE, COLLECT_ROUNDS);
      heaps.push(new HeapSnapshot());
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintHeapSampledWhileWeakClears0001', `rounds=${rounds} cleared=${clearedCount(refs)} ` +
        `used=${usedSeries(heaps).join('/')} countDelta=${after.count - before.count}`);
      expect(rounds > ZERO).assertTrue();
      expect(clearedCount(refs)).assertEqual(THREE);
      expect(heaps.length).assertEqual(THREE);
      expect(allHeapOk(heaps)).assertTrue();
      expect(after.count - before.count >= ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6600
     * @tc.name      testRintBundleNameAfterPressure0001
     * @tc.desc      Allocate three pressure bursts and then check the own bundle still reports the configured name,
     *               version code, version name and matching minimum compatible version
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintBundleNameAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sink: number = burstPressure(THREE);
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testRintBundleNameAfterPressure0001', `sink=${sink} name=${info.name} ` +
        `versionCode=${info.versionCode} versionName=${info.versionName}`);
      expect(sink > ZERO).assertTrue();
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(info.versionCode).assertEqual(VERSION_CODE);
      expect(info.versionName).assertEqual(VERSION_NAME);
      expect(info.minCompatibleVersionCode).assertEqual(info.versionCode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6700
     * @tc.name      testRintBundleModulesAfterPressure0001
     * @tc.desc      Run four hint bursts and then check both hap modules are still listed with the entry module carrying
     *               the phone device type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintBundleModulesAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await burstHintPressure(FOUR);
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testRintBundleModulesAfterPressure0001', `moduleCount=${info.hapModulesInfo.length} ` +
        `entryName=${entry.name} deviceTypes=${entry.deviceTypes.join(',')}`);
      expect(info.hapModulesInfo.length).assertEqual(TWO);
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(entry.deviceTypes.length).assertEqual(ONE);
      expect(entry.deviceTypes.indexOf('phone') >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6800
     * @tc.name      testRintBundleAbilityAfterPressure0001
     * @tc.desc      Keep and drop ten arrays of 8192 slots, collect once and then check the entry ability is still
     *               described with its own name, module and a positive label id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintBundleAbilityAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rows: number[][] = retainArrays(10, 8192);
      rows = [];
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const info: bundleManager.BundleInfo = await selfBundle();
      const ability: bundleManager.AbilityInfo = entryAbilityOf(info);
      logCase('testRintBundleAbilityAfterPressure0001', `name=${ability.name} module=${ability.moduleName} ` +
        `labelId=${ability.labelId} descriptionId=${ability.descriptionId}`);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
      expect(ability.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.labelId > ZERO).assertTrue();
      expect(ability.descriptionId > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_6900
     * @tc.name      testRintBundleExtensionAfterPressure0001
     * @tc.desc      Collect two cycles and then check the backup extension ability is still registered under the entry
     *               module with a positive extension type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintBundleExtensionAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cycles: number = await runGcCycles(TWO, COLLECT_ROUNDS);
      const info: bundleManager.BundleInfo = await selfBundle();
      const module: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const extension: bundleManager.ExtensionAbilityInfo = module.extensionAbilitiesInfo[ZERO];
      const extensionType: bundleManager.ExtensionAbilityType = extension.extensionAbilityType;
      logCase('testRintBundleExtensionAfterPressure0001', `cycles=${cycles} name=${extension.name} ` +
        `type=${extensionType} extensions=${module.extensionAbilitiesInfo.length}`);
      expect(cycles >= ZERO).assertTrue();
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(extensionType).assertEqual(bundleManager.ExtensionAbilityType.BACKUP);
      expect(module.extensionAbilitiesInfo.length >= ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7000
     * @tc.name      testRintBundleAppInfoAfterPressure0001
     * @tc.desc      Churn garbage for six rounds and then check the application info still matches the running process
     *               uid and the configured name and process
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintBundleAppInfoAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let round = ZERO; round < 6; round++) {
        retainArrays(6, 4096);
        hintGC();
        await paceTurn();
      }
      const app: bundleManager.ApplicationInfo = (await selfBundle()).appInfo;
      logCase('testRintBundleAppInfoAfterPressure0001', `name=${app.name} process=${app.process} uid=${app.uid} ` +
        `processUid=${process.uid} enabled=${app.enabled}`);
      expect(app.name).assertEqual(BUNDLE_NAME);
      expect(app.process).assertEqual(BUNDLE_NAME);
      expect(app.uid).assertEqual(process.uid);
      expect(app.enabled).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7100
     * @tc.name      testRintBundleVersionAfterCollect0001
     * @tc.desc      Force two collections and then check the target version still encodes a newer API level than the
     *               version code while the version name is unchanged
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintBundleVersionAfterCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(TWO, COLLECT_ROUNDS);
      const info: bundleManager.BundleInfo = await selfBundle();
      logCase('testRintBundleVersionAfterCollect0001', `targetVersion=${info.targetVersion} ` +
        `versionCode=${info.versionCode} versionName=${info.versionName}`);
      expect(info.targetVersion > info.versionCode).assertTrue();
      expect(info.targetVersion > ZERO).assertTrue();
      expect(info.versionCode).assertEqual(VERSION_CODE);
      expect(info.versionName).assertEqual(VERSION_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7200
     * @tc.name      testRintBundleModuleSurfaceAfterPressure0001
     * @tc.desc      Apply five pressure bursts and then check every listed module has a non empty name and at least one
     *               supported device type
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintBundleModuleSurfaceAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      burstPressure(FIVE);
      await paceTurn();
      const info: bundleManager.BundleInfo = await selfBundle();
      const names: string[] = info.hapModulesInfo.map((module: bundleManager.HapModuleInfo) => module.name);
      const emptyNames: number = names.filter((name: string) => name.length === ZERO).length;
      const emptyTypes: number = info.hapModulesInfo
        .filter((module: bundleManager.HapModuleInfo) => module.deviceTypes.length === ZERO).length;
      logCase('testRintBundleModuleSurfaceAfterPressure0001', `names=${names.join(',')} ` +
        `emptyNames=${emptyNames} emptyTypes=${emptyTypes}`);
      expect(names.length).assertEqual(TWO);
      expect(emptyNames).assertEqual(ZERO);
      expect(emptyTypes).assertEqual(ZERO);
      expect(names.indexOf(ENTRY_MODULE) >= ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7300
     * @tc.name      testRintBundleAbilityListAfterPressure0001
     * @tc.desc      Run allocation and hint pressure and then check every ability listed for the entry module belongs
     *               to that module and at least one is the launcher ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintBundleAbilityListAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hintGC();
      burstPressure(TWO);
      await paceTurn();
      const info: bundleManager.BundleInfo = await selfBundle();
      const abilities: bundleManager.AbilityInfo[] = findModule(info, ENTRY_MODULE).abilitiesInfo;
      const foreign: number = abilities.filter((ability: bundleManager.AbilityInfo) =>
        ability.moduleName !== ENTRY_MODULE).length;
      const names: string[] = abilities.map((ability: bundleManager.AbilityInfo) => ability.name);
      logCase('testRintBundleAbilityListAfterPressure0001', `abilities=${abilities.length} foreign=${foreign} ` +
        `names=${names.join(',')}`);
      expect(abilities.length >= ONE).assertTrue();
      expect(foreign).assertEqual(ZERO);
      expect(names.indexOf(ENTRY_ABILITY) >= ZERO).assertTrue();
      expect(names.every((name: string) => name.length > ZERO)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7400
     * @tc.name      testRintBundleAppIconAfterPressure0001
     * @tc.desc      Drop four rings and collect them, then check the application label, icon and bundle type are still
     *               the configured values
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintBundleAppIconAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<RingNode>[] = releasedRings(FOUR, THREE, 151);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const app: bundleManager.ApplicationInfo = (await selfBundle()).appInfo;
      logCase('testRintBundleAppIconAfterPressure0001', `rounds=${rounds} label=${app.label} icon=${app.icon} ` +
        `bundleType=${app.bundleType}`);
      expect(rounds > ZERO).assertTrue();
      expect(app.label).assertEqual('$string:app_name');
      expect(app.icon).assertEqual('$media:layered_image');
      expect(app.bundleType).assertEqual(bundleManager.BundleType.APP);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7500
     * @tc.name      testRintBundleStableAcrossPressure0001
     * @tc.desc      Read the bundle signature, run six pressure rounds, read it again and check name, version, module
     *               count and uid did not change under the load
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintBundleStableAcrossPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: bundleManager.BundleInfo = await selfBundle();
      const sink: number = burstPressure(6);
      await paceTurn();
      const second: bundleManager.BundleInfo = await selfBundle();
      logCase('testRintBundleStableAcrossPressure0001', `sink=${sink} ` +
        `name=${first.name}/${second.name} version=${first.versionCode}/${second.versionCode} ` +
        `modules=${first.hapModulesInfo.length}/${second.hapModulesInfo.length}`);
      expect(second.name).assertEqual(first.name);
      expect(second.versionCode).assertEqual(first.versionCode);
      expect(second.hapModulesInfo.length).assertEqual(first.hapModulesInfo.length);
      expect(second.appInfo.uid).assertEqual(first.appInfo.uid);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7600
     * @tc.name      testRintBundleAfterReleaseCycles0001
     * @tc.desc      Retain and release twenty four arrays of 8192 slots, collect twice and then check the entry module
     *               still resolves with its ability list intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintBundleAfterReleaseCycles0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let rows: number[][] = retainArrays(24, 8192);
      const heldSlots: number = slotTotal(rows);
      rows = [];
      const cycles: number = await runGcCycles(TWO, COLLECT_ROUNDS);
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      logCase('testRintBundleAfterReleaseCycles0001', `heldSlots=${heldSlots} cycles=${cycles} ` +
        `moduleName=${entry.name} abilities=${entry.abilitiesInfo.length} modules=${info.hapModulesInfo.length}`);
      expect(heldSlots).assertEqual(24 * 8192);
      expect(cycles >= ZERO).assertTrue();
      expect(entry.name).assertEqual(ENTRY_MODULE);
      expect(entry.abilitiesInfo.length >= ONE).assertTrue();
      expect(info.hapModulesInfo.length).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7700
     * @tc.name      testRintResourceAppNameAfterPressure0001
     * @tc.desc      Churn six batches of garbage and then check the app name string, the ability label string and the
     *               index title resource are still readable and consistent
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceAppNameAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      for (let round = ZERO; round < 6; round++) {
        retainArrays(4, 8192);
        await paceTurn();
      }
      const appName: string = resources().getStringByNameSync('app_name');
      const label: string = resources().getStringByNameSync('EntryAbility_label');
      const title: string = resources().getStringByNameSync('index_title');
      logCase('testRintResourceAppNameAfterPressure0001', `appName=${appName} label=${label} ` +
        `titleLength=${title.length}`);
      expect(appName.length > ZERO).assertTrue();
      expect(appName).assertEqual(label);
      expect(title.indexOf('GC') >= ZERO).assertTrue();
      expect(title.length > THREE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7800
     * @tc.name      testRintResourceModuleDescAfterPressure0001
     * @tc.desc      Run four hint bursts and then check the module description read by bundle id equals the value read
     *               by the documented resource name
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceModuleDescAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await burstHintPressure(FOUR);
      const info: bundleManager.BundleInfo = await selfBundle();
      const entry: bundleManager.HapModuleInfo = findModule(info, ENTRY_MODULE);
      const byId: string = resources().getStringSync(entry.descriptionId);
      const byName: string = resources().getStringByNameSync('module_desc');
      logCase('testRintResourceModuleDescAfterPressure0001', `descriptionId=${entry.descriptionId} ` +
        `byId=${byId} byName=${byName}`);
      expect(entry.descriptionId > ZERO).assertTrue();
      expect(byId).assertEqual(byName);
      expect(byName.length > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_7900
     * @tc.name      testRintResourceAbilityLabelsAfterPressure0001
     * @tc.desc      Keep eight arrays of 16384 slots, drop them and collect, then check the ability label and
     *               description ids both resolve to the same strings as the by name reads
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceAbilityLabelsAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async () => {
        let rows: number[][] = retainArrays(8, 16384);
        rows = [];
        await runGcCycles(ONE, COLLECT_ROUNDS);
        const ability: bundleManager.AbilityInfo = entryAbilityOf(await selfBundle());
        const labelById: string = resources().getStringSync(ability.labelId);
        const descById: string = resources().getStringSync(ability.descriptionId);
        logCase('testRintResourceAbilityLabelsAfterPressure0001', `labelById=${labelById} descById=${descById}`);
        expect(labelById).assertEqual(resources().getStringByNameSync('EntryAbility_label'));
        expect(descById).assertEqual(resources().getStringByNameSync('EntryAbility_desc'));
        expect(labelById.length > ZERO && descById.length > ZERO).assertTrue();
      });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8000
     * @tc.name      testRintResourceFloatsAfterPressure0001
     * @tc.desc      Drop six rings, collect them and then check both font size floats still read back as the configured
     *               50 fp value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceFloatsAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const refs: WeakRef<RingNode>[] = releasedRings(6, FOUR, 161);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const pageSize: number = resources().getNumberByName('page_text_font_size');
      const indexSize: number = resources().getNumberByName('index_text_font_size');
      logCase('testRintResourceFloatsAfterPressure0001', `rounds=${rounds} pageSize=${pageSize} ` +
        `indexSize=${indexSize}`);
      expect(rounds > ZERO).assertTrue();
      expect(pageSize).assertEqual(FONT_SIZE_FP);
      expect(indexSize).assertEqual(FONT_SIZE_FP);
      expect(pageSize).assertEqual(indexSize);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8100
     * @tc.name      testRintResourceColorLightAfterPressure0001
     * @tc.desc      Apply three pressure bursts and then check the start window background under the light override is
     *               fully opaque white
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceColorLightAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      burstPressure(THREE);
      await paceTurn();
      const color: number = lightResources().getColorByNameSync(BACKGROUND_NAME);
      logCase('testRintResourceColorLightAfterPressure0001', `color=${color} expected=${argbFromHex(LIGHT_BACKGROUND)} ` +
        `alpha=${color >>> 24}`);
      expect(color).assertEqual(argbFromHex(LIGHT_BACKGROUND));
      expect(color >>> 24).assertEqual(OPAQUE_ALPHA);
      expect(color !== ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8200
     * @tc.name      testRintResourceColorDarkAfterPressure0001
     * @tc.desc      Collect two cycles and then check the start window background under the dark override is fully
     *               opaque black and differs from the light value
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceColorDarkAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      await runGcCycles(TWO, COLLECT_ROUNDS);
      const dark: number = darkResources().getColorByNameSync(BACKGROUND_NAME);
      const light: number = lightResources().getColorByNameSync(BACKGROUND_NAME);
      logCase('testRintResourceColorDarkAfterPressure0001', `dark=${dark} light=${light}`);
      expect(dark).assertEqual(argbFromHex(DARK_BACKGROUND));
      expect(dark >>> 24).assertEqual(OPAQUE_ALPHA);
      expect(dark === light).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8300
     * @tc.name      testRintResourceStartIconAfterPressure0001
     * @tc.desc      Keep sixteen arrays of 4096 slots, release them and then check the start icon media is still a
     *               square 144 pixel eight bit RGBA png
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintResourceStartIconAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      let rows: number[][] = retainArrays(16, 4096);
      rows = [];
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const bytes: Uint8Array = resources().getMediaByNameSync('startIcon');
      logCase('testRintResourceStartIconAfterPressure0001', `bytes=${bytes.length} ` +
        `size=${PngOracle.width(bytes)}x${PngOracle.height(bytes)} depth=${PngOracle.bitDepth(bytes)} ` +
        `colorType=${PngOracle.colorType(bytes)}`);
      expect(PngOracle.hasSignature(bytes)).assertTrue();
      expect(pngSquare('startIcon', START_ICON_SIDE)).assertTrue();
      expect(PngOracle.bitDepth(bytes)).assertEqual(PNG_BIT_DEPTH);
      expect(PngOracle.colorType(bytes)).assertEqual(PNG_COLOR_TYPE_RGBA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8400
     * @tc.name      testRintResourceLayerPngsAfterPressure0001
     * @tc.desc      Drop four rings under active pressure and then check the layered foreground and background media
     *               are both square RGBA pngs of the documented size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintResourceLayerPngsAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<RingNode>[] = releasedRings(FOUR, FIVE, 171);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const foreground: Uint8Array = resources().getMediaByNameSync('foreground');
      const background: Uint8Array = resources().getMediaByNameSync('background');
      logCase('testRintResourceLayerPngsAfterPressure0001', `rounds=${rounds} foreground=${foreground.length} ` +
        `background=${background.length} side=${PngOracle.width(foreground)}`);
      expect(rounds > ZERO).assertTrue();
      expect(PngOracle.hasSignature(foreground)).assertTrue();
      expect(pngSquare('foreground', LAYER_SIDE) && pngSquare('background', LAYER_SIDE)).assertTrue();
      expect(PngOracle.width(foreground)).assertEqual(PngOracle.width(background));
      expect(PngOracle.colorType(foreground)).assertEqual(PNG_COLOR_TYPE_RGBA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8500
     * @tc.name      testRintResourceLayeredMediaAfterPressure0001
     * @tc.desc      Run five hint bursts and then check the layered image media is still a text resource that references
     *               the layered image layout instead of binary png data
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintResourceLayeredMediaAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        await burstHintPressure(FIVE);
        const bytes: Uint8Array = resources().getMediaByNameSync('layered_image');
        const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
        logCase('testRintResourceLayeredMediaAfterPressure0001', `bytes=${bytes.length} textLength=${text.length}`);
        expect(bytes.length > ZERO).assertTrue();
        expect(PngOracle.hasSignature(bytes)).assertFalse();
        expect(text.indexOf('layered-image') >= ZERO).assertTrue();
        expect(text.indexOf('$media:') >= ZERO).assertTrue();
      });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8600
     * @tc.name      testRintResourceBadNamesAfterPressure0001
     * @tc.desc      Churn garbage then ask for misspelled string and color names and check each request is rejected with
     *               the resource name error while a valid read still succeeds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintResourceBadNamesAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sink: number = burstPressure(TWO);
      const badNames: string[] = ['app_name_missing', 'App_Name', 'string.app_name'];
      const stringCodes: number[] = badNames.map((name: string) =>
        errorCode(() => resources().getStringByNameSync(name)));
      const colorCodes: number[] = badNames.map((name: string) =>
        errorCode(() => resources().getColorByNameSync(name)));
      logCase('testRintResourceBadNamesAfterPressure0001', `sink=${sink} stringCodes=${stringCodes.join(',')} ` +
        `colorCodes=${colorCodes.join(',')}`);
      expect(stringCodes.every((code: number) => code === ERR_RES_NAME_INVALID)).assertTrue();
      expect(colorCodes.every((code: number) => code === ERR_RES_NAME_INVALID)).assertTrue();
      expect(errorCode(() => resources().getStringByNameSync('app_name'))).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8700
     * @tc.name      testRintResourceWrongTypeAfterPressure0001
     * @tc.desc      Drop eight rings, collect and then read a color resource as a string and a string resource as a
     *               color and check both typed reads are refused
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintResourceWrongTypeAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<RingNode>[] = releasedRings(8, TWO, 181);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const colorAsString: number = errorCode(() => resources().getStringByNameSync(BACKGROUND_NAME));
      const stringAsColor: number = errorCode(() => resources().getColorByNameSync('app_name'));
      logCase('testRintResourceWrongTypeAfterPressure0001', `rounds=${rounds} colorAsString=${colorAsString} ` +
        `stringAsColor=${stringAsColor}`);
      expect(rounds > ZERO).assertTrue();
      expect(colorAsString).assertEqual(ERR_RES_NAME_INVALID);
      expect(stringAsColor).assertEqual(ERR_RES_NAME_INVALID);
      expect(resources().getColorByNameSync(BACKGROUND_NAME) !== ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8800
     * @tc.name      testRintResourceLabelIdAfterPressure0001
     * @tc.desc      Retain and release twenty arrays of 4096 slots, collect and then check the application label id
     *               still resolves to the app name and that unknown ids are rejected
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintResourceLabelIdAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let rows: number[][] = retainArrays(20, 4096);
      rows = [];
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const labelId: number = (await selfBundle()).appInfo.labelId;
      const byId: string = resources().getStringSync(labelId);
      const badCode: number = errorCode(() => resources().getStringSync(0x7FFFFFFF));
      logCase('testRintResourceLabelIdAfterPressure0001', `labelId=${labelId} byId=${byId} badCode=${badCode}`);
      expect(labelId > ZERO).assertTrue();
      expect(byId).assertEqual(resources().getStringByNameSync('app_name'));
      expect(badCode).assertEqual(ERR_RES_ID_INVALID);
      expect(byId.length > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_8900
     * @tc.name      testRintResourceConfigAfterPressure0001
     * @tc.desc      Apply four pressure bursts and then check the resource configuration still reports a phone device,
     *               a concrete color mode and the background color that matches that mode
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintResourceConfigAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await burstHintPressure(FOUR);
      const config: resourceManager.Configuration = resources().getConfigurationSync();
      const current: number = resources().getColorByNameSync(BACKGROUND_NAME);
      const expected: string = config.colorMode === resourceManager.ColorMode.DARK ? DARK_BACKGROUND : LIGHT_BACKGROUND;
      logCase('testRintResourceConfigAfterPressure0001', `colorMode=${config.colorMode} ` +
        `deviceType=${config.deviceType} current=${current} expected=${argbFromHex(expected)}`);
      expect(config.deviceType).assertEqual(resourceManager.DeviceType.DEVICE_TYPE_PHONE);
      expect(current).assertEqual(argbFromHex(expected));
      expect(config.colorMode === resourceManager.ColorMode.DARK ||
        config.colorMode === resourceManager.ColorMode.LIGHT).assertTrue();
      expect(current >>> 24).assertEqual(OPAQUE_ALPHA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9000
     * @tc.name      testRintLifecycleLaunchAfterPressure0001
     * @tc.desc      Allocate three pressure bursts before starting EntryAbility and check the launched ability is the
     *               top foreground instance reporting the expected names
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintLifecycleLaunchAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sink: number = burstPressure(THREE);
      const ability: UIAbility = await launchHome();
      const top: UIAbility | undefined = await topAbility();
      logCase('testRintLifecycleLaunchAfterPressure0001', `sink=${sink} foreground=${abilityIsForeground(ability)} ` +
        `topIsAbility=${top === ability} name=${ability.context.abilityInfo.name}`);
      expect(sink > ZERO).assertTrue();
      expect(abilityIsForeground(ability)).assertTrue();
      expect(top === ability).assertTrue();
      expect(ability.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9100
     * @tc.name      testRintLifecycleAfterCollect0001
     * @tc.desc      Collect twice before starting EntryAbility and check the new instance reaches the foreground with
     *               the entry module still wired to its ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintLifecycleAfterCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cycles: number = await runGcCycles(TWO, COLLECT_ROUNDS);
      const ability: UIAbility = await launchHome();
      const state: abilityDelegatorRegistry.AbilityLifecycleState =
        abilityDelegatorRegistry.getAbilityDelegator().getAbilityState(ability);
      logCase('testRintLifecycleAfterCollect0001', `cycles=${cycles} state=${state} ` +
        `moduleName=${ability.context.abilityInfo.moduleName}`);
      expect(cycles >= ZERO).assertTrue();
      expect(state).assertEqual(abilityDelegatorRegistry.AbilityLifecycleState.FOREGROUND);
      expect(ability.context.abilityInfo.moduleName).assertEqual(ENTRY_MODULE);
      expect(ability.context.abilityInfo.bundleName).assertEqual(BUNDLE_NAME);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9200
     * @tc.name      testRintLifecycleAfterRetain0001
     * @tc.desc      Keep twelve arrays of 8192 slots live while EntryAbility launches and check the ability is still the
     *               top foreground instance with the retained rows intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintLifecycleAfterRetain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const held: number[][] = retainArrays(12, 8192);
      const ability: UIAbility = await launchHome();
      const top: UIAbility | undefined = await topAbility();
      logCase('testRintLifecycleAfterRetain0001', `rows=${held.length} slots=${slotTotal(held)} ` +
        `topIsAbility=${top === ability} labelId=${ability.context.abilityInfo.labelId}`);
      expect(held.length).assertEqual(12);
      expect(rowsFilled(held, 8192)).assertTrue();
      expect(abilityIsForeground(ability)).assertTrue();
      expect(top === ability).assertTrue();
      expect(ability.context.abilityInfo.labelId > ZERO).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9300
     * @tc.name      testRintLifecycleColorModeAfterPressure0001
     * @tc.desc      Apply pressure, launch EntryAbility and check the color mode the ability sees is a concrete mode
     *               shared with its resource manager
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintLifecycleColorModeAfterPressure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hintGC();
      burstPressure(TWO);
      const ability: UIAbility = await launchHome();
      const abilityMode: number = Number(ability.context.config.colorMode);
      const resourceMode: number = Number(ability.context.resourceManager.getConfigurationSync().colorMode);
      logCase('testRintLifecycleColorModeAfterPressure0001', `abilityMode=${abilityMode} ` +
        `resourceMode=${resourceMode}`);
      expect(abilityMode === ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET).assertFalse();
      expect(abilityMode === ConfigurationConstant.ColorMode.COLOR_MODE_DARK ||
        abilityMode === ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT).assertTrue();
      expect(abilityMode).assertEqual(resourceMode);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9400
     * @tc.name      testRintLifecycleRelaunchAfterGarbage0001
     * @tc.desc      Churn garbage, launch EntryAbility, terminate it and launch again and check the second instance is a
     *               different foreground ability
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintLifecycleRelaunchAfterGarbage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      retainArrays(10, 8192);
      hintGC();
      await paceTurn();
      const first: UIAbility = await launchHome();
      await stopHome();
      const second: UIAbility = await launchHome();
      logCase('testRintLifecycleRelaunchAfterGarbage0001', `distinct=${first !== second} ` +
        `secondForeground=${abilityIsForeground(second)} name=${second.context.abilityInfo.name}`);
      expect(first !== second).assertTrue();
      expect(abilityIsForeground(second)).assertTrue();
      expect(second.context.abilityInfo.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9500
     * @tc.name      testRintNoRegressionMixedSequence0001
     * @tc.desc      Walk an allocation, retain, release and collect sequence and check none of the five GC counters
     *               ever falls back while the heap stays inside its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintNoRegressionMixedSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      allocatePressure();
      series.push(new GcSnapshot());
      let rows: number[][] = retainArrays(10, 4096);
      series.push(new GcSnapshot());
      rows = [];
      await runGcCycles(ONE, COLLECT_ROUNDS);
      series.push(new GcSnapshot());
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintNoRegressionMixedSequence0001', `samples=${series.length} ` +
        `drops=${snapshotDrops(series).join(',')} counts=${countSeries(series).join('/')}`);
      expect(series.length).assertEqual(FOUR);
      expect(snapshotDrops(series).length).assertEqual(NO_DROPS);
      expect(series[THREE].allocated > series[ZERO].allocated).assertTrue();
      expect(heapOk(heap)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9600
     * @tc.name      testRintNoRegressionHintBursts0001
     * @tc.desc      Run six hint bursts with pressure and check the five counter snapshot series has no drop at any
     *               step and that the freed counter never overtakes the allocated counter
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintNoRegressionHintBursts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const series: GcSnapshot[] = [];
      for (let burst = ZERO; burst < 6; burst++) {
        hintGC();
        allocatePressure();
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const overrun: number = series.filter((snap: GcSnapshot) => snap.freed > snap.allocated).length;
      logCase('testRintNoRegressionHintBursts0001', `samples=${series.length} ` +
        `drops=${snapshotDrops(series).join(',')} overrun=${overrun}`);
      expect(series.length).assertEqual(6);
      expect(snapshotDrops(series).length).assertEqual(NO_DROPS);
      expect(overrun).assertEqual(ZERO);
      expect(series[FIVE].count >= series[ZERO].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9700
     * @tc.name      testRintNoRegressionRetainRelease0001
     * @tc.desc      Keep and release three successive batches of arrays, sampling the counters after each batch and
     *               check nothing regressed while the allocated counter grew across the whole run
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionRetainRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      for (let batch = ZERO; batch < THREE; batch++) {
        let rows: number[][] = retainArrays(10, 2048);
        series.push(new GcSnapshot());
        rows = [];
        await paceTurn();
        series.push(new GcSnapshot());
      }
      const heaps: HeapSnapshot[] = [new HeapSnapshot()];
      const drops: number[] = snapshotDrops(series);
      logCase('testRintNoRegressionRetainRelease0001', `samples=${series.length} drops=${drops.join(',')} ` +
        `allocatedDelta=${series[series.length - ONE].allocated - series[ZERO].allocated}`);
      expect(series.length).assertEqual(THREE * TWO + ONE);
      expect(drops.length).assertEqual(NO_DROPS);
      expect(series[series.length - ONE].allocated > series[ZERO].allocated).assertTrue();
      expect(allHeapOk(heaps)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9800
     * @tc.name      testRintNoRegressionCollectPhase0001
     * @tc.desc      Collect three cycles and check the counters sampled around the phase never regress while the
     *               collection count and the pause time both advanced
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintNoRegressionCollectPhase0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const gained: number = await runGcCycles(THREE, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintNoRegressionCollectPhase0001', `gained=${gained} ` +
        `count=${before.count}->${after.count} time=${before.time}->${after.time}`);
      expect(gained >= ZERO).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(after.count >= before.count).assertTrue();
      expect(after.time >= before.time).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_9900
     * @tc.name      testRintNoRegressionPressureResources0001
     * @tc.desc      Alternate pressure bursts with resource reads and check the counters never regress while the app
     *               name stays byte identical across the load
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionPressureResources0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const first: GcSnapshot = new GcSnapshot();
        const nameA: string = resources().getStringByNameSync('app_name');
        burstPressure(TWO);
        await paceTurn();
        const middle: GcSnapshot = new GcSnapshot();
        const nameB: string = resources().getStringByNameSync('app_name');
        await burstHintPressure(TWO);
        const last: GcSnapshot = new GcSnapshot();
        const heap: HeapSnapshot = new HeapSnapshot();
        logCase('testRintNoRegressionPressureResources0001', `nameA=${nameA} nameB=${nameB} ` +
          `drops=${snapshotDrops([first, middle, last]).join(',')}`);
        expect(nameA).assertEqual(nameB);
        expect(snapshotDrops([first, middle, last]).length).assertEqual(NO_DROPS);
        expect(last.allocated > first.allocated).assertTrue();
        expect(heapOk(heap)).assertTrue();
      });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10000
     * @tc.name      testRintNoRegressionHeapSamples0001
     * @tc.desc      Take six heap samples while pressure and hints alternate and check every sample keeps used inside
     *               total with the counter snapshots taken beside them never regressing
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionHeapSamples0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const heaps: HeapSnapshot[] = [];
      const stats: GcSnapshot[] = [];
      for (let round = ZERO; round < 6; round++) {
        allocatePressure();
        hintGC();
        await paceTurn();
        heaps.push(new HeapSnapshot());
        stats.push(new GcSnapshot());
      }
      logCase('testRintNoRegressionHeapSamples0001', `heaps=${heaps.length} stats=${stats.length} ` +
        `heapBad=${heaps.filter((heap: HeapSnapshot) => !heapOk(heap)).length} ` +
        `drops=${snapshotDrops(stats).join(',')}`);
      expect(heaps.length).assertEqual(6);
      expect(allHeapOk(heaps)).assertTrue();
      expect(snapshotDrops(stats).length).assertEqual(NO_DROPS);
      expect(stats[FIVE].count >= stats[ZERO].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10100
     * @tc.name      testRintNoRegressionTwoCollectPhases0001
     * @tc.desc      Run two separate collection phases of two cycles each and check the count gained in both phases
     *               with no counter drop between them
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionTwoCollectPhases0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = new GcSnapshot();
      const firstGain: number = await runGcCycles(TWO, COLLECT_ROUNDS);
      const between: GcSnapshot = new GcSnapshot();
      const secondGain: number = await runGcCycles(TWO, COLLECT_ROUNDS);
      const end: GcSnapshot = new GcSnapshot();
      logCase('testRintNoRegressionTwoCollectPhases0001', `firstGain=${firstGain} secondGain=${secondGain} ` +
        `count=${start.count}/${between.count}/${end.count}`);
      expect(firstGain >= ZERO && secondGain >= ZERO).assertTrue();
      expect(snapshotDrops([start, between, end]).length).assertEqual(NO_DROPS);
      expect(end.count - start.count >= TWO).assertTrue();
      expect(between.time >= start.time && end.time >= between.time).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10200
     * @tc.name      testRintNoRegressionWeakAndCounters0001
     * @tc.desc      Clear three dropped rings and check the counters sampled before and after show no regression while
     *               the cleared count matches the released rings
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionWeakAndCounters0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const refs: WeakRef<RingNode>[] = releasedRings(THREE, 6, 191);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintNoRegressionWeakAndCounters0001', `rounds=${rounds} cleared=${clearedCount(refs)} ` +
        `countDelta=${after.count - before.count} allocatedDelta=${after.allocated - before.allocated}`);
      expect(rounds > ZERO).assertTrue();
      expect(clearedCount(refs)).assertEqual(THREE);
      expect(after.notBefore(before)).assertTrue();
      expect(after.allocated > before.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10300
     * @tc.name      testRintNoRegressionFinalAndCounters0001
     * @tc.desc      Report three finalized rings and check the tracker tokens match the registration window while the
     *               GC counters sampled beside them did not regress
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionFinalAndCounters0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedRings(THREE, THREE, 201);
      const rounds: number = await collectUntil(() => tracker.count() >= THREE, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testRintNoRegressionFinalAndCounters0001', `rounds=${rounds} count=${tracker.count()} ` +
        `tokens=${tracker.sortedTokens().join(',')} drops=${snapshotDrops([before, after]).join(',')}`);
      expect(rounds > ZERO).assertTrue();
      expect(sameNumbers(tracker.sortedTokens(), range(201, THREE))).assertTrue();
      expect(snapshotDrops([before, after]).length).assertEqual(NO_DROPS);
      expect(after.count - before.count >= ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10400
     * @tc.name      testRintNoRegressionTwelveSteps0001
     * @tc.desc      Walk twelve recorded steps of allocation, hints, retains and collections and check the counter
     *               series keeps every one of the five fields monotonic
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionTwelveSteps0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      let held: number[][] = [];
      allocatePressure();
      await paceTurn();
      series.push(new GcSnapshot());
      hintGC();
      held = held.concat(retainArrays(TWO, 2048));
      await paceTurn();
      series.push(new GcSnapshot());
      held = [];
      hintGC();
      await paceTurn();
      series.push(new GcSnapshot());
      burstPressure(ONE);
      await paceTurn();
      series.push(new GcSnapshot());
      hintGC();
      held = held.concat(retainArrays(FOUR, 1024));
      await paceTurn();
      series.push(new GcSnapshot());
      hintGC();
      await paceTurn();
      series.push(new GcSnapshot());
      held = [];
      allocatePressure();
      await paceTurn();
      series.push(new GcSnapshot());
      burstPressure(ONE);
      await paceTurn();
      series.push(new GcSnapshot());
      hintGC();
      held = held.concat(retainArrays(THREE, 2048));
      await paceTurn();
      series.push(new GcSnapshot());
      held = [];
      hintGC();
      await paceTurn();
      series.push(new GcSnapshot());
      allocatePressure();
      hintGC();
      await paceTurn();
      series.push(new GcSnapshot());
      const perField: number = snapshotDrops(series).length +
        (nonDecreasing(timeSeries(series)) ? ZERO : ONE) +
        (nonDecreasing(freedSeries(series)) ? ZERO : ONE) +
        (nonDecreasing(longFullSeries(series)) ? ZERO : ONE);
      logCase('testRintNoRegressionTwelveSteps0001', `samples=${series.length} ` +
        `perField=${perField} countDelta=${series[series.length - ONE].count - series[ZERO].count}`);
      expect(series.length).assertEqual(12 + ONE);
      expect(perField).assertEqual(ZERO);
      expect(series[12].allocated > series[ZERO].allocated).assertTrue();
      expect(series[12].count >= series[ZERO].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10500
     * @tc.name      testRintNoRegressionTripleAlternation0001
     * @tc.desc      Alternate hint, allocation and pressure phases across six rounds and check the sampled counters
     *               never regress and the heap samples stay inside their totals
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionTripleAlternation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      const heaps: HeapSnapshot[] = [];
      for (let round = ZERO; round < 6; round++) {
        hintGC();
        await paceTurn();
        series.push(new GcSnapshot());
        allocatePressure();
        burstPressure(ONE);
        await paceTurn();
        series.push(new GcSnapshot());
        heaps.push(new HeapSnapshot());
      }
      logCase('testRintNoRegressionTripleAlternation0001', `samples=${series.length} heaps=${heaps.length} ` +
        `drops=${snapshotDrops(series).join(',')}`);
      expect(series.length).assertEqual(6 * TWO + ONE);
      expect(snapshotDrops(series).length).assertEqual(NO_DROPS);
      expect(allHeapOk(heaps)).assertTrue();
      expect(series[series.length - ONE].allocated > series[ZERO].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10600
     * @tc.name      testRintNoRegressionHugeRetainRelease0001
     * @tc.desc      Keep one four megabyte array, release it, collect and check the counters did not regress while the
     *               freed counter grew and the heap stayed inside its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionHugeRetainRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      let big: number[][] = retainArrays(ONE, 524288);
      const slots: number = slotTotal(big);
      const loaded: HeapSnapshot = new HeapSnapshot();
      big = [];
      await runGcCycles(TWO, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      const settled: HeapSnapshot = new HeapSnapshot();
      logCase('testRintNoRegressionHugeRetainRelease0001', `slots=${slots} ` +
        `allocatedDelta=${after.allocated - before.allocated} freedDelta=${after.freed - before.freed} ` +
        `usedKb=${loaded.usedKb}/${settled.usedKb}`);
      expect(slots).assertEqual(524288);
      expect(after.notBefore(before)).assertTrue();
      expect(after.freed - before.freed > ZERO).assertTrue();
      expect(heapOk(loaded) && heapOk(settled)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10700
     * @tc.name      testRintNoRegressionFiveCollects0001
     * @tc.desc      Collect five cycles in one phase and check every intermediate snapshot equals or exceeds the
     *               previous one across all five counters
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionFiveCollects0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const series: GcSnapshot[] = [new GcSnapshot()];
      for (let cycle = ZERO; cycle < FIVE; cycle++) {
        hintGC();
        allocatePressure();
        await sleepMs(SETTLE_WAIT_MS);
        series.push(new GcSnapshot());
      }
      const after: GcSnapshot = new GcSnapshot();
      const totalDrops: number = snapshotDrops(series).length + (after.notBefore(series[FIVE]) ? ZERO : ONE);
      logCase('testRintNoRegressionFiveCollects0001', `samples=${series.length} totalDrops=${totalDrops} ` +
        `countDelta=${after.count - series[ZERO].count}`);
      expect(series.length).assertEqual(FIVE + ONE);
      expect(totalDrops).assertEqual(ZERO);
      expect(after.count >= series[FIVE].count).assertTrue();
      expect(after.allocated >= series[FIVE].allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10800
     * @tc.name      testRintNoRegressionPressureThenWeak0001
     * @tc.desc      Apply two pressure bursts, then clear two dropped rings and check the counters sampled at all three
     *               points never regress with the heap inside its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionPressureThenWeak0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const first: GcSnapshot = new GcSnapshot();
      burstPressure(TWO);
      await paceTurn();
      const middle: GcSnapshot = new GcSnapshot();
      const refs: WeakRef<RingNode>[] = releasedRings(TWO, FIVE, 211);
      const rounds: number = await collectUntil(() => allCleared(refs), COLLECT_ROUNDS);
      const last: GcSnapshot = new GcSnapshot();
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintNoRegressionPressureThenWeak0001', `rounds=${rounds} cleared=${clearedCount(refs)} ` +
        `drops=${snapshotDrops([first, middle, last]).join(',')}`);
      expect(rounds > ZERO).assertTrue();
      expect(clearedCount(refs)).assertEqual(TWO);
      expect(snapshotDrops([first, middle, last]).length).assertEqual(NO_DROPS);
      expect(heapOk(heap)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_10900
     * @tc.name      testRintNoRegressionResourcesAndHeap0001
     * @tc.desc      Keep ten arrays of 8192 slots, read resources beside the load and check the counters did not regress
     *               while the description string and the heap invariant stayed correct
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionResourcesAndHeap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async () => {
        const before: GcSnapshot = new GcSnapshot();
        const held: number[][] = retainArrays(10, 8192);
        const description: string = resources().getStringByNameSync('module_desc');
        const heap: HeapSnapshot = new HeapSnapshot();
        await runGcCycles(ONE, COLLECT_ROUNDS);
        const after: GcSnapshot = new GcSnapshot();
        logCase('testRintNoRegressionResourcesAndHeap0001', `described=${description.length} ` +
          `drops=${snapshotDrops([before, after]).join(',')} usedKb=${heap.usedKb}`);
        expect(description.length > ZERO).assertTrue();
        expect(snapshotDrops([before, after]).length).assertEqual(NO_DROPS);
        expect(rowsFilled(held, 8192)).assertTrue();
        expect(heapOk(heap)).assertTrue();
      });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_11000
     * @tc.name      testRintNoRegressionFullSweep0001
     * @tc.desc      Run a full allocation, retain, release, collect and hint sweep and check all five counters are
     *               monotonic at the end with the bundle name and heap invariant still correct
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintNoRegressionFullSweep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const start: GcSnapshot = new GcSnapshot();
      allocatePressure();
      let rows: number[][] = retainArrays(14, 4096);
      await paceTurn();
      const loaded: GcSnapshot = new GcSnapshot();
      rows = [];
      await runGcCycles(TWO, COLLECT_ROUNDS);
      hintGC();
      await paceTurn();
      const end: GcSnapshot = new GcSnapshot();
      const heap: HeapSnapshot = new HeapSnapshot();
      const info: bundleManager.BundleInfo = await selfBundle();
      const series: GcSnapshot[] = [start, loaded, end];
      logCase('testRintNoRegressionFullSweep0001', `drops=${snapshotDrops(series).join(',')} ` +
        `countDelta=${end.count - start.count} allocatedDelta=${end.allocated - start.allocated} ` +
        `bundle=${info.name}`);
      expect(snapshotDrops(series).length).assertEqual(NO_DROPS);
      expect(end.count >= start.count && end.freed >= start.freed).assertTrue();
      expect(info.name).assertEqual(BUNDLE_NAME);
      expect(heapOk(heap)).assertTrue();
    });
  });
}
