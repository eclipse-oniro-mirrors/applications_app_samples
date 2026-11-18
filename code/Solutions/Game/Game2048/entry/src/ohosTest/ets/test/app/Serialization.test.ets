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
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * 本地存档序列化契约测试套件。
 *
 * Index.handleLocalData('put') 用三个键落盘：
 *   gameData   <- JSON.stringify(this.dataNumbers)   // MyDataSource
 *   score      <- gameRule.score.toString()
 *   gameStatus <- gameRule.status.toString()
 * 读取侧（'has' 分支）再反向执行 JSON.parse 与 Number 还原。
 * 本套件逐条固化这三个键的往返契约，不读写 preferences 文件，因此不需要
 * ability 上下文；真实的落盘行为由 Persistence 套件覆盖。
 */

/** 棋盘首格下标。 */
const FIRST_INDEX: number = 0;
/** 棋盘末格下标。 */
const LAST_INDEX: number = CELLS - 1;
/** 一个典型的中局分数。 */
const SAMPLE_SCORE: number = 123456;
/** 一个接近 int 上限的分数。 */
const LARGE_SCORE: number = 999999999;

/** 按数值列表构造 DataType 列表，id 从 0 递增。 */
function dataList(values: number[]): DataType[] {
  let list: DataType[] = [];
  for (let index: number = 0; index < values.length; index++) {
    list.push(new DataType(index, values[index]));
  }
  return list;
}

/** 按数值列表构造 MyDataSource，与页面持有的实例同型。 */
function board(values: number[]): MyDataSource {
  return new MyDataSource(dataList(values));
}

/** 镜像 handleLocalData 的 gameData 写入：对整个数据源做 JSON 序列化。 */
function serialize(values: number[]): string {
  let text: string = JSON.stringify(board(values));
  return text;
}

/** 镜像 handleLocalData 的 gameData 读取：把文本还原成 MyDataSource 形状。 */
function restore(text: string): MyDataSource {
  let parsed: MyDataSource = JSON.parse(text) as MyDataSource;
  return parsed;
}

/** 序列化后直接取回某一格的数值。 */
function cellData(text: string, index: number): number {
  return restore(text).dataArray[index].data;
}

/** 镜像 score 写入：分数先转十进制字符串。 */
function scoreToText(score: number): string {
  return score.toString();
}

/** 镜像 gameStatus 写入：状态码先转十进制字符串。 */
function statusToText(status: number): string {
  return status.toString();
}

/** 镜像读取侧 Number(...) 还原。 */
function textToNumber(text: string): number {
  return Number(text);
}

/** 在单元格列表中查找第一个持有目标值的格子，找不到时返回 undefined。 */
function findCell(list: DataType[], target: number): DataType | undefined {
  for (let index: number = 0; index < list.length; index++) {
    if (list[index].data === target) {
      return list[index];
    }
  }
  return undefined;
}

/** 返回首格，空棋盘返回 null。 */
function firstCellOrNull(list: DataType[]): DataType | null {
  if (list.length === 0) {
    return null;
  }
  return list[0];
}

/** 十六格递增的满盘，用于检查完整往返。 */
const FULL_VALUES: number[] = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536];

/**
 * JSON 序列化契约测试套件。
 */
