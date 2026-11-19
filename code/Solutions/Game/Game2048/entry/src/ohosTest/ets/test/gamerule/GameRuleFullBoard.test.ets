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
import {
  BoardKit, CELLS, SIDE, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN
} from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Status value a constructed rule carries before any movement. */
const STATUS_BEFORE: number = -1;
/** Score produced by merging one pair in each of the four rows. */
const ALL_ROWS_PAIR_SCORE: number = 17476;
/** Number of merges a board of sixteen fours performs in one line move. */
const MAX_MERGES: number = 8;

/**
 * Returns the cell stored at index, or null when the index lies outside the
 * board. It is used to state positively that a full board has no seventeenth
 * cell, instead of relying on an undefined read.
 */
function cellOrNull(values: number[], index: number): number | null {
  if (index < 0 || index >= values.length) {
    return null;
  }
  return values[index];
}

/**
 * A fully occupied board whose sixteen tiles are all different, so that one
 * injected pair is the only possible merge.
 */
function spreadBoard(): number[] {
  return BoardKit.rows([
    [2, 4, 8, 16],
    [32, 64, 128, 256],
    [512, 1024, 2048, 4096],
    [8192, 16384, 32768, 65536]
  ]);
}

/**
 * A full board whose four rows each carry one pair at the left edge, so a
 * left move merges exactly once per row.
 */
function rowPairBoard(): number[] {
  return BoardKit.rows([
    [2, 2, 8, 16],
    [32, 32, 128, 256],
    [512, 512, 2048, 4096],
    [8192, 8192, 32768, 65536]
  ]);
}

/**
 * A full board whose four rows each carry one pair at the right edge, the
 * mirror path that merges immediately instead of after a shift.
 */
function rowPairRightBoard(): number[] {
  return BoardKit.rows([
    [8, 16, 2, 2],
    [128, 256, 32, 32],
    [2048, 4096, 512, 512],
    [32768, 65536, 8192, 8192]
  ]);
}

/**
 * A full board whose four columns each carry one pair at the top edge.
 */
function columnPairBoard(): number[] {
  return BoardKit.rows([
    [2, 32, 512, 8192],
    [2, 32, 512, 8192],
    [8, 128, 2048, 32768],
    [16, 256, 4096, 65536]
  ]);
}

/**
 * A full board whose four columns each carry one pair at the bottom edge.
 */
function columnPairBottomBoard(): number[] {
  return BoardKit.rows([
    [8, 128, 2048, 32768],
    [16, 256, 4096, 65536],
    [2, 32, 512, 8192],
    [2, 32, 512, 8192]
  ]);
}

/**
 * A full board where only the first and the third row carry one pair. The
 * second and fourth rows must stay untouched by a left move.
 */
function mixedPairBoard(): number[] {
  return BoardKit.rows([
    [2, 2, 8, 16],
    [32, 64, 128, 256],
    [512, 512, 2048, 4096],
    [8192, 16384, 32768, 65536]
  ]);
}

/**
 * GameRule 满盘与近满盘测试套件。
 *
 * 满盘意味着十六格全部非零，因此任何一次真正的移动都必然先合并出一到多个
 * 空格，再由 move 的概率补块填回其中一格。本套件压满盘合并的边界：四角、
 * 四边、单行、单列、每行每列同时合并、最多合并数、合并后空格数量、move 的
 * 补块契约、分数累加，以及唯一空位在 0、3、5、8、12、15 时的四向移动。
 * 无合并的路径一律与 BoardOracle 独立复算比对，带补块的路径按“只差一格且
 * 该格为 2 或 4”的契约校验。
 */
