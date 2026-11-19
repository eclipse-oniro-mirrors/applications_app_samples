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
class PlusResultSet {
  private names: string[] = [GridLayoutInfoColumns.ID, GridLayoutInfoColumns.APP_NAME, GridLayoutInfoColumns.APPICON_ID, GridLayoutInfoColumns.CARD_ID, GridLayoutInfoColumns.CARD_NAME, GridLayoutInfoColumns.CONTAINER, GridLayoutInfoColumns.BADGE_NUMBER, GridLayoutInfoColumns.TYPE_ID, GridLayoutInfoColumns.AREA, GridLayoutInfoColumns.PAGE, GridLayoutInfoColumns.COLUMN, GridLayoutInfoColumns.ROW, GridLayoutInfoColumns.BUNDLE_NAME, GridLayoutInfoColumns.ABILITY_NAME, GridLayoutInfoColumns.MODEL_NAME];
  private values: Map<string, string> = new Map();
  set(name: string, value: string): PlusResultSet { this.values.set(name, value); return this; }
  getColumnIndex(name: string): number { return this.names.indexOf(name); }
  getLong(index: number): number { const value: string | undefined = this.values.get(this.names[index]); return value === undefined ? 0 : Number(value); }
  getString(index: number): string { const value: string | undefined = this.values.get(this.names[index]); return value === undefined ? '' : value; }
}

