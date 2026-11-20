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
import {
  BoardKit,
  CELLS,
  SIDE,
  DIR_LEFT,
  DIR_RIGHT,
  DIR_UP,
  DIR_DOWN
} from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/**
 * GameRule 跨 API 组合场景测试套件。
 *
 * 本套件不复刻单个 API 的边界值，只覆盖“构造 → 移动 / 行移动 → 计分 →
 * 终局判定 → 重开”的连接处：确定性行移动用独立 oracle 核对棋盘与分数，
 * 整盘移动额外核对“恰好补一块 2 或 4”，预置盘面则对移动结果、分数、终局
 * 三元同时断言。所有盘面固定 16 格，避免对非法长度调用移动。
 */
export default function gameRuleComprehensiveTest() {
  describe('gameRuleComprehensiveTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleComprehensiveTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleComprehensiveTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0100
     * @tc.name comprehensiveChainFourDirections0100
     * @tc.desc Verify one board survives left, up, right and down sweeps with growing score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_chainFourDirections', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 4, 4],
        [0, 2, 0, 2],
        [8, 8, 8, 8],
        [4, 0, 0, 4]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let afterLeft: number[] = BoardOracle.move(values, DIR_LEFT);
      applySweep(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, afterLeft);
      expect(rule.score).assertEqual(56);
      let afterUp: number[] = BoardOracle.move(afterLeft, DIR_UP);
      applySweep(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, afterUp);
      expect(rule.score).assertEqual(64);
      let afterRight: number[] = BoardOracle.move(afterUp, DIR_RIGHT);
      applySweep(rule, DIR_RIGHT);
      BoardKit.expectValues(rule.dataNumbers, afterRight);
      expect(rule.score).assertEqual(112);
      let afterDown: number[] = BoardOracle.move(afterRight, DIR_DOWN);
      applySweep(rule, DIR_DOWN);
      BoardKit.expectValues(rule.dataNumbers, afterDown);
      expect(rule.score).assertEqual(112);
      expect(rule.isGameOver()).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0200
     * @tc.name comprehensiveLeftSweepMatchesOracle0200
     * @tc.desc Verify a left sweep merges three rows and scores thirty six points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_leftSweepMatchesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 0, 2, 4],
        [8, 8, 0, 16],
        [4, 4, 4, 4],
        [0, 0, 0, 8]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 36, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(7);
      let text: string = BoardKit.describe(rule.dataNumbers);
      let lines: string[] = text.split('/');
      expect(text).assertContain('/');
      expect(lines.length).assertEqual(SIDE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0300
     * @tc.name comprehensiveUpSweepMatchesOracle0300
     * @tc.desc Verify an up sweep merges three columns and scores thirty six points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_upSweepMatchesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 0, 4, 0],
        [2, 8, 4, 0],
        [0, 8, 4, 0],
        [4, 0, 4, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(before, rule, DIR_UP, 36, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(16);
      expect(rule.dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0400
     * @tc.name comprehensiveTwoSweepsAccumulateScore0400
     * @tc.desc Verify a left sweep then an up sweep add eight and eight points in turn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_twoSweepsAccumulateScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [2, 2, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let beforeLeft: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(beforeLeft, DIR_LEFT));
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      let beforeUp: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(beforeUp, DIR_UP));
      expect(rule.score).assertEqual(16);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0500
     * @tc.name comprehensiveTerminalBoardSweepsAreNoOps0500
     * @tc.desc Verify sweeps on a dead full board change nothing and keep the verdict
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_terminalBoardSweepsAreNoOps', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let beforeLeft: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(beforeLeft, rule, DIR_LEFT, 0, true);
      let beforeUp: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(beforeUp, rule, DIR_UP, 0, true);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0600
     * @tc.name comprehensiveMoveLeftSpawnsOneTile0600
     * @tc.desc Verify a left move merges a pair, scores four and adds one tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveLeftSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0700
     * @tc.name comprehensiveMoveRightSpawnsOneTile0700
     * @tc.desc Verify a right move merges the right edge pair and scores eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveRightSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 4, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_RIGHT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
      expect(rule.score).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0800
     * @tc.name comprehensiveMoveUpSpawnsOneTile0800
     * @tc.desc Verify an up move merges a column pair and scores four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveUpSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_UP);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      expect(rule.score).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers) >= 6).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_0900
     * @tc.name comprehensiveMoveDownSpawnsOneTile0900
     * @tc.desc Verify a down move merges a column pair and scores sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveDownSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 8, 0, 8]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_DOWN);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
      expect(rule.score).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1000
     * @tc.name comprehensiveMoveWithoutChangeSpawnsNothing1000
     * @tc.desc Verify a packed row left move adds no tile and no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveWithoutChangeSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(firstMismatch(rule.dataNumbers, before)).assertNull();
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1100
     * @tc.name comprehensiveMoveOnBlankBoardSpawnsNothing1100
     * @tc.desc Verify a blank board cannot move and therefore cannot spawn a tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveOnBlankBoardSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1200
     * @tc.name comprehensiveFullBoardMergeSpawnsIntoHole1200
     * @tc.desc Verify a merge on a full board frees one cell and the spawn refills it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_fullBoardMergeSpawnsIntoHole', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.horizontalPairBoard());
      let before: number[] = BoardKit.valuesOf(rule);
      expect(BoardKit.countNonZero(before)).assertEqual(CELLS);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1300
     * @tc.name comprehensiveSpawnedTileIsTwoOrFour1300
     * @tc.desc Verify the refill tile is a power of two named two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_spawnedTileIsTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([4, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let hole: number = BoardKit.singleDifference(expected, rule.dataNumbers);
      expect(hole >= 0).assertTrue();
      let kind: string | undefined = spawnKind(rule.dataNumbers[hole]);
      expect(kind === undefined).assertFalse();
      expect(kind === 'two' || kind === 'four').assertTrue();
      let legal: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        let tile: number = rule.dataNumbers[index];
        if (tile !== 0 && !BoardOracle.isPowerOfTwo(tile)) {
          legal = false;
        }
      }
      expect(legal).assertTrue();
      expect(rule.score).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1400
     * @tc.name comprehensiveMoveKeepsBoardLength1400
     * @tc.desc Verify a move keeps exactly four addressable lines of four cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_moveKeepsBoardLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([8, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(lineOfBoard(rule.dataNumbers, SIDE)).assertUndefined();
      expect(lineOfBoard(rule.dataNumbers, 0) === undefined).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.score).assertEqual(16);
      expect(BoardKit.singleDifference(BoardOracle.move(before, DIR_LEFT), rule.dataNumbers) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1500
     * @tc.name comprehensiveTwoStageMergeKeepsGameAlive1500
     * @tc.desc Verify merging two of four pair rows raises the score while the game stays live
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_twoStageMergeKeepsGameAlive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [8, 8, 0, 0],
        [16, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      BoardKit.expectGameOver(rule, false);
      rule.moveInRow(DIR_LEFT, 1);
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[4]).assertEqual(8);
      BoardKit.expectGameOver(rule, false);
      rule.moveInRow(DIR_LEFT, 2);
      expect(rule.score).assertEqual(28);
      expect(rule.dataNumbers[8]).assertEqual(16);
      BoardKit.expectGameOver(rule, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1600
     * @tc.name comprehensiveMergeChainDropsOccupancy1600
     * @tc.desc Verify five merges remove five occupied cells and preserve the tile sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_mergeChainDropsOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 4, 4, 0],
        [8, 8, 8, 8],
        [0, 0, 16, 16]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      expect(BoardKit.countNonZero(before)).assertEqual(10);
      applySweep(rule, DIR_LEFT);
      expect(rule.score).assertEqual(76);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 5, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(before));
      BoardKit.expectGameOver(rule, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1700
     * @tc.name comprehensiveMergeScoresExactTotal1700
     * @tc.desc Verify a mixed sweep scores one hundred fifty six points in one step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_mergeScoresExactTotal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 2, 0],
        [4, 4, 8, 8],
        [16, 16, 16, 16],
        [0, 0, 32, 32]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 156, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(7);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1800
     * @tc.name comprehensiveMergeThenMoveKeepsPlayable1800
     * @tc.desc Verify a deterministic merge followed by a spawn move leaves the board playable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_mergeThenMoveKeepsPlayable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [4, 2, 4, 2],
        [2, 4, 8, 4],
        [16, 16, 4, 8],
        [4, 2, 8, 2]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 2);
      expect(rule.score).assertEqual(32);
      expect(rule.dataNumbers[8]).assertEqual(32);
      expect(rule.dataNumbers[11]).assertEqual(0);
      BoardKit.expectGameOver(rule, false);
      let beforeMove: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_RIGHT);
      BoardKit.expectChangedMove(beforeMove, rule.dataNumbers, DIR_RIGHT);
      expect(rule.score).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      BoardKit.expectGameOver(rule, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_1900
     * @tc.name comprehensiveMergeToTerminalVerdict1900
     * @tc.desc Verify an up move that completes the last merge turns the status OVER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_mergeToTerminalVerdict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(upTerminalBoard());
      expect(rule.isGameOver()).assertFalse();
      rule.move(DIR_UP);
      expect(rule.score).assertEqual(16);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2000
     * @tc.name comprehensiveInitThenTerminalMoveSetsOver2000
     * @tc.desc Verify init followed by a prepared terminal board reaches OVER and restarts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_initThenTerminalMoveSetsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      rule.dataNumbers = upTerminalBoard();
      rule.move(DIR_UP);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.score).assertEqual(16);
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2100
     * @tc.name comprehensiveInitThenScoreRestartsEachRound2100
     * @tc.desc Verify two init rounds each begin scoring at zero before their own merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_initThenScoreRestartsEachRound', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let round: number = 0; round < 2; round++) {
        rule.init();
        expect(rule.score).assertEqual(0);
        rule.dataNumbers = BoardKit.row([8, 8, 0, 0]);
        rule.moveInRow(DIR_LEFT, 0);
        expect(rule.score).assertEqual(16);
        expect(rule.dataNumbers[0]).assertEqual(16);
        expect(rule.status).assertEqual(GameStatus.RUNNING);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2200
     * @tc.name comprehensiveInitThenMovesKeepRunning2200
     * @tc.desc Verify four gestures after init can never reach a full board or OVER status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_initThenMovesKeepRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let step: number = 0; step < directions.length; step++) {
        rule.move(directions[step]);
        expect(rule.status).assertEqual(GameStatus.RUNNING);
        expect(rule.isGameOver()).assertFalse();
        expect(BoardKit.countNonZero(rule.dataNumbers) < CELLS).assertTrue();
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2300
     * @tc.name comprehensiveFullBoardMergeRefillsHole2300
     * @tc.desc Verify the merge frees exactly one cell and the spawn occupies that cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_fullBoardMergeRefillsHole', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 2, 4],
        [16, 16, 4, 8],
        [2, 4, 2, 4],
        [4, 2, 4, 2]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      expect(BoardKit.countNonZero(before)).assertEqual(CELLS);
      rule.move(DIR_RIGHT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
      expect(rule.score).assertEqual(32);
      expect(rule.dataNumbers[5]).assertEqual(32);
      expect(rule.dataNumbers[4] === 0).assertFalse();
      expect(rule.dataNumbers[4] === 2 || rule.dataNumbers[4] === 4).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2400
     * @tc.name comprehensiveTwoHolesOneSpawn2400
     * @tc.desc Verify two simultaneous merges free two cells but only one spawn lands
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_twoHolesOneSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 2, 4],
        [16, 16, 4, 2],
        [2, 4, 2, 4],
        [32, 32, 4, 2]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      expect(BoardKit.countNonZero(before)).assertEqual(CELLS);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(96);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2500
     * @tc.name comprehensiveVerticalMergeRefillsHole2500
     * @tc.desc Verify an up move on a full column merges sixteen plus sixteen and refills
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_verticalMergeRefillsHole', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.verticalPairBoard());
      let before: number[] = BoardKit.valuesOf(rule);
      expect(BoardKit.countNonZero(before)).assertEqual(CELLS);
      rule.move(DIR_UP);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
      expect(rule.score).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[8]).assertEqual(32);
      expect(rule.dataNumbers[12] === 0).assertFalse();
      expect(rule.dataNumbers[12] === 2 || rule.dataNumbers[12] === 4).assertTrue();
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2600
     * @tc.name comprehensiveLargeTileRowMergeScores2600
     * @tc.desc Verify two large pairs merge into 2048 and 4096 for 6144 points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_largeTileRowMergeScores', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([1024, 1024, 2048, 2048]);
      let rule: GameRule = BoardKit.rule(values);
      rule.moveInRow(DIR_LEFT, 0);
      expect(rule.score).assertEqual(6144);
      expect(rule.dataNumbers[0]).assertEqual(2048);
      expect(rule.dataNumbers[1]).assertEqual(4096);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(0);
      expect(rule.score > 4096).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2700
     * @tc.name comprehensiveLargeTileMoveScoresSpawn2700
     * @tc.desc Verify a 4096 pair move scores 8192 and still spawns one small tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_largeTileMoveScoresSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 4096;
      values[1] = 4096;
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(8192);
      expect(rule.dataNumbers[0]).assertEqual(8192);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardOracle.isPowerOfTwo(8192)).assertTrue();
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2800
     * @tc.name comprehensiveLargeTileTerminalVerdict2800
     * @tc.desc Verify a 4096 and 8192 checkerboard is dead and rejects every sweep
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_largeTileTerminalVerdict', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [];
      for (let row: number = 0; row < SIDE; row++) {
        for (let column: number = 0; column < SIDE; column++) {
          values.push((row + column) % 2 === 0 ? 4096 : 8192);
        }
      }
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectGameOver(rule, true);
      applySweep(rule, DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(BoardKit.sum(before));
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_2900
     * @tc.name comprehensivePresetLeftSingleMerge2900
     * @tc.desc Verify one pair in an empty row merges left into a single four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetLeftSingleMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 4, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(4);
      BoardKit.logBoard('presetLeftSingleMerge', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3000
     * @tc.name comprehensivePresetRepeatedRowChain3000
     * @tc.desc Verify a repeated double pair row scores twelve per row for forty eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetRepeatedRowChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 48, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [4, 8, 0, 0]);
      BoardKit.logBoard('presetRepeatedRowChain', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3100
     * @tc.name comprehensivePresetSparseDiagonals3100
     * @tc.desc Verify four sparse tiles slide left with one merge for four points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetSparseDiagonals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [0, 0, 2, 2],
        [0, 4, 0, 0],
        [8, 0, 0, 0],
        [0, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 4, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3200
     * @tc.name comprehensivePresetAllTwosRow3200
     * @tc.desc Verify four equal tiles collapse into two fours for eight points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetAllTwosRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 8, false);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [4, 4, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3300
     * @tc.name comprehensivePresetFullBoardOneMerge3300
     * @tc.desc Verify the only merge on a full checkerboard opens one cell and scores sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetFullBoardOneMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.horizontalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_LEFT);
      expectSweep(before, rule, DIR_LEFT, 16, false);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
      expect(rule.dataNumbers[15]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3400
     * @tc.name comprehensivePresetRightEdgeMerge3400
     * @tc.desc Verify a pair at the right edge merges rightwards into eight points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetRightEdgeMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 0, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_RIGHT);
      expectSweep(before, rule, DIR_RIGHT, 8, false);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3500
     * @tc.name comprehensivePresetRightShiftOnly3500
     * @tc.desc Verify sparse tiles slide right without merging and score nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetRightShiftOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_RIGHT);
      expectSweep(before, rule, DIR_RIGHT, 0, false);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3600
     * @tc.name comprehensivePresetRightPairMove3600
     * @tc.desc Verify a left packed pair travels right and merges next to a fixed tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetRightPairMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 8]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_RIGHT);
      expectSweep(before, rule, DIR_RIGHT, 4, false);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3700
     * @tc.name comprehensivePresetRightDoubleChain3700
     * @tc.desc Verify two pairs per row merge rightwards into eight and sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetRightDoubleChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([4, 4, 8, 8]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_RIGHT);
      expectSweep(before, rule, DIR_RIGHT, 96, false);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 8, 16]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3800
     * @tc.name comprehensivePresetRightLeavesVerticalPair3800
     * @tc.desc Verify a horizontal no-op sweep keeps a full vertical pair board alive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetRightLeavesVerticalPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.verticalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_RIGHT);
      expectSweep(before, rule, DIR_RIGHT, 0, false);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.dataNumbers[8]).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_3900
     * @tc.name comprehensivePresetUpSingleMerge3900
     * @tc.desc Verify a top column pair merges upwards into a single four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetUpSingleMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(before, rule, DIR_UP, 4, false);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4000
     * @tc.name comprehensivePresetUpBottomPair4000
     * @tc.desc Verify a bottom column pair climbs to the top and scores sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetUpBottomPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 0, 8, 8]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(before, rule, DIR_UP, 16, false);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4100
     * @tc.name comprehensivePresetUpTwoColumnChain4100
     * @tc.desc Verify a doubled column merges twice upwards for twelve points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetUpTwoColumnChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 0, 0, 0],
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(before, rule, DIR_UP, 12, false);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4200
     * @tc.name comprehensivePresetUpOnDeadBoard4200
     * @tc.desc Verify an up sweep on the checkerboard changes nothing and stays dead
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetUpOnDeadBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(before, rule, DIR_UP, 0, true);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4300
     * @tc.name comprehensivePresetUpAllTwosColumn4300
     * @tc.desc Verify four equal tiles in a column collapse upwards into two fours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetUpAllTwosColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_UP);
      expectSweep(before, rule, DIR_UP, 8, false);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4400
     * @tc.name comprehensivePresetDownEdgeMerge4400
     * @tc.desc Verify two separated column tiles merge downwards into eight at the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetDownEdgeMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 4, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_DOWN);
      expectSweep(before, rule, DIR_DOWN, 8, false);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4500
     * @tc.name comprehensivePresetDownShiftOnly4500
     * @tc.desc Verify two separated tiles drop to the bottom without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetDownShiftOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_DOWN);
      expectSweep(before, rule, DIR_DOWN, 0, false);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4600
     * @tc.name comprehensivePresetDownAllTwosColumn4600
     * @tc.desc Verify four equal tiles fall downwards into two fours at the bottom
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetDownAllTwosColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.column([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_DOWN);
      expectSweep(before, rule, DIR_DOWN, 8, false);
      expect(rule.dataNumbers[8]).assertEqual(4);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4700
     * @tc.name comprehensivePresetDownSparseColumns4700
     * @tc.desc Verify one column merges down while a stacked column stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetDownSparseColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 0, 8, 0],
        [4, 0, 0, 0],
        [2, 0, 8, 0],
        [4, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_DOWN);
      expectSweep(before, rule, DIR_DOWN, 16, false);
      expect(rule.dataNumbers[14]).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4800
     * @tc.name comprehensivePresetDownVerticalPair4800
     * @tc.desc Verify a bottom column pair merges downwards inside a full board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_presetDownVerticalPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.verticalPairBoard();
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      applySweep(rule, DIR_DOWN);
      expectSweep(before, rule, DIR_DOWN, 32, false);
      expect(rule.dataNumbers[12]).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_4900
     * @tc.name comprehensiveRestartCompletesTwoGames4900
     * @tc.desc Verify two restarts each finish a prepared game and reach OVER at score sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_restartCompletesTwoGames', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = leftTerminalBoard();
      rule.move(DIR_LEFT);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.score).assertEqual(16);
      expect(rule.isGameOver()).assertTrue();
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      rule.dataNumbers = upTerminalBoard();
      rule.move(DIR_UP);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.score).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_5000
     * @tc.name comprehensiveRestartRestoresPlayAfterOver5000
     * @tc.desc Verify a restarted rule can merge again and returns to a playing status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_restartRestoresPlayAfterOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.dataNumbers = leftTerminalBoard();
      rule.move(DIR_LEFT);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      rule.init();
      expect(rule.score).assertEqual(0);
      rule.dataNumbers = BoardKit.row([2, 2, 0, 0]);
      rule.move(DIR_LEFT);
      expect(rule.score).assertEqual(4);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.isGameOver()).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_5100
     * @tc.name comprehensiveShiftOnlyMoveSpawnsOne5100
     * @tc.desc Verify a shift without any merge still spawns one tile and scores nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_shiftOnlyMoveSpawnsOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECOMPREHENSIVE_5200
     * @tc.name comprehensiveSpawnValueExplainsSumGrowth5200
     * @tc.desc Verify the board sum grows by exactly the spawned tile after a scoring move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('comprehensive_spawnValueExplainsSumGrowth', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([8, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      let beforeSum: number = BoardKit.sum(before);
      rule.move(DIR_LEFT);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let hole: number = BoardKit.singleDifference(expected, rule.dataNumbers);
      expect(hole >= 0).assertTrue();
      let spawned: number = rule.dataNumbers[hole];
      expect(spawned === 2 || spawned === 4).assertTrue();
      expect(rule.score).assertEqual(16);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(beforeSum + spawned);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });
  });
}