export default function gameRuleFullBoardTest() {
  describe('gameRuleFullBoardTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleFullBoardTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleFullBoardTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0100
     * @tc.name fullBoardPairAtRowZeroLeftEdgeMovesLeft0100
     * @tc.desc Verify a pair at the left edge of the first row merges into four and leaves one gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtRowZeroLeftEdgeMovesLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
      expect(rule.isGameOver()).assertFalse();
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 16, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [32, 64, 128, 256]);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
      expect(rule.score).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(3);
      expect(cellOrNull(rule.dataNumbers, CELLS)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0200
     * @tc.name fullBoardPairAtRowZeroRightEdgeMovesRight0200
     * @tc.desc Verify a pair at the right edge of the first row merges without any shift first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtRowZeroRightEdgeMovesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[3] = 8;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 16]);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.score).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(0);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0300
     * @tc.name fullBoardPairAtLastRowLeftEdgeMovesLeft0300
     * @tc.desc Verify a pair on the bottom row merges into the gap at the end of that row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtLastRowLeftEdgeMovesLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[13] = 8192;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 3);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [16384, 32768, 65536, 0]);
      expect(rule.score).assertEqual(16384);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(15);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0400
     * @tc.name fullBoardPairAtLastRowRightEdgeMovesRight0400
     * @tc.desc Verify the bottom right pair merges into two to the power sixteen at the edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtLastRowRightEdgeMovesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[15] = 32768;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 3);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 8192, 16384, 65536]);
      expect(rule.score).assertEqual(65536);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(12);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0500
     * @tc.name fullBoardPairAtColumnZeroTopMovesUp0500
     * @tc.desc Verify a vertical pair at the top of the first column merges in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtColumnZeroTopMovesUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[4] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 512, 8192, 0]);
      expect(rule.score).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(12);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_UP));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0600
     * @tc.name fullBoardPairAtColumnZeroBottomMovesDown0600
     * @tc.desc Verify a vertical pair at the bottom of the first column merges without a shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtColumnZeroBottomMovesDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[12] = 512;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 2, 32, 1024]);
      expect(rule.score).assertEqual(1024);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(0);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_DOWN));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0700
     * @tc.name fullBoardPairAtColumnThreeTopMovesUp0700
     * @tc.desc Verify a vertical pair at the top of the last column is found at the right boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtColumnThreeTopMovesUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[7] = 16;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [32, 4096, 65536, 0]);
      expect(rule.score).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(15);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_UP));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0800
     * @tc.name fullBoardPairAtColumnThreeBottomMovesDown0800
     * @tc.desc Verify the bottom right vertical pair merges into eight thousand one hundred ninety two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_pairAtColumnThreeBottomMovesDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[15] = 4096;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 16, 256, 8192]);
      expect(rule.score).assertEqual(8192);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(3);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_DOWN));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_0900
     * @tc.name fullBoardEveryRowMergesOnceLeft0900
     * @tc.desc Verify four simultaneous left merges score seventeen thousand four hundred seventy six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyRowMergesOnceLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('fullBoard_everyRowMergesOnceLeft', values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 16, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [64, 128, 256, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [1024, 2048, 4096, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [16384, 32768, 65536, 0]);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(4);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(15);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1000
     * @tc.name fullBoardEveryRowMergesOnceRight1000
     * @tc.desc Verify four right edge merges leave the first cell of every row empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyRowMergesOnceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairRightBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 8, 16, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 128, 256, 64]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 2048, 4096, 1024]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 32768, 65536, 16384]);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
      for (let row: number = 0; row < SIDE; row++) {
        expect(rule.dataNumbers[row * SIDE]).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1100
     * @tc.name fullBoardEveryColumnMergesOnceUp1100
     * @tc.desc Verify four upward merges end with a completely empty bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyColumnMergesOnceUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = columnPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 8, 16, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [64, 128, 256, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [1024, 2048, 4096, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [16384, 32768, 65536, 0]);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_UP));
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1200
     * @tc.name fullBoardEveryColumnMergesOnceDown1200
     * @tc.desc Verify four downward merges end with a completely empty top row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyColumnMergesOnceDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = columnPairBottomBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 8, 16, 4]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 128, 256, 64]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 2048, 4096, 1024]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 32768, 65536, 16384]);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_DOWN));
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1300
     * @tc.name fullBoardAllFoursReachesMaximumMerges1300
     * @tc.desc Verify a board of sixteen fours performs eight merges, the maximum of one move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_allFoursReachesMaximumMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([4, 4, 4, 4]);
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [8, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [8, 8, 0, 0]);
      expect(rule.score).assertEqual(64);
      BoardKit.expectOccupancy(before, rule.dataNumbers, MAX_MERGES, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(8);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1400
     * @tc.name fullBoardTwoRowsMergeTwoRowsStay1400
     * @tc.desc Verify only the paired rows change while the other two rows keep every tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_twoRowsMergeTwoRowsStay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = mixedPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 16, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [32, 64, 128, 256]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [1024, 2048, 4096, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [8192, 16384, 32768, 65536]);
      expect(rule.score).assertEqual(1028);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(2);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1500
     * @tc.name fullBoardSingleInnerRowMergeIsIsolated1500
     * @tc.desc Verify merging the third row leaves the first, second and fourth rows byte identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_singleInnerRowMergeIsIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[9] = 512;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 2);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [1024, 2048, 4096, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [32, 64, 128, 256]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [8192, 16384, 32768, 65536]);
      expect(rule.score).assertEqual(1024);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(cellOrNull(rule.dataNumbers, 11)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1600
     * @tc.name fullBoardNoMergeAnyDirectionKeepsBoard1600
     * @tc.desc Verify a solved full board is untouched by all four whole board moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_noMergeAnyDirectionKeepsBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let rule: GameRule = BoardKit.rule(values);
        rule.move(directions[index]);
        BoardKit.expectValues(rule.dataNumbers, values);
        expect(rule.score).assertEqual(0);
        expect(rule.status).assertEqual(STATUS_BEFORE);
        expect(rule.isGameOver()).assertTrue();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1700
     * @tc.name fullBoardNoMergeEveryLineKeepsBoard1700
     * @tc.desc Verify every single line move on a solved board matches the oracle and changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_noMergeEveryLineKeepsBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let rule: GameRule = BoardKit.rule(values);
        for (let line: number = 0; line < SIDE; line++) {
          rule.moveInRow(directions[index], line);
        }
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, directions[index]));
        BoardKit.expectValues(rule.dataNumbers, values);
        expect(rule.score).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1800
     * @tc.name fullBoardNoMergeLinesKeepScoreZero1800
     * @tc.desc Verify moving four packed distinct rows left never adds score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_noMergeLinesKeepScoreZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_1900
     * @tc.name fullBoardSecondMergeOnMergedRowIsNoOp1900
     * @tc.desc Verify repeating the merge on an already merged row keeps the earlier score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_secondMergeOnMergedRowIsNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      let afterFirst: number[] = rule.dataNumbers.slice();
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(rule.dataNumbers, afterFirst);
      expect(rule.score).assertEqual(4);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
      expect(rule.dataNumbers[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2000
     * @tc.name fullBoardGapAtFirstCellMovesLeft2000
     * @tc.desc Verify the only empty cell at index zero travels to the end of its row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapAtFirstCellMovesLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[0] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(values)).assertEqual(15);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 2, 4, 0]);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(3);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2100
     * @tc.name fullBoardGapAtThirdCellMovesRight2100
     * @tc.desc Verify the only empty cell at index three travels to the start of its row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapAtThirdCellMovesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[3] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 2]);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2200
     * @tc.name fullBoardGapAtBottomLeftMovesDown2200
     * @tc.desc Verify the only empty cell at index twelve falls to the top of its column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapAtBottomLeftMovesDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[12] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 2, 4, 2]);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2300
     * @tc.name fullBoardGapAtLastCellMovesRight2300
     * @tc.desc Verify the only empty cell at index fifteen moves to index twelve on a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapAtLastCellMovesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[15] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 4, 2, 4]);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(12);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2400
     * @tc.name fullBoardGapAtCenterEnablesRowMerge2400
     * @tc.desc Verify the gap at index five lets two equal fours compact and merge into eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapAtCenterEnablesRowMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[5] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [8, 2, 0, 0]);
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2500
     * @tc.name fullBoardGapInThirdRowEnablesRightMerge2500
     * @tc.desc Verify a gap in the third row lets a right move merge the two fours into eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapInThirdRowEnablesRightMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[10] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 2, 8]);
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(rule.dataNumbers[10]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2600
     * @tc.name fullBoardGapInLastColumnEnablesUpMerge2600
     * @tc.desc Verify a gap in the last column lets the two fours of that column merge upwards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapInLastColumnEnablesUpMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[7] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_UP));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [8, 2, 0, 0]);
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(11);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2700
     * @tc.name fullBoardGapInFirstColumnEnablesDownMerge2700
     * @tc.desc Verify a gap in the first column lets a down move merge the two fours into eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_gapInFirstColumnEnablesDownMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[8] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 8]);
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(rule.dataNumbers[12]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2800
     * @tc.name fullBoardInnerGapCompactsWithoutMerge2800
     * @tc.desc Verify the gap at index one closes to index three without merging anything
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_innerGapCompactsWithoutMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[1] = 0;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 8, 16, 0]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(3);
      expect(rule.dataNumbers[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_2900
     * @tc.name fullBoardFifteenCellBoardIsStableOnRepeat2900
     * @tc.desc Verify a fifteen cell board changes once and then stays put on the second move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_fifteenCellBoardIsStableOnRepeat', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[12] = 0;
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 4, 2, 0]);
      let afterFirst: number[] = rule.dataNumbers.slice();
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, afterFirst);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3000
     * @tc.name fullBoardMoveLeftSpawnsOneTile3000
     * @tc.desc Verify a single merge on a full board is followed by exactly one spawned tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_moveLeftSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[1] = 2;
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers) > BoardKit.sum(before)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3100
     * @tc.name fullBoardEveryRowMergeSpawnsOneTile3100
     * @tc.desc Verify four merges plus one spawn leave thirteen tiles on the moved board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyRowMergeSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairBoard();
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(13);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(3);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3200
     * @tc.name fullBoardEveryColumnMergeUpSpawnsOneTile3200
     * @tc.desc Verify four vertical merges plus one spawn leave thirteen occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyColumnMergeUpSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = columnPairBoard();
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_UP);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(13);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(3);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3300
     * @tc.name fullBoardEveryColumnMergeDownSpawnsOneTile3300
     * @tc.desc Verify four downward merges plus one spawn leave thirteen occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_everyColumnMergeDownSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = columnPairBottomBoard();
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_DOWN);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
      expect(rule.score).assertEqual(ALL_ROWS_PAIR_SCORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(13);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(3);
      expect(rule.status).assertEqual(STATUS_BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3400
     * @tc.name fullBoardNearFullMoveLeftSpawnsOneTile3400
     * @tc.desc Verify a fifteen cell board returns to sixteen cells after one left move and spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_nearFullMoveLeftSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[12] = 0;
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(before)).assertEqual(15);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3500
     * @tc.name fullBoardNearFullMoveRightSpawnsOneTile3500
     * @tc.desc Verify a fifteen cell board returns to sixteen cells after one right move and spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_nearFullMoveRightSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[3] = 0;
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_RIGHT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3600
     * @tc.name fullBoardNearFullMoveUpSpawnsOneTile3600
     * @tc.desc Verify a fifteen cell board returns to sixteen cells after one upward move and spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_nearFullMoveUpSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[2] = 0;
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_UP);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers) > BoardKit.sum(before)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3700
     * @tc.name fullBoardNearFullMoveDownSpawnsOneTile3700
     * @tc.desc Verify a fifteen cell board returns to sixteen cells after one downward move and spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_nearFullMoveDownSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[8] = 0;
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_DOWN);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3800
     * @tc.name fullBoardUnchangedMoveDoesNotSpawn3800
     * @tc.desc Verify a full board with no merge is returned untouched by move, without a spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_unchangedMoveDoesNotSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      let before: number[] = values.slice();
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_3900
     * @tc.name fullBoardScoreAccumulatesOverTwoRows3900
     * @tc.desc Verify the score grows from four to sixty eight after merging the second row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_scoreAccumulatesOverTwoRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.score).assertEqual(68);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [64, 128, 256, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_4000
     * @tc.name fullBoardScoreAccumulatesOverThreeRows4000
     * @tc.desc Verify the score reaches one thousand ninety two after three row merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_scoreAccumulatesOverThreeRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.score).assertEqual(68);
      rule.moveInRow(DIR_LEFT, 2);
      expect(rule.score).assertEqual(1092);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [1024, 2048, 4096, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(13);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_4100
     * @tc.name fullBoardScoreEqualsOracleMergeScore4100
     * @tc.desc Verify a full board left move scores exactly the oracle merge score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_scoreEqualsOracleMergeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      let oracleScore: number = BoardOracle.mergeScore(values, DIR_LEFT);
      expect(rule.score).assertEqual(oracleScore);
      expect(oracleScore).assertEqual(ALL_ROWS_PAIR_SCORE);
      expect(rule.score).assertEqual(4 + 64 + 1024 + 16384);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_4200
     * @tc.name fullBoardAllDirectionsMatchOracle4200
     * @tc.desc Verify all four single line direction sweeps reproduce the oracle board and score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_allDirectionsMatchOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = rowPairBoard();
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let rule: GameRule = BoardKit.rule(values);
        for (let line: number = 0; line < SIDE; line++) {
          rule.moveInRow(directions[index], line);
        }
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, directions[index]));
        expect(rule.score).assertEqual(BoardOracle.mergeScore(values, directions[index]));
        expect(rule.dataNumbers.length).assertEqual(CELLS);
        expect(rule.isGameOver()).assertFalse();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEFULLBOARD_4300
     * @tc.name fullBoardRowAndColumnMergeScoresAdd4300
     * @tc.desc Verify a row merge and a column merge on one board add four and two hundred fifty six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fullBoard_rowAndColumnMergeScoresAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = spreadBoard();
      values[1] = 2;
      values[10] = 128;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 16, 0]);
      rule.moveInRow(DIR_UP, 2);
      expect(rule.score).assertEqual(260);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [16, 256, 32768, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(2);
    });
  });
}
