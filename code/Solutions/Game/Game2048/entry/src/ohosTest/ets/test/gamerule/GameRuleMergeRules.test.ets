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
 * A merge must consume its source tile, so the surviving count matters.
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
 * board. Used to prove a line move never grows the board.
 */
function cellAtOrUndefined(values: number[], index: number): number | undefined {
  if (index < 0 || index >= values.length) {
    return undefined;
  }
  return values[index];
}

/**
 * Runs one deterministic line move on every row or column of a fresh board.
 * No random tile is spawned, so the resulting board is exactly the merge
 * result of the chosen direction.
 */
function moveAllLines(values: number[], direction: string): GameRule {
  let rule: GameRule = BoardKit.rule(values);
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
  return rule;
}

/**
 * GameRule 合并规则测试套件。
 *
 * 生产实现沿移动方向找到最近的非零格：目标格为空则搬运，目标格同值则合并
 * 一次并把源格清零，随后越过合并格继续扫描。由此得到三条契约：先压紧再合并、
 * 每格每步只合并一次、配对顺序由移动方向决定。本套件只验证这三条契约。
 */
export default function gameRuleMergeRulesTest() {
  describe('gameRuleMergeRulesTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMergeRulesTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMergeRulesTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0100
     * @tc.name mergeFourEqualLeft0100
     * @tc.desc Verify four equal tiles moving left form two pairs instead of one four tile group
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_fourEqualLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 2, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[0] === rule.dataNumbers[1]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0200
     * @tc.name mergeFourEqualRight0200
     * @tc.desc Verify four equal tiles moving right also form two pairs anchored at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_fourEqualRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 2, 2]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[2] === rule.dataNumbers[3]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0300
     * @tc.name mergeThreeEqualLeft0300
     * @tc.desc Verify three equal tiles moving left merge the first two and leave the third untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_threeEqualLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 2, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 2, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0400
     * @tc.name mergeThreeEqualRight0400
     * @tc.desc Verify the same three equal tiles moving right leave the unpaired tile on the left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_threeEqualRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 2, 0]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0500
     * @tc.name mergeLeadingZeroThreeLeft0500
     * @tc.desc Verify a leading empty cell does not change which two of three equal tiles merge leftward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_leadingZeroThreeLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([0, 2, 2, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 2, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0600
     * @tc.name mergeLeadingZeroThreeRight0600
     * @tc.desc Verify the unpaired tile ends up above the merged tile when the same line moves right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_leadingZeroThreeRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([0, 2, 2, 2]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0700
     * @tc.name mergeLeadingTilePairLeft0700
     * @tc.desc Verify a pair behind a larger tile still merges while the larger tile stays put
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_leadingTilePairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 2, 2, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0800
     * @tc.name mergePairTrailingTileLeft0800
     * @tc.desc Verify a pair followed by a different tile merges the pair only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_pairTrailingTileLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 4, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_0900
     * @tc.name mergeNoChainWithExistingFour0900
     * @tc.desc Verify a newly merged four does not merge again with an existing four in the same step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_noChainWithExistingFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 4, 8]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 8, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1000
     * @tc.name mergePairBeforeLargerTile1000
     * @tc.desc Verify a 4 pair merges into 8 without touching an adjacent existing 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_pairBeforeLargerTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 8, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [8, 8, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1100
     * @tc.name mergeFourEightLeft1100
     * @tc.desc Verify four equal eight tiles merge into two sixteen tiles moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_fourEightLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 8, 8]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [16, 16, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.dataNumbers[1]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1200
     * @tc.name mergeFourEightRight1200
     * @tc.desc Verify four equal eight tiles merge into two sixteen tiles moving right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_fourEightRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 8, 8]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 16, 16]);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[2]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1300
     * @tc.name mergeTwoGroupsLeft1300
     * @tc.desc Verify two disjoint equal groups each merge once moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_twoGroupsLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 8, 8]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 16, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1400
     * @tc.name mergeTwoGroupsRight1400
     * @tc.desc Verify the same two groups keep their own pair order but anchor to the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_twoGroupsRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 8, 8]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 16]);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1500
     * @tc.name mergeFourFourLeft1500
     * @tc.desc Verify four equal four tiles merge into two eights moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_fourFourLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 4, 4]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [8, 8, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1600
     * @tc.name mergeFourFourRight1600
     * @tc.desc Verify four equal four tiles merge into two eights moving right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_fourFourRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 4, 4]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 8, 8]);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1700
     * @tc.name mergeConsumesRightSource1700
     * @tc.desc Verify a left merge keeps the left cell and zeroes the right source cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_consumesRightSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([0, 0, 2, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(0);
      expect(indexOfOrNull(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1800
     * @tc.name mergeConsumesLeftSourceRight1800
     * @tc.desc Verify a right merge keeps the right cell and zeroes the left source cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_consumesLeftSourceRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.moveInRow(DIR_RIGHT, 0);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(indexOfOrNull(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_1900
     * @tc.name mergeGapEqualLeft1900
     * @tc.desc Verify equal tiles separated by two empty cells merge after compaction moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_gapEqualLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 0, 0, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2000
     * @tc.name mergeGapEqualRight2000
     * @tc.desc Verify the same separated equal tiles merge at the right edge moving right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_gapEqualRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 0, 0, 2]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2100
     * @tc.name mergeGapThenPairLeft2100
     * @tc.desc Verify compaction brings a gap separated pair together before the trailing equal pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_gapThenPairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 0, 2, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 2, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2200
     * @tc.name mergeDescendingPairLeft2200
     * @tc.desc Verify a pair in the middle of a descending line merges while both neighbours stay
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_descendingPairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 4, 4, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [8, 8, 2, 0]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2300
     * @tc.name mergeSkipsDifferentValues2300
     * @tc.desc Verify a pair between two different values merges without crossing either value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_skipsDifferentValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 4, 8]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 8, 8, 0]);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2400
     * @tc.name mergeTrailingPairRight2400
     * @tc.desc Verify a leading pair moves to the right edge as a merged tile when a larger tile trails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_trailingPairRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 4, 8]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 4, 4, 8]);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2500
     * @tc.name mergeMixedMagnitudesRight2500
     * @tc.desc Verify two different valued groups keep their own merged values when moving right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_mixedMagnitudesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 2, 2]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 8, 4]);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2600
     * @tc.name mergeLargePairLeft2600
     * @tc.desc Verify two 1024 tiles merge into one 2048 tile moving left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_largePairLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([1024, 1024, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.dataNumbers[0]).assertEqual(2048);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2700
     * @tc.name mergeLargeFourLeft2700
     * @tc.desc Verify four 512 tiles merge into two 1024 tiles instead of chaining into 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_largeFourLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([512, 512, 512, 512]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [1024, 1024, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(1024);
      expect(rule.dataNumbers[1]).assertEqual(1024);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2800
     * @tc.name noMergeAlternatingValues2800
     * @tc.desc Verify alternating values with no adjacent equal pair keep their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noMerge_alternatingValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 2, 4]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 2, 4]);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_2900
     * @tc.name noMergeCompactOnly2900
     * @tc.desc Verify moving a line with zeros but no equal pair only compacts the tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noMerge_compactOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 0, 4, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 4, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3000
     * @tc.name noMergeAcrossRows3000
     * @tc.desc Verify a leftward move never merges equal tiles that only touch vertically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noMerge_acrossRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 0, 0],
        [2, 4, 0, 0],
        [8, 0, 0, 0],
        [8, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers) === CELLS).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3100
     * @tc.name onlyTargetRowChanges3100
     * @tc.desc Verify moveInRow merges the addressed row and leaves the other three rows byte for byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('onlyTargetRowChanges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 8, 16, 32],
        [64, 128, 256, 512],
        [2, 4, 8, 16]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [4, 8, 16, 32]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [64, 128, 256, 512]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 4, 8, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3200
     * @tc.name onlyTargetColumnChanges3200
     * @tc.desc Verify moveInRow merges the addressed column and leaves the other three columns intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('onlyTargetColumnChanges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      values = BoardKit.withColumn(values, 1, [4, 8, 16, 32]);
      values = BoardKit.withColumn(values, 2, [2, 4, 8, 16]);
      values = BoardKit.withColumn(values, 3, [32, 16, 8, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 1), [4, 8, 16, 32]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [2, 4, 8, 16]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [32, 16, 8, 4]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3300
     * @tc.name verticalPairUp3300
     * @tc.desc Verify two equal tiles in one column merge towards the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('verticalPairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([2, 2, 0, 0]));
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3400
     * @tc.name verticalPairDown3400
     * @tc.desc Verify the same vertical pair merges towards the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('verticalPairDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([2, 2, 0, 0]));
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[12]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3500
     * @tc.name verticalThreeUp3500
     * @tc.desc Verify three equal vertical tiles merge the top two and leave the bottom one moving up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('verticalThreeUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([2, 2, 2, 0]));
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 2, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3600
     * @tc.name verticalThreeDown3600
     * @tc.desc Verify three equal vertical tiles merge the bottom two and leave the top one moving down
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('verticalThreeDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([0, 2, 2, 2]));
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3700
     * @tc.name verticalTwoGroupsUp3700
     * @tc.desc Verify two vertical equal groups merge once each towards the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('verticalTwoGroupsUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([4, 4, 8, 8]));
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [8, 16, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3800
     * @tc.name verticalTwoGroupsDown3800
     * @tc.desc Verify the same two vertical groups preserve their merged values at the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('verticalTwoGroupsDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([4, 4, 8, 8]));
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 8, 16]);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_3900
     * @tc.name resultPositionLeft3900
     * @tc.desc Verify merged values occupy the leftmost cells after a leftward move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('resultPosition_left', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 8, 8]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('8|16|0|0');
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4000
     * @tc.name resultPositionRight4000
     * @tc.desc Verify merged values occupy the rightmost cells after a rightward move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('resultPosition_right', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 8, 8]));
      rule.moveInRow(DIR_RIGHT, 0);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('0|0|8|16');
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4100
     * @tc.name resultPositionUp4100
     * @tc.desc Verify merged values occupy the topmost cells after an upward move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('resultPosition_up', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([4, 4, 8, 8]));
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [8, 16, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4200
     * @tc.name resultPositionDown4200
     * @tc.desc Verify merged values occupy the bottommost cells after a downward move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('resultPosition_down', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([4, 4, 8, 8]));
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 8, 16]);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4300
     * @tc.name fourRowsMergeOnce4300
     * @tc.desc Verify every row of a uniform full board performs exactly one merge per pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fourRowsMergeOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 4, 4]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      for (let row: number = 0; row < SIDE; row++) {
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, row), [4, 8, 0, 0]);
      }
      BoardKit.expectBoard(rule, BoardOracle.move(values, DIR_LEFT));
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      expect(cellAtOrUndefined(rule.dataNumbers, CELLS)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4400
     * @tc.name fourRowsFourEqual4400
     * @tc.desc Verify every row of a four equal board keeps two tiles after one move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fourRowsFourEqual', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 2, 2]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      for (let row: number = 0; row < SIDE; row++) {
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, row), [4, 4, 0, 0]);
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4500
     * @tc.name occupancyDropsByMerges4500
     * @tc.desc Verify two merges on one row remove exactly two occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('occupancyDropsByMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number = BoardKit.countNonZero(values);
      rule.moveInRow(DIR_LEFT, 0);
      let after: number = BoardKit.countNonZero(rule.dataNumbers);
      expect(before).assertEqual(4);
      expect(after).assertEqual(2);
      expect(before - after).assertEqual(2);
      expect(before !== after).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4600
     * @tc.name singleMergeLosesOneTile4600
     * @tc.desc Verify a single merge turns two occupied cells into one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('singleMergeLosesOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(BoardKit.countNonZero(values)).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(indexOfOrNull(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4700
     * @tc.name tripleMergeLosesOneTile4700
     * @tc.desc Verify three equal tiles drop to two occupied cells after a single merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tripleMergeLosesOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(BoardKit.countNonZero(values)).assertEqual(3);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4800
     * @tc.name mergeNoChainLargePair4800
     * @tc.desc Verify a merged 2048 tile does not chain into an adjacent existing 2048 tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_noChainLargePair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([1024, 1024, 2048, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2048, 2048, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(2048);
      expect(rule.dataNumbers[1]).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_4900
     * @tc.name mergeGapInsideTriple4900
     * @tc.desc Verify a gap between three equal tiles still lets only the first pair merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_gapInsideTriple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 0, 4]));
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [8, 4, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_5000
     * @tc.name mergePairsAtBothEdgesRight5000
     * @tc.desc Verify the inner equal pair merges while the outer unequal neighbours survive on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_pairsAtBothEdgesRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 4, 2]));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 8, 2]);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_5100
     * @tc.name noMergeFullBoardLeft5100
     * @tc.desc Verify a full checkerboard has no equal horizontal neighbour and cannot merge left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noMerge_fullBoardLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers) === CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_5200
     * @tc.name mergeVerticalGapPairUp5200
     * @tc.desc Verify a vertical pair separated by two empty cells merges at the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_verticalGapPairUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([2, 0, 0, 2]));
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_5300
     * @tc.name mergeVerticalGapPairDown5300
     * @tc.desc Verify the same vertical pair merged downward lands on the bottom cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('merge_verticalGapPairDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([2, 0, 0, 2]));
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[12]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_5400
     * @tc.name noMergeFullBoardUp5400
     * @tc.desc Verify the same full checkerboard has no equal vertical neighbour and cannot merge upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noMerge_fullBoardUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = moveAllLines(values, DIR_UP);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[5]).assertEqual(2);
      expect(rule.dataNumbers[6]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMERGERULES_5500
     * @tc.name mergeTwoColumnsIndependently5500
     * @tc.desc Verify two disjoint column pairs merge independently during one upward pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('mergeTwoColumnsIndependently', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 0, 4, 0],
        [2, 0, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_UP);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [8, 0, 0, 0]);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });
  });
}
