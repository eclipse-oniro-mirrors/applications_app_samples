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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GridLayoutInfoColumns, GridLayoutItemInfo } from '@ohos/base';

class FakeResultSet {
  private readonly names: string[] = [
    GridLayoutInfoColumns.ID,
    GridLayoutInfoColumns.APP_NAME,
    GridLayoutInfoColumns.APPICON_ID,
    GridLayoutInfoColumns.CARD_ID,
    GridLayoutInfoColumns.CARD_NAME,
    GridLayoutInfoColumns.CONTAINER,
    GridLayoutInfoColumns.BADGE_NUMBER,
    GridLayoutInfoColumns.TYPE_ID,
    GridLayoutInfoColumns.AREA,
    GridLayoutInfoColumns.PAGE,
    GridLayoutInfoColumns.COLUMN,
    GridLayoutInfoColumns.ROW,
    GridLayoutInfoColumns.BUNDLE_NAME,
    GridLayoutInfoColumns.ABILITY_NAME,
    GridLayoutInfoColumns.MODEL_NAME
  ];
  private readonly values: Map<string, string> = new Map();

  set(column: string, value: string): FakeResultSet {
    this.values.set(column, value);
    return this;
  }

  getColumnIndex(column: string): number {
    return this.names.indexOf(column);
  }

  getLong(index: number): number {
    const value: string | undefined = this.values.get(this.names[index]);
    return value === undefined ? 0 : Number(value);
  }

  getString(index: number): string {
    const value: string | undefined = this.values.get(this.names[index]);
    return value === undefined ? '' : value;
  }
}

function createFullResultSet(): FakeResultSet {
  const resultSet: FakeResultSet = new FakeResultSet();
  resultSet.set(GridLayoutInfoColumns.ID, '11');
  resultSet.set(GridLayoutInfoColumns.APP_NAME, 'Gallery');
  resultSet.set(GridLayoutInfoColumns.APPICON_ID, '101');
  resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
  resultSet.set(GridLayoutInfoColumns.CARD_NAME, '');
  resultSet.set(GridLayoutInfoColumns.CONTAINER, '-1');
  resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
  resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
  resultSet.set(GridLayoutInfoColumns.AREA, '1,1');
  resultSet.set(GridLayoutInfoColumns.PAGE, '2');
  resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
  resultSet.set(GridLayoutInfoColumns.ROW, '5');
  resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.samples.gallery');
  resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'EntryAbility');
  resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
  return resultSet;
}

export default function gridLayoutItemInfoParseTest() {
  describe('LauncherGridLayoutItemInfoParseTest', () => {

    /**
     * @tc.name   testParseFullRow0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0100
     * @tc.desc   Test that fromResultSet maps every database column of a full row.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseFullRow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createFullResultSet());
      expect(item.id).assertEqual(11);
      expect(item.appName).assertEqual('Gallery');
      expect(item.appIconId).assertEqual(101);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-1);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(0);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.gallery');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testParseCardRow0002
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0200
     * @tc.desc   Test parsing a card row with a 2x4 area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseCardRow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '20');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '501');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'WeatherCard');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,4');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(20);
      expect(item.cardId).assertEqual(501);
      expect(item.cardName).assertEqual('WeatherCard');
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testParseArea2x20003
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0300
     * @tc.desc   Test area parsing for a 2x2 card.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseArea2x2_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, '2,2');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testParseAreaSingleValue0004
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0400
     * @tc.desc   Test that a single-value area string produces an empty area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaSingleValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, '2');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(0);
    })

    /**
     * @tc.name   testParseAreaEmpty0005
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0500
     * @tc.desc   Test that an empty area string produces an empty area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaEmpty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, '');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(0);
    })

    /**
     * @tc.name   testParseAreaThreeValues0006
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0600
     * @tc.desc   Test that an area with three components is rejected.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaThreeValues0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, '1,2,3');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(0);
    })

    /**
     * @tc.name   testParseAreaNonNumeric0007
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0700
     * @tc.desc   Test that non-numeric area components are converted to NaN.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaNonNumeric0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, 'a,b');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(2);
      expect(Number.isNaN(item.area[0])).assertTrue();
      expect(Number.isNaN(item.area[1])).assertTrue();
    })

    /**
     * @tc.name   testParseZeroPageAndPosition0008
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0800
     * @tc.desc   Test the zero page, row and column values of the first grid cell.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseZeroPageAndPosition0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(0);
    })

    /**
     * @tc.name   testParseLargePosition0009
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_0900
     * @tc.desc   Test a grid position at the last row and column of a page.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseLargePosition0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.PAGE, '9');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.page).assertEqual(9);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(5);
    })

    /**
     * @tc.name   testParseMissingColumns0010
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_1000
     * @tc.desc   Test the default values produced for columns that are absent from the result set.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseMissingColumns0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(new FakeResultSet());
      expect(item.id).assertEqual(0);
      expect(item.appName).assertEqual('');
      expect(item.appIconId).assertEqual(0);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(0);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(0);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(0);
      expect(item.bundleName).assertEqual('');
      expect(item.abilityName).assertEqual('');
      expect(item.moduleName).assertEqual('');
    })

    /**
     * @tc.name   testParseAreaWhitespace0011
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_1100
     * @tc.desc   Test that whitespace around numeric area components is tolerated.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaWhitespace0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, ' 2 , 4 ');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testParseAreaNegative0012
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_1200
     * @tc.desc   Test that negative numeric components are preserved by area parsing.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaNegative0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, '-1,2');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(-1);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testParseAreaLargeValue0013
     * @tc.number SUB_LAUNCHER_ENTRY_GRID_PARSE_1300
     * @tc.desc   Test that large area components are converted to their numeric values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testParseAreaLargeValue0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: FakeResultSet = new FakeResultSet();
      resultSet.set(GridLayoutInfoColumns.AREA, '100,200');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(100);
      expect(item.area[1]).assertEqual(200);
    })

  })
}
