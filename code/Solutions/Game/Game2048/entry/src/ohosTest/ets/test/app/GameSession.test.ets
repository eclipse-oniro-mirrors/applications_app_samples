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

/** 套件名，与 describe 的第一个参数保持一致。 */
const SUITE_NAME: string = 'gameSessionTest';
/** 一盘会话的步数上限，用于长度恒定的循环检查。 */
const SESSION_TURNS: number = 10;

/**
 * 一条会话记录：一次单行 moveInRow 的方向、线号、前后分数，以及移动后
 * 整个盘面的占格数。记录在每次单行移动后立即落账，因此可以逐步回放。
 */
class SessionStep {
  direction: string;
  line: number;
  scoreBefore: number;
  scoreAfter: number;
  occupiedAfter: number;

  constructor(direction: string, line: number, scoreBefore: number, scoreAfter: number, occupiedAfter: number) {
    this.direction = direction;
    this.line = line;
    this.scoreBefore = scoreBefore;
    this.scoreAfter = scoreAfter;
    this.occupiedAfter = occupiedAfter;
  }

  /** 本步带来的分数增量。 */
  delta(): number {
    return this.scoreAfter - this.scoreBefore;
  }
}

/**
 * 一盘确定性会话。
 *
 * 生产 move() 在盘面变化后会调用 randomNum() 落一颗随机块，使整盘推演
 * 无法复现；本类只用 moveInRow() 走线，并把「落子」显式化，于是同一段
 * 脚本在真机上永远得到同一盘面与同一分数。
 */
class GameSessionRunner {
  rule: GameRule;
  steps: SessionStep[] = [];

  constructor(values: number[]) {
    this.rule = BoardKit.rule(values);
  }

  /** 装载一个已知盘面并进入 RUNNING，同时清空记录。 */
  load(values: number[]): void {
    this.rule.dataNumbers = values.slice();
    this.rule.score = 0;
    this.rule.status = GameStatus.RUNNING;
    this.steps = [];
  }

  /** 用生产 init() 开会话：两块随机起始块、分数归零、状态 RUNNING。 */
  start(): void {
    this.rule.init();
    this.steps = [];
  }

  /** 重开一盘会话。 */
  restart(): void {
    this.start();
  }

  /** 只推一条线，并记录这一步。 */
  lineStep(direction: string, line: number): number {
    let before: number = this.rule.score;
    this.rule.moveInRow(direction, line);
    let delta: number = this.rule.score - before;
    this.steps.push(new SessionStep(direction, line, before, this.rule.score,
      BoardKit.countNonZero(this.rule.dataNumbers)));
    return delta;
  }

  /** 推一个方向上的四条线，相当于一次不落子的整盘移动。 */
  turn(direction: string): number {
    let before: number = this.rule.score;
    for (let line: number = 0; line < SIDE; line++) {
      this.lineStep(direction, line);
    }
    return this.rule.score - before;
  }

  /** 显式落子：只有空格才接受，返回值表示这次落子是否成功。 */
  spawnAt(index: number, value: number): boolean {
    if (this.rule.dataNumbers[index] !== 0) {
      return false;
    }
    this.rule.dataNumbers[index] = value;
    return true;
  }

  /** 复刻 move() 的收尾：没有任何可走方向时把状态置为 OVER。 */
  terminal(): boolean {
    if (this.rule.isGameOver()) {
      this.rule.status = GameStatus.OVER;
      return true;
    }
    return false;
  }

  /** 页面手势守卫 status === 1 的等价判断。 */
  canPlay(): boolean {
    return this.rule.status === GameStatus.RUNNING;
  }

  /** 盘面最大块，用于刻画会话推进的里程碑。 */
  maxTile(): number {
    let max: number = 0;
    for (let index: number = 0; index < this.rule.dataNumbers.length; index++) {
      if (this.rule.dataNumbers[index] > max) {
        max = this.rule.dataNumbers[index];
      }
    }
    return max;
  }

