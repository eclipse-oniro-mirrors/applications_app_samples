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
 * GameRule 长序列测试套件。
 *
 * 每一步都通过 moveInRow 驱动，因此序列完全确定：没有随机补块，status 不会被
 * 改写，score 只由合并累加。每条用例都逐步骤比对 BoardOracle 的棋盘与得分，
 * 并同时检查长度、和值与占用格，用较长的步数暴露累积性偏差。
 */
export default function gameRuleLongSequenceTest() {
  describe('gameRuleLongSequenceTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleLongSequenceTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleLongSequenceTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0100
     * @tc.name longSequenceRowMergeTo2048Ten0100
     * @tc.desc Verify ten alternating moves merge a 1024 pair and shuttle the 2048 tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_rowMergeTo2048Ten', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([1024, 1024, 0, 0]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 10);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(2048);
      expect(rule.score).assertEqual(2048);
      expect(rule.dataNumbers[3]).assertEqual(2048);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(String(rule.dataNumbers)).assertContain('2048');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0200
     * @tc.name longSequenceRowMergeTo4096Eight0200
     * @tc.desc Verify eight moves starting right merge a 2048 pair into 4096
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_rowMergeTo4096Eight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2048, 2048, 0, 0]));
      let directions: string[] = repeatedPattern([DIR_RIGHT, DIR_LEFT], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4096);
      expect(rule.dataNumbers[0]).assertEqual(4096);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4096);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0300
     * @tc.name longSequenceRowChainTo4096Twelve0300
     * @tc.desc Verify a 1024 pair plus a 2048 chain merges twice and scores 6144
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_rowChainTo4096Twelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([1024, 1024, 2048, 0]));
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT,
        DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(6144);
      expect(rule.dataNumbers[0]).assertEqual(4096);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0400
     * @tc.name longSequenceRow512ChainEight0400
     * @tc.desc Verify a 512 pair then a 1024 merge reaches 2048 in two steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row512ChainEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([512, 512, 1024, 0]));
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(3072);
      expect(rule.dataNumbers[0]).assertEqual(2048);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0500
     * @tc.name longSequenceRow2244Eight0500
     * @tc.desc Verify two pairs merge once each then shuttle as distinct tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row2244Eight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2, 2, 4, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(12);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0600
     * @tc.name longSequenceRow2048TripleTen0600
     * @tc.desc Verify three 2048 tiles merge into a 4096 plus a leftover 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row2048TripleTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2048, 2048, 2048, 0]));
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT,
        DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4096);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4096, 2048, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0700
     * @tc.name longSequenceRow4096PairEight0700
     * @tc.desc Verify an 8192 tile is produced from a 4096 pair and stays alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row4096PairEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([4096, 4096, 0, 0]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(8192);
      expect(rule.dataNumbers[3]).assertEqual(8192);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0800
     * @tc.name longSequenceRow2222Twelve0800
     * @tc.desc Verify four equal tiles merge twice into one 8 while the score reaches 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row2222Twelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2, 2, 2, 2]));
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT,
        DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(16);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_0900
     * @tc.name longSequenceRowGapPairEight0900
     * @tc.desc Verify a pair split by a zero merges after compaction and leaves 16 alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_rowGapPairEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([4, 0, 4, 16]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(8);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 8, 16]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1000
     * @tc.name longSequenceRow0248Shuttle1000
     * @tc.desc Verify distinct tiles shuttle between the two edges without any merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row0248Shuttle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([0, 2, 4, 8]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1100
     * @tc.name longSequenceRow2440Eight1100
     * @tc.desc Verify a 4 pair merges into 8 next to an isolated 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row2440Eight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([0, 2, 4, 4]));
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(8);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [2, 8, 0, 0]);
      expect(rule.score).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1200
     * @tc.name longSequenceRow2002Eight1200
     * @tc.desc Verify two edge tiles merge once and the resulting 4 shuttles alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row2002Eight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2, 0, 0, 2]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1300
     * @tc.name longSequenceRow1024MixTwelve1300
     * @tc.desc Verify a 1024 pair merges while a 512 tile keeps its value through shuttles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_row1024MixTwelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([1024, 1024, 512, 0]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 12);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(2048);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2048, 512]);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2560);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1400
     * @tc.name longSequenceColumnMergeTo2048Ten1400
     * @tc.desc Verify ten up down moves merge a column pair and park 2048 at the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_columnMergeTo2048Ten', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([1024, 1024, 0, 0]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 10);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(2048);
      expect(rule.dataNumbers[12]).assertEqual(2048);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 2048]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1500
     * @tc.name longSequenceColumnMergeTo4096Eight1500
     * @tc.desc Verify eight down up moves merge a 2048 pair into 4096 at the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_columnMergeTo4096Eight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([2048, 2048, 0, 0]));
      let directions: string[] = repeatedPattern([DIR_DOWN, DIR_UP], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4096);
      expect(rule.dataNumbers[0]).assertEqual(4096);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1600
     * @tc.name longSequenceColumn512ChainEight1600
     * @tc.desc Verify a 512 pair then a 1024 merge reaches 2048 upward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_column512ChainEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([512, 512, 1024, 0]));
      let directions: string[] = [DIR_UP, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(3072);
      expect(rule.dataNumbers[0]).assertEqual(2048);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1700
     * @tc.name longSequenceColumn24816Shuttle1700
     * @tc.desc Verify a full distinct column cannot move and scores nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_column24816Shuttle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([2, 4, 8, 16]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [2, 4, 8, 16]);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1800
     * @tc.name longSequenceColumn4488Eight1800
     * @tc.desc Verify a column 4 pair and 8 pair merge into 8 and 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_column4488Eight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([4, 4, 8, 8]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(24);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_1900
     * @tc.name longSequenceColumn0248Shuttle1900
     * @tc.desc Verify three distinct column tiles shuttle without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_column0248Shuttle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([0, 2, 4, 8]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2000
     * @tc.name longSequenceColumn2048TripleTen2000
     * @tc.desc Verify three 2048 tiles in one column yield a 4096 plus a 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_column2048TripleTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([2048, 2048, 2048, 0]));
      let directions: string[] = [DIR_UP, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4096);
      expect(rule.dataNumbers[0]).assertEqual(4096);
      expect(rule.dataNumbers[4]).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2100
     * @tc.name longSequenceColumn4096PairEight2100
     * @tc.desc Verify a column 4096 pair becomes an 8192 tile at the top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_column4096PairEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnBoard([4096, 4096, 0, 0]));
      let directions: string[] = repeatedPattern([DIR_DOWN, DIR_UP], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(8192);
      expect(rule.dataNumbers[0]).assertEqual(8192);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2200
     * @tc.name longSequenceFourRowsShuttleSixteen2200
     * @tc.desc Verify eight left right rounds return four identical rows to the start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourRowsShuttleSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(repeatedRowBoard([0, 2, 4, 8]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 2, 4, 8]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2300
     * @tc.name longSequenceFourRowsStaggerSixteen2300
     * @tc.desc Verify four staggered rows park at the right edge after sixteen steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourRowsStaggerSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 4, 4, 9, 8, 14, 16]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2400
     * @tc.name longSequenceFourRowsMergeFifteen2400
     * @tc.desc Verify eight row pairs merge in one step and the total score is sixty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourRowsMergeFifteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 4, 4, 5, 4, 8, 8, 9, 8, 12, 16, 13, 16]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 15);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(60);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [4, 8, 16, 32]);
      expect(rule.score).assertEqual(60);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2500
     * @tc.name longSequenceFourRowsMiddlePairSixteen2500
     * @tc.desc Verify four middle pairs merge once each and then shuttle right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourRowsMiddlePairSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([
        1, 2, 2, 2, 5, 2, 6, 2, 9, 2, 10, 2, 13, 2, 14, 2
      ]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(16);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2600
     * @tc.name longSequenceFourColumnsShuttleSixteen2600
     * @tc.desc Verify four full columns shuttle between top and bottom without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourColumnsShuttleSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(columnConstantBoard());
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2700
     * @tc.name longSequenceFourColumnsStaggerSixteen2700
     * @tc.desc Verify four staggered columns park at the bottom after sixteen steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourColumnsStaggerSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([4, 2, 1, 4, 10, 8, 7, 16]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[12]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(4);
      expect(rule.dataNumbers[14]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2800
     * @tc.name longSequenceFourColumnsMergeFifteen2800
     * @tc.desc Verify eight column pairs merge in one step and the total score is sixty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourColumnsMergeFifteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2, 1, 4, 5, 4, 2, 8, 6, 8, 3, 16, 7, 16]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 15);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(60);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 8, 16, 32]);
      expect(rule.score).assertEqual(60);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_2900
     * @tc.name longSequenceFourColumnsMergeSixteen2900
     * @tc.desc Verify the same column pairs merge and then park at the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourColumnsMergeSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2, 1, 4, 5, 4, 2, 8, 6, 8, 3, 16, 7, 16]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(60);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[13]).assertEqual(8);
      expect(rule.dataNumbers[14]).assertEqual(16);
      expect(rule.dataNumbers[15]).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3000
     * @tc.name longSequenceFourColumnsMiddlePairSixteen3000
     * @tc.desc Verify four vertical middle pairs merge once each and then settle down
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourColumnsMiddlePairSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([
        4, 2, 8, 2, 5, 2, 9, 2, 6, 2, 10, 2, 7, 2, 11, 2
      ]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[13]).assertEqual(4);
      expect(rule.dataNumbers[14]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3100
     * @tc.name longSequenceOrbitSingleSixteen3100
     * @tc.desc Verify one tile orbits the four corners and returns home after sixteen steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_orbitSingleSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([15, 2]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[15]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3200
     * @tc.name longSequenceOrbitPairSixteen3200
     * @tc.desc Verify two tiles keep their relative distance while orbiting for sixteen steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_orbitPairSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([3, 2, 12, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[11]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3300
     * @tc.name longSequenceOrbitTripleSixteen3300
     * @tc.desc Verify three distinct tiles orbit without merging and keep their sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_orbitTripleSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([3, 2, 12, 4, 9, 8]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[7]).assertEqual(2);
      expect(rule.dataNumbers[11]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3400
     * @tc.name longSequenceMergeAlternationEight3400
     * @tc.desc Verify one horizontal merge survives eight alternating direction steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_mergeAlternationEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 2, 6, 2]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_LEFT, DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_RIGHT, DIR_DOWN];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(2);
      expect(rule.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3500
     * @tc.name longSequenceMergeAlternationTwelve3500
     * @tc.desc Verify two vertical merges accumulate twelve during an orbit pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_mergeAlternationTwelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2, 8, 4, 12, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN], 12);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(12);
      expect(rule.dataNumbers[11]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3600
     * @tc.name longSequenceScatterSixteen3600
     * @tc.desc Verify a scattered pair merge and two orbits keep the board at two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_scatterSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2, 10, 4, 14, 4]));
      let directions: string[] = repeatedPattern([DIR_UP, DIR_LEFT, DIR_DOWN, DIR_RIGHT], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(12);
      expect(rule.dataNumbers[14]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3700
     * @tc.name longSequenceDiagonalOrbitSixteen3700
     * @tc.desc Verify two diagonal tiles never merge while cycling left and up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_diagonalOrbitSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 5, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP], 16);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(4);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3800
     * @tc.name longSequenceDiagonalMergeInterleave3800
     * @tc.desc Verify a vertical pair merges on the first up step of an interleave
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_diagonalMergeInterleave', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_3900
     * @tc.name longSequenceRightDownInterleave3900
     * @tc.desc Verify a row pair merges right and the new tile drops to the corner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_rightDownInterleave', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2]));
      let directions: string[] = repeatedPattern([DIR_RIGHT, DIR_DOWN], 8);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4000
     * @tc.name longSequenceLeftUpInterleaveTwelve4000
     * @tc.desc Verify two merges accumulate twelve across a twelve step interleave
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_leftUpInterleaveTwelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([3, 2, 7, 2, 11, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP], 12);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4100
     * @tc.name longSequenceTwoRowChainsTen4100
     * @tc.desc Verify a 2 chain and a 8 chain merged in parallel total seventy six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_twoRowChainsTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 2, 4, 4, 8, 5, 8, 6, 8, 7, 8]));
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT, DIR_RIGHT, DIR_LEFT];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(76);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(32);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(40);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4200
     * @tc.name longSequenceTwoColumnChainsTen4200
     * @tc.desc Verify the same two chains merged vertically also total seventy six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_twoColumnChainsTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 4, 2, 8, 4, 1, 8, 5, 8, 9, 8, 13, 8]));
      let directions: string[] = [DIR_UP, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP, DIR_DOWN, DIR_UP];
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(76);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(32);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(40);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4300
     * @tc.name longSequenceBigSumTwelve4300
     * @tc.desc Verify large tiles keep the total sum 3072 across twelve shuttle steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_bigSumTwelve', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([1024, 1024, 512, 512]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 12);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(3072);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2048, 1024]);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(3072);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4400
     * @tc.name longSequenceFourRowsThirty4400
     * @tc.desc Verify a thirty step three pattern sequence keeps four merged rows parked
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_fourRowsThirty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 2, 5, 4, 6, 4, 8, 8, 9, 8, 13, 16, 14, 16]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_LEFT, DIR_RIGHT], 30);
      let expectedScore: number = runLongSteps(rule, directions);
      expect(expectedScore).assertEqual(60);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[7]).assertEqual(8);
      expect(rule.dataNumbers[11]).assertEqual(16);
      expect(rule.dataNumbers[15]).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4500
     * @tc.name longSequenceThirtyStepOccupancy4500
     * @tc.desc Verify thirty shuttle steps keep occupancy, length and status fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_thirtyStepOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 4, 3, 8]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 30);
      let expectedScore: number = 0;
      let step: number = 0;
      while (step < directions.length) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
        expectedScore = expectedScore + BoardOracle.mergeScore(before, directions[step]);
        expect(rule.score).assertEqual(expectedScore);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
        expect(BoardKit.sum(rule.dataNumbers)).assertEqual(14);
        step = step + 1;
      }
      expect(expectedScore).assertEqual(0);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length === 1).assertTrue();
      expect(cellAt(rule.dataNumbers, CELLS)).assertUndefined();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4600
     * @tc.name longSequenceScoreChangesOnce4600
     * @tc.desc Verify a twelve step shuttle changes the score exactly once, by 2048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_scoreChangesOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([1024, 1024, 512, 0]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 12);
      let changes: number = 0;
      let previous: number = 0;
      let total: number = 0;
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
        total = total + BoardOracle.mergeScore(before, directions[step]);
        expect(rule.score).assertEqual(total);
        if (rule.score !== previous) {
          changes = changes + 1;
          previous = rule.score;
        }
      }
      expect(changes).assertEqual(1);
      expect(rule.score).assertEqual(2048);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4700
     * @tc.name longSequenceZerosGrowWithMerges4700
     * @tc.desc Verify empty cells grow by one per merge and stop at fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_zerosGrowWithMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([0, 2, 1, 2, 4, 2, 5, 2]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN], 16);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(12);
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        let expected: number[] = BoardOracle.move(before, directions[step]);
        expect(BoardKit.zeroPositions(rule.dataNumbers).length)
          .assertEqual(BoardKit.zeroPositions(expected).length);
      }
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.score).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4800
     * @tc.name longSequenceLargestTileGrowsOnce4800
     * @tc.desc Verify the largest tile doubles once from four to eight during eight steps
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_largestTileGrowsOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2, 2, 4, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      let largest: number = largestTile(rule.dataNumbers);
      let changes: number = 0;
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
        let current: number = largestTile(rule.dataNumbers);
        if (current !== largest) {
          expect(current).assertEqual(8);
          largest = current;
          changes = changes + 1;
        }
      }
      expect(changes).assertEqual(1);
      expect(largest).assertEqual(8);
      expect(rule.score).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_4900
     * @tc.name longSequenceTileSetHoldsEveryStep4900
     * @tc.desc Verify every step keeps only legal tiles and never introduces sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_tileSetHoldsEveryStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(rowBoard([2, 2, 4, 4]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 8);
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
        BoardKit.expectTileSet(rule.dataNumbers, [0, 2, 4, 8]);
        expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(0);
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_5000
     * @tc.name longSequenceStatusNeverRunning5000
     * @tc.desc Verify twenty shuttle steps never move the status out of BEFORE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_statusNeverRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(placedBoard([1, 2, 2, 4, 3, 8]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 20);
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
        expect(rule.status).assertEqual(GameStatus.BEFORE);
      }
      expect(rule.isGameOver()).assertFalse();
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.status === GameStatus.OVER).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULELONGSEQUENCE_5100
     * @tc.name longSequenceRoundTripCheckpoints5100
     * @tc.desc Verify sixteen left right steps alternate between the initial and parked boards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('longSequence_roundTripCheckpoints', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(repeatedRowBoard([0, 2, 4, 8]));
      let directions: string[] = repeatedPattern([DIR_LEFT, DIR_RIGHT], 16);
      let initial: number[] = BoardKit.valuesOf(rule);
      let parked: number[] = repeatedRowBoard([2, 4, 8, 0]);
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        applyLineMove(rule, directions[step]);
        BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
        if (step % 2 === 0) {
          BoardKit.expectValues(rule.dataNumbers, parked);
        } else {
          BoardKit.expectValues(rule.dataNumbers, initial);
        }
      }
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });
  });
}

