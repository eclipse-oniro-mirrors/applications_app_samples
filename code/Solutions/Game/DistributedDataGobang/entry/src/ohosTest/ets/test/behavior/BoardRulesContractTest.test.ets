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

// ---- inlined BoardEngine ----
/**
 * BoardEngine mirrors the board state kept by pages/Index.ets.
 *
 * The page owns the authoritative state in DistributedDataModel and paints it on
 * a Canvas, so a test that wants to assert rules (placement, undo, win detection,
 * click to grid mapping) needs a faithful replica of those rules. This replica
 * keeps the same field names, the same 15x15 geometry and the same four check
 * directions, which lets every assertion in the matrix suites be written against
 * literals that were derived by hand from the page code.
 */

export const BOARD_SIZE: number = 15;
export const BOARD_PIXEL_SIZE: number = 720;
export const CELL_SIZE: number = BOARD_PIXEL_SIZE / (BOARD_SIZE + 1);
export const EMPTY: string = '';
export const BLACK: string = '#000000';
export const WHITE: string = '#ffffff';
export const COLORS: string[] = [BLACK, WHITE];
export const WIN_LENGTH: number = 5;
export const MAX_STEP: number = BOARD_SIZE * BOARD_SIZE;
export const INVALID_INDEX: number = -1;

/** One board cell address. */
export interface GridPoint {
  x: number;
  y: number;
}

/** Result of a win probe: how many stones the colour owns on one axis. */
export interface WinProbe {
  count: number;
  color: string;
  filled: boolean;
  reached: boolean;
}

/** Serializable snapshot that matches GameDataTypeA in pages/Index.ets. */
export interface BoardSnapshot {
  isOver: boolean;
  step: number;
  chessMapArr: string[][];
  chessX: number;
  chessY: number;
  clickCount: number;
  fallLocation: number[];
}

/** One placement record, matching an entry of fallGather. */
export interface FallRecord {
  x: number;
  y: number;
  color: string;
  step: number;
}

/**
 * Pure board model. Every public method is total: out-of-range input never
 * throws, it returns false / an empty probe instead, which is what the page
 * does through its range guards.
 */
export class BoardEngine {
  static readonly SIZE: number = BOARD_SIZE;
  static readonly COLORS: string[] = COLORS;
  static readonly CHECK_MODE: number[][] = [[1, 0], [0, 1], [1, 1], [1, -1]];
  static readonly EMPTY: string = EMPTY;
  static readonly WIN_LENGTH: number = WIN_LENGTH;

  isOver: boolean = false;
  step: number = 0;
  chessMapArr: string[][] = [];
  chessX: number = INVALID_INDEX;
  chessY: number = INVALID_INDEX;
  fallGather: number[][] = [];
  clickCount: number = 0;
  fallLocation: number[] = [];

  constructor() {
    this.init();
  }

  /** Clears every cell and resets both the cursor and the move counter. */
  init(): void {
    this.isOver = false;
    this.chessMapArr = [];
    for (let i = 0; i < BOARD_SIZE; i++) {
      let row: string[] = [];
      for (let j = 0; j < BOARD_SIZE; j++) {
        row[j] = EMPTY;
      }
      this.chessMapArr[i] = row;
    }
    this.chessX = INVALID_INDEX;
    this.chessY = INVALID_INDEX;
    this.fallGather = [];
    this.fallLocation = [];
    this.clickCount = 0;
  }

  /** Mirrors the restart button: zero step, zero click count, empty history. */
  restart(): void {
    this.init();
    this.step = 0;
    this.clickCount = 0;
  }

  isInside(x: number, y: number): boolean {
    return x >= 0 && x < BOARD_SIZE && y >= 0 && y < BOARD_SIZE;
  }

  isEmptyCell(x: number, y: number): boolean {
    if (!this.isInside(x, y)) {
      return false;
    }
    return this.chessMapArr[x][y] === EMPTY;
  }

  /** Colour that belongs to the given step index: black on even, white on odd. */
  colorOfStep(step: number = this.step): string {
    if (step < 0) {
      return EMPTY;
    }
    return COLORS[step % 2];
  }

  /** Colour that the next placement would use. */
  nextColor(): string {
    return this.colorOfStep(this.step);
  }

  /** True when the device holding this board may act on the current step. */
  isMyTurn(deviceFlag: string): boolean {
    if (deviceFlag === 'A') {
      return this.step % 2 === 0;
    }
    if (deviceFlag === 'B') {
      return this.step % 2 !== 0;
    }
    return false;
  }

  /**
   * Places a stone without any turn check, exactly like DistributedDataModel
   * .fallChess: it unshifts the coordinate into the history, writes the colour
   * and moves the cursor. Returns false when the cell is out of range or taken.
   */
  fallChess(x: number, y: number, color: string): boolean {
    if (!this.isInside(x, y)) {
      return false;
    }
    if (this.chessMapArr[x][y] !== EMPTY) {
      return false;
    }
    this.fallGather.unshift([x, y]);
    this.chessMapArr[x][y] = color;
    this.chessX = x;
    this.chessY = y;
    return true;
  }

  /**
   * The interactive placement used by the page: rejects the move when the game is
   * over, when the cell is taken, or when the caller is not the owner of the turn.
   */
  place(x: number, y: number, deviceFlag: string = 'A'): boolean {
    if (this.isOver) {
      return false;
    }
    if (!this.isInside(x, y)) {
      return false;
    }
    if (this.chessMapArr[x][y] !== EMPTY) {
      return false;
    }
    if (deviceFlag !== 'A' && deviceFlag !== 'B') {
      return false;
    }
    if (!this.isMyTurn(deviceFlag)) {
      return false;
    }
    let color: string = this.colorOfStep();
    this.fallChess(x, y, color);
    this.step++;
    return true;
  }

  /**
   * Places a stone for whichever side owns the current step, bypassing the
   * device check. Used by matrix builders that only care about board content.
   */
  forcePlace(x: number, y: number): boolean {
    if (this.isOver || !this.isInside(x, y) || this.chessMapArr[x][y] !== EMPTY) {
      return false;
    }
    let color: string = this.colorOfStep();
    this.fallChess(x, y, color);
    this.step++;
    return true;
  }

  /**
   * Repentance: removes the most recent stone, decrements the step and leaves the
   * cursor untouched (the page keeps the last cursor until the next flush).
   */
  undo(): boolean {
    if (this.step <= 0 || this.fallGather.length === 0) {
      return false;
    }
    let last: number[] = this.fallGather[0];
    if (this.isInside(last[0], last[1])) {
      this.chessMapArr[last[0]][last[1]] = EMPTY;
    }
    this.fallGather.shift();
    this.step--;
    this.isOver = false;
    return true;
  }