  /** 当前占格数。 */
  occupied(): number {
    return BoardKit.countNonZero(this.rule.dataNumbers);
  }

  /** 第一条指定方向的记录，没有则返回 null。 */
  firstStepOrNull(direction: string): SessionStep | null {
    for (let index: number = 0; index < this.steps.length; index++) {
      if (this.steps[index].direction === direction) {
        return this.steps[index];
      }
    }
    return null;
  }
}

/** 开局的确定性盘面：第一行一对 2，其余全空。 */
function openingRunner(): GameSessionRunner {
  let runner: GameSessionRunner = new GameSessionRunner(BoardKit.row([2, 2, 0, 0]));
  runner.rule.score = 0;
  runner.rule.status = GameStatus.RUNNING;
  return runner;
}

/** 第 step 步左移之后显式落下的那一块，位置与数值都是固定的。 */
function playOpeningStep(runner: GameSessionRunner, step: number): void {
  let spawnCells: number[] = [1, 2, 2, 2, 2];
  let spawnValues: number[] = [2, 2, 4, 4, 4];
  runner.turn(DIR_LEFT);
  if (step < spawnCells.length) {
    runner.spawnAt(spawnCells[step], spawnValues[step]);
  }
}

/** 连续执行 turns 步开局脚本（最多六步）。 */
function playOpening(runner: GameSessionRunner, turns: number): void {
  for (let step: number = 0; step < turns; step++) {
    playOpeningStep(runner, step);
  }
}

/** 四向交替用的起始盘面：每一行都埋着可合并的对子。 */
function alternatingBoard(): number[] {
  return BoardKit.rows([
    [2, 2, 4, 4],
    [4, 4, 8, 8],
    [2, 2, 2, 2],
    [8, 8, 16, 16]
  ]);
}

/** 四向交替十步的方向序列。 */
function alternatingDirections(): string[] {
  return [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN, DIR_LEFT, DIR_UP];
}

/**
 * 一盘完整会话测试套件。
 *
 * 生产 move() 会落随机块，无法复现；本套件把一次会话拆成「单行移动 +
 * 显式落子」，于是「起始两块 → 逐步累积到 4/8/16 → 终局 → 重开」这条
 * 完整链路可以在设备上确定性回放，并对每一步的盘面与分数落断言。
 */