/**
 * Runs every direction of a sequence, comparing the board with the oracle and
 * accumulating the oracle merge score step by step. Returns the final score.
 */
function runLongSteps(rule: GameRule, directions: string[]): number {
  let expectedScore: number = 0;
  let initialSum: number = BoardKit.sum(rule.dataNumbers);
  for (let step: number = 0; step < directions.length; step++) {
    let before: number[] = BoardKit.valuesOf(rule);
    applyLineMove(rule, directions[step]);
    BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, directions[step]));
    expectedScore = expectedScore + BoardOracle.mergeScore(before, directions[step]);
    expect(rule.score).assertEqual(expectedScore);
    expect(rule.dataNumbers.length).assertEqual(CELLS);
    expect(BoardKit.sum(rule.dataNumbers)).assertEqual(initialSum);
  }
  return expectedScore;
}

/** Applies one movement to all four lines without spawning or terminal checks. */
function applyLineMove(rule: GameRule, direction: string): void {
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
}

/** Expands a direction pattern to the requested number of steps. */
function repeatedPattern(pattern: string[], count: number): string[] {
  let directions: string[] = [];
  for (let index: number = 0; index < count; index++) {
    directions.push(pattern[index % pattern.length]);
  }
  return directions;
}

/** Builds a board whose first row is the supplied line and whose other rows are empty. */
function rowBoard(values: number[]): number[] {
  let board: number[] = BoardKit.blank();
  for (let column: number = 0; column < SIDE; column++) {
    board[column] = values[column];
  }
  return board;
}

