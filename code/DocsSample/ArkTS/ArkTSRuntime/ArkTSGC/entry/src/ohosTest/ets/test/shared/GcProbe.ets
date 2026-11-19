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

import { hidebug } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { sleepMs } from './TestPace';

declare class ArkTools {
  static hintGC(): void;
}

export const KEY_GC_COUNT: string = 'ark.gc.gc-count';
export const KEY_GC_TIME: string = 'ark.gc.gc-time';
export const KEY_BYTES_ALLOCATED: string = 'ark.gc.gc-bytes-allocated';
export const KEY_BYTES_FREED: string = 'ark.gc.gc-bytes-freed';
export const KEY_FULL_GC_LONG: string = 'ark.gc.fullgc-longtime-count';
export const GC_STAT_KEYS: string[] = [
  KEY_GC_COUNT, KEY_GC_TIME, KEY_BYTES_ALLOCATED, KEY_BYTES_FREED, KEY_FULL_GC_LONG
];
export const ERR_INVALID_PARAM: number = 401;
export const COLLECT_ROUNDS: number = 20;
export const KB: number = 1024;

const COLLECT_WAIT_MS: number = 30;
const PRESSURE_OBJECTS: number = 20000;
const PRESSURE_PAYLOAD: number = 16;

export function hintGC(): void {
  ArkTools.hintGC();
}

// some keys come back as bigint, so every reader converts
export function gcStat(key: string): number {
  return Number(hidebug.getVMRuntimeStat(key));
}