export default function gameSessionTest() {
  describe('gameSessionTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log(SUITE_NAME, 'suite begin');
    });

    afterAll(() => {
      BoardKit.log(SUITE_NAME, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0100
     * @tc.name gameSessionStartSpawnsTwoTiles0100
     * @tc.desc Verify a started session holds exactly two tiles on a sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_startSpawnsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.blank());
      runner.start();
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.dataNumbers.length).assertEqual(CELLS);
      expect(runner.rule.score).assertEqual(0);
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
      BoardKit.expectTileSet(runner.rule.dataNumbers, [0, 2, 4]);
      BoardKit.log(SUITE_NAME, 'two tiles at start');
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0200
     * @tc.name gameSessionStartSpawnValues0200
     * @tc.desc Verify the two starting tiles are worth two or four, never larger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_startSpawnValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.blank());
      runner.start();
      let values: number[] = runner.rule.dataNumbers;
      let small: number = BoardKit.positionsOf(values, 2).length + BoardKit.positionsOf(values, 4).length;
      let large: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (values[index] > 4) {
          large = large + 1;
        }
      }
      expect(small).assertEqual(2);
      expect(large).assertEqual(0);
      expect(BoardKit.sum(values) >= 4).assertTrue();
      expect(BoardKit.sum(values) <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0300
     * @tc.name gameSessionStartStatusRunning0300
     * @tc.desc Verify a started session accepts gestures through the status guard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_startStatusRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.blank());
      runner.start();
      expect(runner.rule.status).assertEqual(1);
      expect(runner.rule.status === GameStatus.RUNNING).assertTrue();
      expect(runner.rule.status === GameStatus.BEFORE).assertFalse();
      expect(runner.canPlay()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0400
     * @tc.name gameSessionStartZeroesScore0400
     * @tc.desc Verify a start discards a previously accumulated score and old records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_startZeroesScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      runner.rule.score = 512;
      runner.lineStep(DIR_LEFT, 0);
      expect(runner.steps.length).assertEqual(1);
      runner.start();
      expect(runner.rule.score).assertEqual(0);
      expect(runner.steps.length).assertEqual(0);
      expect(runner.occupied()).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0500
     * @tc.name gameSessionStartKeepsSixteenCells0500
     * @tc.desc Verify a started session keeps the fixed sixteen cell board shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_startKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.blank());
      runner.start();
      expect(runner.rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.rowOf(runner.rule.dataNumbers, 0).length).assertEqual(SIDE);
      expect(BoardKit.columnOf(runner.rule.dataNumbers, 0).length).assertEqual(SIDE);
      expect(BoardKit.sum(runner.rule.dataNumbers) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0600
     * @tc.name gameSessionStartTwiceKeepsTwoTiles0600
     * @tc.desc Verify starting twice does not accumulate tiles from the first start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_startTwiceKeepsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.blank());
      runner.start();
      let first: number[] = BoardKit.valuesOf(runner.rule);
      runner.start();
      expect(BoardKit.countNonZero(first)).assertEqual(2);
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.score).assertEqual(0);
      expect(runner.rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0700
     * @tc.name gameSessionRestartClearsRecords0700
     * @tc.desc Verify a restart drops the step records of the previous session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restartClearsRecords', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      runner.turn(DIR_LEFT);
      expect(runner.steps.length).assertEqual(SIDE);
      runner.restart();
      expect(runner.steps.length).assertEqual(0);
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
      expect(runner.canPlay()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0800
     * @tc.name gameSessionOpeningFirstTurn0800
     * @tc.desc Verify the first left turn merges the opening pair into a four at the left edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingFirstTurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 1);
      BoardKit.expectValues(runner.rule.dataNumbers, BoardKit.row([4, 2, 0, 0]));
      expect(runner.rule.score).assertEqual(4);
      expect(runner.maxTile()).assertEqual(4);
      expect(runner.occupied()).assertEqual(2);
      expect(runner.steps[0].delta()).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_0900
     * @tc.name gameSessionOpeningSecondTurn0900
     * @tc.desc Verify the second left turn compacts without merging and adds no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingSecondTurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 2);
      BoardKit.expectValues(runner.rule.dataNumbers, BoardKit.row([4, 2, 2, 0]));
      expect(runner.rule.score).assertEqual(4);
      expect(runner.steps[4].delta()).assertEqual(0);
      expect(runner.occupied()).assertEqual(3);
      expect(runner.maxTile()).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1000
     * @tc.name gameSessionOpeningThirdTurn1000
     * @tc.desc Verify the third left turn merges a fresh pair and lifts the score to eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingThirdTurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 3);
      BoardKit.expectValues(runner.rule.dataNumbers, BoardKit.row([4, 4, 4, 0]));
      expect(runner.rule.score).assertEqual(8);
      expect(runner.steps[8].delta()).assertEqual(4);
      expect(runner.occupied()).assertEqual(3);
      expect(BoardKit.positionsOf(runner.rule.dataNumbers, 4).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1100
     * @tc.name gameSessionOpeningFourthTurn1100
     * @tc.desc Verify the fourth turn produces the first eight tile and a score of sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingFourthTurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 4);
      BoardKit.expectValues(runner.rule.dataNumbers, BoardKit.row([8, 4, 4, 0]));
      expect(runner.rule.score).assertEqual(16);
      expect(runner.maxTile()).assertEqual(8);
      expect(BoardKit.positionsOf(runner.rule.dataNumbers, 8).length).assertEqual(1);
      expect(runner.steps[12].delta()).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1200
     * @tc.name gameSessionOpeningFifthTurn1200
     * @tc.desc Verify the fifth turn merges the pair of fours and keeps two eights apart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingFifthTurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 5);
      BoardKit.expectValues(runner.rule.dataNumbers, BoardKit.row([8, 8, 4, 0]));
      expect(runner.rule.score).assertEqual(24);
      expect(BoardKit.positionsOf(runner.rule.dataNumbers, 8).length).assertEqual(2);
      expect(runner.steps[16].delta()).assertEqual(8);
      expect(runner.occupied()).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1300
     * @tc.name gameSessionOpeningSixthTurn1300
     * @tc.desc Verify the sixth turn merges two eights into the first sixteen tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingSixthTurn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 6);
      BoardKit.expectValues(runner.rule.dataNumbers, BoardKit.row([16, 4, 0, 0]));
      expect(runner.rule.score).assertEqual(40);
      expect(runner.maxTile()).assertEqual(16);
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.dataNumbers).assertContain(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1400
     * @tc.name gameSessionOpeningScoreMatchesOracle1400
     * @tc.desc Verify every opening turn adds exactly the merge score of an independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingScoreMatchesOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      let expected: number = 0;
      let deltas: number[] = [];
      let spawnCells: number[] = [1, 2, 2, 2, 2];
      let spawnValues: number[] = [2, 2, 4, 4, 4];
      for (let step: number = 0; step < 6; step++) {
        let before: number[] = BoardKit.valuesOf(runner.rule);
        let oracleDelta: number = BoardOracle.mergeScore(before, DIR_LEFT);
        let actualDelta: number = runner.turn(DIR_LEFT);
        expect(actualDelta).assertEqual(oracleDelta);
        deltas.push(actualDelta);
        expected = expected + oracleDelta;
        if (step < 5) {
          expect(runner.spawnAt(spawnCells[step], spawnValues[step])).assertTrue();
        }
      }
      expect(expected).assertEqual(40);
      expect(runner.rule.score).assertEqual(expected);
      expect(deltas).assertContain(16);
      BoardKit.expectValues(deltas, [4, 0, 4, 8, 8, 16]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1500
     * @tc.name gameSessionOpeningMaxTileProgression1500
     * @tc.desc Verify the largest tile climbs through four, eight and sixteen during the opening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingMaxTileProgression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      let maxes: number[] = [];
      for (let step: number = 0; step < 6; step++) {
        playOpeningStep(runner, step);
        maxes.push(runner.maxTile());
      }
      BoardKit.expectValues(maxes, [4, 4, 4, 8, 8, 16]);
      expect(maxes[0]).assertEqual(4);
      expect(maxes[5]).assertEqual(16);
      expect(maxes[5] > maxes[0]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1600
     * @tc.name gameSessionOpeningOccupancyProgression1600
     * @tc.desc Verify the occupied count follows the spawn and merge beat of the opening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_openingOccupancyProgression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      let occupancies: number[] = [];
      for (let step: number = 0; step < 6; step++) {
        playOpeningStep(runner, step);
        occupancies.push(runner.occupied());
      }
      BoardKit.expectValues(occupancies, [2, 3, 3, 3, 3, 2]);
      expect(occupancies[1]).assertEqual(3);
      expect(occupancies[5]).assertEqual(2);
      expect(occupancies[5] < occupancies[1]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1700
     * @tc.name gameSessionAlternatingBoardFollowsOracle1700
     * @tc.desc Verify ten alternating turns reproduce the reference board move exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_alternatingBoardFollowsOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(alternatingBoard());
      runner.rule.status = GameStatus.RUNNING;
      let directions: string[] = alternatingDirections();
      for (let turn: number = 0; turn < SESSION_TURNS; turn++) {
        let before: number[] = BoardKit.valuesOf(runner.rule);
        runner.turn(directions[turn]);
        let expected: number[] = BoardOracle.move(before, directions[turn]);
        BoardKit.expectValues(runner.rule.dataNumbers, expected);
      }
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1800
     * @tc.name gameSessionAlternatingFinalBoard1800
     * @tc.desc Verify the exact board left after ten alternating turns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_alternatingFinalBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(alternatingBoard());
      runner.rule.status = GameStatus.RUNNING;
      let directions: string[] = alternatingDirections();
      for (let turn: number = 0; turn < SESSION_TURNS; turn++) {
        runner.turn(directions[turn]);
      }
      BoardKit.expectValues(runner.rule.dataNumbers, [8, 16, 0, 0, 4, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
      expect(runner.rule.dataNumbers[0]).assertEqual(8);
      expect(runner.rule.dataNumbers[5]).assertEqual(64);
      expect(runner.occupied()).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_1900
     * @tc.name gameSessionAlternatingScoreFollowsOracle1900
     * @tc.desc Verify the running score never diverges from the oracle merge score per turn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_alternatingScoreFollowsOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(alternatingBoard());
      runner.rule.status = GameStatus.RUNNING;
      let directions: string[] = alternatingDirections();
      let expected: number = 0;
      for (let turn: number = 0; turn < SESSION_TURNS; turn++) {
        let before: number[] = BoardKit.valuesOf(runner.rule);
        expected = expected + BoardOracle.mergeScore(before, directions[turn]);
        runner.turn(directions[turn]);
        expect(runner.rule.score).assertEqual(expected);
      }
      expect(runner.rule.score).assertEqual(212);
      expect(expected).assertEqual(212);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2000
     * @tc.name gameSessionAlternatingScoreMonotonic2000
     * @tc.desc Verify a session score never decreases from one turn to the next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_alternatingScoreMonotonic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(alternatingBoard());
      runner.rule.status = GameStatus.RUNNING;
      let directions: string[] = alternatingDirections();
      let scores: number[] = [];
      for (let turn: number = 0; turn < SESSION_TURNS; turn++) {
        runner.turn(directions[turn]);
        scores.push(runner.rule.score);
      }
      for (let index: number = 1; index < scores.length; index++) {
        expect(scores[index] >= scores[index - 1]).assertTrue();
      }
      expect(scores[0] > 0).assertTrue();
      expect(runner.rule.score > 0).assertTrue();
      expect(scores.length).assertEqual(SESSION_TURNS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2100
     * @tc.name gameSessionAlternatingKeepsLength2100
     * @tc.desc Verify the board keeps sixteen cells after every single turn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_alternatingKeepsLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(alternatingBoard());
      runner.rule.status = GameStatus.RUNNING;
      let directions: string[] = alternatingDirections();
      for (let turn: number = 0; turn < SESSION_TURNS; turn++) {
        runner.turn(directions[turn]);
        expect(runner.rule.dataNumbers.length).assertEqual(CELLS);
        expect(runner.occupied() <= CELLS).assertTrue();
      }
      expect(runner.steps.length).assertEqual(SESSION_TURNS * SIDE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2200
     * @tc.name gameSessionTerminalDetectsOverBoard2200
     * @tc.desc Verify a merge that fills the last hole marks the session as over
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_terminalDetectsOverBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      values[12] = 8;
      values[13] = 8;
      values[14] = 2;
      values[15] = 4;
      let runner: GameSessionRunner = new GameSessionRunner(values);
      runner.rule.status = GameStatus.RUNNING;
      expect(runner.rule.isGameOver()).assertFalse();
      runner.turn(DIR_LEFT);
      expect(runner.rule.dataNumbers[12]).assertEqual(16);
      expect(runner.rule.score).assertEqual(16);
      expect(runner.spawnAt(15, 2)).assertTrue();
      expect(runner.terminal()).assertTrue();
      expect(runner.rule.status).assertEqual(GameStatus.OVER);
      expect(runner.rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2300
     * @tc.name gameSessionTerminalNotTriggeredWithZero2300
     * @tc.desc Verify a single empty cell keeps the session running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_terminalNotTriggeredWithZero', TestType.FUNCTION, () => {
      let values: number[] = BoardKit.overBoard();
      values[15] = 0;
      let runner: GameSessionRunner = new GameSessionRunner(values);
      runner.rule.status = GameStatus.RUNNING;
      runner.turn(DIR_LEFT);
      expect(runner.rule.isGameOver()).assertFalse();
      expect(runner.terminal()).assertFalse();
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
      expect(runner.canPlay()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2400
     * @tc.name gameSessionTerminalNotTriggeredWithMerge2400
     * @tc.desc Verify a full board that still has an adjacent pair keeps the session running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_terminalNotTriggeredWithMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.horizontalPairBoard());
      runner.rule.status = GameStatus.RUNNING;
      expect(runner.occupied()).assertEqual(CELLS);
      expect(runner.rule.isGameOver()).assertFalse();
      expect(runner.terminal()).assertFalse();
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
      expect(BoardKit.positionsOf(runner.rule.dataNumbers, 8).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2500
     * @tc.name gameSessionTerminalBlocksFurtherPlay2500
     * @tc.desc Verify the terminal status closes the gesture guard for the rest of the session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_terminalBlocksFurtherPlay', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      values[12] = 8;
      values[13] = 8;
      values[14] = 2;
      values[15] = 4;
      let runner: GameSessionRunner = new GameSessionRunner(values);
      runner.rule.status = GameStatus.RUNNING;
      runner.turn(DIR_LEFT);
      runner.spawnAt(15, 2);
      expect(runner.terminal()).assertTrue();
      expect(runner.canPlay()).assertFalse();
      expect(runner.rule.status === GameStatus.RUNNING).assertFalse();
      expect(runner.terminal()).assertTrue();
      expect(runner.maxTile()).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2600
     * @tc.name gameSessionRestartAfterTerminal2600
     * @tc.desc Verify a restart from the over status returns a playable two tile session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restartAfterTerminal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      values[12] = 8;
      values[13] = 8;
      values[14] = 2;
      values[15] = 4;
      let runner: GameSessionRunner = new GameSessionRunner(values);
      runner.rule.status = GameStatus.RUNNING;
      runner.turn(DIR_LEFT);
      runner.spawnAt(15, 2);
      runner.terminal();
      expect(runner.canPlay()).assertFalse();
      runner.restart();
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
      expect(runner.canPlay()).assertTrue();
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.score).assertEqual(0);
      expect(runner.steps.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2700
     * @tc.name gameSessionRestartZeroesLongSession2700
     * @tc.desc Verify a restart after a forty point opening resets score and tile size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restartZeroesLongSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 6);
      expect(runner.rule.score).assertEqual(40);
      expect(runner.maxTile()).assertEqual(16);
      runner.restart();
      expect(runner.rule.score).assertEqual(0);
      expect(runner.maxTile() <= 4).assertTrue();
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2800
     * @tc.name gameSessionRestartKeepsSixteenCells2800
     * @tc.desc Verify a restart wipes a dense board back to sixteen cells with two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_restartKeepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.repeatedRow([16, 32, 64, 128]));
      runner.rule.status = GameStatus.RUNNING;
      expect(runner.occupied()).assertEqual(CELLS);
      runner.restart();
      expect(runner.rule.dataNumbers.length).assertEqual(CELLS);
      expect(runner.occupied()).assertEqual(2);
      expect(BoardKit.sum(runner.rule.dataNumbers) >= 4).assertTrue();
      expect(BoardKit.sum(runner.rule.dataNumbers) <= 8).assertTrue();
      expect(runner.rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_2900
     * @tc.name gameSessionTwoSessionsBoardsIndependent2900
     * @tc.desc Verify a turn in one session never changes another session board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_twoSessionsBoardsIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: GameSessionRunner = openingRunner();
      let secondValues: number[] = BoardKit.withRow(BoardKit.blank(), 1, [4, 4, 0, 0]);
      let second: GameSessionRunner = new GameSessionRunner(secondValues);
      second.rule.status = GameStatus.RUNNING;
      first.turn(DIR_LEFT);
      BoardKit.expectValues(first.rule.dataNumbers, BoardKit.row([4, 0, 0, 0]));
      BoardKit.expectValues(second.rule.dataNumbers, secondValues);
      expect(second.rule.score).assertEqual(0);
      expect(second.rule.dataNumbers[4]).assertEqual(4);
      expect(second.rule.dataNumbers[5]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3000
     * @tc.name gameSessionTwoSessionsScoresIndependent3000
     * @tc.desc Verify two sessions keep separate scores and separate largest tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_twoSessionsScoresIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: GameSessionRunner = openingRunner();
      playOpening(first, 6);
      let second: GameSessionRunner = openingRunner();
      playOpening(second, 2);
      expect(first.rule.score).assertEqual(40);
      expect(second.rule.score).assertEqual(4);
      expect(first.maxTile()).assertEqual(16);
      expect(second.maxTile()).assertEqual(4);
      expect(first.rule.score === second.rule.score).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3100
     * @tc.name gameSessionTwoSessionsRecordsIndependent3100
     * @tc.desc Verify step records belong to the session that produced them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_twoSessionsRecordsIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: GameSessionRunner = openingRunner();
      let second: GameSessionRunner = openingRunner();
      first.turn(DIR_LEFT);
      expect(first.steps.length).assertEqual(SIDE);
      expect(second.steps.length).assertEqual(0);
      second.turn(DIR_RIGHT);
      expect(second.steps.length).assertEqual(SIDE);
      expect(first.steps.length).assertEqual(SIDE);
      expect(first.steps[0].direction).assertEqual(DIR_LEFT);
      expect(second.steps[0].direction).assertEqual(DIR_RIGHT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3200
     * @tc.name gameSessionRecordsCountMatchesTurns3200
     * @tc.desc Verify every turn appends exactly four line records and no more
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_recordsCountMatchesTurns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 3);
      expect(runner.steps.length).assertEqual(12);
      let firstLine: number = 0;
      for (let index: number = 0; index < runner.steps.length; index++) {
        if (runner.steps[index].line === 0) {
          firstLine = firstLine + 1;
        }
      }
      expect(firstLine).assertEqual(3);
      let absent: SessionStep | undefined = runner.steps[12];
      expect(absent).assertUndefined();
      expect(runner.steps[11].line).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3300
     * @tc.name gameSessionFirstRecordFields3300
     * @tc.desc Verify the first record captures direction, line and the four point delta
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_firstRecordFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      let delta: number = runner.turn(DIR_LEFT);
      expect(delta).assertEqual(4);
      expect(runner.steps.length).assertEqual(SIDE);
      expect(runner.steps[0].direction).assertEqual(DIR_LEFT);
      expect(runner.steps[0].line).assertEqual(0);
      expect(runner.steps[0].scoreBefore).assertEqual(0);
      expect(runner.steps[0].scoreAfter).assertEqual(4);
      expect(runner.steps[0].occupiedAfter).assertEqual(1);
      expect(runner.steps[0].delta()).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3400
     * @tc.name gameSessionMergeRecordFields3400
     * @tc.desc Verify a merge record stores the eight point jump and the post merge occupancy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_mergeRecordFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.row([4, 4, 0, 0]));
      runner.rule.status = GameStatus.RUNNING;
      runner.turn(DIR_LEFT);
      expect(runner.steps[0].delta()).assertEqual(8);
      expect(runner.steps[0].scoreBefore).assertEqual(0);
      expect(runner.steps[0].scoreAfter).assertEqual(8);
      expect(runner.steps[0].occupiedAfter).assertEqual(1);
      expect(runner.steps[1].delta()).assertEqual(0);
      expect(runner.rule.dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3500
     * @tc.name gameSessionSingleLineRecords3500
     * @tc.desc Verify a three line session records only the line that actually merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_singleLineRecords', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      runner.lineStep(DIR_LEFT, 0);
      runner.lineStep(DIR_LEFT, 1);
      runner.lineStep(DIR_LEFT, 2);
      expect(runner.steps.length).assertEqual(3);
      expect(runner.steps[0].delta()).assertEqual(4);
      expect(runner.steps[1].delta()).assertEqual(0);
      expect(runner.steps[2].delta()).assertEqual(0);
      expect(runner.steps[1].line).assertEqual(1);
      expect(runner.steps[2].occupiedAfter).assertEqual(1);
      expect(runner.firstStepOrNull(DIR_UP)).assertNull();
      let up: SessionStep | null = runner.firstStepOrNull(DIR_LEFT);
      expect(up !== null).assertTrue();
      let first: SessionStep = up as SessionStep;
      expect(first.line).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3600
     * @tc.name gameSessionLastRecordMatchesFinal3600
     * @tc.desc Verify the last record score equals the session score after the final turn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_lastRecordMatchesFinal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      playOpening(runner, 2);
      let last: SessionStep = runner.steps[runner.steps.length - 1];
      expect(last.scoreAfter).assertEqual(runner.rule.score);
      expect(last.line).assertEqual(SIDE - 1);
      expect(last.direction).assertEqual(DIR_LEFT);
      expect(last.delta()).assertEqual(0);
      expect(runner.steps.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3700
     * @tc.name gameSessionSpawnRefusesOccupied3700
     * @tc.desc Verify a deterministic spawn cannot overwrite an occupied cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_spawnRefusesOccupied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      expect(runner.rule.dataNumbers[0]).assertEqual(2);
      expect(runner.spawnAt(0, 8)).assertFalse();
      expect(runner.rule.dataNumbers[0]).assertEqual(2);
      expect(runner.occupied()).assertEqual(2);
      expect(runner.rule.dataNumbers).assertContain(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3800
     * @tc.name gameSessionSpawnFillsEmptyCell3800
     * @tc.desc Verify a deterministic spawn lands on an empty cell and raises the occupancy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_spawnFillsEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = openingRunner();
      expect(runner.spawnAt(5, 4)).assertTrue();
      expect(runner.rule.dataNumbers[5]).assertEqual(4);
      expect(runner.occupied()).assertEqual(3);
      expect(runner.maxTile()).assertEqual(4);
      let expected: number[] = BoardKit.blank();
      expected[0] = 2;
      expected[1] = 2;
      expected[5] = 4;
      BoardKit.expectValues(runner.rule.dataNumbers, expected);
    });

    /**
     * @tc.number SUB_GAME2048_GAMESESSION_3900
     * @tc.name gameSessionEmptyBoardTurnIsNoOp3900
     * @tc.desc Verify a turn on an empty board scores nothing and records four null deltas
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('gameSession_emptyBoardTurnIsNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let runner: GameSessionRunner = new GameSessionRunner(BoardKit.repeatedRow([2, 4, 8, 16]));
      runner.load(BoardKit.blank());
      let delta: number = runner.turn(DIR_UP);
      expect(delta).assertEqual(0);
      expect(runner.rule.score).assertEqual(0);
      expect(runner.steps.length).assertEqual(SIDE);
      expect(runner.steps[0].delta()).assertEqual(0);
      expect(runner.steps[3].delta()).assertEqual(0);
      BoardKit.expectAllZeros(runner.rule.dataNumbers);
    });
  });
}
