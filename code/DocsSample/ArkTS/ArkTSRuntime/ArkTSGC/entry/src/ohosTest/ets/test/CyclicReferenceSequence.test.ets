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
  buildRing,
  collectUntil,
  COLLECT_ROUNDS,
  CycleParent,
  expectedIdSum,
  FinalizeTracker,
  isCleared,
  linkPair,
  pairIsLinked,
  range,
  RingNode,
  ringIdSum,
  ringLength,
  runGcCycles,
  sameNumbers
} from './shared/GcProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const KEPT_PAIRS: number = 20;
const PHASE_SIZE: number = 15;
const REBUILD_ROUNDS: number = 5;
const REBUILD_PAIRS: number = 100;
const KEPT_RING_SIZE: number = 1000;

class PairHolder {
  pair: CycleParent | null = null;
}

class ClosureBox {
  reader: (() => number) | null = null;
}

class UnregisterKey {
  token: number;

  constructor(token: number) {
    this.token = token;
  }
}

// every helper below only hands back weak or numeric views, never the dropped cycle itself
function holdNewPair(holder: PairHolder, tag: number): WeakRef<CycleParent> {
  holder.pair = linkPair(tag);
  return new WeakRef<CycleParent>(holder.pair);
}

function holdClosure(box: ClosureBox, tag: number): WeakRef<CycleParent> {
  const pair: CycleParent = linkPair(tag);
  box.reader = () => pair.tag + (pairIsLinked(pair) ? 0 : 1000);
  return new WeakRef<CycleParent>(pair);
}

function registerKept(tracker: FinalizeTracker, kept: CycleParent[], count: number, firstToken: number): void {
  for (let i = 0; i < count; i++) {
    const pair: CycleParent = linkPair(firstToken + i);
    kept.push(pair);
    tracker.registry.register(pair, firstToken + i);
  }
}

function registerWithKeys(tracker: FinalizeTracker, keys: UnregisterKey[], count: number, firstToken: number): void {
  for (let i = 0; i < count; i++) {
    const key: UnregisterKey = new UnregisterKey(firstToken + i);
    keys.push(key);
    tracker.registry.register(linkPair(firstToken + i), firstToken + i, key);
  }
}

function dropHeld(holder: PairHolder): void {
  holder.pair = null;
}

function heldIsLinked(ref: WeakRef<CycleParent>, tag: number): boolean {
  const pair: CycleParent | undefined = ref.deref();
  return pair !== undefined && pairIsLinked(pair) && pair.tag === tag;
}

