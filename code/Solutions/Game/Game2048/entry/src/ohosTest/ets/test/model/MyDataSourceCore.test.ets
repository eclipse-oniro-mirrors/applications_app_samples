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
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/** Index of the last cell of a sixteen cell source. */
const SOURCE_LAST: number = CELLS - 1;

/**
 * 收集数据源每个单元格的 data 字段，保持数组顺序。
 * 用于把对象数组折叠成可直接比较与 assertContain 的数字数组。
 */
function valuesOf(source: MyDataSource): number[] {
  let values: number[] = [];
  for (let index: number = 0; index < source.dataArray.length; index++) {
    values.push(source.dataArray[index].data);
  }
  return values;
}

/**
 * 收集数据源每个单元格的 id 字段，保持数组顺序。
 */
function idsOf(source: MyDataSource): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < source.dataArray.length; index++) {
    ids.push(source.dataArray[index].id);
  }
  return ids;
}

/**
 * 构造一个十六格的数字数据源，第 i 格的值固定为 i * 2。
 */
function numberedSource(): MyDataSource {
  let values: number[] = [];
  for (let index: number = 0; index < CELLS; index++) {
    values.push(index * 2);
  }
  return new MyDataSource(BoardKit.data(values));
}

/**
 * MyDataSource 核心数据语义测试套件。
 *
 * 生产实现的数据源只有三个数据入口：dataArray 公开数组、totalCount 读数、
 * getData 按索引取引用。构造函数逐项 push 入参元素，因此保留元素引用但不保留
 * 源数组本身；addData 只有 splice(index, 0) 与通知两步，既不插入也不删除任何
 * 元素。本套件只固化这些数据层契约，不涉及监听器与业务场景。
 */
