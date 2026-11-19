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

import hilog from '@ohos.hilog';
import { expect } from '@ohos/hypium';
import { GameRule } from '../../../../main/ets/model/GameRule';
import { DataType } from '../../../../main/ets/model/GameModuel';
import { BoardOracle } from './BoardOracle';

/** hilog domain shared by the whole Game2048 device test package. */
export const DOMAIN: number = 0xF811;
/** hilog tag shared by the whole Game2048 device test package. */
export const TEST_TAG: string = '[Sample_Game2048]';
/** Side length of the board, fixed by the production GameRule. */
export const SIDE: number = 4;
/** Number of cells on the board. */
export const CELLS: number = 16;
/** Direction literal understood by GameRule.move and GameRule.moveInRow. */
export const DIR_LEFT: string = 'left';
/** Direction literal understood by GameRule.move and GameRule.moveInRow. */
export const DIR_RIGHT: string = 'right';
/** Direction literal understood by GameRule.move and GameRule.moveInRow. */
export const DIR_UP: string = 'up';
/** Direction literal understood by GameRule.move and GameRule.moveInRow. */
export const DIR_DOWN: string = 'down';
/** The two values the production randomNum is allowed to spawn. */
export const SPAWN_VALUES: number[] = [2, 4];
/** Index of the first cell of a board array. */
export const FIRST_CELL: number = 0;
/** Index of the last cell of a board array. */
export const LAST_CELL: number = 15;

/**
 * Shared helpers for every Game2048 suite.
 *
 * The factory helpers build boards of exactly sixteen cells because the
 * production GameRule reads a fixed 4x4 layout. The assertion helpers encode
 * the two post-move contracts:
 *   1. a deterministic line move (moveInRow) must match the oracle exactly;
 *   2. a whole-board move (move) may additionally spawn one tile worth 2 or 4
 *      on a cell the oracle left empty.
 */
export class BoardKit {
  /**
   * Writes one structured line to hilog under the shared test tag.
   * Message text must stay in English so that logs are grep friendly.
   */
  static log(caseName: string, message: string): void {
    hilog.info(DOMAIN, TEST_TAG, '%{public}s', caseName + ' | ' + message);
  }

  /**
   * Writes a warning line to hilog, used when a case tolerates a variation.
   */
  static warn(caseName: string, message: string): void {
    hilog.warn(DOMAIN, TEST_TAG, '%{public}s', caseName + ' | ' + message);
  }

  /**
   * Builds the DataType list expected by the GameRule constructor.
   * Ids are assigned in ascending order and carry no game meaning.
   */
  static data(values: number[]): DataType[] {
    let list: DataType[] = [];
    for (let index: number = 0; index < values.length; index++) {
      list.push(new DataType(index, values[index]));
    }
    return list;
  }

  /**
   * Builds DataType entries whose ids are taken from a caller supplied list.
   * Used to prove that ids are ignored by the game logic.
   */
  static dataWithIds(ids: number[], values: number[]): DataType[] {
    let list: DataType[] = [];
    for (let index: number = 0; index < values.length; index++) {
      list.push(new DataType(ids[index], values[index]));
    }
    return list;
  }

  /**
   * Creates a GameRule already seeded with the given sixteen cell values.
   */
  static rule(values: number[]): GameRule {
    return new GameRule(BoardKit.data(values));
  }

  /**
   * Creates a GameRule from explicit DataType instances.
   */
  static ruleOf(list: DataType[]): GameRule {
    return new GameRule(list);
  }

  /**
   * Returns a defensive copy of the live board so that a case can keep both
   * the pre-move and the post-move state for later assertions.
   */
  static valuesOf(rule: GameRule): number[] {
    return rule.dataNumbers.slice();
  }

  /**
   * Returns an array of the requested length filled with zeros.
   */
  static zeros(count: number): number[] {
    let values: number[] = [];
    for (let index: number = 0; index < count; index++) {
      values.push(0);
    }
    return values;
  }

  /**
   * Returns a fresh empty 4x4 board.
   */
  static blank(): number[] {
    return BoardKit.zeros(CELLS);
  }

  /**
   * Builds a board whose first row is the supplied line and whose remaining
   * rows are empty.
   */
  static row(values: number[]): number[] {
    let board: number[] = BoardKit.blank();
    for (let index: number = 0; index < values.length && index < SIDE; index++) {
      board[index] = values[index];
    }
    return board;
  }

  /**
   * Builds a board whose first column is the supplied line and whose
   * remaining columns are empty.
   */
  static column(values: number[]): number[] {
    let board: number[] = BoardKit.blank();
    for (let index: number = 0; index < values.length && index < SIDE; index++) {
      board[index * SIDE] = values[index];
    }
    return board;
  }

  /**
   * Flattens a row-major 4x4 matrix into a board array.
   */
  static rows(rows: number[][]): number[] {
    let board: number[] = [];
    for (let row: number = 0; row < SIDE; row++) {
      for (let column: number = 0; column < SIDE; column++) {
        board.push(rows[row][column]);
      }
    }
    return board;
  }

