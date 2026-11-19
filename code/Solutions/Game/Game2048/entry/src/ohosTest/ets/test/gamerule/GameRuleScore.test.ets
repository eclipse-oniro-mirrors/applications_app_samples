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
 * Used to prove that a merge consumed its source tile.
 */
function firstIndexOfOrNull(values: number[], target: number): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return null;
}

/**
 * Returns the cell value at index, or undefined when index is outside the
 * board. Used to prove a scoring move never grows the board.
 */
function cellAtOrUndefined(values: number[], index: number): number | undefined {
  if (index < 0 || index >= values.length) {
    return undefined;
  }
  return values[index];
}

/**
 * Runs one deterministic line move on every row or column of a fresh board.
 * The helper never spawns a random tile, so the resulting score is exactly
 * the score of the merges performed by this movement.
 */
function moveAllLines(values: number[], direction: string): GameRule {
  let rule: GameRule = BoardKit.rule(values);
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
  return rule;
}

/**
 * GameRule 计分累加测试套件。
 *
 * 生产实现只在一个位置写 score：dataChange 里两个相等格合并成 2v 时执行
 * `score += 2v`。移动、补块、清零源格都不会写 score。本套件只围绕这个字段
 * 的累加语义展开，盘面形态与合并规则由其它套件负责。
 */