export default function launcherPlusGridTest() {
  describe('LauncherPlusGridTest', () => {

    /**
     * @tc.name   testLauncherPlusGrid0001
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0001
     * @tc.desc   Map launcher grid row 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '1');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App1');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '101');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card1');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app1');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability1');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(1);
      expect(item.appName).assertEqual('App1');
      expect(item.appIconId).assertEqual(101);
      expect(item.bundleName).assertEqual('com.sample.app1');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0002
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0002
     * @tc.desc   Map launcher grid row 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '2');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App2');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '102');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card2');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app2');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability2');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(2);
      expect(item.appName).assertEqual('App2');
      expect(item.appIconId).assertEqual(102);
      expect(item.bundleName).assertEqual('com.sample.app2');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0003
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0003
     * @tc.desc   Map launcher grid row 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '3');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App3');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '103');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card3');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app3');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability3');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(3);
      expect(item.appName).assertEqual('App3');
      expect(item.appIconId).assertEqual(103);
      expect(item.bundleName).assertEqual('com.sample.app3');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0004
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0004
     * @tc.desc   Map launcher grid row 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '4');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App4');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '104');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card4');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app4');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability4');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(4);
      expect(item.appName).assertEqual('App4');
      expect(item.appIconId).assertEqual(104);
      expect(item.bundleName).assertEqual('com.sample.app4');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0005
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0005
     * @tc.desc   Map launcher grid row 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '5');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App5');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '105');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card5');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app5');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability5');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(5);
      expect(item.appName).assertEqual('App5');
      expect(item.appIconId).assertEqual(105);
      expect(item.bundleName).assertEqual('com.sample.app5');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0006
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0006
     * @tc.desc   Map launcher grid row 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '6');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App6');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '106');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card6');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app6');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability6');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(6);
      expect(item.appName).assertEqual('App6');
      expect(item.appIconId).assertEqual(106);
      expect(item.bundleName).assertEqual('com.sample.app6');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0007
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0007
     * @tc.desc   Map launcher grid row 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '7');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App7');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '107');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card7');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app7');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability7');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(7);
      expect(item.appName).assertEqual('App7');
      expect(item.appIconId).assertEqual(107);
      expect(item.bundleName).assertEqual('com.sample.app7');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0008
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0008
     * @tc.desc   Map launcher grid row 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '8');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App8');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '108');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card8');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app8');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability8');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(8);
      expect(item.appName).assertEqual('App8');
      expect(item.appIconId).assertEqual(108);
      expect(item.bundleName).assertEqual('com.sample.app8');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0009
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0009
     * @tc.desc   Map launcher grid row 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '9');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App9');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '109');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card9');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app9');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability9');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(9);
      expect(item.appName).assertEqual('App9');
      expect(item.appIconId).assertEqual(109);
      expect(item.bundleName).assertEqual('com.sample.app9');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0010
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0010
     * @tc.desc   Map launcher grid row 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '10');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App10');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '110');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card10');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app10');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability10');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(10);
      expect(item.appName).assertEqual('App10');
      expect(item.appIconId).assertEqual(110);
      expect(item.bundleName).assertEqual('com.sample.app10');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0011
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0011
     * @tc.desc   Map launcher grid row 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '11');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App11');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '111');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card11');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app11');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability11');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(11);
      expect(item.appName).assertEqual('App11');
      expect(item.appIconId).assertEqual(111);
      expect(item.bundleName).assertEqual('com.sample.app11');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0012
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0012
     * @tc.desc   Map launcher grid row 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '12');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App12');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '112');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card12');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app12');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability12');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(12);
      expect(item.appName).assertEqual('App12');
      expect(item.appIconId).assertEqual(112);
      expect(item.bundleName).assertEqual('com.sample.app12');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0013
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0013
     * @tc.desc   Map launcher grid row 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '13');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App13');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '113');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card13');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app13');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability13');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(13);
      expect(item.appName).assertEqual('App13');
      expect(item.appIconId).assertEqual(113);
      expect(item.bundleName).assertEqual('com.sample.app13');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0014
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0014
     * @tc.desc   Map launcher grid row 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '14');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App14');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '114');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card14');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app14');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability14');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(14);
      expect(item.appName).assertEqual('App14');
      expect(item.appIconId).assertEqual(114);
      expect(item.bundleName).assertEqual('com.sample.app14');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0015
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0015
     * @tc.desc   Map launcher grid row 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '15');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App15');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '115');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card15');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app15');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability15');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(15);
      expect(item.appName).assertEqual('App15');
      expect(item.appIconId).assertEqual(115);
      expect(item.bundleName).assertEqual('com.sample.app15');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0016
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0016
     * @tc.desc   Map launcher grid row 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '16');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App16');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '116');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card16');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app16');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability16');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(16);
      expect(item.appName).assertEqual('App16');
      expect(item.appIconId).assertEqual(116);
      expect(item.bundleName).assertEqual('com.sample.app16');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0017
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0017
     * @tc.desc   Map launcher grid row 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '17');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App17');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '117');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card17');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app17');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability17');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(17);
      expect(item.appName).assertEqual('App17');
      expect(item.appIconId).assertEqual(117);
      expect(item.bundleName).assertEqual('com.sample.app17');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0018
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0018
     * @tc.desc   Map launcher grid row 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '18');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App18');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '118');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card18');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app18');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability18');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(18);
      expect(item.appName).assertEqual('App18');
      expect(item.appIconId).assertEqual(118);
      expect(item.bundleName).assertEqual('com.sample.app18');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0019
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0019
     * @tc.desc   Map launcher grid row 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '19');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App19');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '119');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card19');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app19');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability19');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(19);
      expect(item.appName).assertEqual('App19');
      expect(item.appIconId).assertEqual(119);
      expect(item.bundleName).assertEqual('com.sample.app19');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0020
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0020
     * @tc.desc   Map launcher grid row 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '20');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App20');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '120');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card20');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app20');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability20');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(20);
      expect(item.appName).assertEqual('App20');
      expect(item.appIconId).assertEqual(120);
      expect(item.bundleName).assertEqual('com.sample.app20');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0021
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0021
     * @tc.desc   Map launcher grid row 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '21');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App21');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '121');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card21');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app21');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability21');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(21);
      expect(item.appName).assertEqual('App21');
      expect(item.appIconId).assertEqual(121);
      expect(item.bundleName).assertEqual('com.sample.app21');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0022
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0022
     * @tc.desc   Map launcher grid row 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '22');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App22');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '122');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card22');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app22');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability22');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(22);
      expect(item.appName).assertEqual('App22');
      expect(item.appIconId).assertEqual(122);
      expect(item.bundleName).assertEqual('com.sample.app22');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0023
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0023
     * @tc.desc   Map launcher grid row 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '23');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App23');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '123');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card23');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app23');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability23');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(23);
      expect(item.appName).assertEqual('App23');
      expect(item.appIconId).assertEqual(123);
      expect(item.bundleName).assertEqual('com.sample.app23');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0024
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0024
     * @tc.desc   Map launcher grid row 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '24');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App24');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '124');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card24');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app24');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability24');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(24);
      expect(item.appName).assertEqual('App24');
      expect(item.appIconId).assertEqual(124);
      expect(item.bundleName).assertEqual('com.sample.app24');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0025
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0025
     * @tc.desc   Map launcher grid row 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '25');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App25');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '125');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card25');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app25');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability25');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(25);
      expect(item.appName).assertEqual('App25');
      expect(item.appIconId).assertEqual(125);
      expect(item.bundleName).assertEqual('com.sample.app25');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0026
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0026
     * @tc.desc   Map launcher grid row 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '26');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App26');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '126');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card26');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app26');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability26');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(26);
      expect(item.appName).assertEqual('App26');
      expect(item.appIconId).assertEqual(126);
      expect(item.bundleName).assertEqual('com.sample.app26');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0027
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0027
     * @tc.desc   Map launcher grid row 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '27');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App27');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '127');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card27');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app27');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability27');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(27);
      expect(item.appName).assertEqual('App27');
      expect(item.appIconId).assertEqual(127);
      expect(item.bundleName).assertEqual('com.sample.app27');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0028
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0028
     * @tc.desc   Map launcher grid row 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '28');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App28');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '128');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card28');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app28');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability28');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(28);
      expect(item.appName).assertEqual('App28');
      expect(item.appIconId).assertEqual(128);
      expect(item.bundleName).assertEqual('com.sample.app28');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0029
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0029
     * @tc.desc   Map launcher grid row 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '29');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App29');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '129');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card29');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app29');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability29');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(29);
      expect(item.appName).assertEqual('App29');
      expect(item.appIconId).assertEqual(129);
      expect(item.bundleName).assertEqual('com.sample.app29');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0030
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0030
     * @tc.desc   Map launcher grid row 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '30');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App30');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '130');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card30');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app30');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability30');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(30);
      expect(item.appName).assertEqual('App30');
      expect(item.appIconId).assertEqual(130);
      expect(item.bundleName).assertEqual('com.sample.app30');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0031
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0031
     * @tc.desc   Map launcher grid row 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '31');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App31');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '131');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card31');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app31');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability31');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(31);
      expect(item.appName).assertEqual('App31');
      expect(item.appIconId).assertEqual(131);
      expect(item.bundleName).assertEqual('com.sample.app31');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0032
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0032
     * @tc.desc   Map launcher grid row 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '32');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App32');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '132');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card32');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app32');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability32');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(32);
      expect(item.appName).assertEqual('App32');
      expect(item.appIconId).assertEqual(132);
      expect(item.bundleName).assertEqual('com.sample.app32');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0033
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0033
     * @tc.desc   Map launcher grid row 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '33');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App33');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '133');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card33');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app33');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability33');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(33);
      expect(item.appName).assertEqual('App33');
      expect(item.appIconId).assertEqual(133);
      expect(item.bundleName).assertEqual('com.sample.app33');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0034
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0034
     * @tc.desc   Map launcher grid row 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '34');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App34');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '134');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card34');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app34');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability34');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(34);
      expect(item.appName).assertEqual('App34');
      expect(item.appIconId).assertEqual(134);
      expect(item.bundleName).assertEqual('com.sample.app34');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0035
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0035
     * @tc.desc   Map launcher grid row 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '35');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App35');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '135');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card35');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app35');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability35');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(35);
      expect(item.appName).assertEqual('App35');
      expect(item.appIconId).assertEqual(135);
      expect(item.bundleName).assertEqual('com.sample.app35');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0036
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0036
     * @tc.desc   Map launcher grid row 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '36');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App36');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '136');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card36');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app36');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability36');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(36);
      expect(item.appName).assertEqual('App36');
      expect(item.appIconId).assertEqual(136);
      expect(item.bundleName).assertEqual('com.sample.app36');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0037
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0037
     * @tc.desc   Map launcher grid row 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '37');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App37');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '137');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card37');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app37');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability37');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(37);
      expect(item.appName).assertEqual('App37');
      expect(item.appIconId).assertEqual(137);
      expect(item.bundleName).assertEqual('com.sample.app37');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0038
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0038
     * @tc.desc   Map launcher grid row 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '38');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App38');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '138');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card38');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app38');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability38');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(38);
      expect(item.appName).assertEqual('App38');
      expect(item.appIconId).assertEqual(138);
      expect(item.bundleName).assertEqual('com.sample.app38');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0039
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0039
     * @tc.desc   Map launcher grid row 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '39');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App39');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '139');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card39');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app39');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability39');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(39);
      expect(item.appName).assertEqual('App39');
      expect(item.appIconId).assertEqual(139);
      expect(item.bundleName).assertEqual('com.sample.app39');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0040
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0040
     * @tc.desc   Map launcher grid row 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '40');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App40');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '140');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card40');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '4');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app40');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability40');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(40);
      expect(item.appName).assertEqual('App40');
      expect(item.appIconId).assertEqual(140);
      expect(item.bundleName).assertEqual('com.sample.app40');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLauncherPlusGrid0041
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0041
     * @tc.desc   Map launcher grid row 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '41');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App41');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '141');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '1');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card41');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,2');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '1');
      resultSet.set(GridLayoutInfoColumns.ROW, '5');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app41');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability41');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(41);
      expect(item.appName).assertEqual('App41');
      expect(item.appIconId).assertEqual(141);
      expect(item.bundleName).assertEqual('com.sample.app41');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
    })

    /**
     * @tc.name   testLauncherPlusGrid0042
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0042
     * @tc.desc   Map launcher grid row 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '42');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App42');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '142');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '2');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card42');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '3,3');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '2');
      resultSet.set(GridLayoutInfoColumns.ROW, '0');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app42');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability42');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(42);
      expect(item.appName).assertEqual('App42');
      expect(item.appIconId).assertEqual(142);
      expect(item.bundleName).assertEqual('com.sample.app42');
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
    })

    /**
     * @tc.name   testLauncherPlusGrid0043
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0043
     * @tc.desc   Map launcher grid row 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '43');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App43');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '143');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '3');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card43');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '1');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '4,4');
      resultSet.set(GridLayoutInfoColumns.PAGE, '1');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '3');
      resultSet.set(GridLayoutInfoColumns.ROW, '1');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app43');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability43');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(43);
      expect(item.appName).assertEqual('App43');
      expect(item.appIconId).assertEqual(143);
      expect(item.bundleName).assertEqual('com.sample.app43');
      expect(item.area[0]).assertEqual(4);
      expect(item.area[1]).assertEqual(4);
    })

    /**
     * @tc.name   testLauncherPlusGrid0044
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0044
     * @tc.desc   Map launcher grid row 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '44');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App44');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '144');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '4');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card44');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '2');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '0');
      resultSet.set(GridLayoutInfoColumns.AREA, '1,5');
      resultSet.set(GridLayoutInfoColumns.PAGE, '2');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '4');
      resultSet.set(GridLayoutInfoColumns.ROW, '2');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app44');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability44');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(44);
      expect(item.appName).assertEqual('App44');
      expect(item.appIconId).assertEqual(144);
      expect(item.bundleName).assertEqual('com.sample.app44');
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
    })

    /**
     * @tc.name   testLauncherPlusGrid0045
     * @tc.number SUB_LAUNCHER_PLUS_GRID_0045
     * @tc.desc   Map launcher grid row 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGrid0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const resultSet: PlusResultSet = new PlusResultSet();
      resultSet.set(GridLayoutInfoColumns.ID, '45');
      resultSet.set(GridLayoutInfoColumns.APP_NAME, 'App45');
      resultSet.set(GridLayoutInfoColumns.APPICON_ID, '145');
      resultSet.set(GridLayoutInfoColumns.CARD_ID, '0');
      resultSet.set(GridLayoutInfoColumns.CARD_NAME, 'Card45');
      resultSet.set(GridLayoutInfoColumns.CONTAINER, '0');
      resultSet.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      resultSet.set(GridLayoutInfoColumns.TYPE_ID, '1');
      resultSet.set(GridLayoutInfoColumns.AREA, '2,1');
      resultSet.set(GridLayoutInfoColumns.PAGE, '0');
      resultSet.set(GridLayoutInfoColumns.COLUMN, '0');
      resultSet.set(GridLayoutInfoColumns.ROW, '3');
      resultSet.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.sample.app45');
      resultSet.set(GridLayoutInfoColumns.ABILITY_NAME, 'Ability45');
      resultSet.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(resultSet);
      expect(item.id).assertEqual(45);
      expect(item.appName).assertEqual('App45');
      expect(item.appIconId).assertEqual(145);
      expect(item.bundleName).assertEqual('com.sample.app45');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(1);
    })
  })
}
