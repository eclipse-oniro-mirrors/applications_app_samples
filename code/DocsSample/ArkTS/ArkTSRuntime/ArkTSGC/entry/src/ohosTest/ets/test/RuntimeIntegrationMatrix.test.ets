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
  arrayPayloadAllocationLimitBytes,
  buildRing,
  byteCounterDelta,
  byteCounterInWindow,
  PRESSURE_ALLOCATION_LIMIT_BYTES,
  STAT_READ_ALLOCATION_LIMIT_BYTES,
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

// Upper bounds come from the scheduled workload, never from a candidate counter delta.
function allocationLimit(payload: number, arrays: number, pressureRounds: number): number {
  return arrayPayloadAllocationLimitBytes(payload, arrays) +
    pressureRounds * PRESSURE_ALLOCATION_LIMIT_BYTES + STAT_READ_ALLOCATION_LIMIT_BYTES;
}

function repeatedLimits(count: number, maximum: number): number[] {
  return new Array<number>(count).fill(maximum);
}

function snapshotDrops(series: GcSnapshot[], limits: number[]): number[] {
  const drops: number[] = [];
  if (limits.length !== series.length - ONE) {
    return [MISSING];
  }
  for (let i = ONE; i < series.length; i++) {
    if (!series[i].notBefore(series[i - ONE], limits[i - ONE])) {
      drops.push(i);
    }
  }
  return drops;
}

function countSeries(series: GcSnapshot[]): number[] {
  return series.map((snap: GcSnapshot) => snap.count);
}

function unfoldedBytes(series: GcSnapshot[], limits: number[], allocated: boolean): number[] {
  const values: number[] = [ZERO];
  if (snapshotDrops(series, limits).length !== ZERO) {
    return [ONE, ZERO];
  }
  for (let i = ONE; i < series.length; i++) {
    const delta: number = allocated ? byteCounterDelta(series[i].allocated, series[i - ONE].allocated) :
      byteCounterDelta(series[i].freed, series[i - ONE].freed);
    values.push(values[i - ONE] + delta);
  }
  return values;
}

