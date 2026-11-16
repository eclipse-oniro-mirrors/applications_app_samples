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

const MODE_ROW: number[] = [0, 1];
const MODE_COL: number[] = [1, 0];
const MODE_DIAG: number[] = [1, 1];
const MODE_ANTI: number[] = [1, -1];

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

export default function winCheckContract() {
  describe('GobangWinCheckContract', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /** @tc.number SUB_GOBANG_WIN_0100 @tc.name testWinHorizontalFive0001 @tc.desc Five black stones in one row end the game */
    it('testWinHorizontalFive0001', 0, async () => {
      let engine: BoardEngine = rowBoard(7, 5, BLACK);
      expect(engine.checkWinAt(7, 4)).assertTrue();
      expect(engine.checkWinAt(7, 0)).assertTrue();
      expect(engine.checkWinAt(7, 2)).assertTrue();
      engine.chessX = 7;
      engine.chessY = 4;
      expect(engine.applyWinCheck()).assertTrue();
      expect(engine.isOver).assertTrue();
    });

    /** @tc.number SUB_GOBANG_WIN_0200 @tc.name testWinFourDoesNotWin0002 @tc.desc Four stones are not enough on any axis */
    it('testWinFourDoesNotWin0002', 0, async () => {
      let horizontal: BoardEngine = rowBoard(4, 4, BLACK);
      expect(horizontal.checkWinAt(4, 3)).assertFalse();
      let vertical: BoardEngine = columnBoard(4, 4, BLACK);
      expect(vertical.checkWinAt(3, 4)).assertFalse();
      let diagonal: BoardEngine = diagonalBoard(2, 4, BLACK);
      expect(diagonal.checkWinAt(5, 5)).assertFalse();
      expect(horizontal.probe(4, 3, MODE_COL).count).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_WIN_0300 @tc.name testWinVerticalFive0003 @tc.desc Five stones in one column end the game */
    it('testWinVerticalFive0003', 0, async () => {
      let engine: BoardEngine = columnBoard(11, 5, BLACK);
      expect(engine.checkWinAt(4, 11)).assertTrue();
      expect(engine.checkWinAt(0, 11)).assertTrue();
      expect(engine.checkWinAt(2, 11)).assertTrue();
      expect(engine.probe(4, 11, MODE_COL).count).assertEqual(5);
      expect(engine.probe(4, 11, MODE_COL).reached).assertTrue();
    });

    /** @tc.number SUB_GOBANG_WIN_0400 @tc.name testWinMainDiagonal0004 @tc.desc Five stones on the main diagonal end the game */
    it('testWinMainDiagonal0004', 0, async () => {
      let engine: BoardEngine = diagonalBoard(3, 5, BLACK);
      expect(engine.checkWinAt(3, 3)).assertTrue();
      expect(engine.checkWinAt(7, 7)).assertTrue();
      expect(engine.probe(5, 5, MODE_DIAG).count).assertEqual(5);
      expect(engine.probe(5, 5, MODE_ROW).count).assertEqual(1);
      expect(engine.probe(5, 5, MODE_COL).count).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_WIN_0500 @tc.name testWinAntiDiagonal0005 @tc.desc Five stones on the anti diagonal end the game */
    it('testWinAntiDiagonal0005', 0, async () => {
      let engine: BoardEngine = antiDiagonalBoard(4, 5, BLACK);
      expect(engine.checkWinAt(14 - 4, 4)).assertTrue();
      expect(engine.checkWinAt(14 - 8, 8)).assertTrue();
      expect(engine.probe(14 - 6, 6, MODE_ANTI).count).assertEqual(5);
      expect(engine.probe(14 - 6, 6, MODE_DIAG).count).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_WIN_0600 @tc.name testWinOverline0006 @tc.desc Six in a row also counts as a win on every axis */
    it('testWinOverline0006', 0, async () => {
      let engine: BoardEngine = rowBoard(9, 6, BLACK);
      expect(engine.checkWinAt(9, 2)).assertTrue();
      expect(engine.probe(9, 2, MODE_ROW).count).assertEqual(6);
      expect(engine.probe(9, 2, MODE_ROW).reached).assertTrue();
      let tall: BoardEngine = columnBoard(2, 6, WHITE);
      expect(tall.checkWinAt(2, 2)).assertTrue();
      expect(tall.probe(2, 2, MODE_COL).count).assertEqual(6);
    });

    /** @tc.number SUB_GOBANG_WIN_0700 @tc.name testWinBlockedByOpponent0007 @tc.desc An opposing stone in the middle splits the run and prevents a win */
    it('testWinBlockedByOpponent0007', 0, async () => {
      let engine: BoardEngine = blockedBoard(5);
      expect(engine.checkWinAt(5, 3)).assertFalse();
      expect(engine.checkWinAt(5, 8)).assertFalse();
      expect(engine.probe(5, 3, MODE_ROW).count).assertEqual(4);
      expect(engine.probe(5, 8, MODE_ROW).count).assertEqual(4);
      expect(engine.chessMapArr[5][4]).assertEqual(WHITE);
    });

    /** @tc.number SUB_GOBANG_WIN_0800 @tc.name testWinGapPrevents0008 @tc.desc A single empty cell inside the run prevents the five count */
    it('testWinGapPrevents0008', 0, async () => {
      let engine: BoardEngine = gappedBoard(2);
      expect(engine.checkWinAt(2, 4)).assertFalse();
      expect(engine.probe(2, 4, MODE_ROW).count).assertEqual(2);
      expect(engine.probe(2, 0, MODE_ROW).count).assertEqual(2);
      expect(engine.stoneCount()).assertEqual(4);
      engine.fallChess(2, 2, BLACK);
      expect(engine.checkWinAt(2, 2)).assertTrue();
      expect(engine.probe(2, 2, MODE_ROW).count).assertEqual(5);
    });

    /** @tc.number SUB_GOBANG_WIN_0900 @tc.name testWinEmptyCellsNeverChain0009 @tc.desc Empty cells never build a run even when they are contiguous */
    it('testWinEmptyCellsNeverChain0009', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      for (let i = 0; i < 10; i++) {
        let probe: WinProbe = engine.probe(6, i, MODE_ROW);
        expect(probe.count).assertEqual(1);
        expect(probe.filled).assertFalse();
        expect(probe.reached).assertFalse();
      }
      expect(engine.checkWinAt(6, 6)).assertFalse();
      expect(engine.checkWinAt(0, 0)).assertFalse();
    });

    /** @tc.number SUB_GOBANG_WIN_1000 @tc.name testWinBoundaryRun0010 @tc.desc Runs that touch the board edge still win and never read out of range */
    it('testWinBoundaryRun0010', 0, async () => {
      let top: BoardEngine = rowBoard(0, 5, BLACK);
      expect(top.checkWinAt(0, 0)).assertTrue();
      let bottom: BoardEngine = rowBoard(14, 5, BLACK);
      expect(bottom.checkWinAt(14, 4)).assertTrue();
      let left: BoardEngine = columnBoard(0, 5, BLACK);
      expect(left.checkWinAt(0, 0)).assertTrue();
      let right: BoardEngine = columnBoard(14, 5, BLACK);
      expect(right.checkWinAt(4, 14)).assertTrue();
    });

    /** @tc.number SUB_GOBANG_WIN_1100 @tc.name testWinEveryPositionInRun0011 @tc.desc Every stone of a winning run reports the same five count */
    it('testWinEveryPositionInRun0011', 0, async () => {
      let engine: BoardEngine = rowBoard(6, 5, BLACK);
      for (let i = 0; i < 5; i++) {
        let probe: WinProbe = engine.probe(6, i, MODE_ROW);
        expect(probe.count).assertEqual(5);
        expect(probe.reached).assertTrue();
        expect(probe.color).assertEqual(BLACK);
      }
      expect(engine.probe(6, 5, MODE_ROW).count).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_WIN_1200 @tc.name testWinAllHorizontalStarts0012 @tc.desc A five run wins from all eleven legal starting columns */
    it('testWinAllHorizontalStarts0012', 0, async () => {
      for (let start = 0; start <= BOARD_SIZE - WIN_LENGTH; start++) {
        let engine: BoardEngine = emptyBoard();
        for (let i = 0; i < WIN_LENGTH; i++) {
          engine.fallChess(7, start + i, BLACK);
        }
        expect(engine.checkWinAt(7, start)).assertTrue();
        expect(engine.probe(7, start + 2, MODE_ROW).count).assertEqual(5);
      }
    });

    /** @tc.number SUB_GOBANG_WIN_1300 @tc.name testWinAllVerticalStarts0013 @tc.desc A vertical five run wins from all eleven legal starting rows */
    it('testWinAllVerticalStarts0013', 0, async () => {
      for (let start = 0; start <= BOARD_SIZE - WIN_LENGTH; start++) {
        let engine: BoardEngine = emptyBoard();
        for (let i = 0; i < WIN_LENGTH; i++) {
          engine.fallChess(start + i, 3, WHITE);
        }
        expect(engine.checkWinAt(start, 3)).assertTrue();
        expect(engine.probe(start + 2, 3, MODE_COL).count).assertEqual(5);
      }
    });

    /** @tc.number SUB_GOBANG_WIN_1400 @tc.name testWinAllDiagonalStarts0014 @tc.desc A diagonal five run wins from all eleven legal starting offsets */
    it('testWinAllDiagonalStarts0014', 0, async () => {
      for (let start = 0; start <= BOARD_SIZE - WIN_LENGTH; start++) {
        let engine: BoardEngine = emptyBoard();
        for (let i = 0; i < WIN_LENGTH; i++) {
          engine.fallChess(start + i, start + i, BLACK);
        }
        expect(engine.checkWinAt(start + 1, start + 1)).assertTrue();
        expect(engine.probe(start + 2, start + 2, MODE_DIAG).count).assertEqual(5);
      }
    });

    /** @tc.number SUB_GOBANG_WIN_1500 @tc.name testWinAllAntiDiagonalStarts0015 @tc.desc An anti diagonal five run wins from all eleven legal starting offsets */
    it('testWinAllAntiDiagonalStarts0015', 0, async () => {
      for (let start = 0; start <= BOARD_SIZE - WIN_LENGTH; start++) {
        let engine: BoardEngine = emptyBoard();
        for (let i = 0; i < WIN_LENGTH; i++) {
          engine.fallChess(BOARD_SIZE - 1 - (start + i), start + i, BLACK);
        }
        expect(engine.checkWinAt(BOARD_SIZE - 1 - start, start)).assertTrue();
        expect(engine.probe(BOARD_SIZE - 1 - (start + 2), start + 2, MODE_ANTI).count).assertEqual(5);
      }
    });

    /** @tc.number SUB_GOBANG_WIN_1600 @tc.name testWinWhiteColour0016 @tc.desc White wins with exactly the same geometry as black */
    it('testWinWhiteColour0016', 0, async () => {
      let engine: BoardEngine = rowBoard(12, 5, WHITE);
      expect(engine.checkWinAt(12, 4)).assertTrue();
      expect(engine.probe(12, 4, MODE_ROW).color).assertEqual(WHITE);
      expect(engine.probe(12, 4, MODE_ROW).count).assertEqual(5);
      let diagonal: BoardEngine = diagonalBoard(0, 5, WHITE);
      expect(diagonal.checkWinAt(4, 4)).assertTrue();
      expect(diagonal.probe(4, 4, MODE_DIAG).color).assertEqual(WHITE);
    });

    /** @tc.number SUB_GOBANG_WIN_1700 @tc.name testWinCrossDoubleAxis0017 @tc.desc A cross has two winning axes and reports the same win either way */
    it('testWinCrossDoubleAxis0017', 0, async () => {
      let engine: BoardEngine = crossBoard();
      expect(engine.checkWinAt(7, 7)).assertTrue();
      expect(engine.probe(7, 7, MODE_ROW).count).assertEqual(5);
      expect(engine.probe(7, 7, MODE_COL).count).assertEqual(5);
      expect(engine.probe(7, 7, MODE_DIAG).count).assertEqual(1);
      expect(engine.probe(7, 7, MODE_ANTI).count).assertEqual(1);
    });

    /** @tc.number SUB_GOBANG_WIN_1800 @tc.name testWinInterleavedNoWin0018 @tc.desc Alternating colours never produce a run longer than one */
    it('testWinInterleavedNoWin0018', 0, async () => {
      let engine: BoardEngine = interleavedBoard(1);
      for (let i = 0; i < 10; i++) {
        expect(engine.probe(1, i, MODE_ROW).count).assertEqual(1);
        expect(engine.checkWinAt(1, i)).assertFalse();
      }
      expect(engine.countColor(BLACK)).assertEqual(5);
      expect(engine.countColor(WHITE)).assertEqual(5);
    });

    /** @tc.number SUB_GOBANG_WIN_1900 @tc.name testCheckerboardDiagonal0019 @tc.desc A fully covered checkerboard wins on the monochrome diagonals only */
    it('testCheckerboardDiagonal0019', 0, async () => {
      let engine: BoardEngine = fullBoard();
      expect(engine.checkWinAt(7, 7)).assertTrue();
      expect(engine.probe(7, 7, MODE_DIAG).count).assertEqual(9);
      expect(engine.probe(7, 7, MODE_ROW).count).assertEqual(1);
      expect(engine.probe(7, 7, MODE_COL).count).assertEqual(1);
      expect(engine.stoneCount()).assertEqual(225);
    });

    /** @tc.number SUB_GOBANG_WIN_2000 @tc.name testWinApplyIsSticky0020 @tc.desc Once applyWinCheck flips isOver, later calls keep it true */
    it('testWinApplyIsSticky0020', 0, async () => {
      let engine: BoardEngine = rowBoard(13, 5, BLACK);
      engine.chessX = 13;
      engine.chessY = 0;
      expect(engine.applyWinCheck()).assertTrue();
      expect(engine.isOver).assertTrue();
      expect(engine.applyWinCheck()).assertTrue();
      engine.clearColor(BLACK);
      expect(engine.isOver).assertTrue();
    });

    /** @tc.number SUB_GOBANG_WIN_2100 @tc.name testWinCursorGuard0021 @tc.desc Cursor values outside the board short circuit the win check */
    it('testWinCursorGuard0021', 0, async () => {
      let engine: BoardEngine = rowBoard(6, 5, BLACK);
      engine.chessX = -1;
      engine.chessY = -1;
      expect(engine.applyWinCheck()).assertFalse();
      expect(engine.isOver).assertFalse();
      engine.chessX = 15;
      engine.chessY = 0;
      expect(engine.applyWinCheck()).assertFalse();
      engine.chessX = 6;
      engine.chessY = 2;
      expect(engine.applyWinCheck()).assertTrue();
    });

    /** @tc.number SUB_GOBANG_WIN_2200 @tc.name testWinProbeOutOfRange0022 @tc.desc Probing out of range returns a zero count instead of throwing */
    it('testWinProbeOutOfRange0022', 0, async () => {
      let engine: BoardEngine = rowBoard(6, 5, BLACK);
      let outside: WinProbe = engine.probe(-1, 0, MODE_ROW);
      expect(outside.count).assertEqual(0);
      expect(outside.reached).assertFalse();
      expect(engine.probe(0, 15, MODE_COL).count).assertEqual(0);
      expect(engine.checkWinAt(-1, 0)).assertFalse();
      expect(engine.checkWinAt(0, 15)).assertFalse();
    });

    /** @tc.number SUB_GOBANG_WIN_2300 @tc.name testWinCountAsymmetry0023 @tc.desc The probe counts both directions, so a middle stone sees the full run */
    it('testWinCountAsymmetry0023', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      engine.fallChess(7, 5, BLACK);
      engine.fallChess(7, 6, BLACK);
      engine.fallChess(7, 7, BLACK);
      expect(engine.probe(7, 6, MODE_ROW).count).assertEqual(3);
      expect(engine.probe(7, 5, MODE_ROW).count).assertEqual(3);
      expect(engine.probe(7, 7, MODE_ROW).count).assertEqual(3);
      engine.fallChess(7, 4, BLACK);
      engine.fallChess(7, 8, BLACK);
      expect(engine.probe(7, 6, MODE_ROW).count).assertEqual(5);
    });

    /** @tc.number SUB_GOBANG_WIN_2400 @tc.name testWinTwoSeparateRuns0024 @tc.desc Two independent four runs combine only after the gap is filled */
    it('testWinTwoSeparateRuns0024', 0, async () => {
      let engine: BoardEngine = emptyBoard();
      for (let i = 0; i < 4; i++) {
        engine.fallChess(2, i, BLACK);
      }
      for (let i = 6; i < 10; i++) {
        engine.fallChess(2, i, BLACK);
      }
      expect(engine.checkWinAt(2, 3)).assertFalse();
      expect(engine.checkWinAt(2, 9)).assertFalse();
      expect(engine.probe(2, 3, MODE_ROW).count).assertEqual(4);
      engine.fallChess(2, 4, BLACK);
      expect(engine.checkWinAt(2, 4)).assertTrue();
      expect(engine.probe(2, 4, MODE_ROW).count).assertEqual(5);
      engine.fallChess(2, 5, BLACK);
      expect(engine.checkWinAt(2, 5)).assertTrue();
    });