  /** Removes all stones that belong to a colour; used by scenario builders. */
  clearColor(color: string): number {
    let removed: number = 0;
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        if (this.chessMapArr[i][j] === color) {
          this.chessMapArr[i][j] = EMPTY;
          removed++;
        }
      }
    }
    return removed;
  }

  /** Number of stones currently on the board. */
  stoneCount(): number {
    let total: number = 0;
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        if (this.chessMapArr[i][j] !== EMPTY) {
          total++;
        }
      }
    }
    return total;
  }

  countColor(color: string): number {
    let total: number = 0;
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        if (this.chessMapArr[i][j] === color) {
          total++;
        }
      }
    }
    return total;
  }

  /** Board is full once 225 stones are present. */
  isFull(): boolean {
    return this.stoneCount() >= MAX_STEP;
  }

  /** All empty cells in row-major order. */
  emptyCells(): GridPoint[] {
    let points: GridPoint[] = [];
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        if (this.chessMapArr[i][j] === EMPTY) {
          points.push({ x: i, y: j });
        }
      }
    }
    return points;
  }

  /** All cells owned by a colour in row-major order. */
  cellsOf(color: string): GridPoint[] {
    let points: GridPoint[] = [];
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        if (this.chessMapArr[i][j] === color) {
          points.push({ x: i, y: j });
        }
      }
    }
    return points;
  }

  /**
   * Counts the run that passes through (x, y) on the given axis, stopping at the
   * first stone of another colour or the first out-of-board index. This is the
   * same accumulation used by Index.checkWin, including the "colour must not be
   * empty" guard which prevents empty cells from chaining into a false win.
   */
  probe(x: number, y: number, mode: number[]): WinProbe {
    let result: WinProbe = { count: 1, color: EMPTY, filled: false, reached: false };
    if (!this.isInside(x, y)) {
      result.count = 0;
      return result;
    }
    let color: string = this.chessMapArr[x][y];
    result.color = color;
    result.filled = color !== EMPTY;
    let count: number = 1;
    for (let i = 1; i < WIN_LENGTH; i++) {
      let nx: number = x + i * mode[0];
      let ny: number = y + i * mode[1];
      if (!this.isInside(nx, ny)) {
        break;
      }
      if (this.chessMapArr[nx][ny] === color && color !== EMPTY) {
        count++;
      } else {
        break;
      }
    }
    for (let j = 1; j < WIN_LENGTH; j++) {
      let nx: number = x - j * mode[0];
      let ny: number = y - j * mode[1];
      if (!this.isInside(nx, ny)) {
        break;
      }
      if (this.chessMapArr[nx][ny] === color && color !== EMPTY) {
        count++;
      } else {
        break;
      }
    }
    result.count = count;
    result.reached = count >= WIN_LENGTH;
    return result;
  }

  /** Win check across all four axes, returning the best probe. */
  checkWinAt(x: number, y: number): boolean {
    if (!this.isInside(x, y)) {
      return false;
    }
    for (let i = 0; i < BoardEngine.CHECK_MODE.length; i++) {
      let probe: WinProbe = this.probe(x, y, BoardEngine.CHECK_MODE[i]);
      if (probe.reached) {
        return true;
      }
    }
    return false;
  }

  /** Applies the win flag the way flushData does after each redraw. */
  applyWinCheck(): boolean {
    if (this.isOver) {
      return true;
    }
    if (!this.isInside(this.chessX, this.chessY)) {
      return false;
    }
    let won: boolean = this.checkWinAt(this.chessX, this.chessY);
    if (won) {
      this.isOver = true;
    }
    return won;
  }

  /**
   * Click to grid mapping used by Index.fallChess:
   *   dx = floor((clickX + cell / 2) / cell) * cell
   *   x  = round(dx / cell - 1)
   * A click must land within half a cell of an intersection to be accepted.
   */
  clickToCell(clickX: number, cell: number = CELL_SIZE): number[] {
    let snapped: number = Math.floor((clickX + cell / 2) / cell) * cell;
    let index: number = Math.round(snapped / cell - 1);
    return [snapped, index];
  }

  /** Full click to grid translation, returning [x, y, snappedDx, snappedDy]. */
  clickToGrid(clickX: number, clickY: number, cell: number = CELL_SIZE): number[] {
    let cx: number[] = this.clickToCell(clickX, cell);
    let cy: number[] = this.clickToCell(clickY, cell);
    return [cx[1], cy[1], cx[0], cy[0]];
  }

  /**
   * Duplicate-click guard from Index.fallChess: the second click on exactly the
   * same snapped point is ignored, and the stored location is updated anyway.
   */
  registerClick(clickX: number, clickY: number, cell: number = CELL_SIZE): boolean {
    let grid: number[] = this.clickToGrid(clickX, clickY, cell);
    let dx: number = grid[2];
    let dy: number = grid[3];
    let duplicate: boolean = this.fallLocation.length === 2 &&
      this.fallLocation[0] === dx && this.fallLocation[1] === dy;
    this.fallLocation[0] = dx;
    this.fallLocation[1] = dy;
    this.clickCount++;
    return !duplicate;
  }

  /** Snapshot used by serialization and by the Device B listener. */
  snapshot(): BoardSnapshot {
    let copy: string[][] = [];
    for (let i = 0; i < BOARD_SIZE; i++) {
      let row: string[] = [];
      for (let j = 0; j < BOARD_SIZE; j++) {
        row[j] = this.chessMapArr[i][j];
      }
      copy[i] = row;
    }
    let location: number[] = [];
    for (let i = 0; i < this.fallLocation.length; i++) {
      location[i] = this.fallLocation[i];
    }
    return {
      isOver: this.isOver,
      step: this.step,
      chessMapArr: copy,
      chessX: this.chessX,
      chessY: this.chessY,
      clickCount: this.clickCount,
      fallLocation: location
    };
  }

  /** Applies a snapshot received from the peer, like the Device B listener. */
  applySnapshot(snapshot: BoardSnapshot): void {
    this.isOver = snapshot.isOver;
    this.step = snapshot.step;
    this.chessX = snapshot.chessX;
    this.chessY = snapshot.chessY;
    this.clickCount = snapshot.clickCount;
    this.fallLocation = [];
    for (let i = 0; i < snapshot.fallLocation.length; i++) {
      this.fallLocation[i] = snapshot.fallLocation[i];
    }
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        let value: string = EMPTY;
        if (snapshot.chessMapArr.length > i && snapshot.chessMapArr[i].length > j) {
          value = snapshot.chessMapArr[i][j];
        }
        this.chessMapArr[i][j] = value;
      }
    }
  }

  /** Stable textual rendering; useful for failure messages. */
  render(): string {
    let lines: string[] = [];
    for (let i = 0; i < BOARD_SIZE; i++) {
      let line: string = '';
      for (let j = 0; j < BOARD_SIZE; j++) {
        let cell: string = this.chessMapArr[i][j];
        if (cell === BLACK) {
          line += 'X';
        } else if (cell === WHITE) {
          line += 'O';
        } else {
          line += '.';
        }
      }
      lines.push(line);
    }
    return lines.join('\n');
  }

  /** Fingerprint of the board used by idempotence assertions. */
  fingerprint(): string {
    let parts: string[] = [];
    parts.push(`${this.isOver ? 1 : 0}`);
    parts.push(`${this.step}`);
    parts.push(`${this.chessX}`);
    parts.push(`${this.chessY}`);
    parts.push(`${this.clickCount}`);
    for (let i = 0; i < BOARD_SIZE; i++) {
      for (let j = 0; j < BOARD_SIZE; j++) {
        let cell: string = this.chessMapArr[i][j];
        if (cell === BLACK) {
          parts.push('X');
        } else if (cell === WHITE) {
          parts.push('O');
        } else {
          parts.push('.');
        }
      }
    }
    return parts.join('');
  }
}

