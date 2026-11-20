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
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS, SIDE } from '../common/Game2048TestKit';

/** Index of the last cell on a 4x4 board. */
const LAST_INDEX: number = CELLS - 1;

/**
 * GameRule 构造函数测试套件。
 *
 * 生产实现把 Array<DataType> 逐项展开为纯数字棋盘，不做长度校验、不做数值
 * 校验、不排序、不去重，也不会调用 init()。本套件逐条固化这些契约，并验证
 * 构造后棋盘与入参之间不存在引用泄漏。
 */
export default function gameRuleConstructorTest() {
  describe('gameRuleConstructorTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleConstructorTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleConstructorTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0100
     * @tc.name constructorCopiesSixteenValues0100
     * @tc.desc Verify a sixteen element DataType list becomes a sixteen cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_copiesSixteenValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [
        0, 0, 0, 0,
        0, 2, 0, 0,
        0, 0, 4, 0,
        0, 0, 0, 0
      ];
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0200
     * @tc.name constructorPreservesAscendingOrder0200
     * @tc.desc Verify the constructor keeps insertion order instead of sorting tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_preservesAscendingOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index * 2);
      }
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[LAST_INDEX]).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0300
     * @tc.name constructorPreservesDescendingOrder0300
     * @tc.desc Verify a descending input keeps the descending arrangement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_preservesDescendingOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push((CELLS - index) * 2);
      }
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(32);
      expect(rule.dataNumbers[LAST_INDEX]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0400
     * @tc.name constructorAcceptsAllZeros0400
     * @tc.desc Verify sixteen zero cells are accepted without spawning tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsAllZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0500
     * @tc.name constructorAcceptsOneTileAtFirstCell0500
     * @tc.desc Verify a single tile placed at cell zero survives construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsOneTileAtFirstCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0600
     * @tc.name constructorAcceptsOneTileAtLastCell0600
     * @tc.desc Verify a single tile placed at the last cell survives construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsOneTileAtLastCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[LAST_INDEX] = 4;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[LAST_INDEX]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0700
     * @tc.name constructorAcceptsNegativeValues0700
     * @tc.desc Verify the constructor performs no tile value validation for negatives
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsNegativeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = -2;
      values[5] = -16;
      values[LAST_INDEX] = -1024;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[0]).assertEqual(-2);
      expect(rule.dataNumbers[5]).assertEqual(-16);
      expect(rule.dataNumbers[LAST_INDEX]).assertEqual(-1024);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0800
     * @tc.name constructorAcceptsNonPowerOfTwo0800
     * @tc.desc Verify values that are not powers of two are stored unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsNonPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33];
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(3);
      expect(rule.dataNumbers[LAST_INDEX]).assertEqual(33);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_0900
     * @tc.name constructorAcceptsLargeValues0900
     * @tc.desc Verify four digit tile values are stored without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsLargeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [
        4096, 8192, 16384, 32768,
        65536, 131072, 262144, 524288,
        1048576, 2097152, 4194304, 8388608,
        0, 0, 0, 0
      ];
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(4096);
      expect(rule.dataNumbers[7]).assertEqual(524288);
      expect(rule.dataNumbers[11]).assertEqual(8388608);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1000
     * @tc.name constructorAcceptsMixedMagnitudes1000
     * @tc.desc Verify small and large tiles coexist on one constructed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsMixedMagnitudes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [
        2, 1024, 4, 2048,
        8, 16, 32, 64,
        128, 256, 512, 4096,
        0, 0, 0, 0
      ];
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(12);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8190);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1100
     * @tc.name constructorAcceptsDuplicateValues1100
     * @tc.desc Verify duplicate tile values are kept instead of being collapsed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_acceptsDuplicateValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.zeros(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        values[index] = 2;
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1200
     * @tc.name constructorAcceptsSeventeenValues1200
     * @tc.desc Verify the constructor does not enforce a sixteen element ceiling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsSeventeenValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.zeros(17);
      values[16] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(17);
      expect(rule.dataNumbers[16]).assertEqual(2);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1300
     * @tc.name constructorAcceptsFifteenValues1300
     * @tc.desc Verify the constructor does not pad an undersized input to sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsFifteenValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.zeros(15);
      values[14] = 4;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(15);
      expect(rule.dataNumbers[14]).assertEqual(4);
      expect(rule.dataNumbers.length < CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1400
     * @tc.name constructorAcceptsEmptyList1400
     * @tc.desc Verify an empty DataType list produces an empty board array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsEmptyList', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [];
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers.length).assertEqual(0);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1500
     * @tc.name constructorAcceptsSingleItem1500
     * @tc.desc Verify a one element list produces a one cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsSingleItem', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [new DataType(0, 2)];
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers.length).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1600
     * @tc.name constructorAcceptsFourItems1600
     * @tc.desc Verify a four element list stays four cells long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsFourItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [
        new DataType(0, 2),
        new DataType(1, 4),
        new DataType(2, 8),
        new DataType(3, 16)
      ];
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers.length).assertEqual(SIDE);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1700
     * @tc.name constructorIgnoresNonSequentialIds1700
     * @tc.desc Verify non sequential ids do not affect cell placement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_ignoresNonSequentialIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ids: number[] = [101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116];
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[15] = 4;
      let list: DataType[] = BoardKit.dataWithIds(ids, values);
      let rule: GameRule = new GameRule(list);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1800
     * @tc.name constructorIgnoresDuplicateIds1800
     * @tc.desc Verify duplicated ids collapse to no effect on the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_ignoresDuplicateIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ids: number[] = BoardKit.zeros(CELLS);
      let values: number[] = BoardKit.blank();
      values[3] = 8;
      values[12] = 16;
      let list: DataType[] = BoardKit.dataWithIds(ids, values);
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_1900
     * @tc.name constructorIgnoresNegativeIds1900
     * @tc.desc Verify negative ids are irrelevant to the constructed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_ignoresNegativeIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let ids: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        ids.push(-index - 1);
      }
      let values: number[] = BoardKit.blank();
      values[7] = 32;
      let rule: GameRule = new GameRule(BoardKit.dataWithIds(ids, values));
      expect(rule.dataNumbers[7]).assertEqual(32);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2000
     * @tc.name constructorUsesDataFieldNotId2000
     * @tc.desc Verify the data field, not the id field, supplies cell values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_usesDataFieldNotId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        list.push(new DataType(index, index % 2 === 0 ? 2 : 4));
      }
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2100
     * @tc.name constructorDoesNotShareSourceObjects2100
     * @tc.desc Verify mutating a source DataType after construction cannot change the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_doesNotShareSourceObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let source: DataType[] = BoardKit.data(values);
      let rule: GameRule = new GameRule(source);
      source[0].data = 2048;
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(source[0].data).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2200
     * @tc.name constructorDoesNotShareSourceElements2200
     * @tc.desc Verify replacing a source array element cannot change the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_doesNotShareSourceElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[5] = 4;
      let source: DataType[] = BoardKit.data(values);
      let rule: GameRule = new GameRule(source);
      source[5] = new DataType(5, 4096);
      expect(rule.dataNumbers[5]).assertEqual(4);
      expect(source[5].data).assertEqual(4096);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2300
     * @tc.name constructorDoesNotTrackSourcePush2300
     * @tc.desc Verify appending to the source array cannot extend the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_doesNotTrackSourcePush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[1] = 2;
      let source: DataType[] = BoardKit.data(values);
      let rule: GameRule = new GameRule(source);
      source.push(new DataType(99, 8));
      expect(source.length).assertEqual(17);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2400
     * @tc.name constructorDoesNotTrackSourceSort2400
     * @tc.desc Verify sorting the source array after construction cannot reorder the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_doesNotTrackSourceSort', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 0, 0, 0, 0];
      let source: DataType[] = BoardKit.data(values);
      let rule: GameRule = new GameRule(source);
      source.sort((left: DataType, right: DataType) => right.data - left.data);
      expect(source[0].data).assertEqual(4096);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[11]).assertEqual(4096);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2500
     * @tc.name constructorLeavesSourceValuesIntact2500
     * @tc.desc Verify construction does not rewrite the data field of any source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_leavesSourceValuesIntact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [2, 0, 4, 0, 8, 0, 16, 0, 32, 0, 64, 0, 128, 0, 256, 0];
      let source: DataType[] = BoardKit.data(values);
      let rule: GameRule = new GameRule(source);
      for (let index: number = 0; index < CELLS; index++) {
        expect(source[index].data).assertEqual(values[index]);
      }
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2600
     * @tc.name constructorLeavesSourceIdsIntact2600
     * @tc.desc Verify construction does not rewrite the id field of any source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_leavesSourceIdsIntact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      let source: DataType[] = BoardKit.data(values);
      let rule: GameRule = new GameRule(source);
      for (let index: number = 0; index < CELLS; index++) {
        expect(source[index].id).assertEqual(index);
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2700
     * @tc.name constructorDoesNotReorderSource2700
     * @tc.desc Verify the source array keeps its original element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_doesNotReorderSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: DataType[] = [
        new DataType(4, 16),
        new DataType(2, 8),
        new DataType(0, 2),
        new DataType(1, 4)
      ];
      let rule: GameRule = new GameRule(source);
      expect(source[0].id).assertEqual(4);
      expect(source[1].id).assertEqual(2);
      expect(source[2].id).assertEqual(0);
      expect(source[3].id).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2800
     * @tc.name constructorUsesFreshBoardArray2800
     * @tc.desc Verify the board array is not the caller's DataType array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_usesFreshBoardArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: DataType[] = BoardKit.data(BoardKit.blank());
      let rule: GameRule = new GameRule(source);
      expect(rule.dataNumbers.length === source.length).assertTrue();
      rule.dataNumbers[0] = 2;
      expect(source[0].data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_2900
     * @tc.name constructorBoardsAreIndependent2900
     * @tc.desc Verify two rules built from the same source do not share board state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_boardsAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      let source: DataType[] = BoardKit.data(values);
      let first: GameRule = new GameRule(source);
      let second: GameRule = new GameRule(source);
      first.dataNumbers[1] = 4;
      first.score = 100;
      expect(second.dataNumbers[1]).assertEqual(0);
      expect(second.score).assertEqual(0);
      expect(second.dataNumbers[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3000
     * @tc.name constructorScoresAreIndependent3000
     * @tc.desc Verify score mutations on one rule never leak into another rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_scoresAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: DataType[] = BoardKit.data(BoardKit.blank());
      let first: GameRule = new GameRule(source);
      let second: GameRule = new GameRule(source);
      first.score = 2048;
      second.score = 4096;
      expect(first.score).assertEqual(2048);
      expect(second.score).assertEqual(4096);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3100
     * @tc.name constructorStatusesAreIndependent3100
     * @tc.desc Verify status mutations on one rule never leak into another rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_statusesAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: DataType[] = BoardKit.data(BoardKit.blank());
      let first: GameRule = new GameRule(source);
      let second: GameRule = new GameRule(source);
      first.status = GameStatus.RUNNING;
      expect(second.status).assertEqual(GameStatus.BEFORE);
      expect(first.status).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3200
     * @tc.name constructorScoreStartsAtZero3200
     * @tc.desc Verify a newly constructed rule always reports a zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_scoreStartsAtZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.score).assertEqual(0);
      expect(rule.score > 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3300
     * @tc.name constructorStatusStartsBefore3300
     * @tc.desc Verify a newly constructed rule reports the BEFORE status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_statusStartsBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status).assertEqual(-1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3400
     * @tc.name constructorStatusIsNotRunning3400
     * @tc.desc Verify construction alone cannot move the rule into the RUNNING status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_statusIsNotRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      expect(rule.status === GameStatus.RUNNING).assertFalse();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3500
     * @tc.name constructorStatusIsNotOver3500
     * @tc.desc Verify construction alone cannot move the rule into the OVER status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_statusIsNotOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      expect(rule.status === GameStatus.OVER).assertFalse();
      expect(rule.status !== GameStatus.OVER).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3600
     * @tc.name constructorDoesNotCallInit3600
     * @tc.desc Verify construction keeps the supplied empty board instead of spawning two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('constructor_doesNotCallInit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3700
     * @tc.name constructorKeepsSparseTiles3700
     * @tc.desc Verify a sparse board keeps exactly the supplied occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_keepsSparseTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[6] = 4;
      values[11] = 8;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(rule.dataNumbers[6]).assertEqual(4);
      expect(rule.dataNumbers[11]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3800
     * @tc.name constructorKeepsDenseTiles3800
     * @tc.desc Verify a fully occupied input stays fully occupied after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_keepsDenseTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectNoZero(rule.dataNumbers);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_3900
     * @tc.name constructorFromMyDataSourceArray3900
     * @tc.desc Verify a MyDataSource dataArray can seed a rule without conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_fromMyDataSourceArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[2] = 4;
      values[9] = 8;
      let source: MyDataSource = new MyDataSource(BoardKit.data(values));
      let rule: GameRule = new GameRule(source.dataArray);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[9]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4000
     * @tc.name constructorFromEmptyMyDataSource4000
     * @tc.desc Verify an empty MyDataSource yields an empty rule board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_fromEmptyMyDataSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let empty: DataType[] = [];
      let source: MyDataSource = new MyDataSource(empty);
      let rule: GameRule = new GameRule(source.dataArray);
      expect(source.totalCount()).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4100
     * @tc.name constructorFromMyDataSourceSixteen4100
     * @tc.desc Verify a sixteen element MyDataSource mirrors one to one into the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_fromMyDataSourceSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 0, 4, 0]);
      let source: MyDataSource = new MyDataSource(BoardKit.data(values));
      let rule: GameRule = new GameRule(source.dataArray);
      BoardKit.expectBoard(rule, values);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(1).data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4200
     * @tc.name constructorFromClonedRule4200
     * @tc.desc Verify a board can be cloned through a rule and rebuilt into a second rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_fromClonedRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [0, 0, 0, 0],
        [32, 64, 128, 256],
        [0, 0, 0, 0]
      ]);
      let first: GameRule = BoardKit.rule(values);
      let clone: number[] = first.dataNumbers.slice();
      let second: GameRule = BoardKit.rule(clone);
      BoardKit.expectBoard(second, values);
      first.dataNumbers[1] = 0;
      expect(second.dataNumbers[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4300
     * @tc.name constructorAcceptsFractionalValues4300
     * @tc.desc Verify fractional values are stored without rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsFractionalValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 1.5;
      values[1] = 2.25;
      values[2] = 0.5;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[0]).assertEqual(1.5);
      expect(rule.dataNumbers[1]).assertEqual(2.25);
      expect(rule.dataNumbers[2]).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4400
     * @tc.name constructorKeepsThirtyTwoItems4400
     * @tc.desc Verify a thirty two element list is fully expanded in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_keepsThirtyTwoItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.zeros(32);
      for (let index: number = 0; index < 32; index++) {
        values[index] = index;
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(32);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[31]).assertEqual(31);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4500
     * @tc.name constructorAcceptsAllSameValue4500
     * @tc.desc Verify sixteen identical tiles remain sixteen identical tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsAllSameValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(1024);
      }
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(16384);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4600
     * @tc.name constructorAcceptsAlternatingValues4600
     * @tc.desc Verify an alternating two value pattern is preserved cell by cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsAlternatingValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index % 2 === 0 ? 2 : 4);
      }
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[14]).assertEqual(2);
      expect(rule.dataNumbers[15]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4700
     * @tc.name constructorKeepsZerosAroundTiles4700
     * @tc.desc Verify zeros interleaved with tiles are not compacted by construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_keepsZerosAroundTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [0, 2, 0, 4, 0, 8, 0, 16, 0, 32, 0, 64, 0, 128, 0, 256];
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(128);
      expect(rule.dataNumbers[15]).assertEqual(256);
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4800
     * @tc.name constructorKeepsPowerOfTwoChain4800
     * @tc.desc Verify the full 2..65536 chain is preserved without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_keepsPowerOfTwoChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536];
      let rule: GameRule = BoardKit.rule(values);
      for (let index: number = 0; index < CELLS; index++) {
        expect(rule.dataNumbers[index]).assertEqual(Math.pow(2, index + 1));
      }
      BoardKit.expectBoard(rule, values);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_4900
     * @tc.name constructorDoesNotDeduplicate4900
     * @tc.desc Verify repeated identical entries all survive as separate cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_doesNotDeduplicate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = [2, 2, 2, 2, 4, 4, 4, 4, 8, 8, 8, 8, 16, 16, 16, 16];
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.positionsOf(rule.dataNumbers, 2).length).assertEqual(4);
      expect(BoardKit.positionsOf(rule.dataNumbers, 4).length).assertEqual(4);
      expect(BoardKit.positionsOf(rule.dataNumbers, 8).length).assertEqual(4);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5000
     * @tc.name constructorDoesNotResolveTileCollisions5000
     * @tc.desc Verify adjacent equal tiles stay adjacent instead of merging on construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_doesNotResolveTileCollisions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[1] = 2;
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5100
     * @tc.name constructorAllowsEmptyRowPattern5100
     * @tc.desc Verify a board with three empty rows keeps exactly one populated row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_allowsEmptyRowPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.rowOf(rule.dataNumbers, 1).every((value: number) => value === 0)).assertTrue();
      expect(BoardKit.rowOf(rule.dataNumbers, 2).every((value: number) => value === 0)).assertTrue();
      expect(BoardKit.rowOf(rule.dataNumbers, 3).every((value: number) => value === 0)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5200
     * @tc.name constructorAllowsEmptyColumnPattern5200
     * @tc.desc Verify a board with three empty columns keeps exactly one populated column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_allowsEmptyColumnPattern', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.column([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(BoardKit.columnOf(rule.dataNumbers, 1).every((value: number) => value === 0)).assertTrue();
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[12]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5300
     * @tc.name constructorZeroScoreAfterDenseBoard5300
     * @tc.desc Verify a dense board never pre-populates the score field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_zeroScoreAfterDenseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([8, 8, 8, 8]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.score).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5400
     * @tc.name constructorLeavesStatusAfterDenseBoard5400
     * @tc.desc Verify a dense board keeps the BEFORE status after construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_leavesStatusAfterDenseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5500
     * @tc.name constructorOverBoardIsStillBefore5500
     * @tc.desc Verify constructing from an over board does not auto-detect the over status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_overBoardIsStillBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.isGameOver()).assertTrue();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      expect(rule.status === GameStatus.OVER).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5600
     * @tc.name constructorAcceptsManualMutation5600
     * @tc.desc Verify a constructed board can be mutated in place by later assignments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsManualMutation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.dataNumbers[4] = 2;
      rule.dataNumbers[7] = 4;
      expect(rule.dataNumbers[4]).assertEqual(2);
      expect(rule.dataNumbers[7]).assertEqual(4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5700
     * @tc.name constructorReplacesBoardArray5700
     * @tc.desc Verify the public board field can be replaced wholesale
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_replacesBoardArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let replacement: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      rule.dataNumbers = replacement;
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5800
     * @tc.name constructorScoreFieldIsAssignable5800
     * @tc.desc Verify the public score field accepts an explicit value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_scoreFieldIsAssignable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.score = 512;
      expect(rule.score).assertEqual(512);
      rule.score = 0;
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_5900
     * @tc.name constructorStatusFieldIsAssignable5900
     * @tc.desc Verify the public status field accepts every enum member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_statusFieldIsAssignable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.status = GameStatus.RUNNING;
      expect(rule.status).assertEqual(1);
      rule.status = GameStatus.OVER;
      expect(rule.status).assertEqual(0);
      rule.status = GameStatus.BEFORE;
      expect(rule.status).assertEqual(-1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6000
     * @tc.name constructorAcceptsZerosOnlyInput6000
     * @tc.desc Verify an all zero input with trailing zeros keeps its exact shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsZerosOnlyInput', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.zeros(CELLS);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(0);
      BoardKit.expectAllZeros(rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6100
     * @tc.name constructorKeepsBoardTypeNumeric6100
     * @tc.desc Verify every constructed cell is a number that can be compared with zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_keepsBoardTypeNumeric', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 0, 4, 0]));
      let numeric: boolean = true;
      for (let index: number = 0; index < rule.dataNumbers.length; index++) {
        if (typeof rule.dataNumbers[index] !== 'number') {
          numeric = false;
        }
      }
      expect(numeric).assertTrue();
      expect(rule.dataNumbers[0] + 0).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6200
     * @tc.name constructorTwoSourcesDoNotInterfere6200
     * @tc.desc Verify rules built from different sources keep separate boards
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_twoSourcesDoNotInterfere', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let firstValues: number[] = BoardKit.repeatedRow([2, 2, 2, 2]);
      let secondValues: number[] = BoardKit.repeatedRow([4, 4, 4, 4]);
      let first: GameRule = BoardKit.rule(firstValues);
      let second: GameRule = BoardKit.rule(secondValues);
      expect(first.dataNumbers[0]).assertEqual(2);
      expect(second.dataNumbers[0]).assertEqual(4);
      first.dataNumbers[0] = 1024;
      expect(second.dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6300
     * @tc.name constructorEmptySourceLeavesBoardEmpty6300
     * @tc.desc Verify a source that is emptied before construction yields an empty board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_emptySourceLeavesBoardEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let source: DataType[] = BoardKit.data(BoardKit.repeatedRow([2, 4, 8, 16]));
      source.splice(0, source.length);
      let rule: GameRule = new GameRule(source);
      expect(source.length).assertEqual(0);
      expect(rule.dataNumbers.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6400
     * @tc.name constructorFullChainFromMatrix6400
     * @tc.desc Verify a row-major matrix input is flattened in row-major order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_fullChainFromMatrix', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [32, 64, 128, 256],
        [512, 1024, 2048, 4096],
        [8192, 16384, 32768, 65536]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[4]).assertEqual(32);
      expect(rule.dataNumbers[12]).assertEqual(8192);
      expect(rule.dataNumbers[15]).assertEqual(65536);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6500
     * @tc.name constructorBoardSurvivesRepeatedConstruction6500
     * @tc.desc Verify constructing many rules from the same source leaves the source stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_boardSurvivesRepeatedConstruction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let values: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      let source: DataType[] = BoardKit.data(values);
      for (let round: number = 0; round < 8; round++) {
        let rule: GameRule = new GameRule(source);
        expect(rule.dataNumbers.length).assertEqual(CELLS);
        expect(rule.dataNumbers[3]).assertEqual(16);
        rule.dataNumbers[3] = 0;
      }
      for (let index: number = 0; index < CELLS; index++) {
        expect(source[index].data).assertEqual(values[index]);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6600
     * @tc.name constructorAcceptsZeroIdWithTile6600
     * @tc.desc Verify an id of zero paired with a tile value still yields the tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_acceptsZeroIdWithTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [new DataType(0, 1024)];
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers.length).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(1024);
      expect(list[0].id).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6700
     * @tc.name constructorLengthMatchesSourceLength6700
     * @tc.desc Verify an arbitrary seven element source yields a seven cell board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_lengthMatchesSourceLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [
        new DataType(0, 2),
        new DataType(1, 4),
        new DataType(2, 8),
        new DataType(3, 16),
        new DataType(4, 32),
        new DataType(5, 64),
        new DataType(6, 128)
      ];
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers.length).assertEqual(list.length);
      expect(rule.dataNumbers[6]).assertEqual(128);
      expect(rule.dataNumbers.length === CELLS).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULECONSTRUCTOR_6800
     * @tc.name constructorDescendingIdsAscendingValues6800
     * @tc.desc Verify descending ids paired with ascending values do not reorder the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('constructor_descendingIdsAscendingValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        list.push(new DataType(CELLS - 1 - index, index + 2));
      }
      let rule: GameRule = new GameRule(list);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(3);
      expect(rule.dataNumbers[15]).assertEqual(17);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });
  });
}
