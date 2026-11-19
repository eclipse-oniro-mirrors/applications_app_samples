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

/**
 * MyDataSource 访问器测试套件。
 *
 * 生产实现的 totalCount 直接返回 dataArray.length，getData 直接返回
 * dataArray[index]，既不做下标校验也不做拷贝。本套件只固化这两条读路径的
 * 契约：计数与数组长度始终一致、越界返回 undefined、拿到的就是数组里的同一个
 * 对象。通知与监听器生命周期不在本套件范围内。
 */

/**
 * 构造一个十六格数据源，第 i 格的 id 为 i、data 为 2 * (i + 1)。
 * 每格数值互不相同，便于逐下标定位错位。
 */
function numberedSource(): MyDataSource {
  let list: DataType[] = [];
  for (let index: number = 0; index < CELLS; index++) {
    list.push(new DataType(index, (index + 1) * 2));
  }
  return new MyDataSource(list);
}

/**
 * 构造一个没有任何格子的数据源，用于空数据集上的读路径。
 */
function emptySource(): MyDataSource {
  let list: DataType[] = [];
  return new MyDataSource(list);
}

/**
 * 按 id 查找格子，找不到时返回 null。
 * 用 null 而不是 undefined 表达“确实查过但没有命中”。
 */
function cellById(source: MyDataSource, id: number): DataType | null {
  for (let index: number = 0; index < source.dataArray.length; index++) {
    if (source.dataArray[index].id === id) {
      return source.dataArray[index];
    }
  }
  return null;
}

/**
 * 按数组顺序收集每一格的 data 字段。
 */
function tileValues(source: MyDataSource): number[] {
  let values: number[] = [];
  for (let index: number = 0; index < source.dataArray.length; index++) {
    values.push(source.dataArray[index].data);
  }
  return values;
}

/**
 * 通过 getData 逐个下标收集 data 字段，用于与数组直读结果对照。
 */
function tileValuesThroughGetData(source: MyDataSource): number[] {
  let values: number[] = [];
  for (let index: number = 0; index < source.totalCount(); index++) {
    values.push(source.getData(index).data);
  }
  return values;
}

/**
 * MyDataSource 访问器测试套件。
 */