/** Thrown-free parser used by protocol tests. */
export function parseBoardSnapshot(raw: string): BoardSnapshot {
  let parsed: BoardSnapshot = JSON.parse(raw) as BoardSnapshot;
  return parsed;
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

// ---- inlined TestScenarioUtils ----
/**
 * Deterministic scenario builders shared by the rule, protocol and device
 * suites. Every builder returns a fresh object; no builder mutates its input.
 */


export const ROW_INDEXES: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
export const DIAGONAL_STARTS: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

/** Empty 15x15 engine. */
export function emptyBoard(): BoardEngine {
  return new BoardEngine();
}

/** Places a horizontal run of `count` stones of one colour at (row, 0..count-1). */
export function rowBoard(row: number, count: number, color: string = BLACK): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < count; i++) {
    engine.fallChess(row, i, color);
  }
  engine.step = count;
  engine.chessX = row;
  engine.chessY = count - 1;
  return engine;
}

/** Places a vertical run of `count` stones of one colour at (0..count-1, col). */
export function columnBoard(col: number, count: number, color: string = BLACK): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < count; i++) {
    engine.fallChess(i, col, color);
  }
  engine.step = count;
  engine.chessX = count - 1;
  engine.chessY = col;
  return engine;
}

/** Places a main-diagonal run starting at (start, start). */
export function diagonalBoard(start: number, count: number, color: string = BLACK): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < count; i++) {
    engine.fallChess(start + i, start + i, color);
  }
  engine.step = count;
  engine.chessX = start + count - 1;
  engine.chessY = start + count - 1;
  return engine;
}

/** Places an anti-diagonal run ending at (14 - start, start). */
export function antiDiagonalBoard(start: number, count: number, color: string = BLACK): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < count; i++) {
    engine.fallChess(14 - (start + i), start + i, color);
  }
  engine.step = count;
  engine.chessX = 14 - (start + count - 1);
  engine.chessY = start + count - 1;
  return engine;
}

/** Five in a row where the middle stone is missing: [0,1,3,4] filled. */
export function gappedBoard(row: number): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  let columns: number[] = [0, 1, 3, 4];
  for (let i = 0; i < columns.length; i++) {
    engine.fallChess(row, columns[i], BLACK);
  }
  engine.step = columns.length;
  engine.chessX = row;
  engine.chessY = 4;
  return engine;
}

/** Two runs of four that share the same row but are separated by a white stone. */
export function blockedBoard(row: number): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < 4; i++) {
    engine.fallChess(row, i, BLACK);
  }
  engine.fallChess(row, 4, WHITE);
  for (let i = 5; i < 9; i++) {
    engine.fallChess(row, i, BLACK);
  }
  engine.step = 9;
  engine.chessX = row;
  engine.chessY = 8;
  return engine;
}

/** Five black and five white stones interleaved on the same row. */
export function interleavedBoard(row: number): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < 10; i++) {
    engine.fallChess(row, i, i % 2 === 0 ? BLACK : WHITE);
  }
  engine.step = 10;
  engine.chessX = row;
  engine.chessY = 9;
  return engine;
}

/** Complete cross through the center: two axes of five. */
export function crossBoard(): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < 5; i++) {
    engine.fallChess(7, 5 + i, BLACK);
    engine.fallChess(5 + i, 7, BLACK);
  }
  engine.step = 10;
  engine.chessX = 7;
  engine.chessY = 7;
  return engine;
}

/** Fills a rectangle with alternating colours; used by stress scenarios. */
export function checkerBoard(width: number, height: number): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  let step: number = 0;
  for (let i = 0; i < width; i++) {
    for (let j = 0; j < height; j++) {
      engine.chessMapArr[i][j] = (i + j) % 2 === 0 ? BLACK : WHITE;
      step++;
    }
  }
  engine.step = step;
  return engine;
}

/** Fills every cell with alternating colours in row-major order. */
export function fullBoard(): BoardEngine {
  return checkerBoard(15, 15);
}

/** Applies an arbitrary coordinate list with alternating colours. */
export function movesBoard(moves: number[][]): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  for (let i = 0; i < moves.length; i++) {
    engine.forcePlace(moves[i][0], moves[i][1]);
  }
  return engine;
}

/** Linear congruential generator so random matrices are reproducible. */
export class SeededRandom {
  private state: number;

  constructor(seed: number = 20261116) {
    this.state = seed;
  }

  next(): number {
    this.state = (this.state * 1103515245 + 12345) % 2147483648;
    return this.state;
  }

  nextIndex(bound: number): number {
    if (bound <= 0) {
      return 0;
    }
    return this.next() % bound;
  }

  reset(seed: number = 20261116): void {
    this.state = seed;
  }
}

/** Board with `count` pseudo-random stones, never triggering a win check. */
export function randomBoard(count: number, seed: number = 20261116): BoardEngine {
  let engine: BoardEngine = new BoardEngine();
  let random: SeededRandom = new SeededRandom(seed);
  let placed: number = 0;
  let guard: number = 0;
  while (placed < count && guard < count * 20) {
    let x: number = random.nextIndex(15);
    let y: number = random.nextIndex(15);
    if (engine.fallChess(x, y, placed % 2 === 0 ? BLACK : WHITE)) {
      placed++;
    }
    guard++;
  }
  engine.step = placed;
  return engine;
}

/** Device engine seeded with N discovered devices. */
export function deviceEngineWith(count: number): DeviceEngine {
  let engine: DeviceEngine = new DeviceEngine();
  for (let i = 0; i < count; i++) {
    engine.deviceFound(makeDevice('dev' + i));
  }
  return engine;
}

/** Trusted device list of N entries. */
export function trustedDevices(count: number): DeviceInfo[] {
  let devices: DeviceInfo[] = [];
  for (let i = 0; i < count; i++) {
    devices.push(makeDevice('trusted' + i));
  }
  return devices;
}

/** Kv engine already created and empty. */
export function freshStore(): KvEngine {
  let store: KvEngine = new KvEngine();
  store.create();
  return store;
}

/** Snapshot payload with `stones` moves along the main diagonal. */
export function diagonalPayload(stones: number): DeviceAPayload {
  let moves: number[][] = [];
  for (let i = 0; i < stones; i++) {
    moves.push([i, i]);
  }
  return buildPayload(moves, [BLACK, WHITE]);
}

/** Snapshot payload that reflects a finished game. */
export function finishedPayload(winner: string): DeviceAPayload {
  let map: string[][] = emptyMap();
  for (let i = 0; i < 5; i++) {
    map[7][i] = winner;
  }
  return {
    isOver: true,
    step: 5,
    chessMapArr: map,
    chessX: 7,
    chessY: 4,
    clickCount: 5,
    fallLocation: [0, 0]
  };
}

/** Converts a board into the payload shape used by Device A. */
export function payloadOf(engine: BoardEngine): DeviceAPayload {
  return {
    isOver: engine.isOver,
    step: engine.step,
    chessMapArr: engine.chessMapArr,
    chessX: engine.chessX,
    chessY: engine.chessY,
    clickCount: engine.clickCount,
    fallLocation: engine.fallLocation
  };
}

/** True when the board has no stones at all. */
export function boardIsEmpty(engine: BoardEngine): boolean {
  for (let i = 0; i < 15; i++) {
    for (let j = 0; j < 15; j++) {
      if (engine.chessMapArr[i][j] !== EMPTY) {
        return false;
      }
    }
  }
  return true;
}