export default function cyclicReferenceSequenceTest() {
  describe('CyclicReferenceSequence', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0100
     * @tc.name      testCyclicRetainedPair0001
     * @tc.desc      Keep Parent and Child cycles in an array through several collections and check none is finalized or
     *               unlinked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCyclicRetainedPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const kept: CycleParent[] = [];
      registerKept(tracker, kept, KEPT_PAIRS, 0);
      const cycles: number = await runGcCycles(3, COLLECT_ROUNDS);
      logCase('testCyclicRetainedPair0001', `cycles=${cycles} finalized=${tracker.count()} kept=${kept.length}`);
      expect(cycles >= 3).assertTrue();
      expect(tracker.count()).assertEqual(0);
      expect(kept.every((pair: CycleParent, index: number) => pairIsLinked(pair) && pair.tag === index)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0200
     * @tc.name      testCyclicHolderRelease0001
     * @tc.desc      Keep a cycle in a holder field, check it survives collections, then clear the field and check it is
     *               reclaimed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testCyclicHolderRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const holder: PairHolder = new PairHolder();
      const ref: WeakRef<CycleParent> = holdNewPair(holder, 3);
      await runGcCycles(1, COLLECT_ROUNDS);
      const aliveWhileHeld: boolean = heldIsLinked(ref, 3);
      dropHeld(holder);
      await paceTurn();
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      logCase('testCyclicHolderRelease0001', `aliveWhileHeld=${aliveWhileHeld} pairIsNull=${holder.pair === null} ` +
        `rounds=${rounds}`);
      expect(aliveWhileHeld).assertTrue();
      expect(holder.pair === null).assertTrue();
      expect(rounds > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0300
     * @tc.name      testCyclicPartialRelease0001
     * @tc.desc      Register twenty kept cycles and twenty dropped cycles and check only the dropped tokens are
     *               finalized
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicPartialRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const kept: CycleParent[] = [];
      registerKept(tracker, kept, KEPT_PAIRS, 0);
      tracker.registerReleasedPairs(KEPT_PAIRS, 100);
      const rounds: number = await collectUntil(() => tracker.count() >= KEPT_PAIRS, COLLECT_ROUNDS);
      await runGcCycles(1, COLLECT_ROUNDS);
      logCase('testCyclicPartialRelease0001', `rounds=${rounds} finalized=${tracker.count()} kept=${kept.length}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tracker.sortedTokens(), range(100, KEPT_PAIRS))).assertTrue();
      expect(kept.every((pair: CycleParent) => !tracker.has(pair.tag) && pairIsLinked(pair))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0400
     * @tc.name      testCyclicUnregister0001
     * @tc.desc      Unregister every other dropped cycle and check only the still registered half is reported to the
     *               finalizer
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicUnregister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const keys: UnregisterKey[] = [];
      registerWithKeys(tracker, keys, KEPT_PAIRS, 0);
      tracker.registry.unregister(new UnregisterKey(-1));
      for (let i = 0; i < keys.length; i += 2) {
        tracker.registry.unregister(keys[i]);
        tracker.registry.unregister(keys[i]);
      }
      const rounds: number = await collectUntil(() => tracker.count() >= KEPT_PAIRS / 2, COLLECT_ROUNDS);
      await runGcCycles(1, COLLECT_ROUNDS);
      const oddTokens: number[] = range(0, KEPT_PAIRS).filter((token: number) => token % 2 === 1);
      logCase('testCyclicUnregister0001', `rounds=${rounds} finalized=${tracker.count()} keys=${keys.length} ` +
        `oddTokens=${oddTokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tracker.count()).assertEqual(KEPT_PAIRS / 2);
      expect(keys.filter((key: UnregisterKey) => tracker.has(key.token)).length).assertEqual(KEPT_PAIRS / 2);
      expect(sameNumbers(tracker.sortedTokens(), oddTokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0500
     * @tc.name      testCyclicPhasedRelease0001
     * @tc.desc      Drop cycles in three phases and check each phase only adds its own tokens on top of the earlier
     *               ones
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicPhasedRelease0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const seenPerPhase: number[][] = [];
      for (let phase = 0; phase < 3; phase++) {
        tracker.registerReleasedPairs(PHASE_SIZE, phase * 1000);
        await collectUntil(() => tracker.count() >= (phase + 1) * PHASE_SIZE, COLLECT_ROUNDS);
        seenPerPhase.push(tracker.sortedTokens());
      }
      const expectedAfter: number[][] = [];
      let accumulated: number[] = [];
      for (let phase = 0; phase < 3; phase++) {
        accumulated = accumulated.concat(range(phase * 1000, PHASE_SIZE));
        expectedAfter.push(accumulated.slice());
      }
      logCase('testCyclicPhasedRelease0001', `phases=${seenPerPhase.length} expectedPhases=${expectedAfter.length} ` +
        `accumulated=${accumulated.length}`);
      expect(seenPerPhase.length).assertEqual(3);
      expect(sameNumbers(seenPerPhase[0], expectedAfter[0])).assertTrue();
      expect(sameNumbers(seenPerPhase[1], expectedAfter[1])).assertTrue();
      expect(sameNumbers(seenPerPhase[2], expectedAfter[2])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0600
     * @tc.name      testCyclicClosureRetain0001
     * @tc.desc      Keep a cycle alive only through a stored closure, check it survives, then drop the closure and
     *               check it is reclaimed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicClosureRetain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const box: ClosureBox = new ClosureBox();
      const ref: WeakRef<CycleParent> = holdClosure(box, 9);
      await runGcCycles(1, COLLECT_ROUNDS);
      const readWhileHeld: number = (box.reader as () => number)();
      const aliveWhileHeld: boolean = !isCleared(ref);
      box.reader = null;
      await paceTurn();
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      logCase('testCyclicClosureRetain0001', `readWhileHeld=${readWhileHeld} aliveWhileHeld=${aliveWhileHeld} ` +
        `rounds=${rounds}`);
      expect(readWhileHeld).assertEqual(9);
      expect(aliveWhileHeld).assertTrue();
      expect(rounds > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0700
     * @tc.name      testCyclicHolderSwap0001
     * @tc.desc      Swap a holder from cycle A to cycle B and check A is reclaimed while B stays reachable and linked
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicHolderSwap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const holder: PairHolder = new PairHolder();
      const refA: WeakRef<CycleParent> = holdNewPair(holder, 1);
      const refB: WeakRef<CycleParent> = holdNewPair(holder, 2);
      await paceTurn();
      const rounds: number = await collectUntil(() => isCleared(refA), COLLECT_ROUNDS);
      logCase('testCyclicHolderSwap0001', `rounds=${rounds} holderHasPair=${holder.pair !== null}`);
      expect(rounds > 0).assertTrue();
      expect(heldIsLinked(refB, 2)).assertTrue();
      expect((holder.pair as CycleParent).tag).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0800
     * @tc.name      testCyclicRebuildRounds0001
     * @tc.desc      Build and drop one hundred cycles in five fresh rounds and check every round is fully finalized on
     *               its own
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicRebuildRounds0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL2, async () => {
      const perRound: number[] = [];
      const exact: boolean[] = [];
      for (let round = 0; round < REBUILD_ROUNDS; round++) {
        const tracker: FinalizeTracker = new FinalizeTracker();
        tracker.registerReleasedPairs(REBUILD_PAIRS, round * REBUILD_PAIRS);
        await collectUntil(() => tracker.count() >= REBUILD_PAIRS, COLLECT_ROUNDS);
        perRound.push(tracker.count());
        exact.push(sameNumbers(tracker.sortedTokens(), range(round * REBUILD_PAIRS, REBUILD_PAIRS)));
      }
      logCase('testCyclicRebuildRounds0001', `perRound=${perRound.join(',')} exact=${exact.join(',')}`);
      expect(perRound.length).assertEqual(REBUILD_ROUNDS);
      expect(perRound.every((count: number) => count === REBUILD_PAIRS)).assertTrue();
      expect(exact.every((ok: boolean) => ok)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_0900
     * @tc.name      testCyclicKeptRingStable0001
     * @tc.desc      Keep a one thousand node ring through five collections and check its walk, id sum and node data
     *               after each one
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testCyclicKeptRingStable0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const head: RingNode = buildRing(KEPT_RING_SIZE, 8, 1);
      const lengths: number[] = [];
      const sums: number[] = [];
      for (let round = 0; round < 5; round++) {
        await runGcCycles(1, COLLECT_ROUNDS);
        lengths.push(ringLength(head, KEPT_RING_SIZE + 1));
        sums.push(ringIdSum(head, KEPT_RING_SIZE));
      }
      logCase('testCyclicKeptRingStable0001', `lengths=${lengths.join(',')} sums=${sums.join(',')} ` +
        `headId=${head.id} payloadLength=${head.payload.length}`);
      expect(lengths.every((length: number) => length === KEPT_RING_SIZE)).assertTrue();
      expect(sums.every((sum: number) => sum === expectedIdSum(1, KEPT_RING_SIZE))).assertTrue();
      expect(head.id === 1 && head.payload.length === 8 && head.payload[7] === 1).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_CYCLICSEQ_1000
     * @tc.name      testCyclicKeptAfterDrop0001
     * @tc.desc      Drop the array of kept cycles after they survived collections and check every one of them is
     *               finalized
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testCyclicKeptAfterDrop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      const kept: CycleParent[] = [];
      registerKept(tracker, kept, KEPT_PAIRS, 500);
      const survivedFirst: number = tracker.count();
      kept.length = 0;
      await paceTurn();
      const rounds: number = await collectUntil(() => tracker.count() >= KEPT_PAIRS, COLLECT_ROUNDS);
      logCase('testCyclicKeptAfterDrop0001', `survivedFirst=${survivedFirst} rounds=${rounds} ` +
        `finalized=${tracker.count()}`);
      expect(survivedFirst).assertEqual(0);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tracker.sortedTokens(), range(500, KEPT_PAIRS))).assertTrue();
    });
  });
}
