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
  allCleared,
  buildRing,
  collectUntil,
  COLLECT_ROUNDS,
  CycleChild,
  CycleParent,
  expectedIdSum,
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
  releasedRing,
  RingNode,
  RingProbe,
  ringIdSum,
  ringLength,
  runGcCycles,
  sameNumbers
} from './shared/GcProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const MISSING: number = -1;
const ZERO: number = 0;
const ONE: number = 1;
const LOCAL_PRESSURE_OBJECTS: number = 3000;
const LOCAL_PRESSURE_PAYLOAD: number = 24;
const WEAK_ROUNDS: number = 10;
const WEAK_WAIT_MS: number = 20;
const PAYLOAD_SIZES: number[] = [0, 1, 16, 256, 2048];
const BATCH_SIZES: number[] = [2, 3, 4];
const REF_COUNTS: number[] = [2, 3, 4, 5];
const RING_SIZES: number[] = [1, 2, 6, 40];
const INTERLEAVE_STEPS: number[] = [2, 3, 4, 6];
const SLOT_NAMES: string[] = ['alpha', 'beta', 'gamma'];
const PAIR_TAGS: number[] = [3, 9, 27];

// small allocation burst used between hints so short lived garbage reaches the collector
function sweepPressure(): number {
  let sink: number = 0;
  for (let i = 0; i < LOCAL_PRESSURE_OBJECTS; i++) {
    const chunk: number[] = new Array<number>(LOCAL_PRESSURE_PAYLOAD).fill(i % 97);
    sink += chunk[0] + chunk[chunk.length - 1];
  }
  return sink;
}

// one round lets the main thread turn over, then hints and pressures the collector
async function collectWeak<T extends object>(ref: WeakRef<T>, maxRounds: number): Promise<number> {
  for (let round = 1; round <= maxRounds; round++) {
    await sleepMs(WEAK_WAIT_MS);
    hintRound();
    if (ref.deref() === undefined) {
      return round;
    }
  }
  return MISSING;
}

async function collectWeakAll<T extends object>(refs: WeakRef<T>[], maxRounds: number): Promise<number> {
  for (let round = 1; round <= maxRounds; round++) {
    await sleepMs(WEAK_WAIT_MS);
    hintRound();
    if (refs.every((ref: WeakRef<T>) => ref.deref() === undefined)) {
      return round;
    }
  }
  return MISSING;
}

async function collectWeakSome<T extends object>(refs: WeakRef<T>[], wanted: number,
  maxRounds: number): Promise<number> {
  for (let round = 1; round <= maxRounds; round++) {
    await sleepMs(WEAK_WAIT_MS);
    hintRound();
    if (countCleared(refs) >= wanted) {
      return round;
    }
  }
  return MISSING;
}

// hint plus pressure, followed by a short timer gap so the next round starts clean
function hintRound(): void {
  hintGC();
  sweepPressure();
  hintGC();
}

function countCleared<T extends object>(refs: WeakRef<T>[]): number {
  let cleared: number = 0;
  refs.forEach((ref: WeakRef<T>) => {
    cleared += ref.deref() === undefined ? ONE : ZERO;
  });
  return cleared;
}

function countAlive<T extends object>(refs: WeakRef<T>[]): number {
  return refs.length - countCleared(refs);
}

function allAlive<T extends object>(refs: WeakRef<T>[]): boolean {
  return refs.every((ref: WeakRef<T>) => ref.deref() !== undefined);
}

class WeakPoint {
  id: number;

  constructor(id: number) {
    this.id = id;
  }

  score(): number {
    return this.id * 3;
  }

  label(): string {
    return `point-${this.id}`;
  }
}

class WeakRecord {
  id: number;
  label: string;
  items: number[];

  constructor(id: number, itemCount: number) {
    this.id = id;
    this.label = `rec-${id}`;
    this.items = new Array<number>(itemCount).fill(id);
  }

  total(): number {
    let sum: number = 0;
    for (const value of this.items) {
      sum += value;
    }
    return sum;
  }

  size(): number {
    return this.items.length;
  }
}

class WeakEnvelope {
  id: number;
  tag: string;
  inner: WeakPoint;
  meta: WeakRecord;

  constructor(id: number, tag: string, metaCount: number) {
    this.id = id;
    this.tag = tag;
    this.inner = new WeakPoint(id);
    this.meta = new WeakRecord(id, metaCount);
  }

  innerId(): number {
    return this.inner.id;
  }
}

class PointSlot {
  name: string;
  ref: WeakRef<WeakPoint>;

  constructor(name: string, ref: WeakRef<WeakPoint>) {
    this.name = name;
    this.ref = ref;
  }

  idOrMissing(): number {
    const live: WeakPoint | undefined = this.ref.deref();
    return live === undefined ? MISSING : live.id;
  }

  cleared(): boolean {
    return this.ref.deref() === undefined;
  }
}

class DualSlot {
  name: string;
  primary: WeakRef<WeakPoint>;
  secondary: WeakRef<WeakPoint>;

  constructor(name: string, primary: WeakRef<WeakPoint>, secondary: WeakRef<WeakPoint>) {
    this.name = name;
    this.primary = primary;
    this.secondary = secondary;
  }

  sameTarget(): boolean {
    const first: WeakPoint | undefined = this.primary.deref();
    const second: WeakPoint | undefined = this.secondary.deref();
    return first !== undefined && first === second;
  }

  bothCleared(): boolean {
    return this.primary.deref() === undefined && this.secondary.deref() === undefined;
  }

  primaryId(): number {
    const live: WeakPoint | undefined = this.primary.deref();
    return live === undefined ? MISSING : live.id;
  }
}

class RefBucket {
  label: string;
  refs: WeakRef<WeakPoint>[] = [];

  constructor(label: string) {
    this.label = label;
  }

  add(ref: WeakRef<WeakPoint>): number {
    this.refs.push(ref);
    return this.refs.length;
  }

  size(): number {
    return this.refs.length;
  }

  clearedCount(): number {
    let cleared: number = 0;
    for (const ref of this.refs) {
      cleared += ref.deref() === undefined ? ONE : ZERO;
    }
    return cleared;
  }

  aliveIds(): number[] {
    const ids: number[] = [];
    for (const ref of this.refs) {
      const live: WeakPoint | undefined = ref.deref();
      if (live !== undefined) {
        ids.push(live.id);
      }
    }
    return ids;
  }
}

class RefTable {
  name: string;
  table: Map<string, WeakRef<WeakPoint>> = new Map<string, WeakRef<WeakPoint>>();

  constructor(name: string) {
    this.name = name;
  }

  put(key: string, ref: WeakRef<WeakPoint>): number {
    this.table.set(key, ref);
    return this.table.size;
  }

  size(): number {
    return this.table.size;
  }

  refFor(key: string): WeakRef<WeakPoint> | undefined {
    return this.table.get(key);
  }

  idFor(key: string): number {
    const ref: WeakRef<WeakPoint> | undefined = this.table.get(key);
    if (ref === undefined) {
      return MISSING;
    }
    const live: WeakPoint | undefined = ref.deref();
    return live === undefined ? MISSING : live.id;
  }

  aliveKeys(): string[] {
    const keys: string[] = [];
    this.table.forEach((ref: WeakRef<WeakPoint>, key: string) => {
      if (ref.deref() !== undefined) {
        keys.push(key);
      }
    });
    return keys;
  }

  clearedCount(): number {
    let cleared: number = 0;
    this.table.forEach((ref: WeakRef<WeakPoint>) => {
      cleared += ref.deref() === undefined ? ONE : ZERO;
    });
    return cleared;
  }
}

class ClosureProbe {
  ref: WeakRef<WeakPoint>;
  reader: () => number;
  calls: number = 0;

  constructor(ref: WeakRef<WeakPoint>, reader: () => number) {
    this.ref = ref;
    this.reader = reader;
  }

  read(): number {
    this.calls++;
    return this.reader();
  }

  callCount(): number {
    return this.calls;
  }

  cleared(): boolean {
    return this.ref.deref() === undefined;
  }
}

class RetainBox {
  kept: WeakPoint[] = [];

  keep(point: WeakPoint): number {
    this.kept.push(point);
    return this.kept.length;
  }

  dropAll(): number {
    const dropped: number = this.kept.length;
    this.kept = [];
    return dropped;
  }

  size(): number {
    return this.kept.length;
  }

  idSum(): number {
    let sum: number = 0;
    for (const point of this.kept) {
      sum += point.id;
    }
    return sum;
  }
}

class StepRecord {
  step: number;
  kept: number;
  dropped: number;

  constructor(step: number, kept: number, dropped: number) {
    this.step = step;
    this.kept = kept;
    this.dropped = dropped;
  }
}

class InterleaveProbe {
  box: RetainBox;
  keptRefs: WeakRef<WeakPoint>[];
  droppedRefs: WeakRef<WeakPoint>[];
  steps: StepRecord[];

  constructor(box: RetainBox, keptRefs: WeakRef<WeakPoint>[], droppedRefs: WeakRef<WeakPoint>[],
    steps: StepRecord[]) {
    this.box = box;
    this.keptRefs = keptRefs;
    this.droppedRefs = droppedRefs;
    this.steps = steps;
  }

  keptAlive(): number {
    return countAlive(this.keptRefs);
  }

  droppedCleared(): number {
    return countCleared(this.droppedRefs);
  }
}

class PairRefs {
  parentRef: WeakRef<CycleParent>;
  childRef: WeakRef<CycleChild>;

  constructor(parentRef: WeakRef<CycleParent>, childRef: WeakRef<CycleChild>) {
    this.parentRef = parentRef;
    this.childRef = childRef;
  }

  bothCleared(): boolean {
    return this.parentRef.deref() === undefined && this.childRef.deref() === undefined;
  }

  linkedNow(): boolean {
    const parent: CycleParent | undefined = this.parentRef.deref();
    if (parent === undefined) {
      return false;
    }
    return pairIsLinked(parent);
  }

  tagNow(): number {
    const parent: CycleParent | undefined = this.parentRef.deref();
    return parent === undefined ? MISSING : parent.tag;
  }
}

// objects built here are only reachable through the returned WeakRef
function releasedPoint(id: number): WeakRef<WeakPoint> {
  const point: WeakPoint = new WeakPoint(id);
  return new WeakRef<WeakPoint>(point);
}

function releasedRecord(id: number, itemCount: number): WeakRef<WeakRecord> {
  const record: WeakRecord = new WeakRecord(id, itemCount);
  return new WeakRef<WeakRecord>(record);
}

function releasedEnvelope(id: number, tag: string, metaCount: number): WeakRef<WeakEnvelope> {
  const envelope: WeakEnvelope = new WeakEnvelope(id, tag, metaCount);
  return new WeakRef<WeakEnvelope>(envelope);
}

function retainedPointPair(point: WeakPoint, name: string): DualSlot {
  return new DualSlot(name, new WeakRef<WeakPoint>(point), new WeakRef<WeakPoint>(point));
}

function releasedPointPair(id: number, name: string): DualSlot {
  const point: WeakPoint = new WeakPoint(id);
  return new DualSlot(name, new WeakRef<WeakPoint>(point), new WeakRef<WeakPoint>(point));
}

function releasedPointBatch(count: number, firstId: number): WeakRef<WeakPoint>[] {
  const refs: WeakRef<WeakPoint>[] = [];
  for (let i = 0; i < count; i++) {
    refs.push(releasedPoint(firstId + i));
  }
  return refs;
}

function releasedRefSet(count: number, id: number): WeakRef<WeakPoint>[] {
  const point: WeakPoint = new WeakPoint(id);
  const refs: WeakRef<WeakPoint>[] = [];
  for (let i = 0; i < count; i++) {
    refs.push(new WeakRef<WeakPoint>(point));
  }
  return refs;
}

function makeWeakReader(ref: WeakRef<WeakPoint>): () => number {
  const read: () => number = (): number => {
    const live: WeakPoint | undefined = ref.deref();
    if (live === undefined) {
      return MISSING;
    }
    return live.score();
  };
  return read;
}

function makeWeakIdReader(ref: WeakRef<WeakPoint>): () => number {
  const read: () => number = (): number => {
    const live: WeakPoint | undefined = ref.deref();
    if (live === undefined) {
      return MISSING;
    }
    return live.id;
  };
  return read;
}

function releasedClosureProbe(id: number): ClosureProbe {
  const point: WeakPoint = new WeakPoint(id);
  const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
  return new ClosureProbe(ref, makeWeakReader(ref));
}

function retainedClosureProbe(point: WeakPoint): ClosureProbe {
  const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
  return new ClosureProbe(ref, makeWeakReader(ref));
}

function releasedPairRefs(tag: number): PairRefs {
  const parent: CycleParent = linkPair(tag);
  const child: CycleChild = parent.child as CycleChild;
  return new PairRefs(new WeakRef<CycleParent>(parent), new WeakRef<CycleChild>(child));
}

function releasedRingRef(size: number, payloadLength: number, firstId: number): WeakRef<RingNode> {
  const head: RingNode = buildRing(size, payloadLength, firstId);
  return new WeakRef<RingNode>(head);
}

function buildInterleave(keptCount: number, droppedCount: number, firstId: number): InterleaveProbe {
  const box: RetainBox = new RetainBox();
  const keptRefs: WeakRef<WeakPoint>[] = [];
  const droppedRefs: WeakRef<WeakPoint>[] = [];
  const steps: StepRecord[] = [];
  let offset: number = 0;
  while (keptRefs.length < keptCount || droppedRefs.length < droppedCount) {
    const takeKept: boolean = keptRefs.length < keptCount &&
      (droppedRefs.length >= droppedCount || keptRefs.length <= droppedRefs.length);
    const point: WeakPoint = new WeakPoint(firstId + offset);
    const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
    offset++;
    if (takeKept) {
      box.keep(point);
      keptRefs.push(ref);
    } else {
      droppedRefs.push(ref);
    }
    steps.push(new StepRecord(steps.length + 1, keptRefs.length, droppedRefs.length));
  }
  return new InterleaveProbe(box, keptRefs, droppedRefs, steps);
}

