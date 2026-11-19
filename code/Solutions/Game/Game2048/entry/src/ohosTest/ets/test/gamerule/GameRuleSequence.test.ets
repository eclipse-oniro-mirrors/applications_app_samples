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
import { BoardKit, CELLS, SIDE, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/**
 * GameRule 短序列测试套件。
 *
 * 所有步骤都用 moveInRow 完成，因此每一步都是确定性的：不会补随机块，也不会
 * 改写 status，只有合并会累加 score。套件覆盖 2 到 4 步的序列，逐行或逐列
 * 与独立参考模型 BoardOracle 比对，用来锁定「顺序」和「方向组合」两种契约。
 */
export default function gameRuleSequenceTest() {
  describe('gameRuleSequenceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleSequenceTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleSequenceTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0100
     * @tc.name sequenceLeftThenUpShift0100
     * @tc.desc Verify a left then up sequence only shifts three tiles into the first column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftThenUpShift', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 5, 4, 15, 8]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(0);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(String(rule.dataNumbers)).assertContain('2,0,0,0,4,0,0,0,8');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0200
     * @tc.name sequenceLeftThenUpMerges0200
     * @tc.desc Verify a left then up sequence merges one pair per row before stacking
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftThenUpMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 2, 2, 4, 4, 7, 4]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(12);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0300
     * @tc.name sequenceUpThenLeftOrder0300
     * @tc.desc Verify up then left merges the column pair and parks the merged tile on top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_upThenLeftOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 5, 2]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(4);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0400
     * @tc.name sequenceLeftThenUpOrder0400
     * @tc.desc Verify left then up on the same board reaches a different but equal scoring state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftThenUpOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 5, 2]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[0] !== 2).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0500
     * @tc.name sequenceRightThenDownShift0500
     * @tc.desc Verify right then down parks two distinct tiles in the bottom right corner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rightThenDownShift', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 2, 4]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_RIGHT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_RIGHT));
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_DOWN);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_DOWN));
      expect(rule.dataNumbers[14]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0600
     * @tc.name sequenceRightThenDownMerges0600
     * @tc.desc Verify right then down merges a horizontal pair and then a vertical pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rightThenDownMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([2, 8, 13, 4, 15, 4]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_RIGHT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_RIGHT));
      expect(rule.score).assertEqual(8);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_DOWN);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_DOWN));
      expect(rule.score).assertEqual(24);
      expect(rule.dataNumbers[15]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0700
     * @tc.name sequenceMergeThenSlide0700
     * @tc.desc Verify a merge followed by a slide moves the new tile into place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_mergeThenSlide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 8, 8]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(4);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0800
     * @tc.name sequenceSlideThenMerge0800
     * @tc.desc Verify a slide followed by a merge creates and then combines the pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_slideThenMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([2, 2, 3, 4, 4, 2]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(0);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_0900
     * @tc.name sequenceFourDirections0900
     * @tc.desc Verify a left up right down sequence accumulates two merges on the way
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_fourDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([2, 2, 3, 4, 8, 2, 11, 8]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(28);
      expect(rule.dataNumbers[15]).assertEqual(16);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1000
     * @tc.name sequenceLeftDownLeft1000
     * @tc.desc Verify left down left merges a row pair and then drops it to the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftDownLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([5, 2, 6, 2]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(4);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_DOWN);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_DOWN));
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1100
     * @tc.name sequenceLeftUpRight1100
     * @tc.desc Verify left up right spreads three tiles into three different rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftUpRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 4, 2, 9, 4, 13, 8]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1200
     * @tc.name sequenceTwoRowsLeft1200
     * @tc.desc Verify moving row zero and row two left leaves both other rows empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_twoRowsLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 8, 4]));
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), expectedLine(before, 0, DIR_LEFT));
      expect(rule.score).assertEqual(0);
      before = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, 2);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), expectedLine(before, 2, DIR_LEFT));
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1300
     * @tc.name sequenceTwoRowsTwoRounds1300
     * @tc.desc Verify two rows alternate left and right without any merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_twoRowsTwoRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 8, 4]));
      let roundDirections: string[] = [DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT];
      let lines: number[] = [0, 0, 2, 2];
      for (let step: number = 0; step < roundDirections.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(roundDirections[step], lines[step]);
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, lines[step]),
          expectedLine(before, lines[step], roundDirections[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.dataNumbers[11]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1400
     * @tc.name sequenceTwoRowsMergeAccumulate1400
     * @tc.desc Verify two row merges accumulate score four then twelve
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_twoRowsMergeAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 8, 4, 9, 4]));
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), expectedLine(before, 0, DIR_LEFT));
      let score: number = lineMergeScore(before, 0, DIR_LEFT);
      expect(rule.score).assertEqual(score);
      before = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, 2);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), expectedLine(before, 2, DIR_LEFT));
      score = score + lineMergeScore(before, 2, DIR_LEFT);
      expect(rule.score).assertEqual(score);
      expect(score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1500
     * @tc.name sequenceRotateFourRows1500
     * @tc.desc Verify four rows moved in alternating directions stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rotateFourRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 6, 4, 8, 8, 15, 16]));
      for (let line: number = 0; line < SIDE; line++) {
        let direction: string = line % 2 === 0 ? DIR_LEFT : DIR_RIGHT;
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(direction, line);
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, line), expectedLine(before, line, direction));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1600
     * @tc.name sequenceRotateFourRowsTwoRounds1600
     * @tc.desc Verify a second rotation round finds every row already parked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rotateFourRowsTwoRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 6, 4, 8, 8, 15, 16]));
      let lines: number[] = [0, 1, 2, 3, 0, 1, 2, 3];
      for (let step: number = 0; step < lines.length; step++) {
        let direction: string = lines[step] % 2 === 0 ? DIR_LEFT : DIR_RIGHT;
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(direction, lines[step]);
        BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, lines[step]), expectedLine(before, lines[step], direction));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1700
     * @tc.name sequenceRotateFourColumns1700
     * @tc.desc Verify four columns moved up down up down stay independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rotateFourColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([4, 2, 9, 4, 2, 8, 7, 16]));
      for (let line: number = 0; line < SIDE; line++) {
        let direction: string = line % 2 === 0 ? DIR_UP : DIR_DOWN;
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(direction, line);
        BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, line), expectedLine(before, line, direction));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[13]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1800
     * @tc.name sequenceRotateFourColumnsTwoRounds1800
     * @tc.desc Verify a second column rotation round changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rotateFourColumnsTwoRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([4, 2, 9, 4, 2, 8, 7, 16]));
      let lines: number[] = [0, 1, 2, 3, 0, 1, 2, 3];
      for (let step: number = 0; step < lines.length; step++) {
        let direction: string = lines[step] % 2 === 0 ? DIR_UP : DIR_DOWN;
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(direction, lines[step]);
        BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, lines[step]), expectedLine(before, lines[step], direction));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[13]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_1900
     * @tc.name sequenceTwoLeftsAccumulate1900
     * @tc.desc Verify two left moves merge two pairs in two consecutive score steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_twoLeftsAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 2, 4]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(4);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2000
     * @tc.name sequenceLeftThenUpAccumulate2000
     * @tc.desc Verify a row merge followed by a column merge totals sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftThenUpAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 4, 2, 5, 2]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(rule.score).assertEqual(8);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(16);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2100
     * @tc.name sequenceCycleRowLeftRight2100
     * @tc.desc Verify left then right returns a full sparse row to its parked right state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_cycleRowLeftRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 4, 3, 8]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      expect(BoardKit.rowOf(rule.dataNumbers, 0)[0]).assertEqual(2);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_RIGHT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2200
     * @tc.name sequenceRightLeftRightCycle2200
     * @tc.desc Verify right left right on a right packed row keeps the same row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rightLeftRightCycle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([2, 2, 3, 4]));
      let directions: string[] = [DIR_RIGHT, DIR_LEFT, DIR_RIGHT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2300
     * @tc.name sequenceLeftRightLeftMerge2300
     * @tc.desc Verify a middle pair merges once and never merges again while cycling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_leftRightLeftMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 2]));
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2400
     * @tc.name sequenceUpDownUpColumn2400
     * @tc.desc Verify up down up on two column tiles ends top packed with zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_upDownUpColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 12, 4]));
      let directions: string[] = [DIR_UP, DIR_DOWN, DIR_UP];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2500
     * @tc.name sequenceRightUpRight2500
     * @tc.desc Verify right up right collects two tiles into the right column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_rightUpRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 10, 4]));
      let directions: string[] = [DIR_RIGHT, DIR_UP, DIR_RIGHT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.dataNumbers[7]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2600
     * @tc.name sequenceUpLeftDown2600
     * @tc.desc Verify up left down carries two tiles from the first column to the last row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_upLeftDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([4, 2, 3, 4]));
      let directions: string[] = [DIR_UP, DIR_LEFT, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[12]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2700
     * @tc.name sequenceDownRightUp2700
     * @tc.desc Verify down right up lifts the bottom pair back to the top right corner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_downRightUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([8, 2, 1, 8]));
      let directions: string[] = [DIR_DOWN, DIR_RIGHT, DIR_UP];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2800
     * @tc.name sequenceSingleColumnUpDown2800
     * @tc.desc Verify up up down down returns two column tiles to the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_singleColumnUpDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([4, 2, 8, 8]));
      let directions: string[] = [DIR_UP, DIR_UP, DIR_DOWN, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_2900
     * @tc.name sequenceTwoColumnsUpDown2900
     * @tc.desc Verify two columns moved up and down independently keep their own tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_twoColumnsUpDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([4, 2, 10, 8]));
      let moves: number[] = [0, 2, 0, 2];
      let directions: string[] = [DIR_UP, DIR_UP, DIR_DOWN, DIR_DOWN];
      for (let step: number = 0; step < moves.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(directions[step], moves[step]);
        BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, moves[step]), expectedLine(before, moves[step], directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[12]).assertEqual(2);
      expect(rule.dataNumbers[14]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3000
     * @tc.name sequenceTwoColumnsMergeAccumulate3000
     * @tc.desc Verify two column merges accumulate four and then twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_twoColumnsMergeAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2, 2, 8, 6, 8]));
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), expectedLine(before, 0, DIR_UP));
      let score: number = lineMergeScore(before, 0, DIR_UP);
      expect(rule.score).assertEqual(score);
      before = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), expectedLine(before, 2, DIR_UP));
      score = score + lineMergeScore(before, 2, DIR_UP);
      expect(rule.score).assertEqual(score);
      expect(score).assertEqual(20);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3100
     * @tc.name sequenceMixedFourLines3100
     * @tc.desc Verify four lines moved in four different directions stay isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_mixedFourLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 6, 4, 9, 8, 11, 16]));
      let moves: number[] = [0, 2, 1, 3];
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < moves.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        rule.moveInRow(directions[step], moves[step]);
        let isRow: boolean = directions[step] === DIR_LEFT || directions[step] === DIR_RIGHT;
        let actual: number[] = isRow ? BoardKit.rowOf(rule.dataNumbers, moves[step]) :
          BoardKit.columnOf(rule.dataNumbers, moves[step]);
        BoardKit.expectValues(actual, expectedLine(before, moves[step], directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[6]).assertEqual(4);
      expect(rule.dataNumbers[10]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3200
     * @tc.name sequenceReverseThenMergeAgain3200
     * @tc.desc Verify reversing a merged full row allows the second pair to merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_reverseThenMergeAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 2, 2, 3, 2]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_RIGHT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_RIGHT));
      expect(rule.score).assertEqual(16);
      expect(rule.dataNumbers[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3300
     * @tc.name sequencePureSlideNoScore3300
     * @tc.desc Verify a slide only sequence never adds score in either direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_pureSlideNoScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 4, 3, 8]));
      let before: number[] = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_LEFT));
      before = BoardKit.valuesOf(rule);
      applyLineMove(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, DIR_UP));
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3400
     * @tc.name sequenceThreeStepTileSet3400
     * @tc.desc Verify a slide merge slide sequence ends with one doubled tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_threeStepTileSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([5, 2, 6, 2, 9, 4]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_LEFT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(8);
      BoardKit.expectTileSet(rule.dataNumbers, [0, 2, 4, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3500
     * @tc.name sequenceLengthAfterThreeSteps3500
     * @tc.desc Verify the board stays sixteen cells long after every sequence step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_lengthAfterThreeSteps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 5, 4]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT];
      for (let step: number = 0; step < directions.length; step++) {
        applyLineMove(rule, directions[step]);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
      expect(BoardKit.sum(rule.dataNumbers) === 8).assertTrue();
      expect(cellAt(rule.dataNumbers, CELLS)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3600
     * @tc.name sequenceOccupancyAfterSequence3600
     * @tc.desc Verify occupancy after each step equals the oracle occupancy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_occupancyAfterSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 8, 4, 9, 4]));
      let directions: string[] = [DIR_LEFT, DIR_UP];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        let expected: number[] = BoardOracle.move(before, directions[step]);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(BoardKit.countNonZero(expected));
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3700
     * @tc.name sequenceSumPreserved3700
     * @tc.desc Verify every step of a merge sequence preserves the tile sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_sumPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 8, 4, 9, 4]));
      let total: number = BoardKit.sum(rule.dataNumbers);
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT];
      for (let step: number = 0; step < directions.length; step++) {
        applyLineMove(rule, directions[step]);
        expect(BoardKit.sum(rule.dataNumbers)).assertEqual(total);
      }
      expect(total).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3800
     * @tc.name sequenceStatusUnchanged3800
     * @tc.desc Verify moveInRow sequences never change the game status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_statusUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 5, 4]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        applyLineMove(rule, directions[step]);
        expect(rule.status).assertEqual(GameStatus.BEFORE);
      }
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.status === GameStatus.OVER).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_3900
     * @tc.name sequenceScoreMatchesOracleTotal3900
     * @tc.desc Verify the score after each step equals the independent oracle total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_scoreMatchesOracleTotal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 2, 4, 4, 4, 5, 4]));
      let total: number = 0;
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_UP];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        total = total + BoardOracle.mergeScore(before, directions[step]);
        expect(rule.score).assertEqual(total);
      }
      expect(rule.score).assertEqual(36);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_4000
     * @tc.name sequenceNoSpawnAfterSequence4000
     * @tc.desc Verify a moveInRow sequence leaves no extra tile anywhere
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_noSpawnAfterSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 4, 2, 9, 4, 13, 8]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        let expected: number[] = BoardOracle.move(before, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, expected);
        expect(BoardKit.zeroPositions(rule.dataNumbers).length)
          .assertEqual(BoardKit.zeroPositions(expected).length);
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_4100
     * @tc.name sequenceFinalBoardSixteen4100
     * @tc.desc Verify a four step sequence keeps sixteen cells holding legal tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_finalBoardSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 3, 2, 5, 4, 10, 4]));
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectTileSet(rule.dataNumbers, [0, 2, 4, 8, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESEQUENCE_4200
     * @tc.name sequenceShiftOnlyKeepsZeroScore4200
     * @tc.desc Verify a three step shuttle of distinct tiles scores nothing and keeps the sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('sequence_shiftOnlyKeepsZeroScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 4, 3, 8]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_LEFT];
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
      }
      expect(rule.score).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(14);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(0);
    });
  });
}

