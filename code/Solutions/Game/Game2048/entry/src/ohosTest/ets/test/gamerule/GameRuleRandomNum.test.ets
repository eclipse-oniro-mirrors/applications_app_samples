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

/** Number of calls that fill a completely empty board. */
const FULL_BOARD_CALLS: number = CELLS;
/** Every value a board may hold while randomNum is the only writer. */
const SPAWN_BOARD_VALUES: number[] = [0, 2, 4];

/**
 * Returns the tile stored at index, or null when the index lies outside the
 * board. randomNum writes at most one cell, so the null branch proves that the
 * writer never grows the board.
 */
function tileAt(values: number[], index: number): number | null {
  if (index < 0 || index >= values.length) {
    return null;
  }
  return values[index];
}

/**
 * Counts the cells whose value differs between two boards of the same length.
 */
function differenceCount(before: number[], after: number[]): number {
  let count: number = 0;
  let limit: number = before.length < after.length ? before.length : after.length;
  for (let index: number = 0; index < limit; index++) {
    if (before[index] !== after[index]) {
      count = count + 1;
    }
  }
  return count;
}

/**
 * Builds a fully occupied board of one repeated value with a single empty cell.
 */
function boardWithHole(hole: number, value: number): number[] {
  let values: number[] = [];
  for (let index: number = 0; index < CELLS; index++) {
    values.push(index === hole ? 0 : value);
  }
  return values;
}

/**
 * GameRule.randomNum 测试套件。
 *
 * 生产实现随机挑一个格子，只有落在空格上才写入 2 或 4 并结束，函数本身恒返回
 * false。本套件固化“一次调用最多填一格、只填原本为空的那一格、不改分数与状态、
 * 不移动已有块、满盘时什么都不做”这些契约。
 */