export default function serializationTest() {
  describe('serializationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('serializationTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('serializationTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0100
     * @tc.name serializationReturnsString0100
     * @tc.desc Verify serializing a board yields a non empty string payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_returnsString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(BoardKit.blank());
      expect(typeof text).assertEqual('string');
      expect(text.length > 0).assertTrue();
      expect(text.length === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0200
     * @tc.name serializationContainsDataArrayKey0200
     * @tc.desc Verify the payload names the dataArray field the read path depends on
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_containsDataArrayKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(BoardKit.row([2, 4, 8, 16]));
      expect(text).assertContain('"dataArray"');
      expect(text).assertContain('[');
      expect(text).assertContain(']');
      BoardKit.log('containsDataArrayKey', 'length ' + text.length);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0300
     * @tc.name serializationIsObjectText0300
     * @tc.desc Verify the payload is a JSON object, not a bare array or scalar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_isObjectText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(BoardKit.blank());
      expect(text.charAt(0)).assertEqual('{');
      expect(text.charAt(text.length - 1)).assertEqual('}');
      expect(text.charAt(0) === '[').assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0400
     * @tc.name serializationParseYieldsSixteenCells0400
     * @tc.desc Verify restoring a full board payload yields sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_parseYieldsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(BoardKit.blank()));
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(parsed.dataArray.length).assertEqual(16);
      expect(parsed.dataArray[FIRST_INDEX].id).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0500
     * @tc.name serializationParseYieldsObjectCells0500
     * @tc.desc Verify every restored element is an object carrying an id and a data field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_parseYieldsObjectCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(FULL_VALUES));
      expect(typeof parsed.dataArray[FIRST_INDEX]).assertEqual('object');
      expect(typeof parsed.dataArray[LAST_INDEX]).assertEqual('object');
      expect(typeof parsed.dataArray[FIRST_INDEX].id).assertEqual('number');
      expect(typeof parsed.dataArray[LAST_INDEX].data).assertEqual('number');
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0600
     * @tc.name serializationRestoresSequentialIds0600
     * @tc.desc Verify the id field of every cell survives the round trip unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_restoresSequentialIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(BoardKit.blank()));
      for (let index: number = 0; index < CELLS; index++) {
        expect(parsed.dataArray[index].id).assertEqual(index);
      }
      expect(parsed.dataArray[FIRST_INDEX].id === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0700
     * @tc.name serializationRestoresValueOrder0700
     * @tc.desc Verify cell values come back in the same index order they were written
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_restoresValueOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(FULL_VALUES);
      for (let index: number = 0; index < CELLS; index++) {
        expect(cellData(text, index)).assertEqual(FULL_VALUES[index]);
      }
      expect(cellData(text, FIRST_INDEX) === 2).assertTrue();
      expect(cellData(text, LAST_INDEX) === 65536).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0800
     * @tc.name serializationRestoresFirstCell0800
     * @tc.desc Verify a tile placed only in the first cell returns to the first cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_restoresFirstCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[FIRST_INDEX] = 2048;
      let text: string = serialize(values);
      expect(cellData(text, FIRST_INDEX)).assertEqual(2048);
      expect(cellData(text, LAST_INDEX)).assertEqual(0);
      expect(BoardKit.countNonZero(restore(text).dataArray.map((item: DataType) => item.data))).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_0900
     * @tc.name serializationRestoresLastCell0900
     * @tc.desc Verify a tile placed only in the last cell returns to the last cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_restoresLastCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[LAST_INDEX] = 131072;
      let text: string = serialize(values);
      expect(cellData(text, LAST_INDEX)).assertEqual(131072);
      expect(cellData(text, FIRST_INDEX)).assertEqual(0);
      expect(restore(text).dataArray.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1000
     * @tc.name serializationBlankBoardRoundTrip1000
     * @tc.desc Verify an empty board round trips as sixteen zero cells rather than nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_blankBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(BoardKit.blank());
      let parsed: MyDataSource = restore(text);
      expect(parsed.dataArray.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(parsed.dataArray[index].data).assertEqual(0);
      }
      expect(BoardKit.sum(parsed.dataArray.map((item: DataType) => item.data))).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1100
     * @tc.name serializationSingleTileRoundTrip1100
     * @tc.desc Verify a one tile board round trips with exactly one occupied cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_singleTileRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[5] = 4;
      let parsed: MyDataSource = restore(serialize(values));
      expect(parsed.dataArray[5].data).assertEqual(4);
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(parsed.dataArray[5].id).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1200
     * @tc.name serializationSparseBoardRoundTrip1200
     * @tc.desc Verify a sparse board keeps its gaps on both sides of the round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_sparseBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[6] = 8;
      values[11] = 64;
      let text: string = serialize(values);
      expect(cellData(text, 0)).assertEqual(2);
      expect(cellData(text, 6)).assertEqual(8);
      expect(cellData(text, 11)).assertEqual(64);
      expect(cellData(text, 7)).assertEqual(0);
      expect(cellData(text, 10)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1300
     * @tc.name serializationFullBoardRoundTrip1300
     * @tc.desc Verify a fully occupied board returns sixteen non zero cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_fullBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(FULL_VALUES);
      let parsed: MyDataSource = restore(text);
      expect(parsed.dataArray.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(parsed.dataArray[index].data > 0).assertTrue();
      }
      expect(parsed.dataArray[CELLS - 1].data === 65536).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1400
     * @tc.name serializationMixedMagnitudeRoundTrip1400
     * @tc.desc Verify small and large tiles coexist unchanged after a round trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_mixedMagnitudeRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [2, 1024, 4, 2048, 8, 16, 32, 64, 128, 256, 512, 4096, 0, 0, 0, 0];
      let text: string = serialize(values);
      for (let index: number = 0; index < values.length; index++) {
        expect(cellData(text, index)).assertEqual(values[index]);
      }
      BoardKit.log('mixedMagnitudeRoundTrip', 'cells ' + restore(text).dataArray.length);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1500
     * @tc.name serializationLargeTileRoundTrip1500
     * @tc.desc Verify a seven digit tile value is not truncated or rounded by the payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_largeTileRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[3] = 1048576;
      values[12] = 8388608;
      let text: string = serialize(values);
      expect(cellData(text, 3)).assertEqual(1048576);
      expect(cellData(text, 12)).assertEqual(8388608);
      expect(cellData(text, 3) === 1048576).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1600
     * @tc.name serializationFractionalTileRoundTrip1600
     * @tc.desc Verify fractional cell values survive the payload without rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_fractionalTileRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 1.5;
      values[1] = 2.25;
      values[2] = 0.5;
      let text: string = serialize(values);
      expect(cellData(text, 0)).assertEqual(1.5);
      expect(cellData(text, 1)).assertEqual(2.25);
      expect(cellData(text, 2)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1700
     * @tc.name serializationNegativeTileRoundTrip1700
     * @tc.desc Verify the payload performs no clamping on negative cell values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_negativeTileRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = -2;
      values[9] = -1024;
      let text: string = serialize(values);
      expect(cellData(text, 0)).assertEqual(-2);
      expect(cellData(text, 9)).assertEqual(-1024);
      expect(cellData(text, 0) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1800
     * @tc.name serializationZeroCellsPreserved1800
     * @tc.desc Verify empty cells are serialized explicitly instead of being dropped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_zeroCellsPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[8] = 16;
      let parsed: MyDataSource = restore(serialize(values));
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(BoardKit.zeroPositions(parsed.dataArray.map((item: DataType) => item.data)).length).assertEqual(15);
      expect(parsed.dataArray[0].data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_1900
     * @tc.name serializationDuplicateTilesRoundTrip1900
     * @tc.desc Verify repeated equal tiles are restored as separate cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_duplicateTilesRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 2, 4, 4]);
      let parsed: MyDataSource = restore(serialize(values));
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(BoardKit.positionsOf(parsed.dataArray.map((item: DataType) => item.data), 2).length).assertEqual(8);
      expect(BoardKit.positionsOf(parsed.dataArray.map((item: DataType) => item.data), 4).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2000
     * @tc.name serializationParsedCellsAreDistinctObjects2000
     * @tc.desc Verify restoring produces one object per cell instead of aliasing one object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_parsedCellsAreDistinctObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(FULL_VALUES));
      expect(parsed.dataArray[0] === parsed.dataArray[1]).assertFalse();
      expect(parsed.dataArray[0] !== parsed.dataArray[1]).assertTrue();
      expect(parsed.dataArray[0].data).assertEqual(2);
      expect(parsed.dataArray[1].data).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2100
     * @tc.name serializationParsedMutationLeavesSource2100
     * @tc.desc Verify editing a restored cell cannot modify the instance that was serialized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_parsedMutationLeavesSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = board(FULL_VALUES);
      let parsed: MyDataSource = restore(JSON.stringify(source));
      parsed.dataArray[0].data = 999999;
      expect(parsed.dataArray[0].data).assertEqual(999999);
      expect(source.dataArray[0].data).assertEqual(2);
      expect(source.dataArray[0].data === 999999).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2200
     * @tc.name serializationSourceMutationLeavesParsed2200
     * @tc.desc Verify editing the source instance cannot modify an already restored copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_sourceMutationLeavesParsed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = board(FULL_VALUES);
      let parsed: MyDataSource = restore(JSON.stringify(source));
      source.dataArray[1].data = 128;
      expect(source.dataArray[1].data).assertEqual(128);
      expect(parsed.dataArray[1].data).assertEqual(4);
      expect(parsed.dataArray[1].data === 128).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2300
     * @tc.name serializationRepeatedSerializeIsStable2300
     * @tc.desc Verify serializing the same unchanged board twice yields identical text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_repeatedSerializeIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.repeatedRow([2, 0, 4, 0]);
      let first: string = serialize(values);
      let second: string = serialize(values);
      expect(first).assertEqual(second);
      expect(first.length).assertEqual(second.length);
      BoardKit.log('repeatedSerializeIsStable', 'length ' + first.length);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2400
     * @tc.name serializationRepeatedParseIsStable2400
     * @tc.desc Verify two restores of one payload agree on values but not on identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_repeatedParseIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(FULL_VALUES);
      let first: MyDataSource = restore(text);
      let second: MyDataSource = restore(text);
      expect(first.dataArray.length).assertEqual(second.dataArray.length);
      expect(first.dataArray[3].data).assertEqual(second.dataArray[3].data);
      expect(first.dataArray[0] === second.dataArray[0]).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2500
     * @tc.name serializationRestoreThenReserialize2500
     * @tc.desc Verify a restored payload can be serialized again without losing cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_restoreThenReserialize', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let firstText: string = serialize(FULL_VALUES);
      let restored: MyDataSource = restore(firstText);
      let secondText: string = JSON.stringify(restored);
      expect(secondText).assertContain('"dataArray"');
      expect(restore(secondText).dataArray.length).assertEqual(CELLS);
      expect(cellData(secondText, 15)).assertEqual(65536);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2600
     * @tc.name serializationScoreZeroRoundTrip2600
     * @tc.desc Verify a zero score round trips through its decimal string form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_scoreZeroRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = scoreToText(0);
      expect(text).assertEqual('0');
      expect(textToNumber(text)).assertEqual(0);
      expect(text.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2700
     * @tc.name serializationScoreSampleRoundTrip2700
     * @tc.desc Verify a typical in game score is restored by Number without drift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_scoreSampleRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = scoreToText(SAMPLE_SCORE);
      expect(text).assertEqual('123456');
      expect(textToNumber(text)).assertEqual(SAMPLE_SCORE);
      expect(textToNumber(text) === SAMPLE_SCORE).assertTrue();
      expect(textToNumber(text) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2800
     * @tc.name serializationScoreLargeRoundTrip2800
     * @tc.desc Verify a nine digit score keeps every digit through the string form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_scoreLargeRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = scoreToText(LARGE_SCORE);
      expect(text).assertEqual('999999999');
      expect(textToNumber(text)).assertEqual(LARGE_SCORE);
      expect(text.length).assertEqual(9);
      BoardKit.log('scoreLargeRoundTrip', 'text ' + text);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_2900
     * @tc.name serializationScoreTextHasNoFraction2900
     * @tc.desc Verify the score string form never carries a decimal point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_scoreTextHasNoFraction', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = scoreToText(SAMPLE_SCORE);
      expect(text.indexOf('.') < 0).assertTrue();
      expect(text).assertContain('123');
      expect(textToNumber(text) % 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3000
     * @tc.name serializationStatusBeforeRoundTrip3000
     * @tc.desc Verify the BEFORE status round trips through the signed string minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusBeforeRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = statusToText(GameStatus.BEFORE);
      expect(text).assertEqual('-1');
      expect(textToNumber(text)).assertEqual(GameStatus.BEFORE);
      expect(textToNumber(text)).assertEqual(-1);
      expect(textToNumber(text) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3100
     * @tc.name serializationStatusRunningRoundTrip3100
     * @tc.desc Verify the RUNNING status round trips through the string one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusRunningRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = statusToText(GameStatus.RUNNING);
      expect(text).assertEqual('1');
      expect(textToNumber(text)).assertEqual(GameStatus.RUNNING);
      expect(textToNumber(text) === 1).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3200
     * @tc.name serializationStatusOverRoundTrip3200
     * @tc.desc Verify the OVER status round trips through the string zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusOverRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = statusToText(GameStatus.OVER);
      expect(text).assertEqual('0');
      expect(textToNumber(text)).assertEqual(GameStatus.OVER);
      expect(textToNumber(text) === 0).assertTrue();
      expect(textToNumber(text) > 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3300
     * @tc.name serializationStatusTextsAreDistinct3300
     * @tc.desc Verify the three status strings stay pairwise distinct after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusTextsAreDistinct', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: string = statusToText(GameStatus.BEFORE);
      let running: string = statusToText(GameStatus.RUNNING);
      let over: string = statusToText(GameStatus.OVER);
      expect(before === running).assertFalse();
      expect(before === over).assertFalse();
      expect(running === over).assertFalse();
      expect(before).assertContain('-');
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3400
     * @tc.name serializationStatusDistinctAfterRoundTrip3400
     * @tc.desc Verify Number restores the three statuses into distinct numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusDistinctAfterRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let before: number = textToNumber(statusToText(GameStatus.BEFORE));
      let running: number = textToNumber(statusToText(GameStatus.RUNNING));
      let over: number = textToNumber(statusToText(GameStatus.OVER));
      expect(before).assertEqual(-1);
      expect(running).assertEqual(1);
      expect(over).assertEqual(0);
      expect(before === over).assertFalse();
      expect(running === over).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3500
     * @tc.name serializationStatusNegativeTextHasSign3500
     * @tc.desc Verify the BEFORE status keeps its minus sign and two character length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusNegativeTextHasSign', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = statusToText(GameStatus.BEFORE);
      expect(text.charAt(0)).assertEqual('-');
      expect(text.length).assertEqual(2);
      expect(text === '1').assertFalse();
      expect(textToNumber(text) === 1).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3600
     * @tc.name serializationStatusTextIsInteger3600
     * @tc.desc Verify the status string parses back to a whole number for every member
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_statusTextIsInteger', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let statuses: number[] = [GameStatus.BEFORE, GameStatus.RUNNING, GameStatus.OVER];
      for (let index: number = 0; index < statuses.length; index++) {
        let value: number = textToNumber(statusToText(statuses[index]));
        expect(value % 1).assertEqual(0);
        expect(value).assertEqual(statuses[index]);
      }
      expect(statuses.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3700
     * @tc.name serializationFindCellUndefined3700
     * @tc.desc Verify looking up a tile the board does not hold reports undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_findCellUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(BoardKit.blank()));
      let missing: DataType | undefined = findCell(parsed.dataArray, 2048);
      let zeroCell: DataType | undefined = findCell(parsed.dataArray, 0);
      expect(missing).assertUndefined();
      expect(zeroCell === undefined).assertFalse();
      if (zeroCell !== undefined) {
        expect(zeroCell.data).assertEqual(0);
        expect(zeroCell.id).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3800
     * @tc.name serializationFindCellReturnsTile3800
     * @tc.desc Verify a restored tile can be located by its value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_findCellReturnsTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(FULL_VALUES));
      let found: DataType | undefined = findCell(parsed.dataArray, 512);
      expect(found === undefined).assertFalse();
      if (found !== undefined) {
        expect(found.id).assertEqual(8);
        expect(found.data).assertEqual(512);
      }
      expect(findCell(parsed.dataArray, 131072)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_3900
     * @tc.name serializationFirstCellNullForEmpty3900
     * @tc.desc Verify an empty cell list has no first cell instead of a zero cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_firstCellNullForEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let emptyList: DataType[] = [];
      let empty: MyDataSource = new MyDataSource(emptyList);
      let first: DataType | null = firstCellOrNull(empty.dataArray);
      expect(first).assertNull();
      expect(empty.totalCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4000
     * @tc.name serializationEmptyBoardRoundTrip4000
     * @tc.desc Verify a data source without cells serializes to an empty dataArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_emptyBoardRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let emptyList: DataType[] = [];
      let empty: MyDataSource = new MyDataSource(emptyList);
      let text: string = JSON.stringify(empty);
      let parsed: MyDataSource = restore(text);
      expect(text).assertContain('"dataArray":[]');
      expect(parsed.dataArray.length).assertEqual(0);
      expect(firstCellOrNull(parsed.dataArray)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4100
     * @tc.name serializationEmptyBoardKeepsKey4100
     * @tc.desc Verify even an empty board payload keeps the key the read path probes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_emptyBoardKeepsKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let emptyList: DataType[] = [];
      let text: string = JSON.stringify(new MyDataSource(emptyList));
      expect(text).assertContain('dataArray');
      expect(text.length > 0).assertTrue();
      expect(text.length === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4200
     * @tc.name serializationNestedIdentityDiffers4200
     * @tc.desc Verify a restored cell object is not the same instance as the source cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_nestedIdentityDiffers', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = board(FULL_VALUES);
      let parsed: MyDataSource = restore(JSON.stringify(source));
      expect(parsed.dataArray[0] === source.dataArray[0]).assertFalse();
      expect(parsed.dataArray[0] !== source.dataArray[0]).assertTrue();
      expect(parsed.dataArray[0].data).assertEqual(source.dataArray[0].data);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4300
     * @tc.name serializationDataArrayIsArray4300
     * @tc.desc Verify the restored dataArray is a real array with a countable length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_dataArrayIsArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(FULL_VALUES));
      expect(Array.isArray(parsed.dataArray)).assertTrue();
      expect(parsed.dataArray.length).assertEqual(CELLS);
      expect(parsed.dataArray.length === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4400
     * @tc.name serializationFourBoardsRoundTrip4400
     * @tc.desc Verify four differently shaped boards all round trip with tenancy preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_fourBoardsRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boards: number[][] = [
        BoardKit.blank(),
        BoardKit.row([2, 4, 8, 16]),
        BoardKit.column([2, 4, 8, 16]),
        FULL_VALUES
      ];
      for (let index: number = 0; index < boards.length; index++) {
        let parsed: MyDataSource = restore(serialize(boards[index]));
        expect(parsed.dataArray.length).assertEqual(CELLS);
        expect(parsed.dataArray.length).assertEqual(boards[index].length);
      }
      expect(boards.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4500
     * @tc.name serializationBoardJsonIsLongText4500
     * @tc.desc Verify a full board payload is a long single string that survives one write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_boardJsonIsLongText', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = serialize(FULL_VALUES);
      expect(text.length > 100).assertTrue();
      expect(text.length < 4096).assertTrue();
      expect(text.indexOf('\n') < 0).assertTrue();
      BoardKit.log('boardJsonIsLongText', 'length ' + text.length);
    });

    /**
     * @tc.number SUB_GAME2048_SERIALIZATION_4600
     * @tc.name serializationCellsKeepNumericType4600
     * @tc.desc Verify every restored cell reports a numeric data field, never a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('serialization_cellsKeepNumericType', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let parsed: MyDataSource = restore(serialize(FULL_VALUES));
      let numeric: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (typeof parsed.dataArray[index].data !== 'number') {
          numeric = false;
        }
      }
      expect(numeric).assertTrue();
      expect(typeof parsed.dataArray[0].data).assertEqual('number');
      expect(parsed.dataArray[0].data + 0).assertEqual(2);
      expect(parsed.dataArray.length).assertEqual(FULL_VALUES.length);
    });
  });
}
