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

const SAMPLE_ID: number = 7;
const SAMPLE_APP_NAME: string = 'gallery';
const SAMPLE_APP_ICON_ID: number = 3;
const SAMPLE_CARD_ID: number = 9;
const SAMPLE_CARD_NAME: string = 'card';
const SAMPLE_CONTAINER: number = 1;
const SAMPLE_BADGE_NUMBER: number = 2;
const SAMPLE_PAGE: number = 0;
const SAMPLE_COLUMN: number = 1;
const SAMPLE_ROW: number = 2;
const SAMPLE_BUNDLE_NAME: string = 'ohos.samples.gallery';
const SAMPLE_ABILITY_NAME: string = 'GalleryAbility';
const SAMPLE_MODULE_NAME: string = 'entry';

/**
 * Minimal result set that maps column names to values, used to feed GridLayoutItemInfo.fromResultSet.
 */
class MockResultSet {
  private columnNames: Array<string> = [];
  private columnValues: Array<string | number> = [];

  public put(columnName: string, value: string | number): void {
    this.columnNames.push(columnName);
    this.columnValues.push(value);
  }

  public getColumnIndex(columnName: string): number {
    return this.columnNames.indexOf(columnName);
  }

  public getLong(columnIndex: number): number {
    if (columnIndex < 0 || columnIndex >= this.columnValues.length) {
      return 0;
    }
    const value: string | number = this.columnValues[columnIndex];
    return typeof value === 'number' ? value : 0;
  }

  public getString(columnIndex: number): string {
    if (columnIndex < 0 || columnIndex >= this.columnValues.length) {
      return '';
    }
    const value: string | number = this.columnValues[columnIndex];
    return typeof value === 'string' ? value : '';
  }
}

function buildFullResultSet(): MockResultSet {
  const resultSet: MockResultSet = new MockResultSet();
  resultSet.put(GridLayoutInfoColumns.ID, SAMPLE_ID);
  resultSet.put(GridLayoutInfoColumns.APP_NAME, SAMPLE_APP_NAME);
  resultSet.put(GridLayoutInfoColumns.APPICON_ID, SAMPLE_APP_ICON_ID);
  resultSet.put(GridLayoutInfoColumns.CARD_ID, SAMPLE_CARD_ID);
  resultSet.put(GridLayoutInfoColumns.CARD_NAME, SAMPLE_CARD_NAME);
  resultSet.put(GridLayoutInfoColumns.CONTAINER, SAMPLE_CONTAINER);
  resultSet.put(GridLayoutInfoColumns.BADGE_NUMBER, SAMPLE_BADGE_NUMBER);
  resultSet.put(GridLayoutInfoColumns.TYPE_ID, 0);
  resultSet.put(GridLayoutInfoColumns.AREA, '2,2');
  resultSet.put(GridLayoutInfoColumns.PAGE, SAMPLE_PAGE);
  resultSet.put(GridLayoutInfoColumns.COLUMN, SAMPLE_COLUMN);
  resultSet.put(GridLayoutInfoColumns.ROW, SAMPLE_ROW);
  resultSet.put(GridLayoutInfoColumns.BUNDLE_NAME, SAMPLE_BUNDLE_NAME);
  resultSet.put(GridLayoutInfoColumns.ABILITY_NAME, SAMPLE_ABILITY_NAME);
  resultSet.put(GridLayoutInfoColumns.MODEL_NAME, SAMPLE_MODULE_NAME);
  return resultSet;
}

export default function gridLayoutDataTest() {
  describe('LauncherGridLayoutTest', () => {

    /**
     * @tc.name   testColumnConstants0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRIDLAYOUTDATA_0100
     * @tc.desc   Test that the grid layout column names match the columns of the launcher layout database table.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testColumnConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(GridLayoutInfoColumns.ID).assertEqual('id');
      expect(GridLayoutInfoColumns.APP_NAME).assertEqual('app_name');
      expect(GridLayoutInfoColumns.APPICON_ID).assertEqual('appIcon_id');
      expect(GridLayoutInfoColumns.TYPE_ID).assertEqual('type_id');
      expect(GridLayoutInfoColumns.AREA).assertEqual('area');
      expect(GridLayoutInfoColumns.MODEL_NAME).assertEqual('module_name');
      expect(GridLayoutInfoColumns.BADGE_NUMBER).assertEqual('badge_number');
    })

    /**
     * @tc.name   testFromResultSet0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRIDLAYOUTDATA_0200
     * @tc.desc   Test that GridLayoutItemInfo.fromResultSet maps every column of a layout row into the item fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testFromResultSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const resultSet: MockResultSet = buildFullResultSet();
      const itemInfo: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(itemInfo.id).assertEqual(SAMPLE_ID);
      expect(itemInfo.appName).assertEqual(SAMPLE_APP_NAME);
      expect(itemInfo.appIconId).assertEqual(SAMPLE_APP_ICON_ID);
      expect(itemInfo.cardId).assertEqual(SAMPLE_CARD_ID);
      expect(itemInfo.cardName).assertEqual(SAMPLE_CARD_NAME);
      expect(itemInfo.container).assertEqual(SAMPLE_CONTAINER);
      expect(itemInfo.badgeNumber).assertEqual(SAMPLE_BADGE_NUMBER);
      expect(itemInfo.typeId).assertEqual(0);
      expect(itemInfo.page).assertEqual(SAMPLE_PAGE);
      expect(itemInfo.column).assertEqual(SAMPLE_COLUMN);
      expect(itemInfo.row).assertEqual(SAMPLE_ROW);
      expect(itemInfo.bundleName).assertEqual(SAMPLE_BUNDLE_NAME);
      expect(itemInfo.abilityName).assertEqual(SAMPLE_ABILITY_NAME);
      expect(itemInfo.moduleName).assertEqual(SAMPLE_MODULE_NAME);
    })

    /**
     * @tc.name   testAreaParse0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRIDLAYOUTDATA_0300
     * @tc.desc   Test that the area column of a 2 by 2 card is parsed into a two element number array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testAreaParse0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const resultSet: MockResultSet = buildFullResultSet();
      const itemInfo: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(itemInfo.area.length).assertEqual(2);
      expect(itemInfo.area[0]).assertEqual(2);
      expect(itemInfo.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testInvalidArea0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRIDLAYOUTDATA_0400
     * @tc.desc   Test that an area column with more than two fields falls back to an empty area array.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testInvalidArea0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const resultSet: MockResultSet = new MockResultSet();
      resultSet.put(GridLayoutInfoColumns.ID, 1);
      resultSet.put(GridLayoutInfoColumns.AREA, '1,2,3');
      const itemInfo: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(itemInfo.area.length).assertEqual(0);
    })

    /**
     * @tc.name   testMissingColumns0001
     * @tc.number SUB_LAUNCHER_ENTRY_GRIDLAYOUTDATA_0500
     * @tc.desc   Test that a row without optional columns falls back to zero and empty string values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testMissingColumns0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const resultSet: MockResultSet = new MockResultSet();
      resultSet.put(GridLayoutInfoColumns.ID, 5);
      const itemInfo: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(itemInfo.id).assertEqual(5);
      expect(itemInfo.appName).assertEqual('');
      expect(itemInfo.bundleName).assertEqual('');
      expect(itemInfo.area.length).assertEqual(0);
      expect(itemInfo.page).assertEqual(0);
    })
  })
}
