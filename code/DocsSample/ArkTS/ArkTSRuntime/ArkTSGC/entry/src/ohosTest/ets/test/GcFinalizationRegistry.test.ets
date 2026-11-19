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
  CycleParent,
  expectedIdSum,
  FinalizeTracker,
  GcSnapshot,
  gcStat,
  hintGC,
  KEY_GC_COUNT,
  linkPair,
  pairIsLinked,
  range,
  RingNode,
  sameNumbers
} from './shared/GcProbe';
import { paceTurn, sleepMs } from './shared/TestPace';
import { logCase } from './shared/TestLog';

const PAIR_SMALL: number = 3;
const PAIR_MID: number = 5;
const PAIR_WIDE: number = 8;
const PAIR_TALL: number = 10;
const RING_TINY: number = 3;
const RING_SMALL: number = 6;
const RING_MID: number = 10;
const RING_WIDE: number = 20;
const BATCH_ROUNDS: number = 8;
const CYCLE_ROUNDS: number = 12;
const LATE_ROUNDS: number = 3;
const ZERO: number = 0;
const ONE: number = 1;
const TWO: number = 2;

class TokenRecord {
  readonly id: number;
  readonly label: string;

  constructor(id: number, label: string) {
    this.id = id;
    this.label = label;
  }
}

// numeric held values, the plain number token case
class NumberLedger {
  readonly registry: FinalizationRegistry<number>;
  private seen: number[];

  constructor() {
    const seen: number[] = [];
    this.seen = seen;
    this.registry = new FinalizationRegistry<number>((token: number) => {
      seen.push(token);
    });
  }

  registerPair(target: CycleParent, token: number): void {
    this.registry.register(target, token);
  }

  registerPairKeyed(target: CycleParent, token: number, key: object): void {
    this.registry.register(target, token, key);
  }

  registerRing(target: RingNode, token: number): void {
    this.registry.register(target, token);
  }

  registerRingKeyed(target: RingNode, token: number, key: object): void {
    this.registry.register(target, token, key);
  }

  unregister(key: object): void {
    this.registry.unregister(key);
  }

  count(): number {
    return this.seen.length;
  }

  has(token: number): boolean {
    return this.seen.indexOf(token) >= 0;
  }

  values(): number[] {
    return this.seen.slice();
  }

  sorted(): number[] {
    return this.seen.slice().sort((left: number, right: number) => left - right);
  }
}

// string held values
class StringLedger {
  readonly registry: FinalizationRegistry<string>;
  private seen: string[];

  constructor() {
    const seen: string[] = [];
    this.seen = seen;
    this.registry = new FinalizationRegistry<string>((token: string) => {
      seen.push(token);
    });
  }

  registerPair(target: CycleParent, token: string): void {
    this.registry.register(target, token);
  }

  registerPairKeyed(target: CycleParent, token: string, key: object): void {
    this.registry.register(target, token, key);
  }

  registerRing(target: RingNode, token: string): void {
    this.registry.register(target, token);
  }

  unregister(key: object): void {
    this.registry.unregister(key);
  }

  count(): number {
    return this.seen.length;
  }

  has(token: string): boolean {
    return this.seen.indexOf(token) >= 0;
  }

  values(): string[] {
    return this.seen.slice();
  }

  sorted(): string[] {
    return this.seen.slice().sort((left: string, right: string) => compareStrings(left, right));
  }
}

// object held values, the held value is also usable as an unregister token
class BoxLedger {
  readonly registry: FinalizationRegistry<TokenRecord>;
  private seen: TokenRecord[];

  constructor() {
    const seen: TokenRecord[] = [];
    this.seen = seen;
    this.registry = new FinalizationRegistry<TokenRecord>((held: TokenRecord) => {
      seen.push(held);
    });
  }

  registerPair(target: CycleParent, held: TokenRecord, key: object): void {
    this.registry.register(target, held, key);
  }

  registerPairPlain(target: CycleParent, held: TokenRecord): void {
    this.registry.register(target, held);
  }

  registerRing(target: RingNode, held: TokenRecord, key: object): void {
    this.registry.register(target, held, key);
  }

  unregister(key: object): void {
    this.registry.unregister(key);
  }

  count(): number {
    return this.seen.length;
  }

  hasId(id: number): boolean {
    return this.seen.some((held: TokenRecord) => held.id === id);
  }

  ids(): number[] {
    return this.seen.map((held: TokenRecord) => held.id);
  }

  sortedIds(): number[] {
    return this.ids().sort((left: number, right: number) => left - right);
  }

  labels(): string[] {
    return this.seen.map((held: TokenRecord) => held.label);
  }

  find(id: number): TokenRecord | null {
    let found: TokenRecord | null = null;
    this.seen.forEach((held: TokenRecord) => {
      if (held.id === id) {
        found = held;
      }
    });
    return found;
  }
}

// two registries held as plain class fields
class RegistryBag {
  readonly primary: FinalizationRegistry<number>;
  readonly secondary: FinalizationRegistry<number>;
  private primarySeen: number[];
  private secondarySeen: number[];

  constructor() {
    const primarySeen: number[] = [];
    const secondarySeen: number[] = [];
    this.primarySeen = primarySeen;
    this.secondarySeen = secondarySeen;
    this.primary = new FinalizationRegistry<number>((token: number) => {
      primarySeen.push(token);
    });
    this.secondary = new FinalizationRegistry<number>((token: number) => {
      secondarySeen.push(token);
    });
  }

  registerPrimary(tag: number, token: number): void {
    this.primary.register(linkPair(tag), token);
  }

  registerSecondary(tag: number, token: number): void {
    this.secondary.register(linkPair(tag), token);
  }

  primaryCount(): number {
    return this.primarySeen.length;
  }

  secondaryCount(): number {
    return this.secondarySeen.length;
  }

  primaryValues(): number[] {
    return this.primarySeen.slice().sort((left: number, right: number) => left - right);
  }

  secondaryValues(): number[] {
    return this.secondarySeen.slice().sort((left: number, right: number) => left - right);
  }
}

// registry kept in a class field together with the tokens that can unregister it
class PairGuard {
  readonly registry: FinalizationRegistry<TokenRecord>;
  private seen: number[];
  private tokens: Map<number, TokenRecord>;

  constructor() {
    const seen: number[] = [];
    this.seen = seen;
    this.tokens = new Map<number, TokenRecord>();
    this.registry = new FinalizationRegistry<TokenRecord>((held: TokenRecord) => {
      seen.push(held.id);
    });
  }

  guard(tag: number, id: number): TokenRecord {
    const held: TokenRecord = new TokenRecord(id, 'guard-' + id.toString());
    this.tokens.set(id, held);
    this.registry.register(linkPair(tag), held, held);
    return held;
  }

  release(id: number): void {
    const held: TokenRecord | undefined = this.tokens.get(id);
    if (held === undefined) {
      return;
    }
    this.registry.unregister(held as object);
  }

  count(): number {
    return this.seen.length;
  }

  sortedIds(): number[] {
    return this.seen.slice().sort((left: number, right: number) => left - right);
  }

  labels(): string[] {
    return this.seen.map((id: number) => 'guard-' + id.toString())
      .sort((left: string, right: string) => compareStrings(left, right));
  }

  find(id: number): TokenRecord | null {
    const held: TokenRecord | undefined = this.tokens.get(id);
    if (held === undefined) {
      return null;
    }
    return held;
  }

  tokenCount(): number {
    return this.tokens.size;
  }
}

// registry kept in a static field
class StaticRegistryHolder {
  static seen: number[] = [];
  static readonly registry: FinalizationRegistry<number> = new FinalizationRegistry<number>((token: number) => {
    StaticRegistryHolder.seen.push(token);
  });

  static registerPair(tag: number, token: number): void {
    StaticRegistryHolder.registry.register(linkPair(tag), token);
  }

  static reset(): void {
    StaticRegistryHolder.seen = [];
  }

  static count(): number {
    return StaticRegistryHolder.seen.length;
  }

  static values(): number[] {
    return StaticRegistryHolder.seen.slice().sort((left: number, right: number) => left - right);
  }
}

// registry built inside a constructor over a captured array
class SinkProbe {
  readonly registry: FinalizationRegistry<string>;
  private sink: string[];

  constructor() {
    const sink: string[] = [];
    this.sink = sink;
    this.registry = new FinalizationRegistry<string>((token: string) => {
      sink.push(token);
    });
  }

  values(): string[] {
    return this.sink.slice().sort((left: string, right: string) => compareStrings(left, right));
  }

  count(): number {
    return this.sink.length;
  }
}

function makeSinkProbe(): SinkProbe {
  return new SinkProbe();
}

function compareStrings(left: string, right: string): number {
  if (left < right) {
    return -1;
  }
  if (left > right) {
    return 1;
  }
  return 0;
}

function ascending(values: number[]): boolean {
  for (let i = 1; i < values.length; i++) {
    if (values[i] < values[i - 1]) {
      return false;
    }
  }
  return true;
}

function ascendingStrings(values: string[]): boolean {
  for (let i = 1; i < values.length; i++) {
    if (compareStrings(values[i - 1], values[i]) > 0) {
      return false;
    }
  }
  return true;
}

function occurrences(values: number[], token: number): number {
  let hits: number = 0;
  values.forEach((value: number) => {
    if (value === token) {
      hits++;
    }
  });
  return hits;
}

function occurrencesString(values: string[], token: string): number {
  let hits: number = 0;
  values.forEach((value: string) => {
    if (value === token) {
      hits++;
    }
  });
  return hits;
}

function sameStrings(actual: string[], expected: string[]): boolean {
  return actual.length === expected.length &&
    actual.every((value: string, index: number) => value === expected[index]);
}

function uniqueNumbers(values: number[]): number[] {
  const unique: number[] = [];
  values.forEach((value: number) => {
    if (unique.indexOf(value) < 0) {
      unique.push(value);
    }
  });
  return unique;
}

function stringToken(base: string, index: number): string {
  return base + '-' + index.toString();
}

function expectedStringTokens(base: string, firstIndex: number, count: number): string[] {
  const tokens: string[] = [];
  for (let i = 0; i < count; i++) {
    tokens.push(stringToken(base, firstIndex + i));
  }
  return tokens.sort((left: string, right: string) => compareStrings(left, right));
}

// every registration below runs in a plain function so no async frame keeps the target reachable
function registerSameTargetKeyed(ledger: NumberLedger, tag: number, tokens: number[], keys: object[]): void {
  const parent: CycleParent = linkPair(tag);
  for (let i = 0; i < tokens.length; i++) {
    ledger.registerPairKeyed(parent, tokens[i], keys[i]);
  }
}

function registerSameTargetMany(ledger: NumberLedger, tag: number, firstToken: number, count: number): void {
  const parent: CycleParent = linkPair(tag);
  for (let i = 0; i < count; i++) {
    ledger.registerPair(parent, firstToken + i);
  }
}

function registerTargetTwiceInOneAndOnceInOther(first: NumberLedger, second: NumberLedger, tag: number,
  firstTokenA: number, firstTokenB: number, secondToken: number): void {
  const parent: CycleParent = linkPair(tag);
  first.registerPair(parent, firstTokenA);
  first.registerPair(parent, firstTokenB);
  second.registerPair(parent, secondToken);
}

function registerNumberPairs(ledger: NumberLedger, count: number, firstToken: number): number {
  let tagSum: number = 0;
  for (let i = 0; i < count; i++) {
    const parent: CycleParent = linkPair(firstToken + i);
    ledger.registerPair(parent, firstToken + i);
    tagSum += parent.tag;
  }
  return tagSum;
}

function registerNumberPairAt(ledger: NumberLedger, tag: number, token: number): void {
  ledger.registerPair(linkPair(tag), token);
}

function registerNumberRings(ledger: NumberLedger, count: number, size: number, firstToken: number): number {
  let lengthSum: number = 0;
  for (let i = 0; i < count; i++) {
    const head: RingNode = buildRing(size, ONE, firstToken + i);
    ledger.registerRing(head, firstToken + i);
    lengthSum += size;
  }
  return lengthSum;
}

function registerNumberRingAt(ledger: NumberLedger, id: number, size: number, token: number): void {
  ledger.registerRing(buildRing(size, ONE, id), token);
}

function registerNumberMixed(ledger: NumberLedger, pairCount: number, ringCount: number, ringSize: number,
  firstToken: number): void {
  for (let i = 0; i < pairCount; i++) {
    ledger.registerPair(linkPair(firstToken + i), firstToken + i);
  }
  for (let i = 0; i < ringCount; i++) {
    ledger.registerRing(buildRing(ringSize, ONE, firstToken + pairCount + i), firstToken + pairCount + i);
  }
}

function registerNumberPairKeyedAt(ledger: NumberLedger, tag: number, token: number, key: object): void {
  ledger.registerPairKeyed(linkPair(tag), token, key);
}

