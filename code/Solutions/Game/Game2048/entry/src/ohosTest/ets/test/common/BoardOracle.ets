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

/**
 * Independent reference model of the 2048 board.
 *
 * The production GameRule implementation works line by line: it locates the
 * next non-zero cell, shifts it towards the movement edge and merges equal
 * neighbours. This oracle uses a different algorithm (compact, then merge,
 * then pad) so that the two implementations can be compared against each
 * other without sharing code.
 *
 * All helpers are pure: they never mutate the array handed to them.
 */
export class BoardOracle {
  static readonly SIDE: number = 4;
  static readonly CELLS: number = 16;

  /**
   * Extracts one line of the board in movement order.
   *
   * For 'left' and 'right' the line is a row, for 'up' and 'down' it is a
   * column. 'right' and 'down' return the line reversed, so that the first
   * element of the returned array is always the element nearest the edge the
   * tiles move towards.
   */
  static readLine(values: number[], lineIndex: number, direction: string): number[] {
    let line: number[] = [];
    for (let offset: number = 0; offset < BoardOracle.SIDE; offset++) {
      if (direction === 'left') {
        line.push(values[lineIndex * BoardOracle.SIDE + offset]);
      } else if (direction === 'right') {
        line.push(values[lineIndex * BoardOracle.SIDE + (BoardOracle.SIDE - 1 - offset)]);
      } else if (direction === 'up') {
        line.push(values[offset * BoardOracle.SIDE + lineIndex]);
      } else if (direction === 'down') {
        line.push(values[(BoardOracle.SIDE - 1 - offset) * BoardOracle.SIDE + lineIndex]);
      }
    }
    return line;
  }

  /**
   * Writes one merged line back into the board in movement order.
   */
  static writeLine(values: number[], lineIndex: number, direction: string, line: number[]): void {
    for (let offset: number = 0; offset < BoardOracle.SIDE; offset++) {
      if (direction === 'left') {
        values[lineIndex * BoardOracle.SIDE + offset] = line[offset];
      } else if (direction === 'right') {
        values[lineIndex * BoardOracle.SIDE + (BoardOracle.SIDE - 1 - offset)] = line[offset];
      } else if (direction === 'up') {
        values[offset * BoardOracle.SIDE + lineIndex] = line[offset];
      } else if (direction === 'down') {
        values[(BoardOracle.SIDE - 1 - offset) * BoardOracle.SIDE + lineIndex] = line[offset];
      }
    }
  }

  /**
   * Compacts and merges a single line. Equal neighbours merge once, left to
   * right in movement order; the result is padded with zeros to full length.
   */
  static mergeLine(line: number[]): number[] {
    let compact: number[] = [];
    for (let index: number = 0; index < line.length; index++) {
      if (line[index] !== 0) {
        compact.push(line[index]);
      }
    }
    let merged: number[] = [];
    let cursor: number = 0;
    while (cursor < compact.length) {
      if (cursor + 1 < compact.length && compact[cursor] === compact[cursor + 1]) {
        merged.push(compact[cursor] * 2);
        cursor = cursor + 2;
      } else {
        merged.push(compact[cursor]);
        cursor = cursor + 1;
      }
    }
    while (merged.length < line.length) {
      merged.push(0);
    }
    return merged;
  }

  /**
   * Returns the score produced by merging one line, excluding moves that do
   * not merge. A merge of two cells worth v each contributes 2v.
   */
  static mergeScoreOfLine(line: number[]): number {
    let compact: number[] = [];
    for (let index: number = 0; index < line.length; index++) {
      if (line[index] !== 0) {
        compact.push(line[index]);
      }
    }
    let score: number = 0;
    let cursor: number = 0;
    while (cursor < compact.length) {
      if (cursor + 1 < compact.length && compact[cursor] === compact[cursor + 1]) {
        score = score + compact[cursor] * 2;
        cursor = cursor + 2;
      } else {
        cursor = cursor + 1;
      }
    }
    return score;
  }

  /**
   * Applies one movement to the whole board and returns the new board.
   * Unknown directions leave the board untouched, mirroring the fact that
   * only four direction literals are meaningful.
   */
  static move(values: number[], direction: string): number[] {
    let result: number[] = values.slice();
    if (direction !== 'left' && direction !== 'right' && direction !== 'up' && direction !== 'down') {
      return result;
    }
    for (let lineIndex: number = 0; lineIndex < BoardOracle.SIDE; lineIndex++) {
      let line: number[] = BoardOracle.readLine(result, lineIndex, direction);
      let merged: number[] = BoardOracle.mergeLine(line);
      BoardOracle.writeLine(result, lineIndex, direction, merged);
    }
    return result;
  }

  /**
   * Returns the score a movement would add, computed independently from the
   * production implementation.
   */
  static mergeScore(values: number[], direction: string): number {
    let score: number = 0;
    if (direction !== 'left' && direction !== 'right' && direction !== 'up' && direction !== 'down') {
      return score;
    }
    for (let lineIndex: number = 0; lineIndex < BoardOracle.SIDE; lineIndex++) {
      let line: number[] = BoardOracle.readLine(values, lineIndex, direction);
      score = score + BoardOracle.mergeScoreOfLine(line);
    }
    return score;
  }

  /**
   * Decides whether no movement can change the board any more.
   *
   * The board is over when every cell is occupied and no two orthogonally
   * adjacent cells share the same value. Diagonals are irrelevant.
   */
  static gameOver(values: number[]): boolean {
    for (let row: number = 0; row < BoardOracle.SIDE; row++) {
      for (let column: number = 0; column < BoardOracle.SIDE; column++) {
        let cell: number = row * BoardOracle.SIDE + column;
        if (values[cell] === 0) {
          return false;
        }
        if (column + 1 < BoardOracle.SIDE && values[cell] === values[cell + 1]) {
          return false;
        }
        if (row + 1 < BoardOracle.SIDE && values[cell] === values[cell + BoardOracle.SIDE]) {
          return false;
        }
      }
    }
    return true;
  }

  /**
   * Counts the cells that currently hold a tile.
   */
  static countNonZero(values: number[]): number {
    let count: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      if (values[index] !== 0) {
        count = count + 1;
      }
    }
    return count;
  }

  /**
   * Sums every tile on the board. A movement without merging keeps the sum,
   * while a merge also keeps it (2v is replaced by 4v only when the two
   * contributing tiles are counted together with the score).
   */
  static sum(values: number[]): number {
    let total: number = 0;
    for (let index: number = 0; index < values.length; index++) {
      total = total + values[index];
    }
    return total;
  }

  /**
   * Tells whether a value is a valid 2048 tile (2 raised to some power >= 1).
   */
  static isPowerOfTwo(value: number): boolean {
    if (value < 2) {
      return false;
    }
    let probe: number = value;
    while (probe % 2 === 0) {
      probe = probe / 2;
    }
    return probe === 1;
  }

  /**
   * Tells whether the board still contains an empty cell.
   */
  static hasZero(values: number[]): boolean {
    for (let index: number = 0; index < values.length; index++) {
      if (values[index] === 0) {
        return true;
      }
    }
    return false;
  }

  /**
   * Renders the board as a compact multi-line string for log output.
   */
  static describe(values: number[]): string {
    let text: string = '';
    for (let row: number = 0; row < BoardOracle.SIDE; row++) {
      let line: string = '';
      for (let column: number = 0; column < BoardOracle.SIDE; column++) {
        if (column > 0) {
          line = line + '|';
        }
        line = line + String(values[row * BoardOracle.SIDE + column]);
      }
      if (row > 0) {
        text = text + '/';
      }
      text = text + line;
    }
    return text;
  }
}
