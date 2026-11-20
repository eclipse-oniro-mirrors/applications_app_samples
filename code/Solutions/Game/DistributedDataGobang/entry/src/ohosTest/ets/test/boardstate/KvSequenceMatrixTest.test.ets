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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';

/**
 * One and two writes stay individual; the rest is one sweep plus three key hazards.
 */

// ---- inlined ProtocolCodec ----
/**
 * Wire format between the two devices.
 *
 * Device A publishes a full snapshot under key "deviceA"; Device B publishes a
 * single coordinate under key "deviceB"; "exit" asks Device B to leave. The two
 * directions use different shapes:
 *
 *   A -> B : { isOver, step, chessMapArr, chessX, chessY, clickCount, fallLocation }
 *   B -> A : { x, y }
 *
 * This module reproduces the exact field names so that a round-trip assertion
 * pins the contract the page relies on.
 */

export const KEY_DEVICE_A: string = 'deviceA';
export const KEY_DEVICE_B: string = 'deviceB';
export const KEY_EXIT: string = 'exit';
export const STORE_ID: string = 'game';
export const BUNDLE_NAME: string = 'ohos.samples.distributeddatagobang';
export const DEVICE_FLAG_A: string = 'A';
export const DEVICE_FLAG_B: string = 'B';
export const DEFAULT_SYNC_TIMEOUT: number = 1000;
export const SYNC_MODE_PUSH_PULL: number = 0;

/** A -> B snapshot payload. */
export interface DeviceAPayload {
  isOver: boolean;
  step: number;
  chessMapArr: string[][];
  chessX: number;
  chessY: number;
  clickCount: number;
  fallLocation: number[];
}

/** B -> A move payload. */
export interface DeviceBPayload {
  x: number;
  y: number;
}

/** Envelope used by the listener callback. */
export interface ChangeEntry {
  key: string;
  value: string;
}

/** Result of decoding an arbitrary string. */
export interface DecodeResult<T> {
  ok: boolean;
  value: T | null;
  reason: string;
}

export const REASON_NONE: string = '';
export const REASON_NOT_OBJECT: string = 'not-object';
export const REASON_MISSING_FIELD: string = 'missing-field';
export const REASON_BAD_TYPE: string = 'bad-type';
export const REASON_BAD_RANGE: string = 'bad-range';
export const REASON_PARSE_ERROR: string = 'parse-error';

function isPlainObject(value: Object): boolean {
  if (value === null || typeof value !== 'object') {
    return false;
  }
  return !Array.isArray(value);
}

function hasOwn(payload: Object, name: string): boolean {
  return Object.keys(payload).indexOf(name) >= 0;
}

/** Builds the payload Device A puts on the wire. */
export function encodeDeviceA(source: DeviceAPayload): string {
  let encoded: DeviceAPayload = {
    isOver: source.isOver,
    step: source.step,
    chessMapArr: source.chessMapArr,
    chessX: source.chessX,
    chessY: source.chessY,
    clickCount: source.clickCount,
    fallLocation: source.fallLocation
  };
  return JSON.stringify(encoded);
}

/** Builds the payload Device B puts on the wire. */
export function encodeDeviceB(x: number, y: number): string {
  let encoded: DeviceBPayload = { x: x, y: y };
  return JSON.stringify(encoded);
}

export function encodeExit(): string {
  return JSON.stringify(KEY_EXIT);
}

/**
 * Decodes a Device A payload. Every field is validated because a malformed
 * message must never mutate the local board; the page assumes the peer is
 * trustworthy, so the test suite pins what "trustworthy" means.
 */
