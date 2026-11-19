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
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS, SIDE, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Row index tiles are pushed towards by an up move. */
const TOP_ROW: number = 0;
/** Row index opposite to the up movement edge. */
const BOTTOM_ROW: number = SIDE - 1;
/** Column index of the rightmost column, used by argument positioning cases. */
const LAST_COLUMN: number = SIDE - 1;

/**
 * Builds a board whose only populated column is the supplied line. The line is
 * ordered top to bottom, matching the board layout of the production class.
 */
function columnBoard(columnIndex: number, line: number[]): number[] {
  return BoardKit.withColumn(BoardKit.blank(), columnIndex, line);
}

/**
 * Returns a line in reverse order without touching the source array. Used by
 * the mirror cases that compare an up move with a down move.
 */
function reversedLine(line: number[]): number[] {
  let result: number[] = [];
  for (let index: number = line.length - 1; index >= 0; index--) {
    result.push(line[index]);
  }
  return result;
}

/**
 * Renders a board as a comma wrapped list. The surrounding commas keep a
 * contains check from matching a digit inside a larger tile value.
 */
function signatureOf(values: number[]): string {
  return ',' + values.join(',') + ',';
}

/**
 * GameRule.moveInRow('up', column) 测试套件。
 *
 * 语义要点：
 *   1. 第一个参数是列号，index = row * 4 + column；
 *   2. 每列独立处理，上移把方块压向行 0，不生成新方块；
 *   3. 每列每步每个方块最多参与一次合并，合并值计入 score；
 *   4. moveInRow 是确定性接口，随机补块只发生在 GameRule.move 中。
 * 本套件只覆盖向上方向，向下方向由镜像套件负责。
 */
