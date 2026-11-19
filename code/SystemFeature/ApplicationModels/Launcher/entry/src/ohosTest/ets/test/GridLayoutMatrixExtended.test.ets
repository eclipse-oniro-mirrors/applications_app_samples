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

class MatrixResultSet {
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

  set(column: string, value: string): MatrixResultSet {
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

function createRow(index: number): MatrixResultSet {
  const resultSet: MatrixResultSet = new MatrixResultSet();
  resultSet.set(GridLayoutInfoColumns.ID, String(index + 1));
  resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App' + index);
  resultSet.set(GridLayoutInfoColumns.APPICON_ID, String(100 + index));
  resultSet.set(GridLayoutInfoColumns.CARD_ID, String(index % 3 === 0 ? index : 0));
  resultSet.set(GridLayoutInfoColumns.CARD_NAME, index % 3 === 0 ? 'Card' + index : '');
  resultSet.set(GridLayoutInfoColumns.CONTAINER, String(index % 2 === 0 ? -100 : index));
  resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, String(index % 5));
  resultSet.set(GridLayoutInfoColumns.TYPE_ID, String(index % 2));
  resultSet.set(GridLayoutInfoColumns.AREA, (1 + index % 4) + ',' + (1 + (index + 1) % 4));
  resultSet.set(GridLayoutInfoColumns.PAGE, String(index % 3));
  resultSet.set(GridLayoutInfoColumns.COLUMN, String(index % 5));
  resultSet.set(GridLayoutInfoColumns.ROW, String(index % 6));
  resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.samples.matrix' + index);
  resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'EntryAbility');
  resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
  return resultSet;
}

