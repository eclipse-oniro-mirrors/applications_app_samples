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
 * Edge cells stay individual; the interior is one fill sweep plus eleven state axes.
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

export default function boardCellMatrix() {
  describe('GobangBoardCellMatrix', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0100
     * @tc.name testCornerCells0001
     * @tc.desc Each corner accepts one stone and restores empty on undo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCornerCells0001', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      let corners: number[][] = [[0, 0], [0, 14], [14, 0], [14, 14]];
      for (let i = 0; i < corners.length; i++) {
        expect(engine.forcePlace(corners[i][0], corners[i][1])).assertTrue();
        expect(engine.forcePlace(corners[i][0], corners[i][1])).assertFalse();
      }
      expect(engine.stoneCount()).assertEqual(4);
      for (let i = 0; i < corners.length; i++) { expect(engine.undo()).assertTrue(); }
      expect(engine.stoneCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0200
     * @tc.name testInteriorFill0002
     * @tc.desc Filling every interior cell keeps the counters aligned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testInteriorFill0002', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      let placed: number = 0;
      for (let x = 1; x < 14; x++) { for (let y = 1; y < 14; y++) { if (engine.forcePlace(x, y)) placed++; } }
      expect(placed).assertEqual(169);
      expect(engine.countColor(BLACK)).assertEqual(85);
      expect(engine.countColor(WHITE)).assertEqual(84);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0300
     * @tc.name testColumnFill0003
     * @tc.desc A full column alternates colour and reports fifteen occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testColumnFill0003', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let x = 0; x < 15; x++) { engine.forcePlace(x, 7); }
      expect(engine.stoneCount()).assertEqual(15);
      expect(engine.countColor(BLACK)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0400
     * @tc.name testRowFill0004
     * @tc.desc A full row records the newest coordinate first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRowFill0004', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let y = 0; y < 15; y++) { engine.forcePlace(11, y); }
      expect(engine.fallGather[0][0]).assertEqual(11);
      expect(engine.fallGather[0][1]).assertEqual(14);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0500
     * @tc.name testDiagonalUndo0005
     * @tc.desc Undo removes only the diagonal head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testDiagonalUndo0005', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 10; i++) { engine.forcePlace(i, i); }
      expect(engine.undo()).assertTrue();
      expect(engine.chessMapArr[9][9]).assertEqual(EMPTY);
      expect(engine.step).assertEqual(9);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0600
     * @tc.name testColourClear0006
     * @tc.desc Clearing black leaves the white stones untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testColourClear0006', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let y = 0; y < 10; y++) { engine.forcePlace(3, y); }
      expect(engine.clearColor(BLACK)).assertEqual(5);
      expect(engine.countColor(WHITE)).assertEqual(5);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0700
     * @tc.name testRestartResidue0007
     * @tc.desc Restart clears stones, step, clicks and history together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRestartResidue0007', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 20; i++) { engine.forcePlace(i % 15, i % 9); }
      engine.clickCount = 7; engine.restart();
      expect(engine.stoneCount()).assertEqual(0);
      expect(engine.clickCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0800
     * @tc.name testFullChecker0008
     * @tc.desc A checker filled board is full with an exact split
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFullChecker0008', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let x = 0; x < 15; x++) { for (let y = 0; y < 15; y++) { engine.chessMapArr[x][y] = (x + y) % 2 === 0 ? BLACK : WHITE; } }
      expect(engine.countColor(BLACK)).assertEqual(113);
      expect(engine.countColor(WHITE)).assertEqual(112);
      expect(engine.isFull()).assertTrue();
    });

    /**
     * @tc.number SUB_GOBANG_CELL_0900
     * @tc.name testSnapshotDetached0009
     * @tc.desc Editing a snapshot never mutates the live board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSnapshotDetached0009', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      engine.forcePlace(4, 4);
      let snapshot: BoardSnapshot = engine.snapshot();
      snapshot.chessMapArr[4][4] = EMPTY;
      expect(engine.chessMapArr[4][4]).assertEqual(BLACK);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_1000
     * @tc.name testCountInvariant0010
     * @tc.desc After thirty placements the colour census sums to the stone count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCountInvariant0010', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 30; i++) { engine.forcePlace(i % 15, Math.floor(i / 15)); }
      expect(engine.countColor(BLACK) + engine.countColor(WHITE)).assertEqual(30);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_1100
     * @tc.name testRepeatedPlace0011
     * @tc.desc Repeated placement never grows the board or history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testRepeatedPlace0011', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      expect(engine.forcePlace(6, 6)).assertTrue();
      expect(engine.forcePlace(6, 6)).assertFalse();
      expect(engine.fallGather.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GOBANG_CELL_1200
     * @tc.name testGameOverFreezes0012
     * @tc.desc A finished game refuses every mutating placement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testGameOverFreezes0012', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      engine.isOver = true;
      expect(engine.forcePlace(2, 2)).assertFalse();
      expect(engine.place(3, 3, 'A')).assertFalse();
    });

  });
}
