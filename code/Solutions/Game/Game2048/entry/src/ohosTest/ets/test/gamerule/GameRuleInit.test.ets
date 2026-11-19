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
import { BoardKit, CELLS, SPAWN_VALUES } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/**
 * A fully occupied board with a single merge available on the last row.
 * Moving left merges the leading pair, frees the last cell, and the spawned
 * tile lands there. Whatever value two or four is spawned, the result is full
 * and has no adjacent pair left, so the move is the one deterministic way to
 * reach the over status.
 */
const LOCK_BOARD: number[] = [
  2, 4, 2, 8,
  4, 2, 4, 2,
  2, 4, 2, 8,
  2, 2, 2, 8
];

/** Score produced by the single merge on the last row of LOCK_BOARD. */
const LOCK_SCORE: number = 4;

/** Number of tiles the production init is required to place on a fresh board. */
const INIT_TILE_COUNT: number = 2;
/** Number of empty cells left after init on a sixteen cell board. */
const INIT_EMPTY_COUNT: number = CELLS - INIT_TILE_COUNT;
/** Every value a freshly initialised board may hold. */
const INIT_ALLOWED_VALUES: number[] = [0, 2, 4];
/** Smallest possible sum of the two freshly spawned tiles. */
const INIT_MIN_SUM: number = 4;
/** Largest possible sum of the two freshly spawned tiles. */
const INIT_MAX_SUM: number = 8;

/**
 * Returns the tile stored at index, or null when the index lies outside the
 * board. init rebuilds the board from scratch, so "no seventeenth cell" is a
 * real contract of the production code and not a defensive guard.
 */
function tileAt(values: number[], index: number): number | null {
  if (index < 0 || index >= values.length) {
    return null;
  }
  return values[index];
}

/**
 * Renders a board as a comma wrapped list. The wrapping comma keeps substring
 * checks from matching a digit in the middle of a larger tile value.
 */
function signatureOf(values: number[]): string {
  return ',' + values.join(',') + ',';
}

/**
 * GameRule.init 测试套件。
 *
 * 生产实现把棋盘整体替换成十六个 0，把 status 置为 RUNNING，把 score 置为 0，
 * 再连续调用两次 randomNum 播种。本套件只验证 init 本身：重置形状、重置数量、
 * 重置状态与分数、丢弃旧棋盘、以及重置后的棋盘仍然可以继续比赛。
 */