/** Builds a board whose first column is the supplied line and whose other columns are empty. */
function columnBoard(values: number[]): number[] {
  let board: number[] = BoardKit.blank();
  for (let row: number = 0; row < SIDE; row++) {
    board[row * SIDE] = values[row];
  }
  return board;
}

/** Builds a board where all four rows equal the supplied line. */
function repeatedRowBoard(values: number[]): number[] {
  let board: number[] = [];
  for (let row: number = 0; row < SIDE; row++) {
    for (let column: number = 0; column < SIDE; column++) {
      board.push(values[column]);
    }
  }
  return board;
}

/**
 * Builds a board where the rows carry 0, 2, 4, 8 from top to bottom, so every
 * column reads [0, 2, 4, 8] and can shuttle between the two vertical edges.
 */
function columnConstantBoard(): number[] {
  let board: number[] = [];
  for (let row: number = 0; row < SIDE; row++) {
    let value: number = row === 0 ? 0 : (row === 1 ? 2 : (row === 2 ? 4 : 8));
    for (let column: number = 0; column < SIDE; column++) {
      board.push(value);
    }
  }
  return board;
}

/** Builds a board from flat index value pairs, e.g. [0, 2, 5, 4]. */
function placedBoard(pairs: number[]): number[] {
  let board: number[] = BoardKit.blank();
  for (let index: number = 0; index < pairs.length; index = index + 2) {
    board[pairs[index]] = pairs[index + 1];
  }
  return board;
}

/** Returns the largest tile value on the board, zero for an empty board. */
function largestTile(values: number[]): number {
  let largest: number = 0;
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] > largest) {
      largest = values[index];
    }
  }
  return largest;
}

/** Reads one cell, returning undefined when the index is past the board end. */
function cellAt(values: number[], index: number): number | undefined {
  return values[index];
}