/** Counts stones of a colour in a row. */
export function rowCount(engine: BoardEngine, row: number, color: string): number {
  let count: number = 0;
  for (let j = 0; j < 15; j++) {
    if (engine.chessMapArr[row][j] === color) {
      count++;
    }
  }
  return count;
}

/** Counts stones of a colour in a column. */
export function columnCount(engine: BoardEngine, col: number, color: string): number {
  let count: number = 0;
  for (let i = 0; i < 15; i++) {
    if (engine.chessMapArr[i][col] === color) {
      count++;
    }
  }
  return count;
}

/** Every straight line of the board as a coordinate list. */
export function allLines(): number[][][] {
  let lines: number[][][] = [];
  for (let i = 0; i < 15; i++) {
    let row: number[][] = [];
    let col: number[][] = [];
    for (let j = 0; j < 15; j++) {
      row.push([i, j]);
      col.push([j, i]);
    }
    lines.push(row);
    lines.push(col);
  }
  return lines;
}

// ---- inlined DeviceEngine ----
/**
 * DeviceEngine is a faithful, synchronous replica of Model/RemoteDeviceModel.
 *
 * The real model talks to the distributed device manager service, which is not
 * available on a single debug device. The replica keeps the same containers
 * (deviceList / discoverList), the same de-duplication policy in deviceFound and
 * the same filtering in authenticateDevice so that the contract suites can pin
 * the behaviour deterministically. Every state transition that the real model
 * performs through a service callback is exposed here as a plain method.
 */

export const AUTH_BIND_LEVEL: number = 3;
export const AUTH_BIND_TYPE: number = 1;
export const AUTH_TARGET_PKG: string = 'ohos.samples.distributeddatagobang';
export const AUTH_APP_NAME: string = 'distributeddatagobang';
export const DISCOVER_TARGET_TYPE: number = 1;
export const DISCOVER_AVAILABLE_STATUS: number = 0;
export const DEFAULT_SUBSCRIBE_ID: number = 100;
export const SERVICE_DEATH_RETRY: number = 3;

export const STATE_AVAILABLE: string = 'available';
export const STATE_UNAVAILABLE: string = 'unavailable';
export const STATE_UNKNOWN: string = 'unknown';

/** Subset of DeviceBasicInfo that the sample actually reads. */
export interface DeviceInfo {
  deviceId: string;
  deviceName: string;
  networkId: string;
  deviceType: string;
}

/** One authentication attempt recorded by the replica. */
export interface BindAttempt {
  deviceId: string;
  bindLevel: number;
  bindType: number;
  targetPkgName: string;
  appName: string;
  accepted: boolean;
}

/** Result of a discover event. */
export interface DiscoverResult {
  added: boolean;
  size: number;
}

export function makeDevice(id: string, name: string = '', network: string = ''): DeviceInfo {
  return {
    deviceId: id,
    deviceName: name === '' ? `device-${id}` : name,
    networkId: network === '' ? `net-${id}` : network,
    deviceType: '0'
  };
}

export function makeDevices(count: number, prefix: string = 'dev'): DeviceInfo[] {
  let devices: DeviceInfo[] = [];
  for (let i = 0; i < count; i++) {
    devices.push(makeDevice(`${prefix}${i}`, `${prefix}-${i}`, `net-${prefix}${i}`));
  }
  return devices;
}

/**
 * Offline transition: an existing entry is replaced in place, a missing entry is
 * ignored (the real code breaks out of the loop without appending).
 */
export interface OfflineResult {
  replaced: boolean;
  callbackFired: boolean;
  size: number;
}

export class DeviceEngine {
  deviceList: DeviceInfo[] = [];
  discoverList: DeviceInfo[] = [];
  started: boolean = false;
  subscribed: boolean = false;
  callbackCount: number = 0;
  lastBind: BindAttempt | null = null;
  bindAttempts: BindAttempt[] = [];
  subscribeId: number = DEFAULT_SUBSCRIBE_ID;
  serviceDieCount: number = 0;
  discoverParams: number[] = [];
  filterParams: number[] = [];

  reset(): void {
    this.deviceList = [];
    this.discoverList = [];
    this.started = false;
    this.subscribed = false;
    this.callbackCount = 0;
    this.lastBind = null;
    this.bindAttempts = [];
    this.serviceDieCount = 0;
    this.discoverParams = [];
    this.filterParams = [];
  }

  /** Seeds the trusted list, as getAvailableDeviceListSync does on registration. */
  seedTrusted(devices: DeviceInfo[]): void {
    this.deviceList = [];
    for (let i = 0; i < devices.length; i++) {
      this.deviceList.push(devices[i]);
    }
  }

  /** Equivalent of the AVAILABLE branch of deviceStateChange. */
  onAvailable(device: DeviceInfo): number {
    this.discoverList = [];
    let exists: boolean = false;
    for (let i = 0; i < this.deviceList.length; i++) {
      if (this.deviceList[i].deviceId === device.deviceId) {
        exists = true;
        break;
      }
    }
    if (!exists) {
      this.deviceList.push(device);
    }
    this.callbackCount++;
    return this.deviceList.length;
  }

  /** Equivalent of the UNAVAILABLE branch: the sample does nothing there. */
  onUnavailable(device: DeviceInfo): number {
    return this.deviceList.length;
  }

  /**
   * deviceStateChangeActionOffline: an empty list fires the callback and returns,
   * otherwise the matching entry is replaced. Note that the real method fires the
   * callback twice when the list is non-empty (once in the loop path, once at the
   * end), which callers must tolerate.
   */
  onOffline(device: DeviceInfo): OfflineResult {
    if (this.deviceList.length <= 0) {
      this.callbackCount++;
      return { replaced: false, callbackFired: true, size: 0 };
    }
    let replaced: boolean = false;
    for (let j = 0; j < this.deviceList.length; j++) {
      if (this.deviceList[j].deviceId === device.deviceId) {
        this.deviceList[j] = device;
        replaced = true;
        break;
      }
    }
    this.callbackCount++;
    return { replaced: replaced, callbackFired: true, size: this.deviceList.length };
  }