export default function gameRuleMoveUpTest() {
  describe('gameRuleMoveUpTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveUpTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveUpTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0100
     * @tc.name moveUpSingleTileRow1Column2_0100
     * @tc.desc Verify a lone tile on row one rises to the top cell of its column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_singleTileRow1Column2', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_singleTileRow1Column2', 'a tile on row 1 reached row 0 of column 2');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [2, 0, 0, 0]);
      expect(rule.dataNumbers[TOP_ROW * SIDE + 2]).assertEqual(2);
      expect(rule.dataNumbers[1 * SIDE + 2]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0200
     * @tc.name moveUpSingleTileRow2Column0_0200
     * @tc.desc Verify a tile on row two travels two cells to the top of column zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_singleTileRow2Column0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_singleTileRow2Column0', 'a tile on row 2 reached row 0 of column 0');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0300
     * @tc.name moveUpSingleTileRow3Column3_0300
     * @tc.desc Verify a bottom row tile crosses three rows and lands on row zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_singleTileRow3Column3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(LAST_COLUMN, [0, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, LAST_COLUMN);
      BoardKit.log('moveUp_singleTileRow3Column3', 'a bottom tile reached row 0 of column 3');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, LAST_COLUMN), [8, 0, 0, 0]);
      expect(rule.dataNumbers[LAST_COLUMN]).assertEqual(8);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE + LAST_COLUMN]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0400
     * @tc.name moveUpSingleTileRow0Column1Stays_0400
     * @tc.desc Verify a tile already on the movement edge is left untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_singleTileRow0Column1Stays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [16, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_singleTileRow0Column1Stays', 'the edge tile stayed on row 0');
      BoardKit.expectBoard(rule, before);
      expect(rule.dataNumbers[1]).assertEqual(16);
      expect(rule.dataNumbers[1 + 3 * SIDE]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0500
     * @tc.name moveUpTwoAdjacentEqualMergeAtTop_0500
     * @tc.desc Verify two equal tiles on rows zero and one merge into one doubled tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoAdjacentEqualMergeAtTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_twoAdjacentEqualMergeAtTop', 'two 2 tiles became one 4 tile');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(signatureOf(rule.dataNumbers)).assertContain(',4,');
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0600
     * @tc.name moveUpTwoAdjacentUnequalNoMerge_0600
     * @tc.desc Verify adjacent tiles of different values keep their order and never merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoAdjacentUnequalNoMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [4, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_twoAdjacentUnequalNoMerge', 'the 4 stayed above the 2');
      BoardKit.expectBoard(rule, before);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[5]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0700
     * @tc.name moveUpTwoEqualWithGapMerge_0700
     * @tc.desc Verify equal tiles separated by an empty cell still merge on an up move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoEqualWithGapMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [2, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_twoEqualWithGapMerge', 'the gap closed and the two 2 tiles merged');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [4, 0, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[10]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0800
     * @tc.name moveUpTwoUnequalWithGapCompact_0800
     * @tc.desc Verify a gap between unequal tiles is removed while their order is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoUnequalWithGapCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [4, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_twoUnequalWithGapCompact', 'the 4 stayed above the 2 after compaction');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [4, 2, 0, 0]);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[7]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_0900
     * @tc.name moveUpTwoAdjacentEqualMiddleRows_0900
     * @tc.desc Verify an equal pair starting on row one shifts once and merges once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoAdjacentEqualMiddleRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_twoAdjacentEqualMiddleRows', 'the middle pair merged at row 0');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[4]).assertEqual(0);
      expect(rule.dataNumbers[8]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1000
     * @tc.name moveUpTwoAdjacentEqualBottomRows_1000
     * @tc.desc Verify an equal pair on the two bottom rows travels two cells and merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoAdjacentEqualBottomRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_twoAdjacentEqualBottomRows', 'the bottom pair merged at row 0');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [4, 0, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[9]).assertEqual(0);
      expect(rule.dataNumbers[13]).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1100
     * @tc.name moveUpTwoUnequalBottomRowsCompact_1100
     * @tc.desc Verify unequal tiles on the bottom rows compact upwards without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoUnequalBottomRowsCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 0, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_twoUnequalBottomRowsCompact', 'the 2 and the 4 packed onto rows 0 and 1');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [2, 4, 0, 0]);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[6]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1200
     * @tc.name moveUpTwoEqualAtOppositeEdges_1200
     * @tc.desc Verify equal tiles on rows zero and three merge across the whole column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_twoEqualAtOppositeEdges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [2, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_twoEqualAtOppositeEdges', 'the far apart 2 tiles merged into 4');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [4, 0, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[15]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1300
     * @tc.name moveUpThreePairAtTopPlusTail_1300
     * @tc.desc Verify a merged 4 does not merge again with the following 4 in one move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threePairAtTopPlusTail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_threePairAtTopPlusTail', 'only the first pair merged, score stayed at 4');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.score === 8).assertFalse();
      expect(BoardKit.positionsOf(rule.dataNumbers, 4).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1400
     * @tc.name moveUpThreePairInMiddle_1400
     * @tc.desc Verify an equal pair below a larger tile merges without disturbing that tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threePairInMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [4, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_threePairInMiddle', 'the lower pair merged while the 4 kept its cell');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [4, 4, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[5]).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1500
     * @tc.name moveUpThreeAllEqualMergeOnce_1500
     * @tc.desc Verify three equal tiles merge exactly one pair and leave the third tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threeAllEqualMergeOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [2, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_threeAllEqualMergeOnce', 'three 2 tiles became a 4 and a remaining 2');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [4, 2, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1600
     * @tc.name moveUpThreeGapPairAtEnd_1600
     * @tc.desc Verify a gap pair at the bottom merges after the leading tile settles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threeGapPairAtEnd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [2, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_threeGapPairAtEnd', 'the leading 2 stayed and the lower pair merged');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [4, 2, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[7]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1700
     * @tc.name moveUpThreeDescendingPacked_1700
     * @tc.desc Verify three descending tiles already on the edge are not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threeDescendingPacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [8, 4, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_threeDescendingPacked', 'a packed descending column stayed unchanged');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1800
     * @tc.name moveUpThreeLeadingZerosCompact_1800
     * @tc.desc Verify three tiles below empty cells rise while preserving their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threeLeadingZerosCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_threeLeadingZerosCompact', 'the 2, 4 and 8 occupied rows 0 to 2');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [2, 4, 8, 0]);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[9]).assertEqual(8);
      expect(rule.dataNumbers[13]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_1900
     * @tc.name moveUpThreeSparseEqualPair_1900
     * @tc.desc Verify a pair split by one empty cell merges and leaves the third tile alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_threeSparseEqualPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 4, 0, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_threeSparseEqualPair', 'the separated 4 tiles merged into 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [8, 0, 0, 0]);
      BoardKit.expectScore(rule, 8);
      expect(signatureOf(rule.dataNumbers)).assertContain(',8,');
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2000
     * @tc.name moveUpCompactionKeepsSeededScore_2000
     * @tc.desc Verify a pure compaction leaves a manually seeded score untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_compactionKeepsSeededScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [0, 0, 2, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 100;
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_compactionKeepsSeededScore', 'score stayed at the seeded value of 100');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [2, 8, 0, 0]);
      BoardKit.expectScore(rule, 100);
      expect(rule.dataNumbers[11]).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(10);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2100
     * @tc.name moveUpFourAlternatingNoMerge_2100
     * @tc.desc Verify a full alternating column cannot merge and stays in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourAlternatingNoMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 4, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_fourAlternatingNoMerge', 'no neighbour pair was equal so nothing moved');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2200
     * @tc.name moveUpFourAllEqualMergeTwice_2200
     * @tc.desc Verify a column of four equal tiles produces two merges and a score of eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourAllEqualMergeTwice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_fourAllEqualMergeTwice', 'four 2 tiles became two 4 tiles');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [4, 4, 0, 0]);
      BoardKit.expectScore(rule, 8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2300
     * @tc.name moveUpFourTwoPairs_2300
     * @tc.desc Verify two adjacent pairs merge independently and their scores add up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourTwoPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [4, 4, 8, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_fourTwoPairs', '4 plus 4 became 8 and 8 plus 8 became 16');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [8, 16, 0, 0]);
      BoardKit.expectScore(rule, 24);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[6]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2400
     * @tc.name moveUpFourPairAtBottom_2400
     * @tc.desc Verify a pair on the bottom rows merges under two settled tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourPairAtBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [8, 16, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_fourPairAtBottom', 'the bottom pair merged into 8 below 8 and 16');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [8, 16, 8, 0]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[11]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2500
     * @tc.name moveUpFourPairAtTop_2500
     * @tc.desc Verify a pair on the edge merges while two trailing tiles compact below it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourPairAtTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [8, 8, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_fourPairAtTop', 'the top pair merged and the 2 and 4 followed it');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [16, 2, 4, 0]);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2600
     * @tc.name moveUpRepeatedStableColumnStays_2600
     * @tc.desc Verify repeated up moves on a full stable column never change it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_repeatedStableColumnStays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [16, 8, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.expectBoard(rule, before);
      let afterFirst: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_repeatedStableColumnStays', 'two consecutive up moves changed nothing');
      BoardKit.expectBoard(rule, afterFirst);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[1]).assertEqual(16);
      expect(rule.dataNumbers[13]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2700
     * @tc.name moveUpFourAscendingNoMerge_2700
     * @tc.desc Verify an ascending full column has no equal neighbour and keeps its shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourAscendingNoMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_fourAscendingNoMerge', 'an ascending full column cannot merge');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(30);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2800
     * @tc.name moveUpMergeAddsToSeededScore_2800
     * @tc.desc Verify a merge adds to an existing score instead of replacing that score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_mergeAddsToSeededScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [2, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 50;
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_mergeAddsToSeededScore', 'the seeded score of 50 grew by the merged value 4');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [4, 4, 8, 0]);
      BoardKit.expectScore(rule, 54);
      expect(rule.dataNumbers[11]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_2900
     * @tc.name moveUpFourMiddlePairOnly_2900
     * @tc.desc Verify an inner equal pair merges while both outer tiles stay in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourMiddlePairOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 4, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_fourMiddlePairOnly', 'the inner 4 pair merged and both 2 tiles remained');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 8, 2, 0]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3000
     * @tc.name moveUpFourTwoSeparatePairs_3000
     * @tc.desc Verify two adjacent pairs merge at once and both scores are accumulated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourTwoSeparatePairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_fourTwoSeparatePairs', 'two pairs merged into a 4 and an 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [4, 8, 0, 0]);
      BoardKit.expectScore(rule, 12);
      expect(rule.dataNumbers[5]).assertEqual(8);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3100
     * @tc.name moveUpFourMergedTileDoesNotChain_3100
     * @tc.desc Verify a freshly merged 8 does not merge again with an equal 8 above it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourMergedTileDoesNotChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [8, 4, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_fourMergedTileDoesNotChain', 'the new 8 stayed beside the old 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [8, 8, 2, 0]);
      BoardKit.expectScore(rule, 8);
      expect(rule.score === 16).assertFalse();
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3200
     * @tc.name moveUpFourLeadingZeroPairFirst_3200
     * @tc.desc Verify a pair behind a leading zero merges after compaction while the tail stays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fourLeadingZeroPairFirst', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [0, 2, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_fourLeadingZeroPairFirst', 'the leading pair merged and the 4 followed');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [4, 4, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3300
     * @tc.name moveUpBlankColumnIsNoOp_3300
     * @tc.desc Verify an up move on an empty column neither moves nor scores or spawns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_blankColumnIsNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_blankColumnIsNoOp', 'an empty column stayed empty');
      BoardKit.expectAllZeros(rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3400
     * @tc.name moveUpBlankTargetKeepsOtherColumns_3400
     * @tc.desc Verify an empty target column leaves the populated columns untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_blankTargetKeepsOtherColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [0, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, LAST_COLUMN);
      BoardKit.log('moveUp_blankTargetKeepsOtherColumns', 'column 3 was empty so nothing changed');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.columnOf(rule.dataNumbers, LAST_COLUMN).length).assertEqual(SIDE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3500
     * @tc.name moveUpDeterministicAcrossRules_3500
     * @tc.desc Verify two fresh rules with the same column produce the same up result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_deterministicAcrossRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [8, 0, 0, 4]);
      let first: GameRule = BoardKit.rule(before);
      let second: GameRule = BoardKit.rule(before);
      first.moveInRow(DIR_UP, 0);
      second.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_deterministicAcrossRules', 'both rules produced the identical column');
      BoardKit.expectValues(BoardKit.columnOf(first.dataNumbers, 0), [8, 4, 0, 0]);
      BoardKit.expectBoard(second, first.dataNumbers);
      BoardKit.expectScore(first, 0);
      BoardKit.expectScore(second, 0);
      expect(BoardKit.countNonZero(first.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3600
     * @tc.name moveUpSecondCallIsIdempotent_3600
     * @tc.desc Verify a second up move on the settled column changes nothing and adds no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_secondCallIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 2, 0, 0]);
      BoardKit.expectScore(rule, 4);
      let settled: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_secondCallIsIdempotent', 'the settled 4 and 2 did not move again');
      BoardKit.expectBoard(rule, settled);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3700
     * @tc.name moveUpOnlyTargetColumnMoves_3700
     * @tc.desc Verify moveInRow up touches only the column named by its second argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_onlyTargetColumnMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [0, 4, 0, 0]);
      before = BoardKit.withColumn(before, 2, [8, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_onlyTargetColumnMoves', 'only column 0 changed, columns 1 and 2 stayed');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [8, 0, 0, 0]);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3800
     * @tc.name moveUpKeepsRowPeersInPlace_3800
     * @tc.desc Verify tiles sharing a row with the moved tile are not disturbed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_keepsRowPeersInPlace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withRow(before, 2, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_keepsRowPeersInPlace', 'the 4 rose while its row peers kept their cells');
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[9]).assertEqual(0);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[10]).assertEqual(8);
      expect(rule.dataNumbers[11]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_3900
     * @tc.name moveUpKeepsBoardLengthSixteen_3900
     * @tc.desc Verify a merge never changes the board length nor creates a seventeenth cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_keepsBoardLengthSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [4, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_keepsBoardLengthSixteen', 'the board still holds exactly sixteen cells');
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [8, 0, 0, 0]);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4000
     * @tc.name moveUpKeepsStatusBefore_4000
     * @tc.desc Verify a line move never changes the status field, which only move may alter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_keepsStatusBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard(2, [2, 2, 0, 0]));
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_keepsStatusBefore', 'status remained BEFORE after the merge');
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.status === GameStatus.OVER).assertFalse();
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4100
     * @tc.name moveUpSecondArgumentIsColumnNotRow_4100
     * @tc.desc Verify the numeric argument selects a column, so row one peers stay put
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_secondArgumentIsColumnNotRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withRow(before, 1, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_secondArgumentIsColumnNotRow', 'argument 1 selected column 1 and the 4 rose');
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[6]).assertEqual(8);
      expect(rule.dataNumbers[7]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4200
     * @tc.name moveUpAllFourColumnsSingleTiles_4200
     * @tc.desc Verify independent single tiles in all four columns reach row zero together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_allFourColumnsSingleTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 0, 0, 2]);
      before = BoardKit.withColumn(before, 1, [0, 0, 4, 0]);
      before = BoardKit.withColumn(before, 2, [0, 8, 0, 0]);
      before = BoardKit.withColumn(before, 3, [16, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.log('moveUp_allFourColumnsSingleTiles', 'all four columns now hold their tile on row 0');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, TOP_ROW), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 0]);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4300
     * @tc.name moveUpAllFourColumnsMergePairs_4300
     * @tc.desc Verify four columns merging at once accumulate the sum of all merged values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_allFourColumnsMergePairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [2, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [4, 4, 0, 0]);
      before = BoardKit.withColumn(before, 2, [8, 8, 0, 0]);
      before = BoardKit.withColumn(before, 3, [16, 16, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.log('moveUp_allFourColumnsMergePairs', 'four pairs merged into 4, 8, 16 and 32');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, TOP_ROW), [4, 8, 16, 32]);
      BoardKit.expectScore(rule, 60);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(60);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4400
     * @tc.name moveUpAllFourColumnsMixed_4400
     * @tc.desc Verify merge, compaction, stability and non merging patterns coexist per column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_allFourColumnsMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [2, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [0, 4, 0, 0]);
      before = BoardKit.withColumn(before, 2, [8, 0, 0, 0]);
      before = BoardKit.withColumn(before, 3, [2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.log('moveUp_allFourColumnsMixed', 'each column followed its own rule');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 8, 2]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4500
     * @tc.name moveUpDiagonalTilesCompact_4500
     * @tc.desc Verify one tile per column on a diagonal all reach the top row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_diagonalTilesCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[12] = 2;
      before[9] = 4;
      before[6] = 8;
      before[3] = 16;
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.log('moveUp_diagonalTilesCompact', 'the diagonal collapsed onto row 0');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [0, 0, 0, 0]);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4600
     * @tc.name moveUpStaggeredColumnsCompactAndMerge_4600
     * @tc.desc Verify staggered tiles compact per column while one column merges its pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_staggeredColumnsCompactAndMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[5] = 2;
      before[13] = 4;
      before[9] = 8;
      before[6] = 2;
      before[14] = 2;
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.log('moveUp_staggeredColumnsCompactAndMerge', 'three columns compacted and one merged');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 8, 0, 0]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4700
     * @tc.name moveUpMatchesOracleOnSingleMerge_4700
     * @tc.desc Verify a single column up merge equals the independent reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_matchesOracleOnSingleMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_matchesOracleOnSingleMerge', 'board and score agree with BoardOracle');
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_UP));
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_UP));
      expect(rule.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4800
     * @tc.name moveUpMatchesOracleOnSparseColumn_4800
     * @tc.desc Verify a sparse column with a gap compacts exactly like the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_matchesOracleOnSparseColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [4, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 3);
      BoardKit.log('moveUp_matchesOracleOnSparseColumn', 'compaction order agrees with the oracle');
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_UP));
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_UP));
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_4900
     * @tc.name moveUpMatchesOracleOnDenseColumn_4900
     * @tc.desc Verify a dense column without equal neighbours matches the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_matchesOracleOnDenseColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [16, 8, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      let expected: number[] = BoardOracle.move(before, DIR_UP);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_matchesOracleOnDenseColumn', 'a full column remained identical to the oracle');
      BoardKit.expectBoard(rule, expected);
      BoardKit.expectValues(rule.dataNumbers, before);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5000
     * @tc.name moveUpMatchesOracleOnFourColumns_5000
     * @tc.desc Verify a four column up move equals the oracle board and oracle merge score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_matchesOracleOnFourColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 2, 2, 0]);
      before = BoardKit.withColumn(before, 1, [4, 0, 0, 4]);
      before = BoardKit.withColumn(before, 2, [2, 4, 8, 16]);
      before = BoardKit.withColumn(before, 3, [0, 0, 8, 8]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_UP, column);
      }
      BoardKit.log('moveUp_matchesOracleOnFourColumns', 'all four columns agree with the oracle');
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_UP));
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_UP));
      expect(rule.score).assertEqual(28);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5100
     * @tc.name moveUpCompactionOnlyScoresZero_5100
     * @tc.desc Verify moving tiles without merging leaves the score at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_compactionOnlyScoresZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_compactionOnlyScoresZero', 'the board changed but the score stayed zero');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 4, 0, 0]);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
      expect(BoardOracle.mergeScore(before, DIR_UP)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5200
     * @tc.name moveUpSpawnsOneTileAfterChange_5200
     * @tc.desc Verify a changing whole board up move adds exactly one tile worth 2 or 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_spawnsOneTileAfterChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.log('moveUp_spawnsOneTileAfterChange', 'the move plus one spawned tile were observed');
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5300
     * @tc.name moveUpSpawnOccupancyWithMerge_5300
     * @tc.desc Verify a merge plus one spawn keeps the occupied cell count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_spawnOccupancyWithMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 4, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.log('moveUp_spawnOccupancyWithMerge', 'one merge and one spawn cancelled out');
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 1, 1);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5400
     * @tc.name moveUpBlankBoardNoSpawn_5400
     * @tc.desc Verify a whole board up move on an empty board neither spawns nor scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_blankBoardNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      let difference: number = BoardKit.singleDifference(before, rule.dataNumbers);
      let spawnedValue: number | null = null;
      if (difference >= 0) {
        spawnedValue = rule.dataNumbers[difference];
      }
      BoardKit.log('moveUp_blankBoardNoSpawn', 'an unchanged board must not spawn a tile');
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(spawnedValue).assertNull();
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5500
     * @tc.name moveUpPackedTopRowNoSpawn_5500
     * @tc.desc Verify a board already packed on the top row produces no spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_packedTopRowNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withRow(before, TOP_ROW, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.log('moveUp_packedTopRowNoSpawn', 'the packed top row kept the board unchanged');
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_UP);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5600
     * @tc.name moveUpFullNoMergeBoardNoSpawn_5600
     * @tc.desc Verify a full board without vertical neighbours cannot change or spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_fullNoMergeBoardNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.log('moveUp_fullNoMergeBoardNoSpawn', 'the over board was already stable upwards');
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_UP);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5700
     * @tc.name moveUpSpawnedTileValueIsTwoOrFour_5700
     * @tc.desc Verify the single cell added by a changed up move holds two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_spawnedTileValueIsTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [0, 8, 8, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_UP);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      let spawnIndex: number = -1;
      for (let index: number = 0; index < CELLS; index++) {
        if (expected[index] === 0 && rule.dataNumbers[index] !== 0) {
          spawnIndex = index;
        }
      }
      BoardKit.log('moveUp_spawnedTileValueIsTwoOrFour', 'exactly one oracle-zero cell became a tile');
      expect(spawnIndex >= 0).assertTrue();
      expect(expected[spawnIndex]).assertEqual(0);
      expect(rule.dataNumbers[spawnIndex] === 2 || rule.dataNumbers[spawnIndex] === 4).assertTrue();
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5800
     * @tc.name moveUpScoreMatchesOracleAfterMove_5800
     * @tc.desc Verify a whole board up move scores exactly what the reference model predicts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_scoreMatchesOracleAfterMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [2, 2, 0, 0]);
      before = BoardKit.withColumn(before, 2, [8, 8, 8, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.log('moveUp_scoreMatchesOracleAfterMove', 'the spawn added no score to the oracle total');
      BoardKit.expectScore(rule, 36);
      expect(rule.score === BoardOracle.mergeScore(before, DIR_UP)).assertTrue();
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(16);
      expect(rule.dataNumbers[6]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_5900
     * @tc.name moveUpMirrorsDownCompaction_5900
     * @tc.desc Verify an up result is the vertical mirror of the down result on the mirrored line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_mirrorsDownCompaction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let upLine: number[] = [2, 0, 4, 4];
      let upRule: GameRule = BoardKit.rule(columnBoard(0, upLine));
      upRule.moveInRow(DIR_UP, 0);
      let downRule: GameRule = BoardKit.rule(columnBoard(0, reversedLine(upLine)));
      downRule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveUp_mirrorsDownCompaction', 'the down result is the reversed up result');
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 0), [2, 8, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 0),
        reversedLine(BoardKit.columnOf(upRule.dataNumbers, 0)));
      BoardKit.expectScore(upRule, 8);
      BoardKit.expectScore(downRule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_6000
     * @tc.name moveUpMirrorsDownMergePosition_6000
     * @tc.desc Verify the pair merged by up is the pair merged by down on the mirrored line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_mirrorsDownMergePosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let upRule: GameRule = BoardKit.rule(columnBoard(1, [2, 2, 2, 0]));
      upRule.moveInRow(DIR_UP, 1);
      let downRule: GameRule = BoardKit.rule(columnBoard(1, [0, 2, 2, 2]));
      downRule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveUp_mirrorsDownMergePosition', 'up kept the top tile, down kept the bottom tile');
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 1), [4, 2, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 1),
        reversedLine(BoardKit.columnOf(upRule.dataNumbers, 1)));
      BoardKit.expectScore(upRule, 4);
      BoardKit.expectScore(downRule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_6100
     * @tc.name moveUpDiffersFromDownOnAsymmetricLine_6100
     * @tc.desc Verify the same asymmetric line settles on opposite edges for up and down
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_differsFromDownOnAsymmetricLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let line: number[] = [2, 4, 0, 0];
      let upRule: GameRule = BoardKit.rule(columnBoard(2, line));
      upRule.moveInRow(DIR_UP, 2);
      let downRule: GameRule = BoardKit.rule(columnBoard(2, line));
      downRule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveUp_differsFromDownOnAsymmetricLine', 'up kept row 0 while down pushed to row 3');
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 2), [2, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 2), [0, 0, 2, 4]);
      expect(upRule.dataNumbers[10] === downRule.dataNumbers[10]).assertFalse();
      BoardKit.expectScore(upRule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_6200
     * @tc.name moveUpBottomRowTilesAcrossColumns_6200
     * @tc.desc Verify bottom row tiles in two different columns both reach the top row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_bottomRowTilesAcrossColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[BOTTOM_ROW * SIDE + 1] = 32;
      before[BOTTOM_ROW * SIDE + 2] = 64;
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveUp_bottomRowTilesAcrossColumns', 'both bottom row tiles crossed three rows');
      expect(rule.dataNumbers[1]).assertEqual(32);
      expect(rule.dataNumbers[2]).assertEqual(64);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE + 1]).assertEqual(0);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE + 2]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_6300
     * @tc.name moveUpMergesNonPowerOfTwo_6300
     * @tc.desc Verify merging compares equality only and does not require powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_mergesNonPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [3, 3, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_mergesNonPowerOfTwo', 'two 3 tiles produced a 6 tile worth 6 points');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [6, 0, 0, 0]);
      BoardKit.expectScore(rule, 6);
      expect(BoardOracle.mergeScore(before, DIR_UP)).assertEqual(6);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_6400
     * @tc.name moveUpMergesLargeTiles_6400
     * @tc.desc Verify merging two 4096 tiles yields 8192 without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_mergesLargeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [4096, 4096, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveUp_mergesLargeTiles', 'two 4096 tiles produced 8192');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [8192, 0, 0, 0]);
      BoardKit.expectScore(rule, 8192);
      expect(signatureOf(rule.dataNumbers)).assertContain(',8192,');
      expect(rule.dataNumbers[1]).assertEqual(8192);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEUP_6500
     * @tc.name moveUpScoreAccumulatesAcrossCalls_6500
     * @tc.desc Verify a second merge on the same rule adds to the score instead of replacing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveUp_scoreAccumulatesAcrossCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard(0, [4, 4, 0, 0]));
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectScore(rule, 8);
      rule.dataNumbers[0] = 8;
      rule.dataNumbers[4] = 8;
      rule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveUp_scoreAccumulatesAcrossCalls', 'the second merge raised the score from 8 to 24');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [16, 0, 0, 0]);
      BoardKit.expectScore(rule, 24);
      expect(rule.dataNumbers[0]).assertEqual(16);
    });
  });
}
