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

/** Tile worth 2 raised to the tenth power. */
const TILE_1K: number = 1024;
/** Tile worth 2 raised to the eleventh power. */
const TILE_2K: number = 2048;
/** Tile worth 2 raised to the twelfth power. */
const TILE_4K: number = 4096;
/** Tile worth 2 raised to the thirteenth power. */
const TILE_8K: number = 8192;
/** Tile worth 2 raised to the fourteenth power. */
const TILE_16K: number = 16384;
/** Tile worth 2 raised to the sixteenth power. */
const TILE_64K: number = 65536;
/** Tile worth 2 raised to the seventeenth power. */
const TILE_128K: number = 131072;
/** Tile worth 2 raised to the fifteenth power. */
const TILE_32K: number = 32768;
/** Tile worth 2 raised to the twentieth power. */
const TILE_1M: number = 1048576;
/** Tile worth 2 raised to the twenty-first power. */
const TILE_2M: number = 2097152;
/** Tile worth 2 raised to the twenty-second power. */
const TILE_4M: number = 4194304;

/**
 * GameRule 大数合并测试套件。
 *
 * 生产实现的合并逻辑只有一句 `dataNumbers[tempA] *= 2`，因此分值越大的牌
 * 越容易暴露截断、溢出或比较误差。本套件用 1024 以上的牌验证：合并结果精确、
 * 计分等于合并后的牌面、滑动不误合并、大数与小数互不干扰、整盘判定不受数值
 * 大小影响，并且结果始终为非负偶数。
 *
 * 所有精确盘面断言都走 moveInRow（不补块），涉及 move 的用例只做契约断言。
 */

/** Status value that a rule has before any movement happened. */
const STATUS_BEFORE: number = -1;
/** All four direction literals understood by move and moveInRow. */
const DIRECTIONS: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
/** Value of 2 raised to the power thirty, the largest tile exercised here. */
const TILE_2_POW_30: number = 1073741824;
/** Value of 2 raised to the power thirty one, produced by merging two giants. */
const TILE_2_POW_31: number = 2147483648;

/**
 * Returns the cell stored at index, or null when the index lies outside the
 * board. An out of range read is a real boundary: the production board is a
 * plain array, so asking for the seventeenth cell must answer null rather
 * than wrap around to the first cell.
 */
function cellOrNull(values: number[], index: number): number | null {
  if (index < 0 || index >= values.length) {
    return null;
  }
  return values[index];
}

/**
 * Returns the cell of a board, used only to keep boundary cases readable.
 */
function cellAt(values: number[], index: number): number {
  return values[index];
}

/**
 * GameRule 边界测试套件。
 *
 * 生产实现对行和列的索引不做任何范围校验：moveInRow 的第二个参数直接参与
 * index 计算，因此 0 与 3 是合法边界，4 会越界到下一行。本套件只压边界：
 * 全同值棋盘、单行单列、四个角、中心、两端、1 与 0 混排、2^30 巨值、负数、
 * 空盘、无解满盘、行列为 0 与 3 的索引，以及连续二十次无变化移动。
 * 所有期望值都用 BoardOracle 独立复算，避免把实现现状误写成契约。
 */
