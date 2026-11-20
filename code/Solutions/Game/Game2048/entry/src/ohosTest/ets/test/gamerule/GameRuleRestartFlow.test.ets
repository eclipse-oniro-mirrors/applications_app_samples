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
 * GameRule 重开流程测试套件。
 *
 * 单次 init() 的内部细节由 GameRuleInit 套件覆盖；本套件只关心“重开”这条
 * 跨操作链路：先通过移动、合并、手动改盘、置终局等方法把局面推到各种状态，
 * 再调用 init()，验证棋盘、分数、状态三个字段是否被彻底复位，以及多次重开
 * 之间是否互不残留。所有会调用移动的用例都保证棋盘长度为 16 格。
 */
export default function gameRuleRestartFlowTest() {
  describe('gameRuleRestartFlowTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleRestartFlowTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleRestartFlowTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0100
     * @tc.name restartFlowInitAfterRowPlayClearsPlayedRow0100
     * @tc.desc Verify init wipes a merged top row back to the two fresh tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterRowPlayClearsPlayedRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([32, 32, 64, 64]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(192);
      expect(rule.dataNumbers[0]).assertEqual(64);
      expect(rule.dataNumbers[1]).assertEqual(128);
      BoardKit.log('initAfterRowPlay', 'played row ' + BoardKit.describe(rule.dataNumbers));
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(findTile(rule.dataNumbers, 64)).assertNull();
      expect(findTile(rule.dataNumbers, 128)).assertNull();
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0200
     * @tc.name restartFlowInitAfterColumnPlayClearsPlayedColumn0200
     * @tc.desc Verify a merged first column disappears completely after init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterColumnPlayClearsPlayedColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([4, 4, 8, 8]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_UP, 0);
      expect(rule.score).assertEqual(24);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(16);
      rule.init();
      expect(findTile(rule.dataNumbers, 8)).assertNull();
      expect(findTile(rule.dataNumbers, 16)).assertNull();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0300
     * @tc.name restartFlowInitAfterFullRowSweepResetsOccupancy0300
     * @tc.desc Verify eight occupied cells collapse to exactly two after init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterFullRowSweepResetsOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      applyLineMoves(rule, DIR_LEFT);
      expect(rule.score).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      let text: string = BoardKit.describe(rule.dataNumbers);
      let lines: string[] = text.split('/');
      expect(text).assertContain('/');
      expect(lines.length).assertEqual(SIDE);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0400
     * @tc.name restartFlowInitAfterRepeatedMovesRestoresTwoTiles0400
     * @tc.desc Verify a board played for many gestures still restarts with two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterRepeatedMovesRestoresTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      for (let step: number = 0; step < 8; step++) {
        rule.move(DIR_RIGHT);
        rule.move(DIR_DOWN);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
      let played: number = BoardKit.countNonZero(rule.dataNumbers);
      BoardKit.log('initAfterRepeatedMoves', 'occupied after play ' + played);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0500
     * @tc.name restartFlowInitAfterLongGameRestoresTwoTiles0500
     * @tc.desc Verify twelve alternating gestures leave a restartable sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterLongGameRestoresTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      for (let step: number = 0; step < 12; step++) {
        if (step % 2 === 0) {
          rule.move(DIR_LEFT);
        } else {
          rule.move(DIR_UP);
        }
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0600
     * @tc.name restartFlowInitAfterLargeScoreResetsToZero0600
     * @tc.desc Verify a sixteen thousand point round restarts at a zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterLargeScoreResetsToZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([1024, 1024, 1024, 1024]);
      let rule: GameRule = BoardKit.rule(values);
      applyLineMoves(rule, DIR_LEFT);
      expect(rule.score).assertEqual(16384);
      expect(rule.score > 16000).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.score > 0).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0700
     * @tc.name restartFlowInitAfterScoreAcrossRoundsResetsToZero0700
     * @tc.desc Verify score gathered in two separate rows does not survive init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterScoreAcrossRoundsResetsToZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      rule.dataNumbers[4] = 4;
      rule.dataNumbers[5] = 4;
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.score).assertEqual(12);
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.score === 12).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0800
     * @tc.name restartFlowInitAfterMixedRowMergesResetsScore0800
     * @tc.desc Verify a two hundred forty point multi-row round restarts at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterMixedRowMergesResetsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [8, 8, 0, 0],
        [16, 16, 0, 0],
        [32, 32, 0, 0],
        [64, 64, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      applyLineMoves(rule, DIR_LEFT);
      expect(rule.score).assertEqual(240);
      BoardKit.logBoard('initAfterMixedRowMerges', rule.dataNumbers);
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_0900
     * @tc.name restartFlowInitAfterForcedOverStatusReturnsRunning0900
     * @tc.desc Verify an OVER status assigned by hand returns to RUNNING after init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterForcedOverStatusReturnsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 512;
      rule.status = GameStatus.OVER;
      expect(rule.status).assertEqual(0);
      rule.init();
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      expect(rule.status).assertEqual(1);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1000
     * @tc.name restartFlowInitAfterTerminalMoveReturnsRunning1000
     * @tc.desc Verify a move that ends the game can be undone by init back to RUNNING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterTerminalMoveReturnsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(terminalLeftBoard());
      expect(rule.isGameOver()).assertFalse();
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(16);
      expect(rule.status === GameStatus.OVER).assertTrue();
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      rule.init();
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1100
     * @tc.name restartFlowInitAfterOverBoardStatusReturnsRunning1100
     * @tc.desc Verify a full board with a pending merge carrying OVER status restarts fresh
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterOverBoardStatusReturnsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.horizontalPairBoard());
      rule.status = GameStatus.OVER;
      expect(rule.isGameOver()).assertFalse();
      rule.init();
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      expect(findTile(rule.dataNumbers, 8)).assertNull();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1200
     * @tc.name restartFlowInitTwiceFromOverStatusStaysRunning1200
     * @tc.desc Verify two forced OVER rounds both restart into RUNNING status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initTwiceFromOverStatusStaysRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let round: number = 0; round < 2; round++) {
        rule.score = 777;
        rule.status = GameStatus.OVER;
        expect(rule.status).assertEqual(0);
        rule.init();
        expect(rule.status).assertEqual(1);
        expect(rule.score).assertEqual(0);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1300
     * @tc.name restartFlowInitAfterFullBoardLeavesTwoTiles1300
     * @tc.desc Verify a sixteen tile board restarts with exactly two spawnable tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterFullBoardLeavesTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      let total: number = BoardKit.sum(rule.dataNumbers);
      expect(total >= 4).assertTrue();
      expect(total <= 8).assertTrue();
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1400
     * @tc.name restartFlowInitAfterFullBoardDropsLargeTiles1400
     * @tc.desc Verify no tile of eight or more survives a restart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterFullBoardDropsLargeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(1024);
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(16384);
      rule.init();
      expect(countAtLeast(rule.dataNumbers, 8)).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1500
     * @tc.name restartFlowInitAfterFullBoardRestoresFourteenZeros1500
     * @tc.desc Verify a full board restarts with fourteen zero cells and two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterFullBoardRestoresFourteenZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      BoardKit.expectNoZero(rule.dataNumbers);
      rule.init();
      let zeros: number[] = BoardKit.zeroPositions(rule.dataNumbers);
      expect(zeros.length).assertEqual(14);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(zeros.length === CELLS).assertFalse();
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1600
     * @tc.name restartFlowThreeInitMoveCyclesStayIndependent1600
     * @tc.desc Verify three init-move-init cycles each leave an independent fresh board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_threeInitMoveCyclesStayIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let round: number = 0; round < 3; round++) {
        rule.init();
        let spawned: number[] = rule.dataNumbers.slice();
        expect(BoardKit.countNonZero(spawned)).assertEqual(2);
        rule.move(DIR_LEFT);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
        expect(BoardKit.countNonZero(rule.dataNumbers) >= 2).assertTrue();
      }
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1700
     * @tc.name restartFlowThreeInitMoveCyclesRestartScore1700
     * @tc.desc Verify each cycle starts scoring from zero instead of adding to the last round
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_threeInitMoveCyclesRestartScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let pairs: number[] = [2, 4, 8];
      for (let round: number = 0; round < 3; round++) {
        rule.init();
        expect(rule.score).assertEqual(0);
        let pair: number = pairs[round];
        rule.dataNumbers = BoardKit.row([pair, pair, 0, 0]);
        rule.moveInRow(DIR_LEFT, 0);
        expect(rule.score).assertEqual(pair * 2);
      }
      rule.init();
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1800
     * @tc.name restartFlowThreeInitCyclesKeepBoundedSum1800
     * @tc.desc Verify every restart spawns two tiles worth two or four and never accumulates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_threeInitCyclesKeepBoundedSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let round: number = 0; round < 3; round++) {
        rule.init();
        let total: number = BoardKit.sum(rule.dataNumbers);
        BoardKit.log('initCycleSum', 'round ' + round + ' total ' + total);
        expect(total >= 4).assertTrue();
        expect(total <= 8).assertTrue();
        expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_1900
     * @tc.name restartFlowFiveInitCyclesKeepLengthSixteen1900
     * @tc.desc Verify five consecutive restarts always rebuild a sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_fiveInitCyclesKeepLengthSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      for (let round: number = 0; round < 5; round++) {
        rule.init();
        expect(rule.dataNumbers.length).assertEqual(CELLS);
        expect(rule.dataNumbers.length === SIDE * SIDE).assertTrue();
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2000
     * @tc.name restartFlowInitRemovesKnownCornerTiles2000
     * @tc.desc Verify four corner tiles of increasing size vanish after init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initRemovesKnownCornerTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 8;
      values[3] = 16;
      values[12] = 32;
      values[15] = 64;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      rule.init();
      expect(findTile(rule.dataNumbers, 8)).assertNull();
      expect(findTile(rule.dataNumbers, 16)).assertNull();
      expect(findTile(rule.dataNumbers, 32)).assertNull();
      expect(findTile(rule.dataNumbers, 64)).assertNull();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2100
     * @tc.name restartFlowInitClearsEntireLastRow2100
     * @tc.desc Verify a populated bottom row keeps at most two fresh tiles after init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initClearsEntireLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.withRow(BoardKit.blank(), 3, [2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(BoardKit.rowOf(rule.dataNumbers, 3))).assertEqual(4);
      rule.init();
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(0);
      let bottom: number = BoardKit.countNonZero(BoardKit.rowOf(rule.dataNumbers, 3));
      expect(bottom <= 2).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2200
     * @tc.name restartFlowInitClearsSingleLargeTile2200
     * @tc.desc Verify a lone tail corner tile is not carried into the restarted board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initClearsSingleLargeTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[15] = 1024;
      let rule: GameRule = BoardKit.rule(values);
      rule.init();
      expect(findTile(rule.dataNumbers, 1024)).assertNull();
      expect(tileLabel(1024)).assertUndefined();
      expect(tileLabel(2)).assertEqual('two');
      expect(tileLabel(4)).assertEqual('four');
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2300
     * @tc.name restartFlowInitClearsAdjacentPair2300
     * @tc.desc Verify a mergeable pair present before init produces no merge score on reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initClearsAdjacentPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.score).assertEqual(0);
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.sum(rule.dataNumbers) <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2400
     * @tc.name restartFlowInitThenFirstMergeScoresFromZero2400
     * @tc.desc Verify the first merge after a restart reports only its own value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initThenFirstMergeScoresFromZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = BoardKit.row([4, 4, 0, 0]);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(8);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.score === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2500
     * @tc.name restartFlowInitThenTwoMergesAccumulateFromZero2500
     * @tc.desc Verify two merges after a restart add up from zero to twenty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initThenTwoMergesAccumulateFromZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = BoardKit.rows([
        [2, 2, 0, 0],
        [8, 8, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.score).assertEqual(20);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2600
     * @tc.name restartFlowInitDropsPriorMergeScore2600
     * @tc.desc Verify a large first round score is absent when the next merge is scored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initDropsPriorMergeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2048, 2048, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      applyLineMoves(rule, DIR_LEFT);
      expect(rule.score).assertEqual(16384);
      rule.init();
      expect(rule.score).assertEqual(0);
      rule.dataNumbers = BoardKit.row([2, 2, 0, 0]);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.score === 16388).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2700
     * @tc.name restartFlowInitFromShortRuleSetsSixteenCells2700
     * @tc.desc Verify init rebuilds sixteen cells even from a five cell rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initFromShortRuleSetsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.zeros(5));
      expect(rule.dataNumbers.length).assertEqual(5);
      expect(rule.dataNumbers.length === CELLS).assertFalse();
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2800
     * @tc.name restartFlowInitFromLongRuleTrimsToSixteenCells2800
     * @tc.desc Verify init discards surplus cells and keeps the canonical sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initFromLongRuleTrimsToSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.zeros(20));
      expect(rule.dataNumbers.length).assertEqual(20);
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(countAtLeast(rule.dataNumbers, 8)).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_2900
     * @tc.name restartFlowSixInitsKeepLengthSixteen2900
     * @tc.desc Verify six back to back restarts never change the board shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_sixInitsKeepLengthSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      for (let round: number = 0; round < 6; round++) {
        rule.init();
        expect(rule.dataNumbers.length).assertEqual(CELLS);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
        expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3000
     * @tc.name restartFlowInitMoveInRowAlternatingTenRounds3000
     * @tc.desc Verify ten init and line-move rounds each match the oracle for that line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initMoveInRowAlternatingTenRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let round: number = 0; round < 10; round++) {
        rule.init();
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
        let before: number[] = rule.dataNumbers.slice();
        let lineIndex: number = round % SIDE;
        rule.moveInRow(DIR_LEFT, lineIndex);
        BoardKit.expectValues(rule.dataNumbers, expectedLineMove(before, lineIndex, DIR_LEFT));
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3100
     * @tc.name restartFlowTenRoundsKeepTwoTileOccupancy3100
     * @tc.desc Verify every one of ten restarts leaves exactly two occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_tenRoundsKeepTwoTileOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let round: number = 0; round < 10; round++) {
        rule.init();
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
        let total: number = BoardKit.sum(rule.dataNumbers);
        expect(total >= 4).assertTrue();
        expect(total <= 8).assertTrue();
        rule.moveInRow(DIR_LEFT, round % SIDE);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3200
     * @tc.name restartFlowTenRoundsKeepSmallTileValues3200
     * @tc.desc Verify ten restarts never leave a tile outside empty, two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_tenRoundsKeepSmallTileValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.horizontalPairBoard());
      let allowed: number[] = [0, 2, 4];
      for (let round: number = 0; round < 10; round++) {
        rule.init();
        BoardKit.expectTileSet(rule.dataNumbers, allowed);
        expect(countAtLeast(rule.dataNumbers, 8)).assertEqual(0);
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3300
     * @tc.name restartFlowTenRoundsScoreZeroAtEachInit3300
     * @tc.desc Verify a scored round followed by init always restarts the score at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_tenRoundsScoreZeroAtEachInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let pairs: number[] = [2, 4, 8, 16];
      for (let round: number = 0; round < 10; round++) {
        rule.init();
        expect(rule.score).assertEqual(0);
        let pair: number = pairs[round % 4];
        rule.dataNumbers = BoardKit.row([pair, pair, 0, 0]);
        rule.moveInRow(DIR_LEFT, 0);
        expect(rule.score).assertEqual(pair * 2);
        expect(rule.score > 0).assertTrue();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3400
     * @tc.name restartFlowEightInitsAlwaysTwoTiles3400
     * @tc.desc Verify eight consecutive inits produce two tiles on every single call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_eightInitsAlwaysTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 2, 2]));
      let counts: number[] = [];
      for (let round: number = 0; round < 8; round++) {
        rule.init();
        counts.push(BoardKit.countNonZero(rule.dataNumbers));
      }
      expect(counts.length).assertEqual(8);
      for (let index: number = 0; index < counts.length; index++) {
        expect(counts[index]).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3500
     * @tc.name restartFlowEightInitsUseOnlyTwoOrFour3500
     * @tc.desc Verify eight restarts spawn only the two legal opening values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_eightInitsUseOnlyTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let allowed: number[] = [0, 2, 4];
      for (let round: number = 0; round < 8; round++) {
        rule.init();
        BoardKit.expectTileSet(rule.dataNumbers, allowed);
        expect(BoardKit.sum(rule.dataNumbers) <= 8).assertTrue();
        expect(findTile(rule.dataNumbers, 8)).assertNull();
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3600
     * @tc.name restartFlowInitAfterMoveKeepsTwoTiles3600
     * @tc.desc Verify a restart after whole-board moves still yields two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterMoveKeepsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.move(DIR_LEFT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      rule.move(DIR_UP);
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3700
     * @tc.name restartFlowInitAfterMergeKeepsTwoTiles3700
     * @tc.desc Verify a scored merge does not increase the two tile opening count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterMergeKeepsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = BoardKit.row([16, 16, 0, 0]);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0] <= 4).assertTrue();
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3800
     * @tc.name restartFlowInitThenNonTerminalMoveKeepsRunning3800
     * @tc.desc Verify a move after init keeps RUNNING while empty cells remain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initThenNonTerminalMoveKeepsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = BoardKit.row([2, 2, 0, 0]);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      expect(rule.isGameOver()).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length >= 13).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_3900
     * @tc.name restartFlowInitThenTerminalMoveSetsOver3900
     * @tc.desc Verify init hands over a RUNNING status that a terminal move can flip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initThenTerminalMoveSetsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      rule.dataNumbers = terminalLeftBoard();
      rule.move(DIR_LEFT);
      expect(rule.status === GameStatus.OVER).assertTrue();
      expect(rule.status).assertEqual(0);
      expect(rule.score).assertEqual(16);
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_4000
     * @tc.name restartFlowInitThenUnchangedMoveKeepsRunning4000
     * @tc.desc Verify a move that cannot change a full board leaves the fresh RUNNING status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initThenUnchangedMoveKeepsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = BoardKit.overBoard();
      let before: number[] = rule.dataNumbers.slice();
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.isGameOver()).assertTrue();
      expect(rule.status === GameStatus.RUNNING).assertTrue();
      expect(rule.score).assertEqual(0);
      rule.init();
      expect(rule.status === GameStatus.RUNNING).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_4100
     * @tc.name restartFlowInitAfterTerminalRoundPlaysAgain4100
     * @tc.desc Verify the rule scores again from zero after a game ended and restarted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initAfterTerminalRoundPlaysAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = terminalLeftBoard();
      rule.move(DIR_LEFT);
      expect(rule.status).assertEqual(GameStatus.OVER);
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      rule.dataNumbers = BoardKit.row([8, 8, 0, 0]);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(16);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERESTARTFLOW_4200
     * @tc.name restartFlowInitIgnoresPresetScoreField4200
     * @tc.desc Verify a score written into the public field is cleared by init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('restartFlow_initIgnoresPresetScoreField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      rule.score = 4096;
      expect(rule.score).assertEqual(4096);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });
  });
}

