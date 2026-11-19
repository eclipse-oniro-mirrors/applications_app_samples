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
import { BoardKit, CELLS, SIDE, DIR_DOWN, DIR_UP } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Row index tiles are pushed towards by a down move. */
const BOTTOM_ROW: number = SIDE - 1;
/** Row index opposite to the down movement edge. */
const TOP_ROW: number = 0;
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
 * Returns a line in reverse order without touching the source array. Mirror
 * cases use it to turn a down line into the up line it should correspond to.
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
 * GameRule.moveInRow('down', column) 测试套件。
 *
 * 语义要点：
 *   1. 第一个参数是列号，index = row * 4 + column；
 *   2. 每列独立处理，下移把方块压向行 3，不生成新方块；
 *   3. 每列每步每个方块最多参与一次合并，合并值计入 score；
 *   4. moveInRow 是确定性接口，随机补块只发生在 GameRule.move 中。
 * 本套件只覆盖向下方向，向上方向由镜像套件负责。
 */
export default function gameRuleMoveDownTest() {
  describe('gameRuleMoveDownTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveDownTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveDownTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0100
     * @tc.name moveDownSingleTileRow2Column0_0100
     * @tc.desc Verify a lone tile on row two falls to the bottom cell of its column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_singleTileRow2Column0', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_singleTileRow2Column0', 'a tile on row 2 reached row 3 of column 0');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE]).assertEqual(2);
      expect(rule.dataNumbers[2 * SIDE]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0200
     * @tc.name moveDownSingleTileRow1Column3_0200
     * @tc.desc Verify a tile on row one falls two cells to the bottom of column three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_singleTileRow1Column3', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(LAST_COLUMN, [0, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, LAST_COLUMN);
      BoardKit.log('moveDown_singleTileRow1Column3', 'a tile on row 1 reached the bottom row');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, LAST_COLUMN), [0, 0, 0, 4]);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE + LAST_COLUMN]).assertEqual(4);
      expect(rule.dataNumbers[1 * SIDE + LAST_COLUMN]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0300
     * @tc.name moveDownSingleTileRow0Column1_0300
     * @tc.desc Verify a tile on the top row crosses three rows and lands on the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_singleTileRow0Column1', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [8, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_singleTileRow0Column1', 'a top row tile crossed three rows');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 0, 8]);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE + 1]).assertEqual(8);
      expect(rule.dataNumbers[TOP_ROW * SIDE + 1]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0400
     * @tc.name moveDownSingleTileRow3Column2Stays_0400
     * @tc.desc Verify a tile already on the bottom edge is left untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_singleTileRow3Column2Stays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 0, 0, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_singleTileRow3Column2Stays', 'the edge tile stayed on the bottom row');
      BoardKit.expectBoard(rule, before);
      expect(rule.dataNumbers[BOTTOM_ROW * SIDE + 2]).assertEqual(16);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0500
     * @tc.name moveDownTwoAdjacentEqualBottom_0500
     * @tc.desc Verify two equal tiles on the bottom rows merge into one doubled tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_twoAdjacentEqualBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 0, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_twoAdjacentEqualBottom', 'two 4 tiles became one 8 tile');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 8]);
      BoardKit.expectScore(rule, 8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
      expect(rule.dataNumbers[8]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0600
     * @tc.name moveDownTwoAdjacentEqualMiddle_0600
     * @tc.desc Verify a middle equal pair falls one row and merges on the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_twoAdjacentEqualMiddle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_twoAdjacentEqualMiddle', 'the middle pair merged on the bottom row');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[9]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0700
     * @tc.name moveDownTwoEqualWithGap_0700
     * @tc.desc Verify equal tiles separated by an empty cell still merge on a down move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_twoEqualWithGap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 2, 0, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_twoEqualWithGap', 'the gap closed and the two 2 tiles merged');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[6]).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0800
     * @tc.name moveDownTwoUnequalWithGapCompact_0800
     * @tc.desc Verify a gap between unequal tiles is removed while their order is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_twoUnequalWithGapCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [4, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_twoUnequalWithGapCompact', 'the 4 stayed above the 2 after compaction');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 4, 2]);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_0900
     * @tc.name moveDownCompactionKeepsRuleState_0900
     * @tc.desc Verify a compaction without a merge leaves the score and status untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_compactionKeepsRuleState', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 0, 8, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 30;
      rule.status = GameStatus.RUNNING;
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_compactionKeepsRuleState', 'score 30 and RUNNING survived the compaction');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 8]);
      BoardKit.expectScore(rule, 30);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1000
     * @tc.name moveDownTwoEqualOppositeEdges_1000
     * @tc.desc Verify equal tiles on the top and bottom rows merge across the whole column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_twoEqualOppositeEdges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [2, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_twoEqualOppositeEdges', 'the far apart 2 tiles merged into 4');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1100
     * @tc.name moveDownThreeAscendingCompact_1100
     * @tc.desc Verify three ascending tiles at the top slide down and keep their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeAscendingCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [2, 4, 8, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_threeAscendingCompact', 'the 2, 4 and 8 now occupy rows 1 to 3');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 2, 4, 8]);
      expect(rule.dataNumbers[6]).assertEqual(2);
      expect(rule.dataNumbers[10]).assertEqual(4);
      expect(rule.dataNumbers[14]).assertEqual(8);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1200
     * @tc.name moveDownTwoLeadingTilesCompact_1200
     * @tc.desc Verify two tiles at the top of a column slide down and keep their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_twoLeadingTilesCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_twoLeadingTilesCompact', 'the 2 and the 4 landed on rows 2 and 3');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 2, 4]);
      expect(rule.dataNumbers[11]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1300
     * @tc.name moveDownThreePairAtBottom_1300
     * @tc.desc Verify a pair on the bottom rows merges under a leading tile that settles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threePairAtBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 4, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_threePairAtBottom', 'the 4 pair merged and the 2 followed above it');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1400
     * @tc.name moveDownThreePairAtTop_1400
     * @tc.desc Verify the leading pair merges after falling and the trailing 4 follows it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threePairAtTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [4, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_threePairAtTop', 'the 2 pair merged and the 4 followed above it');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[9]).assertEqual(4);
      expect(rule.dataNumbers[13]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1500
     * @tc.name moveDownThreeAllEqualBottom_1500
     * @tc.desc Verify three equal tiles merge exactly one pair leaving the third tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeAllEqualBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_threeAllEqualBottom', 'three 2 tiles became a 4 and a remaining 2');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 2, 4]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1600
     * @tc.name moveDownThreeSparseEqualPair_1600
     * @tc.desc Verify a pair split by an empty cell merges and leaves the third tile alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeSparseEqualPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [0, 4, 0, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_threeSparseEqualPair', 'the separated 4 tiles merged into 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 0, 8]);
      BoardKit.expectScore(rule, 8);
      expect(signatureOf(rule.dataNumbers)).assertContain(',8,');
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1700
     * @tc.name moveDownThreeDescendingCompact_1700
     * @tc.desc Verify three descending tiles slide down and keep their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeDescendingCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [8, 4, 2, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_threeDescendingCompact', 'the 8, 4 and 2 occupied rows 1 to 3');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 8, 4, 2]);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1800
     * @tc.name moveDownThreeAscendingPacked_1800
     * @tc.desc Verify three ascending tiles already packed on the bottom edge stay still
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeAscendingPacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_threeAscendingPacked', 'an ascending packed column stayed unchanged');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[9]).assertEqual(4);
      expect(rule.dataNumbers[13]).assertEqual(8);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_1900
     * @tc.name moveDownThreeEqualPlusLargerPair_1900
     * @tc.desc Verify three equal tiles merge only the bottom pair and the larger tile settles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeEqualPlusLargerPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [4, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_threeEqualPlusLargerPair', 'only the bottom 2 pair merged');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 4, 2, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[10]).assertEqual(2);
      expect(rule.dataNumbers[14]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2000
     * @tc.name moveDownThreeLeadingCompact_2000
     * @tc.desc Verify tiles with a leading gap compact towards the bottom edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeLeadingCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_threeLeadingCompact', 'the 2 and the 4 landed on the bottom rows');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 2, 4]);
      expect(rule.dataNumbers[11]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2100
     * @tc.name moveDownThreeWithBottomEdge_2100
     * @tc.desc Verify a bottom edge tile stays while two upper tiles settle above it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_threeWithBottomEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 0, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_threeWithBottomEdge', 'the bottom 8 stayed and the 2 and 4 settled');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(8);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2200
     * @tc.name moveDownFourAlternatingNoMerge_2200
     * @tc.desc Verify a full alternating column cannot merge and stays in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourAlternatingNoMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [2, 4, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_fourAlternatingNoMerge', 'no neighbour pair was equal so nothing moved');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2300
     * @tc.name moveDownFourAllEqualMergeTwice_2300
     * @tc.desc Verify a column of four equal tiles produces two merges and a score of eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourAllEqualMergeTwice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_fourAllEqualMergeTwice', 'four 2 tiles became two 4 tiles on the bottom');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2400
     * @tc.name moveDownFourTwoPairs_2400
     * @tc.desc Verify two adjacent pairs merge independently and their scores add up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourTwoPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [4, 4, 8, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_fourTwoPairs', '4 plus 4 became 8 and 8 plus 8 became 16');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 8, 16]);
      BoardKit.expectScore(rule, 24);
      expect(rule.dataNumbers[11]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2500
     * @tc.name moveDownFourPairAtTop_2500
     * @tc.desc Verify a top pair merges into 8 while the 2 and 8 stay on the bottom rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourPairAtTop', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [4, 4, 2, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_fourPairAtTop', 'the top pair merged into 8 above the 2 and 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 8, 2, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2600
     * @tc.name moveDownFourMergedTileDoesNotChain_2600
     * @tc.desc Verify a freshly merged 8 does not merge again with an equal 8 below it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourMergedTileDoesNotChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [8, 4, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_fourMergedTileDoesNotChain', 'the new 8 stayed above the old 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 8, 8, 2]);
      BoardKit.expectScore(rule, 8);
      expect(rule.score === 16).assertFalse();
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2700
     * @tc.name moveDownFourPairAtBottom_2700
     * @tc.desc Verify a bottom pair merges while two upper tiles compact above it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourPairAtBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [16, 2, 8, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_fourPairAtBottom', 'the bottom pair merged into 16 under 16 and 2');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 16, 2, 16]);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[10]).assertEqual(2);
      expect(rule.dataNumbers[14]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2800
     * @tc.name moveDownMergeThenVacatedCellFills_2800
     * @tc.desc Verify a leading tile fills the cell vacated by a merge on the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_mergeThenVacatedCellFills', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [4, 0, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_mergeThenVacatedCellFills', 'the bottom merge freed row 2 for the leading 4');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 4, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_2900
     * @tc.name moveDownFourGapMergeToBottom_2900
     * @tc.desc Verify a pair separated by a gap merges on the bottom after the gap closes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourGapMergeToBottom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [4, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_fourGapMergeToBottom', 'the two 4 tiles merged at the bottom edge');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3000
     * @tc.name moveDownFourTwoSeparatePairs_3000
     * @tc.desc Verify two adjacent pairs fall and merge into a 4 and an 8 at the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourTwoSeparatePairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_fourTwoSeparatePairs', 'two pairs merged into a 4 and an 8');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 4, 8]);
      BoardKit.expectScore(rule, 12);
      expect(rule.dataNumbers[13]).assertEqual(8);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3100
     * @tc.name moveDownFourTopPairOnly_3100
     * @tc.desc Verify a top pair merges while trailing tiles keep their relative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourTopPairOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [8, 8, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_fourTopPairOnly', 'the top pair merged into 16 above the 2 and 4');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 16, 2, 4]);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[10]).assertEqual(2);
      expect(rule.dataNumbers[14]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3200
     * @tc.name moveDownFourLeadingPair_3200
     * @tc.desc Verify a leading pair merges after falling while the tail follows it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourLeadingPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [2, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_fourLeadingPair', 'the leading pair merged and the 4 and 8 followed');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 4, 4, 8]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3300
     * @tc.name moveDownFourAdjacentPairCompact_3300
     * @tc.desc Verify a pair behind a leading zero merges once it reaches the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fourAdjacentPairCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 2, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_fourAdjacentPairCompact', 'the pair merged under the leading zero');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3400
     * @tc.name moveDownBlankColumnIsNoOp_3400
     * @tc.desc Verify a down move on an empty column neither moves nor scores or spawns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_blankColumnIsNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_blankColumnIsNoOp', 'an empty column stayed empty');
      BoardKit.expectAllZeros(rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3500
     * @tc.name moveDownBlankTargetKeepsOtherColumns_3500
     * @tc.desc Verify an empty target column leaves the populated columns untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_blankTargetKeepsOtherColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [0, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, LAST_COLUMN);
      BoardKit.log('moveDown_blankTargetKeepsOtherColumns', 'column 3 was empty so nothing changed');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.columnOf(rule.dataNumbers, LAST_COLUMN).length).assertEqual(SIDE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3600
     * @tc.name moveDownAlreadyPackedColumnStays_3600
     * @tc.desc Verify a column already packed on the bottom edge is left exactly as it is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_alreadyPackedColumnStays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 0, 2, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_alreadyPackedColumnStays', 'the packed column needed no movement');
      BoardKit.expectBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3700
     * @tc.name moveDownSecondCallIsIdempotent_3700
     * @tc.desc Verify a second down move on the settled column changes nothing and adds no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_secondCallIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      let settled: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_secondCallIsIdempotent', 'the settled 2 and 4 did not move again');
      BoardKit.expectBoard(rule, settled);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3800
     * @tc.name moveDownOnlyTargetColumnMoves_3800
     * @tc.desc Verify moveInRow down touches only the column named by its second argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_onlyTargetColumnMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [2, 0, 0, 0]);
      before = BoardKit.withColumn(before, 1, [0, 0, 0, 4]);
      before = BoardKit.withColumn(before, 2, [0, 0, 8, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_onlyTargetColumnMoves', 'only column 0 changed, columns 1 and 2 stayed');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 8, 0]);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_3900
     * @tc.name moveDownKeepsRowPeersInPlace_3900
     * @tc.desc Verify tiles sharing a row with the moved tile are not disturbed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_keepsRowPeersInPlace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withRow(before, 1, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_keepsRowPeersInPlace', 'the 8 fell while its row peers kept their cells');
      expect(rule.dataNumbers[14]).assertEqual(8);
      expect(rule.dataNumbers[6]).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[5]).assertEqual(4);
      expect(rule.dataNumbers[7]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4000
     * @tc.name moveDownKeepsBoardLengthSixteen_4000
     * @tc.desc Verify a merge never changes the board length nor creates a seventeenth cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_keepsBoardLengthSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 4, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_keepsBoardLengthSixteen', 'the board still holds exactly sixteen cells');
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [0, 0, 0, 8]);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4100
     * @tc.name moveDownKeepsStatusBefore_4100
     * @tc.desc Verify a line move never changes the status field, which only move may alter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_keepsStatusBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard(2, [0, 2, 2, 0]));
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_keepsStatusBefore', 'status remained BEFORE after the merge');
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.status === GameStatus.OVER).assertFalse();
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4200
     * @tc.name moveDownSecondArgumentIsColumnNotRow_4200
     * @tc.desc Verify the numeric argument selects a column, so row two peers stay put
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_secondArgumentIsColumnNotRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withRow(before, 2, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_secondArgumentIsColumnNotRow', 'argument 2 selected column 2 and the 8 fell');
      expect(rule.dataNumbers[14]).assertEqual(8);
      expect(rule.dataNumbers[10]).assertEqual(0);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[9]).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4300
     * @tc.name moveDownAllFourColumnsSingleTiles_4300
     * @tc.desc Verify independent single tiles in all four columns reach the bottom row together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_allFourColumnsSingleTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [2, 0, 0, 0]);
      before = BoardKit.withColumn(before, 1, [0, 4, 0, 0]);
      before = BoardKit.withColumn(before, 2, [0, 0, 8, 0]);
      before = BoardKit.withColumn(before, 3, [0, 0, 0, 16]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_allFourColumnsSingleTiles', 'all four columns now hold their tile on row 3');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 0, 0]);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4400
     * @tc.name moveDownAllFourColumnsMergePairs_4400
     * @tc.desc Verify four columns merging at once accumulate the sum of all merged values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_allFourColumnsMergePairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 0, 2, 2]);
      before = BoardKit.withColumn(before, 1, [0, 0, 4, 4]);
      before = BoardKit.withColumn(before, 2, [0, 0, 8, 8]);
      before = BoardKit.withColumn(before, 3, [0, 0, 16, 16]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_allFourColumnsMergePairs', 'four pairs merged into 4, 8, 16 and 32');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [4, 8, 16, 32]);
      BoardKit.expectScore(rule, 60);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(60);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4500
     * @tc.name moveDownAllFourColumnsMixed_4500
     * @tc.desc Verify merge, compaction, stability and non merging patterns coexist per column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_allFourColumnsMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 0, 2, 2]);
      before = BoardKit.withColumn(before, 1, [0, 4, 0, 0]);
      before = BoardKit.withColumn(before, 2, [0, 0, 0, 8]);
      before = BoardKit.withColumn(before, 3, [0, 0, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_allFourColumnsMixed', 'each column followed its own rule');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [4, 4, 8, 2]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4600
     * @tc.name moveDownAntiDiagonalTilesCompact_4600
     * @tc.desc Verify one tile per column on an anti diagonal all reach the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_antiDiagonalTilesCompact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[0] = 2;
      before[5] = 4;
      before[10] = 8;
      before[15] = 16;
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_antiDiagonalTilesCompact', 'the anti diagonal collapsed onto the bottom row');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, TOP_ROW), [0, 0, 0, 0]);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4700
     * @tc.name moveDownStaggeredColumnsCompactAndMerge_4700
     * @tc.desc Verify staggered tiles compact per column while one column merges its pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_staggeredColumnsCompactAndMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[0] = 4;
      before[8] = 2;
      before[5] = 8;
      before[2] = 8;
      before[10] = 8;
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_staggeredColumnsCompactAndMerge', 'two columns compacted and one merged');
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [4, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [2, 8, 16, 0]);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[14]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4800
     * @tc.name moveDownMatchesOracleOnSingleMerge_4800
     * @tc.desc Verify a single column down merge equals the independent reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_matchesOracleOnSingleMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [0, 4, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_matchesOracleOnSingleMerge', 'board and score agree with BoardOracle');
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_DOWN));
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_DOWN));
      expect(rule.score).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_4900
     * @tc.name moveDownMatchesOracleOnSparseColumn_4900
     * @tc.desc Verify a sparse column with a gap compacts exactly like the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_matchesOracleOnSparseColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [2, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_matchesOracleOnSparseColumn', 'compaction order agrees with the oracle');
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_DOWN));
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 2, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5000
     * @tc.name moveDownMatchesOracleOnDenseColumn_5000
     * @tc.desc Verify a dense column without equal neighbours matches the reference model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_matchesOracleOnDenseColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [16, 8, 4, 2]);
      let rule: GameRule = BoardKit.rule(before);
      let expected: number[] = BoardOracle.move(before, DIR_DOWN);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.log('moveDown_matchesOracleOnDenseColumn', 'a full column remained identical to the oracle');
      BoardKit.expectBoard(rule, expected);
      BoardKit.expectValues(rule.dataNumbers, before);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5100
     * @tc.name moveDownMatchesOracleOnFourColumns_5100
     * @tc.desc Verify a four column down move equals the oracle board and oracle merge score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_matchesOracleOnFourColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 0, 2, 2]);
      before = BoardKit.withColumn(before, 1, [4, 0, 0, 4]);
      before = BoardKit.withColumn(before, 2, [2, 4, 8, 16]);
      before = BoardKit.withColumn(before, 3, [0, 0, 8, 8]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_matchesOracleOnFourColumns', 'all four columns agree with the oracle');
      BoardKit.expectBoard(rule, BoardOracle.move(before, DIR_DOWN));
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_DOWN));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, BOTTOM_ROW), [4, 8, 16, 16]);
      expect(rule.score).assertEqual(28);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5200
     * @tc.name moveDownScoreMatchesOracle_5200
     * @tc.desc Verify the score counts only merges and equals the reference merge score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_scoreMatchesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [0, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [4, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(before);
      for (let column: number = 0; column < SIDE; column++) {
        rule.moveInRow(DIR_DOWN, column);
      }
      BoardKit.log('moveDown_scoreMatchesOracle', 'compaction scored nothing and the merge scored eight');
      BoardKit.expectScore(rule, 8);
      expect(rule.score === BoardOracle.mergeScore(before, DIR_DOWN)).assertTrue();
      expect(rule.dataNumbers[12]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5300
     * @tc.name moveDownSpawnsOneTileAfterChange_5300
     * @tc.desc Verify a changing whole board down move adds exactly one tile worth 2 or 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_spawnsOneTileAfterChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(0, [2, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.log('moveDown_spawnsOneTileAfterChange', 'the move plus one spawned tile were observed');
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5400
     * @tc.name moveDownSpawnOccupancyWithMerge_5400
     * @tc.desc Verify a merge plus one spawn keeps the occupied cell count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_spawnOccupancyWithMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(1, [0, 8, 8, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.log('moveDown_spawnOccupancyWithMerge', 'one merge and one spawn cancelled out');
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 1, 1);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[13]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5500
     * @tc.name moveDownBlankBoardNoSpawn_5500
     * @tc.desc Verify a whole board down move on an empty board neither spawns nor scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_blankBoardNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      let difference: number = BoardKit.singleDifference(before, rule.dataNumbers);
      let spawnedValue: number | null = null;
      if (difference >= 0) {
        spawnedValue = rule.dataNumbers[difference];
      }
      BoardKit.log('moveDown_blankBoardNoSpawn', 'an unchanged board must not spawn a tile');
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(spawnedValue).assertNull();
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5600
     * @tc.name moveDownPackedBottomRowNoSpawn_5600
     * @tc.desc Verify a board already packed on the bottom row produces no spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_packedBottomRowNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withRow(before, BOTTOM_ROW, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.log('moveDown_packedBottomRowNoSpawn', 'the packed bottom row kept the board unchanged');
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_DOWN);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5700
     * @tc.name moveDownFullNoMergeBoardNoSpawn_5700
     * @tc.desc Verify a full board without vertical neighbours cannot change or spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_fullNoMergeBoardNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.log('moveDown_fullNoMergeBoardNoSpawn', 'the over board was already stable downwards');
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_DOWN);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5800
     * @tc.name moveDownSpawnedTileValueIsTwoOrFour_5800
     * @tc.desc Verify the single cell added by a changed down move holds two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_spawnedTileValueIsTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [0, 4, 4, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_DOWN);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      let spawnIndex: number = -1;
      for (let index: number = 0; index < CELLS; index++) {
        if (expected[index] === 0 && rule.dataNumbers[index] !== 0) {
          spawnIndex = index;
        }
      }
      BoardKit.log('moveDown_spawnedTileValueIsTwoOrFour', 'exactly one oracle-zero cell became a tile');
      expect(spawnIndex >= 0).assertTrue();
      expect(expected[spawnIndex]).assertEqual(0);
      expect(rule.dataNumbers[spawnIndex] === 2 || rule.dataNumbers[spawnIndex] === 4).assertTrue();
      expect(rule.dataNumbers[14]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_5900
     * @tc.name moveDownScoreMatchesOracleAfterMove_5900
     * @tc.desc Verify a whole board down move scores exactly what the reference model predicts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_scoreMatchesOracleAfterMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before = BoardKit.withColumn(before, 0, [2, 2, 0, 0]);
      before = BoardKit.withColumn(before, 1, [4, 4, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.log('moveDown_scoreMatchesOracleAfterMove', 'the spawn added no score to the oracle total');
      BoardKit.expectScore(rule, 20);
      expect(rule.score === BoardOracle.mergeScore(before, DIR_DOWN)).assertTrue();
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[9]).assertEqual(8);
      expect(rule.dataNumbers[13]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_6000
     * @tc.name moveDownMirrorsUpCompaction_6000
     * @tc.desc Verify a down result is the vertical mirror of the up result on the mirrored line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_mirrorsUpCompaction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let downLine: number[] = [2, 0, 4, 4];
      let downRule: GameRule = BoardKit.rule(columnBoard(0, downLine));
      downRule.moveInRow(DIR_DOWN, 0);
      let upRule: GameRule = BoardKit.rule(columnBoard(0, reversedLine(downLine)));
      upRule.moveInRow(DIR_UP, 0);
      BoardKit.log('moveDown_mirrorsUpCompaction', 'the up result is the reversed down result');
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 0), [0, 0, 2, 8]);
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 0),
        reversedLine(BoardKit.columnOf(downRule.dataNumbers, 0)));
      BoardKit.expectScore(downRule, 8);
      BoardKit.expectScore(upRule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_6100
     * @tc.name moveDownMirrorsUpMergePosition_6100
     * @tc.desc Verify the pair merged by down is the pair merged by up on the mirrored line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_mirrorsUpMergePosition', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let downRule: GameRule = BoardKit.rule(columnBoard(1, [0, 2, 2, 2]));
      downRule.moveInRow(DIR_DOWN, 1);
      let upRule: GameRule = BoardKit.rule(columnBoard(1, [2, 2, 2, 0]));
      upRule.moveInRow(DIR_UP, 1);
      BoardKit.log('moveDown_mirrorsUpMergePosition', 'down kept the bottom tile, up kept the top tile');
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 1), [0, 0, 2, 4]);
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 1),
        reversedLine(BoardKit.columnOf(downRule.dataNumbers, 1)));
      BoardKit.expectScore(downRule, 4);
      BoardKit.expectScore(upRule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_6200
     * @tc.name moveDownDiffersFromUpOnAsymmetricLine_6200
     * @tc.desc Verify the same asymmetric line settles on opposite edges for down and up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_differsFromUpOnAsymmetricLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let line: number[] = [0, 0, 2, 4];
      let downRule: GameRule = BoardKit.rule(columnBoard(2, line));
      downRule.moveInRow(DIR_DOWN, 2);
      let upRule: GameRule = BoardKit.rule(columnBoard(2, line));
      upRule.moveInRow(DIR_UP, 2);
      BoardKit.log('moveDown_differsFromUpOnAsymmetricLine', 'down kept rows 2 and 3 while up pushed to row 0');
      BoardKit.expectValues(BoardKit.columnOf(downRule.dataNumbers, 2), [0, 0, 2, 4]);
      BoardKit.expectValues(BoardKit.columnOf(upRule.dataNumbers, 2), [2, 4, 0, 0]);
      expect(downRule.dataNumbers[10] === upRule.dataNumbers[10]).assertFalse();
      BoardKit.expectScore(downRule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_6300
     * @tc.name moveDownMergesNonPowerOfTwo_6300
     * @tc.desc Verify merging compares equality only and does not require powers of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_mergesNonPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(3, [0, 0, 3, 3]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 3);
      BoardKit.log('moveDown_mergesNonPowerOfTwo', 'two 3 tiles produced a 6 tile worth 6 points');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [0, 0, 0, 6]);
      BoardKit.expectScore(rule, 6);
      expect(BoardOracle.mergeScore(before, DIR_DOWN)).assertEqual(6);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_6400
     * @tc.name moveDownMergesLargeTiles_6400
     * @tc.desc Verify merging two 1024 tiles yields 2048 without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_mergesLargeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = columnBoard(2, [1024, 1024, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.log('moveDown_mergesLargeTiles', 'two 1024 tiles produced 2048');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 0, 0, 2048]);
      BoardKit.expectScore(rule, 2048);
      expect(signatureOf(rule.dataNumbers)).assertContain(',2048,');
      expect(rule.dataNumbers[14]).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEDOWN_6500
     * @tc.name moveDownScoreAccumulatesAcrossCalls_6500
     * @tc.desc Verify a second merge on the same rule adds to the score instead of replacing it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveDown_scoreAccumulatesAcrossCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard(0, [0, 0, 4, 4]));
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectScore(rule, 8);
      rule.dataNumbers[8] = 8;
      rule.dataNumbers[12] = 8;
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.log('moveDown_scoreAccumulatesAcrossCalls', 'the second merge raised the score from 8 to 24');
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 16]);
      BoardKit.expectScore(rule, 24);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });
  });
}
