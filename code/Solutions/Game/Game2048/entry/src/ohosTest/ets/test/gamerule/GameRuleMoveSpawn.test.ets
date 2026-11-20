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
import { BoardOracle } from '../common/BoardOracle';
import {
  BoardKit,
  CELLS,
  SPAWN_VALUES,
  DIR_LEFT,
  DIR_RIGHT,
  DIR_UP,
  DIR_DOWN
} from '../common/Game2048TestKit';

/**
 * GameRule 补块行为测试套件。
 *
 * 生产实现只在「盘面字符串发生变化」时调用 randomNum，而 randomNum 只在存在
 * 零格时才会写入 2 或 4。本套件把这条规则拆成可观测的几条性质：moveInRow
 * 永不补块、move 变化后恰好多一个非零格、补块落在移动后的零格上、补块值只
 * 可能是 2 或 4、补块不覆盖任何已有牌、补块让总和增加 2 或 4。
 *
 * 由于补块位置与数值都是随机的，本套件只做集合与范围断言，不做概率断言。
 * 所有「移动后应有的盘面」都取自 BoardOracle，与被测实现不共享代码。
 */
export default function gameRuleMoveSpawnTest() {
  describe('gameRuleMoveSpawnTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveSpawnTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveSpawnTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0100
     * @tc.name moveInRowLeftKeepsZeroCount0100
     * @tc.desc Verify a merge free left line move never adds a tile so the zero count holds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowLeftKeepsZeroCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let zerosBefore: number = BoardKit.zeroPositions(before).length;
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowLeftKeepsZeroCount', rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(zerosBefore);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(zerosBefore).assertEqual(13);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0200
     * @tc.name moveInRowRightKeepsZeroCount0200
     * @tc.desc Verify a right line move without merge keeps the number of empty cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowRightKeepsZeroCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 4, 8, 0]);
      let zerosBefore: number = BoardKit.zeroPositions(before).length;
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowRightKeepsZeroCount', rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(zerosBefore);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0300
     * @tc.name moveInRowUpKeepsZeroCount0300
     * @tc.desc Verify a column move upwards never fills an empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowUpKeepsZeroCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([0, 2, 4, 8]);
      let zerosBefore: number = BoardKit.zeroPositions(before).length;
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_UP, 0);
      BoardKit.logBoard('moveSpawn_moveInRowUpKeepsZeroCount', rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(zerosBefore);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0400
     * @tc.name moveInRowDownKeepsZeroCount0400
     * @tc.desc Verify a column move downwards never fills an empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowDownKeepsZeroCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 4, 8, 0]);
      let zerosBefore: number = BoardKit.zeroPositions(before).length;
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_DOWN, 0);
      BoardKit.logBoard('moveSpawn_moveInRowDownKeepsZeroCount', rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(zerosBefore);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(rule.dataNumbers[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0500
     * @tc.name moveInRowMergeDropsOccupancy0500
     * @tc.desc Verify a line merge lowers the occupied count by one instead of spawning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowMergeDropsOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowMergeDropsOccupancy', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(BoardKit.countNonZero(before) - 1);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(14);
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0600
     * @tc.name moveInRowSlideKeepsOccupancy0600
     * @tc.desc Verify a merge free slide keeps the occupied count because nothing is spawned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowSlideKeepsOccupancy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowSlideKeepsOccupancy', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0700
     * @tc.name moveInRowKeepsSum0700
     * @tc.desc Verify a line move that does not spawn preserves the board sum exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowKeepsSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(before);
      let sumBefore: number = BoardKit.sum(before);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowKeepsSum', rule.dataNumbers);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(sumBefore);
      expect(sumBefore).assertEqual(16);
      expect(rule.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0800
     * @tc.name moveInRowSlideKeepsScoreZero0800
     * @tc.desc Verify a spawning free slide never awards score points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowSlideKeepsScoreZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowSlideKeepsScoreZero', rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      expect(rule.score === 0).assertTrue();
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_0900
     * @tc.name moveInRowMergeAddsScore0900
     * @tc.desc Verify a line merge still awards points even though it spawns no tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_moveInRowMergeAddsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.moveInRow(DIR_LEFT, 0);
      BoardKit.logBoard('moveSpawn_moveInRowMergeAddsScore', rule.dataNumbers);
      BoardKit.expectScore(rule, 4);
      expect(rule.score > 0).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1000
     * @tc.name moveLeftAddsOneTileOverOracle1000
     * @tc.desc Verify a changed left move leaves exactly one more tile than the oracle result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_leftAddsOneTileOverOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveSpawn_leftAddsOneTileOverOracle', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(BoardKit.countNonZero(expected) + 1);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1100
     * @tc.name moveRightAddsOneTileOverOracle1100
     * @tc.desc Verify a changed right move leaves exactly one more tile than the oracle result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_rightAddsOneTileOverOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 4, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      BoardKit.logBoard('moveSpawn_rightAddsOneTileOverOracle', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(BoardKit.countNonZero(expected) + 1);
      expect(rule.dataNumbers[3]).assertEqual(4);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_RIGHT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1200
     * @tc.name moveUpAddsOneTileOverOracle1200
     * @tc.desc Verify a changed up move leaves exactly one more tile than the oracle result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_upAddsOneTileOverOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([0, 2, 0, 4]);
      let expected: number[] = BoardOracle.move(before, DIR_UP);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      BoardKit.logBoard('moveSpawn_upAddsOneTileOverOracle', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(BoardKit.countNonZero(expected) + 1);
      expect(rule.dataNumbers[0]).assertEqual(2);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_UP);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1300
     * @tc.name moveDownAddsOneTileOverOracle1300
     * @tc.desc Verify a changed down move leaves exactly one more tile than the oracle result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_downAddsOneTileOverOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 0, 4, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_DOWN);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      BoardKit.logBoard('moveSpawn_downAddsOneTileOverOracle', rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(BoardKit.countNonZero(expected) + 1);
      expect(rule.dataNumbers[12]).assertEqual(4);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_DOWN);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1400
     * @tc.name spawnValueIsTwoOrFourSparse1400
     * @tc.desc Verify a spawn on a nearly empty board is a 2 or a 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_valueIsTwoOrFourSparse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_valueIsTwoOrFourSparse', after);
      expect(spawn >= 0).assertTrue();
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
      expect(SPAWN_VALUES.indexOf(after[spawn]) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1500
     * @tc.name spawnValueIsTwoOrFourDense1500
     * @tc.desc Verify the spawn that refills a dense board is a 2 or a 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_valueIsTwoOrFourDense', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.horizontalPairBoard();
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_valueIsTwoOrFourDense', after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
      expect(BoardKit.countNonZero(after)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1600
     * @tc.name spawnValueIsTwoOrFourAfterMerge1600
     * @tc.desc Verify the tile spawned after a merge is a 2 or a 4 as well
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_valueIsTwoOrFourAfterMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_valueIsTwoOrFourAfterMerge', after);
      expect(spawn >= 0).assertTrue();
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
      expect(after[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1700
     * @tc.name spawnValueIsPositiveAndEven1700
     * @tc.desc Verify a spawned tile is strictly positive and divisible by two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_valueIsPositiveAndEven', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      let spawned: number = after[spawn];
      BoardKit.logBoard('moveSpawn_valueIsPositiveAndEven', after);
      expect(spawned > 0).assertTrue();
      expect(spawned % 2).assertEqual(0);
      expect(spawned === 2 || spawned === 4).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1800
     * @tc.name spawnLandsOnOracleZeroLeft1800
     * @tc.desc Verify a left move spawns on a cell the oracle left empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_landsOnOracleZeroLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_landsOnOracleZeroLeft', after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(after[spawn] !== 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_1900
     * @tc.name spawnLandsOnOracleZeroRight1900
     * @tc.desc Verify a right move spawns on a cell the oracle left empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_landsOnOracleZeroRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 4, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_landsOnOracleZeroRight', after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(BoardKit.singleDifference(expected, after) >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2000
     * @tc.name spawnLandsOnOracleZeroUp2000
     * @tc.desc Verify an up move spawns on a cell the oracle left empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_landsOnOracleZeroUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([0, 2, 0, 4]);
      let expected: number[] = BoardOracle.move(before, DIR_UP);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_landsOnOracleZeroUp', after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2100
     * @tc.name spawnLandsOnOracleZeroDown2100
     * @tc.desc Verify a down move spawns on a cell the oracle left empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_landsOnOracleZeroDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([2, 0, 4, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_DOWN);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_landsOnOracleZeroDown', after);
      expect(spawn >= 0).assertTrue();
      expect(expected[spawn]).assertEqual(0);
      expect(BoardKit.zeroPositions(expected).length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2200
     * @tc.name spawnKeepsAllOracleTiles2200
     * @tc.desc Verify the spawn never replaces or changes any tile produced by the move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_keepsAllOracleTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
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
      let changedOracleCells: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (expected[index] !== 0 && after[index] !== expected[index]) {
          changedOracleCells = changedOracleCells + 1;
        }
      }
      BoardKit.logBoard('moveSpawn_keepsAllOracleTiles', after);
      expect(changedOracleCells).assertEqual(0);
      expect(after[0]).assertEqual(4);
      expect(after[8]).assertEqual(16);
      expect(BoardKit.describe(after)).assertContain('16');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2300
     * @tc.name spawnDoesNotOverwriteBigTile2300
     * @tc.desc Verify a spawned tile never lands on an existing big tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_doesNotOverwriteBigTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.withRow(BoardKit.row([1024, 1024, 0, 0]), 2, [4096, 0, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_doesNotOverwriteBigTile', after);
      expect(spawn >= 0).assertTrue();
      expect(BoardKit.positionsOf(after, 2048).length).assertEqual(1);
      expect(BoardKit.positionsOf(after, 4096).length).assertEqual(1);
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2400
     * @tc.name spawnIsSingleDifference2400
     * @tc.desc Verify a changed move differs from the oracle in exactly one cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_isSingleDifference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 2, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let differences: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (after[index] !== expected[index]) {
          differences = differences + 1;
        }
      }
      BoardKit.logBoard('moveSpawn_isSingleDifference', after);
      expect(differences).assertEqual(1);
      expect(BoardKit.singleDifference(expected, after) >= 0).assertTrue();
      expect(BoardKit.countNonZero(after)).assertEqual(BoardKit.countNonZero(expected) + 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2500
     * @tc.name spawnBoardRowShiftLeft2500
     * @tc.desc Verify a left row shift adds exactly one tile on the board shape one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardRowShiftLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardRowShiftLeft', after);
      expect(spawn >= 0).assertTrue();
      expect(BoardKit.countNonZero(after)).assertEqual(4);
      expect(BoardKit.sum(after) - BoardKit.sum(expected)).assertEqual(after[spawn]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2600
     * @tc.name spawnBoardRowMergeLeft2600
     * @tc.desc Verify a left row merge adds exactly one tile on the board shape two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardRowMergeLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardRowMergeLeft', after);
      expect(spawn >= 0).assertTrue();
      expect(after[0]).assertEqual(4);
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_LEFT));
      expect(BoardKit.countNonZero(after)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2700
     * @tc.name spawnBoardRowSlideRight2700
     * @tc.desc Verify a right row slide adds exactly one tile on the board shape three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardRowSlideRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardRowSlideRight', after);
      expect(spawn >= 0).assertTrue();
      expect(after[3]).assertEqual(2);
      expect(BoardKit.countNonZero(after)).assertEqual(2);
      expect(BoardKit.countNonZero(after)).assertEqual(BoardKit.countNonZero(expected) + 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2800
     * @tc.name spawnBoardRowMergeRight2800
     * @tc.desc Verify a right row merge adds exactly one tile on the board shape four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardRowMergeRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 0, 4, 4]);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardRowMergeRight', after);
      expect(spawn >= 0).assertTrue();
      expect(after[3]).assertEqual(8);
      expect(expected[3]).assertEqual(8);
      BoardKit.expectScore(rule, 8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_2900
     * @tc.name spawnBoardColumnMergeUp2900
     * @tc.desc Verify an upward column merge adds exactly one tile on the board shape five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardColumnMergeUp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([0, 8, 0, 8]);
      let expected: number[] = BoardOracle.move(before, DIR_UP);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardColumnMergeUp', after);
      expect(spawn >= 0).assertTrue();
      expect(after[0]).assertEqual(16);
      expect(expected[0]).assertEqual(16);
      expect(BoardKit.countNonZero(after)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3000
     * @tc.name spawnBoardColumnMergeDown3000
     * @tc.desc Verify a downward column merge adds exactly one tile on the board shape six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardColumnMergeDown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.column([16, 0, 16, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_DOWN);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_DOWN);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardColumnMergeDown', after);
      expect(spawn >= 0).assertTrue();
      expect(after[12]).assertEqual(32);
      expect(BoardKit.countNonZero(after)).assertEqual(2);
      expect(BoardKit.sum(after) - BoardKit.sum(expected)).assertEqual(after[spawn]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3100
     * @tc.name spawnBoardTwoRowsMerge3100
     * @tc.desc Verify two simultaneous row merges add exactly one tile on the board shape seven
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardTwoRowsMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.withRow(BoardKit.row([2, 2, 0, 0]), 1, [4, 4, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardTwoRowsMerge', after);
      expect(spawn >= 0).assertTrue();
      expect(after[0]).assertEqual(4);
      expect(after[4]).assertEqual(8);
      BoardKit.expectScore(rule, 12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3200
     * @tc.name spawnBoardFullOnePair3200
     * @tc.desc Verify a dense one pair board adds exactly one tile on the board shape eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardFullOnePair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.horizontalPairBoard();
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardFullOnePair', after);
      expect(spawn >= 0).assertTrue();
      expect(BoardKit.zeroPositions(expected).length).assertEqual(1);
      expect(BoardKit.countNonZero(after)).assertEqual(CELLS);
      expect(BoardKit.countNonZero(expected)).assertEqual(CELLS - 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3300
     * @tc.name spawnBoardCornerTileSlide3300
     * @tc.desc Verify a single corner tile sliding upwards adds one tile on the board shape nine
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardCornerTileSlide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[15] = 4;
      let expected: number[] = BoardOracle.move(before, DIR_UP);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardCornerTileSlide', after);
      expect(spawn >= 0).assertTrue();
      expect(after[3]).assertEqual(4);
      expect(expected[15]).assertEqual(0);
      expect(after[spawn] === 2 || after[spawn] === 4).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3400
     * @tc.name spawnBoardAlternatingSparse3400
     * @tc.desc Verify an alternating sparse row adds exactly one tile on the board shape ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_boardAlternatingSparse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.blank();
      before[13] = 2;
      before[15] = 2;
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_boardAlternatingSparse', after);
      expect(spawn >= 0).assertTrue();
      expect(after[12]).assertEqual(4);
      expect(BoardKit.countNonZero(after)).assertEqual(2);
      expect(BoardKit.zeroPositions(after).length).assertEqual(14);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3500
     * @tc.name fifteenTileBoardShiftsToFull3500
     * @tc.desc Verify a fifteen tile board can become full after a changed move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_fifteenTileBoardShiftsToFull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [0, 6, 10, 14],
        [10, 14, 18, 22],
        [14, 18, 22, 26],
        [18, 22, 26, 30]
      ]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveSpawn_fifteenTileBoardShiftsToFull', rule.dataNumbers);
      expect(BoardKit.countNonZero(before)).assertEqual(15);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
      expect(rule.isGameOver()).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3600
     * @tc.name fifteenTileBoardOccupancyGrowsByOne3600
     * @tc.desc Verify the fifteen tile board grows by exactly the single spawned tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_fifteenTileBoardOccupancyGrowsByOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.rows([
        [0, 6, 10, 14],
        [10, 14, 18, 22],
        [14, 18, 22, 26],
        [18, 22, 26, 30]
      ]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.logBoard('moveSpawn_fifteenTileBoardOccupancyGrowsByOne', after);
      expect(BoardKit.countNonZero(expected)).assertEqual(15);
      expect(BoardKit.countNonZero(after)).assertEqual(BoardKit.countNonZero(expected) + 1);
      expect(BoardKit.singleDifference(expected, after) >= 0).assertTrue();
      BoardKit.expectStatus(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3700
     * @tc.name fullBoardChangeFillsFreedCell3700
     * @tc.desc Verify a changed full board refills its single freed cell and stays full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_fullBoardChangeFillsFreedCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.horizontalPairBoard();
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let freed: number = BoardKit.zeroPositions(expected)[0];
      BoardKit.logBoard('moveSpawn_fullBoardChangeFillsFreedCell', after);
      expect(BoardKit.zeroPositions(expected).length).assertEqual(1);
      expect(after[freed] === 2 || after[freed] === 4).assertTrue();
      expect(BoardKit.countNonZero(after)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3800
     * @tc.name fullBoardChangeNeverExceedsSixteen3800
     * @tc.desc Verify a changed full board never reports more than sixteen occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_fullBoardChangeNeverExceedsSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.verticalPairBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_UP);
      let occupancy: number = BoardKit.countNonZero(rule.dataNumbers);
      BoardKit.logBoard('moveSpawn_fullBoardChangeNeverExceedsSixteen', rule.dataNumbers);
      expect(occupancy <= CELLS).assertTrue();
      expect(occupancy).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_3900
     * @tc.name fullBoardWithoutMergeDoesNotSpawn3900
     * @tc.desc Verify a full board with no merge step gets no spawn at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_fullBoardWithoutMergeDoesNotSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveSpawn_fullBoardWithoutMergeDoesNotSpawn', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectStatus(rule, -1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4000
     * @tc.name randomNumOnFullBoardIsInert4000
     * @tc.desc Verify the spawn helper reports false and writes nothing when no zero cell exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_randomNumOnFullBoardIsInert', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(before);
      let outcome: boolean = rule.randomNum();
      BoardKit.logBoard('moveSpawn_randomNumOnFullBoardIsInert', rule.dataNumbers);
      expect(outcome).assertFalse();
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4100
     * @tc.name fiveChangedMovesSpawnFiveTiles4100
     * @tc.desc Verify five changed moves in a row spawn exactly one tile each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_fiveChangedMovesSpawnFiveTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 4, 4]));
      let directions: string[] = [DIR_LEFT, DIR_UP, DIR_RIGHT, DIR_DOWN];
      let changedMoves: number = 0;
      let steps: number = 0;
      while (changedMoves < 5 && steps < 16) {
        let direction: string = directions[steps % 4];
        let before: number[] = BoardKit.valuesOf(rule);
        let expected: number[] = BoardOracle.move(before, direction);
        rule.move(direction);
        let after: number[] = BoardKit.valuesOf(rule);
        if (BoardKit.describe(expected) !== BoardKit.describe(before)) {
          expect(BoardKit.countNonZero(after)).assertEqual(BoardKit.countNonZero(expected) + 1);
          expect(BoardKit.singleDifference(expected, after) >= 0).assertTrue();
          changedMoves = changedMoves + 1;
        } else {
          BoardKit.expectValues(after, before);
        }
        steps = steps + 1;
      }
      BoardKit.log('moveSpawn_fiveChangedMovesSpawnFiveTiles', 'changed ' + changedMoves + ' steps ' + steps);
      expect(changedMoves).assertEqual(5);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4200
     * @tc.name unchangedMovesSpawnNothing4200
     * @tc.desc Verify moves that cannot change the board never call the spawn helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_unchangedMovesSpawnNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      let directions: string[] = [DIR_LEFT, DIR_UP];
      let spawns: number = 0;
      for (let step: number = 0; step < directions.length; step++) {
        let before: number[] = BoardKit.valuesOf(rule);
        rule.move(directions[step]);
        if (BoardKit.describe(rule.dataNumbers) !== BoardKit.describe(before)) {
          spawns = spawns + 1;
        }
      }
      BoardKit.logBoard('moveSpawn_unchangedMovesSpawnNothing', rule.dataNumbers);
      expect(spawns).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4300
     * @tc.name spawnIncreasesSumByTwoOrFour4300
     * @tc.desc Verify a spawn raises the board sum by exactly two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_increasesSumByTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 2, 4, 8]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let growth: number = BoardKit.sum(after) - BoardKit.sum(expected);
      BoardKit.log('moveSpawn_increasesSumByTwoOrFour', 'sum growth ' + growth);
      expect(growth === 2 || growth === 4).assertTrue();
      expect(SPAWN_VALUES.indexOf(growth) >= 0).assertTrue();
      expect(growth > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4400
     * @tc.name spawnSumGrowthEqualsSpawnValue4400
     * @tc.desc Verify the board sum growth equals the value of the spawned tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_sumGrowthEqualsSpawnValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 0, 0]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      let growth: number = BoardKit.sum(after) - BoardKit.sum(expected);
      BoardKit.logBoard('moveSpawn_sumGrowthEqualsSpawnValue', after);
      expect(spawn >= 0).assertTrue();
      expect(growth).assertEqual(after[spawn]);
      expect(growth === 2 || growth === 4).assertTrue();
      expect(BoardKit.sum(after) - BoardKit.sum(before)).assertEqual(after[spawn]);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4500
     * @tc.name spawnKeepsScoreOfMove4500
     * @tc.desc Verify the spawned tile contributes no score, only the merge does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_spawnKeepsScoreOfMove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 2, 4, 4]);
      let expectedScore: number = BoardOracle.mergeScore(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveSpawn_spawnKeepsScoreOfMove', rule.dataNumbers);
      expect(expectedScore).assertEqual(12);
      expect(rule.score).assertEqual(expectedScore);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4600
     * @tc.name spawnPositionWithinBoardRange4600
     * @tc.desc Verify every spawned position is a valid board index between zero and fifteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_positionWithinBoardRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let corner: number[] = BoardKit.blank();
      corner[15] = 2;
      let boards: number[][] = [
        BoardKit.row([0, 2, 4, 8]),
        BoardKit.row([2, 2, 0, 0]),
        BoardKit.column([0, 8, 0, 8]),
        BoardKit.withRow(BoardKit.row([2, 2, 0, 0]), 2, [4, 4, 0, 0]),
        corner
      ];
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN, DIR_LEFT];
      let outside: number = 0;
      let validSpawns: number = 0;
      for (let index: number = 0; index < boards.length; index++) {
        let before: number[] = boards[index];
        let expected: number[] = BoardOracle.move(before, directions[index]);
        let rule: GameRule = BoardKit.rule(before);
        rule.move(directions[index]);
        let after: number[] = BoardKit.valuesOf(rule);
        let spawn: number = BoardKit.singleDifference(expected, after);
        if (spawn < 0 || spawn >= CELLS) {
          outside = outside + 1;
        } else {
          validSpawns = validSpawns + 1;
        }
      }
      BoardKit.log('moveSpawn_positionWithinBoardRange', 'valid spawns ' + validSpawns);
      expect(outside).assertEqual(0);
      expect(validSpawns).assertEqual(boards.length);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4700
     * @tc.name spawnValueInAllowedSet4700
     * @tc.desc Verify every spawned value belongs to the allowed pair of tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_valueInAllowedSet', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boards: number[][] = [
        BoardKit.row([0, 2, 4, 8]),
        BoardKit.row([2, 0, 0, 0]),
        BoardKit.column([0, 2, 0, 4]),
        BoardKit.horizontalPairBoard()
      ];
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_LEFT];
      let illegal: number = 0;
      for (let index: number = 0; index < boards.length; index++) {
        let before: number[] = boards[index];
        let expected: number[] = BoardOracle.move(before, directions[index]);
        let rule: GameRule = BoardKit.rule(before);
        rule.move(directions[index]);
        let after: number[] = BoardKit.valuesOf(rule);
        let spawn: number = BoardKit.singleDifference(expected, after);
        if (spawn >= 0 && SPAWN_VALUES.indexOf(after[spawn]) < 0) {
          illegal = illegal + 1;
        }
      }
      BoardKit.log('moveSpawn_valueInAllowedSet', 'illegal spawns ' + illegal);
      expect(illegal).assertEqual(0);
      expect(SPAWN_VALUES.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4800
     * @tc.name spawnIndexIsIntegerInBounds4800
     * @tc.desc Verify the spawned cell index is a whole number inside the board range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_indexIsIntegerInBounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([0, 0, 2, 2]);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      let after: number[] = BoardKit.valuesOf(rule);
      let spawn: number = BoardKit.singleDifference(expected, after);
      BoardKit.logBoard('moveSpawn_indexIsIntegerInBounds', after);
      expect(spawn >= 0).assertTrue();
      expect(spawn % 1).assertEqual(0);
      expect(Math.floor(spawn)).assertEqual(spawn);
      expect(spawn < CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_4900
     * @tc.name noSpawnWhenSparseMoveUnchanged4900
     * @tc.desc Verify a lone tile already at the target edge produces no new tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_noSpawnWhenSparseMoveUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number[] = BoardKit.row([2, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(before);
      rule.move(DIR_LEFT);
      BoardKit.logBoard('moveSpawn_noSpawnWhenSparseMoveUnchanged', rule.dataNumbers);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULESPWAN_5000
     * @tc.name spawnNeverTouchesPreExistingTiles5000
     * @tc.desc Verify across five boards the spawn leaves every pre-existing tile intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveSpawn_neverTouchesPreExistingTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boards: number[][] = [
        BoardKit.row([0, 2, 4, 8]),
        BoardKit.row([2, 2, 0, 0]),
        BoardKit.column([0, 8, 0, 8]),
        BoardKit.withRow(BoardKit.row([2, 2, 0, 0]), 1, [4, 4, 0, 0]),
        BoardKit.horizontalPairBoard()
      ];
      let directions: string[] = [DIR_LEFT, DIR_LEFT, DIR_UP, DIR_LEFT, DIR_LEFT];
      let overwritten: number = 0;
      let spawns: number = 0;
      for (let index: number = 0; index < boards.length; index++) {
        let before: number[] = boards[index];
        let expected: number[] = BoardOracle.move(before, directions[index]);
        let rule: GameRule = BoardKit.rule(before);
        rule.move(directions[index]);
        let after: number[] = BoardKit.valuesOf(rule);
        for (let cell: number = 0; cell < CELLS; cell++) {
          if (expected[cell] !== 0 && after[cell] !== expected[cell]) {
            overwritten = overwritten + 1;
          }
        }
        if (BoardKit.singleDifference(expected, after) >= 0) {
          spawns = spawns + 1;
        }
      }
      BoardKit.log('moveSpawn_neverTouchesPreExistingTiles', 'spawns ' + spawns);
      expect(overwritten).assertEqual(0);
      expect(spawns).assertEqual(boards.length);
    });
  });
}