export default function myDataSourceCoreTest() {
  describe('myDataSourceCoreTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('myDataSourceCoreTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('myDataSourceCoreTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0100
     * @tc.name coreEmptySourceYieldsEmptyArray0100
     * @tc.desc Verify an empty input list yields a zero length data source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_emptySourceYieldsEmptyArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [];
      let source: MyDataSource = new MyDataSource(list);
      expect(source.dataArray.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(0);
      expect(source.dataArray.length === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0200
     * @tc.name coreSingleElementKeepsIt0200
     * @tc.desc Verify a one cell input stays one cell and keeps its id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_singleElementKeepsIt', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [new DataType(0, 2)];
      let source: MyDataSource = new MyDataSource(list);
      expect(source.dataArray.length).assertEqual(1);
      expect(source.totalCount()).assertEqual(1);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(0).id).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0300
     * @tc.name coreFourElementsKeepOrder0300
     * @tc.desc Verify four cells are stored in the order they were supplied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_fourElementsKeepOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [2, 4, 8, 16];
      let source: MyDataSource = new MyDataSource(BoardKit.data(values));
      expect(source.dataArray.length).assertEqual(4);
      expect(source.totalCount()).assertEqual(4);
      BoardKit.expectValues(valuesOf(source), values);
      expect(source.getData(3).data).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0400
     * @tc.name coreSixteenElementsKeepCount0400
     * @tc.desc Verify sixteen input cells produce sixteen readable cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_sixteenElementsKeepCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.dataArray.length).assertEqual(CELLS);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(0).data).assertEqual(0);
      expect(source.getData(SOURCE_LAST).data).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0500
     * @tc.name coreBuildsOwnArray0500
     * @tc.desc Verify the constructor builds a new array instead of aliasing the input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_buildsOwnArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 0, 0, 0, 0];
      let list: DataType[] = BoardKit.data(values);
      let source: MyDataSource = new MyDataSource(list);
      expect(source.dataArray === list).assertFalse();
      expect(source.dataArray.length).assertEqual(list.length);
      expect(source.getData(11).data).assertEqual(4096);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0600
     * @tc.name coreKeepsElementReferences0600
     * @tc.desc Verify stored cells are the very DataType instances supplied by the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_keepsElementReferences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data(BoardKit.repeatedRow([2, 4, 8, 16]));
      let source: MyDataSource = new MyDataSource(list);
      expect(list[0] === source.dataArray[0]).assertTrue();
      expect(list[7] === source.getData(7)).assertTrue();
      expect(list[SOURCE_LAST] === source.dataArray[SOURCE_LAST]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0700
     * @tc.name coreReflectsElementMutation0700
     * @tc.desc Verify mutating a source DataType is visible through getData because both share one object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_reflectsElementMutation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data([2, 4, 8, 16]);
      let source: MyDataSource = new MyDataSource(list);
      list[2].data = 1024;
      expect(source.getData(2).data).assertEqual(1024);
      expect(source.dataArray[2].data).assertEqual(1024);
      expect(source.getData(2).id).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0800
     * @tc.name coreIgnoresLaterSourcePush0800
     * @tc.desc Verify appending to the input array after construction cannot grow the data source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_ignoresLaterSourcePush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data(BoardKit.zeros(CELLS));
      let source: MyDataSource = new MyDataSource(list);
      list.push(new DataType(CELLS, 4096));
      expect(list.length).assertEqual(CELLS + 1);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(CELLS)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_0900
     * @tc.name coreIgnoresLaterSourceReplacement0900
     * @tc.desc Verify replacing an input slot keeps the originally stored cell reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_ignoresLaterSourceReplacement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data([2, 4, 8, 16]);
      let source: MyDataSource = new MyDataSource(list);
      let original: DataType = source.getData(2);
      list[2] = new DataType(2, 4096);
      expect(source.getData(2).data).assertEqual(8);
      expect(source.dataArray[2] === list[2]).assertFalse();
      expect(source.dataArray[2] === original).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1000
     * @tc.name coreIgnoresLaterSourceClear1000
     * @tc.desc Verify emptying the input array cannot empty the data source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_ignoresLaterSourceClear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data(BoardKit.repeatedRow([2, 4, 8, 16]));
      let source: MyDataSource = new MyDataSource(list);
      list.splice(0, list.length);
      expect(list.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(SOURCE_LAST).data).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1100
     * @tc.name corePreservesCustomIdOrder1100
     * @tc.desc Verify ids travel with their cells and do not drive the stored positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_preservesCustomIdOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let ids: number[] = [7, 3, 11, 0];
      let values: number[] = [2, 4, 8, 16];
      let list: DataType[] = BoardKit.dataWithIds(ids, values);
      let source: MyDataSource = new MyDataSource(list);
      BoardKit.expectValues(idsOf(source), ids);
      expect(source.getData(0).id).assertEqual(7);
      expect(source.getData(2).id).assertEqual(11);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1200
     * @tc.name coreKeepsDuplicateReferences1200
     * @tc.desc Verify the same cell supplied twice appears twice and stays one shared object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_keepsDuplicateReferences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let cell: DataType = new DataType(0, 2);
      let list: DataType[] = [cell, cell];
      let source: MyDataSource = new MyDataSource(list);
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0) === source.getData(1)).assertTrue();
      cell.data = 512;
      expect(source.getData(1).data).assertEqual(512);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1300
     * @tc.name coreTotalCountMatchesLength1300
     * @tc.desc Verify totalCount reports the live dataArray length exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_totalCountMatchesLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.totalCount()).assertEqual(source.dataArray.length);
      expect(source.totalCount() === CELLS).assertTrue();
      expect(source.totalCount() !== CELLS - 1).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1400
     * @tc.name coreTotalCountTracksPush1400
     * @tc.desc Verify a direct dataArray push immediately raises totalCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_totalCountTracksPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource(BoardKit.data(BoardKit.zeros(CELLS)));
      source.dataArray.push(new DataType(CELLS, 2));
      expect(source.totalCount()).assertEqual(CELLS + 1);
      expect(source.getData(CELLS).data).assertEqual(2);
      expect(source.dataArray.length).assertEqual(CELLS + 1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1500
     * @tc.name coreTotalCountTracksSplice1500
     * @tc.desc Verify a direct dataArray splice immediately lowers totalCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_totalCountTracksSplice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.splice(0, 4);
      expect(source.totalCount()).assertEqual(CELLS - 4);
      expect(source.getData(0).data).assertEqual(8);
      expect(source.getData(SOURCE_LAST - 4).data).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1600
     * @tc.name coreGetDataReadsEveryIndex1600
     * @tc.desc Verify getData returns the cell that belongs to each of the sixteen indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataReadsEveryIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      for (let index: number = 0; index < CELLS; index++) {
        expect(source.getData(index).data).assertEqual(index * 2);
        expect(source.getData(index).id).assertEqual(index);
      }
      expect(valuesOf(source)).assertContain(30);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1700
     * @tc.name coreGetDataReturnsStoredReference1700
     * @tc.desc Verify getData hands back the array slot itself rather than a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataReturnsStoredReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      for (let index: number = 0; index < CELLS; index++) {
        expect(source.getData(index) === source.dataArray[index]).assertTrue();
      }
      expect(source.getData(0) === source.dataArray[0]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1800
     * @tc.name coreGetDataRepeatCallsSameReference1800
     * @tc.desc Verify two reads of one index return one identical object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataRepeatCallsSameReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let first: DataType = source.getData(5);
      let second: DataType = source.getData(5);
      expect(first === second).assertTrue();
      expect(first.data).assertEqual(10);
      expect(second.data).assertEqual(10);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_1900
     * @tc.name coreGetDataAtLengthIsUndefined1900
     * @tc.desc Verify reading exactly one past the last cell yields undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataAtLengthIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(CELLS)).assertUndefined();
      expect(source.getData(CELLS) === undefined).assertTrue();
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2000
     * @tc.name coreGetDataFarBeyondIsUndefined2000
     * @tc.desc Verify a far out of range read yields undefined instead of a default cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataFarBeyondIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(1024)).assertUndefined();
      expect(source.getData(CELLS * 100)).assertUndefined();
      expect(source.getData(1024) !== undefined).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2100
     * @tc.name coreGetDataNegativeIsUndefined2100
     * @tc.desc Verify negative indices are not resolved from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataNegativeIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(-16)).assertUndefined();
      expect(source.getData(0).data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2200
     * @tc.name coreGetDataEmptySourceIsUndefined2200
     * @tc.desc Verify index zero of an empty data source is undefined rather than a blank cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataEmptySourceIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource([]);
      expect(source.getData(0)).assertUndefined();
      expect(source.getData(1)).assertUndefined();
      expect(source.totalCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2300
     * @tc.name coreGetDataPreservesId2300
     * @tc.desc Verify getData keeps the stored id instead of rewriting it to the index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_getDataPreservesId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [new DataType(99, 4)];
      let source: MyDataSource = new MyDataSource(list);
      expect(source.getData(0).id).assertEqual(99);
      expect(source.getData(0).data).assertEqual(4);
      expect(source.getData(0).id === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2400
     * @tc.name coreDataArrayAllowsReplacement2400
     * @tc.desc Verify a dataArray slot can be replaced and getData then serves the new cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_dataArrayAllowsReplacement', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let oldCell: DataType = source.dataArray[3];
      source.dataArray[3] = new DataType(3, 512);
      expect(source.getData(3).data).assertEqual(512);
      expect(source.getData(3) === oldCell).assertFalse();
      expect(oldCell.data).assertEqual(6);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2500
     * @tc.name coreDataArrayAllowsPush2500
     * @tc.desc Verify a caller can append a cell through the public dataArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_dataArrayAllowsPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.push(new DataType(CELLS, 4096));
      expect(source.totalCount()).assertEqual(CELLS + 1);
      expect(source.getData(CELLS).data).assertEqual(4096);
      expect(valuesOf(source)).assertContain(4096);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2600
     * @tc.name coreDataArrayAllowsSplice2600
     * @tc.desc Verify removing a middle cell shifts the following cells down one slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_dataArrayAllowsSplice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.splice(2, 1);
      expect(source.totalCount()).assertEqual(CELLS - 1);
      expect(source.getData(2).data).assertEqual(6);
      expect(source.getData(1).data).assertEqual(2);
      expect(source.getData(SOURCE_LAST - 1).data).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2700
     * @tc.name coreDataArrayAllowsReverse2700
     * @tc.desc Verify reversing the public array reverses what getData serves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_dataArrayAllowsReverse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.reverse();
      expect(source.getData(0).data).assertEqual(30);
      expect(source.getData(SOURCE_LAST).data).assertEqual(0);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(1).id).assertEqual(SOURCE_LAST - 1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2800
     * @tc.name coreDataArrayElementMutationVisible2800
     * @tc.desc Verify writing the data field through dataArray is visible through getData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_dataArrayElementMutationVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray[0].data = 2048;
      expect(source.getData(0).data).assertEqual(2048);
      expect(source.dataArray[0].data).assertEqual(2048);
      expect(source.getData(1).data).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_2900
     * @tc.name coreDataArrayCanBeReplaced2900
     * @tc.desc Verify the whole public array can be swapped and the old cells disappear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_dataArrayCanBeReplaced', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray = BoardKit.data([2, 4, 8, 16]);
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(3).data).assertEqual(16);
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3000
     * @tc.name coreAddDataKeepsLength3000
     * @tc.desc Verify addData leaves both the array length and totalCount unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataKeepsLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.addData(0, '2048');
      expect(source.dataArray.length).assertEqual(CELLS);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(SOURCE_LAST).data).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3100
     * @tc.name coreAddDataMiddleKeepsElements3100
     * @tc.desc Verify addData in the middle never shifts or inserts a cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataMiddleKeepsElements', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let before: number[] = valuesOf(source);
      source.addData(8, '4');
      BoardKit.expectValues(valuesOf(source), before);
      expect(source.getData(8).data).assertEqual(16);
      expect(source.getData(9).data).assertEqual(18);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3200
     * @tc.name coreAddDataAtEndDoesNotAppend3200
     * @tc.desc Verify addData at the length index cannot append a seventeenth cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataAtEndDoesNotAppend', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.addData(CELLS, '2');
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(CELLS)).assertUndefined();
      expect(source.getData(SOURCE_LAST).data).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3300
     * @tc.name coreAddDataOutOfRangeNoThrow3300
     * @tc.desc Verify addData with a far out of range index completes without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataOutOfRangeNoThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let threw: boolean = false;
      try {
        source.addData(99, '8');
      } catch (error) {
        threw = true;
        BoardKit.warn('core_addDataOutOfRangeNoThrow', 'addData threw for index 99');
      }
      expect(threw).assertFalse();
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(99)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3400
     * @tc.name coreAddDataNegativeIndexNoThrow3400
     * @tc.desc Verify addData with a negative index completes without throwing or removing cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataNegativeIndexNoThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let threw: boolean = false;
      try {
        source.addData(-1, '8');
      } catch (error) {
        threw = true;
        BoardKit.warn('core_addDataNegativeIndexNoThrow', 'addData threw for index -1');
      }
      expect(threw).assertFalse();
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(0).data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3500
     * @tc.name coreAddDataOnEmptyStaysEmpty3500
     * @tc.desc Verify addData on an empty source cannot create the first cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataOnEmptyStaysEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource([]);
      source.addData(0, '2');
      expect(source.totalCount()).assertEqual(0);
      expect(source.dataArray.length).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3600
     * @tc.name coreAddDataKeepsReferences3600
     * @tc.desc Verify addData keeps every existing cell as the same object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataKeepsReferences', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let first: DataType = source.dataArray[0];
      let middle: DataType = source.dataArray[8];
      let last: DataType = source.dataArray[SOURCE_LAST];
      source.addData(4, '1024');
      expect(source.dataArray[0] === first).assertTrue();
      expect(source.dataArray[8] === middle).assertTrue();
      expect(source.dataArray[SOURCE_LAST] === last).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3700
     * @tc.name coreAddDataTwiceKeepsLength3700
     * @tc.desc Verify two addData calls on one index still leave sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataTwiceKeepsLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.addData(3, '2');
      source.addData(3, '4');
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(3).data).assertEqual(6);
      expect(source.dataArray.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3800
     * @tc.name coreAddDataDiscardsPayload3800
     * @tc.desc Verify the string payload of addData never becomes a stored tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataDiscardsPayload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource(BoardKit.data(BoardKit.zeros(CELLS)));
      source.addData(5, '2048');
      let values: number[] = valuesOf(source);
      expect(values.indexOf(2048) >= 0).assertFalse();
      expect(values).assertContain(0);
      expect(values.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_3900
     * @tc.name coreAddDataEveryIndexKeepsCount3900
     * @tc.desc Verify sweeping addData across all sixteen indices never grows the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataEveryIndexKeepsCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      for (let index: number = 0; index < CELLS; index++) {
        source.addData(index, '2');
        expect(source.totalCount()).assertEqual(CELLS);
      }
      expect(source.getData(SOURCE_LAST).data).assertEqual(30);
      expect(source.dataArray.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4000
     * @tc.name coreAddDataDoesNotReorder4000
     * @tc.desc Verify a full value snapshot is identical before and after addData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataDoesNotReorder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource(BoardKit.data(BoardKit.repeatedRow([2, 4, 8, 16])));
      let before: number[] = valuesOf(source);
      source.addData(0, '16');
      source.addData(6, '16');
      BoardKit.expectValues(valuesOf(source), before);
      expect(source.totalCount()).assertEqual(before.length);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4100
     * @tc.name coreAddDataAfterPushKeepsSeventeen4100
     * @tc.desc Verify addData respects a manually grown array instead of resetting it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataAfterPushKeepsSeventeen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.push(new DataType(CELLS, 8192));
      source.addData(0, '2');
      expect(source.totalCount()).assertEqual(CELLS + 1);
      expect(source.getData(CELLS).data).assertEqual(8192);
      expect(source.getData(0).data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4200
     * @tc.name coreSixteenCellsRepresentativeValues4200
     * @tc.desc Verify a sixteen cell power of two source serves each cell at its own index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_sixteenCellsRepresentativeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(Math.pow(2, index + 1));
      }
      let source: MyDataSource = new MyDataSource(BoardKit.data(values));
      for (let index: number = 0; index < CELLS; index++) {
        expect(source.getData(index).data).assertEqual(Math.pow(2, index + 1));
      }
      expect(valuesOf(source)).assertContain(65536);
      expect(source.getData(0).data).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4300
     * @tc.name coreSixteenCellsIdsMatchIndices4300
     * @tc.desc Verify the ids built by the kit helper still match their slots one to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_sixteenCellsIdsMatchIndices', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let ids: number[] = idsOf(source);
      expect(ids.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(ids[index]).assertEqual(index);
        expect(source.dataArray[index].id).assertEqual(index);
      }
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4400
     * @tc.name coreInstancesOwnSeparateArrays4400
     * @tc.desc Verify two data sources never share their dataArray storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_instancesOwnSeparateArrays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: MyDataSource = new MyDataSource([]);
      let second: MyDataSource = new MyDataSource([]);
      expect(first.dataArray === second.dataArray).assertFalse();
      first.dataArray.push(new DataType(0, 2));
      expect(first.totalCount()).assertEqual(1);
      expect(second.totalCount()).assertEqual(0);
      expect(second.getData(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4500
     * @tc.name coreTruncationTracksCount4500
     * @tc.desc Verify lowering the array length in place drops the tail and lowers totalCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_truncationTracksCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.length = 4;
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3).data).assertEqual(6);
      expect(source.getData(4)).assertUndefined();
      expect(source.getData(SOURCE_LAST)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4600
     * @tc.name coreElementIdMutationVisible4600
     * @tc.desc Verify the id field is shared like data, so an id write is visible through getData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_elementIdMutationVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray[2].id = 77;
      expect(source.getData(2).id).assertEqual(77);
      expect(source.getData(2).data).assertEqual(4);
      expect(source.getData(0).id).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4700
     * @tc.name coreConstructorLeavesInputIntact4700
     * @tc.desc Verify construction only reads the input list and never rewrites its cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_constructorLeavesInputIntact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [2, 4, 8, 16];
      let list: DataType[] = BoardKit.data(values);
      let source: MyDataSource = new MyDataSource(list);
      expect(list.length).assertEqual(4);
      for (let index: number = 0; index < list.length; index++) {
        expect(list[index].id).assertEqual(index);
        expect(list[index].data).assertEqual(values[index]);
      }
      expect(source.dataArray[0] === list[0]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4800
     * @tc.name coreZeroCellIsStillACell4800
     * @tc.desc Verify a zero valued cell reads back as an object holding zero, not as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_zeroCellIsStillACell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data([0, 2, 0, 4]);
      let source: MyDataSource = new MyDataSource(list);
      expect(source.getData(0).data).assertEqual(0);
      expect(source.getData(2).data).assertEqual(0);
      expect(source.getData(0) === undefined).assertFalse();
      expect(source.getData(2) === undefined).assertFalse();
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(3).data).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_4900
     * @tc.name coreSortTracksGetData4900
     * @tc.desc Verify sorting the public array by value reorders what getData serves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_sortTracksGetData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource(BoardKit.data([16, 2, 8, 4]));
      source.dataArray.sort((left: DataType, right: DataType) => right.data - left.data);
      expect(source.getData(0).data).assertEqual(16);
      expect(source.getData(1).data).assertEqual(8);
      expect(source.getData(2).data).assertEqual(4);
      expect(source.getData(3).data).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_5000
     * @tc.name coreAddDataAfterTruncationKeepsFour5000
     * @tc.desc Verify addData leaves a manually truncated source at four cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_addDataAfterTruncationKeepsFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.length = 4;
      source.addData(2, '1024');
      expect(source.totalCount()).assertEqual(4);
      expect(source.getData(2).data).assertEqual(4);
      expect(source.getData(4)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_5100
     * @tc.name coreSharedInputKeepsSharedCells5100
     * @tc.desc Verify two sources built from one list own separate arrays but share every cell object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_sharedInputKeepsSharedCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = BoardKit.data([2, 4, 8, 16]);
      let first: MyDataSource = new MyDataSource(list);
      let second: MyDataSource = new MyDataSource(list);
      expect(first.dataArray === second.dataArray).assertFalse();
      expect(first.getData(1) === second.getData(1)).assertTrue();
      first.getData(1).data = 1024;
      expect(second.getData(1).data).assertEqual(1024);
      first.dataArray.push(new DataType(4, 32));
      expect(second.totalCount()).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCECORE_5200
     * @tc.name coreSparseInputKeepsHoles5200
     * @tc.desc Verify the constructor counts empty slots of a sparse list without filling them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('core_sparseInputKeepsHoles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [];
      list.length = 4;
      let source: MyDataSource = new MyDataSource(list);
      expect(list.length).assertEqual(4);
      expect(source.totalCount()).assertEqual(4);
      expect(source.dataArray.length).assertEqual(4);
      expect(source.getData(0)).assertUndefined();
      expect(source.dataArray[0] === undefined).assertTrue();
      expect(source.getData(3)).assertUndefined();
    });
  });
}
