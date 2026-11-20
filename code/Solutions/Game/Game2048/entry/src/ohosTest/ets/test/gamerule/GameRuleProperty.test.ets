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
import { BoardKit, CELLS, SIDE, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/**
 * A complete 4x4 board whose cells hold the doubling chain 2..65536.
 * The value of a cell equals two raised to (index + 1), which makes every
 * index assertion self checking without a second lookup table.
 */
const SHAPE_BOARD: number[] = [
  2, 4, 8, 16,
  32, 64, 128, 256,
  512, 1024, 2048, 4096,
  8192, 16384, 32768, 65536
];

/** Value of GameStatus.BEFORE, the status a freshly constructed rule reports. */
const STATUS_BEFORE: number = -1;

/** Empty board used to prove that a line move never creates a tile. */
const P_ZEROS: number[] = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** Two equal tiles separated by two empty cells inside the first row. */
const P_ROW_SEPARATED: number[] = [
  2, 0, 0, 2,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** Two equal tiles separated by two empty cells inside the first column. */
const P_COLUMN_SEPARATED: number[] = [
  4, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  4, 0, 0, 0
];

/** Four equal tiles in one row, the classic double merge input. */
const P_FOUR_EQUAL: number[] = [
  8, 8, 8, 8,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** A nested pair pattern that keeps the outer tiles apart. */
const P_NESTED: number[] = [
  2, 4, 4, 2,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** Two independent rows that each contain one mergeable pair. */
const P_TWO_ROWS: number[] = [
  4, 0, 4, 0,
  0, 0, 0, 0,
  0, 2, 0, 2,
  0, 0, 0, 0
];

/** Fully occupied board whose four rows each contain two mergeable pairs. */
const P_FULL_PAIRS: number[] = [
  2, 2, 4, 8,
  2, 2, 4, 8,
  2, 2, 4, 8,
  2, 2, 4, 8
];

/** Four corner tiles with distinct magnitudes and no merge available. */
const P_CORNERS: number[] = [
  2, 0, 0, 8,
  0, 0, 0, 0,
  0, 0, 0, 0,
  4, 0, 0, 16
];

/** Fully occupied board that only merges along the vertical axis. */
const P_FULL_ALT: number[] = [
  4, 8, 4, 8,
  4, 8, 4, 8,
  4, 8, 4, 8,
  4, 8, 4, 8
];

/** Sparse board of large tiles used to check arithmetic without overflow. */
const P_HIGH: number[] = [
  1024, 2048, 0, 0,
  0, 1024, 2048, 0,
  0, 0, 4096, 4096,
  8192, 8192, 0, 0
];

/**
 * Applies the deterministic line move to all four lines of a board.
 *
 * This mirrors what GameRule.move does before its optional spawn, so the
 * resulting board can be compared with a pure reference model.
 */
function moveAllLines(board: number[], direction: string): GameRule {
  let rule: GameRule = BoardKit.rule(board);
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
  return rule;
}

/** Returns the largest tile of a board, or zero for an empty board. */
function maxTile(values: number[]): number {
  let max: number = 0;
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] > max) {
      max = values[index];
    }
  }
  return max;
}

/** Tells whether a value is either an original tile or one of its doubles. */
function isOriginalOrDouble(value: number, originals: number[]): boolean {
  for (let index: number = 0; index < originals.length; index++) {
    if (value === originals[index] || value === originals[index] * 2) {
      return true;
    }
  }
  return false;
}

/**
 * GameRule 行移动不变量测试套件。
 *
 * 生产实现里 moveInRow 是一次纯确定性的行/列压缩与合并：不随机补块、不修改
 * 状态、只在合并时累加分数。本套件只围绕这些不变量取证：长度、值集合、和值、
 * 占用格数、幂次、幂等性、分数与状态，并用独立模型 BoardOracle 交叉验证四个
 * 方向的盘面结果。
 */
export default function gameRulePropertyTest() {
  describe('gameRulePropertyTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRulePropertyTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRulePropertyTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0100
     * @tc.name propertyBoardLengthStaysSixteen0100
     * @tc.desc Verify a deterministic line move keeps the board sixteen cells long in every direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_boardLengthStaysSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let moved: GameRule = moveAllLines(P_FULL_PAIRS, directions[index]);
        expect(moved.dataNumbers.length).assertEqual(CELLS);
        expect(typeof moved.dataNumbers[CELLS - 1]).assertEqual('number');
        expect(moved.dataNumbers[CELLS]).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0200
     * @tc.name propertyEmptyBoardStaysEmpty0200
     * @tc.desc Verify moving an empty board in any direction never spawns a tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_emptyBoardStaysEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let moved: GameRule = moveAllLines(P_ZEROS, directions[index]);
        BoardKit.expectAllZeros(moved.dataNumbers);
        expect(BoardKit.countNonZero(moved.dataNumbers)).assertEqual(0);
        expect(BoardKit.sum(moved.dataNumbers)).assertEqual(0);
        expect(moved.score).assertEqual(0);
        expect(moved.isGameOver()).assertFalse();
        let digits: string[] | null = BoardKit.describe(moved.dataNumbers).match(/[1-9]/);
        expect(digits).assertNull();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0300
     * @tc.name propertySingleTileSlidesWithoutMerge0300
     * @tc.desc Verify one tile is only relocated by a line move and never duplicated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_singleTileSlidesWithoutMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.blank();
      board[0] = 2;
      let left: GameRule = moveAllLines(board, DIR_LEFT);
      let up: GameRule = moveAllLines(board, DIR_UP);
      BoardKit.expectValues(left.dataNumbers, board);
      BoardKit.expectValues(up.dataNumbers, board);
      let right: GameRule = moveAllLines(board, DIR_RIGHT);
      let down: GameRule = moveAllLines(board, DIR_DOWN);
      expect(right.dataNumbers[3]).assertEqual(2);
      expect(down.dataNumbers[12]).assertEqual(2);
      expect(right.score).assertEqual(0);
      expect(down.score).assertEqual(0);
      expect(BoardKit.countNonZero(right.dataNumbers)).assertEqual(1);
      expect(BoardKit.countNonZero(down.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0400
     * @tc.name propertySeparatedPairMergesOnce0400
     * @tc.desc Verify two equal tiles separated by empty cells merge into a single doubled tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_separatedPairMergesOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_ROW_SEPARATED, DIR_LEFT);
      let expected: number[] = BoardKit.blank();
      expected[0] = 4;
      BoardKit.expectValues(moved.dataNumbers, expected);
      expect(moved.score).assertEqual(4);
      expect(BoardKit.countNonZero(moved.dataNumbers)).assertEqual(1);
      expect(BoardKit.sum(moved.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0500
     * @tc.name propertyNoForeignTileValuesAppear0500
     * @tc.desc Verify every resulting tile is an original value or exactly one of its doubles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_noForeignTileValuesAppear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_NESTED, DIR_LEFT);
      let legal: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        let value: number = moved.dataNumbers[index];
        if (value !== 0 && isOriginalOrDouble(value, P_NESTED) === false) {
          legal = false;
          BoardKit.warn('property_noForeignTileValuesAppear', 'unexpected tile ' + value);
        }
      }
      expect(legal).assertTrue();
      expect(moved.dataNumbers).assertContain(8);
      expect(moved.dataNumbers).assertContain(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0600
     * @tc.name propertyMergeNeverChainsTwice0600
     * @tc.desc Verify four equal tiles become two doubled tiles instead of one quadrupled tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_mergeNeverChainsTwice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_FOUR_EQUAL, DIR_LEFT);
      let max: number = maxTile(moved.dataNumbers);
      expect(max).assertEqual(16);
      expect(max === maxTile(P_FOUR_EQUAL) * 2).assertTrue();
      expect(max !== maxTile(P_FOUR_EQUAL) * 4).assertTrue();
      expect(BoardKit.positionsOf(moved.dataNumbers, 16).length).assertEqual(2);
      expect(moved.score).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0700
     * @tc.name propertyResultTilesStayPowersOfTwo0700
     * @tc.desc Verify a power-of-two board yields only power-of-two tiles after any direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_resultTilesStayPowersOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      let allPowers: boolean = true;
      for (let index: number = 0; index < directions.length; index++) {
        let moved: GameRule = moveAllLines(P_FULL_PAIRS, directions[index]);
        for (let cell: number = 0; cell < CELLS; cell++) {
          let value: number = moved.dataNumbers[cell];
          if (value !== 0 && BoardOracle.isPowerOfTwo(value) === false) {
            allPowers = false;
            BoardKit.warn('property_resultTilesStayPowersOfTwo', 'non power tile ' + value);
          }
        }
      }
      expect(allPowers).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0800
     * @tc.name propertySumSurvivesHorizontalMove0800
     * @tc.desc Verify a horizontal line move preserves the total tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_sumSurvivesHorizontalMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let left: GameRule = moveAllLines(P_NESTED, DIR_LEFT);
      let right: GameRule = moveAllLines(P_NESTED, DIR_RIGHT);
      expect(BoardKit.sum(left.dataNumbers)).assertEqual(12);
      expect(BoardKit.sum(right.dataNumbers)).assertEqual(12);
      expect(BoardKit.sum(left.dataNumbers)).assertEqual(BoardKit.sum(P_NESTED));
      expect(BoardKit.sum(right.dataNumbers)).assertEqual(BoardKit.sum(P_NESTED));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_0900
     * @tc.name propertySumSurvivesVerticalMove0900
     * @tc.desc Verify a vertical line move preserves the total tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_sumSurvivesVerticalMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let up: GameRule = moveAllLines(P_COLUMN_SEPARATED, DIR_UP);
      let down: GameRule = moveAllLines(P_COLUMN_SEPARATED, DIR_DOWN);
      expect(BoardKit.sum(up.dataNumbers)).assertEqual(8);
      expect(BoardKit.sum(down.dataNumbers)).assertEqual(8);
      expect(BoardKit.sum(up.dataNumbers)).assertEqual(BoardKit.sum(P_COLUMN_SEPARATED));
      expect(up.dataNumbers[0]).assertEqual(8);
      expect(down.dataNumbers[12]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1000
     * @tc.name propertyOccupancyNeverIncreases1000
     * @tc.desc Verify no direction can raise the number of occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_occupancyNeverIncreases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let before: number = BoardKit.countNonZero(P_TWO_ROWS);
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      let expectedCounts: number[] = [2, 2, 4, 4];
      expect(before).assertEqual(4);
      for (let index: number = 0; index < directions.length; index++) {
        let moved: GameRule = moveAllLines(P_TWO_ROWS, directions[index]);
        expect(BoardKit.countNonZero(moved.dataNumbers)).assertEqual(expectedCounts[index]);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1100
     * @tc.name propertyMergeLowersOccupancy1100
     * @tc.desc Verify one merge removes exactly one occupied cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_mergeLowersOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let before: number = BoardKit.countNonZero(P_ROW_SEPARATED);
      let moved: GameRule = moveAllLines(P_ROW_SEPARATED, DIR_LEFT);
      let after: number = BoardKit.countNonZero(moved.dataNumbers);
      expect(before).assertEqual(2);
      expect(after).assertEqual(before - 1);
      expect(BoardKit.positionsOf(moved.dataNumbers, 4).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1200
     * @tc.name propertyShiftKeepsOccupancy1200
     * @tc.desc Verify a move without merges keeps the occupied cell count and adds no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_shiftKeepsOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_CORNERS, DIR_LEFT);
      expect(BoardKit.countNonZero(moved.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(moved.dataNumbers)).assertEqual(30);
      expect(moved.score).assertEqual(0);
      expect(BoardKit.positionsOf(moved.dataNumbers, 8).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1300
     * @tc.name propertyLeftMoveIsIdempotent1300
     * @tc.desc Verify a second left move on a stable merged row changes neither board nor score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_leftMoveIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.row([2, 2, 8, 16]);
      let first: GameRule = moveAllLines(board, DIR_LEFT);
      let expected: number[] = BoardKit.blank();
      expected[0] = 4;
      expected[1] = 8;
      expected[2] = 16;
      BoardKit.expectValues(first.dataNumbers, expected);
      expect(first.score).assertEqual(4);
      let second: GameRule = moveAllLines(first.dataNumbers, DIR_LEFT);
      BoardKit.expectValues(second.dataNumbers, first.dataNumbers);
      expect(second.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1400
     * @tc.name propertyRightMoveIsIdempotent1400
     * @tc.desc Verify a second right move on a stable merged row changes neither board nor score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_rightMoveIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.row([16, 8, 2, 2]);
      let first: GameRule = moveAllLines(board, DIR_RIGHT);
      let expected: number[] = BoardKit.blank();
      expected[1] = 16;
      expected[2] = 8;
      expected[3] = 4;
      BoardKit.expectValues(first.dataNumbers, expected);
      expect(first.score).assertEqual(4);
      let second: GameRule = moveAllLines(first.dataNumbers, DIR_RIGHT);
      BoardKit.expectValues(second.dataNumbers, first.dataNumbers);
      expect(second.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1500
     * @tc.name propertyUpMoveIsIdempotent1500
     * @tc.desc Verify a second up move on a stable merged column changes neither board nor score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_upMoveIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.column([2, 2, 8, 16]);
      let first: GameRule = moveAllLines(board, DIR_UP);
      let expected: number[] = BoardKit.column([4, 8, 16, 0]);
      BoardKit.expectValues(first.dataNumbers, expected);
      expect(first.score).assertEqual(4);
      let second: GameRule = moveAllLines(first.dataNumbers, DIR_UP);
      BoardKit.expectValues(second.dataNumbers, first.dataNumbers);
      expect(second.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1600
     * @tc.name propertyDownMoveIsIdempotent1600
     * @tc.desc Verify a second down move on a stable merged column changes neither board nor score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_downMoveIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.column([16, 8, 2, 2]);
      let first: GameRule = moveAllLines(board, DIR_DOWN);
      let expected: number[] = BoardKit.column([0, 16, 8, 4]);
      BoardKit.expectValues(first.dataNumbers, expected);
      expect(first.score).assertEqual(4);
      let second: GameRule = moveAllLines(first.dataNumbers, DIR_DOWN);
      BoardKit.expectValues(second.dataNumbers, first.dataNumbers);
      expect(second.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1700
     * @tc.name propertyCompactBoardStaysPut1700
     * @tc.desc Verify moving an already compact board adds no score and no movement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_compactBoardStaysPut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let first: GameRule = moveAllLines(P_CORNERS, DIR_LEFT);
      let second: GameRule = moveAllLines(first.dataNumbers, DIR_LEFT);
      BoardKit.expectValues(second.dataNumbers, first.dataNumbers);
      expect(first.score).assertEqual(0);
      expect(second.score).assertEqual(0);
      expect(BoardKit.countNonZero(second.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1800
     * @tc.name propertyScoreNeverDecreases1800
     * @tc.desc Verify the score field is monotonic across a sequence of line moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_scoreNeverDecreases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(P_FULL_PAIRS);
      let order: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN];
      let expectedBoard: number[] = P_FULL_PAIRS.slice();
      let expectedScore: number = 0;
      for (let step: number = 0; step < order.length; step++) {
        expectedScore = expectedScore + BoardOracle.mergeScore(expectedBoard, order[step]);
        expectedBoard = BoardOracle.move(expectedBoard, order[step]);
        for (let line: number = 0; line < SIDE; line++) {
          rule.moveInRow(order[step], line);
        }
        expect(rule.score).assertEqual(expectedScore);
        BoardKit.expectValues(rule.dataNumbers, expectedBoard);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
      expect(rule.score).assertEqual(expectedScore);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_1900
     * @tc.name propertyScoreMatchesOracleRowMerge1900
     * @tc.desc Verify a horizontal merge scores exactly what the reference model reports
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_scoreMatchesOracleRowMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_ROW_SEPARATED, DIR_LEFT);
      let expected: number = BoardOracle.mergeScore(P_ROW_SEPARATED, DIR_LEFT);
      expect(moved.score).assertEqual(expected);
      expect(moved.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2000
     * @tc.name propertyScoreMatchesOracleColumnMerge2000
     * @tc.desc Verify a vertical merge scores exactly what the reference model reports
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_scoreMatchesOracleColumnMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_COLUMN_SEPARATED, DIR_UP);
      let expected: number = BoardOracle.mergeScore(P_COLUMN_SEPARATED, DIR_UP);
      expect(moved.score).assertEqual(expected);
      expect(moved.score).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2100
     * @tc.name propertyLargeTilesScoreWithoutOverflow2100
     * @tc.desc Verify four digit merges accumulate the expected score without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_largeTilesScoreWithoutOverflow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_HIGH, DIR_LEFT);
      let expected: number = BoardOracle.mergeScore(P_HIGH, DIR_LEFT);
      expect(moved.score).assertEqual(expected);
      expect(moved.score).assertEqual(24576);
      expect(maxTile(moved.dataNumbers)).assertEqual(16384);
      expect(maxTile(moved.dataNumbers) === 32768).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2200
     * @tc.name propertyScoreStaysZeroWithoutMerge2200
     * @tc.desc Verify a pure shift leaves the score at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_scoreStaysZeroWithoutMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_CORNERS, DIR_LEFT);
      expect(moved.score).assertEqual(0);
      expect(moved.score).assertEqual(BoardOracle.mergeScore(P_CORNERS, DIR_LEFT));
      expect(moved.score === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2300
     * @tc.name propertyStatusUnchangedByRowMove2300
     * @tc.desc Verify a horizontal line move never rewrites the status field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_statusUnchangedByRowMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(P_TWO_ROWS);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_LEFT, 1);
      rule.moveInRow(DIR_LEFT, 2);
      rule.moveInRow(DIR_LEFT, 3);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2400
     * @tc.name propertyStatusUnchangedOnDeadBoard2400
     * @tc.desc Verify line moves on a finished board change neither status nor cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_statusUnchangedOnDeadBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.overBoard();
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let moved: GameRule = moveAllLines(board, directions[index]);
        BoardKit.expectValues(moved.dataNumbers, board);
        expect(moved.score).assertEqual(0);
        expect(moved.status).assertEqual(STATUS_BEFORE);
      }
      expect(BoardOracle.gameOver(board)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2500
     * @tc.name propertyUnchangedMoveSpawnsNothing2500
     * @tc.desc Verify move on an already settled board neither spawns a tile nor changes status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_unchangedMoveSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.row([2, 4, 8, 16]);
      let before: number[] = board.slice();
      let rule: GameRule = BoardKit.rule(board);
      rule.move(DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, before);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(STATUS_BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2600
     * @tc.name propertyChangedMoveSpawnsOneTile2600
     * @tc.desc Verify a changed whole-board move adds exactly one tile worth two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_changedMoveSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let before: number[] = P_ROW_SEPARATED.slice();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectChangedMove(before, after, DIR_LEFT);
      expect(after.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(after)).assertEqual(2);
      let total: number = BoardKit.sum(after);
      expect(total === 6 || total === 8).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2700
     * @tc.name propertyChangedMoveKeepsBeforeStatus2700
     * @tc.desc Verify a changed move on a board with spare cells keeps the BEFORE status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_changedMoveKeepsBeforeStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(P_ROW_SEPARATED);
      rule.move(DIR_LEFT);
      expect(rule.status).assertEqual(STATUS_BEFORE);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardOracle.gameOver(rule.dataNumbers)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2800
     * @tc.name propertySpawnDoesNotAddScore2800
     * @tc.desc Verify the random tile added by move contributes no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_spawnDoesNotAddScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(P_ROW_SEPARATED);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(P_ROW_SEPARATED, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_2900
     * @tc.name propertyOracleAgreesOnEmptyBoard2900
     * @tc.desc Verify all four directions on an empty board match the reference model exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnEmptyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_ZEROS, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_ZEROS, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_ZEROS, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(BoardKit.countNonZero(moveAllLines(P_ZEROS, DIR_LEFT).dataNumbers)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3000
     * @tc.name propertyOracleAgreesOnSeparatedRow3000
     * @tc.desc Verify all four directions on a row with a separated pair match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnSeparatedRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_ROW_SEPARATED, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_ROW_SEPARATED, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_ROW_SEPARATED, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(P_ROW_SEPARATED, DIR_LEFT).dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3100
     * @tc.name propertyOracleAgreesOnSeparatedColumn3100
     * @tc.desc Verify all four directions on a column with a separated pair match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnSeparatedColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_COLUMN_SEPARATED, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_COLUMN_SEPARATED, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_COLUMN_SEPARATED, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(P_COLUMN_SEPARATED, DIR_UP).dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3200
     * @tc.name propertyOracleAgreesOnFourEqualTiles3200
     * @tc.desc Verify all four directions on four equal tiles match the reference model exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnFourEqualTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_FOUR_EQUAL, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_FOUR_EQUAL, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_FOUR_EQUAL, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(maxTile(moveAllLines(P_FOUR_EQUAL, DIR_LEFT).dataNumbers)).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3300
     * @tc.name propertyOracleAgreesOnNestedPair3300
     * @tc.desc Verify all four directions on a nested pair pattern match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnNestedPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_NESTED, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_NESTED, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_NESTED, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(BoardKit.positionsOf(moveAllLines(P_NESTED, DIR_LEFT).dataNumbers, 8).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3400
     * @tc.name propertyOracleAgreesOnTwoMergeRows3400
     * @tc.desc Verify all four directions on two independent merging rows match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnTwoMergeRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_TWO_ROWS, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_TWO_ROWS, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_TWO_ROWS, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(BoardKit.countNonZero(moveAllLines(P_TWO_ROWS, DIR_LEFT).dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3500
     * @tc.name propertyOracleAgreesOnFullPairBoard3500
     * @tc.desc Verify all four directions on a full board of pairs match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnFullPairBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_FULL_PAIRS, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_FULL_PAIRS, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_FULL_PAIRS, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(P_FULL_PAIRS, DIR_LEFT).score).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3600
     * @tc.name propertyOracleAgreesOnCornerBoard3600
     * @tc.desc Verify all four directions on a sparse corner board match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnCornerBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_CORNERS, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_CORNERS, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_CORNERS, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(BoardKit.sum(moveAllLines(P_CORNERS, DIR_UP).dataNumbers)).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3700
     * @tc.name propertyOracleAgreesOnVerticalMergeBoard3700
     * @tc.desc Verify all four directions on a vertically mergeable full board match the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnVerticalMergeBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_FULL_ALT, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_FULL_ALT, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_FULL_ALT, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(P_FULL_ALT, DIR_UP).dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3800
     * @tc.name propertyOracleAgreesOnHighValueBoard3800
     * @tc.desc Verify all four directions on large tiles match the reference model without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_oracleAgreesOnHighValueBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(P_HIGH, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(P_HIGH, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(P_HIGH, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(maxTile(moveAllLines(P_HIGH, DIR_LEFT).dataNumbers)).assertEqual(16384);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_3900
     * @tc.name propertyMergedTileLandsAtEdge3900
     * @tc.desc Verify a merged tile is placed at the movement edge for both horizontal directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_mergedTileLandsAtEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let left: GameRule = moveAllLines(P_ROW_SEPARATED, DIR_LEFT);
      let right: GameRule = moveAllLines(P_ROW_SEPARATED, DIR_RIGHT);
      expect(left.dataNumbers[0]).assertEqual(4);
      expect(right.dataNumbers[3]).assertEqual(4);
      expect(left.dataNumbers[3]).assertEqual(0);
      expect(right.dataNumbers[0]).assertEqual(0);
      expect(left.score).assertEqual(right.score);
      expect(right.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4000
     * @tc.name propertyFourEqualTilesMergeInPairs4000
     * @tc.desc Verify four equal tiles split into two merged tiles and never collapse into one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_fourEqualTilesMergeInPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_FOUR_EQUAL, DIR_LEFT);
      expect(BoardKit.positionsOf(moved.dataNumbers, 16).length).assertEqual(2);
      expect(BoardKit.positionsOf(moved.dataNumbers, 8).length).assertEqual(0);
      expect(moved.dataNumbers[0]).assertEqual(16);
      expect(moved.dataNumbers[1]).assertEqual(16);
      expect(moved.score).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4100
     * @tc.name propertyTileCeilingIsDoubleOriginalMax4100
     * @tc.desc Verify no tile exceeds twice the largest original tile after a single move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_tileCeilingIsDoubleOriginalMax', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let originalMax: number = maxTile(P_HIGH);
      let moved: GameRule = moveAllLines(P_HIGH, DIR_LEFT);
      let movedMax: number = maxTile(moved.dataNumbers);
      expect(originalMax).assertEqual(8192);
      expect(movedMax).assertEqual(originalMax * 2);
      expect(movedMax === 32768).assertFalse();
      expect(BoardKit.positionsOf(moved.dataNumbers, 16384).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4200
     * @tc.name propertyLineMoveIsDeterministic4200
     * @tc.desc Verify two rules built from the same board produce identical boards and scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_lineMoveIsDeterministic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let first: GameRule = moveAllLines(P_NESTED, DIR_LEFT);
      let second: GameRule = moveAllLines(P_NESTED, DIR_LEFT);
      BoardKit.expectValues(second.dataNumbers, first.dataNumbers);
      expect(first.score).assertEqual(second.score);
      expect(first.score).assertEqual(8);
      expect(second.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4300
     * @tc.name propertyTwoMoveSequenceMatchesOracle4300
     * @tc.desc Verify two successive line moves equal two successive reference model moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_twoMoveSequenceMatchesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let afterLeft: number[] = BoardOracle.move(P_TWO_ROWS, DIR_LEFT);
      let expectedScore: number = BoardOracle.mergeScore(P_TWO_ROWS, DIR_LEFT);
      let afterUp: number[] = BoardOracle.move(afterLeft, DIR_UP);
      expectedScore = expectedScore + BoardOracle.mergeScore(afterLeft, DIR_UP);
      let rule: GameRule = moveAllLines(P_TWO_ROWS, DIR_LEFT);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      BoardKit.expectValues(rule.dataNumbers, afterUp);
      expect(rule.score).assertEqual(expectedScore);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4400
     * @tc.name propertySumSurvivesTwoMoves4400
     * @tc.desc Verify two successive moves keep the total tile value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_sumSurvivesTwoMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = moveAllLines(P_TWO_ROWS, DIR_LEFT);
      let afterFirst: number = BoardKit.sum(rule.dataNumbers);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      expect(afterFirst).assertEqual(12);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(afterFirst);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(P_TWO_ROWS));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4500
     * @tc.name propertyScoreIsSumOverAllLines4500
     * @tc.desc Verify a whole-board move scores the sum of its four independent line merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_scoreIsSumOverAllLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_FULL_PAIRS, DIR_LEFT);
      let perLine: number = 4;
      expect(moved.score).assertEqual(16);
      expect(moved.score).assertEqual(perLine * SIDE);
      expect(moved.score).assertEqual(BoardOracle.mergeScore(P_FULL_PAIRS, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4600
     * @tc.name propertyAllIndicesRemainNumbers4600
     * @tc.desc Verify every cell still holds a number after a merging move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_allIndicesRemainNumbers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_FULL_PAIRS, DIR_LEFT);
      let numeric: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (typeof moved.dataNumbers[index] !== 'number') {
          numeric = false;
          BoardKit.warn('property_allIndicesRemainNumbers', 'cell ' + index + ' is not numeric');
        }
      }
      expect(numeric).assertTrue();
      expect(moved.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4700
     * @tc.name propertyMergedValueIsPresent4700
     * @tc.desc Verify the doubled value produced by a merge is present on the result board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_mergedValueIsPresent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(P_FOUR_EQUAL, DIR_LEFT);
      expect(moved.dataNumbers).assertContain(16);
      expect(BoardKit.positionsOf(moved.dataNumbers, 16).length).assertEqual(2);
      expect(BoardKit.sum(moved.dataNumbers)).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEPROPERTY_4800
     * @tc.name propertyWholeMoveKeepsBoardLength4800
     * @tc.desc Verify move keeps sixteen cells even after it spawns a random tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('property_wholeMoveKeepsBoardLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let before: number[] = P_NESTED.slice();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      expect(after.length).assertEqual(CELLS);
      BoardKit.expectChangedMove(before, after, DIR_LEFT);
      expect(BoardKit.countNonZero(after)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0100
     * @tc.name shapeBoardHasSixteenCells0100
     * @tc.desc Verify a constructed rule always exposes exactly sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_boardHasSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(CELLS).assertEqual(SIDE * SIDE);
      expect(SIDE).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0200
     * @tc.name shapeEveryIndexIsReadable0200
     * @tc.desc Verify indices zero through fifteen each hold the expected numeric cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_everyIndexIsReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      let numeric: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (typeof rule.dataNumbers[index] !== 'number') {
          numeric = false;
        }
        expect(rule.dataNumbers[index]).assertEqual(Math.pow(2, index + 1));
      }
      expect(numeric).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0300
     * @tc.name shapeIndexSixteenIsOutside0300
     * @tc.desc Verify index sixteen and beyond are outside the sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_indexSixteenIsOutside', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      expect(board[CELLS - 1]).assertEqual(65536);
      expect(typeof board[0]).assertEqual('number');
      expect(board[CELLS]).assertUndefined();
      expect(board[CELLS + 1]).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0400
     * @tc.name shapeFirstRowIsIndicesZeroToThree0400
     * @tc.desc Verify the first row occupies indices zero through three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_firstRowIsIndicesZeroToThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(16);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 8, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0500
     * @tc.name shapeLastRowIsIndicesTwelveToFifteen0500
     * @tc.desc Verify the fourth row occupies indices twelve through fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_lastRowIsIndicesTwelveToFifteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers[12]).assertEqual(8192);
      expect(rule.dataNumbers[13]).assertEqual(16384);
      expect(rule.dataNumbers[14]).assertEqual(32768);
      expect(rule.dataNumbers[15]).assertEqual(65536);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [8192, 16384, 32768, 65536]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0600
     * @tc.name shapeFirstColumnIsIndicesZeroFourEightTwelve0600
     * @tc.desc Verify the first column occupies indices zero, four, eight and twelve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_firstColumnIsIndicesZeroFourEightTwelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(32);
      expect(rule.dataNumbers[8]).assertEqual(512);
      expect(rule.dataNumbers[12]).assertEqual(8192);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 32, 512, 8192]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0700
     * @tc.name shapeLastColumnIsIndicesThreeSevenElevenFifteen0700
     * @tc.desc Verify the fourth column occupies indices three, seven, eleven and fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_lastColumnIsIndicesThreeSevenElevenFifteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[7]).assertEqual(256);
      expect(rule.dataNumbers[11]).assertEqual(4096);
      expect(rule.dataNumbers[15]).assertEqual(65536);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [16, 256, 4096, 65536]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0800
     * @tc.name shapeRowOfMatchesDirectIndexing0800
     * @tc.desc Verify rowOf agrees with row major indexing for all four rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_rowOfMatchesDirectIndexing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      for (let row: number = 0; row < SIDE; row++) {
        let line: number[] = BoardKit.rowOf(rule.dataNumbers, row);
        expect(line.length).assertEqual(SIDE);
        for (let column: number = 0; column < SIDE; column++) {
          expect(line[column]).assertEqual(rule.dataNumbers[row * SIDE + column]);
        }
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_0900
     * @tc.name shapeColumnOfMatchesDirectIndexing0900
     * @tc.desc Verify columnOf agrees with column stride indexing for all four columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_columnOfMatchesDirectIndexing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      for (let column: number = 0; column < SIDE; column++) {
        let line: number[] = BoardKit.columnOf(rule.dataNumbers, column);
        expect(line.length).assertEqual(SIDE);
        for (let row: number = 0; row < SIDE; row++) {
          expect(line[row]).assertEqual(rule.dataNumbers[row * SIDE + column]);
        }
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1000
     * @tc.name shapeIndexFormulaIsRowTimesFour1000
     * @tc.desc Verify every cell index equals row times four plus column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_indexFormulaIsRowTimesFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      for (let row: number = 0; row < SIDE; row++) {
        for (let column: number = 0; column < SIDE; column++) {
          let index: number = row * SIDE + column;
          expect(index).assertEqual(row * 4 + column);
          expect(rule.dataNumbers[index]).assertEqual(Math.pow(2, index + 1));
        }
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1100
     * @tc.name shapeWithRowKeepsSourceBoard1100
     * @tc.desc Verify withRow returns a new sixteen cell board without touching the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_withRowKeepsSourceBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: number[] = SHAPE_BOARD.slice();
      let before: number[] = source.slice();
      let result: number[] = BoardKit.withRow(source, 1, [1, 3, 5, 7]);
      expect(result.length).assertEqual(CELLS);
      BoardKit.expectValues(source, before);
      BoardKit.expectValues(BoardKit.rowOf(result, 1), [1, 3, 5, 7]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1200
     * @tc.name shapeWithRowWritesOnlyTargetRow1200
     * @tc.desc Verify withRow changes the requested row and leaves the other rows intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_withRowWritesOnlyTargetRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number[] = BoardKit.withRow(SHAPE_BOARD, 2, [1, 1, 1, 1]);
      expect(result.length).assertEqual(CELLS);
      expect(result[8]).assertEqual(1);
      expect(result[11]).assertEqual(1);
      BoardKit.expectValues(BoardKit.rowOf(result, 0), BoardKit.rowOf(SHAPE_BOARD, 0));
      BoardKit.expectValues(BoardKit.rowOf(result, 1), BoardKit.rowOf(SHAPE_BOARD, 1));
      BoardKit.expectValues(BoardKit.rowOf(result, 2), [1, 1, 1, 1]);
      BoardKit.expectValues(BoardKit.rowOf(result, 3), BoardKit.rowOf(SHAPE_BOARD, 3));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1300
     * @tc.name shapeWithColumnKeepsSourceBoard1300
     * @tc.desc Verify withColumn returns a new sixteen cell board without touching the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_withColumnKeepsSourceBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: number[] = SHAPE_BOARD.slice();
      let before: number[] = source.slice();
      let result: number[] = BoardKit.withColumn(source, 2, [1, 3, 5, 7]);
      expect(result.length).assertEqual(CELLS);
      BoardKit.expectValues(source, before);
      BoardKit.expectValues(BoardKit.columnOf(result, 2), [1, 3, 5, 7]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1400
     * @tc.name shapeWithColumnWritesOnlyTargetColumn1400
     * @tc.desc Verify withColumn changes the requested column and leaves the other columns intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_withColumnWritesOnlyTargetColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let result: number[] = BoardKit.withColumn(SHAPE_BOARD, 2, [1, 1, 1, 1]);
      expect(result.length).assertEqual(CELLS);
      expect(result[2]).assertEqual(1);
      expect(result[14]).assertEqual(1);
      BoardKit.expectValues(BoardKit.columnOf(result, 0), BoardKit.columnOf(SHAPE_BOARD, 0));
      BoardKit.expectValues(BoardKit.columnOf(result, 1), BoardKit.columnOf(SHAPE_BOARD, 1));
      BoardKit.expectValues(BoardKit.columnOf(result, 2), [1, 1, 1, 1]);
      BoardKit.expectValues(BoardKit.columnOf(result, 3), BoardKit.columnOf(SHAPE_BOARD, 3));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1500
     * @tc.name shapeRepeatedRowHasIdenticalRows1500
     * @tc.desc Verify repeatedRow produces four identical rows of the supplied line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_repeatedRowHasIdenticalRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      expect(board.length).assertEqual(CELLS);
      for (let row: number = 0; row < SIDE; row++) {
        BoardKit.expectValues(BoardKit.rowOf(board, row), [2, 4, 8, 16]);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1600
     * @tc.name shapeRepeatedRowHasConstantColumns1600
     * @tc.desc Verify every column of a repeated row board holds one constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_repeatedRowHasConstantColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      let template: number[] = [2, 4, 8, 16];
      for (let column: number = 0; column < SIDE; column++) {
        let line: number[] = BoardKit.columnOf(board, column);
        for (let row: number = 0; row < SIDE; row++) {
          expect(line[row]).assertEqual(template[column]);
        }
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1700
     * @tc.name shapeRepeatedColumnHasIdenticalColumns1700
     * @tc.desc Verify repeatedColumn produces four identical columns of the supplied line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_repeatedColumnHasIdenticalColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.repeatedColumn([2, 4, 8, 16]);
      let template: number[] = [2, 4, 8, 16];
      expect(board.length).assertEqual(CELLS);
      for (let column: number = 0; column < SIDE; column++) {
        BoardKit.expectValues(BoardKit.columnOf(board, column), template);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1800
     * @tc.name shapeRepeatedColumnHasConstantRows1800
     * @tc.desc Verify every row of a repeated column board holds one constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_repeatedColumnHasConstantRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.repeatedColumn([2, 4, 8, 16]);
      let template: number[] = [2, 4, 8, 16];
      for (let row: number = 0; row < SIDE; row++) {
        let line: number[] = BoardKit.rowOf(board, row);
        for (let column: number = 0; column < SIDE; column++) {
          expect(line[column]).assertEqual(template[row]);
        }
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_1900
     * @tc.name shapeCornerIndices1900
     * @tc.desc Verify the four corner cells live at indices zero, three, twelve and fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_cornerIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(8192);
      expect(rule.dataNumbers[15]).assertEqual(65536);
      expect(BoardKit.positionsOf(rule.dataNumbers, 65536).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2000
     * @tc.name shapeCenterIndices2000
     * @tc.desc Verify the four centre cells live at indices five, six, nine and ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_centerIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      expect(rule.dataNumbers[5]).assertEqual(64);
      expect(rule.dataNumbers[6]).assertEqual(128);
      expect(rule.dataNumbers[9]).assertEqual(1024);
      expect(rule.dataNumbers[10]).assertEqual(2048);
      expect(BoardKit.positionsOf(rule.dataNumbers, 64).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2100
     * @tc.name shapeLeftMoveOnRowZeroKeepsOtherRows2100
     * @tc.desc Verify moveInRow left on row zero rewrites indices zero to three only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_leftMoveOnRowZeroKeepsOtherRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[0] = 0;
      board[1] = 2;
      board[2] = 0;
      board[3] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(0);
      for (let row: number = 1; row < SIDE; row++) {
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, row), BoardKit.rowOf(SHAPE_BOARD, row));
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2200
     * @tc.name shapeRightMoveOnRowThreeKeepsOtherRows2200
     * @tc.desc Verify moveInRow right on row three rewrites indices twelve to fifteen only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_rightMoveOnRowThreeKeepsOtherRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[12] = 0;
      board[13] = 2;
      board[14] = 0;
      board[15] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, 3);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[15]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(0);
      for (let row: number = 0; row < SIDE - 1; row++) {
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, row), BoardKit.rowOf(SHAPE_BOARD, row));
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2300
     * @tc.name shapeUpMoveOnColumnZeroKeepsOtherColumns2300
     * @tc.desc Verify moveInRow up on column zero rewrites indices zero, four, eight and twelve only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_upMoveOnColumnZeroKeepsOtherColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[0] = 0;
      board[4] = 2;
      board[8] = 0;
      board[12] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(0);
      for (let column: number = 1; column < SIDE; column++) {
        BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, column),
          BoardKit.columnOf(SHAPE_BOARD, column));
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2400
     * @tc.name shapeDownMoveOnColumnThreeKeepsOtherColumns2400
     * @tc.desc Verify moveInRow down on column three rewrites indices three, seven, eleven and fifteen only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_downMoveOnColumnThreeKeepsOtherColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[3] = 0;
      board[7] = 2;
      board[11] = 0;
      board[15] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_DOWN, 3);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[15]).assertEqual(2);
      expect(rule.dataNumbers[7]).assertEqual(0);
      for (let column: number = 0; column < SIDE - 1; column++) {
        BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, column),
          BoardKit.columnOf(SHAPE_BOARD, column));
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2500
     * @tc.name shapeRowMoveDoesNotLeakAcrossRows2500
     * @tc.desc Verify a left move on row zero cannot move a tile into row one indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_rowMoveDoesNotLeakAcrossRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[0] = 0;
      board[1] = 2;
      board[2] = 0;
      board[3] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(32);
      expect(rule.dataNumbers[5]).assertEqual(64);
      expect(rule.dataNumbers[4] === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2600
     * @tc.name shapeColumnMoveDoesNotLeakAcrossColumns2600
     * @tc.desc Verify an up move on column zero cannot move a tile into column one indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_columnMoveDoesNotLeakAcrossColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[0] = 0;
      board[4] = 2;
      board[8] = 0;
      board[12] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, 0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(0);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[5]).assertEqual(64);
      expect(rule.dataNumbers[5] === 2).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2700
     * @tc.name shapeRowSumsCoverWholeBoard2700
     * @tc.desc Verify the sum of the four row lines equals the sum of the flat board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_rowSumsCoverWholeBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      let total: number = 0;
      for (let row: number = 0; row < SIDE; row++) {
        let line: number[] = BoardKit.rowOf(rule.dataNumbers, row);
        for (let column: number = 0; column < SIDE; column++) {
          total = total + line[column];
        }
      }
      expect(total).assertEqual(BoardKit.sum(rule.dataNumbers));
      expect(total).assertEqual(131070);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2800
     * @tc.name shapeColumnSumsCoverWholeBoard2800
     * @tc.desc Verify the sum of the four column lines equals the sum of the flat board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_columnSumsCoverWholeBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      let total: number = 0;
      for (let column: number = 0; column < SIDE; column++) {
        let line: number[] = BoardKit.columnOf(rule.dataNumbers, column);
        for (let row: number = 0; row < SIDE; row++) {
          total = total + line[row];
        }
      }
      expect(total).assertEqual(BoardKit.sum(rule.dataNumbers));
      expect(total).assertEqual(131070);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_2900
     * @tc.name shapeBlankBoardIsSixteenZeros2900
     * @tc.desc Verify the blank factory produces sixteen zero cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_blankBoardIsSixteenZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.blank();
      expect(board.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(board);
      expect(BoardKit.countNonZero(board)).assertEqual(0);
      expect(BoardOracle.hasZero(board)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3000
     * @tc.name shapeZerosFactoryHonoursLength3000
     * @tc.desc Verify the zeros factory returns exactly the requested number of cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_zerosFactoryHonoursLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(BoardKit.zeros(CELLS).length).assertEqual(16);
      expect(BoardKit.zeros(SIDE).length).assertEqual(4);
      expect(BoardKit.zeros(0).length).assertEqual(0);
      BoardKit.expectAllZeros(BoardKit.zeros(CELLS));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3100
     * @tc.name shapeRuleFactoriesProduceSixteen3100
     * @tc.desc Verify both rule factories build a sixteen cell board from sixteen values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_ruleFactoriesProduceSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let direct: GameRule = BoardKit.rule(SHAPE_BOARD);
      let viaList: GameRule = BoardKit.ruleOf(BoardKit.data(SHAPE_BOARD));
      expect(direct.dataNumbers.length).assertEqual(CELLS);
      expect(viaList.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectValues(viaList.dataNumbers, direct.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3200
     * @tc.name shapeMatrixFactoryFlattensRowMajor3200
     * @tc.desc Verify the rows factory flattens a matrix in row major order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_matrixFactoryFlattensRowMajor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let matrix: number[][] = [
        [2, 4, 8, 16],
        [32, 64, 128, 256],
        [512, 1024, 2048, 4096],
        [8192, 16384, 32768, 65536]
      ];
      let board: number[] = BoardKit.rows(matrix);
      expect(board.length).assertEqual(CELLS);
      expect(board[0]).assertEqual(2);
      expect(board[1]).assertEqual(4);
      expect(board[4]).assertEqual(32);
      expect(board[15]).assertEqual(65536);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3300
     * @tc.name shapeOverBoardIsFullSixteen3300
     * @tc.desc Verify the over board fixture is full and sixteen cells wide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_overBoardIsFullSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.overBoard();
      expect(board.length).assertEqual(CELLS);
      BoardKit.expectNoZero(board);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.expectGameOver(rule, true);
      expect(BoardOracle.gameOver(board)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3400
     * @tc.name shapeHorizontalPairKeepsRowIndices3400
     * @tc.desc Verify the horizontal pair fixture keeps its pair at the last row indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_horizontalPairKeepsRowIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.horizontalPairBoard();
      expect(board.length).assertEqual(CELLS);
      expect(board[12]).assertEqual(8);
      expect(board[13]).assertEqual(8);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.expectGameOver(rule, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3500
     * @tc.name shapeVerticalPairKeepsColumnIndices3500
     * @tc.desc Verify the vertical pair fixture keeps its pair at the last column stride
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_verticalPairKeepsColumnIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.verticalPairBoard();
      expect(board.length).assertEqual(CELLS);
      expect(board[8]).assertEqual(16);
      expect(board[12]).assertEqual(16);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.isGameOver() === false).assertTrue();
      expect(BoardOracle.gameOver(board)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3600
     * @tc.name shapeBlankDescriptionHasNoTile3600
     * @tc.desc Verify a blank board renders only zero cells and no non zero digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_blankDescriptionHasNoTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let text: string = BoardKit.describe(BoardKit.blank());
      expect(text).assertContain('0');
      expect(text.match(/[1-9]/)).assertNull();
      expect(text.length).assertEqual(31);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3700
     * @tc.name shapeDescriptionKeepsRowAndColumnMarks3700
     * @tc.desc Verify the rendered board keeps four row separators and three cell separators per row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_descriptionKeepsRowAndColumnMarks', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let text: string = BoardKit.describe(SHAPE_BOARD);
      expect(text).assertContain('|');
      expect(text).assertContain('/');
      expect(text).assertContain('65536');
      expect(text).assertContain('2|4');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3800
     * @tc.name shapeLineMoveKeepsSixteenIndices3800
     * @tc.desc Verify a full board keeps sixteen numeric indices after a line move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_lineMoveKeepsSixteenIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_LEFT, line);
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(typeof rule.dataNumbers[index]).assertEqual('number');
      }
      expect(rule.dataNumbers[CELLS]).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_3900
     * @tc.name shapePositionsOfReturnsBoardIndices3900
     * @tc.desc Verify positionsOf reports the exact row major indices of a tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_positionsOfReturnsBoardIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(SHAPE_BOARD);
      let corners: number[] = BoardKit.positionsOf(rule.dataNumbers, 2);
      expect(corners.length).assertEqual(1);
      expect(corners[0]).assertEqual(0);
      let last: number[] = BoardKit.positionsOf(rule.dataNumbers, 65536);
      expect(last.length).assertEqual(1);
      expect(last[0]).assertEqual(15);
      expect(corners).assertContain(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_4000
     * @tc.name shapeSingleDifferenceReportsIndex4000
     * @tc.desc Verify a one cell mutation is reported at its exact board index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_singleDifferenceReportsIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let before: number[] = SHAPE_BOARD.slice();
      let after: number[] = SHAPE_BOARD.slice();
      after[10] = 4096;
      expect(BoardKit.singleDifference(before, after)).assertEqual(10);
      after[11] = 0;
      expect(BoardKit.singleDifference(before, after)).assertEqual(-1);
      expect(before.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_4100
     * @tc.name shapeInteriorRowMoveUsesRowIndices4100
     * @tc.desc Verify a left move on row one writes only indices four to seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_interiorRowMoveUsesRowIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[4] = 0;
      board[5] = 2;
      board[6] = 0;
      board[7] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[8]).assertEqual(512);
      expect(rule.dataNumbers[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_4200
     * @tc.name shapeInteriorRowRightMoveUsesRowIndices4200
     * @tc.desc Verify a right move on row two writes only indices eight to eleven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_interiorRowRightMoveUsesRowIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[8] = 2;
      board[9] = 0;
      board[10] = 0;
      board[11] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, 2);
      expect(rule.dataNumbers[11]).assertEqual(2);
      expect(rule.dataNumbers[8]).assertEqual(0);
      expect(rule.dataNumbers[7]).assertEqual(256);
      expect(rule.dataNumbers[12]).assertEqual(8192);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_4300
     * @tc.name shapeInteriorColumnMoveUsesStrideIndices4300
     * @tc.desc Verify an up move on column one writes only indices one, five, nine and thirteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_interiorColumnMoveUsesStrideIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[1] = 0;
      board[5] = 2;
      board[9] = 0;
      board[13] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, 1);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[6]).assertEqual(128);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEBOARDSHAPE_4400
     * @tc.name shapeInteriorColumnDownMoveUsesStrideIndices4400
     * @tc.desc Verify a down move on column two writes only indices two, six, ten and fourteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('shape_interiorColumnDownMoveUsesStrideIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = SHAPE_BOARD.slice();
      board[2] = 0;
      board[6] = 2;
      board[10] = 0;
      board[14] = 0;
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_DOWN, 2);
      expect(rule.dataNumbers[14]).assertEqual(2);
      expect(rule.dataNumbers[6]).assertEqual(0);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[15]).assertEqual(65536);
    });
  });
}