/** Applies one movement to all four lines without the spawn and terminal steps. */
function applyLineMove(rule: GameRule, direction: string): void {
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
}

/**
 * Returns the oracle result of one line in storage order, i.e. the order used by
 * rowOf and columnOf. Right and down are reversed because the oracle works in
 * movement order.
 */
function expectedLine(before: number[], lineIndex: number, direction: string): number[] {
  let merged: number[] = BoardOracle.mergeLine(BoardOracle.readLine(before, lineIndex, direction));
  if (direction === DIR_RIGHT || direction === DIR_DOWN) {
    let flipped: number[] = [];
    for (let offset: number = SIDE - 1; offset >= 0; offset--) {
      flipped.push(merged[offset]);
    }
    return flipped;
  }
  return merged;
}

/** Returns the score a single line contributes for the given direction. */
function lineMergeScore(before: number[], lineIndex: number, direction: string): number {
  return BoardOracle.mergeScoreOfLine(BoardOracle.readLine(before, lineIndex, direction));
}

/** Reads one cell, returning undefined when the index is past the board end. */
function cellAt(values: number[], index: number): number | undefined {
  return values[index];
}

/**
 * Builds a board from flat index value pairs, e.g. [0, 2, 5, 4] sets cells
 * zero and five. Keeps the fixtures readable while staying explicit.
 */
function placedBoard(pairs: number[]): number[] {
  let board: number[] = BoardKit.blank();
  for (let index: number = 0; index < pairs.length; index = index + 2) {
    board[pairs[index]] = pairs[index + 1];
  }
  return board;
}