  /**
   * Returns a new board with one row replaced. The source board is untouched.
   */
  static withRow(board: number[], rowIndex: number, values: number[]): number[] {
    let result: number[] = board.slice();
    for (let column: number = 0; column < SIDE; column++) {
      result[rowIndex * SIDE + column] = values[column];
    }
    return result;
  }

  /**
   * Returns a new board with one column replaced. The source board is untouched.
   */
  static withColumn(board: number[], columnIndex: number, values: number[]): number[] {
    let result: number[] = board.slice();
    for (let row: number = 0; row < SIDE; row++) {
      result[row * SIDE + columnIndex] = values[row];
    }
    return result;
  }

  /**
   * Repeats one line four times, producing a board whose rows are identical.
   */
  static repeatedRow(values: number[]): number[] {
    let board: number[] = [];
    for (let row: number = 0; row < SIDE; row++) {
      for (let column: number = 0; column < SIDE; column++) {
        board.push(values[column]);
      }
    }
    return board;
  }

  /**
   * Repeats one line four times, producing a board whose columns are identical.
   */
  static repeatedColumn(values: number[]): number[] {
    let board: number[] = [];
    for (let row: number = 0; row < SIDE; row++) {
      for (let column: number = 0; column < SIDE; column++) {
        board.push(values[row]);
      }
    }
    return board;
  }

  /**
   * A fully occupied board with no merge available in any direction.
   * This is the smallest canonical "game over" board.
   */
  static overBoard(): number[] {
    let board: number[] = [];
    for (let row: number = 0; row < SIDE; row++) {
      for (let column: number = 0; column < SIDE; column++) {
        board.push((row + column) % 2 === 0 ? 2 : 4);
      }
    }
    return board;
  }

  /**
   * A fully occupied board with a single horizontal merge available on the
   * last row.
   */
  static horizontalPairBoard(): number[] {
    let board: number[] = BoardKit.overBoard();
    board[12] = 8;
    board[13] = 8;
    return board;
  }

  /**
   * A fully occupied board with a single vertical merge available in the last
   * column pair of rows two and three.
   */
  static verticalPairBoard(): number[] {
    let board: number[] = BoardKit.overBoard();
    board[8] = 16;
    board[12] = 16;
    return board;
  }

  /**
   * Counts the occupied cells of a board.
   */
  static countNonZero(values: number[]): number {
    return BoardOracle.countNonZero(values);
  }

  /**
   * Sums every tile of a board.
   */
  static sum(values: number[]): number {
    return BoardOracle.sum(values);
  }

  /**
   * Lists every cell index that holds the requested value.
   */
  static positionsOf(values: number[], target: number): number[] {
    let positions: number[] = [];
    for (let index: number = 0; index < values.length; index++) {
      if (values[index] === target) {
        positions.push(index);
      }
    }
    return positions;
  }

  /**
   * Lists every cell index that holds a zero.
   */
  static zeroPositions(values: number[]): number[] {
    return BoardKit.positionsOf(values, 0);
  }

  /**
   * Extracts one row as a four element array.
   */
  static rowOf(values: number[], rowIndex: number): number[] {
    let line: number[] = [];
    for (let column: number = 0; column < SIDE; column++) {
      line.push(values[rowIndex * SIDE + column]);
    }
    return line;
  }

  /**
   * Extracts one column as a four element array, top to bottom.
   */
  static columnOf(values: number[], columnIndex: number): number[] {
    let line: number[] = [];
    for (let row: number = 0; row < SIDE; row++) {
      line.push(values[row * SIDE + columnIndex]);
    }
    return line;
  }

  /**
   * Finds the only cell whose value differs between two boards.
   * Returns -1 when the boards are identical or when more than one cell
   * differs, so that callers can distinguish the two situations.
   */
  static singleDifference(before: number[], after: number[]): number {
    let found: number = -1;
    let differences: number = 0;
    for (let index: number = 0; index < before.length && index < after.length; index++) {
      if (before[index] !== after[index]) {
        differences = differences + 1;
        found = index;
      }
    }
    return differences === 1 ? found : -1;
  }

  /**
   * Renders a board as a stable single-line string.
   */
  static describe(values: number[]): string {
    return BoardOracle.describe(values);
  }

  /**
   * Logs a board with its case name.
   */
  static logBoard(caseName: string, values: number[]): void {
    BoardKit.log(caseName, BoardKit.describe(values));
  }

  /**
   * Asserts two number arrays have equal length and equal cells.
   */
  static expectValues(actual: number[], expected: number[]): void {
    expect(actual.length).assertEqual(expected.length);
    for (let index: number = 0; index < expected.length; index++) {
      expect(actual[index]).assertEqual(expected[index]);
    }
  }

  /**
   * Asserts a rule's live board equals the expected cells exactly.
   */
  static expectBoard(rule: GameRule, expected: number[]): void {
    BoardKit.expectValues(rule.dataNumbers, expected);
  }