export default function gameRuleScoreTest() {
  describe('gameRuleScoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleScoreTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleScoreTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0100
     * @tc.name scoreStartsAtZero0100
     * @tc.desc Verify a freshly constructed rule reports a zero score even when the board already holds a pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_startsAtZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.score).assertEqual(0);
      expect(rule.score === 0).assertTrue();
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0200
     * @tc.name scorePairTwoAddsFour0200
     * @tc.desc Verify merging two tiles worth two earns exactly four points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_pairTwoAddsFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('4|0|0|0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0300
     * @tc.name scorePairFourAddsEight0300
     * @tc.desc Verify merging two tiles worth four earns eight points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_pairFourAddsEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(8);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.score === BoardOracle.mergeScore(BoardKit.row([4, 4, 0, 0]), DIR_LEFT)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0400
     * @tc.name scorePairEightAddsSixteen0400
     * @tc.desc Verify merging two tiles worth eight earns sixteen points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_pairEightAddsSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([8, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(16);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
      expect(rule.dataNumbers[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0500
     * @tc.name scorePairAtRightEdge0500
     * @tc.desc Verify the same pair scores four when it is reached from the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_pairAtRightEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([0, 0, 2, 2]));
      rule.moveInRow(DIR_RIGHT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0600
     * @tc.name scorePairAfterLeadingGap0600
     * @tc.desc Verify a pair surrounded by zeros still scores after compaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_pairAfterLeadingGap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([0, 2, 2, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0700
     * @tc.name scoreSeparatedPairBridgesGap0700
     * @tc.desc Verify equal tiles separated by empty cells merge and score four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_separatedPairBridgesGap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0800
     * @tc.name scoreTwoMergesInOneRow0800
     * @tc.desc Verify two independent merges on one row accumulate to twelve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_twoMergesInOneRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 4, 4]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('4|8|0|0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_0900
     * @tc.name scoreFourEqualCellsMergeTwice0900
     * @tc.desc Verify four equal cells become two merges and add eight points in total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_fourEqualCellsMergeTwice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(8);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1000
     * @tc.name scoreMixedMagnitudesAdd1000
     * @tc.desc Verify the score adds the merged value of each pair independently of tile magnitude
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_mixedMagnitudesAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 8, 8]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(20);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(16);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('4|16|0|0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1100
     * @tc.name scoreFourUniformRowsAccumulate1100
     * @tc.desc Verify four identical rows each contribute four points to one score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_fourUniformRowsAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 0, 0]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(16);
      for (let row: number = 0; row < SIDE; row++) {
        expect(BoardKit.rowOf(rule.dataNumbers, row)[0]).assertEqual(4);
      }
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1200
     * @tc.name scoreRowsUseTheirOwnTileValue1200
     * @tc.desc Verify rows holding different tile values sum four, eight, sixteen and thirty two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_rowsUseTheirOwnTileValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [8, 8, 0, 0],
        [16, 16, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(60);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(rule.dataNumbers[8]).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1300
     * @tc.name scoreCrossDirectionAdds1300
     * @tc.desc Verify a leftward merge and a later upward merge accumulate on the same rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_crossDirectionAdds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1400
     * @tc.name scoreVerticalUpPair1400
     * @tc.desc Verify a vertical pair merged upward scores four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_verticalUpPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1500
     * @tc.name scoreVerticalDownPair1500
     * @tc.desc Verify the same vertical pair merged downward also scores four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_verticalDownPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_DOWN));
      expect(rule.dataNumbers[12]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1600
     * @tc.name scoreVerticalThreeEqual1600
     * @tc.desc Verify a column of three equal tiles yields one merge and four points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_verticalThreeEqual', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.column([2, 2, 2, 0]));
      rule.moveInRow(DIR_UP, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1700
     * @tc.name scoreVerticalTwoMergesDown1700
     * @tc.desc Verify two vertical merges accumulated from the bottom add twenty four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_verticalTwoMergesDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([4, 4, 8, 8]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_DOWN, 0);
      expect(rule.score).assertEqual(24);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_DOWN));
      expect(rule.dataNumbers[12]).assertEqual(16);
      expect(rule.dataNumbers[8]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1800
     * @tc.name scoreSliderAddsNothing1800
     * @tc.desc Verify sliding non equal tiles towards the edge adds no points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_sliderAddsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 0, 8, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_1900
     * @tc.name scoreCompactionOnlyAddsNothing1900
     * @tc.desc Verify compaction of separated tiles without an equal neighbour scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_compactionOnlyAddsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(0);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(values, DIR_LEFT));
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2000
     * @tc.name scoreAlternatingValuesAddNothing2000
     * @tc.desc Verify a row of alternating different values cannot merge and scores zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_alternatingValuesAddNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 2, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(0);
      expect(rule.score !== 0).assertFalse();
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2100
     * @tc.name scoreEmptyRowAddsNothing2100
     * @tc.desc Verify moving an empty board leaves the score at zero with no tile present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_emptyRowAddsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(firstIndexOfOrNull(rule.dataNumbers, 2)).assertNull();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2200
     * @tc.name scoreFullOverBoardAddsNothing2200
     * @tc.desc Verify a full board with no merge opportunity scores zero in every row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_fullOverBoardAddsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      BoardKit.expectBoard(rule, values);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2300
     * @tc.name scoreBigPair1024Adds2048_2300
     * @tc.desc Verify merging two 1024 tiles earns 2048 points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_bigPair1024Adds2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([1024, 1024, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(2048);
      expect(rule.dataNumbers[0]).assertEqual(2048);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2400
     * @tc.name scoreBigPair2048Adds4096_2400
     * @tc.desc Verify merging two 2048 tiles earns the next power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_bigPair2048Adds4096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2048, 2048, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4096);
      expect(rule.dataNumbers[0]).assertEqual(4096);
      expect(rule.score === 4096).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2500
     * @tc.name scoreSmallAndLargePairsAdd2500
     * @tc.desc Verify a small pair and a large pair on one row add their merged values exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_smallAndLargePairsAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 1024, 1024]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(2052);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2048);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2600
     * @tc.name scoreNonMergingRowsContributeZero2600
     * @tc.desc Verify a slide-only row inside a multi row move contributes no points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_nonMergingRowsContributeZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 0, 8, 0],
        [8, 8, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(20);
      expect(rule.dataNumbers[4]).assertEqual(4);
      expect(rule.dataNumbers[5]).assertEqual(8);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2700
     * @tc.name scoreRepeatedCallsSameRowAccumulate2700
     * @tc.desc Verify calling the same row move four times accumulates each new merge once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_repeatedCallsSameRowAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 2, 2]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(8);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(16);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(16);
      expect(rule.dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2800
     * @tc.name scoreMoveKeepsMergeScore2800
     * @tc.desc Verify a whole board move keeps the merge score after it spawns a tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_moveKeepsMergeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(4);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_2900
     * @tc.name scoreSpawnDoesNotAddValue2900
     * @tc.desc Verify the random spawned tile of a move never adds its face value to the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_spawnDoesNotAddValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(12);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(before, DIR_LEFT));
      expect(rule.score !== 2).assertTrue();
      expect(rule.score !== 4).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3000
     * @tc.name scoreMoveOnCompactBoardKeepsZero3000
     * @tc.desc Verify a move that changes nothing neither spawns nor scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_moveOnCompactBoardKeepsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(0);
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.dataNumbers[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3100
     * @tc.name scoreMoveOnOverBoardKeepsZero3100
     * @tc.desc Verify a move on a full merge-free board keeps a zero score and the same board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_moveOnOverBoardKeepsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(0);
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3200
     * @tc.name scoreManualValueReceivesMerge3200
     * @tc.desc Verify a pre-existing score is increased by the next merge instead of being reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_manualValueReceivesMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 0, 0]));
      rule.score = 100;
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(108);
      expect(rule.dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3300
     * @tc.name scoreInitResetsToZero3300
     * @tc.desc Verify init clears a stale score while leaving a full sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_initResetsToZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.score = 999;
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.score !== 999).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3400
     * @tc.name scoreOracleAgreesSingleLine3400
     * @tc.desc Verify a mixed one row merge matches the independent oracle score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_oracleAgreesSingleLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      let expected: number = BoardOracle.mergeScore(values, DIR_LEFT);
      expect(rule.score).assertEqual(expected);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3500
     * @tc.name scoreOracleAgreesFullBoard3500
     * @tc.desc Verify a full board of mixed pairs matches the oracle score for all four rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_oracleAgreesFullBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 4, 4],
        [4, 4, 2, 2],
        [2, 2, 4, 4],
        [4, 4, 2, 2]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
      expect(rule.score).assertEqual(48);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3600
     * @tc.name scoreOracleAgreesVerticalBoard3600
     * @tc.desc Verify a vertically merged board matches the oracle score for all four columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_oracleAgreesVerticalBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedColumn([2, 2, 4, 4]);
      let rule: GameRule = moveAllLines(values, DIR_UP);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_UP));
      expect(rule.score).assertEqual(48);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3700
     * @tc.name scoreOracleAgreesAcrossTwoOperations3700
     * @tc.desc Verify the accumulated score equals the sum of two independent oracle movement scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_oracleAgreesAcrossTwoOperations', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      let firstScore: number = rule.score;
      let middle: number[] = BoardKit.valuesOf(rule);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      let expected: number = BoardOracle.mergeScore(values, DIR_LEFT) +
        BoardOracle.mergeScore(middle, DIR_UP);
      expect(rule.score).assertEqual(expected);
      expect(rule.score).assertEqual(firstScore + 8);
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3800
     * @tc.name scoreSequenceNeverDecreases3800
     * @tc.desc Verify the score stays flat or grows after each of four successive directional moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_sequenceNeverDecreases', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_UP, line);
      }
      expect(rule.score).assertEqual(12);
      expect(rule.score !== 4).assertTrue();
      for (let line: number = 0; line < SIDE; line++) {
        rule.moveInRow(DIR_RIGHT, line);
      }
      expect(rule.score).assertEqual(12);
      expect(rule.score === 12).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_3900
     * @tc.name scoreSourceClearKeepsScore3900
     * @tc.desc Verify zeroing the consumed source cells after a merge leaves the earned score intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_sourceClearKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(firstIndexOfOrNull(rule.dataNumbers, 2)).assertNull();
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4000
     * @tc.name scoreOccupancyDropDoesNotChangeScore4000
     * @tc.desc Verify the score follows merged values while occupancy drops by one per merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_occupancyDropDoesNotChangeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number = BoardKit.countNonZero(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(12);
      expect(before).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.score).assertEqual(BoardOracle.mergeScore(values, DIR_LEFT));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4100
     * @tc.name scoreIgnoresDataTypeIds4100
     * @tc.desc Verify custom DataType ids do not disturb the score earned by a pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_ignoresDataTypeIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let ids: number[] = BoardKit.zeros(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        ids[index] = 100 - index;
      }
      let rule: GameRule = BoardKit.ruleOf(BoardKit.dataWithIds(ids, values));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4200
     * @tc.name scoreRulesAreIndependent4200
     * @tc.desc Verify scoring one rule never changes the score of another rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_rulesAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      let second: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      first.moveInRow(DIR_LEFT, 0);
      expect(first.score).assertEqual(4);
      expect(second.score).assertEqual(0);
      expect(second.dataNumbers[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4300
     * @tc.name scoreRemainsNumeric4300
     * @tc.desc Verify the score field stays a plain number after a merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_remainsNumeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([16, 16, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(typeof rule.score).assertEqual('number');
      expect(rule.score).assertEqual(32);
      expect(rule.score + 0).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4400
     * @tc.name scoreSurvivesGameOverQuery4400
     * @tc.desc Verify repeated game over queries do not modify an earned score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_survivesGameOverQuery', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.isGameOver()).assertFalse();
      expect(rule.isGameOver()).assertFalse();
      expect(rule.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4500
     * @tc.name scoreKeepsBoardLength4500
     * @tc.desc Verify scoring never appends a seventeenth cell to the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_keepsBoardLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(cellAtOrUndefined(rule.dataNumbers, CELLS)).assertUndefined();
      expect(rule.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4600
     * @tc.name scoreZeroRowsBetweenPairs4600
     * @tc.desc Verify an empty row between two merging rows does not block their scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_zeroRowsBetweenPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [2, 2, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = moveAllLines(values, DIR_LEFT);
      expect(rule.score).assertEqual(8);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('4|0|0|0/0|0|0|0/4|0|0|0');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESCORE_4700
     * @tc.name scoreMatchesOracleLineHelper4700
     * @tc.desc Verify a two pair row scores the same as the oracle line helper sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('score_matchesOracleLineHelper', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let line: number[] = [4, 4, 16, 16];
      let rule: GameRule = BoardKit.rule(BoardKit.row(line));
      rule.moveInRow(DIR_LEFT, 0);
      let expected: number = BoardOracle.mergeScoreOfLine(line);
      expect(expected).assertEqual(40);
      expect(rule.score).assertEqual(expected);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(32);
    });
  });
}