  /**
   * deviceFound: de-duplicates by deviceId against discoverList. A duplicate is
   * ignored without firing the callback, which is what keeps the dialog stable
   * while discovery keeps repeating.
   */
  deviceFound(device: DeviceInfo): DiscoverResult {
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId === device.deviceId) {
        return { added: false, size: this.discoverList.length };
      }
    }
    this.discoverList.push(device);
    this.callbackCount++;
    return { added: true, size: this.discoverList.length };
  }

  /** Clears discoverList then adds the device, mirroring the AVAILABLE branch. */
  deviceFoundAfterAvailable(device: DeviceInfo): DiscoverResult {
    this.discoverList = [];
    this.discoverList.push(device);
    this.callbackCount++;
    return { added: true, size: this.discoverList.length };
  }

  startDiscovery(): boolean {
    this.started = true;
    this.discoverParams = [DISCOVER_TARGET_TYPE];
    this.filterParams = [DISCOVER_AVAILABLE_STATUS];
    return true;
  }

  stopDiscovery(): boolean {
    this.started = false;
    this.subscribed = false;
    this.deviceList = [];
    this.discoverList = [];
    return true;
  }

  onServiceDie(): number {
    this.serviceDieCount++;
    return this.serviceDieCount;
  }

  /**
   * authenticateDevice: only devices already present in discoverList are bound;
   * the bind parameter block is fixed to level 3 / type 1 / the sample package.
   */
  authenticate(device: DeviceInfo): BindAttempt {
    for (let i = 0; i < this.discoverList.length; i++) {
      if (this.discoverList[i].deviceId !== device.deviceId) {
        continue;
      }
      let attempt: BindAttempt = {
        deviceId: device.deviceId,
        bindLevel: AUTH_BIND_LEVEL,
        bindType: AUTH_BIND_TYPE,
        targetPkgName: AUTH_TARGET_PKG,
        appName: AUTH_APP_NAME,
        accepted: true
      };
      this.lastBind = attempt;
      this.bindAttempts.push(attempt);
      return attempt;
    }
    let rejected: BindAttempt = {
      deviceId: device.deviceId,
      bindLevel: AUTH_BIND_LEVEL,
      bindType: AUTH_BIND_TYPE,
      targetPkgName: AUTH_TARGET_PKG,
      appName: AUTH_APP_NAME,
      accepted: false
    };
    return rejected;
  }

  /** Number of entries whose id is contained in the given list. */
  countKnown(ids: string[]): number {
    let found: number = 0;
    for (let i = 0; i < ids.length; i++) {
      for (let j = 0; j < this.discoverList.length; j++) {
        if (this.discoverList[j].deviceId === ids[i]) {
          found++;
          break;
        }
      }
    }
    return found;
  }

  /** Network ids used as sync targets by KvStoreModel.put. */
  networkIds(): string[] {
    let ids: string[] = [];
    for (let i = 0; i < this.deviceList.length; i++) {
      ids[i] = this.deviceList[i].networkId;
    }
    return ids;
  }

  /** Sorted view for order-independent assertions. */
  sortedIds(source: DeviceInfo[]): string[] {
    let ids: string[] = [];
    for (let i = 0; i < source.length; i++) {
      ids[i] = source[i].deviceId;
    }
    ids.sort();
    return ids;
  }
}

/** State change routing used by the page: AVAILABLE fills, others are ignored. */
export function routeStateChange(action: string, device: DeviceInfo, engine: DeviceEngine): string {
  if (action === STATE_AVAILABLE) {
    engine.onAvailable(device);
    return 'handled';
  }
  if (action === STATE_UNAVAILABLE) {
    engine.onUnavailable(device);
    return 'ignored';
  }
  return 'unknown';
}

