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
  buildRing,
  collectUntil,
  COLLECT_ROUNDS,
  CycleChild,
  CycleParent,
  expectedIdSum,
  FinalizeTracker,
  gcStat,
  GcSnapshot,
  hintGC,
  isCleared,
  KEY_GC_COUNT,
  linkPair,
  pairIsLinked,
  range,
  releasedChild,
  releasedPair,
  RingNode,
  ringIdSum,
  ringLength,
  runGcCycles,
  sameNumbers
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const REPEAT_HINTS: number = 100;
const REPEAT_BUDGET_MS: number = 2000;
const RING_SIZE: number = 1000;
const MAP_SIZE: number = 500;
const RELEASED_PAIRS: number = 200;
const INTERLEAVE_ROUNDS: number = 10;
const CHAIN_STEPS: number = 10;

function hintInTimer(value: number): Promise<number> {
  return new Promise<number>((resolve: (result: number) => void) => {
    setTimeout(() => {
      hintGC();
      resolve(value * 2);
    }, 10);
  });
}

export default function hintGcGuardTest() {
  describe('HintGcGuard', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0100
     * @tc.name      testHintGcCall0001
     * @tc.desc      Call ArkTools.hintGC once and check it returns nothing and leaves every GC counter readable and not
     *               lower
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHintGcCall0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const before: GcSnapshot = new GcSnapshot();
      let thrown: boolean = false;
      try {
        hintGC();
      } catch (error) {
        thrown = true;
      }
      const after: GcSnapshot = new GcSnapshot();
      logCase('testHintGcCall0001', `thrown=${thrown} beforeCount=${before.count} afterCount=${after.count}`);
      expect(thrown).assertFalse();
      expect(after.notBefore(before)).assertTrue();
      expect(after.values().every((value: number) => Number.isFinite(value) && value >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0200
     * @tc.name      testHintGcRepeat0001
     * @tc.desc      Call hintGC one hundred times in a row and check it stays cheap and the counters stay ordered
     * @tc.size      SMALLTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL1
     */
    it('testHintGcRepeat0001', TestType.PERFORMANCE | Size.SMALLTEST | Level.LEVEL1, () => {
      const before: GcSnapshot = new GcSnapshot();
      const start: number = Date.now();
      for (let i = 0; i < REPEAT_HINTS; i++) {
        hintGC();
      }
      const elapsed: number = Date.now() - start;
      const after: GcSnapshot = new GcSnapshot();
      logCase('testHintGcRepeat0001', `elapsed=${elapsed} countDelta=${after.count - before.count} ` +
        `freed=${after.freed} allocated=${after.allocated}`);
      expect(elapsed < REPEAT_BUDGET_MS).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(after.count - before.count <= REPEAT_HINTS).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0300
     * @tc.name      testHintGcReachablePair0001
     * @tc.desc      Keep a Parent and Child cycle referenced while hintGC and real collections run and check the links
     *               survive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHintGcReachablePair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parent: CycleParent = linkPair(7);
      hintGC();
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      logCase('testHintGcReachablePair0001', `cycles=${cycles} parentTag=${parent.tag}`);
      expect(cycles >= 2).assertTrue();
      expect(pairIsLinked(parent)).assertTrue();
      expect(parent.tag).assertEqual(7);
      expect((parent.child as CycleChild).tag).assertEqual(7);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0400
     * @tc.name      testHintGcReachableRing0001
     * @tc.desc      Keep a one thousand node ring referenced across collections and check its length and id sum stay
     *               exact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHintGcReachableRing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const head: RingNode = buildRing(RING_SIZE, 4, 100);
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      logCase('testHintGcReachableRing0001', `cycles=${cycles} ringSize=${RING_SIZE} ` +
        `payloadLength=${head.payload.length}`);
      expect(cycles >= 2).assertTrue();
      expect(ringLength(head, RING_SIZE + 1)).assertEqual(RING_SIZE);
      expect(ringIdSum(head, RING_SIZE)).assertEqual(expectedIdSum(100, RING_SIZE));
      expect(head.payload.every((value: number) => value === 100)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0500
     * @tc.name      testHintGcTimerCallback0001
     * @tc.desc      Call hintGC from timer callbacks like the button handler does and check every callback still
     *               delivers its value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHintGcTimerCallback0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const results: number[] = await Promise.all([hintInTimer(1), hintInTimer(2), hintInTimer(3)]);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testHintGcTimerCallback0001', `results=${results.join(',')} beforeCount=${before.count} ` +
        `afterCount=${after.count} freed=${after.freed} allocated=${after.allocated}`);
      expect(sameNumbers(results, [2, 4, 6])).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0600
     * @tc.name      testHintGcPromiseChain0001
     * @tc.desc      Call hintGC in each step of a promise chain and check the steps run once each and in order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHintGcPromiseChain0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const order: number[] = [];
      let chain: Promise<number> = Promise.resolve(0);
      for (let step = 1; step <= CHAIN_STEPS; step++) {
        chain = chain.then((value: number) => {
          hintGC();
          order.push(step);
          return value + step;
        });
      }
      const total: number = await chain;
      logCase('testHintGcPromiseChain0001', `total=${total} order=${order.join(',')} steps=${CHAIN_STEPS}`);
      expect(total).assertEqual(CHAIN_STEPS * (CHAIN_STEPS + 1) / 2);
      expect(sameNumbers(order, range(1, CHAIN_STEPS))).assertTrue();
      expect(gcStat(KEY_GC_COUNT) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0700
     * @tc.name      testHintGcWeakKept0001
     * @tc.desc      Hold an object strongly and through a WeakRef and check hintGC and collections never clear the
     *               WeakRef
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHintGcWeakKept0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const kept: CycleParent = linkPair(11);
      const ref: WeakRef<CycleParent> = new WeakRef<CycleParent>(kept);
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      logCase('testHintGcWeakKept0001', `cycles=${cycles} keptTag=${kept.tag}`);
      expect(cycles >= 2).assertTrue();
      expect(ref.deref() === kept).assertTrue();
      expect(pairIsLinked(ref.deref() as CycleParent)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0800
     * @tc.name      testHintGcReleasedPair0001
     * @tc.desc      Drop a Parent and Child cycle as main() in ReferenceCounting does and check hintGC with pressure
     *               reclaims both sides
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testHintGcReleasedPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const parentRef: WeakRef<CycleParent> = releasedPair(21);
      const childRef: WeakRef<CycleChild> = releasedChild(22);
      const rounds: number = await collectUntil(() => isCleared(parentRef) && isCleared(childRef), COLLECT_ROUNDS);
      logCase('testHintGcReleasedPair0001', `rounds=${rounds} maxRounds=${COLLECT_ROUNDS}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(parentRef)).assertTrue();
      expect(isCleared(childRef)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_0900
     * @tc.name      testHintGcInterleave0001
     * @tc.desc      Alternate hintGC with allocation for ten rounds and check every counter is non decreasing from
     *               round to round
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHintGcInterleave0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const snapshots: GcSnapshot[] = [new GcSnapshot()];
      let sink: number = 0;
      for (let round = 0; round < INTERLEAVE_ROUNDS; round++) {
        hintGC();
        sink += allocatePressure();
        snapshots.push(new GcSnapshot());
        await paceTurn();
      }
      let ordered: boolean = true;
      for (let i = 1; i < snapshots.length; i++) {
        ordered = ordered && snapshots[i].notBefore(snapshots[i - 1]);
      }
      logCase('testHintGcInterleave0001', `ordered=${ordered} snapshots=${snapshots.length} sink=${sink} ` +
        `firstAllocated=${snapshots[0].allocated} lastAllocated=${snapshots[INTERLEAVE_ROUNDS].allocated}`);
      expect(ordered).assertTrue();
      expect(snapshots.length).assertEqual(INTERLEAVE_ROUNDS + 1);
      expect(snapshots[INTERLEAVE_ROUNDS].allocated > snapshots[0].allocated).assertTrue();
      expect(sink > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_1000
     * @tc.name      testHintGcFinalizePairs0001
     * @tc.desc      Drop two hundred Parent and Child cycles and check hintGC with pressure finalizes every one of them
     *               exactly once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testHintGcFinalizePairs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(RELEASED_PAIRS, 1000);
      const rounds: number = await collectUntil(() => tracker.count() >= RELEASED_PAIRS, COLLECT_ROUNDS);
      logCase('testHintGcFinalizePairs0001', `rounds=${rounds} finalized=${tracker.count()} ` +
        `expected=${RELEASED_PAIRS}`);
      expect(rounds > 0).assertTrue();
      expect(tracker.count()).assertEqual(RELEASED_PAIRS);
      expect(sameNumbers(tracker.sortedTokens(), range(1000, RELEASED_PAIRS))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_HINTGC_1100
     * @tc.name      testHintGcMapIntact0001
     * @tc.desc      Fill a Map with five hundred cycles, run hintGC between collections and check every entry and link
     *               is intact
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testHintGcMapIntact0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const table: Map<number, CycleParent> = new Map<number, CycleParent>();
      for (let i = 0; i < MAP_SIZE; i++) {
        table.set(i, linkPair(i));
      }
      const cycles: number = await runGcCycles(2, COLLECT_ROUNDS);
      let tagSum: number = 0;
      let linked: number = 0;
      table.forEach((parent: CycleParent, key: number) => {
        tagSum += parent.tag;
        linked += pairIsLinked(parent) && parent.tag === key ? 1 : 0;
      });
      logCase('testHintGcMapIntact0001', `cycles=${cycles} size=${table.size} linked=${linked} tagSum=${tagSum}`);
      expect(cycles >= 2).assertTrue();
      expect(table.size).assertEqual(MAP_SIZE);
      expect(linked).assertEqual(MAP_SIZE);
      expect(tagSum).assertEqual(expectedIdSum(0, MAP_SIZE));
    });
  });
}