function allocatedSeries(series: GcSnapshot[], limits: number[]): number[] {
  return unfoldedBytes(series, limits, true);
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

// probe in a plain function so a live deref result never stays reachable from an async frame
function probeRing(ref: WeakRef<RingNode>, size: number): number[] {
  const seen: RingNode | undefined = ref.deref();
  if (seen === undefined) {
    return [MISSING, MISSING];
  }
  return [ringLength(seen, size + THREE), ringIdSum(seen, size)];
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

// conservative byte lower bound for one allocatePressure call: payload arrays only
function pressureBytes(rounds: number): number {
  return rounds * 20000 * 16 * DOUBLE_BYTES;
}

// tiny allocation nudge so hintGC has young garbage to collect without adding megabytes
function nudgeRint(): number {
  let sink: number = ZERO;
  for (let i = ZERO; i < 200; i++) {
    const junk: number[] = new Array<number>(8).fill(i);
    sink += junk[7];
  }
  return sink;
}

// drop leftover garbage from earlier cases and pressure batches so readings start quiet
async function settleRint(rounds: number): Promise<void> {
  for (let i = ZERO; i < rounds; i++) {
    hintGC();
    nudgeRint();
    await sleepMs(SETTLE_WAIT_MS);
  }
}

// run at least minCycles collections and then settle, so readings reflect released memory
async function collectSettled(minCycles: number, maxRounds: number): Promise<number> {
  const cycles: number = await runGcCycles(minCycles, maxRounds);
  await settleRint(FOUR);
  return cycles;
}

class TerminalWait {
  rounds: number;
  terminal: GcSnapshot;

  constructor(rounds: number, terminal: GcSnapshot) {
    this.rounds = rounds;
    this.terminal = terminal;
  }
}

// wait until the targets are gone and the GC count moved past the baseline, keeping that same snapshot for asserts
async function collectUntilProgress(done: () => boolean, before: GcSnapshot, minCount: number,
  extra?: (current: GcSnapshot) => boolean): Promise<TerminalWait> {
  let terminal: GcSnapshot = before;
  const rounds: number = await collectUntil(() => {
    if (!done()) {
      return false;
    }
    const current: GcSnapshot = new GcSnapshot();
    if (current.count - before.count >= minCount && (extra === undefined || extra(current))) {
      terminal = current;
      return true;
    }
    return false;
  }, COLLECT_ROUNDS);
  return new TerminalWait(rounds, terminal);
}

// built, probed and released in one synchronous frame so only the weak reference and scalars leave it
class ReleasedRingProbe {
  ref: WeakRef<RingNode>;
  liveBefore: boolean;
  length: number;
  idSum: number;

  constructor(ref: WeakRef<RingNode>, liveBefore: boolean, length: number, idSum: number) {
    this.ref = ref;
    this.liveBefore = liveBefore;
    this.length = length;
    this.idSum = idSum;
  }
}

function releasedIdentityRing(size: number, payloadLength: number, firstId: number): ReleasedRingProbe {
  let head: RingNode | null = buildRing(size, payloadLength, firstId);
  const ref: WeakRef<RingNode> = new WeakRef<RingNode>(head);
  const liveBefore: boolean = ref.deref() === head;
  const probed: number[] = probeRing(ref, size);
  head = null;
  return new ReleasedRingProbe(ref, liveBefore && head === null, probed[ZERO], probed[ONE]);
}

// the churn batch lives only inside this frame; the weak reference observes the real first row of that batch
function churnBatch(count: number, length: number, refs: WeakRef<number[]>[]): number {
  const rows: number[][] = retainArrays(count, length);
  refs.push(new WeakRef<number[]>(rows[ZERO]));
  return rowsFilled(rows, length) ? slotTotal(rows) : MISSING;
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
     * @tc.desc      Keep 40 arrays of 2048 slots and check the rows are filled, the allocated counter moved inside a
     *               trusted window by at least the payload and the live object size covers the held payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocHeapSmall0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(40, 2048);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lower: number = payloadBytes(40, 2048);
      const maxA: number = allocationLimit(lower, 40, ZERO);
      const gcDelta: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      logCase('testRintAllocHeapSmall0001', `slots=${slotTotal(kept)} lower=${lower} gcDelta=${gcDelta} ` +
        `objectKb=${heapAfter.objectKb} usedKb=${heapAfter.usedKb} totalKb=${heapAfter.totalKb}`);
      expect(rowsFilled(kept, 2048)).assertTrue();
      expect(byteCounterInWindow(gcAfter.allocated, gcBefore.allocated, maxA)).assertTrue();
      expect(gcDelta >= lower).assertTrue();
      expect(heapAfter.objectKb >= lower / KB).assertTrue();
      expect(heapOk(heapAfter)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0200
     * @tc.name      testRintAllocHeapWide0001
     * @tc.desc      Keep eight arrays of 65536 slots and check the GC byte counter covers the payload inside a trusted
     *               window while the live object size holds the payload and used stays within total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocHeapWide0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(8, 65536);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lowerKb: number = payloadKb(8, 65536);
      const maxA: number = allocationLimit(lowerKb * KB, 8, ZERO);
      const gcDelta: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      logCase('testRintAllocHeapWide0001', `lowerKb=${lowerKb} gcDelta=${gcDelta} ` +
        `objectKb=${heapAfter.objectKb} arrayKb=${heapAfter.arrayKb}`);
      expect(rowsFilled(kept, 65536)).assertTrue();
      expect(byteCounterInWindow(gcAfter.allocated, gcBefore.allocated, maxA)).assertTrue();
      expect(gcDelta >= lowerKb * KB).assertTrue();
      expect(heapAfter.objectKb >= lowerKb).assertTrue();
      expect(heapOk(heapAfter)).assertTrue();
      expect(heapAfter.arrayKb >= ZERO).assertTrue();
    });


    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0400
     * @tc.name      testRintAllocHeapSingle0001
     * @tc.desc      Keep one two megabyte array, then a second one, and check each batch has its own trusted
     *               allocation window while the live object size covers every array that is still reachable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocHeapSingle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const gcBefore: GcSnapshot = new GcSnapshot();
      const first: number[][] = retainArrays(ONE, 262144);
      await paceTurn();
      const gcMiddle: GcSnapshot = new GcSnapshot();
      const middle: HeapSnapshot = new HeapSnapshot();
      const second: number[][] = retainArrays(ONE, 262144);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const top: HeapSnapshot = new HeapSnapshot();
      const perArrayKb: number = 262144 * DOUBLE_BYTES / KB;
      const maxA: number = allocationLimit(perArrayKb * KB, ONE, ZERO);
      logCase('testRintAllocHeapSingle0001', `perArrayKb=${perArrayKb} ` +
        `objectKb=${middle.objectKb}/${top.objectKb} firstA=${byteCounterDelta(gcMiddle.allocated, gcBefore.allocated)} ` +
        `secondA=${byteCounterDelta(gcAfter.allocated, gcMiddle.allocated)}`);
      expect(rowsFilled(first, 262144) && rowsFilled(second, 262144)).assertTrue();
      expect(gcMiddle.notBefore(gcBefore, maxA) && gcAfter.notBefore(gcMiddle, maxA)).assertTrue();
      expect(byteCounterDelta(gcMiddle.allocated, gcBefore.allocated) >= perArrayKb * KB).assertTrue();
      expect(byteCounterDelta(gcAfter.allocated, gcMiddle.allocated) >= perArrayKb * KB).assertTrue();
      expect(middle.objectKb >= perArrayKb && top.objectKb >= perArrayKb * TWO).assertTrue();
      expect(heapOk(top)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0500
     * @tc.name      testRintAllocAfterCollectBaseline0001
     * @tc.desc      Collect at least one cycle first, then keep 24 arrays of 8192 slots and check the allocation
     *               window covers the payload while the live object size holds it and the heap invariant still holds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRintAllocAfterCollectBaseline0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const cycles: number = await runGcCycles(ONE, COLLECT_ROUNDS);
      const gcBefore: GcSnapshot = new GcSnapshot();
      const kept: number[][] = retainArrays(24, 8192);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lowerKb: number = payloadKb(24, 8192);
      const maxA: number = allocationLimit(lowerKb * KB, 24, ZERO);
      const allocated: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      logCase('testRintAllocAfterCollectBaseline0001', `cycles=${cycles} lowerKb=${lowerKb} ` +
        `allocated=${allocated} objectKb=${heapAfter.objectKb}`);
      expect(cycles >= ONE).assertTrue();
      expect(rowsFilled(kept, 8192)).assertTrue();
      expect(byteCounterInWindow(gcAfter.allocated, gcBefore.allocated, maxA)).assertTrue();
      expect(allocated >= lowerKb * KB).assertTrue();
      expect(heapAfter.objectKb >= lowerKb).assertTrue();
      expect(heapOk(heapAfter)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0600
     * @tc.name      testRintAllocThreeStepLadder0001
     * @tc.desc      Hold three successive batches of ten arrays of 4096 slots and check every batch stays filled, has
     *               its own trusted allocation window and the live object size covers the cumulative payload
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocThreeStepLadder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await runGcCycles(ONE, COLLECT_ROUNDS);
      const gcSeries: GcSnapshot[] = [new GcSnapshot()];
      const stages: HeapSnapshot[] = [];
      const held: number[][][] = [];
      const stepKb: number = payloadKb(10, 4096);
      const maxA: number = allocationLimit(stepKb * KB, 10, ZERO);
      for (let step = ZERO; step < THREE; step++) {
        held.push(retainArrays(10, 4096));
        await paceTurn();
        gcSeries.push(new GcSnapshot());
        stages.push(new HeapSnapshot());
      }
      const last: HeapSnapshot = stages[stages.length - ONE];
      const deltas: number[] = [];
      for (let step = ONE; step < gcSeries.length; step++) {
        deltas.push(byteCounterDelta(gcSeries[step].allocated, gcSeries[step - ONE].allocated));
      }
      logCase('testRintAllocThreeStepLadder0001', `stepKb=${stepKb} objectKb=${stages.map((heap: HeapSnapshot) =>
        heap.objectKb).join('/')} allocated=${deltas.join('/')}`);
      expect(held.length).assertEqual(THREE);
      expect(held.every((batch: number[][]) => rowsFilled(batch, 4096))).assertTrue();
      expect(snapshotDrops(gcSeries, [maxA, maxA, maxA]).length).assertEqual(NO_DROPS);
      expect(deltas.every((delta: number) => delta >= stepKb * KB)).assertTrue();
      expect(stages.every((heap: HeapSnapshot, index: number) => heap.objectKb >= stepKb * (index + ONE))).assertTrue();
      expect(heapOk(last)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_0700
     * @tc.name      testRintAllocHeapDeltaBounded0001
     * @tc.desc      Hold 32 arrays of 4096 slots and check the allocation delta stays inside a budget derived from the
     *               workload while covering the payload and the live object size holds the retained rows
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRintAllocHeapDeltaBounded0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const gcBefore: GcSnapshot = new GcSnapshot();
      const held: number[][] = retainArrays(32, 4096);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const lower: number = payloadBytes(32, 4096);
      const maxA: number = allocationLimit(lower, 32, ZERO);
      const gcDelta: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      logCase('testRintAllocHeapDeltaBounded0001', `gcDelta=${gcDelta} gcDeltaKb=${gcDelta / KB} ` +
        `objectKb=${heapAfter.objectKb} lowerKb=${lower / KB}`);
      expect(rowsFilled(held, 4096)).assertTrue();
      expect(gcDelta >= lower).assertTrue();
      expect(heapAfter.objectKb >= lower / KB).assertTrue();
      expect(gcAfter.notBefore(gcBefore, maxA)).assertTrue();
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
      const maxA: number = allocationLimit(held * DOUBLE_BYTES, 20, COLLECT_ROUNDS);
      const freed: number = byteCounterDelta(after.freed, before.freed);
      const allocated: number = byteCounterDelta(after.allocated, before.allocated);
      logCase('testRintFreedGrowsAfterRelease0001', `heldSlots=${held} cycles=${cycles} ` +
        `freedDelta=${freed} allocatedDelta=${allocated}`);
      expect(kept.length).assertEqual(ZERO);
      expect(cycles >= TWO).assertTrue();
      expect(freed > ZERO).assertTrue();
      expect(allocated >= held * DOUBLE_BYTES).assertTrue();
      expect(after.notBefore(before, maxA)).assertTrue();
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
      const allocated: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      logCase('testRintAllocKbAndSlots0001', `slots=${slots} fromSlots=${fromSlots} ` +
        `payload=${payloadBytes(48, 1024)} gcDelta=${allocated}`);
      expect(slots).assertEqual(48 * 1024);
      expect(fromSlots).assertEqual(payloadBytes(48, 1024));
      expect(byteCounterInWindow(gcAfter.allocated, gcBefore.allocated, allocationLimit(fromSlots, 48, ZERO)))
        .assertTrue();
      expect(allocated >= fromSlots).assertTrue();
      expect(payloadKb(48, 1024) * KB).assertEqual(fromSlots);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1000
     * @tc.name      testRintReleaseKeepsHeapBounded0001
     * @tc.desc      Keep twenty arrays of 8192 slots, release them, collect twice and check the loaded live object size
     *               covers the payload while the freed counter advances inside its physical bound
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
      const loadedFilled: boolean = rowsFilled(rows, 8192);
      rows = [];
      await runGcCycles(TWO, COLLECT_ROUNDS);
      const settled: HeapSnapshot = new HeapSnapshot();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const maxA: number = allocationLimit(releasedKb * KB, 20, COLLECT_ROUNDS);
      const allocatedDelta: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      const freedDelta: number = byteCounterDelta(gcAfter.freed, gcBefore.freed);
      logCase('testRintReleaseKeepsHeapBounded0001', `releasedKb=${releasedKb} loadedObjectKb=${loaded.objectKb} ` +
        `settledKb=${settled.usedKb} allocatedDelta=${allocatedDelta} freedDelta=${freedDelta}`);
      expect(rows.length).assertEqual(ZERO);
      expect(loadedFilled).assertTrue();
      expect(loaded.objectKb >= releasedKb).assertTrue();
      expect(gcAfter.bytesInWindow(gcBefore, maxA)).assertTrue();
      expect(allocatedDelta >= releasedKb * KB).assertTrue();
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
      const allocated: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      const heap: HeapSnapshot = new HeapSnapshot();
      logCase('testRintAllocRowFillOracle0001', `filled=${filled} writtenSlots=${writtenSlots} ` +
        `gcDelta=${allocated} objectKb=${heap.objectKb}`);
      expect(kept[ZERO][ZERO]).assertEqual(ZERO);
      expect(kept[35][511]).assertEqual(35);
      expect(filled).assertTrue();
      expect(byteCounterInWindow(gcAfter.allocated, gcBefore.allocated,
        allocationLimit(writtenSlots * DOUBLE_BYTES, 36, ZERO))).assertTrue();
      expect(allocated >= writtenSlots * DOUBLE_BYTES).assertTrue();
      expect(heapOk(heap) && heap.objectKb >= writtenSlots * DOUBLE_BYTES / KB).assertTrue();
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
      const gcBase: GcSnapshot = new GcSnapshot();
      const first: number[][] = retainArrays(12, 2048);
      await paceTurn();
      const gcMiddle: GcSnapshot = new GcSnapshot();
      const middle: HeapSnapshot = new HeapSnapshot();
      const second: number[][] = retainArrays(12, 2048);
      await paceTurn();
      const gcTop: GcSnapshot = new GcSnapshot();
      const top: HeapSnapshot = new HeapSnapshot();
      const batchBytes: number = payloadBytes(12, 2048);
      const maxA: number = allocationLimit(batchBytes, 12, ZERO);
      const firstA: number = byteCounterDelta(gcMiddle.allocated, gcBase.allocated);
      const secondA: number = byteCounterDelta(gcTop.allocated, gcMiddle.allocated);
      logCase('testRintAllocTwoBatchesHeap0001', `firstRows=${first.length} secondRows=${second.length} ` +
        `objectKb=${middle.objectKb}/${top.objectKb} allocated=${firstA}/${secondA}`);
      expect(rowsFilled(first, 2048) && rowsFilled(second, 2048)).assertTrue();
      expect(gcMiddle.notBefore(gcBase, maxA) && gcTop.notBefore(gcMiddle, maxA)).assertTrue();
      expect(firstA >= batchBytes && secondA >= batchBytes).assertTrue();
      expect(middle.objectKb >= payloadKb(12, 2048) && top.objectKb >= payloadKb(24, 2048)).assertTrue();
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
      const kept: number[][] = retainArrays(16, 16384);
      await paceTurn();
      const gcAfter: GcSnapshot = new GcSnapshot();
      const heapAfter: HeapSnapshot = new HeapSnapshot();
      const perRow: number = 16384 * DOUBLE_BYTES;
      const total: number = perRow * kept.length;
      const allocated: number = byteCounterDelta(gcAfter.allocated, gcBefore.allocated);
      logCase('testRintAllocPerRowPayload0001', `perRow=${perRow} total=${total} ` +
        `gcDelta=${allocated} objectKb=${heapAfter.objectKb}`);
      expect(perRow * 16).assertEqual(total);
      expect(rowsFilled(kept, 16384)).assertTrue();
      expect(byteCounterInWindow(gcAfter.allocated, gcBefore.allocated, allocationLimit(total, 16, ZERO)))
        .assertTrue();
      expect(allocated >= total).assertTrue();
      expect(heapAfter.objectKb >= total / KB).assertTrue();
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
      const limits: number[] = repeatedLimits(6, allocationLimit(ZERO, ZERO, ONE));
      const drops: number[] = snapshotDrops(series, limits);
      const allocated: number[] = allocatedSeries(series, limits);
      const perWindowPayload: boolean = allocated.every((value: number, index: number) =>
        index === ZERO || value - allocated[index - ONE] >= pressureBytes(ONE));
      logCase('testRintCountSixHintBursts0001', `sink=${sink} samples=${series.length} drops=${drops.join(',')} ` +
        `count=${countSeries(series).join('/')} allocated=${allocated.join('/')}`);
      expect(series.length).assertEqual(6 + ONE);
      expect(drops.length).assertEqual(NO_DROPS);
      expect(nonDecreasing(countSeries(series))).assertTrue();
      expect(perWindowPayload).assertTrue();
      expect(allocated[6] >= pressureBytes(6)).assertTrue();
      expect(series[6].count >= series[ZERO].count).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1500
     * @tc.name      testRintCountHintThenAlloc0001
     * @tc.desc      Take a hint burst first and a pure allocation burst second and check each phase stays in its trusted
     *               byte window, the scheduled payload is allocated and a real collection is observed
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
        `allocatedDelta=${byteCounterDelta(settled.allocated, start.allocated)}`);
      expect(middle.notBefore(start, allocationLimit(ZERO, ZERO, THREE))).assertTrue();
      expect(end.notBefore(middle, allocationLimit(ZERO, ZERO, THREE))).assertTrue();
      expect(settled.notBefore(end, allocationLimit(ZERO, ZERO, COLLECT_ROUNDS))).assertTrue();
      expect(rounds > ZERO).assertTrue();
      expect(byteCounterInWindow(settled.allocated, start.allocated,
        allocationLimit(ZERO, ZERO, THREE + THREE + COLLECT_ROUNDS))).assertTrue();
      expect(byteCounterDelta(settled.allocated, start.allocated) >= pressureBytes(THREE + THREE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1600
     * @tc.name      testRintCountAlternateHintPressure0001
     * @tc.desc      Alternate a hint and an allocation burst eight times and check every step stays inside its trusted
     *               byte window with no counter drop and the unfolded allocated series grows by one burst per step
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
      const limits: number[] = repeatedLimits(8, allocationLimit(ZERO, ZERO, ONE));
      const drops: number[] = snapshotDrops(series, limits);
      const unfolded: number[] = allocatedSeries(series, limits);
      const perStepPressure: boolean = unfolded.every((value: number, index: number) =>
        index === ZERO || value - unfolded[index - ONE] >= pressureBytes(ONE));
      const grew: number = series[series.length - ONE].count - series[ZERO].count;
      logCase('testRintCountAlternateHintPressure0001', `samples=${series.length} drops=${drops.join(',')} ` +
        `countGrew=${grew} allocated=${unfolded.join('/')}`);
      expect(drops.length).assertEqual(NO_DROPS);
      expect(unfolded.length).assertEqual(8 + ONE);
      expect(perStepPressure).assertTrue();
      expect(unfolded[8] >= pressureBytes(8)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RUNTIMEINT_1700
     * @tc.name      testRintCountPressureOnly0001
     * @tc.desc      Allocate ten short lived pressure bursts without an explicit hint and check the count series stays
     *               monotonic while the allocated counter covers all ten payloads inside a trusted window
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
        `allocatedDelta=${byteCounterDelta(after.allocated, before.allocated)} ` +
        `freedDelta=${byteCounterDelta(after.freed, before.freed)}`);
      expect(counts.length).assertEqual(10 + ONE);
      expect(nonDecreasing(counts)).assertTrue();
      expect(byteCounterDelta(after.allocated, before.allocated) >= pressureBytes(10)).assertTrue();
      expect(byteCounterInWindow(after.allocated, before.allocated, allocationLimit(ZERO, ZERO, 10))).assertTrue();
      expect(after.notBefore(before, allocationLimit(ZERO, ZERO, 10))).assertTrue();
    });

;
  });
}