function registerSameTargetTwice(ledger: NumberLedger, tag: number, firstToken: number,
  secondToken: number): void {
  const parent: CycleParent = linkPair(tag);
  ledger.registerPair(parent, firstToken);
  ledger.registerPair(parent, secondToken);
}

function registerSameTargetSameKey(ledger: NumberLedger, tag: number, token: number, key: object): void {
  const parent: CycleParent = linkPair(tag);
  ledger.registerPairKeyed(parent, token, key);
  ledger.registerPairKeyed(parent, token, key);
}

function registerSameRingTwice(ledger: NumberLedger, id: number, size: number, firstToken: number,
  secondToken: number): void {
  const head: RingNode = buildRing(size, ONE, id);
  ledger.registerRing(head, firstToken);
  ledger.registerRing(head, secondToken);
}

function registerSharedTarget(first: NumberLedger, second: NumberLedger, tag: number, firstToken: number,
  secondToken: number): void {
  const parent: CycleParent = linkPair(tag);
  first.registerPair(parent, firstToken);
  second.registerPair(parent, secondToken);
}

function registerSharedTargetKeyed(first: NumberLedger, second: NumberLedger, tag: number, firstToken: number,
  secondToken: number, key: object): void {
  const parent: CycleParent = linkPair(tag);
  first.registerPairKeyed(parent, firstToken, key);
  second.registerPairKeyed(parent, secondToken, key);
}

function registerInto(registry: FinalizationRegistry<number>, tag: number, token: number): void {
  registry.register(linkPair(tag), token);
}

function registerPairTwiceAroundUnregister(ledger: NumberLedger, tag: number, firstToken: number,
  secondToken: number, firstKey: object, secondKey: object): void {
  const parent: CycleParent = linkPair(tag);
  ledger.registerPairKeyed(parent, firstToken, firstKey);
  ledger.unregister(firstKey);
  ledger.registerPairKeyed(parent, secondToken, secondKey);
}

function registerPairWithSelfKey(ledger: NumberLedger, tag: number, token: number): void {
  const parent: CycleParent = linkPair(tag);
  ledger.registerPairKeyed(parent, token, parent as object);
}

function registerUnregisterRegister(ledger: NumberLedger, tag: number, token: number, key: object): void {
  const parent: CycleParent = linkPair(tag);
  ledger.registerPairKeyed(parent, token, key);
  ledger.unregister(key);
  ledger.registerPairKeyed(parent, token, key);
}

function rekeyTarget(ledger: NumberLedger, tag: number, token: number, firstKey: object,
  secondKey: object): void {
  const parent: CycleParent = linkPair(tag);
  ledger.registerPairKeyed(parent, token, firstKey);
  ledger.unregister(firstKey);
  ledger.registerPairKeyed(parent, token, secondKey);
  ledger.unregister(firstKey);
}

function churnRegisterUnregister(ledger: NumberLedger, tag: number, token: number, key: object,
  rounds: number): void {
  const parent: CycleParent = linkPair(tag);
  for (let i = 0; i < rounds; i++) {
    ledger.registerPairKeyed(parent, token, key);
    ledger.unregister(key);
  }
}

function pumpToken(ledger: NumberLedger, tag: number, firstToken: number, secondToken: number,
  key: object): void {
  const parent: CycleParent = linkPair(tag);
  ledger.unregister(key);
  ledger.registerPairKeyed(parent, firstToken, key);
  ledger.unregister(key);
  ledger.registerPairKeyed(parent, secondToken, key);
}

function registerIntoString(registry: FinalizationRegistry<string>, tag: number, token: string): void {
  registry.register(linkPair(tag), token);
}

function registerStringPairs(ledger: StringLedger, count: number, base: string, firstTag: number): number {
  let tagSum: number = 0;
  for (let i = 0; i < count; i++) {
    ledger.registerPair(linkPair(firstTag + i), stringToken(base, i));
    tagSum += firstTag + i;
  }
  return tagSum;
}

function registerStringPairAt(ledger: StringLedger, tag: number, token: string): void {
  ledger.registerPair(linkPair(tag), token);
}

function registerStringPairKeyedAt(ledger: StringLedger, tag: number, token: string, key: object): void {
  ledger.registerPairKeyed(linkPair(tag), token, key);
}

function registerStringRings(ledger: StringLedger, count: number, size: number, base: string,
  firstId: number): void {
  for (let i = 0; i < count; i++) {
    ledger.registerRing(buildRing(size, ONE, firstId + i), stringToken(base, i));
  }
}

function registerStringRingAt(ledger: StringLedger, id: number, size: number, token: string): void {
  ledger.registerRing(buildRing(size, ONE, id), token);
}

function registerBoxPairs(ledger: BoxLedger, count: number, firstId: number): TokenRecord[] {
  const tokens: TokenRecord[] = [];
  for (let i = 0; i < count; i++) {
    const token: TokenRecord = new TokenRecord(firstId + i, 'pair-' + (firstId + i).toString());
    ledger.registerPair(linkPair(firstId + i), token, token);
    tokens.push(token);
  }
  return tokens;
}

function registerBoxPairAt(ledger: BoxLedger, tag: number, id: number, label: string): TokenRecord {
  const token: TokenRecord = new TokenRecord(id, label);
  ledger.registerPair(linkPair(tag), token, token);
  return token;
}

function registerBoxPairPlain(ledger: BoxLedger, tag: number, id: number, label: string): TokenRecord {
  const token: TokenRecord = new TokenRecord(id, label);
  ledger.registerPairPlain(linkPair(tag), token);
  return token;
}

function registerBoxPairWithKeyAt(ledger: BoxLedger, tag: number, held: TokenRecord, key: object): void {
  ledger.registerPair(linkPair(tag), held, key);
}

function registerBoxRings(ledger: BoxLedger, count: number, size: number, firstId: number): TokenRecord[] {
  const tokens: TokenRecord[] = [];
  for (let i = 0; i < count; i++) {
    const token: TokenRecord = new TokenRecord(firstId + i, 'ring-' + (firstId + i).toString());
    ledger.registerRing(buildRing(size, ONE, firstId + i), token, token);
    tokens.push(token);
  }
  return tokens;
}

function registerBoxRingAt(ledger: BoxLedger, id: number, size: number, tokenId: number,
  label: string): TokenRecord {
  const token: TokenRecord = new TokenRecord(tokenId, label);
  ledger.registerRing(buildRing(size, ONE, id), token, token);
  return token;
}