export default function gridLayoutMatrixExtendedTest() {
  describe('LauncherGridLayoutMatrixExtendedTest', () => {

    /**
     * @tc.name   testGridMatrix0001
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0001
     * @tc.desc   Test fromResultSet mapping for matrix row 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(0));
      expect(item.id).assertEqual(1);
      expect(item.appName).assertEqual('App0');
      expect(item.appIconId).assertEqual(100);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('Card0');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(0);
      expect(item.bundleName).assertEqual('com.samples.matrix0');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0002
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0002
     * @tc.desc   Test fromResultSet mapping for matrix row 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(1));
      expect(item.id).assertEqual(2);
      expect(item.appName).assertEqual('App1');
      expect(item.appIconId).assertEqual(101);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(1);
      expect(item.badgeNumber).assertEqual(1);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(1);
      expect(item.row).assertEqual(1);
      expect(item.bundleName).assertEqual('com.samples.matrix1');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0003
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0003
     * @tc.desc   Test fromResultSet mapping for matrix row 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(2));
      expect(item.id).assertEqual(3);
      expect(item.appName).assertEqual('App2');
      expect(item.appIconId).assertEqual(102);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(2);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(2);
      expect(item.bundleName).assertEqual('com.samples.matrix2');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0004
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0004
     * @tc.desc   Test fromResultSet mapping for matrix row 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(3));
      expect(item.id).assertEqual(4);
      expect(item.appName).assertEqual('App3');
      expect(item.appIconId).assertEqual(103);
      expect(item.cardId).assertEqual(3);
      expect(item.cardName).assertEqual('Card3');
      expect(item.container).assertEqual(3);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(3);
      expect(item.row).assertEqual(3);
      expect(item.bundleName).assertEqual('com.samples.matrix3');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0005
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0005
     * @tc.desc   Test fromResultSet mapping for matrix row 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(4));
      expect(item.id).assertEqual(5);
      expect(item.appName).assertEqual('App4');
      expect(item.appIconId).assertEqual(104);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(4);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(4);
      expect(item.bundleName).assertEqual('com.samples.matrix4');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0006
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0006
     * @tc.desc   Test fromResultSet mapping for matrix row 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(5));
      expect(item.id).assertEqual(6);
      expect(item.appName).assertEqual('App5');
      expect(item.appIconId).assertEqual(105);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(5);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.matrix5');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0007
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0007
     * @tc.desc   Test fromResultSet mapping for matrix row 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(6));
      expect(item.id).assertEqual(7);
      expect(item.appName).assertEqual('App6');
      expect(item.appIconId).assertEqual(106);
      expect(item.cardId).assertEqual(6);
      expect(item.cardName).assertEqual('Card6');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(1);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(1);
      expect(item.row).assertEqual(0);
      expect(item.bundleName).assertEqual('com.samples.matrix6');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0008
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0008
     * @tc.desc   Test fromResultSet mapping for matrix row 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(7));
      expect(item.id).assertEqual(8);
      expect(item.appName).assertEqual('App7');
      expect(item.appIconId).assertEqual(107);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(7);
      expect(item.badgeNumber).assertEqual(2);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(1);
      expect(item.bundleName).assertEqual('com.samples.matrix7');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0009
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0009
     * @tc.desc   Test fromResultSet mapping for matrix row 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(8));
      expect(item.id).assertEqual(9);
      expect(item.appName).assertEqual('App8');
      expect(item.appIconId).assertEqual(108);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(3);
      expect(item.row).assertEqual(2);
      expect(item.bundleName).assertEqual('com.samples.matrix8');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0010
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0010
     * @tc.desc   Test fromResultSet mapping for matrix row 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(9));
      expect(item.id).assertEqual(10);
      expect(item.appName).assertEqual('App9');
      expect(item.appIconId).assertEqual(109);
      expect(item.cardId).assertEqual(9);
      expect(item.cardName).assertEqual('Card9');
      expect(item.container).assertEqual(9);
      expect(item.badgeNumber).assertEqual(4);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(3);
      expect(item.bundleName).assertEqual('com.samples.matrix9');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0011
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0011
     * @tc.desc   Test fromResultSet mapping for matrix row 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(10));
      expect(item.id).assertEqual(11);
      expect(item.appName).assertEqual('App10');
      expect(item.appIconId).assertEqual(110);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(4);
      expect(item.bundleName).assertEqual('com.samples.matrix10');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0012
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0012
     * @tc.desc   Test fromResultSet mapping for matrix row 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(11));
      expect(item.id).assertEqual(12);
      expect(item.appName).assertEqual('App11');
      expect(item.appIconId).assertEqual(111);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(11);
      expect(item.badgeNumber).assertEqual(1);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(1);
      expect(item.row).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.matrix11');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0013
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0013
     * @tc.desc   Test fromResultSet mapping for matrix row 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(12));
      expect(item.id).assertEqual(13);
      expect(item.appName).assertEqual('App12');
      expect(item.appIconId).assertEqual(112);
      expect(item.cardId).assertEqual(12);
      expect(item.cardName).assertEqual('Card12');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(2);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(0);
      expect(item.bundleName).assertEqual('com.samples.matrix12');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0014
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0014
     * @tc.desc   Test fromResultSet mapping for matrix row 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(13));
      expect(item.id).assertEqual(14);
      expect(item.appName).assertEqual('App13');
      expect(item.appIconId).assertEqual(113);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(13);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(3);
      expect(item.row).assertEqual(1);
      expect(item.bundleName).assertEqual('com.samples.matrix13');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0015
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0015
     * @tc.desc   Test fromResultSet mapping for matrix row 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(14));
      expect(item.id).assertEqual(15);
      expect(item.appName).assertEqual('App14');
      expect(item.appIconId).assertEqual(114);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(4);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(2);
      expect(item.bundleName).assertEqual('com.samples.matrix14');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0016
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0016
     * @tc.desc   Test fromResultSet mapping for matrix row 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(15));
      expect(item.id).assertEqual(16);
      expect(item.appName).assertEqual('App15');
      expect(item.appIconId).assertEqual(115);
      expect(item.cardId).assertEqual(15);
      expect(item.cardName).assertEqual('Card15');
      expect(item.container).assertEqual(15);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(3);
      expect(item.bundleName).assertEqual('com.samples.matrix15');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0017
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0017
     * @tc.desc   Test fromResultSet mapping for matrix row 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(16));
      expect(item.id).assertEqual(17);
      expect(item.appName).assertEqual('App16');
      expect(item.appIconId).assertEqual(116);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(1);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(1);
      expect(item.row).assertEqual(4);
      expect(item.bundleName).assertEqual('com.samples.matrix16');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0018
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0018
     * @tc.desc   Test fromResultSet mapping for matrix row 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(17));
      expect(item.id).assertEqual(18);
      expect(item.appName).assertEqual('App17');
      expect(item.appIconId).assertEqual(117);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(17);
      expect(item.badgeNumber).assertEqual(2);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.matrix17');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0019
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0019
     * @tc.desc   Test fromResultSet mapping for matrix row 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(18));
      expect(item.id).assertEqual(19);
      expect(item.appName).assertEqual('App18');
      expect(item.appIconId).assertEqual(118);
      expect(item.cardId).assertEqual(18);
      expect(item.cardName).assertEqual('Card18');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(3);
      expect(item.row).assertEqual(0);
      expect(item.bundleName).assertEqual('com.samples.matrix18');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0020
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0020
     * @tc.desc   Test fromResultSet mapping for matrix row 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(19));
      expect(item.id).assertEqual(20);
      expect(item.appName).assertEqual('App19');
      expect(item.appIconId).assertEqual(119);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(19);
      expect(item.badgeNumber).assertEqual(4);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(1);
      expect(item.bundleName).assertEqual('com.samples.matrix19');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0021
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0021
     * @tc.desc   Test fromResultSet mapping for matrix row 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(20));
      expect(item.id).assertEqual(21);
      expect(item.appName).assertEqual('App20');
      expect(item.appIconId).assertEqual(120);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(2);
      expect(item.bundleName).assertEqual('com.samples.matrix20');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0022
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0022
     * @tc.desc   Test fromResultSet mapping for matrix row 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(21));
      expect(item.id).assertEqual(22);
      expect(item.appName).assertEqual('App21');
      expect(item.appIconId).assertEqual(121);
      expect(item.cardId).assertEqual(21);
      expect(item.cardName).assertEqual('Card21');
      expect(item.container).assertEqual(21);
      expect(item.badgeNumber).assertEqual(1);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(1);
      expect(item.row).assertEqual(3);
      expect(item.bundleName).assertEqual('com.samples.matrix21');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0023
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0023
     * @tc.desc   Test fromResultSet mapping for matrix row 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(22));
      expect(item.id).assertEqual(23);
      expect(item.appName).assertEqual('App22');
      expect(item.appIconId).assertEqual(122);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(2);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(4);
      expect(item.bundleName).assertEqual('com.samples.matrix22');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0024
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0024
     * @tc.desc   Test fromResultSet mapping for matrix row 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(23));
      expect(item.id).assertEqual(24);
      expect(item.appName).assertEqual('App23');
      expect(item.appIconId).assertEqual(123);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(23);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(3);
      expect(item.row).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.matrix23');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0025
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0025
     * @tc.desc   Test fromResultSet mapping for matrix row 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(24));
      expect(item.id).assertEqual(25);
      expect(item.appName).assertEqual('App24');
      expect(item.appIconId).assertEqual(124);
      expect(item.cardId).assertEqual(24);
      expect(item.cardName).assertEqual('Card24');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(4);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(0);
      expect(item.bundleName).assertEqual('com.samples.matrix24');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0026
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0026
     * @tc.desc   Test fromResultSet mapping for matrix row 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(25));
      expect(item.id).assertEqual(26);
      expect(item.appName).assertEqual('App25');
      expect(item.appIconId).assertEqual(125);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(25);
      expect(item.badgeNumber).assertEqual(0);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(1);
      expect(item.bundleName).assertEqual('com.samples.matrix25');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0027
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0027
     * @tc.desc   Test fromResultSet mapping for matrix row 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(26));
      expect(item.id).assertEqual(27);
      expect(item.appName).assertEqual('App26');
      expect(item.appIconId).assertEqual(126);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(1);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(1);
      expect(item.row).assertEqual(2);
      expect(item.bundleName).assertEqual('com.samples.matrix26');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0028
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0028
     * @tc.desc   Test fromResultSet mapping for matrix row 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(27));
      expect(item.id).assertEqual(28);
      expect(item.appName).assertEqual('App27');
      expect(item.appIconId).assertEqual(127);
      expect(item.cardId).assertEqual(27);
      expect(item.cardName).assertEqual('Card27');
      expect(item.container).assertEqual(27);
      expect(item.badgeNumber).assertEqual(2);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(3);
      expect(item.bundleName).assertEqual('com.samples.matrix27');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0029
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0029
     * @tc.desc   Test fromResultSet mapping for matrix row 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(28));
      expect(item.id).assertEqual(29);
      expect(item.appName).assertEqual('App28');
      expect(item.appIconId).assertEqual(128);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(-100);
      expect(item.badgeNumber).assertEqual(3);
      expect(item.typeId).assertEqual(0);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(3);
      expect(item.row).assertEqual(4);
      expect(item.bundleName).assertEqual('com.samples.matrix28');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })

    /**
     * @tc.name   testGridMatrix0030
     * @tc.number SUB_LAUNCHER_EXT_GRID_MATRIX_0030
     * @tc.desc   Test fromResultSet mapping for matrix row 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(createRow(29));
      expect(item.id).assertEqual(30);
      expect(item.appName).assertEqual('App29');
      expect(item.appIconId).assertEqual(129);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.container).assertEqual(29);
      expect(item.badgeNumber).assertEqual(4);
      expect(item.typeId).assertEqual(1);
      expect(item.area.length).assertEqual(2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.page).assertEqual(2);
      expect(item.column).assertEqual(4);
      expect(item.row).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.matrix29');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
    })
  })
}
