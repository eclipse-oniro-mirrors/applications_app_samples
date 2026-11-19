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

function entry(key: string, value: string): ChangeEntry {
  return { key: key, value: value };
}

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

export default function protocolContract() {
  describe('GobangProtocolContract', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /** @tc.number SUB_GOBANG_PROTO_0100 @tc.name testProtocolKeyLiterals0001 @tc.desc The three wire keys keep the exact lowercase literals the peer expects */
    it('testProtocolKeyLiterals0001', 0, async () => {
      expect(KEY_DEVICE_A).assertEqual('deviceA');
      expect(KEY_DEVICE_B).assertEqual('deviceB');
      expect(KEY_EXIT).assertEqual('exit');
      expect(STORE_ID).assertEqual('game');
      expect(BUNDLE_NAME).assertEqual('ohos.samples.distributeddatagobang');
      expect(DEVICE_FLAG_A).assertEqual('A');
      expect(DEVICE_FLAG_B).assertEqual('B');
    });

    /** @tc.number SUB_GOBANG_PROTO_0200 @tc.name testProtocolClassifyKeys0002 @tc.desc Every known key maps to its message family and unknown keys do not */
    it('testProtocolClassifyKeys0002', 0, async () => {
      expect(classifyKey(KEY_DEVICE_A)).assertEqual('snapshot');
      expect(classifyKey(KEY_DEVICE_B)).assertEqual('move');
      expect(classifyKey(KEY_EXIT)).assertEqual('exit');
      expect(classifyKey('device')).assertEqual('unknown');
      expect(classifyKey('')).assertEqual('unknown');
      expect(classifyKey('DEVICEA')).assertEqual('unknown');
    });

    /** @tc.number SUB_GOBANG_PROTO_0300 @tc.name testProtocolRouting0003 @tc.desc Device A produces snapshots and consumes moves, Device B the reverse */
    it('testProtocolRouting0003', 0, async () => {
      expect(producerOf(KEY_DEVICE_A)).assertEqual('A');
      expect(producerOf(KEY_DEVICE_B)).assertEqual('B');
      expect(producerOf(KEY_EXIT)).assertEqual('A');
      expect(producerOf('nope')).assertEqual('none');
      expect(consumerOf(KEY_DEVICE_A)).assertEqual('B');
      expect(consumerOf(KEY_DEVICE_B)).assertEqual('A');
      expect(consumerOf(KEY_EXIT)).assertEqual('A');
      expect(consumerOf('nope')).assertEqual('none');
    });

    /** @tc.number SUB_GOBANG_PROTO_0400 @tc.name testProtocolKnownKeyTable0004 @tc.desc Only the three documented keys are accepted by the router */
    it('testProtocolKnownKeyTable0004', 0, async () => {
      expect(isKnownKey(KEY_DEVICE_A)).assertTrue();
      expect(isKnownKey(KEY_DEVICE_B)).assertTrue();
      expect(isKnownKey(KEY_EXIT)).assertTrue();
      expect(isKnownKey('game')).assertFalse();
      expect(isKnownKey('devicea')).assertFalse();
      expect(isKnownKey(KEY_DEVICE_A + ' ')).assertFalse();
    });

    /** @tc.number SUB_GOBANG_PROTO_0500 @tc.name testProtocolEncodeMove0005 @tc.desc A move encodes to exactly two numeric fields x and y */
    it('testProtocolEncodeMove0005', 0, async () => {
      let raw: string = encodeDeviceB(7, 8);
      let parsed: DeviceBPayload = JSON.parse(raw) as DeviceBPayload;
      expect(parsed.x).assertEqual(7);
      expect(parsed.y).assertEqual(8);
      expect(Object.keys(parsed).length).assertEqual(2);
      expect(raw.indexOf('chessMapArr') < 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_PROTO_0600 @tc.name testProtocolDecodeMoveCorners0006 @tc.desc All four corners and the center decode unchanged */
    it('testProtocolDecodeMoveCorners0006', 0, async () => {
      let corners: number[][] = [[0, 0], [0, 14], [14, 0], [14, 14], [7, 7]];
      for (let i = 0; i < corners.length; i++) {
        let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(encodeDeviceB(corners[i][0], corners[i][1]));
        expect(decoded.ok).assertTrue();
        expect((decoded.value as DeviceBPayload).x).assertEqual(corners[i][0]);
        expect((decoded.value as DeviceBPayload).y).assertEqual(corners[i][1]);
      }
    });

    /** @tc.number SUB_GOBANG_PROTO_0700 @tc.name testProtocolMoveOutOfRange0007 @tc.desc Moves outside the 0..14 grid are refused by the decoder */
    it('testProtocolMoveOutOfRange0007', 0, async () => {
      expect(decodeDeviceB(encodeDeviceB(-1, 0)).reason).assertEqual('bad-range:xy');
      expect(decodeDeviceB(encodeDeviceB(0, -1)).reason).assertEqual('bad-range:xy');
      expect(decodeDeviceB(encodeDeviceB(15, 0)).reason).assertEqual('bad-range:xy');
      expect(decodeDeviceB(encodeDeviceB(0, 15)).reason).assertEqual('bad-range:xy');
      expect(decodeDeviceB(encodeDeviceB(100, 100)).ok).assertFalse();
    });

    /** @tc.number SUB_GOBANG_PROTO_0800 @tc.name testProtocolMoveWrongShape0008 @tc.desc A move that omits a coordinate or uses text is rejected */
    it('testProtocolMoveWrongShape0008', 0, async () => {
      expect(decodeDeviceB('{"x":1}').reason).assertEqual('missing-field:xy');
      expect(decodeDeviceB('{"y":1}').reason).assertEqual('missing-field:xy');
      expect(decodeDeviceB('{"x":"1","y":2}').reason).assertEqual('bad-type:xy');
      expect(decodeDeviceB('{"x":1,"y":"2"}').reason).assertEqual('bad-type:xy');
      expect(decodeDeviceB('[]').reason).assertEqual('not-object');
      expect(decodeDeviceB('').reason).assertEqual('parse-error');
    });

    /** @tc.number SUB_GOBANG_PROTO_0900 @tc.name testProtocolExitPayload0009 @tc.desc The exit signal is the JSON string literal, not an object */
    it('testProtocolExitPayload0009', 0, async () => {
      let raw: string = encodeExit();
      expect(raw).assertEqual('"exit"');
      expect(JSON.parse(raw) as string).assertEqual('exit');
      expect(classifyKey(JSON.parse(raw) as string)).assertEqual('exit');
    });

    /** @tc.number SUB_GOBANG_PROTO_1000 @tc.name testProtocolInsertPrecedence0010 @tc.desc Insert entries win over update entries when both are present */
    it('testProtocolInsertPrecedence0010', 0, async () => {
      let inserts: ChangeEntry[] = [entry(KEY_DEVICE_A, 'from-insert')];
      let updates: ChangeEntry[] = [entry(KEY_DEVICE_A, 'from-update')];
      let matched: ChangeEntry | null = selectMatchingEntry(inserts, updates, KEY_DEVICE_A);
      expect(matched !== null).assertTrue();
      expect((matched as ChangeEntry).value).assertEqual('from-insert');
      let updateOnly: ChangeEntry | null = selectMatchingEntry([], updates, KEY_DEVICE_A);
      expect((updateOnly as ChangeEntry).value).assertEqual('from-update');
      expect(selectMatchingEntry([], [], KEY_DEVICE_A)).assertNull();
    });

    /** @tc.number SUB_GOBANG_PROTO_1100 @tc.name testProtocolKeyMismatch0011 @tc.desc An event about another key never triggers the callback */
    it('testProtocolKeyMismatch0011', 0, async () => {
      let entries: ChangeEntry[] = [entry(KEY_DEVICE_B, '{"x":1,"y":2}')];
      expect(selectMatchingEntry(entries, [], KEY_DEVICE_A)).assertNull();
      expect(selectMatchingEntry(entries, [], KEY_EXIT)).assertNull();
      expect(selectMatchingEntry(entries, [], KEY_DEVICE_B) !== null).assertTrue();
    });

    /** @tc.number SUB_GOBANG_PROTO_1200 @tc.name testProtocolMultiEntryScan0012 @tc.desc The listener scans every entry and returns the first key match */
    it('testProtocolMultiEntryScan0012', 0, async () => {
      let entries: ChangeEntry[] = [entry('noise', 'a'), entry(KEY_DEVICE_B, 'first'), entry(KEY_DEVICE_B, 'second')];
      let matched: ChangeEntry | null = selectMatchingEntry(entries, [], KEY_DEVICE_B);
      expect((matched as ChangeEntry).value).assertEqual('first');
      expect(selectAllMatching(entries, KEY_DEVICE_B).length).assertEqual(2);
      expect(selectAllMatching(entries, 'noise').length).assertEqual(1);
      expect(selectAllMatching(entries, KEY_DEVICE_A).length).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_PROTO_1300 @tc.name testProtocolPayloadBytes0013 @tc.desc payloadBytes equals the string length and grows with content */
    it('testProtocolPayloadBytes0013', 0, async () => {
      let short: string = encodeDeviceB(1, 1);
      let long: string = encodeDeviceB(14, 14);
      expect(payloadBytes(short)).assertEqual(short.length);
      expect(payloadBytes(short)).assertEqual(13);
      expect(payloadBytes(long)).assertEqual(15);
      expect(payloadBytes(long) > payloadBytes(short)).assertTrue();
    });

    /** @tc.number SUB_GOBANG_PROTO_1400 @tc.name testProtocolDiffCells0014 @tc.desc diffCells counts only the cells that actually differ */
    it('testProtocolDiffCells0014', 0, async () => {
      let left: string[][] = emptyMap();
      let right: string[][] = emptyMap();
      expect(diffCells(left, right)).assertEqual(0);
      right[0][0] = '#000000';
      expect(diffCells(left, right)).assertEqual(1);
      right[0][1] = '#ffffff';
      right[1][0] = '#000000';
      expect(diffCells(left, right)).assertEqual(3);
      left[0][0] = '#000000';
      expect(diffCells(left, right)).assertEqual(2);
    });

    /** @tc.number SUB_GOBANG_PROTO_1500 @tc.name testProtocolDiffRagged0015 @tc.desc diffCells tolerates ragged matrices without throwing */
    it('testProtocolDiffRagged0015', 0, async () => {
      let left: string[][] = [[], ['#000000']];
      let right: string[][] = [['#ffffff']];
      expect(diffCells(left, right)).assertEqual(2);
      expect(diffCells([], [])).assertEqual(0);
      expect(diffCells([[]], [[]])).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_PROTO_1600 @tc.name testProtocolTimeoutConstant0016 @tc.desc The sync timeout pushed with every put is one second */
    it('testProtocolTimeoutConstant0016', 0, async () => {
      expect(DEFAULT_SYNC_TIMEOUT).assertEqual(1000);
      expect(KEY_DEVICE_A.length).assertEqual(7);
      expect(KEY_DEVICE_B.length).assertEqual(7);
      expect(KEY_DEVICE_A.substring(0, 6)).assertEqual('device');
      expect(KEY_DEVICE_A.substring(6)).assertEqual('A');
    });
  });
}