export function decodeDeviceA(raw: string): DecodeResult<DeviceAPayload> {
  let value: Object | null = null;
  try {
    value = JSON.parse(raw) as Object;
  } catch (error) {
    return { ok: false, value: null, reason: REASON_PARSE_ERROR };
  }
  if (value === null || !isPlainObject(value)) {
    return { ok: false, value: null, reason: REASON_NOT_OBJECT };
  }
  let required: string[] = ['isOver', 'step', 'chessMapArr', 'chessX', 'chessY', 'clickCount', 'fallLocation'];
  for (let i = 0; i < required.length; i++) {
    if (!hasOwn(value, required[i])) {
      return { ok: false, value: null, reason: REASON_MISSING_FIELD + ':' + required[i] };
    }
  }
  let payload: DeviceAPayload = value as DeviceAPayload;
  if (typeof payload.isOver !== 'boolean') {
    return { ok: false, value: null, reason: REASON_BAD_TYPE + ':isOver' };
  }
  if (typeof payload.step !== 'number' || payload.step < 0) {
    return { ok: false, value: null, reason: REASON_BAD_TYPE + ':step' };
  }
  if (!Array.isArray(payload.chessMapArr)) {
    return { ok: false, value: null, reason: REASON_BAD_TYPE + ':chessMapArr' };
  }
  if (payload.chessX < -1 || payload.chessX > 14 || payload.chessY < -1 || payload.chessY > 14) {
    return { ok: false, value: null, reason: REASON_BAD_RANGE + ':cursor' };
  }
  return { ok: true, value: payload, reason: REASON_NONE };
}

/** Decodes a Device B move payload. */
export function decodeDeviceB(raw: string): DecodeResult<DeviceBPayload> {
  let value: Object | null = null;
  try {
    value = JSON.parse(raw) as Object;
  } catch (error) {
    return { ok: false, value: null, reason: REASON_PARSE_ERROR };
  }
  if (value === null || !isPlainObject(value)) {
    return { ok: false, value: null, reason: REASON_NOT_OBJECT };
  }
  if (!hasOwn(value, 'x') || !hasOwn(value, 'y')) {
    return { ok: false, value: null, reason: REASON_MISSING_FIELD + ':xy' };
  }
  let payload: DeviceBPayload = value as DeviceBPayload;
  if (typeof payload.x !== 'number' || typeof payload.y !== 'number') {
    return { ok: false, value: null, reason: REASON_BAD_TYPE + ':xy' };
  }
  if (payload.x < 0 || payload.x > 14 || payload.y < 0 || payload.y > 14) {
    return { ok: false, value: null, reason: REASON_BAD_RANGE + ':xy' };
  }
  return { ok: true, value: payload, reason: REASON_NONE };
}

/**
 * Listener body from KvStoreModel.setOnMessageReceivedListener: the change event
 * may carry insert entries or update entries, inserts win when both exist, and
 * only an exact key match triggers the callback.
 */
export function selectMatchingEntry(insertEntries: ChangeEntry[], updateEntries: ChangeEntry[],
  expectedKey: string): ChangeEntry | null {
  let entries: ChangeEntry[] = insertEntries.length > 0 ? insertEntries : updateEntries;
  for (let i = 0; i < entries.length; i++) {
    if (entries[i].key === expectedKey) {
      return entries[i];
    }
  }
  return null;
}

/** Same selection but returns every matching entry, for multi-key scenarios. */
export function selectAllMatching(entries: ChangeEntry[], expectedKey: string): ChangeEntry[] {
  let matched: ChangeEntry[] = [];
  for (let i = 0; i < entries.length; i++) {
    if (entries[i].key === expectedKey) {
      matched.push(entries[i]);
    }
  }
  return matched;
}

/** True when the key is one of the three keys the sample defines. */
export function isKnownKey(key: string): boolean {
  return key === KEY_DEVICE_A || key === KEY_DEVICE_B || key === KEY_EXIT;
}

/** Classifies a key so tests can assert routing without string comparisons. */
export function classifyKey(key: string): string {
  if (key === KEY_DEVICE_A) {
    return 'snapshot';
  }
  if (key === KEY_DEVICE_B) {
    return 'move';
  }
  if (key === KEY_EXIT) {
    return 'exit';
  }
  return 'unknown';
}

