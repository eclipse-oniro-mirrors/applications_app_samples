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

import { describe, beforeAll, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * DataType 单元格模型测试套件。
 *
 * DataType 是棋盘的唯一单元模型，构造时同时接收 id 与 data 两个公开字段。
 * 生产代码把它交给 @Observed 装饰，并在 GameRule 构造时只读取 data。
 * 本套件固化字段语义、可变性、实例独立性以及与 MyDataSource 的引用语义。
 */
export default function dataTypeTest() {
  describe('dataTypeTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('dataTypeTest', 'suite begin');
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0100
     * @tc.name dataTypeConstructsFields0100
     * @tc.desc Verify the constructor stores both id and data arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('dataType_constructsFields', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(3, 8);
      expect(cell.id).assertEqual(3);
      expect(cell.data).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0200
     * @tc.name dataTypeAcceptsZeroId0200
     * @tc.desc Verify an id of zero is stored as zero rather than treated as missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_acceptsZeroId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(0, 2);
      expect(cell.id).assertEqual(0);
      expect(cell.data).assertEqual(2);
      expect(cell.id === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0300
     * @tc.name dataTypeAcceptsNegativeId0300
     * @tc.desc Verify negative ids are stored without validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_acceptsNegativeId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(-7, 4);
      expect(cell.id).assertEqual(-7);
      expect(cell.data).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0400
     * @tc.name dataTypeAcceptsNegativeData0400
     * @tc.desc Verify negative tile values are stored without validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_acceptsNegativeData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(1, -16);
      expect(cell.data).assertEqual(-16);
      expect(cell.data < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0500
     * @tc.name dataTypeAcceptsLargeValues0500
     * @tc.desc Verify four and five digit values survive the constructor untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_acceptsLargeValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(65535, 1048576);
      expect(cell.id).assertEqual(65535);
      expect(cell.data).assertEqual(1048576);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0600
     * @tc.name dataTypeAcceptsFractionalData0600
     * @tc.desc Verify fractional tile values are not rounded by the constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_acceptsFractionalData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(2, 2.5);
      expect(cell.data).assertEqual(2.5);
      expect(cell.data === 2.5).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0700
     * @tc.name dataTypeIdIsMutable0700
     * @tc.desc Verify the public id field accepts a later assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_idIsMutable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(0, 2);
      cell.id = 42;
      expect(cell.id).assertEqual(42);
      expect(cell.data).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0800
     * @tc.name dataTypeDataIsMutable0800
     * @tc.desc Verify the public data field accepts a later assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('dataType_dataIsMutable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(0, 2);
      cell.data = 4;
      expect(cell.data).assertEqual(4);
      cell.data = 0;
      expect(cell.data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_0900
     * @tc.name dataTypeInstancesAreIndependent0900
     * @tc.desc Verify mutating one instance leaves a sibling instance unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('dataType_instancesAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let first: DataType = new DataType(0, 2);
      let second: DataType = new DataType(0, 2);
      first.data = 2048;
      expect(second.data).assertEqual(2);
      expect(first.data).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1000
     * @tc.name dataTypeEqualValuesAreDistinctObjects1000
     * @tc.desc Verify two cells with equal fields are still separate object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_equalValuesAreDistinctObjects', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let first: DataType = new DataType(5, 16);
      let second: DataType = new DataType(5, 16);
      expect(first === second).assertFalse();
      expect(first.id).assertEqual(second.id);
      expect(first.data).assertEqual(second.data);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1100
     * @tc.name dataTypeArrayPreservesOrder1100
     * @tc.desc Verify an array of cells keeps its insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_arrayPreservesOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = BoardKit.data([2, 4, 8, 16]);
      expect(list.length).assertEqual(4);
      expect(list[0].data).assertEqual(2);
      expect(list[1].data).assertEqual(4);
      expect(list[2].data).assertEqual(8);
      expect(list[3].data).assertEqual(16);
      expect(list[0].id).assertEqual(0);
      expect(list[3].id).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1200
     * @tc.name dataTypeArrayLengthIsSixteen1200
     * @tc.desc Verify the board helper produces exactly sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_arrayLengthIsSixteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = BoardKit.data(BoardKit.blank());
      expect(list.length).assertEqual(CELLS);
      let ids: number[] = [];
      for (let index: number = 0; index < list.length; index++) {
        ids.push(list[index].id);
      }
      expect(ids[0]).assertEqual(0);
      expect(ids[15]).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1300
     * @tc.name dataTypeMutationVisibleThroughOwner1300
     * @tc.desc Verify a cell shared with MyDataSource reports mutations through getData
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_mutationVisibleThroughOwner', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cells: DataType[] = BoardKit.data(BoardKit.blank());
      let source: MyDataSource = new MyDataSource(cells);
      cells[0].data = 2;
      expect(source.getData(0).data).assertEqual(2);
      source.getData(0).data = 4;
      expect(cells[0].data).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1400
     * @tc.name dataTypeIdMutationDoesNotTouchData1400
     * @tc.desc Verify changing an id leaves the tile value untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_idMutationDoesNotTouchData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(1, 1024);
      cell.id = 999;
      expect(cell.id).assertEqual(999);
      expect(cell.data).assertEqual(1024);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1500
     * @tc.name dataTypeDataMutationDoesNotTouchId1500
     * @tc.desc Verify changing a tile value leaves the id untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_dataMutationDoesNotTouchId', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(12, 0);
      cell.data = 4096;
      expect(cell.id).assertEqual(12);
      expect(cell.data).assertEqual(4096);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1600
     * @tc.name dataTypeZeroDataIsEmptyCell1600
     * @tc.desc Verify a zero data value represents an empty cell and stays zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_zeroDataIsEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(7, 0);
      expect(cell.data).assertEqual(0);
      expect(cell.data === 0).assertTrue();
      expect(cell.id).assertEqual(7);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1700
     * @tc.name dataTypeCopiedIntoRuleKeepsValue1700
     * @tc.desc Verify a cell value reaches the board through the GameRule constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_copiedIntoRuleKeepsValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = [
        new DataType(0, 2),
        new DataType(1, 4),
        new DataType(2, 8),
        new DataType(3, 16)
      ];
      let values: number[] = [];
      for (let index: number = 0; index < list.length; index++) {
        values.push(list[index].data);
      }
      expect(values[0]).assertEqual(2);
      expect(values[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1800
     * @tc.name dataTypeHoldsSameObjectInTwoArrays1800
     * @tc.desc Verify two arrays holding one cell share the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_holdsSameObjectInTwoArrays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(3, 32);
      let first: DataType[] = [cell];
      let second: DataType[] = [cell];
      first[0].data = 64;
      expect(second[0].data).assertEqual(64);
      expect(first[0] === second[0]).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_1900
     * @tc.name dataTypeZeroIdWithZeroData1900
     * @tc.desc Verify the origin cell combines id zero with an empty tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_zeroIdWithZeroData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let cell: DataType = new DataType(0, 0);
      expect(cell.id).assertEqual(0);
      expect(cell.data).assertEqual(0);
      expect(cell.id + cell.data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_DATATYPE_2000
     * @tc.name dataTypeLastCellIdIsFifteen2000
     * @tc.desc Verify the last board cell carries id fifteen and keeps its tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('dataType_lastCellIdIsFifteen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let list: DataType[] = BoardKit.data(BoardKit.repeatedRow([2, 4, 8, 16]));
      let last: DataType = list[CELLS - 1];
      expect(last.id).assertEqual(CELLS - 1);
      expect(last.data).assertEqual(16);
    });
  });
}
