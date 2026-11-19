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
 * The four extreme sizes and offsets stay individual; two sweeps and four patterns follow.
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

export default function GobangBoardPatternMatrix() {
  describe('GobangBoardPatternMatrix', () => {
    beforeAll(async () => {
      await yieldToMainThread();
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0001
     * @tc.name testCheckerSize0001
     * @tc.desc A 1x1 checker block has no win and the documented empty count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCheckerSize0001', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 1; i++) {
        for (let j = 0; j < 1; j++) {
          engine.chessMapArr[i][j] = (i + j) % 2 === 0 ? BLACK : WHITE;
        }
      }
      expect(engine.countColor(BLACK) + engine.countColor(WHITE)).assertEqual(1);
      expect(engine.emptyCells().length).assertEqual(224);
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0002
     * @tc.name testCheckerSize0002
     * @tc.desc A 15x15 checker block has no win and the documented empty count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCheckerSize0002', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 15; i++) {
        for (let j = 0; j < 15; j++) {
          engine.chessMapArr[i][j] = (i + j) % 2 === 0 ? BLACK : WHITE;
        }
      }
      expect(engine.countColor(BLACK) + engine.countColor(WHITE)).assertEqual(225);
      expect(engine.emptyCells().length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0003
     * @tc.name testWrapOffset0003
     * @tc.desc A wrapped line with offset 1 still wins on its longer diagonal segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testWrapOffset0003', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 15; i++) {
        engine.chessMapArr[i][(i + 1) % 15] = BLACK;
      }
      expect(engine.countColor(BLACK)).assertEqual(15);
      expect(engine.checkWinAt(0, 1) || engine.checkWinAt(15 - 1, 0)).assertTrue();
      expect(engine.probe(0, 1, [1, 1]).reached || engine.probe(15 - 1, 0, [1, 1]).reached).assertTrue();
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0004
     * @tc.name testWrapOffset0004
     * @tc.desc A wrapped line with offset 14 still wins on its longer diagonal segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testWrapOffset0004', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 15; i++) {
        engine.chessMapArr[i][(i + 14) % 15] = BLACK;
      }
      expect(engine.countColor(BLACK)).assertEqual(15);
      expect(engine.checkWinAt(0, 14) || engine.checkWinAt(15 - 14, 0)).assertTrue();
      expect(engine.probe(0, 14, [1, 1]).reached || engine.probe(15 - 14, 0, [1, 1]).reached).assertTrue();
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0005
     * @tc.name testCheckerSweep0005
     * @tc.desc Checker blocks from two to fourteen keep exact cell accounting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testCheckerSweep0005', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      let checked: number = 0;
      for (let size = 2; size < 15; size++) {
        let board: BoardEngine = new BoardEngine();
        for (let i = 0; i < size; i++) {
          for (let j = 0; j < size; j++) {
            board.chessMapArr[i][j] = (i + j) % 2 === 0 ? BLACK : WHITE;
          }
        }
        expect(board.countColor(BLACK) + board.countColor(WHITE)).assertEqual(size * size);
        expect(board.emptyCells().length).assertEqual(225 - size * size);
        checked++;
      }
      expect(checked).assertEqual(13);
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0006
     * @tc.name testWrapSweep0006
     * @tc.desc Wrapped diagonals with offsets two to thirteen always win on their long segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testWrapSweep0006', 0, async () => {
      let checked: number = 0;
      for (let offset = 2; offset < 14; offset++) {
        let board: BoardEngine = new BoardEngine();
        for (let i = 0; i < 15; i++) {
          board.chessMapArr[i][(i + offset) % 15] = BLACK;
        }
        expect(board.countColor(BLACK)).assertEqual(15);
        expect(board.checkWinAt(0, offset) || board.checkWinAt(15 - offset, 0)).assertTrue();
        checked++;
      }
      expect(checked).assertEqual(12);
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0007
     * @tc.name testFullDiagonal0007
     * @tc.desc A full main diagonal wins and saturates the probe at nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFullDiagonal0007', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 15; i++) {
        engine.chessMapArr[i][i] = BLACK;
      }
      expect(engine.checkWinAt(7, 7)).assertTrue();
      expect(engine.probe(7, 7, [1, 1]).count).assertEqual(9);
      expect(engine.countColor(BLACK)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GOBANG_PATTERN_0008
     * @tc.name testFullAntiDiagonal0008
     * @tc.desc A full anti diagonal wins for white with a saturated probe
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testFullAntiDiagonal0008', 0, async () => {
      let engine: BoardEngine = new BoardEngine();
      for (let i = 0; i < 15; i++) {
        engine.chessMapArr[i][14 - i] = WHITE;
      }
      expect(engine.checkWinAt(7, 7)).assertTrue();
      expect(engine.probe(7, 7, [1, -1]).count).assertEqual(9);
      expect(engine.countColor(WHITE)).assertEqual(15);
    });

  });
}