function derefIdSum(refs: WeakRef<WeakPoint>[]): number {
  let sum: number = 0;
  for (const ref of refs) {
    const live: WeakPoint | undefined = ref.deref();
    if (live !== undefined) {
      sum += live.id;
    }
  }
  return sum;
}

export default function gcWeakRefLifecycleTest() {
  describe('GcWeakRefLifecycle', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0100
     * @tc.name      testWeakRefRetainedPoint0001
     * @tc.desc      Hold a point strongly and through a WeakRef, hint a collection and check the deref still returns the
     *               same instance with its derived value intact
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefRetainedPoint0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(41);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      hintGC();
      const sink: number = sweepPressure();
      const live: WeakPoint | undefined = ref.deref();
      const expectedId: number = 41;
      const expectedScore: number = 123;
      const expectedLabel: string = 'point-41';
      logCase('testWeakRefRetainedPoint0001', `id=${point.id} alive=${live !== undefined} sink=${sink}`);
      expect(live === point).assertTrue();
      expect((live as WeakPoint).score()).assertEqual(expectedScore);
      expect(point.id).assertEqual(expectedId);
      expect((live as WeakPoint).label()).assertEqual(expectedLabel);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0200
     * @tc.name      testWeakRefRetainedRecord0001
     * @tc.desc      Hold a record with a numeric payload strongly, hint a collection and check the array contents survive
     *               unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefRetainedRecord0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const record: WeakRecord = new WeakRecord(7, 16);
      const ref: WeakRef<WeakRecord> = new WeakRef<WeakRecord>(record);
      hintGC();
      const sink: number = sweepPressure();
      const live: WeakRecord | undefined = ref.deref();
      const expectedTotal: number = 7 * 16;
      const expectedSize: number = 16;
      const expectedLabel: string = 'rec-7';
      logCase('testWeakRefRetainedRecord0001', `size=${record.size()} total=${record.total()} sink=${sink}`);
      expect(live === record).assertTrue();
      expect((live as WeakRecord).total()).assertEqual(expectedTotal);
      expect((live as WeakRecord).size()).assertEqual(expectedSize);
      expect(record.label).assertEqual(expectedLabel);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0300
     * @tc.name      testWeakRefRetainedEnvelope0001
     * @tc.desc      Keep an envelope whose inner point and meta record are separately weakly observed and check every
     *               part stays reachable through the outer object
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRetainedEnvelope0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const envelope: WeakEnvelope = new WeakEnvelope(12, 'env', 8);
      const outerRef: WeakRef<WeakEnvelope> = new WeakRef<WeakEnvelope>(envelope);
      const innerRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(envelope.inner);
      hintGC();
      sweepPressure();
      const live: WeakEnvelope | undefined = outerRef.deref();
      const expectedInnerId: number = 12;
      const expectedMetaTotal: number = 12 * 8;
      logCase('testWeakRefRetainedEnvelope0001', `id=${envelope.id} tag=${envelope.tag} ` +
        `innerAlive=${innerRef.deref() !== undefined}`);
      expect(live === envelope).assertTrue();
      expect((live as WeakEnvelope).innerId()).assertEqual(expectedInnerId);
      expect(innerRef.deref() === envelope.inner).assertTrue();
      expect((live as WeakEnvelope).meta.total()).assertEqual(expectedMetaTotal);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0400
     * @tc.name      testWeakRefRetainedBatch0001
     * @tc.desc      Retain points in batches of two, three and four, hold one WeakRef per point and check every deref
     *               still matches the retained element at the same index
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRetainedBatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const refs: WeakRef<WeakPoint>[] = [];
      const kept: WeakPoint[] = [];
      for (const size of BATCH_SIZES) {
        for (let i = 0; i < size; i++) {
          const point: WeakPoint = new WeakPoint(size * 10 + i);
          kept.push(point);
          refs.push(new WeakRef<WeakPoint>(point));
        }
      }
      hintGC();
      const sink: number = sweepPressure();
      let matched: number = 0;
      refs.forEach((ref: WeakRef<WeakPoint>, index: number) => {
        matched += ref.deref() === kept[index] ? ONE : ZERO;
      });
      const expectedCount: number = 9;
      const expectedSum: number = 300;
      logCase('testWeakRefRetainedBatch0001', `count=${refs.length} matched=${matched} sum=${derefIdSum(refs)} ` +
        `sink=${sink}`);
      expect(refs.length).assertEqual(expectedCount);
      expect(kept.length).assertEqual(expectedCount);
      expect(matched).assertEqual(expectedCount);
      expect(derefIdSum(refs)).assertEqual(expectedSum);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0500
     * @tc.name      testWeakRefDerefTwice0001
     * @tc.desc      Deref the same WeakRef before and after a hinted collection and check both reads return one and the
     *               same instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefDerefTwice0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(88);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const first: WeakPoint | undefined = ref.deref();
      hintGC();
      sweepPressure();
      const second: WeakPoint | undefined = ref.deref();
      const expectedId: number = 88;
      logCase('testWeakRefDerefTwice0001', `firstAlive=${first !== undefined} secondAlive=${second !== undefined}`);
      expect(first === second).assertTrue();
      expect(first === point).assertTrue();
      expect((second as WeakPoint).id).assertEqual(expectedId);
      expect((first as WeakPoint).score()).assertEqual(expectedId * 3);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0600
     * @tc.name      testWeakRefDerefAfterCycle0001
     * @tc.desc      Wait for a real collection cycle while the target stays strongly referenced and check the WeakRef is
     *               not cleared by the cycle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefDerefAfterCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const point: WeakPoint = new WeakPoint(19);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const cycles: number = await runGcCycles(ONE, COLLECT_ROUNDS);
      const live: WeakPoint | undefined = ref.deref();
      const minCycles: number = 1;
      const expectedScore: number = 57;
      logCase('testWeakRefDerefAfterCycle0001', `cycles=${cycles} alive=${live !== undefined}`);
      expect(cycles >= minCycles).assertTrue();
      expect(live === point).assertTrue();
      expect((live as WeakPoint).score()).assertEqual(expectedScore);
      expect(point.id).assertEqual(19);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0700
     * @tc.name      testWeakRefRetainedPayloadMatrix0001
     * @tc.desc      Fill the payload size matrix with zero, one, sixteen, 256 and 2048 element records and check each
     *               weakly observed record keeps its own length and total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRetainedPayloadMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      const records: WeakRecord[] = [];
      const refs: WeakRef<WeakRecord>[] = [];
      for (const size of PAYLOAD_SIZES) {
        const record: WeakRecord = new WeakRecord(size, size);
        records.push(record);
        refs.push(new WeakRef<WeakRecord>(record));
      }
      hintGC();
      const sink: number = sweepPressure();
      let matched: number = 0;
      refs.forEach((ref: WeakRef<WeakRecord>, index: number) => {
        const live: WeakRecord | undefined = ref.deref();
        if (live !== undefined && live === records[index] &&
          live.total() === PAYLOAD_SIZES[index] * PAYLOAD_SIZES[index]) {
          matched++;
        }
      });
      const expectedCount: number = 5;
      const expectedLastTotal: number = 2048 * 2048;
      logCase('testWeakRefRetainedPayloadMatrix0001', `matched=${matched} count=${refs.length} ` +
        `lastTotal=${records[expectedCount - 1].total()} sink=${sink}`);
      expect(refs.length).assertEqual(expectedCount);
      expect(matched).assertEqual(expectedCount);
      expect(records[expectedCount - 1].total()).assertEqual(expectedLastTotal);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0800
     * @tc.name      testWeakRefRetainedMapValue0001
     * @tc.desc      Keep points as Map values and WeakRefs under the same keys, then check every deref still resolves to
     *               the value stored under that key after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRetainedMapValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const values: Map<string, WeakPoint> = new Map<string, WeakPoint>();
      const refs: Map<string, WeakRef<WeakPoint>> = new Map<string, WeakRef<WeakPoint>>();
      for (let i = 0; i < SLOT_NAMES.length; i++) {
        const point: WeakPoint = new WeakPoint(i + 3);
        values.set(SLOT_NAMES[i], point);
        refs.set(SLOT_NAMES[i], new WeakRef<WeakPoint>(point));
      }
      hintGC();
      sweepPressure();
      let matched: number = 0;
      refs.forEach((ref: WeakRef<WeakPoint>, key: string) => {
        matched += ref.deref() === values.get(key) ? ONE : ZERO;
      });
      const firstRef: WeakRef<WeakPoint> = refs.get(SLOT_NAMES[0]) as WeakRef<WeakPoint>;
      logCase('testWeakRefRetainedMapValue0001', `keys=${refs.size} matched=${matched} ` +
        `firstId=${(firstRef.deref() as WeakPoint).id}`);
      expect(refs.size).assertEqual(SLOT_NAMES.length);
      expect(matched).assertEqual(SLOT_NAMES.length);
      expect(firstRef.deref() === values.get(SLOT_NAMES[0])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_0900
     * @tc.name      testWeakRefRetainedArrayElement0001
     * @tc.desc      Keep three points in one array and one WeakRef per element, then check the deref order and id sum
     *               match the retained array after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefRetainedArrayElement0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const kept: WeakPoint[] = [new WeakPoint(2), new WeakPoint(4), new WeakPoint(6)];
      const refs: WeakRef<WeakPoint>[] = kept.map((point: WeakPoint) => new WeakRef<WeakPoint>(point));
      hintGC();
      sweepPressure();
      const ids: number[] = [];
      refs.forEach((ref: WeakRef<WeakPoint>) => {
        const live: WeakPoint | undefined = ref.deref();
        if (live !== undefined) {
          ids.push(live.id);
        }
      });
      const expectedIds: number[] = [2, 4, 6];
      const expectedSum: number = 12;
      logCase('testWeakRefRetainedArrayElement0001', `ids=${ids.join(',')} sum=${derefIdSum(refs)}`);
      expect(ids.length).assertEqual(kept.length);
      expect(allAlive(refs)).assertTrue();
      expect(sameNumbers(ids, expectedIds)).assertTrue();
      expect(derefIdSum(refs)).assertEqual(expectedSum);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1000
     * @tc.name      testWeakRefRetainedFieldSlot0001
     * @tc.desc      Store a WeakRef in a class field, hint a collection and check the field still reports the live id and
     *               is not flagged as cleared
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefRetainedFieldSlot0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(30);
      const slot: PointSlot = new PointSlot(SLOT_NAMES[0], new WeakRef<WeakPoint>(point));
      hintGC();
      const sink: number = sweepPressure();
      const expectedId: number = 30;
      logCase('testWeakRefRetainedFieldSlot0001', `slot=${slot.name} id=${slot.idOrMissing()} ` +
        `cleared=${slot.cleared()} sink=${sink}`);
      expect(slot.idOrMissing()).assertEqual(expectedId);
      expect(slot.cleared()).assertFalse();
      expect(slot.ref.deref() === point).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1100
     * @tc.name      testWeakRefRetainedNestedInner0001
     * @tc.desc      Observe an envelope, its inner point and its meta record through three WeakRefs and check all three
     *               parts are still the same instances after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRetainedNestedInner0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const envelope: WeakEnvelope = new WeakEnvelope(4, 'nested', 32);
      const outerRef: WeakRef<WeakEnvelope> = new WeakRef<WeakEnvelope>(envelope);
      const innerRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(envelope.inner);
      const metaRef: WeakRef<WeakRecord> = new WeakRef<WeakRecord>(envelope.meta);
      hintGC();
      sweepPressure();
      const outer: WeakEnvelope | undefined = outerRef.deref();
      const expectedInnerId: number = 4;
      const expectedMetaTotal: number = 4 * 32;
      logCase('testWeakRefRetainedNestedInner0001', `outerAlive=${outer !== undefined} ` +
        `innerAlive=${innerRef.deref() !== undefined} metaAlive=${metaRef.deref() !== undefined}`);
      expect(outer === envelope).assertTrue();
      expect(innerRef.deref() === envelope.inner).assertTrue();
      expect(metaRef.deref() === envelope.meta).assertTrue();
      expect((outer as WeakEnvelope).inner.id).assertEqual(expectedInnerId);
      expect((metaRef.deref() as WeakRecord).total()).assertEqual(expectedMetaTotal);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1200
     * @tc.name      testWeakRefRetainedSummary0001
     * @tc.desc      Observe one point, one record and one envelope through Object typed WeakRefs and check the whole set
     *               stays alive with the record payload unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRetainedSummary0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(1);
      const record: WeakRecord = new WeakRecord(2, 4);
      const envelope: WeakEnvelope = new WeakEnvelope(3, 'sum', 2);
      const refs: WeakRef<Object>[] = [
        new WeakRef<Object>(point), new WeakRef<Object>(record), new WeakRef<Object>(envelope)
      ];
      const aliveBefore: number = countAlive(refs);
      hintGC();
      sweepPressure();
      const aliveAfter: number = countAlive(refs);
      const expectedAlive: number = 3;
      const expectedTotal: number = 8;
      logCase('testWeakRefRetainedSummary0001', `before=${aliveBefore} after=${aliveAfter} ` +
        `recordTotal=${record.total()}`);
      expect(aliveBefore).assertEqual(expectedAlive);
      expect(aliveAfter).assertEqual(expectedAlive);
      expect(refs[0].deref() === point).assertTrue();
      expect(record.total()).assertEqual(expectedTotal);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1300
     * @tc.name      testWeakRefReleasedPoint0001
     * @tc.desc      Build a point inside a plain function so only its WeakRef escapes, then hint and press the collector
     *               until the deref reports that the target is gone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefReleasedPoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(51);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const maxRounds: number = WEAK_ROUNDS;
      logCase('testWeakRefReleasedPoint0001', `rounds=${rounds} cleared=${isCleared(ref)}`);
      expect(rounds > 0).assertTrue();
      expect(rounds <= maxRounds).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(ref.deref() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1400
     * @tc.name      testWeakRefReleasedRecord0001
     * @tc.desc      Release a record with a sixty four element payload and check the weakly observed array object is
     *               reclaimed as well
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedRecord0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakRecord> = releasedRecord(9, 64);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const beforeBlur: number = gcStat(KEY_GC_COUNT);
      logCase('testWeakRefReleasedRecord0001', `rounds=${rounds} count=${beforeBlur} cleared=${isCleared(ref)}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(beforeBlur >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1500
     * @tc.name      testWeakRefReleasedEnvelope0001
     * @tc.desc      Release an envelope graph that links an inner point and a meta record and check the WeakRef to the
     *               envelope is cleared after collection rounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedEnvelope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakEnvelope> = releasedEnvelope(23, 'gone', 16);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const cleared: boolean = isCleared(ref);
      logCase('testWeakRefReleasedEnvelope0001', `rounds=${rounds} cleared=${cleared} max=${WEAK_ROUNDS}`);
      expect(rounds > 0).assertTrue();
      expect(cleared).assertTrue();
      expect(ref.deref() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1600
     * @tc.name      testWeakRefReleasedEmptyPayload0001
     * @tc.desc      Release a record whose payload array is empty and check the empty array does not keep the record
     *               reachable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedEmptyPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const emptyLength: number = PAYLOAD_SIZES[0];
      const ref: WeakRef<WeakRecord> = releasedRecord(3, emptyLength);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const expectedEmpty: number = 0;
      logCase('testWeakRefReleasedEmptyPayload0001', `payload=${emptyLength} rounds=${rounds} ` +
        `cleared=${isCleared(ref)}`);
      expect(emptyLength).assertEqual(expectedEmpty);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1700
     * @tc.name      testWeakRefReleasedWidePayload0001
     * @tc.desc      Release a record holding a 2048 element payload and check the wide array is reclaimed together with
     *               its owner
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedWidePayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const wideLength: number = PAYLOAD_SIZES[PAYLOAD_SIZES.length - 1];
      const ref: WeakRef<WeakRecord> = releasedRecord(5, wideLength);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const expectedWide: number = 2048;
      logCase('testWeakRefReleasedWidePayload0001', `length=${wideLength} rounds=${rounds}`);
      expect(wideLength).assertEqual(expectedWide);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1800
     * @tc.name      testWeakRefReleasedAfterPressure0001
     * @tc.desc      Allocate twenty thousand helper nodes first and then release a point, checking the pre-existing
     *               garbage does not stop the point from being cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedAfterPressure0001', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const sink: number = allocatePressure();
      const ref: WeakRef<WeakPoint> = releasedPoint(71);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      logCase('testWeakRefReleasedAfterPressure0001', `sink=${sink} rounds=${rounds} cleared=${isCleared(ref)}`);
      expect(sink > 0).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_1900
     * @tc.name      testWeakRefReleasedSequentialIds0001
     * @tc.desc      Release one point per batch size in sequence and check each release is observed as cleared within
     *               the round budget
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedSequentialIds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const rounds: number[] = [];
      for (const size of BATCH_SIZES) {
        const ref: WeakRef<WeakPoint> = releasedPoint(size * 100);
        rounds.push(await collectWeak(ref, WEAK_ROUNDS));
      }
      const expectedCount: number = 3;
      logCase('testWeakRefReleasedSequentialIds0001', `rounds=${rounds.join(',')} batches=${BATCH_SIZES.length}`);
      expect(rounds.length).assertEqual(expectedCount);
      expect(rounds.every((value: number) => value > 0)).assertTrue();
      expect(rounds.every((value: number) => value <= WEAK_ROUNDS)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2000
     * @tc.name      testWeakRefReleasedRoundBudget0001
     * @tc.desc      Measure the wall clock time needed to observe one released point and check the collection does not
     *               need more than the round budget
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL2
     */
    it('testWeakRefReleasedRoundBudget0001', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(88);
      const start: number = Date.now();
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const elapsed: number = Date.now() - start;
      const budgetMs: number = WEAK_ROUNDS * (2 * WEAK_WAIT_MS + 400);
      logCase('testWeakRefReleasedRoundBudget0001', `rounds=${rounds} elapsed=${elapsed} budget=${budgetMs}`);
      expect(rounds > 0).assertTrue();
      expect(elapsed <= budgetMs).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2100
     * @tc.name      testWeakRefReleasedSnapshot0001
     * @tc.desc      Take runtime snapshots around the release of one point and check the collection counter and byte
     *               counters move monotonically
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedSnapshot0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const ref: WeakRef<WeakPoint> = releasedPoint(64);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testWeakRefReleasedSnapshot0001', `rounds=${rounds} countDelta=${after.count - before.count} ` +
        `freed=${after.freed} allocated=${after.allocated}`);
      expect(rounds > 0).assertTrue();
      expect(after.count > before.count).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(after.freed <= after.allocated).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2200
     * @tc.name      testWeakRefReleasedTwinRefs0001
     * @tc.desc      Create two WeakRefs to one released point and check both views go to undefined in the same
     *               collection sequence
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedTwinRefs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pair: DualSlot = releasedPointPair(77, 'twin');
      const refs: WeakRef<WeakPoint>[] = [pair.primary, pair.secondary];
      const rounds: number = await collectWeakAll(refs, WEAK_ROUNDS);
      const expectedCleared: number = 2;
      logCase('testWeakRefReleasedTwinRefs0001', `rounds=${rounds} cleared=${countCleared(refs)} ` +
        `bothCleared=${pair.bothCleared()}`);
      expect(rounds > 0).assertTrue();
      expect(pair.bothCleared()).assertTrue();
      expect(countCleared(refs)).assertEqual(expectedCleared);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2300
     * @tc.name      testWeakRefReleasedTripleRefs0001
     * @tc.desc      Create three WeakRefs to one released point and check all three are cleared and none of them ever
     *               reported a different id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefReleasedTripleRefs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const refs: WeakRef<WeakPoint>[] = releasedRefSet(3, 31);
      const rounds: number = await collectWeakAll(refs, WEAK_ROUNDS);
      const expectedSize: number = 3;
      logCase('testWeakRefReleasedTripleRefs0001', `rounds=${rounds} size=${refs.length} ` +
        `cleared=${countCleared(refs)}`);
      expect(refs.length).assertEqual(expectedSize);
      expect(rounds > 0).assertTrue();
      expect(allCleared(refs)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2400
     * @tc.name      testWeakRefReleasedFourRefs0001
     * @tc.desc      Create four WeakRefs to one released point and check the cleared count reaches the full group size
     *               within the round budget
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefReleasedFourRefs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<WeakPoint>[] = releasedRefSet(4, 44);
      const rounds: number = await collectWeakAll(refs, WEAK_ROUNDS);
      const expectedSize: number = 4;
      logCase('testWeakRefReleasedFourRefs0001', `rounds=${rounds} size=${refs.length} ` +
        `derefSum=${derefIdSum(refs)}`);
      expect(rounds > 0).assertTrue();
      expect(refs.length).assertEqual(expectedSize);
      expect(countCleared(refs)).assertEqual(expectedSize);
      expect(derefIdSum(refs)).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2500
     * @tc.name      testWeakRefMultiRefCounts0001
     * @tc.desc      Register two, three, four and five WeakRefs to one retained point and check every registered view
     *               resolves to the same instance after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefMultiRefCounts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(15);
      const allRefs: WeakRef<WeakPoint>[] = [];
      const groupSizes: number[] = [];
      for (const count of REF_COUNTS) {
        const groupStart: number = allRefs.length;
        for (let i = 0; i < count; i++) {
          allRefs.push(new WeakRef<WeakPoint>(point));
        }
        groupSizes.push(allRefs.length - groupStart);
      }
      hintGC();
      const sink: number = sweepPressure();
      let sameInstance: number = 0;
      allRefs.forEach((ref: WeakRef<WeakPoint>) => {
        sameInstance += ref.deref() === point ? ONE : ZERO;
      });
      const expectedRefs: number = 14;
      logCase('testWeakRefMultiRefCounts0001', `groups=${groupSizes.join(',')} refs=${allRefs.length} ` +
        `same=${sameInstance} sink=${sink}`);
      expect(groupSizes.length).assertEqual(REF_COUNTS.length);
      expect(groupSizes[0]).assertEqual(REF_COUNTS[0]);
      expect(allRefs.length).assertEqual(expectedRefs);
      expect(sameInstance).assertEqual(expectedRefs);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2600
     * @tc.name      testWeakRefMultiRefIdentity0001
     * @tc.desc      Compare two WeakRefs to one point with a WeakRef to a different point and check only the shared
     *               target collapses to one instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefMultiRefIdentity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const first: WeakPoint = new WeakPoint(101);
      const second: WeakPoint = new WeakPoint(202);
      const firstRefA: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(first);
      const firstRefB: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(first);
      const secondRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(second);
      hintGC();
      sweepPressure();
      const a: WeakPoint | undefined = firstRefA.deref();
      const b: WeakPoint | undefined = firstRefB.deref();
      const c: WeakPoint | undefined = secondRef.deref();
      logCase('testWeakRefMultiRefIdentity0001', `sameTarget=${a === b} crossTarget=${a === c} ` +
        `secondId=${(c as WeakPoint).id}`);
      expect(a === b).assertTrue();
      expect(a === c).assertFalse();
      expect((a as WeakPoint).id).assertEqual(101);
      expect((c as WeakPoint).id).assertEqual(202);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2700
     * @tc.name      testWeakRefMultiRefArray0001
     * @tc.desc      Put five WeakRefs to one retained point into a plain array and check every deref reports the same id
     *               and the id sum equals five times that id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMultiRefArray0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(8);
      const refs: WeakRef<WeakPoint>[] = [];
      const wanted: number = 5;
      for (let i = 0; i < wanted; i++) {
        refs.push(new WeakRef<WeakPoint>(point));
      }
      hintGC();
      sweepPressure();
      const ids: number[] = [];
      refs.forEach((ref: WeakRef<WeakPoint>) => {
        const live: WeakPoint | undefined = ref.deref();
        if (live !== undefined) {
          ids.push(live.id);
        }
      });
      const expectedId: number = 8;
      const expectedSum: number = 40;
      logCase('testWeakRefMultiRefArray0001', `refs=${refs.length} ids=${ids.join(',')} ` +
        `sum=${derefIdSum(refs)}`);
      expect(refs.length).assertEqual(wanted);
      expect(ids.length).assertEqual(wanted);
      expect(ids.every((id: number) => id === expectedId)).assertTrue();
      expect(derefIdSum(refs)).assertEqual(expectedSum);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2800
     * @tc.name      testWeakRefMultiRefMap0001
     * @tc.desc      Store WeakRefs to one retained point under three different map keys and check every key resolves to
     *               the same id while nothing is reported as cleared
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMultiRefMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(6);
      const table: RefTable = new RefTable('multi');
      for (const name of SLOT_NAMES) {
        table.put(name, new WeakRef<WeakPoint>(point));
      }
      hintGC();
      sweepPressure();
      const ids: number[] = [];
      SLOT_NAMES.forEach((name: string) => {
        ids.push(table.idFor(name));
      });
      const expectedId: number = 6;
      const expectedCleared: number = 0;
      logCase('testWeakRefMultiRefMap0001', `size=${table.size()} ids=${ids.join(',')} ` +
        `aliveKeys=${table.aliveKeys().join(',')}`);
      expect(table.size()).assertEqual(SLOT_NAMES.length);
      expect(ids.every((id: number) => id === expectedId)).assertTrue();
      expect(table.aliveKeys().length).assertEqual(SLOT_NAMES.length);
      expect(table.clearedCount()).assertEqual(expectedCleared);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_2900
     * @tc.name      testWeakRefMultiRefCleared0001
     * @tc.desc      Release one point observed by two WeakRefs and check both views become undefined and the deref id
     *               sum drops to zero
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMultiRefCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const refs: WeakRef<WeakPoint>[] = releasedRefSet(2, 55);
      const rounds: number = await collectWeakAll(refs, WEAK_ROUNDS);
      const expectedSize: number = 2;
      logCase('testWeakRefMultiRefCleared0001', `rounds=${rounds} size=${refs.length} ` +
        `cleared=${countCleared(refs)}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(refs[0])).assertTrue();
      expect(isCleared(refs[1])).assertTrue();
      expect(refs.length).assertEqual(expectedSize);
      expect(derefIdSum(refs)).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3000
     * @tc.name      testWeakRefMultiRefPartial0001
     * @tc.desc      Observe one retained point and one released point with two WeakRefs each and check only the released
     *               group is cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMultiRefPartial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const kept: WeakPoint = new WeakPoint(12);
      const keptRefs: WeakRef<WeakPoint>[] = [new WeakRef<WeakPoint>(kept), new WeakRef<WeakPoint>(kept)];
      const droppedRefs: WeakRef<WeakPoint>[] = releasedRefSet(2, 13);
      const rounds: number = await collectWeakAll(droppedRefs, WEAK_ROUNDS);
      const expectedGroup: number = 2;
      logCase('testWeakRefMultiRefPartial0001', `rounds=${rounds} keptAlive=${countAlive(keptRefs)} ` +
        `droppedCleared=${countCleared(droppedRefs)}`);
      expect(rounds > 0).assertTrue();
      expect(countCleared(droppedRefs)).assertEqual(expectedGroup);
      expect(countAlive(keptRefs)).assertEqual(expectedGroup);
      expect(keptRefs[0].deref() === kept).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3100
     * @tc.name      testWeakRefMultiRefDualSlot0001
     * @tc.desc      Keep two WeakRefs to one point inside a dual slot object and check the slot reports one shared
     *               target that is still alive after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefMultiRefDualSlot0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(42);
      const slot: DualSlot = retainedPointPair(point, SLOT_NAMES[1]);
      hintGC();
      const sink: number = sweepPressure();
      const expectedId: number = 42;
      logCase('testWeakRefMultiRefDualSlot0001', `slot=${slot.name} same=${slot.sameTarget()} ` +
        `primaryId=${slot.primaryId()} sink=${sink}`);
      expect(slot.sameTarget()).assertTrue();
      expect(slot.bothCleared()).assertFalse();
      expect(slot.primaryId()).assertEqual(expectedId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3200
     * @tc.name      testWeakRefMultiRefDuplicate0001
     * @tc.desc      Put the same WeakRef object twice into one bucket and check the bucket counts two entries but the
     *               single target is observed as cleared once the point is gone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMultiRefDuplicate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(17);
      const bucket: RefBucket = new RefBucket('dup');
      bucket.add(ref);
      bucket.add(ref);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const expectedEntries: number = 2;
      logCase('testWeakRefMultiRefDuplicate0001', `entries=${bucket.size()} rounds=${rounds} ` +
        `cleared=${bucket.clearedCount()}`);
      expect(bucket.size()).assertEqual(expectedEntries);
      expect(rounds > 0).assertTrue();
      expect(bucket.clearedCount()).assertEqual(expectedEntries);
      expect(bucket.aliveIds().length).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3300
     * @tc.name      testWeakRefMultiRefIndependent0001
     * @tc.desc      Observe a retained point and a released point with separate WeakRefs and check the retained view
     *               survives while the released view is cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMultiRefIndependent0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const kept: WeakPoint = new WeakPoint(1);
      const keptRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(kept);
      const droppedRef: WeakRef<WeakPoint> = releasedPoint(2);
      const rounds: number = await collectWeak(droppedRef, WEAK_ROUNDS);
      const expectedId: number = 1;
      logCase('testWeakRefMultiRefIndependent0001', `rounds=${rounds} droppedCleared=${isCleared(droppedRef)} ` +
        `keptId=${(keptRef.deref() as WeakPoint).id}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(droppedRef)).assertTrue();
      expect(keptRef.deref() === kept).assertTrue();
      expect((keptRef.deref() as WeakPoint).id).assertEqual(expectedId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3400
     * @tc.name      testWeakRefMultiRefIdSum0001
     * @tc.desc      Release four points with consecutive ids and check that at least two of the four WeakRefs are
     *               cleared while the surviving ids stay inside the released range
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefMultiRefIdSum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<WeakPoint>[] = releasedPointBatch(4, 300);
      const wantedCleared: number = 2;
      const rounds: number = await collectWeakSome(refs, wantedCleared, WEAK_ROUNDS);
      const cleared: number = countCleared(refs);
      const alive: number = countAlive(refs);
      const sum: number = derefIdSum(refs);
      const expectedTotal: number = 4;
      const maxSum: number = 300 + 301 + 302 + 303;
      logCase('testWeakRefMultiRefIdSum0001', `rounds=${rounds} cleared=${cleared} alive=${alive} sum=${sum}`);
      expect(rounds > 0).assertTrue();
      expect(cleared + alive).assertEqual(expectedTotal);
      expect(cleared >= wantedCleared).assertTrue();
      expect(sum >= ZERO && sum <= maxSum).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3500
     * @tc.name      testWeakRefArrayStore0001
     * @tc.desc      Keep two WeakRefs in a bucket array and check the bucket reports no cleared entries and lists the
     *               retained ids in insertion order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefArrayStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const first: WeakPoint = new WeakPoint(11);
      const second: WeakPoint = new WeakPoint(13);
      const bucket: RefBucket = new RefBucket('store');
      bucket.add(new WeakRef<WeakPoint>(first));
      bucket.add(new WeakRef<WeakPoint>(second));
      hintGC();
      sweepPressure();
      const ids: number[] = bucket.aliveIds();
      const expectedIds: number[] = [11, 13];
      logCase('testWeakRefArrayStore0001', `label=${bucket.label} ids=${ids.join(',')} ` +
        `cleared=${bucket.clearedCount()}`);
      expect(bucket.size()).assertEqual(expectedIds.length);
      expect(sameNumbers(ids, expectedIds)).assertTrue();
      expect(bucket.clearedCount()).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3600
     * @tc.name      testWeakRefArrayStoreMatrix0001
     * @tc.desc      Fill buckets of two, three and four entries with distinct retained points and check each bucket keeps
     *               its exact size and a sequential id list
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefArrayStoreMatrix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const buckets: RefBucket[] = [];
      const kept: WeakPoint[] = [];
      for (const size of BATCH_SIZES) {
        const bucket: RefBucket = new RefBucket(`bucket-${size}`);
        for (let i = 0; i < size; i++) {
          const point: WeakPoint = new WeakPoint(size * 100 + i);
          kept.push(point);
          bucket.add(new WeakRef<WeakPoint>(point));
        }
        buckets.push(bucket);
      }
      hintGC();
      const sizes: number[] = [];
      const cleared: number[] = [];
      const sequential: boolean[] = [];
      buckets.forEach((bucket: RefBucket, index: number) => {
        sizes.push(bucket.size());
        cleared.push(bucket.clearedCount());
        const expectedSize: number = BATCH_SIZES[index];
        sequential.push(bucket.aliveIds().every((id: number, position: number) =>
          id === expectedSize * 100 + position));
      });
      const expectedSizes: number[] = [2, 3, 4];
      logCase('testWeakRefArrayStoreMatrix0001', `sizes=${sizes.join(',')} buckets=${buckets.length} ` +
        `kept=${kept.length}`);
      expect(sameNumbers(sizes, expectedSizes)).assertTrue();
      expect(cleared.every((value: number) => value === ZERO)).assertTrue();
      expect(sequential.every((ok: boolean) => ok)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3700
     * @tc.name      testWeakRefArrayReleasedCleared0001
     * @tc.desc      Put three WeakRefs to released points into a bucket and check the cleared count grows to the whole
     *               bucket and the alive id list empties
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefArrayReleasedCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<WeakPoint>[] = releasedPointBatch(3, 500);
      const bucket: RefBucket = new RefBucket('released');
      for (const ref of refs) {
        bucket.add(ref);
      }
      const wantedCleared: number = 2;
      const rounds: number = await collectWeakSome(refs, wantedCleared, WEAK_ROUNDS);
      const cleared: number = bucket.clearedCount();
      const expectedEntries: number = 3;
      logCase('testWeakRefArrayReleasedCleared0001', `rounds=${rounds} entries=${bucket.size()} ` +
        `cleared=${cleared}`);
      expect(bucket.size()).assertEqual(expectedEntries);
      expect(rounds > 0).assertTrue();
      expect(cleared >= wantedCleared).assertTrue();
      expect(bucket.aliveIds().length).assertEqual(expectedEntries - cleared);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3800
     * @tc.name      testWeakRefArrayPushPop0001
     * @tc.desc      Move a single WeakRef between two buckets with pop and add, then check the source bucket is empty and
     *               the target still observes the released point as cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefArrayPushPop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const dropped: WeakRef<WeakPoint> = releasedPoint(9);
      const source: RefBucket = new RefBucket('source');
      const target: RefBucket = new RefBucket('target');
      source.add(dropped);
      const beforeSize: number = source.size();
      while (source.size() > 0) {
        const moved: WeakRef<WeakPoint> | undefined = source.refs.pop();
        if (moved !== undefined) {
          target.add(moved);
        }
      }
      const rounds: number = await collectWeak(dropped, WEAK_ROUNDS);
      const expectedKept: number = 1;
      logCase('testWeakRefArrayPushPop0001', `before=${beforeSize} source=${source.size()} ` +
        `target=${target.size()} rounds=${rounds}`);
      expect(beforeSize).assertEqual(expectedKept);
      expect(source.size()).assertEqual(ZERO);
      expect(target.size()).assertEqual(expectedKept);
      expect(rounds > 0).assertTrue();
      expect(target.clearedCount()).assertEqual(expectedKept);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_3900
     * @tc.name      testWeakRefMapStore0001
     * @tc.desc      Store three WeakRefs in a named table and check every key resolves to its retained id after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefMapStore0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const table: RefTable = new RefTable('store');
      const points: WeakPoint[] = [new WeakPoint(31), new WeakPoint(32), new WeakPoint(33)];
      for (let i = 0; i < SLOT_NAMES.length; i++) {
        table.put(SLOT_NAMES[i], new WeakRef<WeakPoint>(points[i]));
      }
      hintGC();
      sweepPressure();
      const ids: number[] = [];
      SLOT_NAMES.forEach((name: string) => {
        ids.push(table.idFor(name));
      });
      const expectedIds: number[] = [31, 32, 33];
      logCase('testWeakRefMapStore0001', `name=${table.name} ids=${ids.join(',')} keys=${table.size()}`);
      expect(table.size()).assertEqual(SLOT_NAMES.length);
      expect(sameNumbers(ids, expectedIds)).assertTrue();
      expect(table.aliveKeys().length).assertEqual(SLOT_NAMES.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4000
     * @tc.name      testWeakRefMapKeyCount0001
     * @tc.desc      Write the same key twice with two different points and check the table keeps one entry whose deref
     *               reports the newer point while an unused key reports the missing marker
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMapKeyCount0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: WeakPoint = new WeakPoint(1);
      const second: WeakPoint = new WeakPoint(2);
      const table: RefTable = new RefTable('keys');
      table.put(SLOT_NAMES[0], new WeakRef<WeakPoint>(first));
      table.put(SLOT_NAMES[0], new WeakRef<WeakPoint>(second));
      hintGC();
      const expectedSize: number = 1;
      const expectedId: number = 2;
      logCase('testWeakRefMapKeyCount0001', `size=${table.size()} id=${table.idFor(SLOT_NAMES[0])} ` +
        `unused=${table.idFor(SLOT_NAMES[2])}`);
      expect(table.size()).assertEqual(expectedSize);
      expect(table.idFor(SLOT_NAMES[0])).assertEqual(expectedId);
      expect(table.idFor(SLOT_NAMES[2])).assertEqual(MISSING);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4100
     * @tc.name      testWeakRefMapReleasedCleared0001
     * @tc.desc      Keep only a released point in a table and check the entry survives as a key while its deref is
     *               cleared, so the table reports one cleared entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMapReleasedCleared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(61);
      const table: RefTable = new RefTable('released');
      table.put(SLOT_NAMES[1], ref);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const expectedCleared: number = 1;
      logCase('testWeakRefMapReleasedCleared0001', `rounds=${rounds} size=${table.size()} ` +
        `cleared=${table.clearedCount()} id=${table.idFor(SLOT_NAMES[1])}`);
      expect(table.size()).assertEqual(expectedCleared);
      expect(rounds > 0).assertTrue();
      expect(table.clearedCount()).assertEqual(expectedCleared);
      expect(table.aliveKeys().length).assertEqual(ZERO);
      expect(table.idFor(SLOT_NAMES[1])).assertEqual(MISSING);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4200
     * @tc.name      testWeakRefMapReplace0001
     * @tc.desc      Replace a table entry that observed a released point with an entry observing a retained point and
     *               check the old target is cleared while the new one resolves
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMapReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const dropped: WeakRef<WeakPoint> = releasedPoint(21);
      const table: RefTable = new RefTable('replace');
      table.put(SLOT_NAMES[0], dropped);
      const kept: WeakPoint = new WeakPoint(22);
      table.put(SLOT_NAMES[0], new WeakRef<WeakPoint>(kept));
      const rounds: number = await collectWeak(dropped, WEAK_ROUNDS);
      const expectedSize: number = 1;
      const expectedId: number = 22;
      logCase('testWeakRefMapReplace0001', `rounds=${rounds} size=${table.size()} ` +
        `newId=${table.idFor(SLOT_NAMES[0])}`);
      expect(table.size()).assertEqual(expectedSize);
      expect(rounds > 0).assertTrue();
      expect(isCleared(dropped)).assertTrue();
      expect(table.idFor(SLOT_NAMES[0])).assertEqual(expectedId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4300
     * @tc.name      testWeakRefMapDelete0001
     * @tc.desc      Remove the only table entry and check the map reports zero size while the removed WeakRef still turns
     *               undefined after collection rounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefMapDelete0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const dropped: WeakRef<WeakPoint> = releasedPoint(23);
      const refTable: RefTable = new RefTable('delete');
      refTable.put(SLOT_NAMES[0], dropped);
      const removed: boolean = refTable.table.delete(SLOT_NAMES[0]);
      const rounds: number = await collectWeak(dropped, WEAK_ROUNDS);
      logCase('testWeakRefMapDelete0001', `removed=${removed} size=${refTable.size()} rounds=${rounds}`);
      expect(removed).assertTrue();
      expect(refTable.size()).assertEqual(ZERO);
      expect(rounds > 0).assertTrue();
      expect(isCleared(dropped)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4400
     * @tc.name      testWeakRefFieldReassign0001
     * @tc.desc      Reassign the WeakRef field of a slot from a released point to a retained point and check the old
     *               target is cleared while the field reports the new id
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefFieldReassign0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const dropped: WeakRef<WeakPoint> = releasedPoint(24);
      const slot: PointSlot = new PointSlot(SLOT_NAMES[0], dropped);
      const kept: WeakPoint = new WeakPoint(25);
      slot.ref = new WeakRef<WeakPoint>(kept);
      const rounds: number = await collectWeak(dropped, WEAK_ROUNDS);
      const expectedId: number = 25;
      logCase('testWeakRefFieldReassign0001', `rounds=${rounds} oldCleared=${isCleared(dropped)} ` +
        `slotId=${slot.idOrMissing()}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(dropped)).assertTrue();
      expect(slot.idOrMissing()).assertEqual(expectedId);
      expect(slot.cleared()).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4500
     * @tc.name      testWeakRefFieldNestedHolder0001
     * @tc.desc      Wrap a slot that owns a WeakRef inside a Map and check the deref still resolves through the nested
     *               path after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefFieldNestedHolder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(26);
      const slot: PointSlot = new PointSlot(SLOT_NAMES[2], new WeakRef<WeakPoint>(point));
      const holders: Map<string, PointSlot> = new Map<string, PointSlot>();
      holders.set(SLOT_NAMES[2], slot);
      hintGC();
      sweepPressure();
      const nested: PointSlot = holders.get(SLOT_NAMES[2]) as PointSlot;
      const expectedId: number = 26;
      logCase('testWeakRefFieldNestedHolder0001', `name=${nested.name} id=${nested.idOrMissing()} ` +
        `holders=${holders.size}`);
      expect(nested.name).assertEqual(SLOT_NAMES[2]);
      expect(nested.idOrMissing()).assertEqual(expectedId);
      expect(nested.ref.deref() === point).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4600
     * @tc.name      testWeakRefTableMixedShapes0001
     * @tc.desc      Observe points through a table and a record plus an envelope through plain WeakRefs, then check all
     *               shapes stay reachable in the same job
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefTableMixedShapes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const points: WeakPoint[] = [new WeakPoint(1), new WeakPoint(2)];
      const record: WeakRecord = new WeakRecord(3, 8);
      const envelope: WeakEnvelope = new WeakEnvelope(4, 'mixed', 2);
      const table: RefTable = new RefTable('mixed');
      table.put(SLOT_NAMES[0], new WeakRef<WeakPoint>(points[0]));
      table.put(SLOT_NAMES[1], new WeakRef<WeakPoint>(points[1]));
      const recordRef: WeakRef<WeakRecord> = new WeakRef<WeakRecord>(record);
      const envelopeRef: WeakRef<WeakEnvelope> = new WeakRef<WeakEnvelope>(envelope);
      hintGC();
      sweepPressure();
      const expectedKeys: number = 2;
      const expectedInnerId: number = 4;
      logCase('testWeakRefTableMixedShapes0001', `keys=${table.size()} recordAlive=${recordRef.deref() !== undefined} ` +
        `innerId=${(envelopeRef.deref() as WeakEnvelope).innerId()}`);
      expect(table.size()).assertEqual(expectedKeys);
      expect(table.clearedCount()).assertEqual(ZERO);
      expect(recordRef.deref() === record).assertTrue();
      expect((envelopeRef.deref() as WeakEnvelope).innerId()).assertEqual(expectedInnerId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4700
     * @tc.name      testWeakRefShapePoint0001
     * @tc.desc      Release the smallest shape, a point holding only an id, and check it is cleared while the same shape
     *               built inline still reports the derived score
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefShapePoint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(120);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const inline: WeakPoint = new WeakPoint(120);
      const expectedScore: number = 360;
      const expectedRefs: number = 1;
      logCase('testWeakRefShapePoint0001', `rounds=${rounds} cleared=${isCleared(ref)} ` +
        `inlineScore=${inline.score()}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(countCleared([ref])).assertEqual(expectedRefs);
      expect(inline.score()).assertEqual(expectedScore);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4800
     * @tc.name      testWeakRefShapeRecord0001
     * @tc.desc      Release the medium shape, a record with an id, a label and an array, and check the WeakRef is cleared
     *               while the same shape built inline keeps its total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapeRecord0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakRecord> = releasedRecord(121, 8);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const inline: WeakRecord = new WeakRecord(121, 8);
      const expectedTotal: number = 121 * 8;
      logCase('testWeakRefShapeRecord0001', `rounds=${rounds} cleared=${isCleared(ref)} ` +
        `inlineTotal=${inline.total()}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(inline.total()).assertEqual(expectedTotal);
      expect(inline.label).assertEqual('rec-121');
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_4900
     * @tc.name      testWeakRefShapeEnvelope0001
     * @tc.desc      Release the composite shape, an envelope with an inner point and a meta record, and check the outer
     *               WeakRef is cleared while the inline copy still links its parts
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapeEnvelope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakEnvelope> = releasedEnvelope(122, 'shape', 4);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const inline: WeakEnvelope = new WeakEnvelope(122, 'shape', 4);
      const expectedInnerId: number = 122;
      const expectedMetaTotal: number = 488;
      logCase('testWeakRefShapeEnvelope0001', `rounds=${rounds} cleared=${isCleared(ref)} ` +
        `innerId=${inline.innerId()}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
      expect(inline.innerId()).assertEqual(expectedInnerId);
      expect(inline.meta.total()).assertEqual(expectedMetaTotal);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5000
     * @tc.name      testWeakRefShapePayloadMatrix0001
     * @tc.desc      Release records whose payload grows through the size matrix one at a time and check every release is
     *               cleared within the round budget
     * @tc.size      LARGETEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapePayloadMatrix0001', TestType.FUNCTION | Size.LARGETEST | Level.LEVEL1, async () => {
      const rounds: number[] = [];
      for (const payload of PAYLOAD_SIZES) {
        const ref: WeakRef<WeakRecord> = releasedRecord(payload, payload);
        rounds.push(await collectWeak(ref, WEAK_ROUNDS));
      }
      const expectedRuns: number = 5;
      logCase('testWeakRefShapePayloadMatrix0001', `rounds=${rounds.join(',')} runs=${rounds.length}`);
      expect(rounds.length).assertEqual(expectedRuns);
      expect(rounds.every((value: number) => value > 0)).assertTrue();
      expect(rounds.every((value: number) => value <= WEAK_ROUNDS)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5100
     * @tc.name      testWeakRefShapePayloadRelease0001
     * @tc.desc      Release records sized by the batch table and check the observed collection rounds stay inside the
     *               budget for every size
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefShapePayloadRelease0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const results: number[] = [];
      const payloadUnit: number = PAYLOAD_SIZES[2];
      for (const size of BATCH_SIZES) {
        const ref: WeakRef<WeakRecord> = releasedRecord(size, size * payloadUnit);
        results.push(await collectWeak(ref, WEAK_ROUNDS));
      }
      const expectedRuns: number = 3;
      logCase('testWeakRefShapePayloadRelease0001', `results=${results.join(',')} payloadUnit=${payloadUnit}`);
      expect(results.length).assertEqual(expectedRuns);
      expect(results.every((value: number) => value > 0)).assertTrue();
      expect(results.every((value: number) => value <= WEAK_ROUNDS)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5200
     * @tc.name      testWeakRefShapeEmptyRecord0001
     * @tc.desc      Release a record whose payload array is empty and check both the released view and an inline empty
     *               record agree on a zero length and zero total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapeEmptyRecord0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const emptyLength: number = PAYLOAD_SIZES[0];
      const ref: WeakRef<WeakRecord> = releasedRecord(130, emptyLength);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const inline: WeakRecord = new WeakRecord(130, emptyLength);
      logCase('testWeakRefShapeEmptyRecord0001', `payload=${emptyLength} rounds=${rounds} ` +
        `inlineSize=${inline.size()}`);
      expect(inline.size()).assertEqual(ZERO);
      expect(inline.total()).assertEqual(ZERO);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5300
     * @tc.name      testWeakRefShapeWideRecord0001
     * @tc.desc      Release a record with the widest payload in the matrix and check the release is cleared while an
     *               inline copy keeps the expected element count and total
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapeWideRecord0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const wide: number = PAYLOAD_SIZES[PAYLOAD_SIZES.length - 1];
      const ref: WeakRef<WeakRecord> = releasedRecord(131, wide);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const inline: WeakRecord = new WeakRecord(131, wide);
      const expectedSize: number = 2048;
      const expectedTotal: number = 131 * 2048;
      logCase('testWeakRefShapeWideRecord0001', `wide=${wide} rounds=${rounds} inlineSize=${inline.size()}`);
      expect(inline.size()).assertEqual(expectedSize);
      expect(inline.total()).assertEqual(expectedTotal);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5400
     * @tc.name      testWeakRefShapePairGraph0001
     * @tc.desc      Observe both halves of the Parent and Child cycle through WeakRefs while the graph stays retained and
     *               check the links and tags are unchanged
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapePairGraph0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const tag: number = PAIR_TAGS[0];
      const parent: CycleParent = linkPair(tag);
      const parentRef: WeakRef<CycleParent> = new WeakRef<CycleParent>(parent);
      const childRef: WeakRef<CycleChild> = new WeakRef<CycleChild>(parent.child as CycleChild);
      hintGC();
      sweepPressure();
      const liveParent: CycleParent | undefined = parentRef.deref();
      const liveChild: CycleChild | undefined = childRef.deref();
      const expectedTag: number = 3;
      logCase('testWeakRefShapePairGraph0001', `tag=${tag} parentAlive=${liveParent !== undefined} ` +
        `childAlive=${liveChild !== undefined}`);
      expect(liveParent === parent).assertTrue();
      expect(liveParent !== undefined && pairIsLinked(liveParent as CycleParent)).assertTrue();
      expect((liveChild as CycleChild).parent === parent).assertTrue();
      expect(parent.tag).assertEqual(expectedTag);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5500
     * @tc.name      testWeakRefShapeRingGraph0001
     * @tc.desc      Observe a six node ring through a WeakRef to its head while the ring stays retained and check the ring
     *               length and id sum are still exact after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefShapeRingGraph0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const size: number = RING_SIZES[2];
      const head: RingNode = buildRing(size, 8, 5);
      const ref: WeakRef<RingNode> = new WeakRef<RingNode>(head);
      hintGC();
      sweepPressure();
      const live: RingNode | undefined = ref.deref();
      const expectedLength: number = 6;
      const expectedSum: number = expectedIdSum(5, size);
      logCase('testWeakRefShapeRingGraph0001', `size=${size} alive=${live !== undefined} ` +
        `length=${ringLength(head, size + 1)} sum=${ringIdSum(head, size)}`);
      expect(live === head).assertTrue();
      expect(ringLength(head, size + 1)).assertEqual(expectedLength);
      expect(ringIdSum(head, size)).assertEqual(expectedSum);
      expect(head.payload.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5600
     * @tc.name      testWeakRefShapeMixedBatch0001
     * @tc.desc      Build points, records and envelopes in one loop with three separate WeakRef arrays and check each
     *               shape family stays fully alive after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefShapeMixedBatch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const pointRefs: WeakRef<WeakPoint>[] = [];
      const recordRefs: WeakRef<WeakRecord>[] = [];
      const envelopeRefs: WeakRef<WeakEnvelope>[] = [];
      const pointKeep: WeakPoint[] = [];
      const recordKeep: WeakRecord[] = [];
      const envelopeKeep: WeakEnvelope[] = [];
      for (let i = 0; i < BATCH_SIZES.length; i++) {
        const point: WeakPoint = new WeakPoint(i);
        const record: WeakRecord = new WeakRecord(i, i * 4);
        const envelope: WeakEnvelope = new WeakEnvelope(i, 'mixed', i);
        pointKeep.push(point);
        recordKeep.push(record);
        envelopeKeep.push(envelope);
        pointRefs.push(new WeakRef<WeakPoint>(point));
        recordRefs.push(new WeakRef<WeakRecord>(record));
        envelopeRefs.push(new WeakRef<WeakEnvelope>(envelope));
      }
      hintGC();
      sweepPressure();
      const alive: number = countAlive(pointRefs) + countAlive(recordRefs) + countAlive(envelopeRefs);
      const expectedAlive: number = 9;
      logCase('testWeakRefShapeMixedBatch0001', `alive=${alive} points=${pointKeep.length} ` +
        `records=${recordKeep.length} envelopes=${envelopeKeep.length}`);
      expect(alive).assertEqual(expectedAlive);
      expect(countAlive(pointRefs)).assertEqual(BATCH_SIZES.length);
      expect(countAlive(recordRefs)).assertEqual(BATCH_SIZES.length);
      expect(recordKeep[2].total()).assertEqual(2 * 8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5700
     * @tc.name      testWeakRefIdentitySameObject0001
     * @tc.desc      Deref two WeakRefs created for one retained point and check both directions of equality hold with the
     *               original binding
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefIdentitySameObject0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(60);
      const first: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const second: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const firstLive: WeakPoint | undefined = first.deref();
      const secondLive: WeakPoint | undefined = second.deref();
      const sink: number = sweepPressure();
      const expectedScore: number = 180;
      logCase('testWeakRefIdentitySameObject0001', `firstIsSecond=${firstLive === secondLive} ` +
        `firstIsPoint=${firstLive === point} sink=${sink}`);
      expect(firstLive === secondLive).assertTrue();
      expect(firstLive === point).assertTrue();
      expect((secondLive as WeakPoint).score()).assertEqual(expectedScore);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5800
     * @tc.name      testWeakRefIdentityDistinct0001
     * @tc.desc      Create two distinct points that carry the same id and check the WeakRefs never collapse them into one
     *               instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefIdentityDistinct0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const first: WeakPoint = new WeakPoint(5);
      const second: WeakPoint = new WeakPoint(5);
      const firstRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(first);
      const secondRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(second);
      hintGC();
      const firstLive: WeakPoint | undefined = firstRef.deref();
      const secondLive: WeakPoint | undefined = secondRef.deref();
      const expectedId: number = 5;
      logCase('testWeakRefIdentityDistinct0001', `same=${firstLive === secondLive} ` +
        `firstId=${(firstLive as WeakPoint).id} secondId=${(secondLive as WeakPoint).id}`);
      expect(firstLive === secondLive).assertFalse();
      expect((firstLive as WeakPoint).id).assertEqual(expectedId);
      expect((secondLive as WeakPoint).id).assertEqual(expectedId);
      expect(firstLive === first && secondLive === second).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_5900
     * @tc.name      testWeakRefIdentityMutation0001
     * @tc.desc      Mutate a retained point through its binding and check the WeakRef deref observes the new id instead
     *               of a snapshot taken at creation time
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefIdentityMutation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(70);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const beforeId: number = (ref.deref() as WeakPoint).id;
      point.id = 71;
      hintGC();
      const afterLive: WeakPoint | undefined = ref.deref();
      const expectedBefore: number = 70;
      const expectedAfter: number = 71;
      logCase('testWeakRefIdentityMutation0001', `before=${beforeId} after=${(afterLive as WeakPoint).id}`);
      expect(beforeId).assertEqual(expectedBefore);
      expect((afterLive as WeakPoint).id).assertEqual(expectedAfter);
      expect(afterLive === point).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6000
     * @tc.name      testWeakRefIdentityIsNotCopy0001
     * @tc.desc      Mutate a point only through the deref result and check the original binding observes the change, which
     *               proves the deref hands out the stored instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefIdentityIsNotCopy0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(80);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const live: WeakPoint | undefined = ref.deref();
      if (live !== undefined) {
        live.id = 81;
      }
      const expectedId: number = 81;
      const expectedScore: number = 243;
      logCase('testWeakRefIdentityIsNotCopy0001', `pointId=${point.id} score=${point.score()}`);
      expect(point.id).assertEqual(expectedId);
      expect(point.score()).assertEqual(expectedScore);
      expect(ref.deref() === point).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6100
     * @tc.name      testWeakRefIdentityPairParts0001
     * @tc.desc      Observe the parent and the child of one linked pair and check the two WeakRefs resolve to different
     *               objects whose back link stays consistent
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefIdentityPairParts0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const parent: CycleParent = linkPair(PAIR_TAGS[1]);
      const parentRef: WeakRef<CycleParent> = new WeakRef<CycleParent>(parent);
      const childRef: WeakRef<CycleChild> = new WeakRef<CycleChild>(parent.child as CycleChild);
      hintGC();
      const liveParent: CycleParent | undefined = parentRef.deref();
      const liveChild: CycleChild | undefined = childRef.deref();
      const parentAsObject: Object | undefined = liveParent;
      const childAsObject: Object | undefined = liveChild;
      logCase('testWeakRefIdentityPairParts0001', `distinct=${parentAsObject !== childAsObject} ` +
        `tag=${(liveParent as CycleParent).tag}`);
      expect(parentAsObject !== childAsObject).assertTrue();
      expect((liveChild as CycleChild).parent === liveParent).assertTrue();
      expect((liveParent as CycleParent).tag).assertEqual(PAIR_TAGS[1]);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6200
     * @tc.name      testWeakRefIdentityRecreated0001
     * @tc.desc      Clear a released point and then build a new point with the same id and check the two WeakRefs never
     *               become interchangeable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefIdentityRecreated0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const oldRef: WeakRef<WeakPoint> = releasedPoint(90);
      const rounds: number = await collectWeak(oldRef, WEAK_ROUNDS);
      const recreated: WeakPoint = new WeakPoint(90);
      const newRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(recreated);
      const expectedId: number = 90;
      logCase('testWeakRefIdentityRecreated0001', `rounds=${rounds} oldCleared=${isCleared(oldRef)} ` +
        `newId=${(newRef.deref() as WeakPoint).id}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(oldRef)).assertTrue();
      expect(newRef.deref() === recreated).assertTrue();
      expect((newRef.deref() as WeakPoint).id).assertEqual(expectedId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6300
     * @tc.name      testWeakRefIdentityAcrossTurns0001
     * @tc.desc      Deref one retained point before and after two timer turns and check all three reads return the same
     *               instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefIdentityAcrossTurns0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const point: WeakPoint = new WeakPoint(95);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const first: WeakPoint | undefined = ref.deref();
      await paceTurn();
      const second: WeakPoint | undefined = ref.deref();
      await paceTurn();
      const third: WeakPoint | undefined = ref.deref();
      const expectedScore: number = 285;
      logCase('testWeakRefIdentityAcrossTurns0001', `first=${first === point} second=${second === point} ` +
        `third=${third === point}`);
      expect(first === second).assertTrue();
      expect(second === third).assertTrue();
      expect(third === point).assertTrue();
      expect((third as WeakPoint).score()).assertEqual(expectedScore);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6400
     * @tc.name      testWeakRefIdentityFieldPath0001
     * @tc.desc      Reach one retained point through a slot field and through a table entry and check both paths deref
     *               to the same instance
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefIdentityFieldPath0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(33);
      const slot: PointSlot = new PointSlot(SLOT_NAMES[0], new WeakRef<WeakPoint>(point));
      const table: RefTable = new RefTable('paths');
      table.put(SLOT_NAMES[0], new WeakRef<WeakPoint>(point));
      hintGC();
      const tableRef: WeakRef<WeakPoint> = table.refFor(SLOT_NAMES[0]) as WeakRef<WeakPoint>;
      const fromSlot: WeakPoint | undefined = slot.ref.deref();
      const fromTable: WeakPoint | undefined = tableRef.deref();
      logCase('testWeakRefIdentityFieldPath0001', `slotId=${slot.idOrMissing()} ` +
        `tableId=${table.idFor(SLOT_NAMES[0])} same=${fromSlot === fromTable}`);
      expect(fromSlot === fromTable).assertTrue();
      expect(fromSlot === point).assertTrue();
      expect(slot.idOrMissing()).assertEqual(table.idFor(SLOT_NAMES[0]));
      expect(table.clearedCount()).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6500
     * @tc.name      testWeakRefPressureSingleHint0001
     * @tc.desc      Hint one collection and add one allocation burst before waiting for a released point to be cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefPressureSingleHint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(140);
      hintGC();
      const sink: number = sweepPressure();
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      logCase('testWeakRefPressureSingleHint0001', `sink=${sink} rounds=${rounds} cleared=${isCleared(ref)}`);
      expect(rounds > 0).assertTrue();
      expect(sink > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6600
     * @tc.name      testWeakRefPressureRepeatHints0001
     * @tc.desc      Issue one hundred hints in a row before waiting and check the released point is still cleared and the
     *               repeated hints are cheap
     * @tc.size      MEDIUMTEST
     * @tc.type      PERFORMANCE
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureRepeatHints0001', TestType.PERFORMANCE | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(141);
      const hintCount: number = 100;
      const start: number = Date.now();
      for (let i = 0; i < hintCount; i++) {
        hintGC();
      }
      const elapsed: number = Date.now() - start;
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const budgetMs: number = 2000;
      logCase('testWeakRefPressureRepeatHints0001', `hints=${hintCount} elapsed=${elapsed} rounds=${rounds}`);
      expect(elapsed < budgetMs).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(countCleared([ref])).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6700
     * @tc.name      testWeakRefPressureInterleave0001
     * @tc.desc      Alternate hints, allocation bursts and timer turns before waiting and check the released point is
     *               still reclaimed exactly once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureInterleave0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(142);
      for (let step = 0; step < INTERLEAVE_STEPS.length; step++) {
        hintGC();
        sweepPressure();
        await paceTurn();
      }
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const clearedReads: number = countCleared([ref]);
      logCase('testWeakRefPressureInterleave0001', `steps=${INTERLEAVE_STEPS.length} rounds=${rounds} ` +
        `cleared=${isCleared(ref)}`);
      expect(rounds > 0).assertTrue();
      expect(clearedReads).assertEqual(ONE);
      expect(isCleared(ref)).assertTrue();
      expect(ref.deref() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6800
     * @tc.name      testWeakRefPressureSnapshot0001
     * @tc.desc      Allocate twenty thousand pressure nodes, then release a point and compare runtime snapshots taken
     *               before and after the wait
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureSnapshot0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const sink: number = allocatePressure();
      const ref: WeakRef<WeakPoint> = releasedPoint(143);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testWeakRefPressureSnapshot0001', `sink=${sink} rounds=${rounds} ` +
        `allocatedDelta=${after.allocated - before.allocated} countDelta=${after.count - before.count}`);
      expect(sink > 0).assertTrue();
      expect(after.allocated > before.allocated).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_6900
     * @tc.name      testWeakRefPressureStatCount0001
     * @tc.desc      Read the runtime collection counter before and after clearing a released point and check the counter
     *               never moves backwards
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureStatCount0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const start: number = gcStat(KEY_GC_COUNT);
      const ref: WeakRef<WeakPoint> = releasedPoint(144);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const delta: number = gcStat(KEY_GC_COUNT) - start;
      logCase('testWeakRefPressureStatCount0001', `start=${start} delta=${delta} rounds=${rounds}`);
      expect(start >= ZERO).assertTrue();
      expect(delta >= ZERO).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7000
     * @tc.name      testWeakRefPressureHeavyPayload0001
     * @tc.desc      Release a record with a 2048 element payload after a pressure burst and check the wide allocation does
     *               not delay the clearing past the round budget
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefPressureHeavyPayload0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const sink: number = allocatePressure();
      const wide: number = PAYLOAD_SIZES[PAYLOAD_SIZES.length - 1];
      const ref: WeakRef<WeakRecord> = releasedRecord(145, wide);
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      logCase('testWeakRefPressureHeavyPayload0001', `sink=${sink} wide=${wide} rounds=${rounds} ` +
        `cleared=${isCleared(ref)}`);
      expect(sink > 0).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(rounds <= WEAK_ROUNDS).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7100
     * @tc.name      testWeakRefPressureTwinTargets0001
     * @tc.desc      Release one point watched by two WeakRefs, add a pressure burst and check both views clear in the same
     *               sequence
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureTwinTargets0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const pair: DualSlot = releasedPointPair(147, 'pressure');
      const sink: number = allocatePressure();
      const refs: WeakRef<WeakPoint>[] = [pair.primary, pair.secondary];
      const rounds: number = await collectWeakAll(refs, WEAK_ROUNDS);
      const expectedCleared: number = 2;
      logCase('testWeakRefPressureTwinTargets0001', `sink=${sink} rounds=${rounds} ` +
        `cleared=${countCleared(refs)}`);
      expect(sink > 0).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(pair.bothCleared()).assertTrue();
      expect(countCleared(refs)).assertEqual(expectedCleared);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7200
     * @tc.name      testWeakRefPressureKeptVersusDropped0001
     * @tc.desc      Hold one point strongly and drop another, then hint and press twice and check only the dropped point is
     *               cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureKeptVersusDropped0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const kept: WeakPoint = new WeakPoint(148);
      const keptRef: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(kept);
      const droppedRef: WeakRef<WeakPoint> = releasedPoint(149);
      hintGC();
      sweepPressure();
      hintGC();
      const rounds: number = await collectWeak(droppedRef, WEAK_ROUNDS);
      const expectedKeptId: number = 148;
      logCase('testWeakRefPressureKeptVersusDropped0001', `rounds=${rounds} droppedCleared=${isCleared(droppedRef)} ` +
        `keptId=${(keptRef.deref() as WeakPoint).id}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(droppedRef)).assertTrue();
      expect(keptRef.deref() === kept).assertTrue();
      expect(kept.id).assertEqual(expectedKeptId);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7300
     * @tc.name      testWeakRefPressureRing0001
     * @tc.desc      Drop a fifty node ring, keep only its WeakRef and its precomputed shape, and check the ring is
     *               reclaimed by the shared collection helper
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureRing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ringSize: number = RING_SIZES[3];
      const probe: RingProbe = releasedRing(ringSize, 8, ONE);
      const rounds: number = await collectUntil(() => isCleared(probe.ref), COLLECT_ROUNDS);
      const expectedLength: number = 40;
      const expectedSum: number = expectedIdSum(ONE, ringSize);
      logCase('testWeakRefPressureRing0001', `length=${probe.length} idSum=${probe.idSum} rounds=${rounds}`);
      expect(probe.length).assertEqual(expectedLength);
      expect(probe.idSum).assertEqual(expectedSum);
      expect(rounds > 0).assertTrue();
      expect(isCleared(probe.ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7400
     * @tc.name      testWeakRefPressurePairCycle0001
     * @tc.desc      Drop a Parent and Child cycle and check the shared collection helper clears the WeakRefs to both
     *               halves of the cycle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressurePairCycle0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const parentRef: WeakRef<CycleParent> = releasedPair(45);
      const childRef: WeakRef<CycleChild> = releasedChild(46);
      const rounds: number = await collectUntil(() => isCleared(parentRef) && isCleared(childRef), COLLECT_ROUNDS);
      logCase('testWeakRefPressurePairCycle0001', `rounds=${rounds} parentCleared=${isCleared(parentRef)} ` +
        `childCleared=${isCleared(childRef)}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(parentRef)).assertTrue();
      expect(isCleared(childRef)).assertTrue();
      expect(rounds <= COLLECT_ROUNDS).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7500
     * @tc.name      testWeakRefPressureBatchBounds0001
     * @tc.desc      Watch one released point through four WeakRefs, hint and press once, and check every view clears
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefPressureBatchBounds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: WeakRef<WeakPoint>[] = releasedRefSet(4, 145);
      hintGC();
      sweepPressure();
      const rounds: number = await collectWeakAll(refs, WEAK_ROUNDS);
      const expectedRefs: number = 4;
      logCase('testWeakRefPressureBatchBounds0001', `refs=${refs.length} rounds=${rounds} ` +
        `cleared=${countCleared(refs)}`);
      expect(refs.length).assertEqual(expectedRefs);
      expect(rounds > 0).assertTrue();
      expect(countCleared(refs)).assertEqual(expectedRefs);
      expect(derefIdSum(refs)).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7600
     * @tc.name      testWeakRefPressureAfterPace0001
     * @tc.desc      Insert timer turns between the hint and the wait and check the released point is still cleared inside
     *               the round budget
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPressureAfterPace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(146);
      await paceTurn();
      hintGC();
      await paceTurn();
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      logCase('testWeakRefPressureAfterPace0001', `rounds=${rounds} cleared=${isCleared(ref)} max=${WEAK_ROUNDS}`);
      expect(rounds > 0).assertTrue();
      expect(rounds <= WEAK_ROUNDS).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7700
     * @tc.name      testWeakRefClosureRead0001
     * @tc.desc      Read a retained point through a closure that only captures its WeakRef and check two reads return the
     *               same derived score
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefClosureRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const point: WeakPoint = new WeakPoint(150);
      const probe: ClosureProbe = retainedClosureProbe(point);
      hintGC();
      sweepPressure();
      const first: number = probe.read();
      const second: number = probe.read();
      const expectedScore: number = 450;
      logCase('testWeakRefClosureRead0001', `first=${first} second=${second} calls=${probe.callCount()}`);
      expect(first).assertEqual(expectedScore);
      expect(second).assertEqual(expectedScore);
      expect(probe.callCount()).assertEqual(2);
      expect(probe.cleared()).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7800
     * @tc.name      testWeakRefClosureStrongCapture0001
     * @tc.desc      Let a closure capture the point itself, which is a strong edge, and check the WeakRef still resolves
     *               after a hint and a pressure burst
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureStrongCapture0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(151);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const read: () => number = (): number => {
        return point.score();
      };
      hintGC();
      sweepPressure();
      const value: number = read();
      const expectedValue: number = 453;
      logCase('testWeakRefClosureStrongCapture0001', `value=${value} alive=${ref.deref() !== undefined}`);
      expect(value).assertEqual(expectedValue);
      expect(ref.deref() === point).assertTrue();
      expect(ref.deref() === undefined).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_7900
     * @tc.name      testWeakRefClosureWeakOnly0001
     * @tc.desc      Keep only a reader closure over a WeakRef and check the closure outlives the target and starts
     *               reporting the missing marker after collection
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureWeakOnly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: ClosureProbe = releasedClosureProbe(152);
      const rounds: number = await collectWeak(probe.ref, WEAK_ROUNDS);
      const after: number = probe.read();
      logCase('testWeakRefClosureWeakOnly0001', `rounds=${rounds} after=${after} cleared=${probe.cleared()}`);
      expect(rounds > 0).assertTrue();
      expect(probe.cleared()).assertTrue();
      expect(after).assertEqual(MISSING);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8000
     * @tc.name      testWeakRefClosureCalls0001
     * @tc.desc      Call one reader closure three times over a retained point and check every call returns the score and
     *               the call counter tracks the invocations
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureCalls0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(153);
      const probe: ClosureProbe = retainedClosureProbe(point);
      const values: number[] = [];
      for (let i = 0; i < 3; i++) {
        values.push(probe.read());
      }
      const expectedScore: number = 459;
      const expectedCalls: number = 3;
      logCase('testWeakRefClosureCalls0001', `values=${values.join(',')} calls=${probe.callCount()}`);
      expect(values.every((value: number) => value === expectedScore)).assertTrue();
      expect(values.length).assertEqual(expectedCalls);
      expect(probe.callCount()).assertEqual(expectedCalls);
      expect(probe.cleared()).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8100
     * @tc.name      testWeakRefClosureNested0001
     * @tc.desc      Wrap the deref inside a closure returned by another closure and check the nested reader still reports
     *               the retained id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureNested0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const point: WeakPoint = new WeakPoint(154);
      const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
      const outer: () => number = (): number => {
        const inner: () => number = (): number => {
          const live: WeakPoint | undefined = ref.deref();
          return live === undefined ? MISSING : live.id;
        };
        return inner();
      };
      hintGC();
      sweepPressure();
      const first: number = outer();
      const second: number = outer();
      const expectedId: number = 154;
      logCase('testWeakRefClosureNested0001', `first=${first} second=${second} alive=${ref.deref() !== undefined}`);
      expect(first).assertEqual(expectedId);
      expect(second).assertEqual(expectedId);
      expect(first).assertEqual(second);
      expect(ref.deref() === point).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8200
     * @tc.name      testWeakRefClosureArray0001
     * @tc.desc      Build one reader per retained point, keep the readers in an array and check the values follow the
     *               retained order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureArray0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const points: WeakPoint[] = [new WeakPoint(1), new WeakPoint(2), new WeakPoint(3)];
      const readers: Array<() => number> = [];
      const refs: WeakRef<WeakPoint>[] = [];
      for (const point of points) {
        const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
        refs.push(ref);
        readers.push(makeWeakIdReader(ref));
      }
      hintGC();
      const ids: number[] = readers.map((reader: () => number) => reader());
      const expectedIds: number[] = [1, 2, 3];
      logCase('testWeakRefClosureArray0001', `ids=${ids.join(',')} readers=${readers.length} ` +
        `alive=${countAlive(refs)}`);
      expect(readers.length).assertEqual(points.length);
      expect(sameNumbers(ids, expectedIds)).assertTrue();
      expect(countAlive(refs)).assertEqual(points.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8300
     * @tc.name      testWeakRefClosureFactory0001
     * @tc.desc      Build probes for four retained points through the same factory and check every probe returns its own
     *               score and counts exactly one call
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureFactory0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const points: WeakPoint[] = [];
      const probes: ClosureProbe[] = [];
      for (let i = 0; i < REF_COUNTS.length; i++) {
        const point: WeakPoint = new WeakPoint(200 + i);
        points.push(point);
        probes.push(retainedClosureProbe(point));
      }
      hintGC();
      sweepPressure();
      const values: number[] = probes.map((probe: ClosureProbe) => probe.read());
      const expectedValues: number[] = [600, 603, 606, 609];
      logCase('testWeakRefClosureFactory0001', `values=${values.join(',')} probes=${probes.length}`);
      expect(probes.length).assertEqual(REF_COUNTS.length);
      expect(sameNumbers(values, expectedValues)).assertTrue();
      expect(probes.every((probe: ClosureProbe) => probe.callCount() === ONE)).assertTrue();
      expect(points.length).assertEqual(REF_COUNTS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8400
     * @tc.name      testWeakRefClosureAfterClear0001
     * @tc.desc      Read a released point through its closure before and after collection and check the reader switches
     *               from the score to the missing marker
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefClosureAfterClear0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: ClosureProbe = releasedClosureProbe(155);
      const before: number = probe.read();
      const rounds: number = await collectWeak(probe.ref, WEAK_ROUNDS);
      const after: number = probe.read();
      const expectedBefore: number = 465;
      logCase('testWeakRefClosureAfterClear0001', `before=${before} after=${after} rounds=${rounds} ` +
        `calls=${probe.callCount()}`);
      expect(before).assertEqual(expectedBefore);
      expect(after).assertEqual(MISSING);
      expect(rounds > 0).assertTrue();
      expect(probe.callCount()).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8500
     * @tc.name      testWeakRefClosureMap0001
     * @tc.desc      Store readers under named keys and check every reader still resolves the retained id through its own
     *               WeakRef
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefClosureMap0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const points: WeakPoint[] = [new WeakPoint(1), new WeakPoint(2), new WeakPoint(3)];
      const readers: Map<string, () => number> = new Map<string, () => number>();
      for (let i = 0; i < SLOT_NAMES.length; i++) {
        readers.set(SLOT_NAMES[i], makeWeakIdReader(new WeakRef<WeakPoint>(points[i])));
      }
      hintGC();
      const ids: number[] = [];
      SLOT_NAMES.forEach((name: string) => {
        const reader: (() => number) | undefined = readers.get(name);
        if (reader !== undefined) {
          ids.push(reader());
        }
      });
      const expectedIds: number[] = [1, 2, 3];
      logCase('testWeakRefClosureMap0001', `ids=${ids.join(',')} keys=${readers.size}`);
      expect(sameNumbers(ids, expectedIds)).assertTrue();
      expect(readers.size).assertEqual(SLOT_NAMES.length);
      expect(ids.length).assertEqual(points.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8600
     * @tc.name      testWeakRefClosureDetached0001
     * @tc.desc      Detach the reader from its wrapper, let the target go and check the detached closure reports the
     *               missing marker while the WeakRef reports cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefClosureDetached0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ref: WeakRef<WeakPoint> = releasedPoint(156);
      const detached: () => number = makeWeakReader(ref);
      const before: number = detached();
      const rounds: number = await collectWeak(ref, WEAK_ROUNDS);
      const after: number = detached();
      const expectedBefore: number = 468;
      logCase('testWeakRefClosureDetached0001', `before=${before} after=${after} rounds=${rounds} ` +
        `cleared=${isCleared(ref)}`);
      expect(before).assertEqual(expectedBefore);
      expect(after).assertEqual(MISSING);
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8700
     * @tc.name      testWeakRefSequenceKeepDrop0001
     * @tc.desc      Interleave two retained points with two dropped points, then check the retained group survives while
     *               the dropped group is cleared
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefSequenceKeepDrop0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const probe: InterleaveProbe = buildInterleave(2, 2, 400);
      hintGC();
      sweepPressure();
      const keptAlive: number = probe.keptAlive();
      const rounds: number = await collectWeakAll(probe.droppedRefs, WEAK_ROUNDS);
      const droppedCleared: number = probe.droppedCleared();
      const expectedGroup: number = 2;
      logCase('testWeakRefSequenceKeepDrop0001', `keptAlive=${keptAlive} droppedCleared=${droppedCleared} ` +
        `rounds=${rounds} steps=${probe.steps.length}`);
      expect(probe.keptRefs.length).assertEqual(expectedGroup);
      expect(probe.droppedRefs.length).assertEqual(expectedGroup);
      expect(keptAlive).assertEqual(expectedGroup);
      expect(rounds > 0).assertTrue();
      expect(droppedCleared).assertEqual(expectedGroup);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8800
     * @tc.name      testWeakRefSequenceSteps0001
     * @tc.desc      Record three retained and three dropped points alternately and check every step keeps the running
     *               kept and dropped totals consistent with its index
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefSequenceSteps0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const probe: InterleaveProbe = buildInterleave(3, 3, 410);
      hintGC();
      const consistent: boolean = probe.steps.every((record: StepRecord) =>
        record.kept + record.dropped === record.step && record.kept <= 3 && record.dropped <= 3);
      const last: StepRecord = probe.steps[probe.steps.length - 1];
      const expectedSteps: number = 6;
      logCase('testWeakRefSequenceSteps0001', `steps=${probe.steps.length} consistent=${consistent} ` +
        `lastKept=${last.kept} lastDropped=${last.dropped}`);
      expect(probe.steps.length).assertEqual(expectedSteps);
      expect(consistent).assertTrue();
      expect(last.kept).assertEqual(3);
      expect(last.dropped).assertEqual(3);
      expect(probe.box.size()).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_8900
     * @tc.name      testWeakRefSequenceRetainAfterGc0001
     * @tc.desc      Keep two points alive through a retain box across a hint, then empty the box and check the WeakRefs
     *               only clear once the strong edges are gone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefSequenceRetainAfterGc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: InterleaveProbe = buildInterleave(2, ZERO, 420);
      hintGC();
      sweepPressure();
      const aliveBefore: number = probe.keptAlive();
      const keptSum: number = probe.box.idSum();
      const released: number = probe.box.dropAll();
      const rounds: number = await collectWeakAll(probe.keptRefs, WEAK_ROUNDS);
      const expectedSum: number = 420 + 421;
      logCase('testWeakRefSequenceRetainAfterGc0001', `aliveBefore=${aliveBefore} keptSum=${keptSum} ` +
        `released=${released} rounds=${rounds}`);
      expect(aliveBefore).assertEqual(2);
      expect(keptSum).assertEqual(expectedSum);
      expect(released).assertEqual(2);
      expect(rounds > 0).assertTrue();
      expect(countCleared(probe.keptRefs)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9000
     * @tc.name      testWeakRefSequenceToggle0001
     * @tc.desc      Fill and empty a retain box three times with the same two strongly held points and check the box size
     *               toggles while both WeakRefs stay alive
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefSequenceToggle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const box: RetainBox = new RetainBox();
      const points: WeakPoint[] = [new WeakPoint(1), new WeakPoint(2)];
      const refs: WeakRef<WeakPoint>[] = [];
      for (const point of points) {
        refs.push(new WeakRef<WeakPoint>(point));
      }
      const sizes: number[] = [];
      for (let round = 0; round < 3; round++) {
        for (const point of points) {
          box.keep(point);
        }
        sizes.push(box.size());
        box.dropAll();
        sizes.push(box.size());
      }
      hintGC();
      sweepPressure();
      const expectedFilled: number = 3;
      logCase('testWeakRefSequenceToggle0001', `sizes=${sizes.join(',')} alive=${countAlive(refs)} ` +
        `finalSize=${box.size()}`);
      expect(sizes.length).assertEqual(6);
      expect(sizes.filter((value: number) => value === 2).length).assertEqual(expectedFilled);
      expect(box.size()).assertEqual(ZERO);
      expect(countAlive(refs)).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9100
     * @tc.name      testWeakRefSequenceGrow0001
     * @tc.desc      Grow the retained list one point per step and check the box sizes are one to four, the id sum matches
     *               and every WeakRef follows the growing set
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefSequenceGrow0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const box: RetainBox = new RetainBox();
      const refs: WeakRef<WeakPoint>[] = [];
      const sizes: number[] = [];
      for (let step = 0; step < INTERLEAVE_STEPS.length; step++) {
        const point: WeakPoint = new WeakPoint(500 + step);
        refs.push(new WeakRef<WeakPoint>(point));
        sizes.push(box.keep(point));
      }
      hintGC();
      const expectedSizes: number[] = [1, 2, 3, 4];
      const expectedSum: number = 500 + 501 + 502 + 503;
      logCase('testWeakRefSequenceGrow0001', `sizes=${sizes.join(',')} boxSize=${box.size()} ` +
        `sum=${box.idSum()}`);
      expect(sameNumbers(sizes, expectedSizes)).assertTrue();
      expect(box.size()).assertEqual(INTERLEAVE_STEPS.length);
      expect(box.idSum()).assertEqual(expectedSum);
      expect(countAlive(refs)).assertEqual(INTERLEAVE_STEPS.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9200
     * @tc.name      testWeakRefSequenceIds0001
     * @tc.desc      Retain four points with consecutive ids and check the ids read back through the WeakRefs equal the
     *               id range and the arithmetic id sum
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefSequenceIds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const refs: WeakRef<WeakPoint>[] = [];
      const keep: WeakPoint[] = [];
      for (let i = 0; i < REF_COUNTS.length; i++) {
        const point: WeakPoint = new WeakPoint(600 + i);
        keep.push(point);
        refs.push(new WeakRef<WeakPoint>(point));
      }
      hintGC();
      sweepPressure();
      const ids: number[] = [];
      refs.forEach((ref: WeakRef<WeakPoint>) => {
        const live: WeakPoint | undefined = ref.deref();
        if (live !== undefined) {
          ids.push(live.id);
        }
      });
      const expectedIds: number[] = range(600, REF_COUNTS.length);
      const expectedSum: number = expectedIdSum(600, REF_COUNTS.length);
      logCase('testWeakRefSequenceIds0001', `ids=${ids.join(',')} sum=${derefIdSum(refs)} keep=${keep.length}`);
      expect(sameNumbers(ids, expectedIds)).assertTrue();
      expect(ids.length).assertEqual(keep.length);
      expect(derefIdSum(refs)).assertEqual(expectedSum);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9300
     * @tc.name      testWeakRefSequenceMixedShapes0001
     * @tc.desc      Alternate points and records in one sequence and check both WeakRef families stay fully alive with the
     *               last record payload intact
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefSequenceMixedShapes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const pointRefs: WeakRef<WeakPoint>[] = [];
      const recordRefs: WeakRef<WeakRecord>[] = [];
      const keepPoints: WeakPoint[] = [];
      const keepRecords: WeakRecord[] = [];
      for (const size of BATCH_SIZES) {
        const point: WeakPoint = new WeakPoint(size);
        const record: WeakRecord = new WeakRecord(size, size);
        keepPoints.push(point);
        keepRecords.push(record);
        pointRefs.push(new WeakRef<WeakPoint>(point));
        recordRefs.push(new WeakRef<WeakRecord>(record));
      }
      hintGC();
      sweepPressure();
      const expectedGroups: number = 3;
      const expectedTotal: number = 12;
      logCase('testWeakRefSequenceMixedShapes0001', `points=${countAlive(pointRefs)} ` +
        `records=${countAlive(recordRefs)} lastTotal=${keepRecords[expectedGroups - 1].total()}`);
      expect(countAlive(pointRefs)).assertEqual(expectedGroups);
      expect(countAlive(recordRefs)).assertEqual(expectedGroups);
      expect(keepRecords[expectedGroups - 1].total()).assertEqual(expectedTotal);
      expect(keepPoints.length).assertEqual(keepRecords.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9400
     * @tc.name      testWeakRefSequenceMapRebuild0001
     * @tc.desc      Rebuild indexed table entries step by step and check every key keeps its own WeakRef and resolves to
     *               the id written at that step
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefSequenceMapRebuild0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const table: RefTable = new RefTable('rebuild');
      const refs: WeakRef<WeakPoint>[] = [];
      const keep: WeakPoint[] = [];
      for (let step = 0; step < SLOT_NAMES.length; step++) {
        const point: WeakPoint = new WeakPoint(700 + step);
        keep.push(point);
        const ref: WeakRef<WeakPoint> = new WeakRef<WeakPoint>(point);
        refs.push(ref);
        table.put(SLOT_NAMES[step], ref);
      }
      hintGC();
      sweepPressure();
      const expectedLastId: number = 702;
      logCase('testWeakRefSequenceMapRebuild0001', `keys=${table.size()} alive=${countAlive(refs)} ` +
        `lastId=${table.idFor(SLOT_NAMES[2])}`);
      expect(table.size()).assertEqual(SLOT_NAMES.length);
      expect(countAlive(refs)).assertEqual(SLOT_NAMES.length);
      expect(table.idFor(SLOT_NAMES[2])).assertEqual(expectedLastId);
      expect(table.clearedCount()).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9500
     * @tc.name      testWeakRefSequenceLastKept0001
     * @tc.desc      Retain one point and drop one, clear the dropped view, then release the retain box and check the last
     *               kept WeakRef also clears
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefSequenceLastKept0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: InterleaveProbe = buildInterleave(ONE, ONE, 800);
      const droppedRounds: number = await collectWeakAll(probe.droppedRefs, WEAK_ROUNDS);
      const keptAlive: number = probe.keptAlive();
      const releasedFromBox: number = probe.box.dropAll();
      const keptRounds: number = await collectWeakAll(probe.keptRefs, WEAK_ROUNDS);
      logCase('testWeakRefSequenceLastKept0001', `droppedRounds=${droppedRounds} keptAlive=${keptAlive} ` +
        `released=${releasedFromBox} keptRounds=${keptRounds}`);
      expect(probe.droppedRefs.length).assertEqual(ONE);
      expect(droppedRounds > 0).assertTrue();
      expect(countCleared(probe.droppedRefs)).assertEqual(ONE);
      expect(keptAlive).assertEqual(ONE);
      expect(releasedFromBox).assertEqual(ONE);
      expect(keptRounds > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9600
     * @tc.name      testWeakRefSequenceCounts0001
     * @tc.desc      Build three retained and two dropped points in one interleaved sequence and check the step ledger, the
     *               retained count and the first cleared dropped view stay consistent
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefSequenceCounts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: InterleaveProbe = buildInterleave(3, 2, 900);
      hintGC();
      const rounds: number = await collectWeakSome(probe.droppedRefs, ONE, WEAK_ROUNDS);
      const consistent: boolean = probe.steps.every((record: StepRecord) =>
        record.kept + record.dropped === record.step && record.kept <= 3 && record.dropped <= 2);
      const expectedSteps: number = 5;
      const keptAlive: number = probe.keptAlive();
      logCase('testWeakRefSequenceCounts0001', `steps=${probe.steps.length} consistent=${consistent} ` +
        `keptAlive=${keptAlive} rounds=${rounds}`);
      expect(probe.steps.length).assertEqual(expectedSteps);
      expect(consistent).assertTrue();
      expect(keptAlive).assertEqual(3);
      expect(rounds > 0).assertTrue();
      expect(countCleared(probe.droppedRefs) >= ONE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9700
     * @tc.name      testWeakRefPairRetained0001
     * @tc.desc      Observe the parent and the child of one retained pair and check the pair is still linked and reports
     *               the original tag after a hint
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefPairRetained0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const tag: number = PAIR_TAGS[0];
      const parent: CycleParent = linkPair(tag);
      const refs: PairRefs = new PairRefs(new WeakRef<CycleParent>(parent),
        new WeakRef<CycleChild>(parent.child as CycleChild));
      hintGC();
      sweepPressure();
      const expectedTag: number = 3;
      logCase('testWeakRefPairRetained0001', `tag=${refs.tagNow()} linked=${refs.linkedNow()} ` +
        `cleared=${refs.bothCleared()}`);
      expect(refs.bothCleared()).assertFalse();
      expect(refs.linkedNow()).assertTrue();
      expect(refs.tagNow()).assertEqual(expectedTag);
      expect((refs.childRef.deref() as CycleChild).parent === parent).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9800
     * @tc.name      testWeakRefPairReleased0001
     * @tc.desc      Drop a linked Parent and Child pair and check the WeakRefs to both halves are cleared by the shared
     *               collection helper
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPairReleased0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const refs: PairRefs = releasedPairRefs(PAIR_TAGS[1]);
      const rounds: number = await collectUntil(() => refs.bothCleared(), COLLECT_ROUNDS);
      logCase('testWeakRefPairReleased0001', `rounds=${rounds} parentCleared=${isCleared(refs.parentRef)} ` +
        `childCleared=${isCleared(refs.childRef)}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(refs.parentRef)).assertTrue();
      expect(isCleared(refs.childRef)).assertTrue();
      expect(refs.bothCleared()).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_9900
     * @tc.name      testWeakRefPairChild0001
     * @tc.desc      Keep only a WeakRef to the child half of a dropped pair and check the child is cleared even though its
     *               parent link formed a cycle
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefPairChild0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const childRef: WeakRef<CycleChild> = releasedChild(47);
      const rounds: number = await collectUntil(() => isCleared(childRef), COLLECT_ROUNDS);
      logCase('testWeakRefPairChild0001', `rounds=${rounds} cleared=${isCleared(childRef)} ` +
        `maxRounds=${COLLECT_ROUNDS}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(childRef)).assertTrue();
      expect(childRef.deref() === undefined).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_10000
     * @tc.name      testWeakRefRingRetained0001
     * @tc.desc      Observe the head of a two node retained ring and check the ring closes on itself with the expected
     *               length and id sum
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testWeakRefRingRetained0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const head: RingNode = buildRing(2, ONE, 11);
      const ref: WeakRef<RingNode> = new WeakRef<RingNode>(head);
      hintGC();
      const next: RingNode = head.next as RingNode;
      const expectedLength: number = 2;
      const expectedSum: number = expectedIdSum(11, 2);
      logCase('testWeakRefRingRetained0001', `id=${head.id} nextId=${next.id} ` +
        `length=${ringLength(head, 3)} sum=${ringIdSum(head, 2)}`);
      expect(ref.deref() === head).assertTrue();
      expect(next.next === head).assertTrue();
      expect(ringLength(head, 3)).assertEqual(expectedLength);
      expect(ringIdSum(head, 2)).assertEqual(expectedSum);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_10100
     * @tc.name      testWeakRefRingReleased0001
     * @tc.desc      Drop a six node ring, keep only its WeakRef and an independent inline oracle ring, and check the ring
     *               is cleared while the oracle keeps its shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRingReleased0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const size: number = RING_SIZES[2];
      const oracle: RingNode = buildRing(size, 4, 21);
      const ref: WeakRef<RingNode> = releasedRingRef(size, 4, 21);
      const rounds: number = await collectUntil(() => isCleared(ref), COLLECT_ROUNDS);
      const expectedLength: number = 6;
      logCase('testWeakRefRingReleased0001', `size=${size} oracleLength=${ringLength(oracle, size + 1)} ` +
        `rounds=${rounds}`);
      expect(ringLength(oracle, size + 1)).assertEqual(expectedLength);
      expect(ringIdSum(oracle, size)).assertEqual(expectedIdSum(21, size));
      expect(rounds > 0).assertTrue();
      expect(isCleared(ref)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_10200
     * @tc.name      testWeakRefRingSizes0001
     * @tc.desc      Observe rings of one, two, six and forty nodes and check every walk returns the exact size, id sum and
     *               keeps its WeakRef alive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefRingSizes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const refs: WeakRef<RingNode>[] = [];
      const lengths: number[] = [];
      const sums: number[] = [];
      const expectedLengths: number[] = [];
      const expectedSums: number[] = [];
      for (const size of RING_SIZES) {
        const head: RingNode = buildRing(size, 2, size);
        refs.push(new WeakRef<RingNode>(head));
        lengths.push(ringLength(head, size + 1));
        sums.push(ringIdSum(head, size));
        expectedLengths.push(size);
        expectedSums.push(expectedIdSum(size, size));
      }
      hintGC();
      sweepPressure();
      const alive: number = countAlive(refs);
      const expectedSizes: number = RING_SIZES.length;
      logCase('testWeakRefRingSizes0001', `lengths=${lengths.join(',')} sums=${sums.join(',')} ` +
        `alive=${alive} sizes=${expectedSizes}`);
      expect(sameNumbers(lengths, expectedLengths)).assertTrue();
      expect(sameNumbers(sums, expectedSums)).assertTrue();
      expect(alive).assertEqual(expectedSizes);
      expect(refs.length).assertEqual(expectedSizes);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_10300
     * @tc.name      testWeakRefRingNodes0001
     * @tc.desc      Observe the head, second and last node of a forty node retained ring and check each WeakRef resolves
     *               to its own node with the tail pointing back at the head
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testWeakRefRingNodes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const size: number = RING_SIZES[3];
      const head: RingNode = buildRing(size, 4, ONE);
      const second: RingNode = head.next as RingNode;
      let tail: RingNode = head;
      for (let i = 1; i < size; i++) {
        tail = tail.next as RingNode;
      }
      const headRef: WeakRef<RingNode> = new WeakRef<RingNode>(head);
      const secondRef: WeakRef<RingNode> = new WeakRef<RingNode>(second);
      const tailRef: WeakRef<RingNode> = new WeakRef<RingNode>(tail);
      hintGC();
      sweepPressure();
      const expectedSecond: number = 2;
      const expectedTail: number = 40;
      logCase('testWeakRefRingNodes0001', `size=${size} secondId=${(secondRef.deref() as RingNode).id} ` +
        `tailId=${(tailRef.deref() as RingNode).id}`);
      expect(headRef.deref() === head).assertTrue();
      expect((secondRef.deref() as RingNode).id).assertEqual(expectedSecond);
      expect((tailRef.deref() as RingNode).id).assertEqual(expectedTail);
      expect((tailRef.deref() as RingNode).next === head).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_WEAKREF_10400
     * @tc.name      testWeakRefGraphSummary0001
     * @tc.desc      Drop one pair graph while a ring graph stays retained and check the dropped pair is cleared without
     *               disturbing the retained ring shape
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testWeakRefGraphSummary0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const refs: PairRefs = releasedPairRefs(PAIR_TAGS[2]);
      const size: number = RING_SIZES[2];
      const head: RingNode = buildRing(size, 8, 5);
      const headRef: WeakRef<RingNode> = new WeakRef<RingNode>(head);
      const rounds: number = await collectUntil(() => refs.bothCleared(), COLLECT_ROUNDS);
      const expectedLength: number = 6;
      logCase('testWeakRefGraphSummary0001', `rounds=${rounds} pairCleared=${refs.bothCleared()} ` +
        `ringLength=${ringLength(head, size + 1)} ringSum=${ringIdSum(head, size)}`);
      expect(rounds > 0).assertTrue();
      expect(isCleared(refs.parentRef)).assertTrue();
      expect(isCleared(refs.childRef)).assertTrue();
      expect(headRef.deref() === head).assertTrue();
      expect(ringLength(head, size + 1)).assertEqual(expectedLength);
      expect(ringIdSum(head, size)).assertEqual(expectedIdSum(5, size));
    });
  });
}
