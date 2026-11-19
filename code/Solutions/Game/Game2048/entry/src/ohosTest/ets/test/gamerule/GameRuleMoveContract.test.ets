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
import { BoardOracle } from '../common/BoardOracle';
import { BoardKit, CELLS, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';

/**
 * GameRule.move 通用契约测试套件。
 *
 * 本套件只覆盖「调用形态」层面的契约：返回值、盘长、四个合法方向、非法方向
 * 的惰性、状态字段的迁移边界、分值累积、以及「变化才补块、补块至多一块」。
 * 具体的合并布局由四个方向套件负责，这里一律通过 BoardOracle 做基线比对，
 * 不重复断言某一行的最终排列。
 */
export default function gameRuleMoveContractTest() {
  describe('gameRuleMoveContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveContractTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveContractTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0100
     * @tc.name moveReturnsUndefined0100
     * @tc.desc Verify move reports no value so callers must read the board field instead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_returnsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let outcome: string = typeof rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_returnsUndefined', rule.dataNumbers);
      expect(outcome).assertEqual('undefined');
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0200
     * @tc.name moveLeftKeepsSixteenCells0200
     * @tc.desc Verify a left move keeps the board array exactly sixteen cells long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_leftKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_leftKeepsSixteenCells', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.dataNumbers[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0300
     * @tc.name moveRightKeepsSixteenCells0300
     * @tc.desc Verify a right move keeps sixteen cells and parks tiles at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_rightKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      BoardKit.logBoard('moveContract_rightKeepsSixteenCells', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0400
     * @tc.name moveUpKeepsSixteenCells0400
     * @tc.desc Verify an up move keeps sixteen cells and parks a tile on the top row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_upKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([0, 0, 8, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.logBoard('moveContract_upKeepsSixteenCells', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[0]).assertEqual(8);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0500
     * @tc.name moveDownKeepsSixteenCells0500
     * @tc.desc Verify a down move keeps sixteen cells and parks a tile on the bottom row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_downKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([8, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.logBoard('moveContract_downKeepsSixteenCells', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0600
     * @tc.name moveUppercaseDirectionLeavesBoard0600
     * @tc.desc Verify direction literals are case sensitive so an uppercase word is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_uppercaseDirectionLeavesBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move('LEFT');
      BoardKit.logBoard('moveContract_uppercaseDirectionLeavesBoard', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('|');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0700
     * @tc.name moveEmptyDirectionLeavesBoard0700
     * @tc.desc Verify an empty direction string is ignored and never spawns a tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_emptyDirectionLeavesBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move('');
      BoardKit.logBoard('moveContract_emptyDirectionLeavesBoard', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0800
     * @tc.name moveUnknownWordLeavesBoard0800
     * @tc.desc Verify an unknown direction word cannot shift any tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_unknownWordLeavesBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([0, 0, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move('diagonal');
      BoardKit.logBoard('moveContract_unknownWordLeavesBoard', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_0900
     * @tc.name moveTrailingSpaceLeavesBoard0900
     * @tc.desc Verify a direction with a trailing space is not treated as a legal literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_trailingSpaceLeavesBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move('left ');
      BoardKit.logBoard('moveContract_trailingSpaceLeavesBoard', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1000
     * @tc.name moveInvalidDirectionKeepsScore1000
     * @tc.desc Verify an ignored direction leaves a previously earned score untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_invalidDirectionKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 128;
      rule.move('UP');
      BoardKit.logBoard('moveContract_invalidDirectionKeepsScore', rule.dataNumbers);
      BoardKit.expectScore(rule, 128);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.score !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1100
     * @tc.name moveInvalidDirectionKeepsStatus1100
     * @tc.desc Verify an ignored direction cannot rewrite the status field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_invalidDirectionKeepsStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.status = GameStatus.RUNNING;
      rule.move('Left');
      BoardKit.logBoard('moveContract_invalidDirectionKeepsStatus', rule.dataNumbers);
      BoardKit.expectStatus(rule, GameStatus.RUNNING);
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1200
     * @tc.name moveInvalidDirectionKeepsBoardContent1200
     * @tc.desc Verify an ignored direction leaves a fully occupied board byte for byte identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_invalidDirectionKeepsBoardContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move('none');
      BoardKit.logBoard('moveContract_invalidDirectionKeepsBoardContent', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(before));
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1300
     * @tc.name moveChangedBoardUsesAllowedTileSet1300
     * @tc.desc Verify a changed board only holds old values, doubled values or a spawned 2 or 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_changedBoardUsesAllowedTileSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let allowed: number[] = [0, 2, 4];
      for (let index: number = 0; index < CELLS; index++) {
        allowed.push(before[index]);
        allowed.push(before[index] * 2);
      }
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_changedBoardUsesAllowedTileSet', rule.dataNumbers);
      BoardKit.expectTileSet(rule.dataNumbers, allowed);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1400
     * @tc.name moveChangedBoardAddsAtMostOneTile1400
     * @tc.desc Verify a changed move raises the occupied count by at most one tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_changedBoardAddsAtMostOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 0, 2]);
      let occupancyBefore: number = BoardKit.countNonZero(before);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let occupancyAfter: number = BoardKit.countNonZero(rule.dataNumbers);
      BoardKit.logBoard('moveContract_changedBoardAddsAtMostOneTile', rule.dataNumbers);
      expect(occupancyAfter <= occupancyBefore + 1).assertTrue();
      expect(occupancyBefore).assertEqual(2);
      expect(occupancyAfter >= 1).assertTrue();
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1500
     * @tc.name moveSparseChangeNeverSetsRunning1500
     * @tc.desc Verify a sparse changed move never promotes a BEFORE rule to RUNNING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_sparseChangeNeverSetsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_sparseChangeNeverSetsRunning', rule.dataNumbers);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1600
     * @tc.name moveDenseChangeNeverSetsRunning1600
     * @tc.desc Verify a changed move on a dense board never sets the RUNNING status either
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_denseChangeNeverSetsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.horizontalPairBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_denseChangeNeverSetsRunning', rule.dataNumbers);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1700
     * @tc.name moveKeepsBeforeWhileGameContinues1700
     * @tc.desc Verify a changed move that leaves a playable board keeps the BEFORE status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_keepsBeforeWhileGameContinues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_keepsBeforeWhileGameContinues', rule.dataNumbers);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1800
     * @tc.name moveSetsOverWhenChangedBoardIsFull1800
     * @tc.desc Verify a changed move that fills the last cell marks the game over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_setsOverWhenChangedBoardIsFull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [0, 6, 10, 14],
        [10, 14, 18, 22],
        [14, 18, 22, 26],
        [18, 22, 26, 30]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_setsOverWhenChangedBoardIsFull', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectStatus(rule, GameStatus.OVER);
      expect(rule.status === 0).assertTrue();
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_1900
     * @tc.name moveOnOverBoardLeavesBefore1900
     * @tc.desc Verify an unchanged move never rewrites the status of a finished board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_onOverBoardLeavesBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_onOverBoardLeavesBefore', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2000
     * @tc.name moveWorksBeforeInit2000
     * @tc.desc Verify move is usable on a freshly constructed BEFORE rule without init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_worksBeforeInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      let signature: string = BoardKit.describe(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_worksBeforeInit', rule.dataNumbers);
      expect(BoardKit.describe(rule.dataNumbers) === signature).assertFalse();
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2100
     * @tc.name moveSlideKeepsScore2100
     * @tc.desc Verify a changed move that merges nothing leaves the score field unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_slideKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 64;
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_slideKeepsScore', rule.dataNumbers);
      BoardKit.expectScore(rule, 64);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score === 64).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2200
     * @tc.name moveMergeAddsMergeValueToScore2200
     * @tc.desc Verify one merge adds the merged tile value to the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_mergeAddsMergeValueToScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_mergeAddsMergeValueToScore', rule.dataNumbers);
      BoardKit.expectScore(rule, 4);
      expect(rule.score > 0).assertTrue();
      expect(rule.score !== 2).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2300
     * @tc.name moveTwoMergesAddBothValues2300
     * @tc.desc Verify two merges in one call add each merged value to the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_twoMergesAddBothValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_twoMergesAddBothValues', rule.dataNumbers);
      BoardKit.expectScore(rule, 12);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(8);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2400
     * @tc.name movePresetScoreAccumulates2400
     * @tc.desc Verify a merge adds to a score that already holds earlier points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_presetScoreAccumulates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 500;
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_presetScoreAccumulates', rule.dataNumbers);
      BoardKit.expectScore(rule, 504);
      expect(rule.score > 500).assertTrue();
      expect(rule.score - 500).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2500
     * @tc.name moveUnchangedBoardKeepsScore2500
     * @tc.desc Verify a move that changes nothing adds no score at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_unchangedBoardKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(before);
      rule.score = 300;
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_unchangedBoardKeepsScore', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 300);
      expect(rule.score).assertEqual(300);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2600
     * @tc.name moveUnchangedFullBoardSpawnsNothing2600
     * @tc.desc Verify a full board with no merge gets no random tile from move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_unchangedFullBoardSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_unchangedFullBoardSpawnsNothing', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2700
     * @tc.name moveUnchangedSparseBoardSpawnsNothing2700
     * @tc.desc Verify a tile already parked at the left edge triggers no spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_unchangedSparseBoardSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_unchangedSparseBoardSpawnsNothing', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2800
     * @tc.name moveUnchangedBoardKeepsLengthAndStatus2800
     * @tc.desc Verify an inert move keeps both the sixteen cell length and the BEFORE status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_unchangedBoardKeepsLengthAndStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.logBoard('moveContract_unchangedBoardKeepsLengthAndStatus', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.dataNumbers.length === CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_2900
     * @tc.name moveChangedSpawnsExactlyOneTile2900
     * @tc.desc Verify a changed move leaves the oracle result plus exactly one spawned tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_changedSpawnsExactlyOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 0, 2]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_changedSpawnsExactlyOneTile', rule.dataNumbers);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3000
     * @tc.name moveSpawnLandsOnOracleZero3000
     * @tc.desc Verify the spawned tile occupies a cell the reference model left empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_spawnLandsOnOracleZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.logBoard('moveContract_spawnLandsOnOracleZero', after);
      let spawn: number = BoardKit.singleDifference(expected, after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
      expect(after[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3100
     * @tc.name moveSpawnKeepsEveryOracleTile3100
     * @tc.desc Verify spawning never overwrites or alters a tile the oracle produced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_spawnKeepsEveryOracleTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let overwritten: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (expected[index] !== 0 && after[index] !== expected[index]) {
          overwritten = overwritten + 1;
        }
      }
      BoardKit.logBoard('moveContract_spawnKeepsEveryOracleTile', after);
      expect(overwritten).assertEqual(0);
      expect(BoardKit.positionsOf(after, 16).length).assertEqual(1);
      expect(after[0]).assertEqual(4);
      expect(after[1]).assertEqual(4);
      expect(after[8]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3200
     * @tc.name moveFullBoardChangeFillsFreedCell3200
     * @tc.desc Verify a changed full board frees exactly one cell and the spawn refills it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_fullBoardChangeFillsFreedCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.horizontalPairBoard();
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let emptyAfterMove: number = BoardKit.zeroPositions(expected).length;
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_fullBoardChangeFillsFreedCell', rule.dataNumbers);
      expect(emptyAfterMove).assertEqual(1);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3400
     * @tc.name moveTwoCallsKeepLength3400
     * @tc.desc Verify two consecutive moves each leave a sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_twoCallsKeepLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([0, 2, 4, 8]));
      rule.move(DIR_LEFT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_twoCallsKeepLength', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers) <= CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3500
     * @tc.name moveFourCallsKeepLength3500
     * @tc.desc Verify one move per direction leaves the board sixteen cells long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_fourCallsKeepLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.move(DIR_LEFT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      rule.move(DIR_UP);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      rule.move(DIR_RIGHT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      rule.move(DIR_DOWN);
      BoardKit.logBoard('moveContract_fourCallsKeepLength', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers) <= CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3600
     * @tc.name moveEightAlternatingCallsKeepLength3600
     * @tc.desc Verify a long alternating run never changes the board array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_eightAlternatingCallsKeepLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 4, 4]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN];
      let violations: number = 0;
      for (let step: number = 0; step < 8; step++) {
        rule.move(directions[step % 4]);
        if (rule.dataNumbers.length !== CELLS) {
          violations = violations + 1;
        }
      }
      BoardKit.logBoard('moveContract_eightAlternatingCallsKeepLength', rule.dataNumbers);
      expect(violations).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers) <= CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3700
     * @tc.name moveScoreNeverDecreasesAcrossCalls3700
     * @tc.desc Verify the score field is monotonic across a run of moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_scoreNeverDecreasesAcrossCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 4, 4]));
      let directions: string[] = [DIR_LEFT, DIR_DOWN, DIR_RIGHT, DIR_UP];
      let previous: number = rule.score;
      let drops: number = 0;
      for (let step: number = 0; step < 8; step++) {
        rule.move(directions[step % 4]);
        if (rule.score < previous) {
          drops = drops + 1;
        }
        previous = rule.score;
      }
      BoardKit.log('moveContract_scoreNeverDecreasesAcrossCalls', 'final score ' + rule.score);
      expect(drops).assertEqual(0);
      expect(rule.score >= 0).assertTrue();
      expect(rule.score > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3800
     * @tc.name moveInvalidAfterValidKeepsBoard3800
     * @tc.desc Verify an invalid direction after a valid move cannot roll the board back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_invalidAfterValidKeepsBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.move(DIR_LEFT);
      let settled: number[] = BoardKit.valuesOf(rule);
      let settledScore: number = rule.score;
      rule.move('sideways');
      BoardKit.logBoard('moveContract_invalidAfterValidKeepsBoard', rule.dataNumbers);
      BoardKit.expectValues(rule.dataNumbers, settled);
      BoardKit.expectScore(rule, settledScore);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_3900
     * @tc.name moveChangedBoardHasNoNegativeCell3900
     * @tc.desc Verify a changed move never produces a negative tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_changedBoardHasNoNegativeCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_changedBoardHasNoNegativeCell', rule.dataNumbers);
      let negativeCells: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] < 0) {
          negativeCells = negativeCells + 1;
        }
      }
      expect(negativeCells).assertEqual(0);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_4000
     * @tc.name moveSparseSingleTileSlides4000
     * @tc.desc Verify a lone tile slides to the target edge and gains no companion value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_sparseSingleTileSlides', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      BoardKit.logBoard('moveContract_sparseSingleTileSlides', rule.dataNumbers);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_4100
     * @tc.name moveOracleBaselineLeft4100
     * @tc.desc Verify a left move matches the independent reference model on a mixed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_oracleBaselineLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveContract_oracleBaselineLeft', rule.dataNumbers);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_4200
     * @tc.name moveOracleBaselineRight4200
     * @tc.desc Verify a right move matches the independent reference model on a mixed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_oracleBaselineRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      BoardKit.logBoard('moveContract_oracleBaselineRight', rule.dataNumbers);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_4300
     * @tc.name moveOracleBaselineUp4300
     * @tc.desc Verify an up move matches the independent reference model on a mixed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_oracleBaselineUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.logBoard('moveContract_oracleBaselineUp', rule.dataNumbers);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_4400
     * @tc.name moveOracleBaselineDown4400
     * @tc.desc Verify a down move matches the independent reference model on a mixed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_oracleBaselineDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [2, 2, 0, 4],
        [0, 2, 0, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.logBoard('moveContract_oracleBaselineDown', rule.dataNumbers);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVECONTRACT_4500
     * @tc.name moveAfterInitKeepsSixteenCells4500
     * @tc.desc Verify move stays compatible with a board produced by init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveContract_afterInitKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      BoardKit.expectStatus(rule, GameStatus.RUNNING);
      rule.move(DIR_LEFT);
      let occupancy: number = BoardKit.countNonZero(rule.dataNumbers);
      BoardKit.logBoard('moveContract_afterInitKeepsSixteenCells', rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(occupancy >= 2).assertTrue();
      expect(occupancy <= 3).assertTrue();
      expect(rule.status === GameStatus.BEFORE).assertFalse();
    });
  });
}