export default function myDataSourceAccessTest() {
  describe('myDataSourceAccessTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('myDataSourceAccessTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('myDataSourceAccessTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0100
     * @tc.name totalCountMatchesSixteenCellArray0100
     * @tc.desc Verify totalCount reports the sixteen cells backing a full board source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountMatchesSixteenCellArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.dataArray.length).assertEqual(CELLS);
      expect(source.totalCount()).assertEqual(source.dataArray.length);
      expect(source.totalCount() === 0).assertFalse();
      BoardKit.log('access_totalCountMatchesSixteenCellArray', 'count=' + source.totalCount());
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0200
     * @tc.name totalCountMatchesEmptySource0200
     * @tc.desc Verify a source built from zero cells reports a zero count instead of a default size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountMatchesEmptySource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = emptySource();
      expect(source.totalCount()).assertEqual(0);
      expect(source.dataArray.length).assertEqual(0);
      expect(source.totalCount()).assertEqual(source.dataArray.length);
      expect(source.totalCount() > 0).assertFalse();
      BoardKit.log('access_totalCountMatchesEmptySource', 'count=0');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0300
     * @tc.name totalCountMatchesSingleCell0300
     * @tc.desc Verify a one cell input reports one cell rather than being padded to a board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountMatchesSingleCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [new DataType(0, 2)];
      let source: MyDataSource = new MyDataSource(list);
      expect(source.totalCount()).assertEqual(1);
      expect(source.dataArray.length).assertEqual(1);
      expect(source.totalCount() === CELLS).assertFalse();
      expect(source.getData(0).data).assertEqual(2);
      BoardKit.log('access_totalCountMatchesSingleCell', 'count=1');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0400
     * @tc.name totalCountMatchesFiveCells0400
     * @tc.desc Verify an arbitrary five cell input keeps a five cell count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountMatchesFiveCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [
        new DataType(0, 2),
        new DataType(1, 4),
        new DataType(2, 8),
        new DataType(3, 16),
        new DataType(4, 32)
      ];
      let source: MyDataSource = new MyDataSource(list);
      expect(source.totalCount()).assertEqual(5);
      expect(source.dataArray.length).assertEqual(5);
      expect(source.getData(4).data).assertEqual(32);
      expect(source.totalCount()).assertEqual(list.length);
      BoardKit.log('access_totalCountMatchesFiveCells', 'count=5');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0500
     * @tc.name totalCountTracksDirectPush0500
     * @tc.desc Verify totalCount reads the live array length, so a direct push is counted immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountTracksDirectPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.push(new DataType(CELLS, 64));
      expect(source.totalCount()).assertEqual(CELLS + 1);
      expect(source.dataArray.length).assertEqual(17);
      expect(source.getData(CELLS).data).assertEqual(64);
      expect(source.getData(CELLS).id).assertEqual(16);
      BoardKit.log('access_totalCountTracksDirectPush', 'count=' + source.totalCount());
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0600
     * @tc.name totalCountTracksDirectSplice0600
     * @tc.desc Verify totalCount shrinks by one after the head cell is spliced out of the public array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountTracksDirectSplice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.splice(0, 1);
      expect(source.totalCount()).assertEqual(CELLS - 1);
      expect(source.dataArray.length).assertEqual(15);
      expect(source.getData(0).id).assertEqual(1);
      expect(source.getData(0).data).assertEqual(4);
      BoardKit.log('access_totalCountTracksDirectSplice', 'count=' + source.totalCount());
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0700
     * @tc.name totalCountAfterReplacingDataArray0700
     * @tc.desc Verify assigning a new array to the public field makes totalCount follow the new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountAfterReplacingDataArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let replacement: DataType[] = [
        new DataType(0, 2),
        new DataType(1, 4),
        new DataType(2, 8),
        new DataType(3, 16)
      ];
      source.dataArray = replacement;
      expect(source.totalCount()).assertEqual(4);
      expect(source.dataArray.length).assertEqual(4);
      expect(source.getData(3).data).assertEqual(16);
      expect(source.getData(4)).assertUndefined();
      BoardKit.log('access_totalCountAfterReplacingDataArray', 'count=4');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0800
     * @tc.name getDataReturnsFirstCell0800
     * @tc.desc Verify getData at index zero returns the head cell with its id and tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataReturnsFirstCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let head: DataType = source.getData(0);
      expect(head.id).assertEqual(0);
      expect(head.data).assertEqual(2);
      expect(head.data).assertEqual(source.dataArray[0].data);
      expect(head.id).assertEqual(source.dataArray[0].id);
      BoardKit.log('access_getDataReturnsFirstCell', 'head data=' + head.data);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_0900
     * @tc.name getDataReturnsLastCell0900
     * @tc.desc Verify getData at the last board index returns the tail cell without off by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataReturnsLastCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let tail: DataType = source.getData(CELLS - 1);
      expect(tail.id).assertEqual(15);
      expect(tail.data).assertEqual(32);
      expect(tail.data).assertEqual(source.dataArray[CELLS - 1].data);
      expect(source.getData(CELLS) === undefined).assertTrue();
      BoardKit.log('access_getDataReturnsLastCell', 'tail data=' + tail.data);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1000
     * @tc.name getDataIndexFiveMatchesArray1000
     * @tc.desc Verify a middle index agrees with the array at both the id and the data field
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataIndexFiveMatchesArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let middle: DataType = source.getData(5);
      expect(middle.id).assertEqual(5);
      expect(middle.data).assertEqual(12);
      expect(middle.data).assertEqual(source.dataArray[5].data);
      expect(middle.id).assertEqual(source.dataArray[5].id);
      BoardKit.log('access_getDataIndexFiveMatchesArray', 'middle data=' + middle.data);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1100
     * @tc.name everyIndexMatchesDataArray1100
     * @tc.desc Verify getData and the public array agree on id and data at all sixteen indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_everyIndexMatchesDataArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let mismatch: number = -1;
      for (let index: number = 0; index < CELLS; index++) {
        if (source.getData(index).data !== source.dataArray[index].data ||
          source.getData(index).id !== source.dataArray[index].id) {
          mismatch = index;
        }
      }
      expect(mismatch).assertEqual(-1);
      expect(source.getData(7).data).assertEqual(16);
      expect(source.getData(12).data).assertEqual(26);
      BoardKit.log('access_everyIndexMatchesDataArray', 'mismatch=' + mismatch);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1200
     * @tc.name everyIndexReturnsSameObject1200
     * @tc.desc Verify getData returns the very array element rather than a copy at every index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_everyIndexReturnsSameObject', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let shared: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (source.getData(index) !== source.dataArray[index]) {
          shared = false;
        }
      }
      expect(shared).assertTrue();
      expect(source.getData(0) === source.dataArray[0]).assertTrue();
      expect(source.getData(CELLS - 1) === source.dataArray[CELLS - 1]).assertTrue();
      BoardKit.log('access_everyIndexReturnsSameObject', 'identity shared at every index');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1300
     * @tc.name consecutiveCallsShareReference1300
     * @tc.desc Verify two consecutive getData calls at the same index yield the identical object and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_consecutiveCallsShareReference', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let first: DataType = source.getData(9);
      let second: DataType = source.getData(9);
      expect(first === second).assertTrue();
      expect(first.data).assertEqual(second.data);
      expect(first.id).assertEqual(second.id);
      expect(first.data).assertEqual(20);
      BoardKit.log('access_consecutiveCallsShareReference', 'two calls, one object');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1400
     * @tc.name distinctIndicesReturnDistinctObjects1400
     * @tc.desc Verify different indices never alias each other, so per cell mutation stays local
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_distinctIndicesReturnDistinctObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(0) === source.getData(1)).assertFalse();
      expect(source.getData(0) === source.getData(CELLS - 1)).assertFalse();
      expect(source.getData(7) === source.getData(8)).assertFalse();
      expect(source.getData(5).data === source.getData(6).data).assertFalse();
      BoardKit.log('access_distinctIndicesReturnDistinctObjects', 'cells are not aliases');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1500
     * @tc.name indexSixteenIsUndefined1500
     * @tc.desc Verify the index one past the last board cell returns undefined without resizing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_indexSixteenIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(CELLS)).assertUndefined();
      expect(source.getData(CELLS) === undefined).assertTrue();
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.dataArray.length).assertEqual(CELLS);
      BoardKit.log('access_indexSixteenIsUndefined', 'index 16 undefined');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1600
     * @tc.name negativeIndexIsUndefined1600
     * @tc.desc Verify the negative index minus one reads as a missing cell rather than the last cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_negativeIndexIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(-1)).assertUndefined();
      expect(source.getData(-1) === undefined).assertTrue();
      expect(source.getData(-1) === source.getData(CELLS - 1)).assertFalse();
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('access_negativeIndexIsUndefined', 'index -1 undefined');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1700
     * @tc.name emptySourceGetDataZeroIsUndefined1700
     * @tc.desc Verify reading index zero of an empty source returns undefined instead of a placeholder cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_emptySourceGetDataZeroIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = emptySource();
      expect(source.getData(0)).assertUndefined();
      expect(source.getData(0) === undefined).assertTrue();
      expect(source.totalCount()).assertEqual(0);
      expect(source.dataArray.length).assertEqual(0);
      BoardKit.log('access_emptySourceGetDataZeroIsUndefined', 'empty source has no cell zero');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1800
     * @tc.name indexAfterSpliceIsUndefined1800
     * @tc.desc Verify the index freed by removing the tail cell reads as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_indexAfterSpliceIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.splice(CELLS - 1, 1);
      expect(source.totalCount()).assertEqual(CELLS - 1);
      expect(source.getData(CELLS - 1)).assertUndefined();
      expect(source.getData(CELLS - 2).data).assertEqual(30);
      BoardKit.log('access_indexAfterSpliceIsUndefined', 'freed index reads undefined');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_1900
     * @tc.name getDataDoesNotChangeTotalCount1900
     * @tc.desc Verify repeated reads never grow the source, so the count equals sixteen after every read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataDoesNotChangeTotalCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let stable: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        source.getData(index);
        if (source.totalCount() !== CELLS) {
          stable = false;
        }
      }
      expect(stable).assertTrue();
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.dataArray.length).assertEqual(CELLS);
      BoardKit.log('access_getDataDoesNotChangeTotalCount', 'count stays 16');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2000
     * @tc.name getDataDoesNotRewriteValues2000
     * @tc.desc Verify a full read pass leaves every stored tile value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataDoesNotRewriteValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let before: number[] = tileValues(source);
      for (let index: number = 0; index < CELLS; index++) {
        source.getData(index);
      }
      let after: number[] = tileValues(source);
      expect(after.length).assertEqual(before.length);
      let same: boolean = true;
      for (let index: number = 0; index < before.length; index++) {
        if (before[index] !== after[index]) {
          same = false;
        }
      }
      expect(same).assertTrue();
      expect(after[0]).assertEqual(2);
      expect(after[CELLS - 1]).assertEqual(32);
      BoardKit.log('access_getDataDoesNotRewriteValues', 'values unchanged after read pass');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2100
     * @tc.name returnedCellDataMutationVisible2100
     * @tc.desc Verify writing the data field through the returned cell is visible in the public array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_returnedCellDataMutationVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let cell: DataType = source.getData(0);
      cell.data = 64;
      expect(source.dataArray[0].data).assertEqual(64);
      expect(source.getData(0).data).assertEqual(64);
      expect(source.dataArray.length).assertEqual(CELLS);
      BoardKit.log('access_returnedCellDataMutationVisible', 'data=64 visible through array');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2200
     * @tc.name returnedCellIdMutationVisible2200
     * @tc.desc Verify writing the id field through the returned cell is visible to the next getData call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_returnedCellIdMutationVisible', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let cell: DataType = source.getData(7);
      cell.id = 70;
      expect(source.dataArray[7].id).assertEqual(70);
      expect(source.getData(7).id).assertEqual(70);
      expect(source.getData(7).data).assertEqual(16);
      BoardKit.log('access_returnedCellIdMutationVisible', 'id=70 visible through array');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2300
     * @tc.name numericSliceMatchesGetDataValues2300
     * @tc.desc Verify the values harvested through getData reproduce the expected tile sequence exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_numericSliceMatchesGetDataValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let values: number[] = tileValuesThroughGetData(source);
      expect(values.length).assertEqual(CELLS);
      let expected: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        expected.push((index + 1) * 2);
      }
      let same: boolean = true;
      for (let index: number = 0; index < expected.length; index++) {
        if (values[index] !== expected[index]) {
          same = false;
        }
      }
      expect(same).assertTrue();
      expect(values[0]).assertEqual(2);
      expect(values[CELLS - 1]).assertEqual(32);
      BoardKit.log('access_numericSliceMatchesGetDataValues', 'sequence reproduced');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2400
     * @tc.name dataArrayMutationVisibleThroughGetData2400
     * @tc.desc Verify writing the public array first is visible to a later getData call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_dataArrayMutationVisibleThroughGetData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray[9].data = 512;
      expect(source.getData(9).data).assertEqual(512);
      expect(source.getData(9) === source.dataArray[9]).assertTrue();
      expect(source.getData(8).data).assertEqual(18);
      BoardKit.log('access_dataArrayMutationVisibleThroughGetData', 'array write visible through getData');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2500
     * @tc.name constructorSharesElementObjects2500
     * @tc.desc Verify the constructor copies the container but keeps the caller's cell objects shared
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_constructorSharesElementObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        list.push(new DataType(index, (index + 1) * 2));
      }
      let source: MyDataSource = new MyDataSource(list);
      list[2].data = 128;
      expect(source.getData(2).data).assertEqual(128);
      expect(source.getData(2) === list[2]).assertTrue();
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('access_constructorSharesElementObjects', 'cell objects shared with caller');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2600
     * @tc.name constructorDoesNotTrackSourcePush2600
     * @tc.desc Verify appending to the caller's array after construction does not extend the data source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_constructorDoesNotTrackSourcePush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        list.push(new DataType(index, (index + 1) * 2));
      }
      let source: MyDataSource = new MyDataSource(list);
      list.push(new DataType(CELLS, 64));
      expect(list.length).assertEqual(17);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(CELLS)).assertUndefined();
      expect(source.totalCount() === list.length).assertFalse();
      BoardKit.log('access_constructorDoesNotTrackSourcePush', 'source length fixed at construction');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2700
     * @tc.name zeroValuedCellIsStillDefined2700
     * @tc.desc Verify an empty board cell holding zero is still a real cell object, not a missing entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_zeroValuedCellIsStillDefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = new MyDataSource(BoardKit.data(BoardKit.blank()));
      let cell: DataType = source.getData(0);
      expect(cell === undefined).assertFalse();
      expect(cell.data).assertEqual(0);
      expect(cell.id).assertEqual(0);
      expect(source.dataArray[0].data).assertEqual(0);
      BoardKit.log('access_zeroValuedCellIsStillDefined', 'zero tile is a defined cell');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2800
     * @tc.name cellByIdReturnsMatchingCell2800
     * @tc.desc Verify searching by id finds the same object that getData returns at that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_cellByIdReturnsMatchingCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let found: DataType | null = cellById(source, 5);
      expect(found === null).assertFalse();
      let cell: DataType = found as DataType;
      expect(cell.data).assertEqual(12);
      expect(cell === source.getData(5)).assertTrue();
      BoardKit.log('access_cellByIdReturnsMatchingCell', 'id 5 found at index 5');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_2900
     * @tc.name cellByIdReturnsNullForAbsentId2900
     * @tc.desc Verify an id that no cell carries yields null rather than an arbitrary neighbour cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_cellByIdReturnsNullForAbsentId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(cellById(source, 999)).assertNull();
      expect(cellById(source, -1)).assertNull();
      expect(cellById(source, CELLS)).assertNull();
      BoardKit.log('access_cellByIdReturnsNullForAbsentId', 'absent ids read as null');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3000
     * @tc.name emptySourceCellByIdReturnsNull3000
     * @tc.desc Verify searching an empty source returns null for every id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_emptySourceCellByIdReturnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = emptySource();
      expect(cellById(source, 0)).assertNull();
      expect(source.totalCount()).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      BoardKit.log('access_emptySourceCellByIdReturnsNull', 'empty source has no cells');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3100
     * @tc.name collectedValuesContainExpectedTile3100
     * @tc.desc Verify the harvested tile list contains the tail value 32 and spans exactly sixteen entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_collectedValuesContainExpectedTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let values: number[] = tileValues(source);
      expect(values.length).assertEqual(CELLS);
      expect(values).assertContain(32);
      expect(values).assertContain(2);
      expect(values[0]).assertEqual(2);
      expect(values[CELLS - 1]).assertEqual(32);
      BoardKit.log('access_collectedValuesContainExpectedTile', 'tile list complete');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3200
     * @tc.name totalCountIgnoresIdValues3200
     * @tc.desc Verify arbitrary id values do not influence the count or the indexed reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_totalCountIgnoresIdValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [];
      let values: number[] = BoardKit.blank();
      for (let index: number = 0; index < CELLS; index++) {
        list.push(new DataType(100 + index, values[index]));
      }
      let source: MyDataSource = new MyDataSource(list);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(0).id).assertEqual(100);
      expect(source.getData(CELLS - 1).id).assertEqual(115);
      expect(source.getData(0).data).assertEqual(0);
      BoardKit.log('access_totalCountIgnoresIdValues', 'ids do not affect reads');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3300
     * @tc.name getDataFractionalIndexIsUndefined3300
     * @tc.desc Verify a fractional index addresses no array slot and therefore reads as undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataFractionalIndexIsUndefined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(1.5)).assertUndefined();
      expect(source.getData(0.5) === undefined).assertTrue();
      expect(source.getData(1).data).assertEqual(4);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('access_getDataFractionalIndexIsUndefined', 'fractional index undefined');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3400
     * @tc.name getDataBoundaryFollowsPush3400
     * @tc.desc Verify the readable boundary moves with the array, so index sixteen turns defined after a push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataBoundaryFollowsPush', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      expect(source.getData(CELLS)).assertUndefined();
      source.dataArray.push(new DataType(CELLS, 128));
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(CELLS) === undefined).assertFalse();
      expect(source.getData(CELLS).data).assertEqual(128);
      expect(source.getData(17)).assertUndefined();
      BoardKit.log('access_getDataBoundaryFollowsPush', 'boundary moved to 17');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3500
     * @tc.name getDataFollowsReplacedArray3500
     * @tc.desc Verify getData reads through the current public array rather than the array captured at construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_getDataFollowsReplacedArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let oldHead: DataType = source.getData(0);
      let replacement: DataType[] = [new DataType(0, 4096), new DataType(1, 2048)];
      source.dataArray = replacement;
      expect(source.totalCount()).assertEqual(2);
      expect(source.getData(0).data).assertEqual(4096);
      expect(source.getData(0) === oldHead).assertFalse();
      expect(source.getData(2)).assertUndefined();
      BoardKit.log('access_getDataFollowsReplacedArray', 'reads follow the new array');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3600
     * @tc.name clearAllCellsLeavesEmptyReads3600
     * @tc.desc Verify removing every cell drops the count to zero and makes index zero unreadable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_clearAllCellsLeavesEmptyReads', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      source.dataArray.splice(0, source.dataArray.length);
      expect(source.totalCount()).assertEqual(0);
      expect(source.dataArray.length).assertEqual(0);
      expect(source.getData(0)).assertUndefined();
      expect(source.getData(CELLS - 1)).assertUndefined();
      BoardKit.log('access_clearAllCellsLeavesEmptyReads', 'cleared source is unreadable');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3700
     * @tc.name elementReplacementVisibleThroughGetData3700
     * @tc.desc Verify replacing an array slot, unlike mutating a cell, is visible only through the new object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_elementReplacementVisibleThroughGetData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = numberedSource();
      let oldCell: DataType = source.getData(6);
      let replacement: DataType = new DataType(6, 2048);
      source.dataArray[6] = replacement;
      expect(source.getData(6) === replacement).assertTrue();
      expect(source.getData(6) === oldCell).assertFalse();
      expect(source.getData(6).data).assertEqual(2048);
      expect(oldCell.data).assertEqual(14);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('access_elementReplacementVisibleThroughGetData', 'replacement object visible');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3800
     * @tc.name duplicateIdsDoNotAffectIndexReads3800
     * @tc.desc Verify repeated ids leave index addressing intact, so cell position never depends on id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_duplicateIdsDoNotAffectIndexReads', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let list: DataType[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        list.push(new DataType(7, (index + 1) * 2));
      }
      let source: MyDataSource = new MyDataSource(list);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(0).id).assertEqual(7);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(CELLS - 1).id).assertEqual(7);
      expect(source.getData(CELLS - 1).data).assertEqual(32);
      BoardKit.log('access_duplicateIdsDoNotAffectIndexReads', 'ids do not drive addressing');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_3900
     * @tc.name seventeenCellSourceIsNotClamped3900
     * @tc.desc Verify the read path imposes no sixteen cell ceiling, so a seventeenth cell stays readable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_seventeenCellSourceIsNotClamped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.zeros(17);
      values[16] = 2;
      let source: MyDataSource = new MyDataSource(BoardKit.data(values));
      expect(source.totalCount()).assertEqual(17);
      expect(source.getData(16) === undefined).assertFalse();
      expect(source.getData(16).data).assertEqual(2);
      expect(source.getData(16).id).assertEqual(16);
      expect(source.getData(17)).assertUndefined();
      BoardKit.log('access_seventeenCellSourceIsNotClamped', 'seventeenth cell readable');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCEACCESS_4000
     * @tc.name twoSourcesReadIndependently4000
     * @tc.desc Verify reads from two sources never leak into each other, even when their cell values collide
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('access_twoSourcesReadIndependently', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let first: MyDataSource = numberedSource();
      let second: MyDataSource = new MyDataSource(BoardKit.data(BoardKit.blank()));
      expect(first.getData(0).data).assertEqual(2);
      expect(second.getData(0).data).assertEqual(0);
      second.getData(0).data = 128;
      expect(first.getData(0).data).assertEqual(2);
      expect(second.getData(0).data).assertEqual(128);
      expect(first.totalCount()).assertEqual(second.totalCount());
      BoardKit.log('access_twoSourcesReadIndependently', 'sources independent');
    });
  });
}