/** Which device consumes a key: B consumes deviceA, A consumes deviceB/exit. */
export function consumerOf(key: string): string {
  if (key === KEY_DEVICE_A) {
    return DEVICE_FLAG_B;
  }
  if (key === KEY_DEVICE_B || key === KEY_EXIT) {
    return DEVICE_FLAG_A;
  }
  return 'none';
}

/** Which device produces a key. */
export function producerOf(key: string): string {
  if (key === KEY_DEVICE_A || key === KEY_EXIT) {
    return DEVICE_FLAG_A;
  }
  if (key === KEY_DEVICE_B) {
    return DEVICE_FLAG_B;
  }
  return 'none';
}

/** Byte length of an encoded payload, useful for size-budget assertions. */
export function payloadBytes(raw: string): number {
  return raw.length;
}

/** Number of cells that differ between two snapshots. */
export function diffCells(left: string[][], right: string[][]): number {
  let diff: number = 0;
  let rows: number = Math.max(left.length, right.length);
  for (let i = 0; i < rows; i++) {
    let leftRow: string[] = i < left.length ? left[i] : [];
    let rightRow: string[] = i < right.length ? right[i] : [];
    let cols: number = Math.max(leftRow.length, rightRow.length);
    for (let j = 0; j < cols; j++) {
      let a: string = j < leftRow.length ? leftRow[j] : '';
      let b: string = j < rightRow.length ? rightRow[j] : '';
      if (a !== b) {
        diff++;
      }
    }
  }
  return diff;
}

/** Empty 15x15 snapshot used by protocol fixtures. */
export function emptyMap(): string[][] {
  let map: string[][] = [];
  for (let i = 0; i < 15; i++) {
    let row: string[] = [];
    for (let j = 0; j < 15; j++) {
      row[j] = '';
    }
    map[i] = row;
  }
  return map;
}

/** Builds a snapshot with the given moves applied in order. */
export function buildPayload(moves: number[][], colors: string[]): DeviceAPayload {
  let map: string[][] = emptyMap();
  let step: number = 0;
  let lastX: number = -1;
  let lastY: number = -1;
  for (let i = 0; i < moves.length; i++) {
    let x: number = moves[i][0];
    let y: number = moves[i][1];
    if (x < 0 || x > 14 || y < 0 || y > 14) {
      continue;
    }
    map[x][y] = colors[step % colors.length];
    lastX = x;
    lastY = y;
    step++;
  }
  return {
    isOver: false,
    step: step,
    chessMapArr: map,
    chessX: lastX,
    chessY: lastY,
    clickCount: step,
    fallLocation: [0, 0]
  };
}

// ---- inlined KvEngine ----
/**
 * KvEngine replicates the observable behaviour of Model/KvStoreModel.
 *
 * It records the store options that the model passes to getKVStore, the sync
 * targets that follow every put, and the entry-selection rule of the data-change
 * listener. These are the parts of the model a test can pin without a peer
 * device; the real service call is mocked out by a synchronous in-memory store.
 */


export const STORE_OPTIONS_CREATE_IF_MISSING: boolean = true;
export const STORE_OPTIONS_ENCRYPT: boolean = false;
export const STORE_OPTIONS_BACKUP: boolean = false;
export const STORE_OPTIONS_AUTO_SYNC: boolean = false;
export const STORE_OPTIONS_TYPE_SINGLE_VERSION: number = 0;
export const STORE_OPTIONS_SECURITY_S1: number = 1;
export const SYNC_TIMEOUT_MS: number = 1000;

/** Options block that createKvStore hands to the service. */
export interface StoreOptionsView {
  createIfMissing: boolean;
  encrypt: boolean;
  backup: boolean;
  autoSync: boolean;
  kvStoreType: number;
  securityLevel: number;
}

/** Result of a put attempt. */
export interface PutResult {
  ok: boolean;
  synced: boolean;
  targets: string[];
  reason: string;
}

/** Typed envelope for the synthetic change events used by the listener tests. */
export interface ChangeEnvelope {
  insertEntries: ChangeEntry[];
  updateEntries: ChangeEntry[];
}

/** A single stored mutation, kept so tests can assert ordering. */
export interface StoreMutation {
  key: string;
  value: string;
  sequence: number;
}