  /**
   * Asserts a rule's live board equals the expected cells exactly and the
   * board is still sixteen cells long.
   */
  static expectFullBoard(rule: GameRule, expected: number[]): void {
    expect(rule.dataNumbers.length).assertEqual(CELLS);
    BoardKit.expectValues(rule.dataNumbers, expected);
  }

  /**
   * Asserts a rule's score.
   */
  static expectScore(rule: GameRule, expected: number): void {
    expect(rule.score).assertEqual(expected);
  }

  /**
   * Asserts a rule's status.
   */
  static expectStatus(rule: GameRule, expected: number): void {
    expect(rule.status).assertEqual(expected);
  }

  /**
   * Asserts every cell of the board belongs to the allowed tile set.
   */
  static expectTileSet(values: number[], allowed: number[]): void {
    for (let index: number = 0; index < values.length; index++) {
      let legal: boolean = false;
      for (let candidate: number = 0; candidate < allowed.length; candidate++) {
        if (values[index] === allowed[candidate]) {
          legal = true;
        }
      }
      if (!legal) {
        BoardKit.warn('expectTileSet', 'cell ' + index + ' holds ' + values[index]);
      }
      expect(legal).assertTrue();
    }
  }

  /**
   * Asserts a board contains only zeros.
   */
  static expectAllZeros(values: number[]): void {
    for (let index: number = 0; index < values.length; index++) {
      expect(values[index]).assertEqual(0);
    }
  }

  /**
   * Asserts a board contains no zero cell.
   */
  static expectNoZero(values: number[]): void {
    for (let index: number = 0; index < values.length; index++) {
      expect(values[index] !== 0).assertTrue();
    }
  }

  /**
   * Asserts that a whole-board move produced exactly the oracle result.
   * Use this only for moves that did not change the board, because a changed
   * move spawns one random tile.
   */
  static expectMoveWithoutSpawn(before: number[], after: number[], direction: string): void {
    BoardKit.expectValues(after, BoardOracle.move(before, direction));
  }

  /**
   * Asserts the contract of a changed whole-board move:
   *   - every cell matches the oracle, except
   *   - exactly one oracle-zero cell may now hold a 2 or a 4.
   * When the oracle result has no zero cell at all, no spawn may happen.
   */
  static expectChangedMove(before: number[], after: number[], direction: string): void {
    let expected: number[] = BoardOracle.move(before, direction);
    let differences: number = 0;
    let expectedZeros: number = 0;
    let legal: boolean = true;
    for (let index: number = 0; index < CELLS; index++) {
      if (expected[index] === 0) {
        expectedZeros = expectedZeros + 1;
      }
      if (after[index] !== expected[index]) {
        differences = differences + 1;
        if (expected[index] !== 0) {
          legal = false;
          BoardKit.warn('expectChangedMove', 'oracle cell ' + index + ' was not zero');
        }
        if (after[index] !== 2 && after[index] !== 4) {
          legal = false;
          BoardKit.warn('expectChangedMove', 'spawned value at ' + index + ' is ' + after[index]);
        }
      }
    }
    expect(legal).assertTrue();
    if (expectedZeros > 0) {
      expect(differences).assertEqual(1);
    } else {
      expect(differences).assertEqual(0);
    }
  }

  /**
   * Asserts a board pair differs in exactly one spawned tile: the cell was
   * empty before and now holds 2 or 4.
   */
  static expectSingleSpawn(before: number[], after: number[]): void {
    let difference: number = BoardKit.singleDifference(before, after);
    expect(difference >= 0).assertTrue();
    if (difference >= 0) {
      expect(before[difference]).assertEqual(0);
      let spawned: number = after[difference];
      expect(spawned === 2 || spawned === 4).assertTrue();
    }
  }

  /**
   * Asserts a board pair is identical, i.e. no spawn happened.
   */
  static expectNoSpawn(before: number[], after: number[]): void {
    BoardKit.expectValues(after, before);
  }

  /**
   * Asserts the oracle agrees that the board is over.
   */
  static expectOracleOver(values: number[], expected: boolean): void {
    expect(BoardOracle.gameOver(values)).assertEqual(expected);
  }

  /**
   * Asserts the live rule board agrees with the oracle game-over verdict and
   * with the caller supplied verdict.
   */
  static expectGameOver(rule: GameRule, expected: boolean): void {
    expect(BoardOracle.gameOver(rule.dataNumbers)).assertEqual(expected);
    expect(rule.isGameOver()).assertEqual(expected);
  }

  /**
   * Asserts the sum of a board is preserved by a line move that does not
   * merge into new values outside the board.
   */
  static expectSumPreserved(before: number[], after: number[]): void {
    expect(BoardKit.sum(after)).assertEqual(BoardKit.sum(before));
  }

  /**
   * Asserts the number of occupied cells after a line move equals the number
   * before minus one per merge plus the spawned tile (if any).
   */
  static expectOccupancy(before: number[], after: number[], merges: number, spawned: number): void {
    let expected: number = BoardKit.countNonZero(before) - merges + spawned;
    expect(BoardKit.countNonZero(after)).assertEqual(expected);
  }
}