/** Applies one line movement to every line of a sixteen cell board. */
function applyLineMoves(rule: GameRule, direction: string): void {
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
}

/** Builds the board expected after moving one line, using the independent oracle. */
function expectedLineMove(before: number[], lineIndex: number, direction: string): number[] {
  let expected: number[] = before.slice();
  let line: number[] = BoardOracle.readLine(before, lineIndex, direction);
  let merged: number[] = BoardOracle.mergeLine(line);
  BoardOracle.writeLine(expected, lineIndex, direction, merged);
  return expected;
}

/**
 * A full board whose only merge sits in the third row. Moving left merges the
 * two eights, the spawn lands in the single freed cell and the resulting full
 * board has no adjacent equal pair, so the status deterministically turns OVER.
 */
function terminalLeftBoard(): number[] {
  return BoardKit.rows([
    [4, 2, 8, 16],
    [2, 4, 16, 8],
    [8, 8, 32, 64],
    [4, 2, 16, 8]
  ]);
}

/** Returns the index of a tile with the requested value, or null when absent. */
function findTile(values: number[], target: number): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return null;
}

/** Maps a tile value to a label; values init never creates map to undefined. */
function tileLabel(value: number): string | undefined {
  if (value === 0) {
    return 'empty';
  }
  if (value === 2) {
    return 'two';
  }
  if (value === 4) {
    return 'four';
  }
  return undefined;
}

/** Counts the cells whose value reaches the given threshold. */
function countAtLeast(values: number[], threshold: number): number {
  let count: number = 0;
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] >= threshold) {
      count = count + 1;
    }
  }
  return count;
}
