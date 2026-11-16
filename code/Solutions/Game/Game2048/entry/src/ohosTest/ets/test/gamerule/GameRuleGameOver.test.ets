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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GameRule } from '../../../../main/ets/model/GameRule';
import { BoardKit, CELLS, SIDE, DIR_LEFT } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Number of rows and columns of the fixed 4x4 board. */
const SIDE_LENGTH: number = SIDE;
/** Status value that marks a rule which has not been started yet. */
const STATUS_BEFORE: number = -1;
/** Status value that marks a rule whose board is being played. */
const STATUS_RUNNING: number = 1;
/** Number of tiles the production init spawns on a fresh board. */
const INIT_TILE_COUNT: number = 2;

/**
 * Returns the index of the first cell holding the requested value, or null
 * when no cell holds it. A null answer on an occupied board is the positive
 * proof that the board really has no empty cell, instead of merely lacking a
 * neighbour pair.
 */
function firstCellWith(values: number[], target: number): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return null;
}

/**
 * Counts horizontally adjacent cells that hold the same value. The count is
 * used to prove that a board declared over carries no movable pair at all,
 * and that a board declared playable fails for exactly one known reason.
 */
function countHorizontalPairs(values: number[]): number {
  let pairs: number = 0;
  for (let row: number = 0; row < SIDE_LENGTH; row++) {
    for (let column: number = 0; column < SIDE_LENGTH - 1; column++) {
      if (values[row * SIDE_LENGTH + column] === values[row * SIDE_LENGTH + column + 1]) {
        pairs = pairs + 1;
      }
    }
  }
  return pairs;
}

/**
 * Counts vertically adjacent cells that hold the same value. Diagonally
 * adjacent cells are never counted, which is the whole point of this helper:
 * equal corners must not be mistaken for a legal move.
 */
function countVerticalPairs(values: number[]): number {
  let pairs: number = 0;
  for (let row: number = 0; row < SIDE_LENGTH - 1; row++) {
    for (let column: number = 0; column < SIDE_LENGTH; column++) {
      if (values[row * SIDE_LENGTH + column] === values[(row + 1) * SIDE_LENGTH + column]) {
        pairs = pairs + 1;
      }
    }
  }
  return pairs;
}

/**
 * A fully occupied board whose sixteen tiles are all different. Because no two
 * cells share a value, this board is a clean canvas for injecting exactly one
 * horizontal or vertical pair without creating a second one by accident.
 */
function distinctBoard(): number[] {
  return BoardKit.rows([
    [2, 4, 8, 16],
    [32, 64, 128, 256],
    [512, 1024, 2048, 4096],
    [8192, 16384, 32768, 65536]
  ]);
}

/** A fully occupied board whose every row is the previous row rotated left. */
function cyclicBoard(): number[] {
  return BoardKit.rows([
    [2, 4, 8, 16],
    [4, 8, 16, 2],
    [8, 16, 2, 4],
    [16, 2, 4, 8]
  ]);
}

/** A fully occupied board whose main and anti diagonals are both constant. */
function doubleDiagonalBoard(): number[] {
  return BoardKit.rows([
    [2, 4, 8, 16],
    [8, 2, 16, 4],
    [4, 16, 2, 8],
    [16, 8, 4, 2]
  ]);
}

/** A fully occupied board whose anti diagonal is constant and whose other
 * diagonals are not. */
function antiDiagonalBoard(): number[] {
  return BoardKit.rows([
    [2, 4, 8, 16],
    [4, 8, 16, 2],
    [8, 16, 4, 8],
    [16, 2, 8, 4]
  ]);
}

/** A fully occupied board whose four corners all hold the value two. */
function cornerBoard(): number[] {
  return BoardKit.rows([
    [2, 4, 8, 2],
    [4, 8, 4, 8],
    [8, 4, 8, 4],
    [2, 8, 4, 2]
  ]);
}

