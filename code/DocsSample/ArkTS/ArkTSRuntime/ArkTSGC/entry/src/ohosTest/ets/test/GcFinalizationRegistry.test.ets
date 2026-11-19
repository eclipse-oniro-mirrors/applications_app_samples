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
