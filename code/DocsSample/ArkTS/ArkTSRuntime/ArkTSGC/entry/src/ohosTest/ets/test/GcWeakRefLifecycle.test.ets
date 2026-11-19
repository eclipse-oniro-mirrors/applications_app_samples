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