/**
 * GameRule.isGameOver 测试套件。
 *
 * 生产判定依次检查：任一格为 0 即可继续；任一水平相邻相等即可合并；任一垂直
 * 相邻相等即可合并；三者都不成立才报告结束。对角相邻相等不构成合法移动，因此
 * 两个相等的对角格必须仍然判为结束。本套件只覆盖这一判定，不修改任何其它行为，
 * 并以 BoardOracle.gameOver 作为独立参考实现做交叉比对。
 */
export default function gameRuleGameOverTest() {
  describe('gameRuleGameOverTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleGameOverTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleGameOverTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0100
     * @tc.name gameOverBlankBoardIsNotOver0100
     * @tc.desc Verify a board of sixteen zeros is playable because every cell is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_blankBoardIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_blankBoardIsNotOver', values);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.expectOracleOver(values, false);
      expect(BoardKit.countNonZero(values)).assertEqual(0);
      expect(firstCellWith(values, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0200
     * @tc.name gameOverInitialisedBoardIsNotOver0200
     * @tc.desc Verify init leaves two tiles on an otherwise empty board, so the game is not over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_initialisedBoardIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.countNonZero(rule.dataNumbers) === CELLS).assertFalse();
      expect(rule.status).assertEqual(STATUS_RUNNING);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardOracle.gameOver(rule.dataNumbers)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0300
     * @tc.name gameOverSingleTileIsNotOver0300
     * @tc.desc Verify a board holding one tile and fifteen zeros is still playable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_singleTileIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(1);
      expect(firstCellWith(values, 0)).assertEqual(1);
      BoardKit.expectOracleOver(values, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0400
     * @tc.name gameOverZeroAtFirstCellIsNotOver0400
     * @tc.desc Verify an otherwise over board becomes playable when cell zero is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroAtFirstCellIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[0] = 0;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_zeroAtFirstCellIsNotOver', values);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS - 1);
      expect(values[0]).assertEqual(0);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0500
     * @tc.name gameOverZeroAtRowOneThirdCellIsNotOver0500
     * @tc.desc Verify the empty cell on the second row is detected at index six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroAtRowOneThirdCellIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[6] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(firstCellWith(values, 0)).assertEqual(6);
      expect(values[6]).assertEqual(0);
      expect(values[5] === 0).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0600
     * @tc.name gameOverZeroAtRowTwoFourthCellIsNotOver0600
     * @tc.desc Verify the empty cell on the third row is detected at index eleven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroAtRowTwoFourthCellIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[11] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(firstCellWith(values, 0)).assertEqual(11);
      expect(BoardKit.rowOf(values, 2)).assertContain(0);
      expect(BoardKit.countNonZero(values)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0700
     * @tc.name gameOverZeroAtRowThreeSecondCellIsNotOver0700
     * @tc.desc Verify the empty cell on the last row is detected at index thirteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroAtRowThreeSecondCellIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[13] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(firstCellWith(values, 0)).assertEqual(13);
      expect(BoardKit.columnOf(values, 1)).assertContain(0);
      expect(BoardKit.countNonZero(values)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0800
     * @tc.name gameOverZeroAtLastCellIsNotOver0800
     * @tc.desc Verify a zero at the very last cell is still found by the scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroAtLastCellIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[CELLS - 1] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(values[CELLS - 1]).assertEqual(0);
      expect(BoardKit.describe(values)).assertContain('|0');
      expect(BoardOracle.gameOver(values)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_0900
     * @tc.name gameOverFourZerosAreNotOver0900
     * @tc.desc Verify four empty cells on the diagonal still keep the board playable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_fourZerosAreNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[0] = 0;
      values[5] = 0;
      values[10] = 0;
      values[15] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(12);
      expect(BoardKit.zeroPositions(values).length).assertEqual(4);
      expect(BoardKit.zeroPositions(values)).assertContain(15);
      expect(BoardKit.sum(values)).assertEqual(40);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1000
     * @tc.name gameOverZeroBetweenEqualRowTilesIsNotOver1000
     * @tc.desc Verify two equal tiles split by a zero on the same row do not count as adjacent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroBetweenEqualRowTilesIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.withRow(distinctBoard(), 1, [4, 0, 4, 256]);
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_zeroBetweenEqualRowTilesIsNotOver', values);
      expect(values[4]).assertEqual(4);
      expect(values[5]).assertEqual(0);
      expect(values[6]).assertEqual(4);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1100
     * @tc.name gameOverZeroBetweenEqualColumnTilesIsNotOver1100
     * @tc.desc Verify two equal tiles split by a zero in one column do not count as adjacent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroBetweenEqualColumnTilesIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[6] = 0;
      values[10] = 8;
      let rule: GameRule = BoardKit.rule(values);
      expect(values[2]).assertEqual(8);
      expect(values[6]).assertEqual(0);
      expect(values[10]).assertEqual(8);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(BoardKit.zeroPositions(values).length).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1200
     * @tc.name gameOverSingleFullRowIsNotOver1200
     * @tc.desc Verify a board with one occupied row and twelve empty cells is not over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_singleFullRowIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(SIDE_LENGTH);
      expect(firstCellWith(values, 0)).assertEqual(4);
      expect(BoardKit.sum(values)).assertEqual(30);
      BoardKit.expectOracleOver(values, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1300
     * @tc.name gameOverCheckerboardIsOver1300
     * @tc.desc Verify the canonical two four checkerboard is reported as over in all checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_checkerboardIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_checkerboardIsOver', values);
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(firstCellWith(values, 0)).assertNull();
      BoardKit.expectOracleOver(values, true);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1400
     * @tc.name gameOverCyclicBoardIsOver1400
     * @tc.desc Verify a rotated board has no equal neighbours in any row or column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_cyclicBoardIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = cyclicBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      BoardKit.expectValues(BoardKit.rowOf(values, 2), [8, 16, 2, 4]);
      BoardKit.expectValues(BoardKit.columnOf(values, 1), [4, 8, 16, 2]);
      BoardKit.expectOracleOver(values, true);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1500
     * @tc.name gameOverDoubleDiagonalIsOver1500
     * @tc.desc Verify equal diagonal chains alone cannot keep the game alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_doubleDiagonalIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = doubleDiagonalBoard();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_doubleDiagonalIsOver', values);
      expect(values[0]).assertEqual(2);
      expect(values[5]).assertEqual(2);
      expect(values[10]).assertEqual(2);
      expect(values[15]).assertEqual(2);
      expect(values[3]).assertEqual(16);
      expect(values[6]).assertEqual(16);
      expect(values[9]).assertEqual(16);
      expect(values[12]).assertEqual(16);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1600
     * @tc.name gameOverAntiDiagonalOnlyIsOver1600
     * @tc.desc Verify a single constant anti diagonal with a broken main diagonal is still over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_antiDiagonalOnlyIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = antiDiagonalBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(values[3]).assertEqual(16);
      expect(values[6]).assertEqual(16);
      expect(values[9]).assertEqual(16);
      expect(values[12]).assertEqual(16);
      expect(values[10] === values[15]).assertTrue();
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
      expect(BoardOracle.gameOver(values)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1700
     * @tc.name gameOverFourCornersEqualIsOver1700
     * @tc.desc Verify four equal corners are not a legal move while every neighbour differs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_fourCornersEqualIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = cornerBoard();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_fourCornersEqualIsOver', values);
      expect(values[0]).assertEqual(2);
      expect(values[3]).assertEqual(2);
      expect(values[12]).assertEqual(2);
      expect(values[15]).assertEqual(2);
      expect(BoardKit.positionsOf(values, 2).length).assertEqual(4);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1800
     * @tc.name gameOverDistinctValuesIsOver1800
     * @tc.desc Verify sixteen different tile values leave no merge available at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_distinctValuesIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
      expect(BoardKit.sum(values)).assertEqual(131070);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.dataNumbers[0] === rule.dataNumbers[1]).assertFalse();
      BoardKit.expectOracleOver(values, true);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_1900
     * @tc.name gameOverNegativeValuesIsOver1900
     * @tc.desc Verify negative tile values arranged without neighbours are reported as over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_negativeValuesIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [-2, -4, -8, -16],
        [-4, -8, -16, -2],
        [-8, -16, -2, -4],
        [-16, -2, -4, -8]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(BoardKit.sum(values)).assertEqual(-120);
      expect(firstCellWith(values, 0)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2000
     * @tc.name gameOverHugeValuesIsOver2000
     * @tc.desc Verify a board of four distinct power of two giants has no merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_hugeValuesIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [1073741824, 536870912, 268435456, 134217728],
        [536870912, 268435456, 134217728, 1073741824],
        [268435456, 134217728, 1073741824, 536870912],
        [134217728, 1073741824, 536870912, 268435456]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      expect(values[0]).assertEqual(1073741824);
      expect(values[3]).assertEqual(134217728);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(BoardKit.sum(values)).assertEqual(8053063680);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2100
     * @tc.name gameOverNonAdjacentEqualInRowsIsOver2100
     * @tc.desc Verify a repeated value inside one row is legal as long as the copies are apart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_nonAdjacentEqualInRowsIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 2, 4],
        [8, 16, 8, 16],
        [32, 64, 32, 64],
        [128, 256, 128, 256]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.positionsOf(values, 2).length).assertEqual(2);
      expect(BoardKit.positionsOf(values, 2)).assertContain(2);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2200
     * @tc.name gameOverNonAdjacentEqualInColumnsIsOver2200
     * @tc.desc Verify a repeated value inside one column is legal as long as the copies are apart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_nonAdjacentEqualInColumnsIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [2, 8, 32, 128],
        [4, 16, 64, 256],
        [2, 8, 32, 128],
        [4, 16, 64, 256]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.positionsOf(values, 2)).assertContain(8);
      expect(values[0] === values[8]).assertTrue();
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2300
     * @tc.name gameOverDiagonalNeighbourPairIsOver2300
     * @tc.desc Verify two equal cells touching only at a corner are not a merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_diagonalNeighbourPairIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[5] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.positionsOf(values, 2).length).assertEqual(2);
      expect(BoardKit.positionsOf(values, 2)).assertContain(5);
      expect(values[5] === values[4]).assertFalse();
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2400
     * @tc.name gameOverCornerToCornerPairIsOver2400
     * @tc.desc Verify equal tiles at the two ends of the anti diagonal do not count as a move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_cornerToCornerPairIsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[12] = 16;
      let rule: GameRule = BoardKit.rule(values);
      expect(values[3]).assertEqual(16);
      expect(values[12]).assertEqual(16);
      expect(BoardKit.positionsOf(values, 16)).assertContain(12);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectOracleOver(values, true);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2500
     * @tc.name gameOverHorizontalPairInFirstRowIsNotOver2500
     * @tc.desc Verify the first row pair is found by the upward boundary scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_horizontalPairInFirstRowIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_horizontalPairInFirstRowIsNotOver', values);
      BoardKit.expectValues(BoardKit.rowOf(values, 0), [2, 2, 8, 16]);
      expect(countHorizontalPairs(values)).assertEqual(1);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2600
     * @tc.name gameOverHorizontalPairInSecondRowIsNotOver2600
     * @tc.desc Verify a pair in the middle row is reported by the row scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_horizontalPairInSecondRowIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[5] = 32;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.rowOf(values, 1), [32, 32, 128, 256]);
      expect(countHorizontalPairs(values)).assertEqual(1);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(values[5] === values[4]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2700
     * @tc.name gameOverHorizontalPairInThirdRowIsNotOver2700
     * @tc.desc Verify a pair in the third row is reported even when the first two rows are clean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_horizontalPairInThirdRowIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[9] = 512;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.rowOf(values, 2), [512, 512, 2048, 4096]);
      expect(countHorizontalPairs(values)).assertEqual(1);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.expectOracleOver(values, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2800
     * @tc.name gameOverHorizontalPairInFourthRowIsNotOver2800
     * @tc.desc Verify the bottom row pair is found at the lower boundary of the scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_horizontalPairInFourthRowIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[13] = 8192;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.rowOf(values, 3), [8192, 8192, 32768, 65536]);
      expect(countHorizontalPairs(values)).assertEqual(1);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_2900
     * @tc.name gameOverTwoHorizontalPairsAreNotOver2900
     * @tc.desc Verify two separate pairs in different rows are both considered moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_twoHorizontalPairsAreNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[1] = 2;
      values[5] = 32;
      let rule: GameRule = BoardKit.rule(values);
      expect(countHorizontalPairs(values)).assertEqual(2);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(firstCellWith(values, 0)).assertNull();
      BoardKit.expectOracleOver(values, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3000
     * @tc.name gameOverHorizontalAndVerticalPairAreNotOver3000
     * @tc.desc Verify one horizontal and one vertical pair on the same corner are both reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_horizontalAndVerticalPairAreNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[1] = 2;
      values[5] = 2;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_horizontalAndVerticalPairAreNotOver', values);
      expect(countHorizontalPairs(values)).assertEqual(1);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(values[1]).assertEqual(values[5]);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3100
     * @tc.name gameOverPairInEachRowAtDifferentColumns3100
     * @tc.desc Verify four row pairs sitting at four different column positions are all found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_pairInEachRowAtDifferentColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[1] = values[0];
      values[6] = values[5];
      values[11] = values[10];
      values[14] = values[13];
      let rule: GameRule = BoardKit.rule(values);
      expect(values[1]).assertEqual(2);
      expect(values[6]).assertEqual(64);
      expect(values[11]).assertEqual(2048);
      expect(values[14]).assertEqual(16384);
      expect(countHorizontalPairs(values)).assertEqual(4);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3200
     * @tc.name gameOverVerticalPairInFirstColumnIsNotOver3200
     * @tc.desc Verify the left column pair is found by the column scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_verticalPairInFirstColumnIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[4] = 2;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.columnOf(values, 0), [2, 2, 512, 8192]);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3300
     * @tc.name gameOverVerticalPairInSecondColumnIsNotOver3300
     * @tc.desc Verify a vertical pair in the second column is reported independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_verticalPairInSecondColumnIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[5] = 4;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.columnOf(values, 1), [4, 4, 1024, 16384]);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardOracle.gameOver(values)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3400
     * @tc.name gameOverVerticalPairInThirdColumnIsNotOver3400
     * @tc.desc Verify a vertical pair in the third column is reported independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_verticalPairInThirdColumnIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[10] = 128;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.columnOf(values, 2), [8, 128, 128, 32768]);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(values[10] === values[6]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3500
     * @tc.name gameOverVerticalPairInFourthColumnIsNotOver3500
     * @tc.desc Verify the right column pair is found at the right boundary of the scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_verticalPairInFourthColumnIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[15] = 4096;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.columnOf(values, 3), [16, 256, 4096, 4096]);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3600
     * @tc.name gameOverVerticalPairAtBottomLeftIsNotOver3600
     * @tc.desc Verify a pair formed by the two bottom tiles of the left column is a move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_verticalPairAtBottomLeftIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[12] = 512;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.columnOf(values, 0), [2, 32, 512, 512]);
      BoardKit.expectValues(BoardKit.rowOf(values, 3), [512, 16384, 32768, 65536]);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3700
     * @tc.name gameOverPairInEachColumnAtDifferentRows3700
     * @tc.desc Verify four column pairs sitting at four different row positions are all found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_pairInEachColumnAtDifferentRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[4] = values[0];
      values[9] = values[5];
      values[14] = values[10];
      values[7] = values[3];
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.columnOf(values, 0)).assertContain(2);
      expect(values[9]).assertEqual(64);
      expect(values[14]).assertEqual(2048);
      expect(values[7]).assertEqual(16);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(4);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3800
     * @tc.name gameOverRepeatedRowBoardIsNotOver3800
     * @tc.desc Verify four identical rows make every column vertically mergeable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_repeatedRowBoardIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_repeatedRowBoardIsNotOver', values);
      BoardKit.expectValues(BoardKit.columnOf(values, 0), [2, 2, 2, 2]);
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(12);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_3900
     * @tc.name gameOverRepeatedColumnBoardIsNotOver3900
     * @tc.desc Verify four identical columns make every row horizontally mergeable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_repeatedColumnBoardIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedColumn([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.rowOf(values, 0), [2, 2, 2, 2]);
      expect(countHorizontalPairs(values)).assertEqual(12);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(firstCellWith(values, 0)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4000
     * @tc.name gameOverAllTwosBoardIsNotOver4000
     * @tc.desc Verify a board made of sixteen twos stays playable in both directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_allTwosBoardIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
      expect(firstCellWith(values, 0)).assertNull();
      expect(countHorizontalPairs(values)).assertEqual(12);
      expect(countVerticalPairs(values)).assertEqual(12);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardOracle.gameOver(values)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4100
     * @tc.name gameOverOneRowOfEightsIsNotOver4100
     * @tc.desc Verify three horizontal merges on the first row are enough to continue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_oneRowOfEightsIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.withRow(distinctBoard(), 0, [8, 8, 8, 8]);
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.rowOf(values, 0), [8, 8, 8, 8]);
      expect(countHorizontalPairs(values)).assertEqual(3);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4200
     * @tc.name gameOverDoubleDiagonalPlusVerticalPairIsNotOver4200
     * @tc.desc Verify an orthogonal pair wins over the fact that diagonals are ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_doubleDiagonalPlusVerticalPairIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = doubleDiagonalBoard();
      values[9] = 8;
      let rule: GameRule = BoardKit.rule(values);
      expect(values[9]).assertEqual(8);
      expect(values[13]).assertEqual(8);
      expect(values[9] === values[13]).assertTrue();
      expect(countHorizontalPairs(values)).assertEqual(0);
      expect(countVerticalPairs(values)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4300
     * @tc.name gameOverDoubleDiagonalPlusHorizontalPairIsNotOver4300
     * @tc.desc Verify a horizontal pair wins over a board whose diagonals are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_doubleDiagonalPlusHorizontalPairIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = doubleDiagonalBoard();
      values[13] = 4;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectValues(BoardKit.rowOf(values, 3), [16, 4, 4, 2]);
      expect(countHorizontalPairs(values)).assertEqual(1);
      expect(countVerticalPairs(values)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4400
     * @tc.name gameOverConstructedOverBoardIsOverImmediately4400
     * @tc.desc Verify a fully occupied board is judged over right after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_constructedOverBoardIsOverImmediately', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(rule.status === STATUS_RUNNING).assertFalse();
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4500
     * @tc.name gameOverVerdictIsRepeatable4500
     * @tc.desc Verify repeated calls on the same board return a stable verdict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_verdictIsRepeatable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let overValues: number[] = BoardKit.overBoard();
      let overRule: GameRule = BoardKit.rule(overValues);
      expect(overRule.dataNumbers.length).assertEqual(CELLS);
      for (let round: number = 0; round < 3; round++) {
        expect(overRule.isGameOver()).assertTrue();
      }
      let openValues: number[] = distinctBoard();
      openValues[1] = 2;
      let openRule: GameRule = BoardKit.rule(openValues);
      for (let round: number = 0; round < 3; round++) {
        expect(openRule.isGameOver()).assertFalse();
      }
      BoardKit.expectBoard(overRule, overValues);
      BoardKit.expectBoard(openRule, openValues);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4600
     * @tc.name gameOverDoesNotMutateBoard4600
     * @tc.desc Verify the verdict is read only and leaves every cell untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_doesNotMutateBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectValues(rule.dataNumbers, before);
      BoardKit.expectValues(before, values);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(values));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4700
     * @tc.name gameOverLeavesScoreAndStatusUntouched4700
     * @tc.desc Verify the verdict neither adds score nor flips the game status to over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_leavesScoreAndStatusUntouched', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.score = 256;
      rule.status = STATUS_RUNNING;
      expect(rule.isGameOver()).assertTrue();
      expect(rule.score).assertEqual(256);
      expect(rule.status).assertEqual(STATUS_RUNNING);
      expect(rule.status === 0).assertFalse();
      expect(rule.score === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4800
     * @tc.name gameOverHasNoSeventeenthCell4800
     * @tc.desc Verify the scan stays inside the sixteen cell board and never reads index sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_hasNoSeventeenthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      expect(rule.isGameOver()).assertTrue();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS + 1]).assertUndefined();
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('2|4|2|4');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_4900
     * @tc.name gameOverZeroAfterVerdictFlipsToNotOver4900
     * @tc.desc Verify making one cell empty on a finished board revives the game
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_zeroAfterVerdictFlipsToNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      rule.dataNumbers[8] = 0;
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(8);
      BoardKit.expectOracleOver(rule.dataNumbers, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5000
     * @tc.name gameOverEqualPairAfterVerdictFlipsToNotOver5000
     * @tc.desc Verify copying one tile onto its right neighbour revives a finished board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_equalPairAfterVerdictFlipsToNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      rule.dataNumbers[1] = rule.dataNumbers[0];
      expect(countHorizontalPairs(rule.dataNumbers)).assertEqual(2);
      expect(countVerticalPairs(rule.dataNumbers)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5100
     * @tc.name gameOverMergingMoveCreatesZeroThenNotOver5100
     * @tc.desc Verify a merge on a full board leaves a zero, so the board is no longer over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_mergingMoveCreatesZeroThenNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = distinctBoard();
      values[1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 16, 0]);
      expect(rule.score).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(3);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5200
     * @tc.name gameOverWholeBoardMergeIsNotOver5200
     * @tc.desc Verify merging one pair per row leaves four zeros and a playable board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_wholeBoardMergeIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 8, 16],
        [32, 32, 128, 256],
        [512, 512, 2048, 4096],
        [8192, 8192, 32768, 65536]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('gameOver_wholeBoardMergeIsNotOver', values);
      expect(countHorizontalPairs(values)).assertEqual(4);
      expect(countVerticalPairs(values)).assertEqual(0);
      for (let row: number = 0; row < SIDE_LENGTH; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      expect(rule.score).assertEqual(17476);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(4);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5300
     * @tc.name gameOverMatchesOracleOnBlankAndCheckerboard5300
     * @tc.desc Verify the verdict agrees with the reference model on a blank and a finished board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_matchesOracleOnBlankAndCheckerboard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let boards: number[][] = [];
      boards.push(BoardKit.blank());
      boards.push(BoardKit.overBoard());
      for (let index: number = 0; index < boards.length; index++) {
        let board: number[] = boards[index];
        let rule: GameRule = BoardKit.rule(board);
        let expected: boolean = BoardOracle.gameOver(board);
        BoardKit.log('gameOver_matchesOracleOnBlankAndCheckerboard', 'board ' + index + ' over ' + expected);
        expect(rule.isGameOver()).assertEqual(expected);
        expect(BoardOracle.gameOver(rule.dataNumbers)).assertEqual(expected);
        BoardKit.expectBoard(rule, board);
      }
      expect(boards.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5400
     * @tc.name gameOverMatchesOracleOnDistinctAndCyclic5400
     * @tc.desc Verify the verdict agrees on two full boards with no equal neighbour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_matchesOracleOnDistinctAndCyclic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let boards: number[][] = [];
      boards.push(distinctBoard());
      boards.push(cyclicBoard());
      for (let index: number = 0; index < boards.length; index++) {
        let board: number[] = boards[index];
        let rule: GameRule = BoardKit.rule(board);
        let expected: boolean = BoardOracle.gameOver(board);
        BoardKit.log('gameOver_matchesOracleOnDistinctAndCyclic', 'board ' + index + ' over ' + expected);
        expect(expected).assertTrue();
        expect(rule.isGameOver()).assertEqual(expected);
        expect(rule.isGameOver() === BoardOracle.gameOver(board)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5500
     * @tc.name gameOverMatchesOracleOnTwosAndDiagonals5500
     * @tc.desc Verify the verdict agrees on an all twos board and a double diagonal board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_matchesOracleOnTwosAndDiagonals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let boards: number[][] = [];
      boards.push(BoardKit.repeatedRow([2, 2, 2, 2]));
      boards.push(doubleDiagonalBoard());
      for (let index: number = 0; index < boards.length; index++) {
        let board: number[] = boards[index];
        let rule: GameRule = BoardKit.rule(board);
        let expected: boolean = BoardOracle.gameOver(board);
        BoardKit.log('gameOver_matchesOracleOnTwosAndDiagonals', 'board ' + index + ' over ' + expected);
        expect(rule.isGameOver()).assertEqual(expected);
        expect(rule.isGameOver() === expected).assertTrue();
        expect(BoardKit.countNonZero(board)).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5600
     * @tc.name gameOverMatchesOracleOnCornersAndRepeatedRow5600
     * @tc.desc Verify the verdict agrees on a corners board and a repeated row board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_matchesOracleOnCornersAndRepeatedRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let boards: number[][] = [];
      boards.push(cornerBoard());
      boards.push(BoardKit.repeatedRow([2, 4, 8, 16]));
      for (let index: number = 0; index < boards.length; index++) {
        let board: number[] = boards[index];
        let rule: GameRule = BoardKit.rule(board);
        let expected: boolean = BoardOracle.gameOver(board);
        let verdict: boolean = rule.isGameOver();
        BoardKit.log('gameOver_matchesOracleOnCornersAndRepeatedRow', 'board ' + index + ' over ' + expected);
        expect(verdict).assertEqual(expected);
        expect(verdict === BoardOracle.gameOver(rule.dataNumbers)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEGAMEOVER_5700
     * @tc.name gameOverMatchesOracleOnPairAndZeroBoards5700
     * @tc.desc Verify the verdict agrees on a one pair board and on a board with one empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameOver_matchesOracleOnPairAndZeroBoards', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let boards: number[][] = [];
      let pairBoard: number[] = distinctBoard();
      pairBoard[1] = pairBoard[0];
      boards.push(pairBoard);
      let zeroBoard: number[] = BoardKit.overBoard();
      zeroBoard[13] = 0;
      boards.push(zeroBoard);
      for (let index: number = 0; index < boards.length; index++) {
        let board: number[] = boards[index];
        let rule: GameRule = BoardKit.rule(board);
        let expected: boolean = BoardOracle.gameOver(board);
        BoardKit.log('gameOver_matchesOracleOnPairAndZeroBoards', 'board ' + index + ' over ' + expected);
        expect(rule.isGameOver()).assertEqual(expected);
        expect(expected).assertFalse();
        expect(rule.isGameOver() === BoardOracle.gameOver(board)).assertTrue();
      }
    });
  });
}