export function defaultOptions(): StoreOptionsView {
  return {
    createIfMissing: STORE_OPTIONS_CREATE_IF_MISSING,
    encrypt: STORE_OPTIONS_ENCRYPT,
    backup: STORE_OPTIONS_BACKUP,
    autoSync: STORE_OPTIONS_AUTO_SYNC,
    kvStoreType: STORE_OPTIONS_TYPE_SINGLE_VERSION,
    securityLevel: STORE_OPTIONS_SECURITY_S1
  };
}

export class KvEngine {
  store: Map<string, string> = new Map<string, string>();
  mutations: StoreMutation[] = [];
  created: boolean = false;
  createCount: number = 0;
  syncCount: number = 0;
  lastTargets: string[] = [];
  lastTimeout: number = SYNC_TIMEOUT_MS;
  lastMode: number = SYNC_MODE_PUSH_PULL;
  failNext: boolean = false;
  sequence: number = 0;

  reset(): void {
    this.store.clear();
    this.mutations = [];
    this.created = false;
    this.createCount = 0;
    this.syncCount = 0;
    this.lastTargets = [];
    this.lastTimeout = SYNC_TIMEOUT_MS;
    this.lastMode = SYNC_MODE_PUSH_PULL;
    this.failNext = false;
    this.sequence = 0;
  }

  /**
   * createKvStore: a second call short-circuits when the store already exists,
   * which the page depends on because aboutToAppear can run more than once.
   */
  create(): boolean {
    if (this.created) {
      return false;
    }
    this.created = true;
    this.createCount++;
    return true;
  }

  /** Effective options; mirrors the literal block in the model. */
  options(): StoreOptionsView {
    return defaultOptions();
  }

  isEmpty(): boolean {
    return this.store.size === 0;
  }

  size(): number {
    return this.store.size;
  }

  has(key: string): boolean {
    return this.store.has(key);
  }

  get(key: string): string {
    let value: string | undefined = this.store.get(key);
    if (value === undefined) {
      return '';
    }
    return value;
  }

  /** Direct write that never syncs; used to seed a peer-side store. */
  seed(key: string, value: string): void {
    this.store.set(key, value);
  }

  /**
   * put: stores the value, then (in the real model) queries the device manager
   * and pushes the change to every available network id. Targets are passed in so
   * the test controls the device discovery outcome.
   */
  put(key: string, value: string, targets: string[]): PutResult {
    if (this.failNext) {
      this.failNext = false;
      return { ok: false, synced: false, targets: [], reason: 'put-failed' };
    }
    if (!this.created) {
      return { ok: false, synced: false, targets: [], reason: 'store-missing' };
    }
    this.store.set(key, value);
    this.sequence++;
    this.mutations.push({ key: key, value: value, sequence: this.sequence });
    this.lastTargets = [];
    for (let i = 0; i < targets.length; i++) {
      this.lastTargets[i] = targets[i];
    }
    this.lastMode = SYNC_MODE_PUSH_PULL;
    this.lastTimeout = SYNC_TIMEOUT_MS;
    this.syncCount++;
    return { ok: true, synced: true, targets: targets, reason: '' };
  }

  /** put with an empty device list: the value is stored but no sync is issued. */
  putWithoutTargets(key: string, value: string): PutResult {
    if (!this.created) {
      return { ok: false, synced: false, targets: [], reason: 'store-missing' };
    }
    this.store.set(key, value);
    this.sequence++;
    this.mutations.push({ key: key, value: value, sequence: this.sequence });
    return { ok: true, synced: false, targets: [], reason: '' };
  }

  /** Number of writes to a specific key. */
  writeCount(key: string): number {
    let count: number = 0;
    for (let i = 0; i < this.mutations.length; i++) {
      if (this.mutations[i].key === key) {
        count++;
      }
    }
    return count;
  }

  keysInOrder(): string[] {
    let keys: string[] = [];
    for (let i = 0; i < this.mutations.length; i++) {
      keys.push(this.mutations[i].key);
    }
    return keys;
  }