export function statErrorCode(key: string): number {
  try {
    hidebug.getVMRuntimeStat(key);
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return 0;
}

export class GcSnapshot {
  count: number;
  time: number;
  allocated: number;
  freed: number;
  longFullGc: number;

  constructor() {
    this.count = gcStat(KEY_GC_COUNT);
    this.time = gcStat(KEY_GC_TIME);
    this.allocated = gcStat(KEY_BYTES_ALLOCATED);
    this.freed = gcStat(KEY_BYTES_FREED);
    this.longFullGc = gcStat(KEY_FULL_GC_LONG);
  }

  values(): number[] {
    return [this.count, this.time, this.allocated, this.freed, this.longFullGc];
  }

  notBefore(earlier: GcSnapshot): boolean {
    const now: number[] = this.values();
    const then: number[] = earlier.values();
    return now.every((value: number, index: number) => value >= then[index]);
  }
}

export class HeapSnapshot {
  totalKb: number;
  usedKb: number;
  arrayKb: number;

  constructor() {
    const info: hidebug.VMMemoryInfo = hidebug.getAppVMMemoryInfo();
    this.totalKb = Number(info.totalHeap);
    this.usedKb = Number(info.heapUsed);
    this.arrayKb = Number(info.allArraySize);
  }
}

export class RingNode {
  id: number;
  next: RingNode | null = null;
  payload: number[];

  constructor(id: number, payloadLength: number) {
    this.id = id;
    this.payload = new Array<number>(payloadLength).fill(id);
  }
}

// Same shape as Parent and Child in main/ets/ReferenceCounting.ts, which does not export them
export class CycleParent {
  tag: number;
  child: CycleChild | null = null;

  constructor(tag: number) {
    this.tag = tag;
  }
}

export class CycleChild {
  tag: number;
  parent: CycleParent | null = null;

  constructor(tag: number) {
    this.tag = tag;
  }
}

export function linkPair(tag: number): CycleParent {
  const parent: CycleParent = new CycleParent(tag);
  const child: CycleChild = new CycleChild(tag);
  parent.child = child;
  child.parent = parent;
  return parent;
}

export function pairIsLinked(parent: CycleParent): boolean {
  const child: CycleChild | null = parent.child;
  return child !== null && child.parent === parent && child.tag === parent.tag;
}

export function buildRing(size: number, payloadLength: number, firstId: number): RingNode {
  const head: RingNode = new RingNode(firstId, payloadLength);
  let tail: RingNode = head;
  for (let i = 1; i < size; i++) {
    const node: RingNode = new RingNode(firstId + i, payloadLength);
    tail.next = node;
    tail = node;
  }
  tail.next = head;
  return head;
}

// -1 means the walk never came back to the head within the limit
export function ringLength(head: RingNode, limit: number): number {
  let steps: number = 0;
  let current: RingNode | null = head;
  do {
    current = (current as RingNode).next;
    steps++;
    if (current === null || steps > limit) {
      return -1;
    }
  } while (current !== head);
  return steps;
}

export function ringIdSum(head: RingNode, size: number): number {
  let sum: number = 0;
  let current: RingNode = head;
  for (let i = 0; i < size; i++) {
    sum += current.id;
    current = current.next as RingNode;
  }
  return sum;
}

// arithmetic series, independent from the ring walk
export function expectedIdSum(firstId: number, size: number): number {
  return firstId * size + size * (size - 1) / 2;
}

export class RingProbe {
  ref: WeakRef<RingNode>;
  length: number;
  idSum: number;

  constructor(ref: WeakRef<RingNode>, length: number, idSum: number) {
    this.ref = ref;
    this.length = length;
    this.idSum = idSum;
  }
}

// built in a plain function so no async frame keeps the ring reachable
export function releasedRing(size: number, payloadLength: number, firstId: number): RingProbe {
  const head: RingNode = buildRing(size, payloadLength, firstId);
  return new RingProbe(new WeakRef<RingNode>(head), ringLength(head, size + 1), ringIdSum(head, size));
}

export function releasedPair(tag: number): WeakRef<CycleParent> {
  return new WeakRef<CycleParent>(linkPair(tag));
}

export function releasedChild(tag: number): WeakRef<CycleChild> {
  return new WeakRef<CycleChild>(linkPair(tag).child as CycleChild);
}

export function isCleared<T extends object>(ref: WeakRef<T>): boolean {
  return ref.deref() === undefined;
}

export function allCleared<T extends object>(refs: WeakRef<T>[]): boolean {
  return refs.every((ref: WeakRef<T>) => ref.deref() === undefined);
}

export function allocatePressure(): number {
  let sink: number = 0;
  for (let i = 0; i < PRESSURE_OBJECTS; i++) {
    const node: RingNode = new RingNode(i, PRESSURE_PAYLOAD);
    node.next = node;
    sink += node.id;
  }
  return sink;
}

// the check runs in its own job: a successful deref keeps the target alive until that job ends
export async function collectUntil(done: () => boolean, maxRounds: number): Promise<number> {
  for (let round = 1; round <= maxRounds; round++) {
    await sleepMs(COLLECT_WAIT_MS);
    hintGC();
    allocatePressure();
    await sleepMs(COLLECT_WAIT_MS);
    if (done()) {
      return round;
    }
  }
  return -1;
}

export async function runGcCycles(minCycles: number, maxRounds: number): Promise<number> {
  const start: number = gcStat(KEY_GC_COUNT);
  await collectUntil(() => gcStat(KEY_GC_COUNT) - start >= minCycles, maxRounds);
  return gcStat(KEY_GC_COUNT) - start;
}

export function retainArrays(count: number, length: number): number[][] {
  const kept: number[][] = [];
  for (let i = 0; i < count; i++) {
    kept.push(new Array<number>(length).fill(i));
  }
  return kept;
}

export class FinalizeTracker {
  private seen: number[] = [];
  readonly registry: FinalizationRegistry<number>;

  constructor() {
    this.registry = new FinalizationRegistry<number>((token: number) => {
      this.seen.push(token);
    });
  }

  registerReleasedRings(count: number, size: number, firstToken: number): void {
    for (let i = 0; i < count; i++) {
      this.registry.register(buildRing(size, 1, firstToken + i), firstToken + i);
    }
  }

  registerReleasedPairs(count: number, firstToken: number): void {
    for (let i = 0; i < count; i++) {
      this.registry.register(linkPair(firstToken + i), firstToken + i);
    }
  }

  count(): number {
    return this.seen.length;
  }

  has(token: number): boolean {
    return this.seen.indexOf(token) >= 0;
  }

  sortedTokens(): number[] {
    return this.seen.slice().sort((a: number, b: number) => a - b);
  }
}

export function range(first: number, count: number): number[] {
  const values: number[] = [];
  for (let i = 0; i < count; i++) {
    values.push(first + i);
  }
  return values;
}

export function sameNumbers(actual: number[], expected: number[]): boolean {
  return actual.length === expected.length && actual.every((value: number, index: number) => value === expected[index]);
}
