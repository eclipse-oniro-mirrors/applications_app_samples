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
 * Returns the first cell index that holds target, or null when no cell does.
 */
function indexOfOrNull(values: number[], target: number): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return null;
}

/**
 * Returns the cell value at index, or undefined when index is outside the
 * board.
 */
function cellAtOrUndefined(values: number[], index: number): number | undefined {
  if (index < 0 || index >= values.length) {
    return undefined;
  }
  return values[index];
}

/**
 * Builds a deterministic rule by running one line move on every row or column.
 * No random tile is spawned, so the score and the board are exactly the
 * contribution of the chosen direction.
 */
function applyDirection(values: number[], direction: string): GameRule {
  let rule: GameRule = BoardKit.rule(values);
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
  return rule;
}

/**
 * GameRule 四向计分矩阵测试套件。
 *
 * 每个盘面按 left、right、up、down 各移动一次，把生产实现得到的 score 与
 * BoardOracle.mergeScore 的独立结果以及写死的期望值三方比对。横向移动只
 * 合并行内相邻同值格，纵向移动只合并列内相邻同值格，因此同一盘面在不同
 * 方向的得分可以不同，而同一条线正反两向的合并总分相同。
 */
export default function gameRuleScoreMatrixTest() {
  describe('gameRuleScoreMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleScoreMatrixTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleScoreMatrixTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0100
     * @tc.name matrixSingleRowPairLeft0100
     * @tc.desc Verify a single row pair scores four and lands on the left edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_singleRowPairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0200
     * @tc.name matrixSingleRowPairRight0200
     * @tc.desc Verify the same row pair scores four and lands on the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_singleRowPairRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('0|0|0|4');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0300
     * @tc.name matrixSingleRowPairUp0300
     * @tc.desc Verify a horizontal pair cannot merge during an upward move and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_singleRowPairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0400
     * @tc.name matrixSingleRowPairDown0400
     * @tc.desc Verify the same horizontal pair slides to the bottom without scoring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_singleRowPairDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 2, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0500
     * @tc.name matrixTwoPairsLeft0500
     * @tc.desc Verify two pairs on one row score twelve when moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoPairsLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(12);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 0, 0]);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('4|8|0|0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0600
     * @tc.name matrixTwoPairsRight0600
     * @tc.desc Verify the same two pairs score twelve when moving right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoPairsRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(12);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0700
     * @tc.name matrixTwoPairsUp0700
     * @tc.desc Verify two rows of horizontal pairs cannot merge upward and score zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoPairsUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 2, 4, 4]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0800
     * @tc.name matrixTwoPairsDown0800
     * @tc.desc Verify the same single row drops to the bottom unchanged and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoPairsDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 2, 4, 4]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_0900
     * @tc.name matrixFourEqualLeft0900
     * @tc.desc Verify four equal tiles score sixteen for the left direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fourEqualLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([4, 4, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(16);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [8, 8, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1000
     * @tc.name matrixFourEqualRight1000
     * @tc.desc Verify the same four equal tiles score sixteen for the right direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fourEqualRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([4, 4, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(16);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 8, 8]);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('0|0|8|8');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1100
     * @tc.name matrixFourEqualUp1100
     * @tc.desc Verify four equal tiles in one row do not form vertical pairs and score zero upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fourEqualUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([4, 4, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1200
     * @tc.name matrixFourEqualDown1200
     * @tc.desc Verify the four equal row slides to the bottom as four separate tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fourEqualDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([4, 4, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [4, 4, 4, 4]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1300
     * @tc.name matrixGapPairLeft1300
     * @tc.desc Verify a gap separated pair scores four after compaction to the left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_gapPairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(indexOfOrNull(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1400
     * @tc.name matrixGapPairRight1400
     * @tc.desc Verify the same gap separated pair scores four at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_gapPairRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1500
     * @tc.name matrixGapPairUp1500
     * @tc.desc Verify a horizontal gap pair cannot merge upward and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_gapPairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1600
     * @tc.name matrixGapPairDown1600
     * @tc.desc Verify the same horizontal gap pair drops unchanged and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_gapPairDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 0, 0, 2]);
      expect(rule.score === 4).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1700
     * @tc.name matrixNoMergeRowLeft1700
     * @tc.desc Verify an already compact row with distinct values scores zero leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_noMergeRowLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 8, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1800
     * @tc.name matrixNoMergeRowRight1800
     * @tc.desc Verify the same distinct row is already at the right edge and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_noMergeRowRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectBoard(rule, before);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('2|4|8|16');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_1900
     * @tc.name matrixNoMergeRowUp1900
     * @tc.desc Verify a single distinct row stays put during an upward move and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_noMergeRowUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [16, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2000
     * @tc.name matrixNoMergeRowDown2000
     * @tc.desc Verify the distinct row slides to the bottom and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_noMergeRowDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2100
     * @tc.name matrixColumnPairLeft2100
     * @tc.desc Verify a vertical pair cannot merge horizontally and scores zero leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnPairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 2, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2200
     * @tc.name matrixColumnPairRight2200
     * @tc.desc Verify the same vertical pair slides to the right edge without scoring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnPairRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 2]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2300
     * @tc.name matrixColumnPairUp2300
     * @tc.desc Verify a vertical pair scores four when merged upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnPairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2400
     * @tc.name matrixColumnPairDown2400
     * @tc.desc Verify the same vertical pair scores four when merged downward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnPairDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [4, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2500
     * @tc.name matrixColumnThreeLeft2500
     * @tc.desc Verify three vertical equal tiles cannot merge horizontally and score zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnThreeLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 2, 0]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 2, 2, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2600
     * @tc.name matrixColumnThreeRight2600
     * @tc.desc Verify the three vertical tiles slide right without merging and score zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnThreeRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 2, 0]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [2, 2, 2, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2700
     * @tc.name matrixColumnThreeUp2700
     * @tc.desc Verify three vertical equal tiles score one merge worth four upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnThreeUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 2, 0]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 2, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2800
     * @tc.name matrixColumnThreeDown2800
     * @tc.desc Verify the same three tiles score four when merged downward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_columnThreeDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 2, 0]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [4, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_2900
     * @tc.name matrixTwoRowsLeft2900
     * @tc.desc Verify two independent row pairs add twelve when moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoRowsLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(12);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [8, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3000
     * @tc.name matrixTwoRowsRight3000
     * @tc.desc Verify the same two row pairs add twelve when moving right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoRowsRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(12);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3100
     * @tc.name matrixTwoRowsUp3100
     * @tc.desc Verify two horizontal pairs cannot merge upward and score zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoRowsUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [2, 4, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3200
     * @tc.name matrixTwoRowsDown3200
     * @tc.desc Verify the two row pairs slide down unchanged and score zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoRowsDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [2, 2, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [4, 4, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3300
     * @tc.name matrixOverBoardLeft3300
     * @tc.desc Verify a full checkerboard scores zero leftward and contains no empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_overBoardLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectBoard(rule, before);
      expect(indexOfOrNull(rule.dataNumbers, 0)).assertNull();
      expect(cellAtOrUndefined(rule.dataNumbers, CELLS)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3400
     * @tc.name matrixOverBoardRight3400
     * @tc.desc Verify the full checkerboard scores zero rightward and keeps every row pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_overBoardRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 2, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [4, 2, 4, 2]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3500
     * @tc.name matrixOverBoardUp3500
     * @tc.desc Verify the full checkerboard scores zero upward because columns never repeat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_overBoardUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 4, 2, 4]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3600
     * @tc.name matrixOverBoardDown3600
     * @tc.desc Verify the full checkerboard scores zero downward and keeps its bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_overBoardDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [4, 2, 4, 2]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3700
     * @tc.name matrixFullEightLeft3700
     * @tc.desc Verify a full board of eights scores thirty two per row moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fullEightLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedRow([8, 8, 8, 8]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(128);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [16, 16, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3800
     * @tc.name matrixFullEightRight3800
     * @tc.desc Verify the same full board scores one hundred twenty eight rightward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fullEightRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedRow([8, 8, 8, 8]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(128);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 16, 16]);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('0|0|16|16');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_3900
     * @tc.name matrixFullEightUp3900
     * @tc.desc Verify each column of a full eight board merges once upward for the same total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fullEightUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedRow([8, 8, 8, 8]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(128);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [16, 16, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [16, 16, 16, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4000
     * @tc.name matrixFullEightDown4000
     * @tc.desc Verify the same board scores one hundred twenty eight downward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_fullEightDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedRow([8, 8, 8, 8]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(128);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 16, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [16, 16, 16, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4100
     * @tc.name matrixRepeatedColumnLeft4100
     * @tc.desc Verify two rows of two and two rows of four merge horizontally to forty eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_repeatedColumnLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedColumn([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(48);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [8, 8, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4200
     * @tc.name matrixRepeatedColumnRight4200
     * @tc.desc Verify the same board scores forty eight rightward with right aligned results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_repeatedColumnRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedColumn([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(48);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 8, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4300
     * @tc.name matrixRepeatedColumnUp4300
     * @tc.desc Verify the same layout merges each column upward for forty eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_repeatedColumnUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedColumn([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(48);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 8, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4400
     * @tc.name matrixRepeatedColumnDown4400
     * @tc.desc Verify the same layout merges each column downward for forty eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_repeatedColumnDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedColumn([2, 2, 4, 4]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(48);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [8, 8, 8, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4500
     * @tc.name matrixMixedBoardLeft4500
     * @tc.desc Verify the horizontal merge wins while the vertical pair stays unmerged moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_mixedBoardLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 4, 4]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4600
     * @tc.name matrixMixedBoardRight4600
     * @tc.desc Verify the same mixed board scores four rightward with the pair at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_mixedBoardRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [4, 0, 4, 4]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4700
     * @tc.name matrixMixedBoardUp4700
     * @tc.desc Verify the vertical pair wins while the horizontal pair stays unmerged moving up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_mixedBoardUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(8);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 2, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4800
     * @tc.name matrixMixedBoardDown4800
     * @tc.desc Verify the same mixed board also scores eight downward with bottom aligned results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_mixedBoardDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(8);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 8]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [8, 2, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_4900
     * @tc.name matrixLargePairLeft4900
     * @tc.desc Verify two 1024 tiles score 2048 leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_largePairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([1024, 1024, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(2048);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2048, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5000
     * @tc.name matrixLargePairRight5000
     * @tc.desc Verify the same large pair scores 2048 rightward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_largePairRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([1024, 1024, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_RIGHT);
      expect(rule.score).assertEqual(2048);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2048]);
      expect(rule.score === 2048).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5100
     * @tc.name matrixLargePairUp5100
     * @tc.desc Verify a horizontal 1024 pair cannot merge upward and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_largePairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([1024, 1024, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_UP);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_UP));
      BoardKit.expectBoard(rule, before);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [1024, 1024, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5200
     * @tc.name matrixLargePairDown5200
     * @tc.desc Verify the large horizontal pair drops to the bottom without scoring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_largePairDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([1024, 1024, 0, 0]);
      let rule: GameRule = applyDirection(before, DIR_DOWN);
      expect(rule.score).assertEqual(0);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [1024, 1024, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 1024]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5300
     * @tc.name matrixLeftRightScoresMatch5300
     * @tc.desc Verify one board earns the same total from left and from right because pairing is symmetric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_leftRightScoresMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 4, 4],
        [4, 4, 2, 2],
        [2, 2, 4, 4],
        [4, 4, 2, 2]
      ]);
      let left: GameRule = applyDirection(before, DIR_LEFT);
      let right: GameRule = applyDirection(before, DIR_RIGHT);
      expect(left.score).assertEqual(48);
      expect(right.score).assertEqual(48);
      expect(left.score).assertEqual(right.score);
      expect(left.score === right.score).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5400
     * @tc.name matrixUpDownScoresMatch5400
     * @tc.desc Verify one board earns the same total from up and from down for the same reason
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_upDownScoresMatch', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedColumn([2, 2, 4, 4]);
      let up: GameRule = applyDirection(before, DIR_UP);
      let down: GameRule = applyDirection(before, DIR_DOWN);
      expect(up.score).assertEqual(48);
      expect(down.score).assertEqual(48);
      expect(up.score).assertEqual(down.score);
      expect(BoardOracle.mergeScore(before, DIR_UP)).assertEqual(BoardOracle.mergeScore(before, DIR_DOWN));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5500
     * @tc.name matrixHorizontalVerticalDiffer5500
     * @tc.desc Verify a mixed board earns four horizontally but eight vertically in one move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_horizontalVerticalDiffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let horizontal: GameRule = applyDirection(before, DIR_LEFT);
      let vertical: GameRule = applyDirection(before, DIR_UP);
      expect(horizontal.score).assertEqual(4);
      expect(vertical.score).assertEqual(8);
      expect(horizontal.score !== vertical.score).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5600
     * @tc.name matrixDirectionChangesPlacement5600
     * @tc.desc Verify equal left and right scores still place the merged pair on opposite edges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_directionChangesPlacement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let left: GameRule = applyDirection(before, DIR_LEFT);
      let right: GameRule = applyDirection(before, DIR_RIGHT);
      expect(left.score).assertEqual(right.score);
      BoardKit.expectValues(BoardKit.rowOf(left.dataNumbers, 0), [4, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(right.dataNumbers, 0), [0, 0, 4, 8]);
      expect(left.dataNumbers[0] !== right.dataNumbers[0]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5700
     * @tc.name matrixScoreMatchesMergeCount5700
     * @tc.desc Verify the total score equals the merge count multiplied by the doubled tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_scoreMatchesMergeCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedRow([8, 8, 8, 8]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      let merges: number = BoardKit.countNonZero(before) - BoardKit.countNonZero(rule.dataNumbers);
      expect(merges).assertEqual(8);
      expect(rule.score).assertEqual(merges * 16);
      expect(rule.score === merges * 16).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5800
     * @tc.name matrixAccumulationAddsNextMove5800
     * @tc.desc Verify a second directional move adds its own oracle score to the running total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_accumulationAddsNextMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      let middle: number[] = BoardKit.valuesOf(rule);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      expect(rule.score).assertEqual(4 + BoardOracle.mergeScore(middle, DIR_UP));
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_5900
     * @tc.name matrixThreeMoveAccumulation5900
     * @tc.desc Verify a third direction that merges nothing keeps the accumulated score flat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeMoveAccumulation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = applyDirection(before, DIR_LEFT);
      let firstScore: number = rule.score;
      let firstMiddle: number[] = BoardKit.valuesOf(rule);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      let secondMiddle: number[] = BoardKit.valuesOf(rule);
      let secondScore: number = rule.score;
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_DOWN, line);
      }
      let expected: number = firstScore + BoardOracle.mergeScore(firstMiddle, DIR_UP) +
        BoardOracle.mergeScore(secondMiddle, DIR_DOWN);
      expect(firstScore).assertEqual(4);
      expect(secondScore).assertEqual(12);
      expect(rule.score).assertEqual(12);
      expect(rule.score).assertEqual(expected);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCOREMATRIX_6000
     * @tc.name matrixUpDownPlacementDiffers6000
     * @tc.desc Verify equal up and down scores still anchor the vertical merged pair on opposite edges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_upDownPlacementDiffers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 2, 4, 4]);
      let up: GameRule = applyDirection(before, DIR_UP);
      let down: GameRule = applyDirection(before, DIR_DOWN);
      expect(up.score).assertEqual(down.score);
      BoardKit.expectValues(BoardKit.columnOf(up.dataNumbers, 0), [4, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(down.dataNumbers, 0), [0, 0, 4, 8]);
      expect(up.dataNumbers[0] !== down.dataNumbers[0]).assertTrue();
    });
  });
}