export default function gameRuleRandomNumTest() {
  describe('gameRuleRandomNumTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleRandomNumTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleRandomNumTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0100
     * @tc.name randomNumReturnsFalseOnBlank0100
     * @tc.desc Verify a spawn attempt on an empty board reports failure while still filling a cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_returnsFalseOnBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let result: boolean = rule.randomNum();
      expect(result).assertFalse();
      expect(result === false).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0200
     * @tc.name randomNumReturnsFalseOnFullBoard0200
     * @tc.desc Verify a full board still reports the documented false return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_returnsFalseOnFullBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let before: number[] = BoardKit.valuesOf(rule);
      let result: boolean = rule.randomNum();
      expect(result).assertFalse();
      expect(typeof result).assertEqual('boolean');
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0300
     * @tc.name randomNumReturnsFalseOnSparseBoard0300
     * @tc.desc Verify a board holding a single tile still reports false after filling a second one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_returnsFalseOnSparseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[4] = 8;
      let rule: GameRule = BoardKit.rule(values);
      let result: boolean = rule.randomNum();
      expect(result === false).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0400
     * @tc.name randomNumReturnsFalseOnInitBoard0400
     * @tc.desc Verify a board prepared by init answers false from a further spawn attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_returnsFalseOnInitBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let before: number[] = BoardKit.valuesOf(rule);
      let result: boolean = rule.randomNum();
      expect(result).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(differenceCount(before, rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0500
     * @tc.name randomNumReturnsFalseRepeatedly0500
     * @tc.desc Verify ten consecutive spawn attempts all report false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_returnsFalseRepeatedly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let truthy: number = 0;
      for (let call: number = 0; call < 10; call++) {
        if (rule.randomNum() !== false) {
          truthy = truthy + 1;
        }
      }
      expect(truthy).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(10);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0600
     * @tc.name randomNumFillsOneCellOnBlank0600
     * @tc.desc Verify one seeded cell appears when randomNum runs on an empty board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsOneCellOnBlank', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let before: number[] = BoardKit.valuesOf(rule);
      rule.randomNum();
      BoardKit.expectSingleSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(CELLS - 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0700
     * @tc.name randomNumSpawnValueIsTwoOrFour0700
     * @tc.desc Verify the seeded tile is worth exactly two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_spawnValueIsTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.randomNum();
      let occupied: number[] = BoardKit.positionsOf(rule.dataNumbers, 2);
      let fours: number[] = BoardKit.positionsOf(rule.dataNumbers, 4);
      expect(occupied.length + fours.length).assertEqual(1);
      let spawnIndex: number = occupied.length === 1 ? occupied[0] : fours[0];
      let spawned: number = rule.dataNumbers[spawnIndex];
      expect(SPAWN_VALUES).assertContain(spawned);
      expect(spawnIndex >= 0).assertTrue();
      expect(spawned === 2 || spawned === 4).assertTrue();
      expect(BoardOracle.isPowerOfTwo(spawned)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0800
     * @tc.name randomNumKeepsExistingTileValues0800
     * @tc.desc Verify every tile placed before the call keeps its value and its cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsExistingTileValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[5] = 16;
      values[9] = 64;
      values[15] = 1024;
      let rule: GameRule = BoardKit.rule(values);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.randomNum();
      let moved: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (before[index] !== 0 && rule.dataNumbers[index] !== before[index]) {
          moved = moved + 1;
        }
      }
      expect(moved).assertEqual(0);
      expect(rule.dataNumbers[5]).assertEqual(16);
      expect(rule.dataNumbers[15]).assertEqual(1024);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_0900
     * @tc.name randomNumChangesAtMostOneCell0900
     * @tc.desc Verify a single call rewrites no more than one cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_changesAtMostOneCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      let before: number[] = BoardKit.valuesOf(rule);
      rule.randomNum();
      expect(differenceCount(before, rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.singleDifference(before, rule.dataNumbers) >= 0).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1000
     * @tc.name randomNumDecrementsZeroCountByOne1000
     * @tc.desc Verify the empty cell count drops by exactly one per call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_decrementsZeroCountByOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let zerosBefore: number = BoardKit.zeroPositions(rule.dataNumbers).length;
      rule.randomNum();
      let zerosAfter: number = BoardKit.zeroPositions(rule.dataNumbers).length;
      expect(zerosBefore - zerosAfter).assertEqual(1);
      expect(zerosAfter).assertEqual(CELLS - 1);
      expect(zerosBefore > zerosAfter).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1100
     * @tc.name randomNumKeepsBoardLength1100
     * @tc.desc Verify seeding a tile never changes the sixteen cell board length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsBoardLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      rule.randomNum();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
      expect(tileAt(rule.dataNumbers, CELLS - 1) === null).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1200
     * @tc.name randomNumKeepsScore1200
     * @tc.desc Verify spawning a tile is not a merge and leaves the score untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 4, 4]));
      rule.score = 999;
      rule.randomNum();
      expect(rule.score).assertEqual(999);
      expect(rule.score === 999).assertTrue();
      expect(rule.score !== 0).assertTrue();
      BoardKit.expectScore(rule, 999);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1300
     * @tc.name randomNumKeepsStatus1300
     * @tc.desc Verify spawning a tile never rewrites the running status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.RUNNING;
      rule.randomNum();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(rule.status === GameStatus.OVER).assertFalse();
      BoardKit.expectStatus(rule, 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1400
     * @tc.name randomNumAddsTileValueToSum1400
     * @tc.desc Verify the board sum grows by the spawned tile only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_addsTileValueToSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let sumBefore: number = BoardKit.sum(rule.dataNumbers);
      rule.randomNum();
      let sumAfter: number = BoardKit.sum(rule.dataNumbers);
      let delta: number = sumAfter - sumBefore;
      expect(delta === 2 || delta === 4).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
      expect(BoardKit.sum(rule.dataNumbers) > sumBefore).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1500
     * @tc.name randomNumFillsHoleAtFirstCell1500
     * @tc.desc Verify the first cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtFirstCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(0, 2);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[0] === 2 || rule.dataNumbers[0] === 4).assertTrue();
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1600
     * @tc.name randomNumFillsHoleAtSecondCell1600
     * @tc.desc Verify the second cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtSecondCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(1, 4);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[1] === 2 || rule.dataNumbers[1] === 4).assertTrue();
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(differenceCount(values, rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1700
     * @tc.name randomNumFillsHoleAtThirdCell1700
     * @tc.desc Verify the third cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtThirdCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[2] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[2]);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1800
     * @tc.name randomNumFillsHoleAtFourthCell1800
     * @tc.desc Verify the fourth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtFourthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index === 3 ? 0 : Math.pow(2, index + 1));
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[3] === 2 || rule.dataNumbers[3] === 4).assertTrue();
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[4]).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_1900
     * @tc.name randomNumFillsHoleAtFifthCell1900
     * @tc.desc Verify the fifth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtFifthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(4, 8);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[4]);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[5]).assertEqual(8);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2000
     * @tc.name randomNumFillsHoleAtSixthCell2000
     * @tc.desc Verify the sixth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtSixthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index === 5 ? 0 : (index % 2 === 0 ? 2 : 4));
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[5] === 2 || rule.dataNumbers[5] === 4).assertTrue();
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[6]).assertEqual(2);
      expect(differenceCount(values, rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2100
     * @tc.name randomNumFillsHoleAtSeventhCell2100
     * @tc.desc Verify the seventh cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtSeventhCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index === 6 ? 0 : (CELLS - index) * 2);
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[6]);
      expect(rule.dataNumbers[5]).assertEqual(22);
      expect(rule.dataNumbers[7]).assertEqual(18);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2200
     * @tc.name randomNumFillsHoleAtEighthCell2200
     * @tc.desc Verify the eighth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtEighthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(7, 16);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[7] === 2 || rule.dataNumbers[7] === 4).assertTrue();
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[11]).assertEqual(16);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2300
     * @tc.name randomNumFillsHoleAtNinthCell2300
     * @tc.desc Verify the ninth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtNinthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index === 8 ? 0 : (index % 2 === 0 ? 8 : 16));
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[8]);
      expect(rule.dataNumbers[4]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2400
     * @tc.name randomNumFillsHoleAtTenthCell2400
     * @tc.desc Verify the tenth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtTenthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(9, 2);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[9] === 2 || rule.dataNumbers[9] === 4).assertTrue();
      expect(rule.dataNumbers[8]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(2);
      expect(differenceCount(values, rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2500
     * @tc.name randomNumFillsHoleAtEleventhCell2500
     * @tc.desc Verify the eleventh cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtEleventhCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(10, 4);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[10]);
      expect(rule.dataNumbers[6]).assertEqual(4);
      expect(rule.dataNumbers[14]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2600
     * @tc.name randomNumFillsHoleAtTwelfthCell2600
     * @tc.desc Verify the twelfth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtTwelfthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      values[11] = 0;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[11] === 2 || rule.dataNumbers[11] === 4).assertTrue();
      expect(rule.dataNumbers[7]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(2);
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2700
     * @tc.name randomNumFillsHoleAtThirteenthCell2700
     * @tc.desc Verify the thirteenth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtThirteenthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index === 12 ? 0 : Math.pow(2, index + 1));
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[12]);
      expect(rule.dataNumbers[8]).assertEqual(512);
      expect(rule.dataNumbers[13]).assertEqual(16384);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2800
     * @tc.name randomNumFillsHoleAtFourteenthCell2800
     * @tc.desc Verify the fourteenth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtFourteenthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(13, 32);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[13] === 2 || rule.dataNumbers[13] === 4).assertTrue();
      expect(rule.dataNumbers[9]).assertEqual(32);
      expect(rule.dataNumbers[14]).assertEqual(32);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_2900
     * @tc.name randomNumFillsHoleAtFifteenthCell2900
     * @tc.desc Verify the fifteenth cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtFifteenthCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index === 14 ? 0 : (index % 2 === 0 ? 2 : 4));
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(SPAWN_VALUES).assertContain(rule.dataNumbers[14]);
      expect(rule.dataNumbers[13]).assertEqual(4);
      expect(rule.dataNumbers[15]).assertEqual(4);
      expect(differenceCount(values, rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3000
     * @tc.name randomNumFillsHoleAtLastCell3000
     * @tc.desc Verify the last cell is filled when it is the only empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsHoleAtLastCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = boardWithHole(15, 2);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.randomNum()).assertFalse();
      expect(rule.dataNumbers[15] === 2 || rule.dataNumbers[15] === 4).assertTrue();
      expect(rule.dataNumbers[14]).assertEqual(2);
      expect(rule.dataNumbers[11]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3100
     * @tc.name randomNumOneCallAddsOneTile3100
     * @tc.desc Verify one call on an empty board produces exactly one tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_oneCallAddsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let reports: boolean[] = [];
      for (let call: number = 1; call <= 1; call++) {
        reports.push(rule.randomNum());
      }
      expect(reports.length).assertEqual(1);
      expect(reports[0]).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(CELLS - 1);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3200
     * @tc.name randomNumTwoCallsAddTwoTiles3200
     * @tc.desc Verify two calls on an empty board produce exactly two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_twoCallsAddTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 2; call++) {
        expect(rule.randomNum()).assertFalse();
        expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(call);
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3300
     * @tc.name randomNumThreeCallsAddThreeTiles3300
     * @tc.desc Verify three calls on an empty board produce exactly three tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_threeCallsAddThreeTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 3; call++) {
        let result: boolean = rule.randomNum();
        expect(result).assertFalse();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(13);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3400
     * @tc.name randomNumFourCallsAddFourTiles3400
     * @tc.desc Verify four calls on an empty board produce exactly four tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fourCallsAddFourTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let totals: number[] = [];
      for (let call: number = 1; call <= 4; call++) {
        rule.randomNum();
        totals.push(BoardKit.countNonZero(rule.dataNumbers));
      }
      expect(totals[0]).assertEqual(1);
      expect(totals[1]).assertEqual(2);
      expect(totals[2]).assertEqual(3);
      expect(totals[3]).assertEqual(4);
      expect(BoardKit.sum(rule.dataNumbers) >= 8).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3500
     * @tc.name randomNumFiveCallsAddFiveTiles3500
     * @tc.desc Verify five calls on an empty board produce exactly five tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fiveCallsAddFiveTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 5; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(11);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.sum(rule.dataNumbers) >= 10).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3600
     * @tc.name randomNumSixCallsAddSixTiles3600
     * @tc.desc Verify six calls on an empty board produce exactly six tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_sixCallsAddSixTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 6; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(6);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(10);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
      expect(BoardKit.sum(rule.dataNumbers) % 2).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3700
     * @tc.name randomNumSevenCallsAddSevenTiles3700
     * @tc.desc Verify seven calls on an empty board produce exactly seven tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_sevenCallsAddSevenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 7; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(7);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(9);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length + 7).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3800
     * @tc.name randomNumEightCallsAddEightTiles3800
     * @tc.desc Verify eight calls on an empty board produce exactly eight tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_eightCallsAddEightTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 8; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(8);
      expect(BoardKit.countNonZero(rule.dataNumbers))
        .assertEqual(BoardKit.zeroPositions(rule.dataNumbers).length);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_3900
     * @tc.name randomNumNineCallsAddNineTiles3900
     * @tc.desc Verify nine calls on an empty board produce exactly nine tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_nineCallsAddNineTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 9; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(9);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(7);
      expect(BoardKit.countNonZero(rule.dataNumbers) > 0).assertTrue();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4000
     * @tc.name randomNumTenCallsAddTenTiles4000
     * @tc.desc Verify ten calls on an empty board produce exactly ten tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_tenCallsAddTenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 10; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(10);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(6);
      expect(BoardOracle.countNonZero(rule.dataNumbers)).assertEqual(10);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4100
     * @tc.name randomNumElevenCallsAddElevenTiles4100
     * @tc.desc Verify eleven calls on an empty board produce exactly eleven tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_elevenCallsAddElevenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 11; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(11);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(5);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.sum(rule.dataNumbers) >= 22).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4200
     * @tc.name randomNumTwelveCallsAddTwelveTiles4200
     * @tc.desc Verify twelve calls on an empty board produce exactly twelve tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_twelveCallsAddTwelveTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 12; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(4);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4300
     * @tc.name randomNumThirteenCallsAddThirteenTiles4300
     * @tc.desc Verify thirteen calls on an empty board produce exactly thirteen tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_thirteenCallsAddThirteenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 13; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(13);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(3);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length > 0).assertTrue();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4400
     * @tc.name randomNumFourteenCallsAddFourteenTiles4400
     * @tc.desc Verify fourteen calls on an empty board produce exactly fourteen tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fourteenCallsAddFourteenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 14; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(14);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(2);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
      expect(BoardKit.countNonZero(rule.dataNumbers) === CELLS).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4500
     * @tc.name randomNumFifteenCallsAddFifteenTiles4500
     * @tc.desc Verify fifteen calls on an empty board produce exactly fifteen tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fifteenCallsAddFifteenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 1; call <= 15; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(1);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(CELLS - 15);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4600
     * @tc.name randomNumSixteenCallsFillBoard4600
     * @tc.desc Verify sixteen calls on an empty board leave no empty cell behind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_sixteenCallsFillBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let lastReport: boolean = true;
      for (let call: number = 1; call <= FULL_BOARD_CALLS; call++) {
        lastReport = rule.randomNum();
      }
      expect(lastReport).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      BoardKit.expectNoZero(rule.dataNumbers);
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4700
     * @tc.name randomNumAfterInitAddsOneTile4700
     * @tc.desc Verify a spawn attempt after init grows the opening board from two tiles to three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_afterInitAddsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      let before: number[] = BoardKit.valuesOf(rule);
      expect(rule.randomNum()).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      BoardKit.expectSingleSpawn(before, rule.dataNumbers);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4800
     * @tc.name randomNumAfterInitReachesFullBoard4800
     * @tc.desc Verify fourteen attempts after init end on a completely occupied board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_afterInitReachesFullBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      for (let call: number = 1; call <= CELLS - 2; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      expect(rule.randomNum()).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_4900
     * @tc.name randomNumNeverSpawnsZero4900
     * @tc.desc Verify a filled cell is never left holding the empty marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_neverSpawnsZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let zeroWrites: number = 0;
      for (let call: number = 0; call < 12; call++) {
        let zerosBefore: number[] = BoardKit.zeroPositions(rule.dataNumbers);
        rule.randomNum();
        let zerosAfter: number[] = BoardKit.zeroPositions(rule.dataNumbers);
        if (zerosAfter.length !== zerosBefore.length - 1) {
          zeroWrites = zeroWrites + 1;
        }
      }
      expect(zeroWrites).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5000
     * @tc.name randomNumNeverSpawnsAboveFour5000
     * @tc.desc Verify a seeded tile never exceeds the four point opening value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_neverSpawnsAboveFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 0; call < CELLS; call++) {
        rule.randomNum();
      }
      let tooLarge: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] > 4) {
          tooLarge = tooLarge + 1;
        }
      }
      expect(tooLarge).assertEqual(0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(0);
      BoardKit.expectTileSet(rule.dataNumbers, SPAWN_BOARD_VALUES);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5100
     * @tc.name randomNumDoesNotMergeEquals5100
     * @tc.desc Verify two equal neighbours stay two tiles instead of merging into four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_doesNotMergeEquals', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      rule.score = 0;
      rule.randomNum();
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5200
     * @tc.name randomNumDoesNotMoveTiles5200
     * @tc.desc Verify spawning never shifts an existing tile into another cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_doesNotMoveTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[1] = 2;
      values[3] = 8;
      values[12] = 32;
      let rule: GameRule = BoardKit.rule(values);
      rule.randomNum();
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(32);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(differenceCount(values, rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5300
     * @tc.name randomNumOnlyWritesZeroCells5300
     * @tc.desc Verify every rewritten cell was empty immediately before the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_onlyWritesZeroCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let illegal: number = 0;
      for (let call: number = 0; call < 10; call++) {
        let before: number[] = BoardKit.valuesOf(rule);
        rule.randomNum();
        for (let index: number = 0; index < CELLS; index++) {
          if (before[index] !== rule.dataNumbers[index] && before[index] !== 0) {
            illegal = illegal + 1;
          }
        }
      }
      expect(illegal).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(10);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5400
     * @tc.name randomNumLeavesFullBoardUnchanged5400
     * @tc.desc Verify a failed spawn on a full board leaves every cell exactly as it was
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_leavesFullBoardUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      let before: number[] = BoardKit.valuesOf(rule);
      let sumBefore: number = BoardKit.sum(before);
      expect(rule.randomNum()).assertFalse();
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(differenceCount(before, rule.dataNumbers)).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(sumBefore);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5500
     * @tc.name randomNumPreservesOverBoard5500
     * @tc.desc Verify a finished board is neither filled nor revived by a spawn attempt
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_preservesOverBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.OVER;
      let before: number[] = BoardKit.valuesOf(rule);
      expect(rule.randomNum()).assertFalse();
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(rule.isGameOver()).assertTrue();
      expect(rule.status).assertEqual(GameStatus.OVER);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5600
     * @tc.name randomNumKeepsOverStatus5600
     * @tc.desc Verify the finished status survives a fill attempt on a board with room
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsOverStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      rule.status = GameStatus.OVER;
      rule.randomNum();
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(rule.status).assertEqual(0);
      expect(rule.status === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5700
     * @tc.name randomNumKeepsBeforeStatus5700
     * @tc.desc Verify a rule that has not started keeps the before status when a tile is seeded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsBeforeStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      rule.randomNum();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status).assertEqual(-1);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5800
     * @tc.name randomNumKeepsLargeScore5800
     * @tc.desc Verify a spawn attempt leaves an already accumulated score untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsLargeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([8, 8, 16, 16]));
      rule.score = 2048;
      rule.randomNum();
      expect(rule.score).assertEqual(2048);
      expect(rule.score !== 0).assertTrue();
      expect(rule.score - 2048).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_5900
     * @tc.name randomNumLeavesBoardPlayable5900
     * @tc.desc Verify a move after a seed attempt still respects the fixed board shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_leavesBoardPlayable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.randomNum();
      rule.randomNum();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      let threw: boolean = false;
      try {
        rule.move('left');
      } catch (error) {
        threw = true;
      }
      expect(threw).assertFalse();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers) >= 2).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6000
     * @tc.name randomNumDoesNotWriteOutsideBoard6000
     * @tc.desc Verify the writer never touches a slot past the last cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_doesNotWriteOutsideBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.randomNum();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
      expect(tileAt(rule.dataNumbers, CELLS + 1)).assertNull();
      expect(rule.dataNumbers[CELLS + 3]).assertUndefined();
      expect(tileAt(rule.dataNumbers, CELLS - 1) === null).assertFalse();
      expect(BoardOracle.hasZero(rule.dataNumbers)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6100
     * @tc.name randomNumFifteenFilledBoardStaysSixteen6100
     * @tc.desc Verify the one hole board keeps sixteen readable cells after the fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fifteenFilledBoardStaysSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(boardWithHole(6, 4));
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
      rule.randomNum();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(tileAt(rule.dataNumbers, CELLS)).assertNull();
      expect(tileAt(rule.dataNumbers, CELLS - 1) === null).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6200
     * @tc.name randomNumReturnValueIsBoolean6200
     * @tc.desc Verify the report is a plain boolean false instead of a falsy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_returnValueIsBoolean', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let result: boolean = rule.randomNum();
      expect(typeof result).assertEqual('boolean');
      expect(result === false).assertTrue();
      expect(result !== true).assertTrue();
      expect(result === true).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6300
     * @tc.name randomNumTilesAreClearedByInit6300
     * @tc.desc Verify seeded tiles are discarded when the board is restarted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_tilesAreClearedByInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      for (let call: number = 0; call < 8; call++) {
        rule.randomNum();
      }
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      rule.init();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      expect(rule.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6400
     * @tc.name randomNumKeepsFixedTilesAcrossCalls6400
     * @tc.desc Verify six seed attempts never disturb the tiles fixed before them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_keepsFixedTilesAcrossCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[5] = 4;
      values[10] = 8;
      values[15] = 16;
      let rule: GameRule = BoardKit.rule(values);
      for (let call: number = 0; call < 6; call++) {
        rule.randomNum();
      }
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[5]).assertEqual(4);
      expect(rule.dataNumbers[10]).assertEqual(8);
      expect(rule.dataNumbers[15]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(10);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6500
     * @tc.name randomNumZeroCountDecreasesMonotonically6500
     * @tc.desc Verify the empty cell count steps down by one on every one of sixteen calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_zeroCountDecreasesMonotonically', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let expected: number = CELLS;
      let mismatches: number = 0;
      for (let call: number = 1; call <= CELLS; call++) {
        rule.randomNum();
        expected = expected - 1;
        if (BoardKit.zeroPositions(rule.dataNumbers).length !== expected) {
          mismatches = mismatches + 1;
        }
      }
      expect(mismatches).assertEqual(0);
      expect(expected).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULERANDOMNUM_6600
     * @tc.name randomNumFillsDifferentCellsInSequence6600
     * @tc.desc Verify successive seed attempts never target a cell that is already occupied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('randomNum_fillsDifferentCellsInSequence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let targets: number[] = [];
      for (let call: number = 0; call < 4; call++) {
        let before: number[] = BoardKit.valuesOf(rule);
        rule.randomNum();
        let written: number = BoardKit.singleDifference(before, rule.dataNumbers);
        expect(written >= 0).assertTrue();
        targets.push(written);
      }
      expect(targets.length).assertEqual(4);
      expect(targets[0] === targets[1]).assertFalse();
      expect(targets[1] === targets[2]).assertFalse();
      expect(targets[2] === targets[3]).assertFalse();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });
  });
}