  valuesInOrder(): string[] {
    let values: string[] = [];
    for (let i = 0; i < this.mutations.length; i++) {
      values.push(this.mutations[i].value);
    }
    return values;
  }

  /**
   * Listener dispatch: identical to setOnMessageReceivedListener. Returns the
   * matched value or null when the event does not concern the subscribed key.
   */
  dispatch(insertEntries: ChangeEntry[], updateEntries: ChangeEntry[], key: string): string | null {
    let matched: ChangeEntry | null = selectMatchingEntry(insertEntries, updateEntries, key);
    if (matched === null) {
      return null;
    }
    return matched.value;
  }

  /** Simulates a remote insert of one key. */
  remoteInsert(key: string, value: string): string {
    let entry: ChangeEntry = { key: key, value: value };
    let envelope: ChangeEnvelope = { insertEntries: [entry], updateEntries: [] };
    return JSON.stringify(envelope);
  }

  /** Simulates a remote update of one key. */
  remoteUpdate(key: string, value: string): string {
    let entry: ChangeEntry = { key: key, value: value };
    let envelope: ChangeEnvelope = { insertEntries: [], updateEntries: [entry] };
    return JSON.stringify(envelope);
  }

  /** A change event that concerns an unrelated key. */
  unrelatedEvent(key: string): string {
    let entry: ChangeEntry = { key: key, value: 'noise' };
    let envelope: ChangeEnvelope = { insertEntries: [entry], updateEntries: [] };
    return JSON.stringify(envelope);
  }
}

/** Builds the JSON blob the page writes for Device A. */
export function snapshotJson(isOver: boolean, step: number, x: number, y: number,
  clickCount: number, map: string[][], fallLocation: number[]): string {
  return JSON.stringify({
    isOver: isOver,
    step: step,
    chessMapArr: map,
    chessX: x,
    chessY: y,
    clickCount: clickCount,
    fallLocation: fallLocation
  });
}

/** True when the value looks like a Device B move payload. */
export function isMovePayload(value: string): boolean {
  try {
    let parsed: Object = JSON.parse(value) as Object;
    if (parsed === null || typeof parsed !== 'object') {
      return false;
    }
    let keys: string[] = Object.keys(parsed);
    return keys.indexOf('x') >= 0 && keys.indexOf('y') >= 0;
  } catch (error) {
    return false;
  }
}

/** True when the value looks like a Device A snapshot payload. */
export function isSnapshotPayload(value: string): boolean {
  try {
    let parsed: Object = JSON.parse(value) as Object;
    if (parsed === null || typeof parsed !== 'object') {
      return false;
    }
    let keys: string[] = Object.keys(parsed);
    return keys.indexOf('chessMapArr') >= 0 && keys.indexOf('step') >= 0;
  } catch (error) {
    return false;
  }
}

// ---- inlined MainThreadYield ----
/**
 * Long matrix suites run on the test main thread. Yielding between chunks keeps
 * the ability responsive so that component queries issued afterwards still see a
 * live window.
 */

export const DEFAULT_CHUNK: number = 200;

/** Resolves on the next macrotask, giving the UI thread a chance to breathe. */
export async function yieldToMainThread(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, 0);
  });
}

/** Runs a long loop in chunks, yielding after each chunk. */
export async function keepMainThreadResponsive<T>(items: T[], work: (item: T) => boolean,
  chunk: number = DEFAULT_CHUNK): Promise<number> {
  let completed: number = 0;
  for (let i = 0; i < items.length; i++) {
    if (work(items[i])) {
      completed++;
    }
    if (i > 0 && i % chunk === 0) {
      await yieldToMainThread();
    }
  }
  return completed;
}

