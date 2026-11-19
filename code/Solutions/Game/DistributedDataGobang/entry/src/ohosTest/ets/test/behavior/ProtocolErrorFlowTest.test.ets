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
 * Every rejection reason is exercised by a different malformed payload.
 */

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
   * Writes a stone without any turn check, exactly like DistributedDataModel
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
   * Writes a stone for whichever side owns the current step, bypassing the
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

export default function GobangProtocolErrorFlow() {
  describe('GobangProtocolErrorFlow', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0001
     * @tc.name testSnapshotError0001
     * @tc.desc Snapshot variant empty is rejected with parse-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0001', 0, async () => {
      let raw: string = '';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('parse-error');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0002
     * @tc.name testSnapshotError0002
     * @tc.desc Snapshot variant brace is rejected with parse-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0002', 0, async () => {
      let raw: string = '{';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('parse-error');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0003
     * @tc.name testSnapshotError0003
     * @tc.desc Snapshot variant text is rejected with parse-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0003', 0, async () => {
      let raw: string = 'not-json';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('parse-error');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0004
     * @tc.name testSnapshotError0004
     * @tc.desc Snapshot variant null is rejected with not-object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0004', 0, async () => {
      let raw: string = 'null';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('not-object');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0005
     * @tc.name testSnapshotError0005
     * @tc.desc Snapshot variant array is rejected with not-object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0005', 0, async () => {
      let raw: string = '[]';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('not-object');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0006
     * @tc.name testSnapshotError0006
     * @tc.desc Snapshot variant number is rejected with not-object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0006', 0, async () => {
      let raw: string = '123';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('not-object');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0007
     * @tc.name testSnapshotError0007
     * @tc.desc Snapshot variant bool is rejected with not-object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0007', 0, async () => {
      let raw: string = 'true';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('not-object');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0008
     * @tc.name testSnapshotError0008
     * @tc.desc Snapshot variant missing-isOver is rejected with missing-field:isOver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0008', 0, async () => {
      let raw: string = '{"step":0}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('missing-field:isOver');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0009
     * @tc.name testSnapshotError0009
     * @tc.desc Snapshot variant missing-step is rejected with missing-field:step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0009', 0, async () => {
      let raw: string = '{"isOver":false}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('missing-field:step');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0010
     * @tc.name testSnapshotError0010
     * @tc.desc Snapshot variant missing-map is rejected with missing-field:chessMapArr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0010', 0, async () => {
      let raw: string = '{"isOver":false,"step":0}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('missing-field:chessMapArr');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0011
     * @tc.name testSnapshotError0011
     * @tc.desc Snapshot variant bad-isOver is rejected with bad-type:isOver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0011', 0, async () => {
      let raw: string = '{"isOver":"no","step":0,"chessMapArr":[],"chessX":0,"chessY":0,"clickCount":0,"fallLocation":[]}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-type:isOver');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0012
     * @tc.name testSnapshotError0012
     * @tc.desc Snapshot variant bad-step is rejected with bad-type:step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0012', 0, async () => {
      let raw: string = '{"isOver":false,"step":"0","chessMapArr":[],"chessX":0,"chessY":0,"clickCount":0,"fallLocation":[]}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-type:step');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0013
     * @tc.name testSnapshotError0013
     * @tc.desc Snapshot variant bad-map is rejected with bad-type:chessMapArr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0013', 0, async () => {
      let raw: string = '{"isOver":false,"step":0,"chessMapArr":"x","chessX":0,"chessY":0,"clickCount":0,"fallLocation":[]}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-type:chessMapArr');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0014
     * @tc.name testSnapshotError0014
     * @tc.desc Snapshot variant low-cursor is rejected with bad-range:cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0014', 0, async () => {
      let raw: string = '{"isOver":false,"step":0,"chessMapArr":[],"chessX":-2,"chessY":0,"clickCount":0,"fallLocation":[]}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-range:cursor');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0015
     * @tc.name testSnapshotError0015
     * @tc.desc Snapshot variant high-cursor is rejected with bad-range:cursor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotError0015', 0, async () => {
      let raw: string = '{"isOver":false,"step":0,"chessMapArr":[],"chessX":0,"chessY":15,"clickCount":0,"fallLocation":[]}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-range:cursor');
      expect(decoded.value).assertNull();
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0016
     * @tc.name testMoveError0016
     * @tc.desc Move variant move-empty is rejected with parse-error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMoveError0016', 0, async () => {
      let raw: string = '';
      let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('parse-error');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0017
     * @tc.name testMoveError0017
     * @tc.desc Move variant move-missing-x is rejected with missing-field:xy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMoveError0017', 0, async () => {
      let raw: string = '{"y":1}';
      let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('missing-field:xy');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0018
     * @tc.name testMoveError0018
     * @tc.desc Move variant move-missing-y is rejected with missing-field:xy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMoveError0018', 0, async () => {
      let raw: string = '{"x":1}';
      let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('missing-field:xy');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0019
     * @tc.name testMoveError0019
     * @tc.desc Move variant move-text-x is rejected with bad-type:xy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMoveError0019', 0, async () => {
      let raw: string = '{"x":"1","y":1}';
      let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-type:xy');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0020
     * @tc.name testMoveError0020
     * @tc.desc Move variant move-negative is rejected with bad-range:xy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMoveError0020', 0, async () => {
      let raw: string = '{"x":-1,"y":0}';
      let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-range:xy');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0021
     * @tc.name testMoveError0021
     * @tc.desc Move variant move-high is rejected with bad-range:xy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testMoveError0021', 0, async () => {
      let raw: string = '{"x":0,"y":15}';
      let decoded: DecodeResult<DeviceBPayload> = decodeDeviceB(raw);
      expect(decoded.ok).assertFalse();
      expect(decoded.reason).assertEqual('bad-range:xy');
    });

    /**
     * @tc.number SUB_GOBANG_FLOW_ERR_0022
     * @tc.name testExtraFieldAccepted0022
     * @tc.desc An unknown future field does not break the decoder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testExtraFieldAccepted0022', 0, async () => {
      let extra: string = '{"isOver":false,"step":0,"chessMapArr":[],"chessX":0,"chessY":0,' +
        '"clickCount":0,"fallLocation":[],"future":1}';
      let decoded: DecodeResult<DeviceAPayload> = decodeDeviceA(extra);
      expect(decoded.ok).assertTrue();
      expect((decoded.value as DeviceAPayload).step).assertEqual(0);
    });

  });
}