export default function gcFinalizationRegistryTest() {
  describe('GcFinalizationRegistry', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0100
     * @tc.name      testFinalRegNumberPair0001
     * @tc.desc      Register three released Parent and Child cycles with numeric held values and check each callback
     *               delivers exactly its own token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegNumberPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const tagSum: number = registerNumberPairs(ledger, PAIR_SMALL, 101);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      logCase('testFinalRegNumberPair0001', `rounds=${rounds} count=${ledger.count()} tagSum=${tagSum} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
      expect(sameNumbers(ledger.sorted(), range(101, PAIR_SMALL))).assertTrue();
      expect(tagSum).assertEqual(expectedIdSum(101, PAIR_SMALL));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0200
     * @tc.name      testFinalRegNumberRing0001
     * @tc.desc      Register three released rings of six nodes through a tracker and check the numeric tokens come back
     *               in registration range
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegNumberRing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedRings(PAIR_SMALL, RING_SMALL, 201);
      const rounds: number = await collectUntil(() => tracker.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      logCase('testFinalRegNumberRing0001', `rounds=${rounds} count=${tracker.count()} ` +
        `tokens=${tracker.sortedTokens().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tracker.count()).assertEqual(PAIR_SMALL);
      expect(sameNumbers(tracker.sortedTokens(), range(201, PAIR_SMALL))).assertTrue();
      expect(tracker.has(202)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0300
     * @tc.name      testFinalRegNumberPair0002
     * @tc.desc      Register five released pairs with numeric held values and check the ledger keeps all five distinct
     *               tokens
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegNumberPair0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairs(ledger, PAIR_MID, 300);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_MID, COLLECT_ROUNDS);
      const unique: number[] = uniqueNumbers(ledger.values());
      logCase('testFinalRegNumberPair0002', `rounds=${rounds} count=${ledger.count()} unique=${unique.length} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_MID);
      expect(unique.length).assertEqual(PAIR_MID);
      expect(sameNumbers(ledger.sorted(), range(300, PAIR_MID))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0400
     * @tc.name      testFinalRegNumberRing0002
     * @tc.desc      Register four released rings of ten nodes with numeric tokens and check every token is reported
     *               once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegNumberRing0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const lengthSum: number = registerNumberRings(ledger, 4, RING_MID, 400);
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegNumberRing0002', `rounds=${rounds} count=${ledger.count()} lengthSum=${lengthSum} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(lengthSum).assertEqual(40);
      expect(tokens.length).assertEqual(4);
      expect(sameNumbers(tokens, range(400, 4))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0500
     * @tc.name      testFinalRegNumberMixed0001
     * @tc.desc      Register two released pairs and two released rings in one registry and check all four numeric
     *               tokens arrive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegNumberMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberMixed(ledger, TWO, TWO, RING_TINY, 500);
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegNumberMixed0001', `rounds=${rounds} count=${ledger.count()} tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(4);
      expect(sameNumbers(tokens, range(500, 4))).assertTrue();
      expect(ascending(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0600
     * @tc.name      testFinalRegNumberTracker0001
     * @tc.desc      Register six released pairs through the shared tracker and check the reported tokens match the
     *               registration range exactly
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegNumberTracker0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const tracker: FinalizeTracker = new FinalizeTracker();
      tracker.registerReleasedPairs(6, 600);
      const rounds: number = await collectUntil(() => tracker.count() >= 6, COLLECT_ROUNDS);
      const tokens: number[] = tracker.sortedTokens();
      logCase('testFinalRegNumberTracker0001', `rounds=${rounds} count=${tracker.count()} ` +
        `first=${tokens[0]} last=${tokens[tokens.length - 1]} tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tracker.count()).assertEqual(6);
      expect(sameNumbers(tokens, range(600, 6))).assertTrue();
      expect(tracker.has(600) && tracker.has(605)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0700
     * @tc.name      testFinalRegNumberRetained0001
     * @tc.desc      Keep one registered pair reachable, drop the other two and check only the dropped tokens are
     *               reported across extra collection rounds
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegNumberRetained0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const kept: CycleParent = linkPair(701);
      ledger.registerPair(kept, 701);
      registerNumberPairAt(ledger, 700, 700);
      registerNumberPairAt(ledger, 702, 702);
      const rounds: number = await collectUntil(() => ledger.count() >= 2, COLLECT_ROUNDS);
      const lateRounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, LATE_ROUNDS);
      logCase('testFinalRegNumberRetained0001', `rounds=${rounds} lateRounds=${lateRounds} count=${ledger.count()} ` +
        `keptTag=${kept.tag} linked=${pairIsLinked(kept)} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(2);
      expect(ledger.has(701)).assertFalse();
      expect(pairIsLinked(kept)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0800
     * @tc.name      testFinalRegNumberBatch0001
     * @tc.desc      Register two released pairs, collect, then register two more and check the ledger holds all four
     *               tokens exactly once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegNumberBatch0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairs(ledger, TWO, 800);
      const firstRounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      registerNumberPairs(ledger, TWO, 802);
      const secondRounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegNumberBatch0001', `firstRounds=${firstRounds} secondRounds=${secondRounds} ` +
        `count=${ledger.count()} tokens=${tokens.join(',')}`);
      expect(firstRounds > 0 && secondRounds > 0).assertTrue();
      expect(tokens.length).assertEqual(4);
      expect(sameNumbers(tokens, range(800, 4))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_0900
     * @tc.name      testFinalRegNumberRingSizes0001
     * @tc.desc      Register rings of two, five and nine nodes with numeric tokens and check size never changes the
     *               reported token set
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegNumberRingSizes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberRingAt(ledger, 9001, TWO, 900);
      registerNumberRingAt(ledger, 9101, PAIR_MID, 901);
      registerNumberRingAt(ledger, 9201, 9, 902);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegNumberRingSizes0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(PAIR_SMALL);
      expect(sameNumbers(tokens, range(900, PAIR_SMALL))).assertTrue();
      expect(ledger.has(901)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1000
     * @tc.name      testFinalRegNumberNoToken0001
     * @tc.desc      Register a pair without any unregister token and check the callback still fires while unregister
     *               with a fresh object reports nothing removed
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegNumberNoToken0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairAt(ledger, 1001, 1001);
      registerNumberPairAt(ledger, 1002, 1002);
      const fresh: TokenRecord = new TokenRecord(1003, 'fresh');
      ledger.unregister(fresh as object);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      logCase('testFinalRegNumberNoToken0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(sameNumbers(ledger.sorted(), range(1001, TWO))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1100
     * @tc.name      testFinalRegNumberDuplicate0001
     * @tc.desc      Register two different pairs with the same numeric token and check both callbacks deliver that
     *               token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegNumberDuplicate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairAt(ledger, 1105, 1100);
      registerNumberPairAt(ledger, 1106, 1100);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const values: number[] = ledger.values();
      logCase('testFinalRegNumberDuplicate0001', `rounds=${rounds} count=${ledger.count()} ` +
        `hits=${occurrences(values, 1100)} tokens=${values.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(occurrences(values, 1100)).assertEqual(TWO);
      expect(uniqueNumbers(values).length).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1200
     * @tc.name      testFinalRegNumberZero0001
     * @tc.desc      Use zero and one as numeric held values and check falsy tokens are reported like any other token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegNumberZero0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairAt(ledger, 2001, ZERO);
      registerNumberPairAt(ledger, 2002, ONE);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      const firstToken: number = 0;
      logCase('testFinalRegNumberZero0001', `rounds=${rounds} count=${ledger.count()} tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(firstToken)).assertTrue();
      expect(sameNumbers(tokens, range(ZERO, TWO))).assertTrue();
    });
    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1300
     * @tc.name      testFinalRegStringPair0001
     * @tc.desc      Register three released pairs with string held values and check each callback delivers the exact
     *               string token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegStringPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: StringLedger = new StringLedger();
      const tagSum: number = registerStringPairs(ledger, PAIR_SMALL, 'alpha', 100);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const expected: string[] = expectedStringTokens('alpha', ZERO, PAIR_SMALL);
      const middle: string = 'alpha-1';
      logCase('testFinalRegStringPair0001', `rounds=${rounds} count=${ledger.count()} tagSum=${tagSum} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
      expect(sameStrings(ledger.sorted(), expected)).assertTrue();
      expect(ledger.has(middle)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1400
     * @tc.name      testFinalRegStringRing0001
     * @tc.desc      Register three released rings with string held values and check the reported tokens are exactly
     *               the registered ones
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegStringRing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: StringLedger = new StringLedger();
      registerStringRings(ledger, PAIR_SMALL, RING_SMALL, 'bravo', 200);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      logCase('testFinalRegStringRing0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(PAIR_SMALL);
      expect(sameStrings(tokens, expectedStringTokens('bravo', ZERO, PAIR_SMALL))).assertTrue();
      expect(ascendingStrings(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1500
     * @tc.name      testFinalRegStringMixed0001
     * @tc.desc      Register pairs and rings with two different string bases and check the merged token list is sorted
     *               and complete
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegStringMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: StringLedger = new StringLedger();
      registerStringPairs(ledger, TWO, 'charlie', 300);
      registerStringRingAt(ledger, 4001, RING_TINY, 'delta-0');
      registerStringRingAt(ledger, 4002, RING_TINY, 'delta-1');
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      const expected: string[] = expectedStringTokens('charlie', ZERO, TWO)
        .concat(expectedStringTokens('delta', ZERO, TWO))
        .sort((left: string, right: string) => compareStrings(left, right));
      logCase('testFinalRegStringMixed0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(4);
      expect(sameStrings(tokens, expected)).assertTrue();
      expect(ascendingStrings(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1600
     * @tc.name      testFinalRegStringEmpty0001
     * @tc.desc      Use the empty string, a single space and a plain word as held values and check all three are
     *               delivered unchanged
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegStringEmpty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const emptyToken: string = '';
      const blankToken: string = ' ';
      const plainToken: string = 'plain';
      registerStringPairAt(ledger, 401, emptyToken);
      registerStringPairAt(ledger, 402, blankToken);
      registerStringPairAt(ledger, 403, plainToken);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      const firstToken: string = tokens[0];
      const secondToken: string = tokens[1];
      logCase('testFinalRegStringEmpty0001', `rounds=${rounds} count=${ledger.count()} ` +
        `firstLength=${firstToken.length} secondLength=${secondToken.length}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(emptyToken)).assertTrue();
      expect(firstToken).assertEqual(emptyToken);
      expect(secondToken).assertEqual(blankToken);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1700
     * @tc.name      testFinalRegStringLong0001
     * @tc.desc      Use a kilobyte long string token and its extension and check both long tokens survive the
     *               registry round trip
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegStringLong0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const longToken: string = 'long-' + 'x'.repeat(1024);
      const tailToken: string = longToken + '-tail';
      const expectedLength: number = 5 + 1024;
      registerStringPairAt(ledger, 501, longToken);
      registerStringPairAt(ledger, 502, tailToken);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const values: string[] = ledger.values();
      const shortest: number = values.map((token: string) => token.length).sort((left: number, right: number) =>
        left - right)[0];
      logCase('testFinalRegStringLong0001', `rounds=${rounds} count=${ledger.count()} ` +
        `shortest=${shortest} expected=${expectedLength}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(longToken) && ledger.has(tailToken)).assertTrue();
      expect(shortest).assertEqual(expectedLength);
      expect(ascendingStrings(ledger.sorted())).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1800
     * @tc.name      testFinalRegStringNumeric0001
     * @tc.desc      Use digit only string tokens and check they come back as strings and sort lexicographically
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegStringNumeric0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const lowToken: string = '101';
      const midToken: string = '102';
      const highToken: string = '103';
      const expected: string[] = [lowToken, midToken, highToken];
      registerStringPairAt(ledger, 601, lowToken);
      registerStringPairAt(ledger, 602, midToken);
      registerStringPairAt(ledger, 603, highToken);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      logCase('testFinalRegStringNumeric0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameStrings(tokens, expected)).assertTrue();
      expect(ledger.has(midToken)).assertTrue();
      expect(tokens.every((token: string) => typeof token === 'string')).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_1900
     * @tc.name      testFinalRegStringDuplicate0001
     * @tc.desc      Register two different pairs with the same string token and check the callback runs once per
     *               target with that token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegStringDuplicate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const sharedToken: string = 'dup-token';
      registerStringPairAt(ledger, 701, sharedToken);
      registerStringPairAt(ledger, 702, sharedToken);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const values: string[] = ledger.values();
      logCase('testFinalRegStringDuplicate0001', `rounds=${rounds} count=${ledger.count()} ` +
        `hits=${occurrencesString(values, sharedToken)} tokens=${values.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(occurrencesString(values, sharedToken)).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2000
     * @tc.name      testFinalRegStringOrder0001
     * @tc.desc      Use tokens where lexicographic and numeric order differ and check the sorted ledger follows string
     *               order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegStringOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const rootToken: string = 'sort-base';
      const tenToken: string = 'sort-base-10';
      const twoToken: string = 'sort-base-2';
      const expected: string[] = [rootToken, tenToken, twoToken];
      registerStringPairAt(ledger, 801, twoToken);
      registerStringPairAt(ledger, 802, tenToken);
      registerStringPairAt(ledger, 803, rootToken);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      logCase('testFinalRegStringOrder0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameStrings(tokens, expected)).assertTrue();
      expect(ascendingStrings(tokens)).assertTrue();
      expect(compareStrings(tenToken, twoToken) < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2100
     * @tc.name      testFinalRegStringKeyed0001
     * @tc.desc      Register a dropped pair and a control pair with object unregister tokens, unregister the dropped
     *               one and check only the control token is delivered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegStringKeyed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: StringLedger = new StringLedger();
      const keepKey: TokenRecord = new TokenRecord(2101, 'keep');
      const dropKey: TokenRecord = new TokenRecord(2102, 'drop');
      const keepToken: string = 'keep-token';
      const dropToken: string = 'drop-token';
      registerStringPairKeyedAt(ledger, 2101, keepToken, keepKey as object);
      registerStringPairKeyedAt(ledger, 2102, dropToken, dropKey as object);
      ledger.unregister(dropKey as object);
      const rounds: number = await collectUntil(() => ledger.has(keepToken), COLLECT_ROUNDS);
      logCase('testFinalRegStringKeyed0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(keepToken)).assertTrue();
      expect(ledger.has(dropToken)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2200
     * @tc.name      testFinalRegStringRetained0001
     * @tc.desc      Keep one string registered pair reachable and check two extra collection rounds never report its
     *               token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegStringRetained0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: StringLedger = new StringLedger();
      const kept: CycleParent = linkPair(2201);
      const keptToken: string = 'kept-string-token';
      ledger.registerPair(kept, keptToken);
      registerStringPairAt(ledger, 2202, 'loose-string-a');
      registerStringPairAt(ledger, 2203, 'loose-string-b');
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const lateRounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, LATE_ROUNDS);
      logCase('testFinalRegStringRetained0001', `rounds=${rounds} lateRounds=${lateRounds} ` +
        `count=${ledger.count()} keptTag=${kept.tag} linked=${pairIsLinked(kept)}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(ledger.has(keptToken)).assertFalse();
      expect(pairIsLinked(kept)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2300
     * @tc.name      testFinalRegStringCollect0001
     * @tc.desc      Register five released pairs with one string base and check the full token list arrives exactly
     *               once each
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegStringCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: StringLedger = new StringLedger();
      registerStringPairs(ledger, PAIR_MID, 'echo', 2300);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_MID, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      const expected: string[] = expectedStringTokens('echo', ZERO, PAIR_MID);
      const firstToken: string = 'echo-0';
      const lastToken: string = 'echo-4';
      logCase('testFinalRegStringCollect0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(PAIR_MID);
      expect(sameStrings(tokens, expected)).assertTrue();
      expect(ledger.has(firstToken) && ledger.has(lastToken)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2400
     * @tc.name      testFinalRegStringTimer0001
     * @tc.desc      Register released pairs from inside a timer callback and check the tokens still reach the registry
     *               callback
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegStringTimer0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const registered: number = await new Promise<number>((resolve: (value: number) => void) => {
        setTimeout(() => {
          registerStringPairs(ledger, TWO, 'foxtrot', 2400);
          resolve(TWO);
        }, 10);
      });
      await sleepMs(20);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const expected: string[] = expectedStringTokens('foxtrot', ZERO, TWO);
      logCase('testFinalRegStringTimer0001', `registered=${registered} rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(registered).assertEqual(TWO);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(sameStrings(ledger.sorted(), expected)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2500
     * @tc.name      testFinalRegObjectPair0001
     * @tc.desc      Register three released pairs with object held values and check the callback returns the very same
     *               token instances
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegObjectPair0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: BoxLedger = new BoxLedger();
      const tokens: TokenRecord[] = registerBoxPairs(ledger, PAIR_SMALL, 11);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const found: TokenRecord | null = ledger.find(11);
      logCase('testFinalRegObjectPair0001', `rounds=${rounds} count=${ledger.count()} ` +
        `ids=${ledger.sortedIds().join(',')} labels=${ledger.labels().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
      expect(sameNumbers(ledger.sortedIds(), range(11, PAIR_SMALL))).assertTrue();
      expect(found === tokens[0]).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2600
     * @tc.name      testFinalRegObjectRing0001
     * @tc.desc      Register three released rings with object held values and check the record ids are reported in
     *               order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegObjectRing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: BoxLedger = new BoxLedger();
      registerBoxRings(ledger, PAIR_SMALL, RING_SMALL, 21);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const ids: number[] = ledger.sortedIds();
      const expectedLabel: string = 'ring-22';
      logCase('testFinalRegObjectRing0001', `rounds=${rounds} count=${ledger.count()} ids=${ids.join(',')} ` +
        `labels=${ledger.labels().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ids.length).assertEqual(PAIR_SMALL);
      expect(sameNumbers(ids, range(21, PAIR_SMALL))).assertTrue();
      expect(ledger.labels().indexOf(expectedLabel) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2700
     * @tc.name      testFinalRegObjectIdentity0001
     * @tc.desc      Check object held values arrive by identity and that an id never registered resolves to null
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegObjectIdentity0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: BoxLedger = new BoxLedger();
      const tokens: TokenRecord[] = registerBoxPairs(ledger, TWO, 31);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const firstFound: TokenRecord | null = ledger.find(31);
      const secondFound: TokenRecord | null = ledger.find(32);
      const missing: TokenRecord | null = ledger.find(99);
      logCase('testFinalRegObjectIdentity0001', `rounds=${rounds} count=${ledger.count()} ` +
        `firstMatch=${firstFound === tokens[0]} secondMatch=${secondFound === tokens[1]}`);
      expect(rounds > 0).assertTrue();
      expect(firstFound === tokens[0]).assertTrue();
      expect(secondFound === tokens[1]).assertTrue();
      expect(missing === null).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2800
     * @tc.name      testFinalRegObjectLabel0001
     * @tc.desc      Register three tokens carrying labels and check the delivered labels keep their text and order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegObjectLabel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: BoxLedger = new BoxLedger();
      const alphaLabel: string = 'label-alpha';
      const bravoLabel: string = 'label-bravo';
      const charlieLabel: string = 'label-charlie';
      const expected: string[] = [alphaLabel, bravoLabel, charlieLabel];
      registerBoxPairAt(ledger, 41, 41, alphaLabel);
      registerBoxPairAt(ledger, 42, 42, bravoLabel);
      registerBoxPairAt(ledger, 43, 43, charlieLabel);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const labels: string[] = ledger.labels()
        .sort((left: string, right: string) => compareStrings(left, right));
      logCase('testFinalRegObjectLabel0001', `rounds=${rounds} count=${ledger.count()} labels=${labels.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameStrings(labels, expected)).assertTrue();
      expect(ledger.hasId(42)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_2900
     * @tc.name      testFinalRegObjectWide0001
     * @tc.desc      Register six released pairs with object held values and check every id shows up once and only once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegObjectWide0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: BoxLedger = new BoxLedger();
      registerBoxPairs(ledger, PAIR_WIDE, 51);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_WIDE, COLLECT_ROUNDS);
      const ids: number[] = ledger.sortedIds();
      const unique: number[] = uniqueNumbers(ids);
      logCase('testFinalRegObjectWide0001', `rounds=${rounds} count=${ledger.count()} unique=${unique.length} ` +
        `ids=${ids.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ids.length).assertEqual(PAIR_WIDE);
      expect(sameNumbers(ids, range(51, PAIR_WIDE))).assertTrue();
      expect(unique.length).assertEqual(PAIR_WIDE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3000
     * @tc.name      testFinalRegObjectMixed0001
     * @tc.desc      Register released pairs and released rings with object held values and check both shapes arrive in
     *               one ledger
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegObjectMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: BoxLedger = new BoxLedger();
      registerBoxPairs(ledger, TWO, 61);
      registerBoxRingAt(ledger, 6301, RING_TINY, 63, 'ring-mixed-63');
      registerBoxRingAt(ledger, 6401, RING_TINY, 64, 'ring-mixed-64');
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      const ids: number[] = ledger.sortedIds();
      logCase('testFinalRegObjectMixed0001', `rounds=${rounds} count=${ledger.count()} ids=${ids.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ids.length).assertEqual(4);
      expect(sameNumbers(ids, range(61, 4))).assertTrue();
      expect(ledger.labels().every((label: string) => label.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3100
     * @tc.name      testFinalRegObjectRetained0001
     * @tc.desc      Keep one object registered pair reachable and check extra rounds report only the two dropped
     *               records
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegObjectRetained0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: BoxLedger = new BoxLedger();
      const kept: CycleParent = linkPair(7101);
      const keptToken: TokenRecord = new TokenRecord(71, 'kept-record');
      ledger.registerPair(kept, keptToken, keptToken as object);
      registerBoxPairAt(ledger, 7102, 70, 'loose-record-70');
      registerBoxPairAt(ledger, 7103, 72, 'loose-record-72');
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const lateRounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, LATE_ROUNDS);
      logCase('testFinalRegObjectRetained0001', `rounds=${rounds} lateRounds=${lateRounds} ` +
        `count=${ledger.count()} linked=${pairIsLinked(kept)} labels=${ledger.labels().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(ledger.hasId(71)).assertFalse();
      expect(pairIsLinked(kept)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3200
     * @tc.name      testFinalRegObjectDuplicate0001
     * @tc.desc      Register two different pairs with the same held record and check the shared record is delivered
     *               twice
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegObjectDuplicate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: BoxLedger = new BoxLedger();
      const shared: TokenRecord = new TokenRecord(80, 'shared-record');
      registerBoxPairWithKeyAt(ledger, 8011, shared, shared as object);
      registerBoxPairWithKeyAt(ledger, 8012, shared, shared as object);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const ids: number[] = ledger.ids();
      logCase('testFinalRegObjectDuplicate0001', `rounds=${rounds} count=${ledger.count()} ` +
        `hits=${occurrences(ids, 80)} ids=${ids.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(occurrences(ids, 80)).assertEqual(TWO);
      expect(uniqueNumbers(ids).length).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3300
     * @tc.name      testFinalRegObjectNegative0001
     * @tc.desc      Use negative record ids and check the sorted ids keep signed numeric order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegObjectNegative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: BoxLedger = new BoxLedger();
      registerBoxPairAt(ledger, 3301, -1, 'negative-one');
      registerBoxPairAt(ledger, 3302, -2, 'negative-two');
      registerBoxPairAt(ledger, 3303, -3, 'negative-three');
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const ids: number[] = ledger.sortedIds();
      const expected: number[] = [-3, -2, -1];
      logCase('testFinalRegObjectNegative0001', `rounds=${rounds} count=${ledger.count()} ids=${ids.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(ids, expected)).assertTrue();
      expect(ascending(ids)).assertTrue();
      expect(ledger.hasId(-1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3400
     * @tc.name      testFinalRegObjectLarge0001
     * @tc.desc      Register ten released pairs with object held values and check the ten distinct ids are all
     *               reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegObjectLarge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: BoxLedger = new BoxLedger();
      registerBoxPairs(ledger, PAIR_TALL, 1000);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_TALL, COLLECT_ROUNDS);
      const ids: number[] = ledger.sortedIds();
      logCase('testFinalRegObjectLarge0001', `rounds=${rounds} count=${ledger.count()} ` +
        `ids=${ids.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ids.length).assertEqual(PAIR_TALL);
      expect(sameNumbers(ids, range(1000, PAIR_TALL))).assertTrue();
      expect(uniqueNumbers(ids).length).assertEqual(PAIR_TALL);
    });
    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3500
     * @tc.name      testFinalRegMultiDistinct0001
     * @tc.desc      Use two independent registries with different token ranges and check each ledger only sees its own
     *               tokens
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegMultiDistinct0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      registerNumberPairs(left, TWO, 3500);
      registerNumberPairs(right, TWO, 3600);
      const rounds: number = await collectUntil(() => left.count() >= TWO && right.count() >= TWO, COLLECT_ROUNDS);
      logCase('testFinalRegMultiDistinct0001', `rounds=${rounds} left=${left.sorted().join(',')} ` +
        `right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(left.sorted(), range(3500, TWO))).assertTrue();
      expect(sameNumbers(right.sorted(), range(3600, TWO))).assertTrue();
      expect(left.count() + right.count()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3600
     * @tc.name      testFinalRegMultiSameTarget0001
     * @tc.desc      Register the same released pair in two registries with different tokens and check both registries
     *               report it
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegMultiSameTarget0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      registerSharedTarget(left, right, 3601, 3602, 3603);
      const rounds: number = await collectUntil(() => left.count() >= ONE && right.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegMultiSameTarget0001', `rounds=${rounds} left=${left.sorted().join(',')} ` +
        `right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(left.has(3602)).assertTrue();
      expect(right.has(3603)).assertTrue();
      expect(left.count() + right.count()).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3700
     * @tc.name      testFinalRegMultiUnregisterScope0001
     * @tc.desc      Unregister a shared token in one registry only and check the other registry still reports the
     *               shared target while the local control token also arrives
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegMultiUnregisterScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      const sharedKey: TokenRecord = new TokenRecord(3701, 'shared');
      const controlKey: TokenRecord = new TokenRecord(3702, 'control');
      registerNumberPairKeyedAt(left, 3710, 3711, controlKey as object);
      registerSharedTargetKeyed(left, right, 3712, 3713, 3714, sharedKey as object);
      left.unregister(sharedKey as object);
      right.unregister(new TokenRecord(3799, 'never') as object);
      const rounds: number = await collectUntil(() => left.has(3711) && right.has(3714), COLLECT_ROUNDS);
      logCase('testFinalRegMultiUnregisterScope0001', `rounds=${rounds} left=${left.sorted().join(',')} ` +
        `right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(left.has(3711)).assertTrue();
      expect(left.has(3713)).assertFalse();
      expect(right.has(3714)).assertTrue();
      expect(left.count()).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3800
     * @tc.name      testFinalRegMultiLocalTokens0001
     * @tc.desc      Use the same numeric token values in two registries and check each registry reports its own copy
     *               so token matching stays registry local
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegMultiLocalTokens0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      registerNumberPairs(left, TWO, 3801);
      registerNumberPairs(right, TWO, 3801);
      const rounds: number = await collectUntil(() => left.count() >= TWO && right.count() >= TWO, COLLECT_ROUNDS);
      logCase('testFinalRegMultiLocalTokens0001', `rounds=${rounds} left=${left.sorted().join(',')} ` +
        `right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(left.sorted(), range(3801, TWO))).assertTrue();
      expect(sameNumbers(right.sorted(), range(3801, TWO))).assertTrue();
      expect(left.count() + right.count()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_3900
     * @tc.name      testFinalRegMultiSharedToken0001
     * @tc.desc      Use one token object in two registries, unregister it in both and check only the two control
     *               tokens are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegMultiSharedToken0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      const sharedKey: TokenRecord = new TokenRecord(3900, 'shared-scope');
      const controlLeft: TokenRecord = new TokenRecord(3901, 'control-left');
      const controlRight: TokenRecord = new TokenRecord(3902, 'control-right');
      registerNumberPairKeyedAt(left, 3910, 3911, controlLeft as object);
      registerNumberPairKeyedAt(right, 3912, 3913, controlRight as object);
      registerNumberPairKeyedAt(left, 3914, 3915, sharedKey as object);
      registerNumberPairKeyedAt(right, 3916, 3917, sharedKey as object);
      left.unregister(sharedKey as object);
      right.unregister(sharedKey as object);
      const rounds: number = await collectUntil(() => left.has(3911) && right.has(3913), COLLECT_ROUNDS);
      logCase('testFinalRegMultiSharedToken0001', `rounds=${rounds} left=${left.sorted().join(',')} ` +
        `right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(left.has(3911)).assertTrue();
      expect(right.has(3913)).assertTrue();
      expect(left.has(3915)).assertFalse();
      expect(right.has(3917)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4000
     * @tc.name      testFinalRegMultiCounts0001
     * @tc.desc      Register four pairs in one registry and two in another and check the counts stay independent
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegMultiCounts0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      registerNumberPairs(left, 4, 4000);
      registerNumberPairs(right, TWO, 4100);
      const rounds: number = await collectUntil(() => left.count() >= 4 && right.count() >= TWO, COLLECT_ROUNDS);
      logCase('testFinalRegMultiCounts0001', `rounds=${rounds} leftCount=${left.count()} ` +
        `rightCount=${right.count()} left=${left.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(left.count()).assertEqual(4);
      expect(right.count()).assertEqual(TWO);
      expect(sameNumbers(left.sorted(), range(4000, 4))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4100
     * @tc.name      testFinalRegMultiMixedTypes0001
     * @tc.desc      Use the same numeric value as a number token, a string token and a record id in three registries
     *               and check all three arrive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegMultiMixedTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const numbers: NumberLedger = new NumberLedger();
      const strings: StringLedger = new StringLedger();
      const boxes: BoxLedger = new BoxLedger();
      const sharedValue: number = 4101;
      const sharedText: string = '4101';
      registerNumberPairAt(numbers, 4110, sharedValue);
      registerStringPairAt(strings, 4111, sharedText);
      const boxToken: TokenRecord = registerBoxPairAt(boxes, 4112, sharedValue, 'box-4101');
      const rounds: number = await collectUntil(() => numbers.count() >= ONE && strings.count() >= ONE &&
        boxes.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegMultiMixedTypes0001', `rounds=${rounds} numbers=${numbers.sorted().join(',')} ` +
        `strings=${strings.sorted().join(',')} boxId=${boxToken.id}`);
      expect(rounds > 0).assertTrue();
      expect(numbers.has(sharedValue)).assertTrue();
      expect(strings.has(sharedText)).assertTrue();
      expect(boxes.hasId(sharedValue)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4200
     * @tc.name      testFinalRegMultiBag0001
     * @tc.desc      Keep three registries in a Map with one bucket each and check every bucket receives its own token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegMultiBag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bag: Map<number, FinalizationRegistry<number>> = new Map<number, FinalizationRegistry<number>>();
      const buckets: number[][] = [];
      for (let slot = 0; slot < PAIR_SMALL; slot++) {
        const bucket: number[] = [];
        buckets.push(bucket);
        bag.set(slot, new FinalizationRegistry<number>((token: number) => {
          bucket.push(token);
        }));
      }
      for (let slot = 0; slot < PAIR_SMALL; slot++) {
        const registry: FinalizationRegistry<number> = bag.get(slot) as FinalizationRegistry<number>;
        registerInto(registry, 4200 + slot, 4200 + slot);
      }
      const rounds: number = await collectUntil(() => buckets.every((bucket: number[]) => bucket.length >= ONE),
        COLLECT_ROUNDS);
      const total: number = buckets.reduce((sum: number, bucket: number[]) => sum + bucket.length, 0);
      logCase('testFinalRegMultiBag0001', `rounds=${rounds} bagSize=${bag.size} total=${total} ` +
        `buckets=${buckets.map((bucket: number[]) => bucket.join('|')).join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(bag.size).assertEqual(PAIR_SMALL);
      expect(buckets.every((bucket: number[]) => bucket.length === ONE)).assertTrue();
      expect(total).assertEqual(PAIR_SMALL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4300
     * @tc.name      testFinalRegMultiClassBag0001
     * @tc.desc      Drive two registry fields of one class instance with different token ranges and check the field
     *               counters stay separate
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegMultiClassBag0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const bag: RegistryBag = new RegistryBag();
      const expectedSecondary: number[] = [4303];
      bag.registerPrimary(4310, 4301);
      bag.registerPrimary(4311, 4302);
      bag.registerSecondary(4312, 4303);
      const rounds: number = await collectUntil(() => bag.primaryCount() >= TWO && bag.secondaryCount() >= ONE,
        COLLECT_ROUNDS);
      logCase('testFinalRegMultiClassBag0001', `rounds=${rounds} primary=${bag.primaryValues().join(',')} ` +
        `secondary=${bag.secondaryValues().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(bag.primaryCount()).assertEqual(TWO);
      expect(sameNumbers(bag.primaryValues(), range(4301, TWO))).assertTrue();
      expect(sameNumbers(bag.secondaryValues(), expectedSecondary)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4400
     * @tc.name      testFinalRegUnregisterHit0001
     * @tc.desc      Unregister with the exact token object used at registration and check the dropped token is never
     *               reported while the control token is
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testFinalRegUnregisterHit0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const keepKey: TokenRecord = new TokenRecord(4401, 'keep');
      const dropKey: TokenRecord = new TokenRecord(4402, 'drop');
      registerNumberPairKeyedAt(ledger, 4410, 4411, keepKey as object);
      registerNumberPairKeyedAt(ledger, 4412, 4413, dropKey as object);
      ledger.unregister(dropKey as object);
      const rounds: number = await collectUntil(() => ledger.has(4411), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterHit0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(4411)).assertTrue();
      expect(ledger.has(4413)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4500
     * @tc.name      testFinalRegUnregisterMiss0001
     * @tc.desc      Unregister a token before any registration, then register with it and check both unregisters
     *               leave the delivered token in place
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterMiss0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const lateKey: TokenRecord = new TokenRecord(4501, 'late');
      ledger.unregister(lateKey as object);
      registerNumberPairKeyedAt(ledger, 4510, 4511, lateKey as object);
      const rounds: number = await collectUntil(() => ledger.has(4511), COLLECT_ROUNDS);
      ledger.unregister(lateKey as object);
      logCase('testFinalRegUnregisterMiss0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(4511)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4600
     * @tc.name      testFinalRegUnregisterTwice0001
     * @tc.desc      Unregister the same token twice and check the victim stays silent while the control token still
     *               arrives
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterTwice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const victimKey: TokenRecord = new TokenRecord(4601, 'victim');
      const controlKey: TokenRecord = new TokenRecord(4602, 'control');
      registerNumberPairKeyedAt(ledger, 4610, 4611, victimKey as object);
      registerNumberPairKeyedAt(ledger, 4612, 4613, controlKey as object);
      ledger.unregister(victimKey as object);
      ledger.unregister(victimKey as object);
      const rounds: number = await collectUntil(() => ledger.has(4613), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterTwice0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(4611)).assertFalse();
      expect(ledger.has(4613)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4700
     * @tc.name      testFinalRegUnregisterEqual0001
     * @tc.desc      Unregister with a structurally equal but distinct token object and check matching is by identity so
     *               the victim is still reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterEqual0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const realKey: TokenRecord = new TokenRecord(4701, 'struct');
      const cloneKey: TokenRecord = new TokenRecord(4701, 'struct');
      const controlKey: TokenRecord = new TokenRecord(4702, 'control');
      registerNumberPairKeyedAt(ledger, 4710, 4711, realKey as object);
      registerNumberPairKeyedAt(ledger, 4712, 4713, controlKey as object);
      ledger.unregister(cloneKey as object);
      const rounds: number = await collectUntil(() => ledger.has(4711) && ledger.has(4713), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterEqual0001', `rounds=${rounds} realId=${realKey.id} ` +
        `cloneId=${cloneKey.id} tokens=${ledger.sorted().join(',')}`);
      expect(cloneKey.id).assertEqual(realKey.id);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(ledger.has(4711) && ledger.has(4713)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4800
     * @tc.name      testFinalRegUnregisterShared0001
     * @tc.desc      Register two different pairs with the same token, unregister once and check both entries are
     *               removed while the control is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterShared0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const sharedKey: TokenRecord = new TokenRecord(4800, 'shared-key');
      const controlKey: TokenRecord = new TokenRecord(4801, 'control-key');
      registerNumberPairKeyedAt(ledger, 4810, 4811, sharedKey as object);
      registerNumberPairKeyedAt(ledger, 4812, 4813, sharedKey as object);
      registerNumberPairKeyedAt(ledger, 4814, 4815, controlKey as object);
      ledger.unregister(sharedKey as object);
      const rounds: number = await collectUntil(() => ledger.has(4815), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterShared0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(4811)).assertFalse();
      expect(ledger.has(4813)).assertFalse();
      expect(ledger.has(4815)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_4900
     * @tc.name      testFinalRegUnregisterPartial0001
     * @tc.desc      Register one target with token A and two with token B, unregister B and check only the token A
     *               target and the control are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterPartial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const keptKey: TokenRecord = new TokenRecord(4900, 'kept-key');
      const droppedKey: TokenRecord = new TokenRecord(4901, 'dropped-key');
      const controlKey: TokenRecord = new TokenRecord(4902, 'control-key');
      registerNumberPairKeyedAt(ledger, 4910, 4911, keptKey as object);
      registerNumberPairKeyedAt(ledger, 4912, 4913, droppedKey as object);
      registerNumberPairKeyedAt(ledger, 4914, 4915, droppedKey as object);
      registerNumberPairKeyedAt(ledger, 4916, 4917, controlKey as object);
      ledger.unregister(droppedKey as object);
      const rounds: number = await collectUntil(() => ledger.has(4911) && ledger.has(4917), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterPartial0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(ledger.has(4911)).assertTrue();
      expect(ledger.has(4913)).assertFalse();
      expect(ledger.has(4915)).assertFalse();
      expect(ledger.has(4917)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5000
     * @tc.name      testFinalRegUnregisterControl0001
     * @tc.desc      Register one victim and one control, unregister the victim and check the ledger holds exactly the
     *               control token
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterControl0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const victimKey: TokenRecord = new TokenRecord(5000, 'victim-key');
      const controlKey: TokenRecord = new TokenRecord(5001, 'control-key');
      registerNumberPairKeyedAt(ledger, 5010, 5001, victimKey as object);
      registerNumberPairKeyedAt(ledger, 5011, 5002, controlKey as object);
      ledger.unregister(victimKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterControl0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(5001)).assertFalse();
      expect(ledger.has(5002)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5100
     * @tc.name      testFinalRegUnregisterReregister0001
     * @tc.desc      Unregister a target and register the same target again with a new token and key and check only the
     *               new token is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterReregister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(5100, 'first-key');
      const secondKey: TokenRecord = new TokenRecord(5101, 'second-key');
      registerPairTwiceAroundUnregister(ledger, 5110, 5111, 5112, firstKey as object, secondKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterReregister0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(5112)).assertTrue();
      expect(ledger.has(5111)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5200
     * @tc.name      testFinalRegUnregisterHeldValue0001
     * @tc.desc      Pass the held record itself to unregister on an entry registered without a token and check the
     *               call reports false and the record still arrives
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterHeldValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: BoxLedger = new BoxLedger();
      const held: TokenRecord = registerBoxPairPlain(ledger, 5201, 5201, 'held-only');
      ledger.unregister(held as object);
      const rounds: number = await collectUntil(() => ledger.hasId(5201), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterHeldValue0001', `rounds=${rounds} ` +
        `count=${ledger.count()} ids=${ledger.sortedIds().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.hasId(5201)).assertTrue();
      expect(ledger.find(5201) === held).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5300
     * @tc.name      testFinalRegUnregisterNoKey0001
     * @tc.desc      Unregister a fresh object against an entry registered with no token and check the entry is
     *               untouched and still reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterNoKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const freshKey: TokenRecord = new TokenRecord(5399, 'never-used');
      registerNumberPairAt(ledger, 5301, 5301);
      ledger.unregister(freshKey as object);
      const rounds: number = await collectUntil(() => ledger.has(5301), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterNoKey0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(5301)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5400
     * @tc.name      testFinalRegUnregisterSelfKey0001
     * @tc.desc      Register a pair using itself as the unregister token, unregister with another object and check the
     *               entry survives and is reported once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterSelfKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerPairWithSelfKey(ledger, 5401, 5401);
      ledger.unregister(new TokenRecord(5402, 'other') as object);
      const rounds: number = await collectUntil(() => ledger.has(5401), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterSelfKey0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(5401)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5500
     * @tc.name      testFinalRegUnregisterAfterCollect0001
     * @tc.desc      Wait for a callback, then unregister with the same token and check the registry reports nothing
     *               removed because the entry is already gone
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegUnregisterAfterCollect0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const key: TokenRecord = new TokenRecord(5500, 'consumed');
      registerNumberPairKeyedAt(ledger, 5510, 5501, key as object);
      const rounds: number = await collectUntil(() => ledger.has(5501), COLLECT_ROUNDS);
      ledger.unregister(key as object);
      logCase('testFinalRegUnregisterAfterCollect0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(5501)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5600
     * @tc.name      testFinalRegUnregisterTokenAlive0001
     * @tc.desc      Keep the token alive while the target is collected without unregistering and check the callback
     *               fires and the token object stays usable
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterTokenAlive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const key: TokenRecord = new TokenRecord(5600, 'alive-key');
      const controlKey: TokenRecord = new TokenRecord(5601, 'control-key');
      registerNumberPairKeyedAt(ledger, 5610, 5601, key as object);
      registerNumberPairKeyedAt(ledger, 5611, 5602, controlKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      ledger.unregister(key as object);
      logCase('testFinalRegUnregisterTokenAlive0001', `rounds=${rounds} keyId=${key.id} ` +
        `count=${ledger.count()}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(ledger.has(5601) && ledger.has(5602)).assertTrue();
      expect(key.id).assertEqual(5600);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5700
     * @tc.name      testFinalRegUnregisterMany0001
     * @tc.desc      Register six targets with their own tokens, unregister the even ones and check exactly the odd
     *               tokens are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterMany0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const keys: TokenRecord[] = [];
      const expected: number[] = [5701, 5703, 5705];
      for (let i = 0; i < RING_SMALL; i++) {
        const key: TokenRecord = new TokenRecord(5700 + i, 'many-' + i.toString());
        keys.push(key);
        registerNumberPairKeyedAt(ledger, 5710 + i, 5700 + i, key as object);
      }
      for (let i = 0; i < RING_SMALL; i += 2) {
        ledger.unregister(keys[i] as object);
      }
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterMany0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(5700)).assertFalse();
      expect(sameNumbers(ledger.sorted(), expected)).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5800
     * @tc.name      testFinalRegUnregisterAll0001
     * @tc.desc      Register five targets with their own tokens, unregister every one of them and check only the
     *               control token is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const keys: TokenRecord[] = [];
      for (let i = 0; i < PAIR_MID; i++) {
        const key: TokenRecord = new TokenRecord(5800 + i, 'all-' + i.toString());
        keys.push(key);
        registerNumberPairKeyedAt(ledger, 5810 + i, 5800 + i, key as object);
      }
      const controlKey: TokenRecord = new TokenRecord(5899, 'control');
      registerNumberPairKeyedAt(ledger, 5890, 5891, controlKey as object);
      keys.forEach((key: TokenRecord) => {
        ledger.unregister(key as object);
      });
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterAll0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(5800)).assertFalse();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(5891)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_5900
     * @tc.name      testFinalRegUnregisterMap0001
     * @tc.desc      Keep tokens in a Map, unregister two of them by map lookup and check exactly the three untouched
     *               tokens are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const keys: Map<number, TokenRecord> = new Map<number, TokenRecord>();
      const expected: number[] = [5900, 5902, 5904];
      for (let i = 0; i < PAIR_MID; i++) {
        const key: TokenRecord = new TokenRecord(5900 + i, 'map-' + i.toString());
        keys.set(i, key);
        registerNumberPairKeyedAt(ledger, 5910 + i, 5900 + i, key as object);
      }
      ledger.unregister(keys.get(1) as TokenRecord);
      ledger.unregister(keys.get(3) as TokenRecord);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterMap0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
      expect(sameNumbers(ledger.sorted(), expected)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6000
     * @tc.name      testFinalRegUnregisterReturn0001
     * @tc.desc      Check the four unregister outcomes through the reported tokens: used token, repeated token, fresh
     *               token and a token that belongs to another registry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegUnregisterReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const other: NumberLedger = new NumberLedger();
      const usedKey: TokenRecord = new TokenRecord(6001, 'used');
      const freshKey: TokenRecord = new TokenRecord(6002, 'fresh');
      const otherKey: TokenRecord = new TokenRecord(6003, 'other');
      registerNumberPairKeyedAt(ledger, 6010, 6011, usedKey as object);
      registerNumberPairKeyedAt(other, 6014, 6015, otherKey as object);
      ledger.unregister(usedKey as object);
      ledger.unregister(usedKey as object);
      ledger.unregister(freshKey as object);
      other.unregister(usedKey as object);
      registerNumberPairKeyedAt(ledger, 6012, 6013, freshKey as object);
      const rounds: number = await collectUntil(() => ledger.has(6013) && other.has(6015), COLLECT_ROUNDS);
      logCase('testFinalRegUnregisterReturn0001', `rounds=${rounds} usedReported=${ledger.has(6011)} ` +
        `freshReported=${ledger.has(6013)} otherReported=${other.has(6015)}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(6011)).assertFalse();
      expect(ledger.has(6013)).assertTrue();
      expect(other.has(6015)).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
    });
    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6100
     * @tc.name      testFinalRegInterleaveBasic0001
     * @tc.desc      Register, unregister and register the same target with the same token again and check exactly one
     *               callback is delivered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegInterleaveBasic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const key: TokenRecord = new TokenRecord(6101, 'cycle');
      registerUnregisterRegister(ledger, 6110, 6111, key as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveBasic0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6111)).assertTrue();
      expect(occurrences(ledger.values(), 6111)).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6200
     * @tc.name      testFinalRegInterleaveRekey0001
     * @tc.desc      Unregister before the target dies, re-register the target under a second key and check the old key
     *               no longer matches while the new entry is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveRekey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(6201, 'first-key');
      const secondKey: TokenRecord = new TokenRecord(6202, 'second-key');
      rekeyTarget(ledger, 6210, 6211, firstKey as object, secondKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveRekey0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6211)).assertTrue();
      expect(occurrences(ledger.values(), 6211)).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6300
     * @tc.name      testFinalRegInterleaveSharedRestore0001
     * @tc.desc      Unregister a shared token that covered two targets and register a third target with the same token
     *               value and check only the third callback arrives
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveSharedRestore0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const sharedKey: TokenRecord = new TokenRecord(6301, 'shared');
      const freshKey: TokenRecord = new TokenRecord(6302, 'fresh');
      registerNumberPairKeyedAt(ledger, 6310, 6311, sharedKey as object);
      registerNumberPairKeyedAt(ledger, 6312, 6313, sharedKey as object);
      ledger.unregister(sharedKey as object);
      registerNumberPairKeyedAt(ledger, 6314, 6311, freshKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveSharedRestore0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6311)).assertTrue();
      expect(ledger.has(6313)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6400
     * @tc.name      testFinalRegInterleaveAcrossRegistries0001
     * @tc.desc      Register in one registry, unregister there and register the same token in a second registry and
     *               check only the second registry reports
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveAcrossRegistries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      const key: TokenRecord = new TokenRecord(6401, 'moved');
      const controlKey: TokenRecord = new TokenRecord(6402, 'control');
      registerNumberPairKeyedAt(left, 6410, 6411, key as object);
      left.unregister(key as object);
      registerNumberPairKeyedAt(right, 6412, 6413, key as object);
      registerNumberPairKeyedAt(left, 6414, 6415, controlKey as object);
      const rounds: number = await collectUntil(() => right.has(6413) && left.has(6415), COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveAcrossRegistries0001', `rounds=${rounds} ` +
        `left=${left.sorted().join(',')} right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(left.has(6411)).assertFalse();
      expect(right.has(6413)).assertTrue();
      expect(left.has(6415)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6500
     * @tc.name      testFinalRegInterleaveChurn0001
     * @tc.desc      Churn one target through six register and unregister rounds and check only the later registration
     *               is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveChurn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const churnKey: TokenRecord = new TokenRecord(6501, 'churn');
      const freshKey: TokenRecord = new TokenRecord(6502, 'fresh');
      churnRegisterUnregister(ledger, 6510, 6511, churnKey as object, RING_SMALL);
      registerNumberPairKeyedAt(ledger, 6512, 6513, freshKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveChurn0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6511)).assertFalse();
      expect(ledger.has(6513)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6600
     * @tc.name      testFinalRegInterleaveBatches0001
     * @tc.desc      Run four batches of register, unregister and register and check exactly the four kept tokens are
     *               reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveBatches0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const expected: number[] = [6601, 6603, 6605, 6607];
      for (let round = 0; round < 4; round++) {
        const base: number = 6600 + round * 2;
        const dropKey: TokenRecord = new TokenRecord(base + 100, 'drop-' + round.toString());
        registerNumberPairKeyedAt(ledger, base, base, dropKey as object);
        ledger.unregister(dropKey as object);
        registerNumberPairAt(ledger, base + 1, base + 1);
      }
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveBatches0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(4);
      expect(sameNumbers(ledger.sorted(), expected)).assertTrue();
      expect(ledger.has(6602)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6700
     * @tc.name      testFinalRegInterleaveBeforeRegister0001
     * @tc.desc      Unregister a token twice around a registration and check the entry created in between is removed
     *               and only the later token is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveBeforeRegister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const key: TokenRecord = new TokenRecord(6701, 'pump');
      pumpToken(ledger, 6710, 6711, 6712, key as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveBeforeRegister0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6712)).assertTrue();
      expect(ledger.has(6711)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6800
     * @tc.name      testFinalRegInterleaveOrderMatters0001
     * @tc.desc      Compare a register then unregister target with an unregister then register target and check the
     *               order decides which token is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveOrderMatters0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(6801, 'first-key');
      const secondKey: TokenRecord = new TokenRecord(6802, 'second-key');
      registerNumberPairKeyedAt(ledger, 6810, 6811, firstKey as object);
      ledger.unregister(firstKey as object);
      ledger.unregister(secondKey as object);
      registerNumberPairKeyedAt(ledger, 6812, 6813, secondKey as object);
      const rounds: number = await collectUntil(() => ledger.has(6813), COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveOrderMatters0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6813)).assertTrue();
      expect(ledger.has(6811)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_6900
     * @tc.name      testFinalRegInterleaveThreeToken0001
     * @tc.desc      Register three targets, unregister the second then the first and check only the third token is
     *               reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveThreeToken0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(6901, 'first');
      const secondKey: TokenRecord = new TokenRecord(6902, 'second');
      const thirdKey: TokenRecord = new TokenRecord(6903, 'third');
      registerNumberPairKeyedAt(ledger, 6910, 6911, firstKey as object);
      registerNumberPairKeyedAt(ledger, 6911, 6912, secondKey as object);
      registerNumberPairKeyedAt(ledger, 6912, 6913, thirdKey as object);
      ledger.unregister(secondKey as object);
      ledger.unregister(firstKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveThreeToken0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(6913)).assertTrue();
      expect(ledger.has(6911) || ledger.has(6912)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7000
     * @tc.name      testFinalRegInterleaveRepeatUnreg0001
     * @tc.desc      Unregister the same token three times in a row and check the victim stays silent while the
     *               control token is still delivered
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveRepeatUnreg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const key: TokenRecord = new TokenRecord(7001, 'repeat');
      const controlKey: TokenRecord = new TokenRecord(7002, 'control');
      registerNumberPairKeyedAt(ledger, 7010, 7011, key as object);
      for (let i = 0; i < PAIR_SMALL; i++) {
        ledger.unregister(key as object);
      }
      registerNumberPairKeyedAt(ledger, 7012, 7013, controlKey as object);
      ledger.unregister(key as object);
      const rounds: number = await collectUntil(() => ledger.has(7013), COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveRepeatUnreg0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(7013)).assertTrue();
      expect(ledger.has(7011)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7100
     * @tc.name      testFinalRegInterleaveMixedTypes0001
     * @tc.desc      Run the same register and unregister interleaving on a numeric ledger and a string ledger and
     *               check both report only the entry registered last
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegInterleaveMixedTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const numbers: NumberLedger = new NumberLedger();
      const strings: StringLedger = new StringLedger();
      const numberKey: TokenRecord = new TokenRecord(7101, 'number-key');
      const stringKey: TokenRecord = new TokenRecord(7102, 'string-key');
      const stringVictim: string = 'string-victim';
      const stringKept: string = 'string-kept';
      registerNumberPairKeyedAt(numbers, 7110, 7111, numberKey as object);
      numbers.unregister(numberKey as object);
      registerNumberPairKeyedAt(numbers, 7112, 7113, numberKey as object);
      registerStringPairKeyedAt(strings, 7120, stringVictim, stringKey as object);
      strings.unregister(stringKey as object);
      registerStringPairKeyedAt(strings, 7121, stringKept, stringKey as object);
      const rounds: number = await collectUntil(() => numbers.has(7113) && strings.has(stringKept), COLLECT_ROUNDS);
      logCase('testFinalRegInterleaveMixedTypes0001', `rounds=${rounds} ` +
        `numbers=${numbers.sorted().join(',')} strings=${strings.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(numbers.has(7113)).assertTrue();
      expect(strings.has(stringKept)).assertTrue();
      expect(numbers.has(7111)).assertFalse();
      expect(strings.has(stringVictim)).assertFalse();
      expect(numbers.count() + strings.count()).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7200
     * @tc.name      testFinalRegOrderAscending0001
     * @tc.desc      Register twenty tokens in ascending order and check the ledger sorted view matches the
     *               registration range
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegOrderAscending0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairs(ledger, RING_WIDE, 7200);
      const rounds: number = await collectUntil(() => ledger.count() >= RING_WIDE, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegOrderAscending0001', `rounds=${rounds} count=${ledger.count()} ` +
        `observed=${ledger.values().join(',')} sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(RING_WIDE);
      expect(sameNumbers(tokens, range(7200, RING_WIDE))).assertTrue();
      expect(ascending(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7300
     * @tc.name      testFinalRegOrderDescending0001
     * @tc.desc      Register six tokens in descending order and check the sorted view is still ascending with the same
     *               token set
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegOrderDescending0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      for (let i = PAIR_MID; i >= 0; i--) {
        registerNumberPairAt(ledger, 7310 + i, 7300 + i);
      }
      const rounds: number = await collectUntil(() => ledger.count() >= RING_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegOrderDescending0001', `rounds=${rounds} count=${ledger.count()} ` +
        `observed=${ledger.values().join(',')} sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tokens, range(7300, RING_SMALL))).assertTrue();
      expect(ascending(tokens)).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(RING_SMALL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7400
     * @tc.name      testFinalRegOrderStepped0001
     * @tc.desc      Register six tokens in a stepped order and check the sorted view covers the full range without
     *               gaps
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderStepped0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const order: number[] = [0, 3, 1, 4, 2, 5];
      order.forEach((index: number) => {
        registerNumberPairAt(ledger, 7410 + index, 7400 + index);
      });
      const rounds: number = await collectUntil(() => ledger.count() >= RING_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegOrderStepped0001', `rounds=${rounds} order=${order.join(',')} ` +
        `sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tokens, range(7400, RING_SMALL))).assertTrue();
      expect(ascending(tokens)).assertTrue();
      expect(tokens.length).assertEqual(order.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7500
     * @tc.name      testFinalRegOrderBatches0001
     * @tc.desc      Register odd tokens first and even tokens second and check the sorted ledger holds the whole range
     *               in order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderBatches0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const oddTokens: number[] = [7501, 7503, 7505];
      const evenTokens: number[] = [7500, 7502, 7504];
      oddTokens.forEach((token: number) => {
        registerNumberPairAt(ledger, 7510 + token - 7500, token);
      });
      evenTokens.forEach((token: number) => {
        registerNumberPairAt(ledger, 7520 + token - 7500, token);
      });
      const rounds: number = await collectUntil(() => ledger.count() >= RING_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegOrderBatches0001', `rounds=${rounds} count=${ledger.count()} ` +
        `sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tokens, range(7500, RING_SMALL))).assertTrue();
      expect(ascending(tokens)).assertTrue();
      expect(ledger.count()).assertEqual(RING_SMALL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7600
     * @tc.name      testFinalRegOrderStrings0001
     * @tc.desc      Register four string tokens out of order and check the sorted view lists them alphabetically
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderStrings0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      const tokenA: string = 'order-a';
      const tokenB: string = 'order-b';
      const tokenC: string = 'order-c';
      const tokenD: string = 'order-d';
      const expected: string[] = [tokenA, tokenB, tokenC, tokenD];
      registerStringPairAt(ledger, 7610, tokenD);
      registerStringPairAt(ledger, 7611, tokenB);
      registerStringPairAt(ledger, 7612, tokenA);
      registerStringPairAt(ledger, 7613, tokenC);
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      const tokens: string[] = ledger.sorted();
      logCase('testFinalRegOrderStrings0001', `rounds=${rounds} observed=${ledger.values().join(',')} ` +
        `sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameStrings(tokens, expected)).assertTrue();
      expect(ascendingStrings(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7700
     * @tc.name      testFinalRegOrderNegative0001
     * @tc.desc      Register negative and positive numeric tokens mixed and check the sorted view keeps signed order
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderNegative0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const order: number[] = [2, -1, 0, -3, 1, -2];
      const expected: number[] = [-3, -2, -1, 0, 1, 2];
      order.forEach((token: number) => {
        registerNumberPairAt(ledger, 7710 + token, token);
      });
      const rounds: number = await collectUntil(() => ledger.count() >= RING_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegOrderNegative0001', `rounds=${rounds} order=${order.join(',')} ` +
        `sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tokens, expected)).assertTrue();
      expect(ascending(tokens)).assertTrue();
      expect(ledger.has(0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7800
     * @tc.name      testFinalRegOrderDuplicates0001
     * @tc.desc      Register three targets with one repeated token and check the sorted view keeps all three copies
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderDuplicates0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairAt(ledger, 7810, 7800);
      registerNumberPairAt(ledger, 7811, 7800);
      registerNumberPairAt(ledger, 7812, 7800);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      const expected: number[] = [7800, 7800, 7800];
      logCase('testFinalRegOrderDuplicates0001', `rounds=${rounds} count=${ledger.count()} ` +
        `sorted=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tokens, expected)).assertTrue();
      expect(occurrences(tokens, 7800)).assertEqual(PAIR_SMALL);
      expect(uniqueNumbers(tokens).length).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_7900
     * @tc.name      testFinalRegOrderSingle0001
     * @tc.desc      Register exactly one released pair and check the ledger holds a single sorted token
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderSingle0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairAt(ledger, 7910, 7900);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      const onlyToken: number = tokens[0];
      logCase('testFinalRegOrderSingle0001', `rounds=${rounds} count=${ledger.count()} ` +
        `only=${onlyToken} sortedLength=${tokens.length}`);
      expect(rounds > 0).assertTrue();
      expect(tokens.length).assertEqual(ONE);
      expect(onlyToken).assertEqual(7900);
      expect(ascending(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8000
     * @tc.name      testFinalRegOrderWide0001
     * @tc.desc      Register twelve tokens and check the sorted view is the complete contiguous range
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderWide0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      for (let i = CYCLE_ROUNDS - 1; i >= 0; i--) {
        registerNumberPairAt(ledger, 8010 + i, 8000 + i);
      }
      const rounds: number = await collectUntil(() => ledger.count() >= CYCLE_ROUNDS, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegOrderWide0001', `rounds=${rounds} count=${ledger.count()} ` +
        `first=${tokens[0]} last=${tokens[tokens.length - 1]}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(tokens, range(8000, CYCLE_ROUNDS))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(CYCLE_ROUNDS);
      expect(ascending(tokens)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8100
     * @tc.name      testFinalRegOrderBoxIds0001
     * @tc.desc      Register object records with ids out of order and check the sorted id view is contiguous and
     *               ascending
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegOrderBoxIds0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: BoxLedger = new BoxLedger();
      registerBoxPairAt(ledger, 8110, 8102, 'id-8102');
      registerBoxPairAt(ledger, 8111, 8100, 'id-8100');
      registerBoxPairAt(ledger, 8112, 8101, 'id-8101');
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const ids: number[] = ledger.sortedIds();
      logCase('testFinalRegOrderBoxIds0001', `rounds=${rounds} count=${ledger.count()} ids=${ids.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(ids, range(8100, PAIR_SMALL))).assertTrue();
      expect(ascending(ids)).assertTrue();
    });
    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8200
     * @tc.name      testFinalRegSameTargetTwice0001
     * @tc.desc      Register one pair twice with two different tokens and check both entries report their own token
     *               exactly once
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegSameTargetTwice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerSameTargetTwice(ledger, 8210, 8201, 8202);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const values: number[] = ledger.values();
      logCase('testFinalRegSameTargetTwice0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(occurrences(values, 8201)).assertEqual(ONE);
      expect(occurrences(values, 8202)).assertEqual(ONE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8300
     * @tc.name      testFinalRegSameTargetSameKey0001
     * @tc.desc      Register one pair twice with the same token and key, unregister once and check both entries are
     *               removed so only the control is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameTargetSameKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const sharedKey: TokenRecord = new TokenRecord(8301, 'double-key');
      const controlKey: TokenRecord = new TokenRecord(8302, 'control');
      registerSameTargetSameKey(ledger, 8310, 8301, sharedKey as object);
      ledger.unregister(sharedKey as object);
      registerNumberPairKeyedAt(ledger, 8311, 8302, controlKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegSameTargetSameKey0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(8301)).assertFalse();
      expect(ledger.has(8302)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8400
     * @tc.name      testFinalRegSameTargetUnregOne0001
     * @tc.desc      Register one pair under two keys, unregister only the first key and check the second token is still
     *               reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameTargetUnregOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(8401, 'first-key');
      const secondKey: TokenRecord = new TokenRecord(8402, 'second-key');
      const tokens: number[] = [8401, 8402];
      const keys: object[] = [firstKey as object, secondKey as object];
      registerSameTargetKeyed(ledger, 8410, tokens, keys);
      ledger.unregister(firstKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegSameTargetUnregOne0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(8402)).assertTrue();
      expect(ledger.has(8401)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8500
     * @tc.name      testFinalRegSameTargetThree0001
     * @tc.desc      Register one pair three times and check the ledger reports three tokens once each
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameTargetThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerSameTargetMany(ledger, 8510, 8501, PAIR_SMALL);
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const values: number[] = ledger.values();
      logCase('testFinalRegSameTargetThree0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(ledger.sorted(), range(8501, PAIR_SMALL))).assertTrue();
      expect(occurrences(values, 8502)).assertEqual(ONE);
      expect(ledger.count()).assertEqual(PAIR_SMALL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8600
     * @tc.name      testFinalRegSameTargetRegistries0001
     * @tc.desc      Register one pair twice in the first registry and once in the second and check each registry counts
     *               its own entries
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameTargetRegistries0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const left: NumberLedger = new NumberLedger();
      const right: NumberLedger = new NumberLedger();
      registerTargetTwiceInOneAndOnceInOther(left, right, 8610, 8601, 8602, 8603);
      const rounds: number = await collectUntil(() => left.count() >= TWO && right.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegSameTargetRegistries0001', `rounds=${rounds} leftCount=${left.count()} ` +
        `rightCount=${right.count()} left=${left.sorted().join(',')} right=${right.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(left.count()).assertEqual(TWO);
      expect(right.count()).assertEqual(ONE);
      expect(sameNumbers(left.sorted(), range(8601, TWO))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8700
     * @tc.name      testFinalRegSameRingTwice0001
     * @tc.desc      Register one released ring twice with two tokens and check both tokens are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameRingTwice0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerSameRingTwice(ledger, 8710, RING_TINY, 8701, 8702);
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegSameRingTwice0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
      expect(sameNumbers(tokens, range(8701, TWO))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8800
     * @tc.name      testFinalRegSameTargetUnregAll0001
     * @tc.desc      Register one pair twice with two keys, unregister both keys and check neither token is reported
     *               while the control token is
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameTargetUnregAll0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(8801, 'first-key');
      const secondKey: TokenRecord = new TokenRecord(8802, 'second-key');
      const controlKey: TokenRecord = new TokenRecord(8803, 'control-key');
      const tokens: number[] = [8801, 8802];
      const keys: object[] = [firstKey as object, secondKey as object];
      registerSameTargetKeyed(ledger, 8810, tokens, keys);
      ledger.unregister(firstKey as object);
      ledger.unregister(secondKey as object);
      registerNumberPairKeyedAt(ledger, 8811, 8803, controlKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegSameTargetUnregAll0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(8803)).assertTrue();
      expect(ledger.has(8802)).assertFalse();
      expect(ledger.has(8801)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_8900
     * @tc.name      testFinalRegSameTargetPartial0001
     * @tc.desc      Register one pair three times with three keys, unregister two of them and check only the first
     *               token is reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegSameTargetPartial0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const firstKey: TokenRecord = new TokenRecord(8901, 'first-key');
      const secondKey: TokenRecord = new TokenRecord(8902, 'second-key');
      const thirdKey: TokenRecord = new TokenRecord(8903, 'third-key');
      const tokens: number[] = [8901, 8902, 8903];
      const keys: object[] = [firstKey as object, secondKey as object, thirdKey as object];
      registerSameTargetKeyed(ledger, 8910, tokens, keys);
      ledger.unregister(secondKey as object);
      ledger.unregister(thirdKey as object);
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegSameTargetPartial0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(8901)).assertTrue();
      expect(ledger.has(8903)).assertFalse();
      expect(ledger.has(8902)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9000
     * @tc.name      testFinalRegPressureHint0001
     * @tc.desc      Apply allocation pressure and hintGC right after four registrations and check all four callbacks
     *               still arrive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegPressureHint0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairs(ledger, 4, 9000);
      const sink: number = allocatePressure();
      hintGC();
      const rounds: number = await collectUntil(() => ledger.count() >= 4, COLLECT_ROUNDS);
      logCase('testFinalRegPressureHint0001', `sink=${sink} rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(sink > 0).assertTrue();
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(4);
      expect(sameNumbers(ledger.sorted(), range(9000, 4))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9100
     * @tc.name      testFinalRegPressureRing0001
     * @tc.desc      Apply allocation pressure and hintGC after three ring registrations and check each ring token is
     *               reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegPressureRing0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      registerNumberRings(ledger, PAIR_SMALL, RING_MID, 9100);
      allocatePressure();
      hintGC();
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      logCase('testFinalRegPressureRing0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
      expect(sameNumbers(ledger.sorted(), range(9100, PAIR_SMALL))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9200
     * @tc.name      testFinalRegPressureRepeat0001
     * @tc.desc      Repeat three rounds of register, allocatePressure, hintGC and check all six tokens arrive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegPressureRepeat0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      for (let round = 0; round < PAIR_SMALL; round++) {
        registerNumberPairs(ledger, TWO, 9200 + round * 2);
        allocatePressure();
        hintGC();
        await paceTurn();
      }
      const rounds: number = await collectUntil(() => ledger.count() >= RING_SMALL, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegPressureRepeat0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(RING_SMALL);
      expect(sameNumbers(tokens, range(9200, RING_SMALL))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(RING_SMALL);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9300
     * @tc.name      testFinalRegPressureUnregister0001
     * @tc.desc      Unregister a victim before applying pressure and hintGC and check only the control token is
     *               reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegPressureUnregister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const victimKey: TokenRecord = new TokenRecord(9301, 'victim-key');
      const controlKey: TokenRecord = new TokenRecord(9302, 'control-key');
      registerNumberPairKeyedAt(ledger, 9310, 9301, victimKey as object);
      registerNumberPairKeyedAt(ledger, 9311, 9302, controlKey as object);
      ledger.unregister(victimKey as object);
      allocatePressure();
      hintGC();
      const rounds: number = await collectUntil(() => ledger.count() >= ONE, COLLECT_ROUNDS);
      logCase('testFinalRegPressureUnregister0001', `rounds=${rounds} ` +
        `count=${ledger.count()} tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(ONE);
      expect(ledger.has(9301)).assertFalse();
      expect(ledger.has(9302)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9400
     * @tc.name      testFinalRegPressureHintOnly0001
     * @tc.desc      Call hintGC without extra pressure and check the GC counter never drops while both registered
     *               tokens arrive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegPressureHintOnly0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const before: GcSnapshot = new GcSnapshot();
      const ledger: NumberLedger = new NumberLedger();
      registerNumberPairs(ledger, TWO, 9400);
      hintGC();
      const rounds: number = await collectUntil(() => ledger.count() >= TWO, COLLECT_ROUNDS);
      const after: GcSnapshot = new GcSnapshot();
      logCase('testFinalRegPressureHintOnly0001', `rounds=${rounds} count=${ledger.count()} ` +
        `beforeCount=${before.count} afterCount=${after.count} gcNow=${gcStat(KEY_GC_COUNT)}`);
      expect(rounds > 0).assertTrue();
      expect(after.notBefore(before)).assertTrue();
      expect(gcStat(KEY_GC_COUNT) >= before.count).assertTrue();
      expect(ledger.count()).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9500
     * @tc.name      testFinalRegPressureString0001
     * @tc.desc      Apply pressure and hintGC on a string ledger and check the three string tokens are all reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegPressureString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: StringLedger = new StringLedger();
      registerStringPairs(ledger, PAIR_SMALL, 'pressure', 9500);
      allocatePressure();
      hintGC();
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const expected: string[] = expectedStringTokens('pressure', ZERO, PAIR_SMALL);
      logCase('testFinalRegPressureString0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_SMALL);
      expect(sameStrings(ledger.sorted(), expected)).assertTrue();
    });
    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9600
     * @tc.name      testFinalRegClassField0001
     * @tc.desc      Drive a registry stored as a class field with three released pairs and check the field keeps the
     *               token map and the callback results in step
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegClassField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const guard: PairGuard = new PairGuard();
      const tokens: TokenRecord[] = [];
      for (let i = 0; i < PAIR_SMALL; i++) {
        tokens.push(guard.guard(9610 + i, 9600 + i));
      }
      const rounds: number = await collectUntil(() => guard.count() >= PAIR_SMALL, COLLECT_ROUNDS);
      const found: TokenRecord | null = guard.find(9601);
      logCase('testFinalRegClassField0001', `rounds=${rounds} count=${guard.count()} ` +
        `ids=${guard.sortedIds().join(',')} tokenCount=${guard.tokenCount()}`);
      expect(rounds > 0).assertTrue();
      expect(guard.count()).assertEqual(PAIR_SMALL);
      expect(sameNumbers(guard.sortedIds(), range(9600, PAIR_SMALL))).assertTrue();
      expect(found === tokens[1]).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9700
     * @tc.name      testFinalRegClassReuse0001
     * @tc.desc      Reuse one class field registry for two batches and check the counter grows from two to four
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClassReuse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const guard: PairGuard = new PairGuard();
      guard.guard(9710, 9700);
      guard.guard(9711, 9701);
      const firstRounds: number = await collectUntil(() => guard.count() >= TWO, COLLECT_ROUNDS);
      guard.guard(9712, 9702);
      guard.guard(9713, 9703);
      const secondRounds: number = await collectUntil(() => guard.count() >= 4, COLLECT_ROUNDS);
      logCase('testFinalRegClassReuse0001', `firstRounds=${firstRounds} secondRounds=${secondRounds} ` +
        `count=${guard.count()} ids=${guard.sortedIds().join(',')}`);
      expect(firstRounds > 0 && secondRounds > 0).assertTrue();
      expect(guard.count()).assertEqual(4);
      expect(sameNumbers(guard.sortedIds(), range(9700, 4))).assertTrue();
      expect(guard.tokenCount()).assertEqual(4);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9800
     * @tc.name      testFinalRegClassStatic0001
     * @tc.desc      Drive a registry stored in a static class field and check the static counter and reset behavior
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClassStatic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      StaticRegistryHolder.reset();
      StaticRegistryHolder.registerPair(9810, 9800);
      StaticRegistryHolder.registerPair(9811, 9801);
      const rounds: number = await collectUntil(() => StaticRegistryHolder.count() >= TWO, COLLECT_ROUNDS);
      const values: number[] = StaticRegistryHolder.values();
      logCase('testFinalRegClassStatic0001', `rounds=${rounds} count=${StaticRegistryHolder.count()} ` +
        `values=${values.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(values.length).assertEqual(TWO);
      expect(sameNumbers(values, range(9800, TWO))).assertTrue();
      StaticRegistryHolder.reset();
      expect(StaticRegistryHolder.count()).assertEqual(ZERO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_9900
     * @tc.name      testFinalRegClosureCapture0001
     * @tc.desc      Build a registry over captured closure variables and check the captured counter and token array
     *               agree with the registration range
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClosureCapture0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const tokens: number[] = [];
      let hits: number = 0;
      const registry: FinalizationRegistry<number> = new FinalizationRegistry<number>((token: number) => {
        hits++;
        tokens.push(token);
      });
      for (let i = 0; i < PAIR_SMALL; i++) {
        registerInto(registry, 9910 + i, 9900 + i);
      }
      const rounds: number = await collectUntil(() => hits >= PAIR_SMALL, COLLECT_ROUNDS);
      const sorted: number[] = tokens.slice().sort((left: number, right: number) => left - right);
      logCase('testFinalRegClosureCapture0001', `rounds=${rounds} hits=${hits} ` +
        `tokens=${sorted.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(hits).assertEqual(PAIR_SMALL);
      expect(tokens.length).assertEqual(PAIR_SMALL);
      expect(sameNumbers(sorted, range(9900, PAIR_SMALL))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10000
     * @tc.name      testFinalRegClosureFactory0001
     * @tc.desc      Build a registry inside a factory built class over a captured array and check two string tokens
     *               are reported through the captured sink
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClosureFactory0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const probe: SinkProbe = makeSinkProbe();
      const firstToken: string = 'closure-a';
      const secondToken: string = 'closure-b';
      const expected: string[] = [firstToken, secondToken];
      registerIntoString(probe.registry, 10010, firstToken);
      registerIntoString(probe.registry, 10011, secondToken);
      const rounds: number = await collectUntil(() => probe.count() >= TWO, COLLECT_ROUNDS);
      const values: string[] = probe.values();
      logCase('testFinalRegClosureFactory0001', `rounds=${rounds} count=${probe.count()} ` +
        `values=${values.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(probe.count()).assertEqual(TWO);
      expect(sameStrings(values, expected)).assertTrue();
      expect(values[0]).assertEqual(firstToken);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10100
     * @tc.name      testFinalRegClassUnregister0001
     * @tc.desc      Use the class release helper to unregister one guarded pair and check the released id never
     *               arrives while the sibling id still does
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClassUnregister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const guard: PairGuard = new PairGuard();
      guard.guard(10110, 10100);
      guard.guard(10111, 10101);
      guard.release(10100);
      guard.release(10100);
      const rounds: number = await collectUntil(() => guard.count() >= ONE, COLLECT_ROUNDS);
      const ids: number[] = guard.sortedIds();
      const onlyId: number = ids[0];
      logCase('testFinalRegClassUnregister0001', `rounds=${rounds} ids=${ids.join(',')} ` +
        `tokenCount=${guard.tokenCount()}`);
      expect(rounds > 0).assertTrue();
      expect(guard.count()).assertEqual(ONE);
      expect(onlyId).assertEqual(10101);
      expect(guard.tokenCount()).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10200
     * @tc.name      testFinalRegClassTokenMap0001
     * @tc.desc      Ask the class to release an unknown id and check the token map stays intact while a known release
     *               still removes its entry
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClassTokenMap0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const guard: PairGuard = new PairGuard();
      guard.guard(10210, 10200);
      guard.guard(10211, 10201);
      guard.guard(10212, 10202);
      guard.release(9999);
      guard.release(10202);
      const rounds: number = await collectUntil(() => guard.count() >= TWO, COLLECT_ROUNDS);
      logCase('testFinalRegClassTokenMap0001', `rounds=${rounds} ` +
        `count=${guard.count()} tokenCount=${guard.tokenCount()}`);
      expect(rounds > 0).assertTrue();
      expect(guard.tokenCount()).assertEqual(PAIR_SMALL);
      expect(guard.count()).assertEqual(TWO);
      expect(sameNumbers(guard.sortedIds(), [10200, 10201])).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10300
     * @tc.name      testFinalRegClassLabels0001
     * @tc.desc      Ask the class field registry for the delivered labels of two guarded pairs and check the label text
     *               matches the guarded ids
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegClassLabels0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const guard: PairGuard = new PairGuard();
      const expected: string[] = ['guard-10300', 'guard-10301'];
      guard.guard(10310, 10300);
      guard.guard(10311, 10301);
      const rounds: number = await collectUntil(() => guard.count() >= TWO, COLLECT_ROUNDS);
      const labels: string[] = guard.labels();
      logCase('testFinalRegClassLabels0001', `rounds=${rounds} count=${guard.count()} ` +
        `labels=${labels.join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(guard.count()).assertEqual(TWO);
      expect(sameStrings(labels, expected)).assertTrue();
      expect(labels.length).assertEqual(TWO);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10400
     * @tc.name      testFinalRegLongSequence0001
     * @tc.desc      Run eight batches of two registrations and a collection and check all sixteen tokens arrive in one
     *               contiguous range
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFinalRegLongSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const ledger: NumberLedger = new NumberLedger();
      let completed: boolean = true;
      for (let batch = 0; batch < BATCH_ROUNDS; batch++) {
        registerNumberPairs(ledger, TWO, 10400 + batch * 2);
        const rounds: number = await collectUntil(() => ledger.count() >= (batch + 1) * TWO, COLLECT_ROUNDS);
        completed = completed && rounds > 0;
      }
      const tokens: number[] = ledger.sorted();
      const expectedCount: number = BATCH_ROUNDS * TWO;
      logCase('testFinalRegLongSequence0001', `completed=${completed} count=${ledger.count()} ` +
        `expectedCount=${expectedCount} first=${tokens[0]} last=${tokens[tokens.length - 1]}`);
      expect(completed).assertTrue();
      expect(ledger.count()).assertEqual(expectedCount);
      expect(sameNumbers(tokens, range(10400, expectedCount))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(expectedCount);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10500
     * @tc.name      testFinalRegLongRings0001
     * @tc.desc      Run six batches of two ring registrations and a collection and check all twelve tokens arrive
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegLongRings0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      for (let batch = 0; batch < RING_SMALL; batch++) {
        registerNumberRings(ledger, TWO, 4, 10500 + batch * 2);
        await collectUntil(() => ledger.count() >= (batch + 1) * TWO, COLLECT_ROUNDS);
      }
      const rounds: number = await collectUntil(() => ledger.count() >= CYCLE_ROUNDS, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegLongRings0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(ledger.count()).assertEqual(CYCLE_ROUNDS);
      expect(sameNumbers(tokens, range(10500, CYCLE_ROUNDS))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(CYCLE_ROUNDS);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10600
     * @tc.name      testFinalRegLongUnregister0001
     * @tc.desc      Register ten targets with their own tokens, unregister every even one and check exactly the five
     *               odd tokens are reported
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegLongUnregister0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      const keys: TokenRecord[] = [];
      const expected: number[] = [10601, 10603, 10605, 10607, 10609];
      for (let i = 0; i < PAIR_TALL; i++) {
        const key: TokenRecord = new TokenRecord(10600 + i, 'long-' + i.toString());
        keys.push(key);
        registerNumberPairKeyedAt(ledger, 10610 + i, 10600 + i, key as object);
      }
      for (let i = 0; i < PAIR_TALL; i += 2) {
        ledger.unregister(keys[i] as object);
      }
      const rounds: number = await collectUntil(() => ledger.count() >= PAIR_MID, COLLECT_ROUNDS);
      logCase('testFinalRegLongUnregister0001', `rounds=${rounds} ` +
        `tokens=${ledger.sorted().join(',')}`);
      expect(rounds > 0).assertTrue();
      expect(ledger.has(10600)).assertFalse();
      expect(sameNumbers(ledger.sorted(), expected)).assertTrue();
      expect(ledger.count()).assertEqual(PAIR_MID);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10700
     * @tc.name      testFinalRegLongMixed0001
     * @tc.desc      Register a numeric, a string and an object token per round for six rounds and check all three
     *               ledgers end with six records
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegLongMixed0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const numbers: NumberLedger = new NumberLedger();
      const strings: StringLedger = new StringLedger();
      const boxes: BoxLedger = new BoxLedger();
      const roundsCount: number = RING_SMALL;
      for (let round = 0; round < roundsCount; round++) {
        registerNumberPairAt(numbers, 10710 + round, 10700 + round);
        registerStringPairAt(strings, 10720 + round, 'long-mix-' + round.toString());
        registerBoxPairAt(boxes, 10730 + round, 10740 + round, 'long-box-' + round.toString());
        await paceTurn();
      }
      const rounds: number = await collectUntil(() => numbers.count() >= roundsCount &&
        strings.count() >= roundsCount && boxes.count() >= roundsCount, COLLECT_ROUNDS);
      logCase('testFinalRegLongMixed0001', `rounds=${rounds} numbers=${numbers.count()} ` +
        `strings=${strings.count()} boxes=${boxes.count()}`);
      expect(rounds > 0).assertTrue();
      expect(sameNumbers(numbers.sorted(), range(10700, roundsCount))).assertTrue();
      expect(strings.count()).assertEqual(roundsCount);
      expect(boxes.count()).assertEqual(roundsCount);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_FINALREG_10800
     * @tc.name      testFinalRegLongReuse0001
     * @tc.desc      Register one pair per round for twelve rounds, collect every third round and check the final sorted
     *               token set is complete
     * @tc.size      MEDIUMTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFinalRegLongReuse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const ledger: NumberLedger = new NumberLedger();
      for (let round = 0; round < CYCLE_ROUNDS; round++) {
        registerNumberPairAt(ledger, 10810 + round, 10800 + round);
        if ((round + ONE) % PAIR_SMALL === 0) {
          await collectUntil(() => ledger.count() >= round + ONE, COLLECT_ROUNDS);
        }
      }
      const rounds: number = await collectUntil(() => ledger.count() >= CYCLE_ROUNDS, COLLECT_ROUNDS);
      const tokens: number[] = ledger.sorted();
      logCase('testFinalRegLongReuse0001', `rounds=${rounds} count=${ledger.count()} ` +
        `tokens=${tokens.join(',')}`);
      expect(ledger.count()).assertEqual(CYCLE_ROUNDS);
      expect(sameNumbers(tokens, range(10800, CYCLE_ROUNDS))).assertTrue();
      expect(uniqueNumbers(tokens).length).assertEqual(CYCLE_ROUNDS);
      expect(ascending(tokens)).assertTrue();
    });
  });
}