/** Applies one line movement to every line of a sixteen cell board. */
function applySweep(rule: GameRule, direction: string): void {
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
}

/**
 * Asserts the three linked results of a deterministic whole-board sweep:
 * the board equals the oracle, the score equals the expected gain and the
 * game-over verdict holds. The tile sum must also survive the sweep.
 */
function expectSweep(before: number[], rule: GameRule, direction: string, expectedScore: number,
  expectedOver: boolean): void {
  BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(before, direction));
  expect(rule.score).assertEqual(expectedScore);
  BoardKit.expectGameOver(rule, expectedOver);
  BoardKit.expectSumPreserved(before, rule.dataNumbers);
}

/**
 * A full board whose only merge sits in the third row. A left move merges the
 * two eights, the spawn refills the freed cell and the final board has no
 * adjacent equal pair, so the status turns OVER deterministically.
 */
function leftTerminalBoard(): number[] {
  return BoardKit.rows([
    [4, 2, 8, 16],
    [2, 4, 16, 8],
    [8, 8, 32, 64],
    [4, 2, 16, 8]
  ]);
}

/**
 * The left terminal board rotated a quarter turn, so the only merge is the
 * first column pair. An up move merges it and ends the game deterministically.
 */
function upTerminalBoard(): number[] {
  return BoardKit.rows([
    [4, 8, 2, 4],
    [2, 8, 4, 2],
    [16, 32, 16, 8],
    [8, 64, 8, 16]
  ]);
}

/** Returns the first index whose cell differs, or null when the boards match. */
function firstMismatch(actual: number[], expected: number[]): number | null {
  for (let index: number = 0; index < actual.length; index++) {
    if (actual[index] !== expected[index]) {
      return index;
    }
  }
  return null;
}

/** Returns one board line, or undefined when the index is outside the square. */
function lineOfBoard(values: number[], lineIndex: number): number[] | undefined {
  if (lineIndex < 0 || lineIndex >= SIDE) {
    return undefined;
  }
  let line: number[] = [];
  for (let column: number = 0; column < SIDE; column++) {
    line.push(values[lineIndex * SIDE + column]);
  }
  return line;
}

/** Names a spawned tile; any value the spawner cannot produce maps to undefined. */
function spawnKind(value: number): string | undefined {
  if (value === 2) {
    return 'two';
  }
  if (value === 4) {
    return 'four';
  }
  return undefined;
}