/** Device list rendered by DeviceDialog: names joined for the UI test. */
export function dialogNames(engine: DeviceEngine): string[] {
  let names: string[] = [];
  for (let i = 0; i < engine.deviceList.length; i++) {
    names[i] = engine.deviceList[i].deviceName;
  }
  return names;
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

export default function boardRulesContract() {
  describe('GobangBoardRulesContract', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /** @tc.number SUB_GOBANG_BOARD_0100 @tc.name testBoardInitShape0001 @tc.desc A fresh board is 15x15 and every cell is empty */
    it('testBoardInitShape0001', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.chessMapArr.length).assertEqual(BOARD_SIZE);
      for (let i = 0; i < BOARD_SIZE; i++) {
        expect(engine.chessMapArr[i].length).assertEqual(BOARD_SIZE);
        for (let j = 0; j < BOARD_SIZE; j++) {
          expect(engine.chessMapArr[i][j]).assertEqual(EMPTY);
        }
      }
      expect(boardIsEmpty(engine)).assertTrue();
    });

    /** @tc.number SUB_GOBANG_BOARD_0200 @tc.name testBoardInitCounters0002 @tc.desc A fresh board starts with step 0, clickCount 0 and cursor -1/-1 */
    it('testBoardInitCounters0002', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      expect(engine.step).assertEqual(0);
      expect(engine.clickCount).assertEqual(0);
      expect(engine.chessX).assertEqual(-1);
      expect(engine.chessY).assertEqual(-1);
      expect(engine.isOver).assertFalse();
      expect(engine.fallGather.length).assertEqual(0);
      expect(engine.fallLocation.length).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_0300 @tc.name testBoardInitIsIdempotent0003 @tc.desc Calling init twice leaves the same fingerprint while step is untouched */
    it('testBoardInitIsIdempotent0003', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      engine.place(7, 7, 'A');
      let afterOne: string = engine.fingerprint();
      engine.init();
      let afterTwo: string = engine.fingerprint();
      engine.init();
      let afterThree: string = engine.fingerprint();
      expect(afterTwo).assertEqual(afterThree);
      expect(afterOne === afterTwo).assertFalse();
      expect(engine.step).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_BOARD_0400 @tc.name testBoardColorParity0004 @tc.desc Even steps paint black and odd steps paint white, starting at step 0 */
    it('testBoardColorParity0004', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.colorOfStep(0)).assertEqual(BLACK);
      expect(engine.colorOfStep(1)).assertEqual(WHITE);
      expect(engine.colorOfStep(2)).assertEqual(BLACK);
      expect(engine.colorOfStep(3)).assertEqual(WHITE);
      expect(engine.colorOfStep(14)).assertEqual(BLACK);
      expect(engine.colorOfStep(15)).assertEqual(WHITE);
      expect(engine.colorOfStep(-1)).assertEqual(EMPTY);
    });

    /** @tc.number SUB_GOBANG_BOARD_0500 @tc.name testBoardPlaceAlternates0005 @tc.desc Consecutive placements alternate colours and advance the step */
    it('testBoardPlaceAlternates0005', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.place(7, 7, 'A')).assertTrue();
      expect(engine.chessMapArr[7][7]).assertEqual(BLACK);
      expect(engine.step).assertEqual(1);
      expect(engine.place(7, 8, 'B')).assertTrue();
      expect(engine.chessMapArr[7][8]).assertEqual(WHITE);
      expect(engine.step).assertEqual(2);
      expect(engine.place(8, 8, 'A')).assertTrue();
      expect(engine.chessMapArr[8][8]).assertEqual(BLACK);
      expect(engine.step).assertEqual(3);
    });

    /** @tc.number SUB_GOBANG_BOARD_0600 @tc.name testBoardTurnOwnership0006 @tc.desc Device A owns even steps and device B owns odd steps only */
    it('testBoardTurnOwnership0006', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.isMyTurn('A')).assertTrue();
      expect(engine.isMyTurn('B')).assertFalse();
      expect(engine.place(7, 7, 'B')).assertFalse();
      expect(engine.step).assertEqual(0);
      expect(engine.place(7, 7, 'A')).assertTrue();
      expect(engine.isMyTurn('A')).assertFalse();
      expect(engine.isMyTurn('B')).assertTrue();
      expect(engine.place(7, 8, 'B')).assertTrue();
      expect(engine.isMyTurn('A')).assertTrue();
      expect(engine.isMyTurn('C')).assertFalse();
    });

    /** @tc.number SUB_GOBANG_BOARD_0700 @tc.name testBoardRejectOccupied0007 @tc.desc A second stone on the same intersection is rejected without side effects */
    it('testBoardRejectOccupied0007', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      engine.place(3, 3, 'A');
      let before: string = engine.fingerprint();
      expect(engine.place(3, 3, 'B')).assertFalse();
      expect(engine.fingerprint()).assertEqual(before);
      expect(engine.chessMapArr[3][3]).assertEqual(BLACK);
      expect(engine.step).assertEqual(1);
      expect(engine.fallGather.length).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_BOARD_0800 @tc.name testBoardRejectOutOfRange0008 @tc.desc Indices below 0 and above 14 are rejected by every mutating entry */
    it('testBoardRejectOutOfRange0008', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.place(-1, 0, 'A')).assertFalse();
      expect(engine.place(0, -1, 'A')).assertFalse();
      expect(engine.place(15, 0, 'A')).assertFalse();
      expect(engine.place(0, 15, 'A')).assertFalse();
      expect(engine.place(99, 99, 'A')).assertFalse();
      expect(engine.fallChess(-1, 0, BLACK)).assertFalse();
      expect(engine.fallChess(0, 15, BLACK)).assertFalse();
      expect(engine.step).assertEqual(0);
      expect(engine.stoneCount()).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_0900 @tc.name testBoardPlaceWhenOver0009 @tc.desc Once the game is over no further stone may be placed */
    it('testBoardPlaceWhenOver0009', 0, async () => {
      let engine: BoardEngine = rowBoard(7, 5, BLACK);
      engine.chessX = 7;
      engine.chessY = 4;
      expect(engine.applyWinCheck()).assertTrue();
      expect(engine.isOver).assertTrue();
      let before: string = engine.fingerprint();
      expect(engine.place(9, 9, 'A')).assertFalse();
      expect(engine.forcePlace(9, 9)).assertFalse();
      expect(engine.fingerprint()).assertEqual(before);
    });

    /** @tc.number SUB_GOBANG_BOARD_1000 @tc.name testBoardCursorTracksLast0010 @tc.desc The cursor always points at the most recently placed stone */
    it('testBoardCursorTracksLast0010', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      engine.place(2, 5, 'A');
      expect(engine.chessX).assertEqual(2);
      expect(engine.chessY).assertEqual(5);
      engine.place(11, 3, 'B');
      expect(engine.chessX).assertEqual(11);
      expect(engine.chessY).assertEqual(3);
      engine.place(0, 0, 'A');
      expect(engine.chessX).assertEqual(0);
      expect(engine.chessY).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_1100 @tc.name testBoardHistoryOrder0011 @tc.desc fallGather keeps the newest coordinate at index 0 */
    it('testBoardHistoryOrder0011', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      engine.place(1, 2, 'A');
      engine.place(3, 4, 'B');
      engine.place(5, 6, 'A');
      expect(engine.fallGather.length).assertEqual(3);
      expect(engine.fallGather[0][0]).assertEqual(5);
      expect(engine.fallGather[0][1]).assertEqual(6);
      expect(engine.fallGather[1][0]).assertEqual(3);
      expect(engine.fallGather[1][1]).assertEqual(4);
      expect(engine.fallGather[2][0]).assertEqual(1);
      expect(engine.fallGather[2][1]).assertEqual(2);
    });

    /** @tc.number SUB_GOBANG_BOARD_1200 @tc.name testBoardRestartClears0012 @tc.desc Restart empties the board and zeroes every counter, including clicks */
    it('testBoardRestartClears0012', 0, async () => {
      let engine: BoardEngine = randomBoard(30);
      engine.clickCount = 12;
      expect(engine.stoneCount()).assertEqual(30);
      engine.restart();
      expect(engine.stoneCount()).assertEqual(0);
      expect(engine.step).assertEqual(0);
      expect(engine.clickCount).assertEqual(0);
      expect(engine.isOver).assertFalse();
      expect(engine.fallGather.length).assertEqual(0);
      expect(engine.fallLocation.length).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_1300 @tc.name testBoardStoneCount0013 @tc.desc stoneCount and countColor agree with the constructed fixtures */
    it('testBoardStoneCount0013', 0, async () => {
      let row: BoardEngine = rowBoard(4, 7, BLACK);
      expect(row.stoneCount()).assertEqual(7);
      expect(row.countColor(BLACK)).assertEqual(7);
      expect(row.countColor(WHITE)).assertEqual(0);
      let column: BoardEngine = columnBoard(9, 6, WHITE);
      expect(column.stoneCount()).assertEqual(6);
      expect(column.countColor(WHITE)).assertEqual(6);
      let interleaved: BoardEngine = interleavedBoard(2);
      expect(interleaved.stoneCount()).assertEqual(10);
      expect(interleaved.countColor(BLACK)).assertEqual(5);
      expect(interleaved.countColor(WHITE)).assertEqual(5);
    });

    /** @tc.number SUB_GOBANG_BOARD_1400 @tc.name testBoardRowColumnCounts0014 @tc.desc Row and column helpers only count their own line */
    it('testBoardRowColumnCounts0014', 0, async () => {
      let engine: BoardEngine = rowBoard(6, 9, BLACK);
      expect(rowCount(engine, 6, BLACK)).assertEqual(9);
      expect(rowCount(engine, 5, BLACK)).assertEqual(0);
      expect(rowCount(engine, 7, BLACK)).assertEqual(0);
      expect(columnCount(engine, 0, BLACK)).assertEqual(1);
      expect(columnCount(engine, 8, BLACK)).assertEqual(1);
      expect(columnCount(engine, 9, BLACK)).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_1500 @tc.name testBoardEmptyCells0015 @tc.desc emptyCells shrinks by one per placement and preserves row-major order */
    it('testBoardEmptyCells0015', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.emptyCells().length).assertEqual(MAX_STEP);
      let first: number[] = [engine.emptyCells()[0].x, engine.emptyCells()[0].y];
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(0);
      engine.place(0, 0, 'A');
      expect(engine.emptyCells().length).assertEqual(MAX_STEP - 1);
      let next: number[] = [engine.emptyCells()[0].x, engine.emptyCells()[0].y];
      expect(next[0]).assertEqual(0);
      expect(next[1]).assertEqual(1);
      for (let i = 1; i <= 24; i++) {
        engine.forcePlace(Math.floor(i / 15), i % 15);
      }
      expect(engine.emptyCells().length).assertEqual(MAX_STEP - 25);
    });

    /** @tc.number SUB_GOBANG_BOARD_1600 @tc.name testBoardCellsOf0016 @tc.desc cellsOf returns exactly the intersections owned by a colour */
    it('testBoardCellsOf0016', 0, async () => {
      let engine: BoardEngine = interleavedBoard(3);
      expect(engine.cellsOf(BLACK).length).assertEqual(5);
      expect(engine.cellsOf(WHITE).length).assertEqual(5);
      expect(engine.cellsOf(EMPTY).length).assertEqual(MAX_STEP - 10);
      let blackCells: number[][] = [];
      for (let i = 0; i < engine.cellsOf(BLACK).length; i++) {
        blackCells.push([engine.cellsOf(BLACK)[i].x, engine.cellsOf(BLACK)[i].y]);
      }
      expect(blackCells[0][0]).assertEqual(3);
      expect(blackCells[0][1]).assertEqual(0);
      expect(blackCells[4][0]).assertEqual(3);
      expect(blackCells[4][1]).assertEqual(8);
    });

    /** @tc.number SUB_GOBANG_BOARD_1700 @tc.name testBoardFullDetection0017 @tc.desc A completely covered board reports full only after 225 stones */
    it('testBoardFullDetection0017', 0, async () => {
      let engine: BoardEngine = fullBoard();
      expect(engine.stoneCount()).assertEqual(MAX_STEP);
      expect(engine.isFull()).assertTrue();
      expect(engine.emptyCells().length).assertEqual(0);
      let partial: BoardEngine = randomBoard(100, 11);
      expect(partial.isFull()).assertFalse();
    });

    /** @tc.number SUB_GOBANG_BOARD_1800 @tc.name testBoardClickSnapCenter0018 @tc.desc A click exactly on an intersection snaps to that intersection index */
    it('testBoardClickSnapCenter0018', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let cell: number = CELL_SIZE;
      for (let i = 0; i < BOARD_SIZE; i++) {
        let result: number[] = engine.clickToCell((i + 1) * cell, cell);
        expect(result[0]).assertEqual((i + 1) * cell);
        expect(result[1]).assertEqual(i);
      }
      let corner: number[] = engine.clickToGrid(cell, cell, cell);
      expect(corner[0]).assertEqual(0);
      expect(corner[1]).assertEqual(0);
      let far: number[] = engine.clickToGrid(15 * cell, 15 * cell, cell);
      expect(far[0]).assertEqual(14);
      expect(far[1]).assertEqual(14);
    });

    /** @tc.number SUB_GOBANG_BOARD_1900 @tc.name testBoardClickSnapTolerance0019 @tc.desc A click up to half a cell away still lands on the same intersection */
    it('testBoardClickSnapTolerance0019', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let cell: number = CELL_SIZE;
      let target: number = 5 * cell;
      let nearLeft: number[] = engine.clickToCell(target - cell / 2 + 0.1, cell);
      let nearRight: number[] = engine.clickToCell(target + cell / 2 - 0.1, cell);
      expect(nearLeft[1]).assertEqual(4);
      expect(nearRight[1]).assertEqual(4);
      let midpoint: number[] = engine.clickToCell(target + cell / 2, cell);
      expect(midpoint[1]).assertEqual(5);
      let before: number[] = engine.clickToCell(target - cell / 2 - 1, cell);
      expect(before[1]).assertEqual(3);
    });

    /** @tc.number SUB_GOBANG_BOARD_2000 @tc.name testBoardClickGridRoundTrip0020 @tc.desc Every intersection converts to a click point and back to itself */
    it('testBoardClickGridRoundTrip0020', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let cell: number = CELL_SIZE;
      let mismatches: number = 0;
      for (let i = 0; i < BOARD_SIZE; i++) {
        for (let j = 0; j < BOARD_SIZE; j++) {
          let px: number = (i + 1) * cell;
          let py: number = (j + 1) * cell;
          let grid: number[] = engine.clickToGrid(px, py, cell);
          if (grid[0] !== i || grid[1] !== j) {
            mismatches++;
          }
        }
      }
      expect(mismatches).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_2100 @tc.name testBoardClickEdgeClamp0021 @tc.desc Clicks above the first line clamp to -1 or 0 but never exceed 14 */
    it('testBoardClickEdgeClamp0021', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let cell: number = CELL_SIZE;
      expect(engine.clickToCell(0, cell)[1]).assertEqual(-1);
      expect(engine.clickToCell(cell / 2 - 1, cell)[1]).assertEqual(-1);
      expect(engine.clickToCell(cell / 2 + 1, cell)[1]).assertEqual(0);
      expect(engine.clickToCell(15 * cell, cell)[1]).assertEqual(14);
      expect(engine.clickToCell(16 * cell, cell)[1]).assertEqual(15);
      expect(engine.isInside(15, 0)).assertFalse();
    });

    /** @tc.number SUB_GOBANG_BOARD_2200 @tc.name testBoardDuplicateClickGuard0022 @tc.desc Repeating the same snapped click is reported as a duplicate */
    it('testBoardDuplicateClickGuard0022', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let cell: number = CELL_SIZE;
      expect(engine.registerClick(3 * cell, 4 * cell, cell)).assertTrue();
      expect(engine.fallLocation[0]).assertEqual(3 * cell);
      expect(engine.fallLocation[1]).assertEqual(4 * cell);
      expect(engine.registerClick(3 * cell + 1, 4 * cell + 1, cell)).assertFalse();
      expect(engine.registerClick(5 * cell, 4 * cell, cell)).assertTrue();
      expect(engine.fallLocation[0]).assertEqual(5 * cell);
      expect(engine.clickCount).assertEqual(3);
    });

    /** @tc.number SUB_GOBANG_BOARD_2300 @tc.name testBoardRenderSymbols0023 @tc.desc render maps black to X, white to O and empty cells to dots */
    it('testBoardRenderSymbols0023', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      engine.fallChess(0, 0, BLACK);
      engine.fallChess(0, 1, WHITE);
      let lines: string[] = engine.render().split('\n');
      expect(lines.length).assertEqual(BOARD_SIZE);
      expect(lines[0].substring(0, 3)).assertEqual('XO.');
      expect(lines[0].length).assertEqual(BOARD_SIZE);
      expect(lines[1]).assertEqual('...............');
      expect(lines[14]).assertEqual('...............');
    });

    /** @tc.number SUB_GOBANG_BOARD_2400 @tc.name testBoardFingerprintStability0024 @tc.desc Two boards built by the same moves share a fingerprint */
    it('testBoardFingerprintStability0024', 0, async () => {
      let first: BoardEngine = randomBoard(40, 777);
      let second: BoardEngine = randomBoard(40, 777);
      let third: BoardEngine = randomBoard(40, 778);
      expect(first.fingerprint()).assertEqual(second.fingerprint());
      expect(first.fingerprint() === third.fingerprint()).assertFalse();
      expect(first.fingerprint().length > MAX_STEP).assertTrue();
      expect(first.fingerprint().indexOf('X') >= 0).assertTrue();
    });

    /** @tc.number SUB_GOBANG_BOARD_2500 @tc.name testBoardApplySnapshot0025 @tc.desc A received snapshot replaces the whole local board including counters */
    it('testBoardApplySnapshot0025', 0, async () => {
      let source: BoardEngine = diagonalBoard(2, 6, BLACK);
      source.clickCount = 9;
      source.chessX = 7;
      source.chessY = 7;
      let target: BoardEngine = emptyBoard();
      target.applySnapshot(source.snapshot());
      expect(target.step).assertEqual(6);
      expect(target.clickCount).assertEqual(9);
      expect(target.chessX).assertEqual(7);
      expect(target.chessY).assertEqual(7);
      expect(target.countColor(BLACK)).assertEqual(6);
      expect(target.stoneCount()).assertEqual(6);
    });

    /** @tc.number SUB_GOBANG_BOARD_2600 @tc.name testBoardSnapshotIsDetached0026 @tc.desc Mutating the live board after snapshot does not change the snapshot */
    it('testBoardSnapshotIsDetached0026', 0, async () => {
      let engine: BoardEngine = rowBoard(1, 3, BLACK);
      let snapshot: BoardSnapshot = engine.snapshot();
      engine.fallChess(1, 3, BLACK);
      engine.step = 4;
      expect(snapshot.step).assertEqual(3);
      expect(snapshot.chessMapArr[1][3]).assertEqual(EMPTY);
      expect(snapshot.chessMapArr[1][0]).assertEqual(BLACK);
      expect(engine.stoneCount()).assertEqual(4);
    });

    /** @tc.number SUB_GOBANG_BOARD_2700 @tc.name testBoardClearColor0027 @tc.desc clearColor removes only the requested colour and reports the count */
    it('testBoardClearColor0027', 0, async () => {
      let engine: BoardEngine = interleavedBoard(8);
      expect(engine.clearColor(WHITE)).assertEqual(5);
      expect(engine.countColor(WHITE)).assertEqual(0);
      expect(engine.countColor(BLACK)).assertEqual(5);
      expect(engine.stoneCount()).assertEqual(5);
      expect(engine.clearColor(WHITE)).assertEqual(0);
      expect(engine.clearColor(BLACK)).assertEqual(5);
      expect(engine.stoneCount()).assertEqual(0);
    });

    /** @tc.number SUB_GOBANG_BOARD_2800 @tc.name testBoardForcePlaceBypass0028 @tc.desc forcePlace ignores turn ownership but honours occupancy and game over */
    it('testBoardForcePlaceBypass0028', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      expect(engine.forcePlace(1, 1)).assertTrue();
      expect(engine.forcePlace(1, 2)).assertTrue();
      expect(engine.forcePlace(1, 3)).assertTrue();
      expect(engine.step).assertEqual(3);
      expect(engine.forcePlace(1, 3)).assertFalse();
      engine.isOver = true;
      expect(engine.forcePlace(2, 2)).assertFalse();
      expect(engine.stoneCount()).assertEqual(3);
    });

    /** @tc.number SUB_GOBANG_BOARD_2900 @tc.name testBoardLargeSequence0029 @tc.desc A hundred placements keep counters and stone count consistent */
    it('testBoardLargeSequence0029', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let placed: number = 0;
      let side: string = 'A';
      for (let i = 0; i < 10; i++) {
        for (let j = 0; j < 10; j++) {
          if (engine.place(i, j, side)) {
            placed++;
            side = side === 'A' ? 'B' : 'A';
          }
        }
      }
      expect(placed).assertEqual(100);
      expect(engine.step).assertEqual(100);
      expect(engine.stoneCount()).assertEqual(100);
      expect(engine.countColor(BLACK)).assertEqual(50);
      expect(engine.countColor(WHITE)).assertEqual(50);
      expect(engine.fallGather.length).assertEqual(100);
    });

    /** @tc.number SUB_GOBANG_BOARD_3000 @tc.name testBoardAlternatingSequence0030 @tc.desc Two devices alternate turns exactly like the local page loop */
    it('testBoardAlternatingSequence0030', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      let sequence: number[][] = [[7, 7], [7, 8], [8, 7], [8, 8], [9, 7], [9, 8]];
      let expected: string[] = [BLACK, WHITE, BLACK, WHITE, BLACK, WHITE];
      for (let i = 0; i < sequence.length; i++) {
        expect(engine.place(sequence[i][0], sequence[i][1], i % 2 === 0 ? 'A' : 'B')).assertTrue();
        expect(engine.chessMapArr[sequence[i][0]][sequence[i][1]]).assertEqual(expected[i]);
        expect(engine.step).assertEqual(i + 1);
      }
    });

    /** @tc.number SUB_GOBANG_BOARD_3100 @tc.name testBoardGappedFixture0031 @tc.desc The gapped fixture has four stones and one hole in the middle */
    it('testBoardGappedFixture0031', 0, async () => {
      let engine: BoardEngine = gappedBoard(10);
      expect(engine.stoneCount()).assertEqual(4);
      expect(engine.chessMapArr[10][2]).assertEqual(EMPTY);
      expect(engine.chessMapArr[10][0]).assertEqual(BLACK);
      expect(engine.chessMapArr[10][1]).assertEqual(BLACK);
      expect(engine.chessMapArr[10][3]).assertEqual(BLACK);
      expect(engine.chessMapArr[10][4]).assertEqual(BLACK);
      expect(engine.probe(10, 4, [0, 1]).count).assertEqual(2);
    });

    /** @tc.number SUB_GOBANG_BOARD_3200 @tc.name testBoardCornerFixtures0032 @tc.desc Corner and edge fixtures stay inside the board on all four corners */
    it('testBoardCornerFixtures0032', 0, async () => {
      let topLeft: BoardEngine = emptyBoard();
      expect(topLeft.place(0, 0, 'A')).assertTrue();
      let topRight: BoardEngine = emptyBoard();
      expect(topRight.place(0, 14, 'A')).assertTrue();
      let bottomLeft: BoardEngine = emptyBoard();
      expect(bottomLeft.place(14, 0, 'A')).assertTrue();
      let bottomRight: BoardEngine = emptyBoard();
      expect(bottomRight.place(14, 14, 'A')).assertTrue();
      expect(topLeft.place(0, 0, 'B')).assertFalse();
      expect(bottomRight.stoneCount()).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_BOARD_3300 @tc.name testBoardProbeSingle0033 @tc.desc A lone stone probes to a run of one on every axis */
    it('testBoardProbeSingle0033', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      engine.fallChess(7, 7, BLACK);
      for (let i = 0; i < BoardEngine.CHECK_MODE.length; i++) {
        let probe: WinProbe = engine.probe(7, 7, BoardEngine.CHECK_MODE[i]);
        expect(probe.count).assertEqual(1);
        expect(probe.color).assertEqual(BLACK);
        expect(probe.filled).assertTrue();
        expect(probe.reached).assertFalse();
      }
    });

    /** @tc.number SUB_GOBANG_BOARD_3400 @tc.name testBoardProbeEmptyCell0034 @tc.desc An empty cell can never report a winning run even when surrounded */
    it('testBoardProbeEmptyCell0034', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      for (let i = 0; i < 3; i++) {
        engine.fallChess(7, i, BLACK);
        engine.fallChess(7, i + 4, BLACK);
      }
      let probe: WinProbe = engine.probe(7, 3, [0, 1]);
      expect(probe.color).assertEqual(EMPTY);
      expect(probe.filled).assertFalse();
      expect(probe.count).assertEqual(1);
      expect(probe.reached).assertFalse();
      expect(engine.checkWinAt(7, 3)).assertFalse();
    });

    /** @tc.number SUB_GOBANG_BOARD_3500 @tc.name testBoardModeTable0035 @tc.desc The four scan modes are exactly the horizontal, vertical and two diagonals */
    it('testBoardModeTable0035', 0, async () => {
      expect(BoardEngine.CHECK_MODE.length).assertEqual(4);
      expect(BoardEngine.CHECK_MODE[0][0]).assertEqual(1);
      expect(BoardEngine.CHECK_MODE[0][1]).assertEqual(0);
      expect(BoardEngine.CHECK_MODE[1][0]).assertEqual(0);
      expect(BoardEngine.CHECK_MODE[1][1]).assertEqual(1);
      expect(BoardEngine.CHECK_MODE[2][0]).assertEqual(1);
      expect(BoardEngine.CHECK_MODE[2][1]).assertEqual(1);
      expect(BoardEngine.CHECK_MODE[3][0]).assertEqual(1);
      expect(BoardEngine.CHECK_MODE[3][1]).assertEqual(-1);
    });
  });
}