export default function gameRuleEdgeCasesTest() {
  describe('gameRuleEdgeCasesTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleEdgeCasesTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleEdgeCasesTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0100
     * @tc.name edgeAllTwosBoardIsPlayable0100
     * @tc.desc Verify sixteen twos are playable and one row merges into four fours and two zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_allTwosBoardIsPlayable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardOracle.gameOver(values)).assertFalse();
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [2, 2, 2, 2]);
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0200
     * @tc.name edgeAllFoursBoardIsPlayable0200
     * @tc.desc Verify sixteen fours merge upwards into two eights per column with a doubled score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_allFoursBoardIsPlayable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([4, 4, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [8, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [4, 4, 4, 4]);
      expect(rule.score).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0300
     * @tc.name edgeTwoAdjacentGroupsMoveRight0300
     * @tc.desc Verify two neighbouring pairs pushed right become four and eight at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_twoAdjacentGroupsMoveRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      expect(rule.score).assertEqual(12);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(0);
      expect(BoardKit.zeroPositions(rule.dataNumbers)).assertContain(1);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0400
     * @tc.name edgeFourCornersEqualSparseBoard0400
     * @tc.desc Verify four equal corners on an otherwise empty board are playable, not over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_fourCornersEqualSparseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[3] = 2;
      values[12] = 2;
      values[15] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(4);
      expect(BoardKit.positionsOf(values, 2).length).assertEqual(4);
      expect(BoardKit.sum(values)).assertEqual(8);
      expect(BoardOracle.gameOver(values)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0500
     * @tc.name edgeOneFullRowThreeEmptyMoveDown0500
     * @tc.desc Verify a single full row falls to the bottom row without changing its order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_oneFullRowThreeEmptyMoveDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0600
     * @tc.name edgeOneFullColumnThreeEmptyMoveRight0600
     * @tc.desc Verify a single full column slides to the right edge in column three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_oneFullColumnThreeEmptyMoveRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.column([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0700
     * @tc.name edgeSingleTileAtEveryCorner0700
     * @tc.desc Verify a lone tile on each of the four corners cannot move further towards its edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_singleTileAtEveryCorner', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let corners: number[] = [0, 3, 12, 15];
      for (let index: number = 0; index < corners.length; index++) {
        let corner: number = corners[index];
        let board: number[] = BoardKit.blank();
        board[corner] = 2;
        let rule: GameRule = BoardKit.rule(board);
        expect(rule.isGameOver()).assertFalse();
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
        expect(cellOrNull(rule.dataNumbers, corner)).assertEqual(2);
        expect(cellOrNull(rule.dataNumbers, CELLS)).assertNull();
        let rowIndex: number = Math.floor(corner / SIDE);
        let direction: string = corner % SIDE === 0 ? DIR_LEFT : DIR_RIGHT;
        rule.moveInRow(direction, rowIndex);
        BoardKit.expectValues(rule.dataNumbers, board);
        expect(rule.score).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0800
     * @tc.name edgeSingleTileAtCenterMovesLeft0800
     * @tc.desc Verify the centre tile travels to the first cell of its row when pushed left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_singleTileAtCenterMovesLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[5] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 1);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [2, 0, 0, 0]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_0900
     * @tc.name edgeSingleTileAtCenterMovesRight0900
     * @tc.desc Verify the centre tile travels to the last cell of its row when pushed right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_singleTileAtCenterMovesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[5] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 1);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 2]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(0);
      expect(cellAt(rule.dataNumbers, 7)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1000
     * @tc.name edgeSingleTileAtCenterMovesUpAndDown1000
     * @tc.desc Verify the centre tile can reach both the top and the bottom of its column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_singleTileAtCenterMovesUpAndDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[5] = 2;
      let upRule: GameRule = BoardKit.rule(values);
      upRule.moveInRow(DIR_UP, 1);
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 1), [2, 0, 0, 0]);
      let downRule: GameRule = BoardKit.rule(values);
      downRule.moveInRow(DIR_DOWN, 1);
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 1), [0, 0, 0, 2]);
      expect(upRule.score).assertEqual(0);
      expect(downRule.score).assertEqual(0);
      expect(BoardKit.countNonZero(downRule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1100
     * @tc.name edgeTwoTilesAtBothEnds1100
     * @tc.desc Verify tiles on the two extreme cells of the board are both kept in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_twoTilesAtBothEnds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[CELLS - 1] = 4;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(values)).assertEqual(2);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_RIGHT, 3);
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.score).assertEqual(0);
      expect(cellAt(rule.dataNumbers, 0)).assertEqual(2);
      expect(cellAt(rule.dataNumbers, 15)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1200
     * @tc.name edgeOneValueMixedWithZeroMerges1200
     * @tc.desc Verify non power of two ones merge into twos because the merge test is value equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_oneValueMixedWithZeroMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([1, 1, 0, 2]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardOracle.isPowerOfTwo(values[0])).assertFalse();
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 2, 0, 0]);
      expect(rule.score).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1300
     * @tc.name edgeOneValueAcrossZeroGapMerges1300
     * @tc.desc Verify two ones separated by zeros compact first and then merge into one two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_oneValueAcrossZeroGapMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([1, 0, 1, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
      expect(rule.score).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1400
     * @tc.name edgeHugeEqualTilesMerge1400
     * @tc.desc Verify two 2^30 tiles merge into 2^31 and score 2^31 without precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_hugeEqualTilesMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([TILE_2_POW_30, TILE_2_POW_30, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [TILE_2_POW_31, 0, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(Math.pow(2, 31));
      expect(rule.score).assertEqual(TILE_2_POW_31);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1500
     * @tc.name edgeHugeUnequalTilesDoNotMerge1500
     * @tc.desc Verify the two largest unequal tiles stay apart and keep the board sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_hugeUnequalTilesDoNotMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([TILE_2_POW_30, 536870912, TILE_2_POW_30, 536870912]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.score).assertEqual(0);
      BoardKit.expectSumPreserved(values, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1600
     * @tc.name edgeTinyNegativesDoNotMerge1600
     * @tc.desc Verify unequal tiny negative tiles stay untouched and are treated as occupied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_tinyNegativesDoNotMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([-1, -2, -4, -8]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(-15);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1700
     * @tc.name edgeEqualNegativesMerge1700
     * @tc.desc Verify equal negative neighbours merge by value equality, yielding a negative score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_equalNegativesMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([-2, -2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [-4, 0, 0, 0]);
      expect(rule.dataNumbers[0] < 0).assertTrue();
      expect(rule.score).assertEqual(-4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1800
     * @tc.name edgeZeroBoardSurvivesEveryDirection1800
     * @tc.desc Verify an empty board stays all zeros after every line of every direction moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_zeroBoardSurvivesEveryDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (let directionIndex: number = 0; directionIndex < DIRECTIONS.length; directionIndex++) {
        let rule: GameRule = BoardKit.rule(BoardKit.blank());
        for (let line: number = 0; line < SIDE; line++) {
          rule.moveInRow(DIRECTIONS[directionIndex], line);
        }
        BoardKit.expectAllZeros(rule.dataNumbers);
        expect(rule.score).assertEqual(0);
        expect(rule.isGameOver()).assertFalse();
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_1900
     * @tc.name edgeFullUnsolvedBoardStaysStable1900
     * @tc.desc Verify a full board with no merge is identical after every direction moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_fullUnsolvedBoardStaysStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      for (let directionIndex: number = 0; directionIndex < DIRECTIONS.length; directionIndex++) {
        let rule: GameRule = BoardKit.rule(values);
        for (let line: number = 0; line < SIDE; line++) {
          rule.moveInRow(DIRECTIONS[directionIndex], line);
        }
        BoardKit.expectValues(rule.dataNumbers, values);
        expect(rule.score).assertEqual(0);
        expect(rule.isGameOver()).assertTrue();
        expect(rule.status).assertEqual(STATUS_BEFORE);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2000
     * @tc.name edgeRowZeroOnlyMoveLeft2000
     * @tc.desc Verify moving row zero left does not touch rows one to three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_rowZeroOnlyMoveLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.withRow(BoardKit.blank(), 0, [2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(12);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2100
     * @tc.name edgeRowThreeOnlyMoveRight2100
     * @tc.desc Verify the bottom row is a valid target for a right move and stays isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_rowThreeOnlyMoveRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.withRow(BoardKit.blank(), 3, [4, 4, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 3);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 8, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(12);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2200
     * @tc.name edgeColumnZeroOnlyMoveUp2200
     * @tc.desc Verify moving column zero up leaves the three other columns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_columnZeroOnlyMoveUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.withColumn(BoardKit.blank(), 0, [2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(12);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2300
     * @tc.name edgeColumnThreeOnlyMoveDown2300
     * @tc.desc Verify moving the last column down is a legal boundary operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_columnThreeOnlyMoveDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.withColumn(BoardKit.blank(), 3, [4, 4, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 8, 4]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 0, 0]);
      expect(rule.score).assertEqual(12);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2400
     * @tc.name edgeTileAtLastCellMovesLeft2400
     * @tc.desc Verify the tile on cell fifteen reaches the start of the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_tileAtLastCellMovesLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[CELLS - 1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 3);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 0, 0, 0]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(cellAt(rule.dataNumbers, CELLS - 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2500
     * @tc.name edgeTileAtFirstCellMovesRight2500
     * @tc.desc Verify the tile on cell zero reaches the end of the first row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_tileAtFirstCellMovesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(cellAt(rule.dataNumbers, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2600
     * @tc.name edgePackedTileStaysOnBothEdges2600
     * @tc.desc Verify a tile already touching the target edge does not move or merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_packedTileStaysOnBothEdges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rightPacked: number[] = BoardKit.row([0, 0, 0, 2]);
      let rightRule: GameRule = BoardKit.rule(rightPacked);
      rightRule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(rightRule.dataNumbers, rightPacked);
      let leftPacked: number[] = BoardKit.row([2, 0, 0, 0]);
      let leftRule: GameRule = BoardKit.rule(leftPacked);
      leftRule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(leftRule.dataNumbers, leftPacked);
      expect(rightRule.score).assertEqual(0);
      expect(leftRule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rightRule.dataNumbers)).assertEqual(1);
      expect(BoardKit.countNonZero(leftRule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2700
     * @tc.name edgeZeroGapsCompactWithoutMerge2700
     * @tc.desc Verify interior zeros are removed without changing the tile values or the sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_zeroGapsCompactWithoutMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 0, 0]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2800
     * @tc.name edgeLeadingZerosCompactBothDirections2800
     * @tc.desc Verify zeros on either edge are removed by the opposite direction move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_leadingZerosCompactBothDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leading: number[] = BoardKit.row([0, 0, 2, 4]);
      let leftRule: GameRule = BoardKit.rule(leading);
      leftRule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(leftRule.dataNumbers, 0), [2, 4, 0, 0]);
      let trailing: number[] = BoardKit.row([2, 4, 0, 0]);
      let rightRule: GameRule = BoardKit.rule(trailing);
      rightRule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rightRule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(leftRule.score).assertEqual(0);
      expect(rightRule.score).assertEqual(0);
      expect(BoardKit.sum(rightRule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_2900
     * @tc.name edgeTwentyMovesOnSolvedBoard2900
     * @tc.desc Verify twenty no-op whole board moves leave the solved board and score unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_twentyMovesOnSolvedBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      for (let round: number = 0; round < 20; round++) {
        rule.move(DIR_LEFT);
      }
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(rule.isGameOver()).assertTrue();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_3000
     * @tc.name edgeTwentyAlternatingMovesOnSolvedBoard3000
     * @tc.desc Verify twenty alternating horizontal and vertical no-op moves keep the board stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_twentyAlternatingMovesOnSolvedBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      for (let round: number = 0; round < 20; round++) {
        if (round % 2 === 0) {
          rule.move(DIR_LEFT);
        } else {
          rule.move(DIR_UP);
        }
      }
      BoardKit.expectValues(rule.dataNumbers, values);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.isGameOver() === BoardOracle.gameOver(values)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_3100
     * @tc.name edgeZeroRowStableInEveryDirection3100
     * @tc.desc Verify an all zero first row stays zero after all four one line moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_zeroRowStableInEveryDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      for (let directionIndex: number = 0; directionIndex < DIRECTIONS.length; directionIndex++) {
        let rule: GameRule = BoardKit.rule(values);
        rule.moveInRow(DIRECTIONS[directionIndex], 0);
        BoardKit.expectAllZeros(rule.dataNumbers);
        expect(rule.score).assertEqual(0);
        expect(rule.isGameOver()).assertFalse();
        expect(cellOrNull(rule.dataNumbers, CELLS)).assertNull();
        expect(rule.dataNumbers[CELLS]).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_3200
     * @tc.name edgeSingleTileAtEdgeMiddles3200
     * @tc.desc Verify a lone tile at each edge middle moves only towards the edge it faces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_singleTileAtEdgeMiddles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let spots: number[] = [1, 4, 7, 13];
      let pushes: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN];
      let landings: number[] = [0, 0, 7, 13];
      for (let index: number = 0; index < spots.length; index++) {
        let spot: number = spots[index];
        let board: number[] = BoardKit.blank();
        board[spot] = 4;
        let rule: GameRule = BoardKit.rule(board);
        let line: number = 0;
        if (pushes[index] === DIR_LEFT || pushes[index] === DIR_RIGHT) {
          line = Math.floor(spot / SIDE);
        } else {
          line = spot % SIDE;
        }
        rule.moveInRow(pushes[index], line);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
        expect(cellOrNull(rule.dataNumbers, landings[index])).assertEqual(4);
        expect(rule.score).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_3300
     * @tc.name edgeMixedSignAndHugeValues3300
     * @tc.desc Verify negative and 2^30 tiles side by side neither merge nor swap on a left move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_mixedSignAndHugeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([-1, TILE_2_POW_30, -2, TILE_2_POW_30]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardOracle.isPowerOfTwo(values[2])).assertFalse();
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [-1, TILE_2_POW_30, -2, TILE_2_POW_30]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2147483645);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEEDGECASES_3400
     * @tc.name edgeLastCellTileMovesUp3400
     * @tc.desc Verify the tile at cell fifteen rises to cell three along the last column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('edge_lastCellTileMovesUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[CELLS - 1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [2, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 0]);
      expect(cellAt(rule.dataNumbers, 3)).assertEqual(2);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0100
     * @tc.name bigNumbersMerge1024Pair0100
     * @tc.desc Verify two 1024 tiles merge into one 2048 tile and add 2048 to the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge1024Pair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, TILE_1K, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_merge1024Pair', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[1]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_2K);
      expect(rule.dataNumbers[0] === TILE_1K).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0200
     * @tc.name bigNumbersMerge1024PairsInTwoRows0200
     * @tc.desc Verify two independent 1024 merges accumulate their values into one score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge1024PairsInTwoRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let firstRow: number[] = [TILE_1K, TILE_1K, 0, 0];
      let values: number[] = BoardKit.withRow(BoardKit.row(firstRow), 1, firstRow);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_LEFT, 1);
      BoardKit.logBoard('bigNumbers_merge1024PairsInTwoRows', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[4]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.dataNumbers[5]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_2K + TILE_2K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0300
     * @tc.name bigNumbersMerge2048Pair0300
     * @tc.desc Verify two 2048 tiles merge into one 4096 tile worth the full merge value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge2048Pair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_2K, TILE_2K, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_merge2048Pair', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_4K);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      BoardKit.expectScore(rule, TILE_4K);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(TILE_4K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0400
     * @tc.name bigNumbersMerge8192PairOnRight0400
     * @tc.desc Verify an 8192 pair merges towards the right edge into one 16384 tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge8192PairOnRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 0, TILE_8K, TILE_8K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.logBoard('bigNumbers_merge8192PairOnRight', rule.dataNumbers);
      expect(rule.dataNumbers[3]).assertEqual(TILE_16K);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_16K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0500
     * @tc.name bigNumbersMerge65536Pair0500
     * @tc.desc Verify a 65536 pair merges into 131072 without any precision loss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge65536Pair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_64K, TILE_64K, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_merge65536Pair', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_128K);
      expect(rule.dataNumbers[0] - TILE_64K).assertEqual(TILE_64K);
      BoardKit.expectScore(rule, TILE_128K);
      expect(BoardKit.positionsOf(rule.dataNumbers, TILE_128K).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0600
     * @tc.name bigNumbersMerge2Pow20Pair0600
     * @tc.desc Verify a pair one million strong merges into exactly 2097152
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge2Pow20Pair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1M, TILE_1M, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_merge2Pow20Pair', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2M);
      expect(rule.dataNumbers[0]).assertEqual(TILE_1M * 2);
      BoardKit.expectScore(rule, TILE_2M);
      expect(BoardOracle.isPowerOfTwo(rule.dataNumbers[0])).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0700
     * @tc.name bigNumbersTwoMergesInOneRow0700
     * @tc.desc Verify a 1024 pair and a 2048 pair merge side by side in a single row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_twoMergesInOneRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, TILE_1K, TILE_2K, TILE_2K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_twoMergesInOneRow', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_4K);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_2K + TILE_4K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0800
     * @tc.name bigNumbersSlideWithoutMerge0800
     * @tc.desc Verify two different big tiles slide together without being merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_slideWithoutMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, TILE_1K, 0, TILE_2K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_slideWithoutMerge', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_1K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_2K);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectSumPreserved(values, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_0900
     * @tc.name bigNumbersDoNotMergeWithSmallTile0900
     * @tc.desc Verify a big tile never merges with a small tile of a different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_doNotMergeWithSmallTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_doNotMergeWithSmallTile', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_1K);
      expect(rule.dataNumbers[1]).assertEqual(2);
      BoardKit.expectBoard(rule, values);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0] === TILE_2K).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1000
     * @tc.name bigNumbersMixedChainScore1000
     * @tc.desc Verify a small pair and a big pair in the same row score their own values only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_mixedChainScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, TILE_1K, TILE_1K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_mixedChainScore', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(TILE_2K);
      BoardKit.expectScore(rule, 4 + TILE_2K);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1100
     * @tc.name bigNumbersColumnUpMerge1100
     * @tc.desc Verify a 2048 pair merges upwards inside one column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_columnUpMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([TILE_2K, 0, TILE_2K, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.logBoard('bigNumbers_columnUpMerge', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_4K);
      expect(rule.dataNumbers[8]).assertEqual(0);
      expect(BoardKit.columnOf(rule.dataNumbers, 0)[0]).assertEqual(TILE_4K);
      BoardKit.expectScore(rule, TILE_4K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1200
     * @tc.name bigNumbersColumnDownMerge1200
     * @tc.desc Verify an 8192 pair merges downwards to the bottom of its column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_columnDownMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, TILE_8K, 0, TILE_8K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.logBoard('bigNumbers_columnDownMerge', rule.dataNumbers);
      expect(rule.dataNumbers[12]).assertEqual(TILE_16K);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_16K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1300
     * @tc.name bigNumbersFullRowKeepsOrder1300
     * @tc.desc Verify four distinct big tiles keep their order and never merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_fullRowKeepsOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_4K, TILE_8K, TILE_16K, TILE_64K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_fullRowKeepsOrder', rule.dataNumbers);
      BoardKit.expectBoard(rule, values);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('65536');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1400
     * @tc.name bigNumbersRightSlideKeepsOrder1400
     * @tc.desc Verify two big tiles keep their relative order when sliding right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_rightSlideKeepsOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_4K, 0, TILE_8K, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.logBoard('bigNumbers_rightSlideKeepsOrder', rule.dataNumbers);
      expect(rule.dataNumbers[2]).assertEqual(TILE_4K);
      expect(rule.dataNumbers[3]).assertEqual(TILE_8K);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1500
     * @tc.name bigNumbersTwoPhaseMergeReaches4M1500
     * @tc.desc Verify two million valued tiles merge across two phases into 4194304
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_twoPhaseMergeReaches4M', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pair: number[] = [TILE_1M, TILE_1M, 0, 0];
      let values: number[] = BoardKit.withRow(BoardKit.row(pair), 1, pair);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2M);
      expect(rule.dataNumbers[4]).assertEqual(TILE_2M);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.logBoard('bigNumbers_twoPhaseMergeReaches4M', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_4M);
      expect(rule.dataNumbers[4]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_4M + TILE_4M);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1600
     * @tc.name bigNumbersFourTilePairsMerge1600
     * @tc.desc Verify four 1024 tiles collapse into two 2048 tiles with a 4096 score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_fourTilePairsMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, TILE_1K, TILE_1K, TILE_1K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_fourTilePairsMerge', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, TILE_2K).length).assertEqual(2);
      BoardKit.expectScore(rule, TILE_4K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1700
     * @tc.name bigNumbersScoreMatchesMergedTile1700
     * @tc.desc Verify the score grows by the merged tile value, not by the input tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_scoreMatchesMergedTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_64K, TILE_64K, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(rule.dataNumbers[0]);
      expect(rule.score).assertEqual(TILE_128K);
      expect(rule.score === TILE_64K).assertFalse();
      expect(rule.score > TILE_64K).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1800
     * @tc.name bigNumbersScoreAccumulatesOverRows1800
     * @tc.desc Verify two 8192 merges in different rows accumulate into a 32768 score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_scoreAccumulatesOverRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pair: number[] = [TILE_8K, TILE_8K, 0, 0];
      let values: number[] = BoardKit.withRow(BoardKit.row(pair), 3, pair);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectScore(rule, TILE_16K);
      rule.moveInRow(DIR_LEFT, 3);
      BoardKit.logBoard('bigNumbers_scoreAccumulatesOverRows', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_16K);
      expect(rule.dataNumbers[12]).assertEqual(TILE_16K);
      BoardKit.expectScore(rule, TILE_16K + TILE_16K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_1900
     * @tc.name bigNumbersPresetScoreAccumulates1900
     * @tc.desc Verify a big merge adds to a score that already carries earlier points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_presetScoreAccumulates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, TILE_1K, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.score = 1000;
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_presetScoreAccumulates', rule.dataNumbers);
      expect(rule.score).assertEqual(1000 + TILE_2K);
      expect(rule.score > TILE_2K).assertTrue();
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2000
     * @tc.name bigNumbersGameOverAlternating2000
     * @tc.desc Verify a full board of alternating 1024 and 2048 tiles is judged over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_gameOverAlternating', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.zeros(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        let rowIndex: number = Math.floor(index / SIDE);
        let columnIndex: number = index % SIDE;
        values[index] = (rowIndex + columnIndex) % 2 === 0 ? TILE_1K : TILE_2K;
      }
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('bigNumbers_gameOverAlternating', rule.dataNumbers);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectGameOver(rule, true);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2100
     * @tc.name bigNumbersGameOverFalseWithPair2100
     * @tc.desc Verify one adjacent 2048 pair keeps a full big tile board playable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_gameOverFalseWithPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.zeros(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        let rowIndex: number = Math.floor(index / SIDE);
        let columnIndex: number = index % SIDE;
        values[index] = (rowIndex + columnIndex) % 2 === 0 ? TILE_1K : TILE_2K;
      }
      values[0] = TILE_2K;
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.logBoard('bigNumbers_gameOverFalseWithPair', rule.dataNumbers);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.expectGameOver(rule, false);
      expect(rule.dataNumbers[0] === rule.dataNumbers[1]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2200
     * @tc.name bigNumbersMoveOnOverBoardIsInert2200
     * @tc.desc Verify moving a big tile board with no merge leaves it and its status untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_moveOnOverBoardIsInert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.zeros(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        let rowIndex: number = Math.floor(index / SIDE);
        let columnIndex: number = index % SIDE;
        values[index] = (rowIndex + columnIndex) % 2 === 0 ? TILE_1K : TILE_2K;
      }
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('bigNumbers_moveOnOverBoardIsInert', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectStatus(rule, -1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2300
     * @tc.name bigNumbersChangedMoveUsesAllowedTiles2300
     * @tc.desc Verify a big tile board after a changed move holds only old, doubled or spawned values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_changedMoveUsesAllowedTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.withRow(BoardKit.row([2, 2, 0, 4]), 2, [TILE_4K, 0, 0, 0]);
      let allowed: number[] = [0, 2, 4];
      for (let index: number = 0; index < CELLS; index++) {
        allowed.push(before[index]);
        allowed.push(before[index] * 2);
      }
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('bigNumbers_changedMoveUsesAllowedTiles', rule.dataNumbers);
      BoardKit.expectTileSet(rule.dataNumbers, allowed);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2400
     * @tc.name bigNumbersChangedMoveKeepsBigTiles2400
     * @tc.desc Verify a changed move keeps the merged 2048 and the untouched 4096 exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_changedMoveKeepsBigTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.withRow(BoardKit.row([TILE_1K, TILE_1K, 0, 0]), 2, [TILE_4K, 0, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.logBoard('bigNumbers_changedMoveKeepsBigTiles', after);
      let spawn: number = BoardKit.singleDifference(expected, after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(BoardKit.positionsOf(after, TILE_2K).length).assertEqual(1);
      expect(BoardKit.positionsOf(after, TILE_4K).length).assertEqual(1);
      let spawned: number = after[spawn];
      expect(spawned === 2 || spawned === 4).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2500
     * @tc.name bigNumbersNeverNegative2500
     * @tc.desc Verify no move can turn a big tile negative on any cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_neverNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.withRow(BoardKit.row([TILE_1K, TILE_1K, 0, 0]), 3, [TILE_8K, 0, TILE_8K, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('bigNumbers_neverNegative', rule.dataNumbers);
      let minimum: number = rule.dataNumbers[0];
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] < minimum) {
          minimum = rule.dataNumbers[index];
        }
        expect(rule.dataNumbers[index] >= 0).assertTrue();
      }
      expect(minimum).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2600
     * @tc.name bigNumbersResultsAreEven2600
     * @tc.desc Verify every tile left by a big merge is an even number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_resultsAreEven', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let pair: number[] = [TILE_1K, TILE_1K, 0, 0];
      let values: number[] = BoardKit.withRow(BoardKit.row(pair), 2, pair);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_LEFT, 2);
      BoardKit.logBoard('bigNumbers_resultsAreEven', rule.dataNumbers);
      let oddCells: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] % 2 !== 0) {
          oddCells = oddCells + 1;
        }
      }
      expect(oddCells).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[8]).assertEqual(TILE_2K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2700
     * @tc.name bigNumbersRemainPowersOfTwo2700
     * @tc.desc Verify merged big tiles stay powers of two after a two pair merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_remainPowersOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, TILE_1K, TILE_2K, TILE_2K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_remainPowersOfTwo', rule.dataNumbers);
      let allPowers: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== 0 && !BoardOracle.isPowerOfTwo(rule.dataNumbers[index])) {
          allPowers = false;
        }
      }
      expect(allPowers).assertTrue();
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_4K);
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2800
     * @tc.name bigNumbersLengthStaysSixteen2800
     * @tc.desc Verify a big tile move neither grows nor shrinks the board array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_lengthStaysSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_1K, TILE_1K, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('bigNumbers_lengthStaysSixteen', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      expect(rule.dataNumbers.length === CELLS).assertTrue();
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_2900
     * @tc.name bigNumbersMoveInRowMatchesOracle2900
     * @tc.desc Verify a single row big tile move matches the independent reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_moveInRowMatchesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, TILE_1K, TILE_1K, TILE_2K]);
      let expected: number[] = BoardOracle.move(values, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_moveInRowMatchesOracle', rule.dataNumbers);
      BoardKit.expectValues(rule.dataNumbers, expected);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_2K);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('2048');
      expect(BoardOracle.isPowerOfTwo(rule.dataNumbers[0])).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_3000
     * @tc.name bigNumbersRowsAreIndependent3000
     * @tc.desc Verify merging big tiles in one row leaves the other rows untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_rowsAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.withRow(BoardKit.row([TILE_1K, TILE_1K, 0, 0]), 1, [TILE_8K, TILE_8K, 0, 0]);
      values = BoardKit.withRow(values, 2, [TILE_4K, 0, TILE_4K, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 1);
      BoardKit.logBoard('bigNumbers_rowsAreIndependent', rule.dataNumbers);
      expect(rule.dataNumbers[4]).assertEqual(TILE_16K);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(TILE_1K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_1K);
      expect(rule.dataNumbers[8]).assertEqual(TILE_4K);
      BoardKit.expectScore(rule, TILE_16K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_3100
     * @tc.name bigNumbersSumPreservedBySlides3100
     * @tc.desc Verify sliding big tiles across rows keeps the board sum on every phase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_sumPreservedBySlides', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.withRow(BoardKit.row([0, TILE_1K, 0, TILE_2K]), 1, [0, TILE_4K, 0, TILE_8K]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      rule.moveInRow(DIR_LEFT, 1);
      BoardKit.logBoard('bigNumbers_sumPreservedBySlides', rule.dataNumbers);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_1K);
      expect(rule.dataNumbers[1]).assertEqual(TILE_2K);
      expect(rule.dataNumbers[4]).assertEqual(TILE_4K);
      expect(rule.dataNumbers[5]).assertEqual(TILE_8K);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_3200
     * @tc.name bigNumbersMerge16384PairUp3200
     * @tc.desc Verify a 16384 pair collapses upwards into a single 32768 tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge16384PairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 0, TILE_16K, TILE_16K]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.logBoard('bigNumbers_merge16384PairUp', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_32K);
      expect(rule.dataNumbers[8]).assertEqual(0);
      expect(rule.dataNumbers[12]).assertEqual(0);
      BoardKit.expectScore(rule, TILE_32K);
      expect(BoardOracle.isPowerOfTwo(rule.dataNumbers[0])).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_3300
     * @tc.name bigNumbersMerge2Pow21Pair3300
     * @tc.desc Verify a 2097152 pair doubles exactly once into 4194304
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_merge2Pow21Pair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([TILE_2M, TILE_2M, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_merge2Pow21Pair', rule.dataNumbers);
      expect(rule.dataNumbers[0]).assertEqual(TILE_4M);
      expect(rule.dataNumbers[0]).assertEqual(TILE_2M * 2);
      BoardKit.expectScore(rule, TILE_4M);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(TILE_4M);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBIGNUMBERS_3400
     * @tc.name bigNumbersSlideKeepsZeroCount3400
     * @tc.desc Verify sliding two big tiles leaves the same number of empty cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigNumbers_slideKeepsZeroCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, TILE_1K, 0, TILE_2K]);
      let rule: GameRule = BoardKit.rule(values);
      let zerosBefore: number = BoardKit.zeroPositions(values).length;
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('bigNumbers_slideKeepsZeroCount', rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(zerosBefore);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(zerosBefore).assertEqual(14);
      BoardKit.expectScore(rule, 0);
    });
  });
}