export default function GobangKvSequenceMatrix() {
  describe('GobangKvSequenceMatrix', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_GOBANG_KVSEQ_0001
     * @tc.name testSmallSequence0001
     * @tc.desc 1 puts keep insertion order and one sync per write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSmallSequence0001', 0, async () => {
      let store: KvEngine = new KvEngine();
      store.create();
      for (let i = 0; i < 1; i++) {
        expect(store.put('key' + i, 'value' + i, ['net']).ok).assertTrue();
      }
      expect(store.size()).assertEqual(1);
      expect(store.syncCount).assertEqual(1);
      expect(store.keysInOrder()[0]).assertEqual('key0');
    });

    /**
     * @tc.number SUB_GOBANG_KVSEQ_0002
     * @tc.name testSmallSequence0002
     * @tc.desc 2 puts keep insertion order and one sync per write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSmallSequence0002', 0, async () => {
      let store: KvEngine = new KvEngine();
      store.create();
      for (let i = 0; i < 2; i++) {
        expect(store.put('key' + i, 'value' + i, ['net']).ok).assertTrue();
      }
      expect(store.size()).assertEqual(2);
      expect(store.syncCount).assertEqual(2);
      expect(store.keysInOrder()[0]).assertEqual('key0');
    });

    /**
     * @tc.number SUB_GOBANG_KVSEQ_0003
     * @tc.name testPutSweep0003
     * @tc.desc Sequences from three to forty keep order, size and sync count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testPutSweep0003', 0, async () => {
      let checked: number = 0;
      for (let count = 3; count <= 40; count++) {
        let store: KvEngine = new KvEngine();
        store.create();
        for (let i = 0; i < count; i++) {
          let result: PutResult = store.put('key' + i, 'value' + i, ['net' + i]);
          expect(result.ok).assertTrue();
          expect(result.targets[0]).assertEqual('net' + i);
        }
        expect(store.size()).assertEqual(count);
        expect(store.syncCount).assertEqual(count);
        expect(store.lastMode).assertEqual(SYNC_MODE_PUSH_PULL);
        expect(store.lastTimeout).assertEqual(SYNC_TIMEOUT_MS);
        expect(store.get('key' + (count - 1))).assertEqual('value' + (count - 1));
        checked++;
      }
      expect(checked).assertEqual(38);
    });

    /**
     * @tc.number SUB_GOBANG_KVSEQ_0004
     * @tc.name testThreeKeys0004
     * @tc.desc The three protocol keys coexist without clobbering each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testThreeKeys0004', 0, async () => {
      let store: KvEngine = new KvEngine();
      store.create();
      store.put(KEY_DEVICE_A, 'snap', ['n']);
      store.put(KEY_DEVICE_B, 'move', ['n']);
      store.put(KEY_EXIT, 'exit', ['n']);
      expect(store.size()).assertEqual(3);
      expect(store.writeCount(KEY_DEVICE_A)).assertEqual(1);
      expect(store.valuesInOrder()[2]).assertEqual('exit');
    });

    /**
     * @tc.number SUB_GOBANG_KVSEQ_0005
     * @tc.name testOverwriteCount0005
     * @tc.desc Three writes to one key keep the last value and count every write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testOverwriteCount0005', 0, async () => {
      let store: KvEngine = new KvEngine();
      store.create();
      store.put(KEY_DEVICE_A, 'one', []);
      store.put(KEY_DEVICE_A, 'two', []);
      store.put(KEY_DEVICE_A, 'three', []);
      expect(store.size()).assertEqual(1);
      expect(store.writeCount(KEY_DEVICE_A)).assertEqual(3);
      expect(store.get(KEY_DEVICE_A)).assertEqual('three');
    });

    /**
     * @tc.number SUB_GOBANG_KVSEQ_0006
     * @tc.name testFailurePaths0006
     * @tc.desc A write without a store and a forced failure both leave the map empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFailurePaths0006', 0, async () => {
      let store: KvEngine = new KvEngine();
      expect(store.put(KEY_DEVICE_A, 'x', []).reason).assertEqual('store-missing');
      store.create();
      store.failNext = true;
      expect(store.put(KEY_DEVICE_A, 'x', []).reason).assertEqual('put-failed');
      expect(store.get(KEY_DEVICE_A)).assertEqual('');
    });

  });
}