export default function gameRuleInitTest() {
  describe('gameRuleInitTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleInitTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleInitTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0100
     * @tc.name initDoesNotThrow0100
     * @tc.desc Verify init completes on a blank rule without raising any error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let threw: boolean = false;
      try {
        rule.init();
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0200
     * @tc.name initTrimsSeventeenCellBoard0200
     * @tc.desc Verify an over long board is rebuilt to exactly sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_trimsSeventeenCellBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.zeros(17);
      values[16] = 8;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(17);
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0300
     * @tc.name initPadsFiveCellBoard0300
     * @tc.desc Verify a five cell board is expanded to the fixed sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_padsFiveCellBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.dataNumbers = [2, 0, 4, 0, 8];
      expect(rule.dataNumbers.length).assertEqual(5);
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0400
     * @tc.name initFromEmptyBoard0400
     * @tc.desc Verify a rule built from an empty list regains a full board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromEmptyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(0);
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0500
     * @tc.name initPlacesExactlyTwoTiles0500
     * @tc.desc Verify a reset board carries exactly the two tiles init spawns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_placesExactlyTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let tiles: number = BoardKit.countNonZero(rule.dataNumbers);
      expect(tiles).assertEqual(INIT_TILE_COUNT);
      expect(tiles === INIT_TILE_COUNT).assertTrue();
      expect(rule.dataNumbers.length - tiles).assertEqual(INIT_EMPTY_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0600
     * @tc.name initTileValuesAreTwoOrFour0600
     * @tc.desc Verify every spawned tile is worth two or four and nothing else
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_tileValuesAreTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let illegal: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        let value: number = rule.dataNumbers[index];
        if (value !== 0 && value !== 2 && value !== 4) {
          illegal = illegal + 1;
        }
      }
      expect(illegal).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0700
     * @tc.name initLeavesFourteenEmptyCells0700
     * @tc.desc Verify the reset board keeps fourteen cells empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_leavesFourteenEmptyCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let empty: number = BoardKit.zeroPositions(rule.dataNumbers).length;
      expect(empty).assertEqual(INIT_EMPTY_COUNT);
      expect(empty).assertEqual(14);
      expect(empty + INIT_TILE_COUNT).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0800
     * @tc.name initTilesOccupyDistinctCells0800
     * @tc.desc Verify the two spawned tiles never share one cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_tilesOccupyDistinctCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let occupied: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== 0) {
          occupied.push(index);
        }
      }
      expect(occupied.length).assertEqual(INIT_TILE_COUNT);
      expect(occupied[0] === occupied[1]).assertFalse();
      expect(occupied[0] >= 0).assertTrue();
      expect(occupied[1] < CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_0900
     * @tc.name initBoardUsesOnlyZeroTwoFour0900
     * @tc.desc Verify no cell of a reset board escapes the zero, two, four set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_boardUsesOnlyZeroTwoFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      rule.init();
      BoardKit.expectTileSet(rule.dataNumbers, INIT_ALLOWED_VALUES);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1000
     * @tc.name initTileSumIsEvenAndBounded1000
     * @tc.desc Verify the two fresh tiles add up to an even value between four and eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_tileSumIsEvenAndBounded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let total: number = BoardKit.sum(rule.dataNumbers);
      expect(total >= INIT_MIN_SUM).assertTrue();
      expect(total <= INIT_MAX_SUM).assertTrue();
      expect(total % 2).assertEqual(0);
      let manual: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== 0) {
          manual = manual + rule.dataNumbers[index];
        }
      }
      expect(manual).assertEqual(total);
      expect(manual >= INIT_MIN_SUM).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1100
     * @tc.name initStatusBecomesRunning1100
     * @tc.desc Verify init moves the rule into the running state used by the gesture guard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_statusBecomesRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status).assertEqual(1);
      expect(rule.status === GameStatus.RUNNING).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1200
     * @tc.name initOverwritesBeforeStatus1200
     * @tc.desc Verify a rule left in the before state is promoted to running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_overwritesBeforeStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.BEFORE;
      rule.init();
      expect(rule.status === GameStatus.BEFORE).assertFalse();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1300
     * @tc.name initOverwritesOverStatus1300
     * @tc.desc Verify a finished rule is revived into the running state by init
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_overwritesOverStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.OVER;
      expect(rule.status).assertEqual(0);
      rule.init();
      expect(rule.status === GameStatus.OVER).assertFalse();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1400
     * @tc.name initScoreBecomesZero1400
     * @tc.desc Verify a reset board reports a zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_scoreBecomesZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 4, 4]));
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.score === 0).assertTrue();
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1500
     * @tc.name initDiscardsScoreNineNineNine1500
     * @tc.desc Verify an explicitly stored score of nine hundred ninety nine is cleared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_discardsScoreNineNineNine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 999;
      expect(rule.score).assertEqual(999);
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.score !== 999).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1600
     * @tc.name initDiscardsLargeScore1600
     * @tc.desc Verify a very large stored score does not survive the reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_discardsLargeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 1048576;
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.score < 0).assertFalse();
      expect(rule.score > 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1700
     * @tc.name initResetsScoreAndStatusTogether1700
     * @tc.desc Verify one reset call clears both the score and the finished state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_resetsScoreAndStatusTogether', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.score = 4096;
      rule.status = GameStatus.OVER;
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1800
     * @tc.name initFromFullOverBoard1800
     * @tc.desc Verify a completely stuck board is wiped and refilled with two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromFullOverBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      expect(rule.isGameOver()).assertTrue();
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.expectStatus(rule, GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_1900
     * @tc.name initFromSparseBoard1900
     * @tc.desc Verify a board holding a few scattered tiles is reduced to the reset quantity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromSparseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[6] = 4;
      values[11] = 8;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2000
     * @tc.name initFromSingleTileBoard2000
     * @tc.desc Verify a one tile board is replaced by the two tile opening position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromSingleTileBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[5] = 1024;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 1024).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2100
     * @tc.name initAfterTilesManuallyCleared2100
     * @tc.desc Verify clearing the live tiles by hand does not prevent a fresh two tile reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_afterTilesManuallyCleared', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      for (let index: number = 0; index < CELLS; index++) {
        rule.dataNumbers[index] = 0;
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.countNonZero(rule.dataNumbers) === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2200
     * @tc.name initAfterBoardArrayEmptied2200
     * @tc.desc Verify a board emptied through the public field is rebuilt to sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_afterBoardArrayEmptied', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      rule.dataNumbers = [];
      expect(rule.dataNumbers.length).assertEqual(0);
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2300
     * @tc.name initDoesNotKeepLargeTiles2300
     * @tc.desc Verify four digit tiles from the previous game never survive the reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotKeepLargeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 1024;
      values[5] = 2048;
      values[15] = 4096;
      let rule: GameRule = BoardKit.rule(values);
      rule.init();
      expect(BoardKit.positionsOf(rule.dataNumbers, 1024).length).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 2048).length).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 4096).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2400
     * @tc.name initDoesNotKeepMediumTiles2400
     * @tc.desc Verify tiles worth eight and above are dropped by the reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotKeepMediumTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([8, 16, 32, 64]));
      rule.init();
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 64).length).assertEqual(0);
      BoardKit.expectTileSet(rule.dataNumbers, INIT_ALLOWED_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2500
     * @tc.name initDoesNotKeepNegativeTiles2500
     * @tc.desc Verify negative values accepted by the constructor disappear after a reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotKeepNegativeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = -2;
      values[7] = -16;
      values[15] = -1024;
      let rule: GameRule = BoardKit.rule(values);
      rule.init();
      let negatives: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] < 0) {
          negatives = negatives + 1;
        }
      }
      expect(negatives).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2600
     * @tc.name initDoesNotKeepFractionalTiles2600
     * @tc.desc Verify fractional values left on the board are rounded away by the reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotKeepFractionalTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 1.5;
      values[1] = 2.25;
      values[2] = 0.5;
      let rule: GameRule = BoardKit.rule(values);
      rule.init();
      let fractional: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] % 1 !== 0) {
          fractional = fractional + 1;
        }
      }
      expect(fractional).assertEqual(0);
      BoardKit.expectTileSet(rule.dataNumbers, INIT_ALLOWED_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2700
     * @tc.name initDoesNotKeepDuplicateTiles2700
     * @tc.desc Verify a board full of equal tiles is replaced by the two tile opening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotKeepDuplicateTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(1024);
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 1024).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2800
     * @tc.name initDoesNotExtendBoard2800
     * @tc.desc Verify the reset never writes past the sixteen cell boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotExtendBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.zeros(32));
      rule.init();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
      expect(tileAt(rule.dataNumbers, CELLS + 1)).assertNull();
      expect(tileAt(rule.dataNumbers, 31)).assertNull();
      expect(rule.dataNumbers[CELLS + 2]).assertUndefined();
      expect(tileAt(rule.dataNumbers, CELLS - 1) === null).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_2900
     * @tc.name initKeepsBothEdgeCellsDefined2900
     * @tc.desc Verify the first and the last cell stay readable after a reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_keepsBothEdgeCellsDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(rule.dataNumbers[0] === undefined).assertFalse();
      expect(rule.dataNumbers[CELLS - 1] === undefined).assertFalse();
      expect(tileAt(rule.dataNumbers, 0) === null).assertFalse();
      expect(tileAt(rule.dataNumbers, CELLS - 1) === null).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3000
     * @tc.name initReplacesBoardArrayReference3000
     * @tc.desc Verify init installs a new array instead of refilling the old one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_replacesBoardArrayReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let previous: number[] = rule.dataNumbers;
      rule.init();
      expect(rule.dataNumbers === previous).assertFalse();
      expect(previous.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(previous)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3100
     * @tc.name initKeepsRuleInstanceReference3100
     * @tc.desc Verify resetting works in place so existing holders observe the new board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_keepsRuleInstanceReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let alias: GameRule = rule;
      rule.init();
      expect(alias === rule).assertTrue();
      expect(alias.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(alias.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(alias.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3200
     * @tc.name initLeavesExternalArrayUntouched3200
     * @tc.desc Verify an array installed through the public field is not rewritten in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_leavesExternalArrayUntouched', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let external: number[] = BoardKit.row([2, 4, 8, 16]);
      let snapshot: number[] = BoardKit.valuesOf(rule);
      rule.dataNumbers = external;
      rule.init();
      expect(external.length).assertEqual(CELLS);
      expect(external[0]).assertEqual(2);
      expect(external[3]).assertEqual(16);
      expect(rule.dataNumbers === external).assertFalse();
      expect(snapshot.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3300
     * @tc.name initLeavesPreviousSnapshotUntouched3300
     * @tc.desc Verify a board copy taken before the reset keeps its tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_leavesPreviousSnapshotUntouched', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let first: number[] = BoardKit.valuesOf(rule);
      let firstTiles: number = BoardKit.countNonZero(first);
      rule.init();
      expect(firstTiles).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.countNonZero(first)).assertEqual(firstTiles);
      expect(rule.dataNumbers === first).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3400
     * @tc.name initTwiceKeepsTwoTiles3400
     * @tc.desc Verify a second reset lands on the same two tile shape rather than stacking tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_twiceKeepsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let firstTiles: number = BoardKit.countNonZero(rule.dataNumbers);
      rule.init();
      let secondTiles: number = BoardKit.countNonZero(rule.dataNumbers);
      expect(firstTiles).assertEqual(INIT_TILE_COUNT);
      expect(secondTiles).assertEqual(INIT_TILE_COUNT);
      expect(secondTiles).assertEqual(firstTiles);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3500
     * @tc.name initTenTimesKeepsTwoTiles3500
     * @tc.desc Verify ten consecutive resets never accumulate tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_tenTimesKeepsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      let wrongRounds: number = 0;
      for (let round: number = 0; round < 10; round++) {
        rule.init();
        if (BoardKit.countNonZero(rule.dataNumbers) !== INIT_TILE_COUNT) {
          wrongRounds = wrongRounds + 1;
        }
        if (rule.dataNumbers.length !== CELLS) {
          wrongRounds = wrongRounds + 1;
        }
      }
      expect(wrongRounds).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3600
     * @tc.name initFiveTimesDoesNotThrow3600
     * @tc.desc Verify repeated resets on one instance never raise an error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fiveTimesDoesNotThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let threw: boolean = false;
      try {
        for (let round: number = 0; round < 5; round++) {
          rule.init();
        }
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3700
     * @tc.name initRefreshesRandomness3700
     * @tc.desc Verify repeated resets do not always reproduce one fixed opening board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_refreshesRandomness', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let signatures: string[] = [];
      for (let round: number = 0; round < 12; round++) {
        rule.init();
        signatures.push(signatureOf(rule.dataNumbers));
      }
      let distinct: number = 0;
      for (let index: number = 0; index < signatures.length; index++) {
        let seen: boolean = false;
        for (let earlier: number = 0; earlier < index; earlier++) {
          if (signatures[earlier] === signatures[index]) {
            seen = true;
          }
        }
        if (seen === false) {
          distinct = distinct + 1;
        }
      }
      BoardKit.log('init_refreshesRandomness', 'distinct boards ' + distinct);
      expect(distinct > 1).assertTrue();
      expect(signatures.length).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3800
     * @tc.name initReplacesArrayOnEveryCall3800
     * @tc.desc Verify every reset installs its own board array instead of reusing one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_replacesArrayOnEveryCall', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let previous: number[] = rule.dataNumbers;
      let reused: number = 0;
      for (let round: number = 0; round < 5; round++) {
        rule.init();
        if (rule.dataNumbers === previous) {
          reused = reused + 1;
        }
        previous = rule.dataNumbers;
      }
      expect(reused).assertEqual(0);
      expect(previous.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_3900
     * @tc.name initThenMoveIsUsable3900
     * @tc.desc Verify a reset board accepts a gesture without breaking the board shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenMoveIsUsable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let threw: boolean = false;
      try {
        rule.move('left');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      let tiles: number = BoardKit.countNonZero(rule.dataNumbers);
      expect(tiles >= INIT_TILE_COUNT).assertTrue();
      expect(tiles <= INIT_TILE_COUNT + 1).assertTrue();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4000
     * @tc.name initThenFourMovesKeepBoardShape4000
     * @tc.desc Verify a board reset and then played four times keeps its fixed shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenFourMovesKeepBoardShape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let directions: string[] = ['left', 'up', 'right', 'down'];
      for (let round: number = 0; round < directions.length; round++) {
        rule.move(directions[round]);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4100
     * @tc.name initThenMovesStayWithinBoard4100
     * @tc.desc Verify play after a reset never writes outside the sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenMovesStayWithinBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      for (let round: number = 0; round < 6; round++) {
        rule.move('left');
        rule.move('down');
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
      expect(tileAt(rule.dataNumbers, CELLS + 4)).assertNull();
      expect(BoardKit.countNonZero(rule.dataNumbers) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4200
     * @tc.name initThenBoardIsNotGameOver4200
     * @tc.desc Verify the two tile opening position always leaves legal moves available
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenBoardIsNotGameOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.init();
      expect(rule.isGameOver()).assertFalse();
      expect(BoardOracle.gameOver(rule.dataNumbers)).assertFalse();
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4300
     * @tc.name initThenIsGameOverAgreesWithOracle4300
     * @tc.desc Verify the live verdict after a reset matches the independent board model
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenIsGameOverAgreesWithOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      rule.init();
      let live: boolean = rule.isGameOver();
      let oracle: boolean = BoardOracle.gameOver(rule.dataNumbers);
      expect(live).assertEqual(oracle);
      expect(live).assertFalse();
      BoardKit.expectGameOver(rule, false);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4400
     * @tc.name initThenTilesArePowersOfTwo4400
     * @tc.desc Verify every tile reachable from a reset board is a legal 2048 tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenTilesArePowersOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.move('left');
      rule.move('up');
      let illegal: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        let value: number = rule.dataNumbers[index];
        if (value !== 0 && BoardOracle.isPowerOfTwo(value) === false) {
          illegal = illegal + 1;
        }
      }
      expect(illegal).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers) >= INIT_MIN_SUM).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4500
     * @tc.name initThenScoreIsNotNegative4500
     * @tc.desc Verify the score produced by play after a reset never goes below zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenScoreIsNotNegative', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 512;
      rule.init();
      expect(rule.score).assertEqual(0);
      rule.move('right');
      rule.move('down');
      expect(rule.score >= 0).assertTrue();
      expect(rule.score % 2).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4600
     * @tc.name initAfterMovesResetsToTwoTiles4600
     * @tc.desc Verify a mid game board is brought back to the opening shape by a reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_afterMovesResetsToTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 4, 4]));
      rule.move('left');
      rule.move('up');
      expect(rule.score >= 0).assertTrue();
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4700
     * @tc.name initThenMoveLeavesStatusRunning4700
     * @tc.desc Verify playing immediately after a reset keeps the running state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_thenMoveLeavesStatusRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      rule.move('up');
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status === GameStatus.OVER).assertFalse();
      expect(rule.status === GameStatus.BEFORE).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4800
     * @tc.name initKeepsCellTypesNumeric4800
     * @tc.desc Verify every cell of a reset board stays a plain number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_keepsCellTypesNumeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      rule.init();
      let nonNumeric: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (typeof rule.dataNumbers[index] !== 'number') {
          nonNumeric = nonNumeric + 1;
        }
      }
      expect(nonNumeric).assertEqual(0);
      expect(typeof rule.status).assertEqual('number');
      expect(typeof rule.score).assertEqual('number');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_4900
     * @tc.name initBoardSignatureContainsEmptyCells4900
     * @tc.desc Verify the rendered reset board exposes at least one empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_boardSignatureContainsEmptyCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.init();
      let signature: string = signatureOf(rule.dataNumbers);
      expect(signature).assertContain(',0,');
      expect(signature).assertContain(',');
      expect(signature.charAt(0)).assertEqual(',');
      BoardKit.logBoard('init_boardSignatureContainsEmptyCells', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5000
     * @tc.name initBoardSignatureHasSixteenCells5000
     * @tc.desc Verify the rendered reset board still spans exactly sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_boardSignatureHasSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let values: number[] = rule.dataNumbers;
      let rendered: string = BoardKit.describe(values);
      expect(rendered.length > 0).assertTrue();
      let separators: number = 0;
      for (let index: number = 0; index < rendered.length; index++) {
        if (rendered.charAt(index) === '|' || rendered.charAt(index) === '/') {
          separators = separators + 1;
        }
      }
      expect(separators).assertEqual(15);
      expect(values.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5100
     * @tc.name initFromAlternatingBoard5100
     * @tc.desc Verify an alternating tile pattern is fully discarded by the reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromAlternatingBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index % 2 === 0 ? 2 : 4);
      }
      let rule: GameRule = BoardKit.rule(values);
      rule.init();
      let signature: string = signatureOf(rule.dataNumbers);
      expect(signature === signatureOf(values)).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(values[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5200
     * @tc.name initFromRepeatedRowBoard5200
     * @tc.desc Verify four identical dense rows collapse to the two tile opening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromRepeatedRowBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([8, 8, 8, 8]));
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(0);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5300
     * @tc.name initFromVerticalPairBoard5300
     * @tc.desc Verify a board with one vertical merge left is rebuilt into the opening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromVerticalPairBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.verticalPairBoard());
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5400
     * @tc.name initScoreAndStatusAfterThirdInit5400
     * @tc.desc Verify score and status stay reset across three consecutive resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_scoreAndStatusAfterThirdInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 2048;
      rule.status = GameStatus.OVER;
      rule.init();
      rule.score = 128;
      rule.status = GameStatus.OVER;
      rule.init();
      rule.score = 64;
      rule.init();
      expect(rule.score).assertEqual(0);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status === GameStatus.RUNNING).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5500
     * @tc.name initKeepsStatusNumeric5500
     * @tc.desc Verify the reset state is the numeric one the page compares against
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_keepsStatusNumeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(rule.status === 1).assertTrue();
      expect(rule.status !== 0).assertTrue();
      expect(rule.status !== -1).assertTrue();
      expect(rule.status - GameStatus.RUNNING).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5600
     * @tc.name initDoesNotTouchSiblingRule5600
     * @tc.desc Verify resetting one rule leaves a second rule built from the same source untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_doesNotTouchSiblingRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let first: GameRule = BoardKit.rule(values);
      let second: GameRule = BoardKit.rule(values);
      second.status = GameStatus.BEFORE;
      second.score = 256;
      first.init();
      expect(BoardKit.countNonZero(second.dataNumbers)).assertEqual(4);
      expect(second.dataNumbers[0]).assertEqual(2);
      expect(second.score).assertEqual(256);
      expect(second.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5700
     * @tc.name initEightRoundsKeepFourteenZeros5700
     * @tc.desc Verify the empty cell count stays fixed over eight consecutive resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_eightRoundsKeepFourteenZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let wrongRounds: number = 0;
      for (let round: number = 0; round < 8; round++) {
        rule.init();
        if (BoardKit.zeroPositions(rule.dataNumbers).length !== INIT_EMPTY_COUNT) {
          wrongRounds = wrongRounds + 1;
        }
      }
      expect(wrongRounds).assertEqual(0);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5800
     * @tc.name initEightRoundsKeepAllowedValues5800
     * @tc.desc Verify no reset round ever seeds a tile outside the allowed opening values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_eightRoundsKeepAllowedValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      let illegal: number = 0;
      for (let round: number = 0; round < 8; round++) {
        rule.init();
        for (let index: number = 0; index < CELLS; index++) {
          let value: number = rule.dataNumbers[index];
          if (value !== 0 && value !== 2 && value !== 4) {
            illegal = illegal + 1;
          }
        }
      }
      expect(illegal).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_5900
     * @tc.name initFromHorizontalPairBoard5900
     * @tc.desc Verify a board holding one horizontal merge is wiped before the opening is seeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromHorizontalPairBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.horizontalPairBoard());
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(0);
      BoardKit.expectStatus(rule, GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_6000
     * @tc.name initSumStaysBelowNineOverRounds6000
     * @tc.desc Verify the opening tile sum never exceeds eight across many resets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_sumStaysBelowNineOverRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let violations: number = 0;
      for (let round: number = 0; round < 9; round++) {
        rule.init();
        let total: number = BoardKit.sum(rule.dataNumbers);
        if (total < INIT_MIN_SUM || total > INIT_MAX_SUM) {
          violations = violations + 1;
        }
      }
      expect(violations).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers) <= 8).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_6100
     * @tc.name initAfterStatusManuallyRunning6100
     * @tc.desc Verify a reset of an already running rule leaves it running and reusable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_afterStatusManuallyRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.RUNNING;
      rule.score = 32;
      rule.init();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_6200
     * @tc.name initFromColumnOnlyBoard6200
     * @tc.desc Verify a board populated in a single column is reset to the opening shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_fromColumnOnlyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.column([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.columnOf(rule.dataNumbers, 0)[3]).assertEqual(16);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(0);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(INIT_EMPTY_COUNT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEINIT_6300
     * @tc.name initDetachesPreviousBoardArray6300
     * @tc.desc Verify rewriting an older board array cannot reach the freshly reset board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('init_detachesPreviousBoardArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let previous: number[] = rule.dataNumbers;
      rule.init();
      for (let index: number = 0; index < CELLS; index++) {
        previous[index] = 1024;
      }
      expect(BoardKit.positionsOf(rule.dataNumbers, 1024).length).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(INIT_TILE_COUNT);
      expect(BoardKit.countNonZero(previous)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0100
     * @tc.name statusConstructorStartsBefore0100
     * @tc.desc Verify a freshly constructed rule reports the before status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_constructorStartsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status).assertEqual(-1);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.status === GameStatus.OVER).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0200
     * @tc.name statusBeforeSurvivesChangedMove0200
     * @tc.desc Verify a changed move from the before state never promotes the rule to running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_beforeSurvivesChangedMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.status = GameStatus.BEFORE;
      rule.move('left');
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.score).assertEqual(4);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0300
     * @tc.name statusBeforeSurvivesUnchangedMove0300
     * @tc.desc Verify a move that cannot change the board leaves the before state alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_beforeSurvivesUnchangedMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.BEFORE;
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move('left');
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0400
     * @tc.name statusRunningSurvivesChangedMove0400
     * @tc.desc Verify a running game stays running after a move that changes the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_runningSurvivesChangedMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 0, 0]));
      rule.status = GameStatus.RUNNING;
      rule.move('left');
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.score).assertEqual(16);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status === GameStatus.OVER).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0500
     * @tc.name statusRunningSurvivesUnchangedMove0500
     * @tc.desc Verify a locked board keeps its running status when the move does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_runningSurvivesUnchangedMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.RUNNING;
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move('down');
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status).assertEqual(1);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0600
     * @tc.name statusOverWhenMoveLocksBoard0600
     * @tc.desc Verify the move that fills the last cell with no merge left sets the over status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_overWhenMoveLocksBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      rule.status = GameStatus.BEFORE;
      expect(rule.isGameOver()).assertFalse();
      rule.move('left');
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status).assertEqual(0);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0700
     * @tc.name statusOverBoardIsFullAndUnsolvable0700
     * @tc.desc Verify the over verdict comes from a full board without adjacent equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_overBoardIsFullAndUnsolvable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      rule.move('left');
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
      expect(BoardOracle.gameOver(rule.dataNumbers)).assertTrue();
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0800
     * @tc.name statusOverBoardScoreIncreasedByMerge0800
     * @tc.desc Verify the locking move still credits the merge it performed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_overBoardScoreIncreasedByMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      expect(rule.score).assertEqual(0);
      rule.move('left');
      expect(rule.score).assertEqual(LOCK_SCORE);
      expect(rule.score).assertEqual(4);
      expect(rule.score > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_0900
     * @tc.name statusOverMoveLeavesSpawnInsideBoard0900
     * @tc.desc Verify the closing spawn lands on the freed cell and keeps the board sixteen wide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_overMoveLeavesSpawnInsideBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      rule.move('left');
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[13]).assertEqual(2);
      expect(rule.dataNumbers[14]).assertEqual(8);
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[15]);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1000
     * @tc.name statusUnchangedMoveOnOverBoardKeepsBefore1000
     * @tc.desc Verify a locked board never flips the before state without a board change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_unchangedMoveOnOverBoardKeepsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.BEFORE;
      rule.move('up');
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status === GameStatus.OVER).assertFalse();
      expect(rule.isGameOver()).assertTrue();
      expect(rule.dataNumbers[CELLS + 4]).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1100
     * @tc.name statusUnchangedMoveOnOverBoardKeepsOver1100
     * @tc.desc Verify an assigned over status survives a move that cannot change the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_unchangedMoveOnOverBoardKeepsOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.OVER;
      rule.move('up');
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status === GameStatus.OVER).assertTrue();
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1200
     * @tc.name statusOverAssignmentSurvivesNonFinalMove1200
     * @tc.desc Verify a changed move on an over rule cannot downgrade the status back to running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_overAssignmentSurvivesNonFinalMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      rule.status = GameStatus.OVER;
      rule.move('left');
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.isGameOver()).assertFalse();
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1300
     * @tc.name statusInvalidDirectionKeepsStatus1300
     * @tc.desc Verify an unrecognised direction is ignored and leaves the status untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_invalidDirectionKeepsStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 0, 0]));
      rule.status = GameStatus.RUNNING;
      rule.move('diagonal');
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1400
     * @tc.name statusEmptyDirectionKeepsStatus1400
     * @tc.desc Verify an empty direction string changes neither the board nor the status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_emptyDirectionKeepsStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([4, 4, 0, 0]));
      rule.status = GameStatus.BEFORE;
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move('');
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1500
     * @tc.name statusCaseSensitiveDirection1500
     * @tc.desc Verify the direction literals are case sensitive and a capitalised word does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_caseSensitiveDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 0, 0]));
      rule.status = GameStatus.RUNNING;
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move('Left');
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.describe(rule.dataNumbers)).assertContain('|');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1600
     * @tc.name statusMoveNeverSetsRunning1600
     * @tc.desc Verify a changed move preserves each starting status instead of forcing running
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_moveNeverSetsRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let beforeRule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      let runningRule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      let overRule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 0, 0]));
      beforeRule.status = GameStatus.BEFORE;
      runningRule.status = GameStatus.RUNNING;
      overRule.status = GameStatus.OVER;
      beforeRule.move('left');
      runningRule.move('left');
      overRule.move('left');
      expect(beforeRule.status).assertEqual(GameStatus.BEFORE);
      expect(runningRule.status).assertEqual(GameStatus.RUNNING);
      expect(overRule.status).assertEqual(GameStatus.OVER);
      expect(beforeRule.status === overRule.status).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1700
     * @tc.name statusScoreDoesNotDriveStatus1700
     * @tc.desc Verify scoring points on a non final move leaves the before status in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_scoreDoesNotDriveStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 0, 0]));
      let other: GameRule = BoardKit.rule(BoardKit.row([8, 8, 0, 0]));
      rule.status = GameStatus.BEFORE;
      other.status = GameStatus.RUNNING;
      rule.move('left');
      other.move('left');
      expect(rule.score).assertEqual(16);
      expect(other.score).assertEqual(rule.score);
      expect(rule.score > 0).assertTrue();
      expect(rule.isGameOver()).assertFalse();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1800
     * @tc.name statusOverValueIsZero1800
     * @tc.desc Verify the over state reached through a move is the documented numeric zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_overValueIsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      rule.move('left');
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status === 0).assertTrue();
      expect(!rule.status).assertTrue();
      expect(rule.status + GameStatus.RUNNING).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_1900
     * @tc.name statusStaysOverAfterFurtherMoves1900
     * @tc.desc Verify the over status is stable across every later direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_staysOverAfterFurtherMoves', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      rule.move('left');
      expect(rule.status).assertEqual(GameStatus.OVER);
      let directions: string[] = ['left', 'right', 'up', 'down'];
      for (let round: number = 0; round < directions.length; round++) {
        rule.move(directions[round]);
        expect(rule.status).assertEqual(GameStatus.OVER);
      }
      expect(rule.isGameOver()).assertTrue();
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_2000
     * @tc.name statusRunningDoesNotBlockOver2000
     * @tc.desc Verify a running rule still reaches the over status when the move locks the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_runningDoesNotBlockOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(LOCK_BOARD);
      rule.status = GameStatus.RUNNING;
      rule.move('left');
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status === 1).assertFalse();
      expect(rule.isGameOver()).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESTATUS_2100
     * @tc.name statusNoOverWhileBoardHasRoom2100
     * @tc.desc Verify a scoring move that leaves empty cells never closes the game
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('status_noOverWhileBoardHasRoom', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[1] = 2;
      values[4] = 4;
      values[5] = 4;
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.BEFORE;
      rule.move('left');
      expect(rule.score).assertEqual(12);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.isGameOver()).assertFalse();
      expect(BoardKit.zeroPositions(rule.dataNumbers).length > 0).assertTrue();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });
  });
}
