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
class DeepResultSet {
  private names: string[] = [GridLayoutInfoColumns.ID, GridLayoutInfoColumns.APP_NAME, GridLayoutInfoColumns.APPICON_ID, GridLayoutInfoColumns.CARD_ID, GridLayoutInfoColumns.CARD_NAME, GridLayoutInfoColumns.CONTAINER, GridLayoutInfoColumns.BADGE_NUMBER, GridLayoutInfoColumns.TYPE_ID, GridLayoutInfoColumns.AREA, GridLayoutInfoColumns.PAGE, GridLayoutInfoColumns.COLUMN, GridLayoutInfoColumns.ROW, GridLayoutInfoColumns.BUNDLE_NAME, GridLayoutInfoColumns.ABILITY_NAME, GridLayoutInfoColumns.MODEL_NAME];
  private values: Map<string, string> = new Map();
  set(name: string, value: string): DeepResultSet { this.values.set(name, value); return this; }
  getColumnIndex(name: string): number { return this.names.indexOf(name); }
  getLong(index: number): number { const value: string | undefined = this.values.get(this.names[index]); return value === undefined ? 0 : Number(value); }
  getString(index: number): string { const value: string | undefined = this.values.get(this.names[index]); return value === undefined ? '' : value; }
}

export default function launcherPlusGridDeepTest() {
  describe('LauncherPlusGridDeepTest', () => {

    /**
     * @tc.name   testLauncherPlusGridDeep0001
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0001
     * @tc.desc   Map negative and mixed grid row 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-1');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp1');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '501');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard1');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app1');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility1');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-1);
      expect(item.appName).assertEqual('DeepApp1');
      expect(item.appIconId).assertEqual(501);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0002
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0002
     * @tc.desc   Map negative and mixed grid row 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-2');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp2');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '502');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard2');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app2');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility2');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-2);
      expect(item.appName).assertEqual('DeepApp2');
      expect(item.appIconId).assertEqual(502);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0003
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0003
     * @tc.desc   Map negative and mixed grid row 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-3');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp3');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '503');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard3');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app3');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility3');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-3);
      expect(item.appName).assertEqual('DeepApp3');
      expect(item.appIconId).assertEqual(503);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0004
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0004
     * @tc.desc   Map negative and mixed grid row 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-4');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp4');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '504');
      rs.set(GridLayoutInfoColumns.CARD_ID, '4');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard4');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app4');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility4');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-4);
      expect(item.appName).assertEqual('DeepApp4');
      expect(item.appIconId).assertEqual(504);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0005
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0005
     * @tc.desc   Map negative and mixed grid row 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-5');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp5');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '505');
      rs.set(GridLayoutInfoColumns.CARD_ID, '5');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard5');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app5');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility5');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-5);
      expect(item.appName).assertEqual('DeepApp5');
      expect(item.appIconId).assertEqual(505);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0006
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0006
     * @tc.desc   Map negative and mixed grid row 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-6');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp6');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '506');
      rs.set(GridLayoutInfoColumns.CARD_ID, '6');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard6');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app6');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility6');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-6);
      expect(item.appName).assertEqual('DeepApp6');
      expect(item.appIconId).assertEqual(506);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0007
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0007
     * @tc.desc   Map negative and mixed grid row 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-7');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp7');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '507');
      rs.set(GridLayoutInfoColumns.CARD_ID, '0');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard7');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app7');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility7');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-7);
      expect(item.appName).assertEqual('DeepApp7');
      expect(item.appIconId).assertEqual(507);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0008
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0008
     * @tc.desc   Map negative and mixed grid row 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-8');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp8');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '508');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard8');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app8');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility8');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-8);
      expect(item.appName).assertEqual('DeepApp8');
      expect(item.appIconId).assertEqual(508);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0009
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0009
     * @tc.desc   Map negative and mixed grid row 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-9');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp9');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '509');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard9');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '9');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app9');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility9');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-9);
      expect(item.appName).assertEqual('DeepApp9');
      expect(item.appIconId).assertEqual(509);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0010
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0010
     * @tc.desc   Map negative and mixed grid row 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-10');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp10');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '510');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard10');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '10');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app10');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility10');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-10);
      expect(item.appName).assertEqual('DeepApp10');
      expect(item.appIconId).assertEqual(510);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0011
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0011
     * @tc.desc   Map negative and mixed grid row 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-11');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp11');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '511');
      rs.set(GridLayoutInfoColumns.CARD_ID, '4');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard11');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app11');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility11');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-11);
      expect(item.appName).assertEqual('DeepApp11');
      expect(item.appIconId).assertEqual(511);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0012
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0012
     * @tc.desc   Map negative and mixed grid row 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-12');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp12');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '512');
      rs.set(GridLayoutInfoColumns.CARD_ID, '5');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard12');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app12');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility12');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-12);
      expect(item.appName).assertEqual('DeepApp12');
      expect(item.appIconId).assertEqual(512);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0013
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0013
     * @tc.desc   Map negative and mixed grid row 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-13');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp13');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '513');
      rs.set(GridLayoutInfoColumns.CARD_ID, '6');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard13');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app13');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility13');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-13);
      expect(item.appName).assertEqual('DeepApp13');
      expect(item.appIconId).assertEqual(513);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0014
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0014
     * @tc.desc   Map negative and mixed grid row 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-14');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp14');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '514');
      rs.set(GridLayoutInfoColumns.CARD_ID, '0');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard14');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app14');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility14');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-14);
      expect(item.appName).assertEqual('DeepApp14');
      expect(item.appIconId).assertEqual(514);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0015
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0015
     * @tc.desc   Map negative and mixed grid row 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-15');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp15');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '515');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard15');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app15');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility15');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-15);
      expect(item.appName).assertEqual('DeepApp15');
      expect(item.appIconId).assertEqual(515);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0016
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0016
     * @tc.desc   Map negative and mixed grid row 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-16');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp16');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '516');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard16');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app16');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility16');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-16);
      expect(item.appName).assertEqual('DeepApp16');
      expect(item.appIconId).assertEqual(516);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0017
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0017
     * @tc.desc   Map negative and mixed grid row 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-17');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp17');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '517');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard17');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app17');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility17');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-17);
      expect(item.appName).assertEqual('DeepApp17');
      expect(item.appIconId).assertEqual(517);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0018
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0018
     * @tc.desc   Map negative and mixed grid row 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-18');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp18');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '518');
      rs.set(GridLayoutInfoColumns.CARD_ID, '4');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard18');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app18');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility18');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-18);
      expect(item.appName).assertEqual('DeepApp18');
      expect(item.appIconId).assertEqual(518);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0019
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0019
     * @tc.desc   Map negative and mixed grid row 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-19');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp19');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '519');
      rs.set(GridLayoutInfoColumns.CARD_ID, '5');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard19');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app19');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility19');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-19);
      expect(item.appName).assertEqual('DeepApp19');
      expect(item.appIconId).assertEqual(519);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0020
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0020
     * @tc.desc   Map negative and mixed grid row 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-20');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp20');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '520');
      rs.set(GridLayoutInfoColumns.CARD_ID, '6');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard20');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '9');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app20');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility20');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-20);
      expect(item.appName).assertEqual('DeepApp20');
      expect(item.appIconId).assertEqual(520);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0021
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0021
     * @tc.desc   Map negative and mixed grid row 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-21');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp21');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '521');
      rs.set(GridLayoutInfoColumns.CARD_ID, '0');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard21');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '10');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app21');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility21');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-21);
      expect(item.appName).assertEqual('DeepApp21');
      expect(item.appIconId).assertEqual(521);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0022
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0022
     * @tc.desc   Map negative and mixed grid row 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-22');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp22');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '522');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard22');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app22');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility22');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-22);
      expect(item.appName).assertEqual('DeepApp22');
      expect(item.appIconId).assertEqual(522);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0023
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0023
     * @tc.desc   Map negative and mixed grid row 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-23');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp23');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '523');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard23');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app23');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility23');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-23);
      expect(item.appName).assertEqual('DeepApp23');
      expect(item.appIconId).assertEqual(523);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0024
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0024
     * @tc.desc   Map negative and mixed grid row 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-24');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp24');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '524');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard24');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app24');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility24');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-24);
      expect(item.appName).assertEqual('DeepApp24');
      expect(item.appIconId).assertEqual(524);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0025
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0025
     * @tc.desc   Map negative and mixed grid row 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-25');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp25');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '525');
      rs.set(GridLayoutInfoColumns.CARD_ID, '4');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard25');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app25');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility25');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-25);
      expect(item.appName).assertEqual('DeepApp25');
      expect(item.appIconId).assertEqual(525);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0026
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0026
     * @tc.desc   Map negative and mixed grid row 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-26');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp26');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '526');
      rs.set(GridLayoutInfoColumns.CARD_ID, '5');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard26');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app26');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility26');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-26);
      expect(item.appName).assertEqual('DeepApp26');
      expect(item.appIconId).assertEqual(526);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0027
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0027
     * @tc.desc   Map negative and mixed grid row 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-27');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp27');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '527');
      rs.set(GridLayoutInfoColumns.CARD_ID, '6');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard27');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app27');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility27');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-27);
      expect(item.appName).assertEqual('DeepApp27');
      expect(item.appIconId).assertEqual(527);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0028
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0028
     * @tc.desc   Map negative and mixed grid row 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-28');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp28');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '528');
      rs.set(GridLayoutInfoColumns.CARD_ID, '0');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard28');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app28');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility28');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-28);
      expect(item.appName).assertEqual('DeepApp28');
      expect(item.appIconId).assertEqual(528);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0029
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0029
     * @tc.desc   Map negative and mixed grid row 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-29');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp29');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '529');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard29');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app29');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility29');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-29);
      expect(item.appName).assertEqual('DeepApp29');
      expect(item.appIconId).assertEqual(529);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0030
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0030
     * @tc.desc   Map negative and mixed grid row 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-30');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp30');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '530');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard30');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app30');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility30');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-30);
      expect(item.appName).assertEqual('DeepApp30');
      expect(item.appIconId).assertEqual(530);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0031
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0031
     * @tc.desc   Map negative and mixed grid row 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-31');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp31');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '531');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard31');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '9');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app31');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility31');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-31);
      expect(item.appName).assertEqual('DeepApp31');
      expect(item.appIconId).assertEqual(531);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0032
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0032
     * @tc.desc   Map negative and mixed grid row 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-32');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp32');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '532');
      rs.set(GridLayoutInfoColumns.CARD_ID, '4');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard32');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '10');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app32');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility32');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-32);
      expect(item.appName).assertEqual('DeepApp32');
      expect(item.appIconId).assertEqual(532);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0033
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0033
     * @tc.desc   Map negative and mixed grid row 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-33');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp33');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '533');
      rs.set(GridLayoutInfoColumns.CARD_ID, '5');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard33');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app33');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility33');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-33);
      expect(item.appName).assertEqual('DeepApp33');
      expect(item.appIconId).assertEqual(533);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0034
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0034
     * @tc.desc   Map negative and mixed grid row 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-34');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp34');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '534');
      rs.set(GridLayoutInfoColumns.CARD_ID, '6');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard34');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app34');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility34');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-34);
      expect(item.appName).assertEqual('DeepApp34');
      expect(item.appIconId).assertEqual(534);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0035
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0035
     * @tc.desc   Map negative and mixed grid row 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-35');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp35');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '535');
      rs.set(GridLayoutInfoColumns.CARD_ID, '0');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard35');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '2');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app35');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility35');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-35);
      expect(item.appName).assertEqual('DeepApp35');
      expect(item.appIconId).assertEqual(535);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0036
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0036
     * @tc.desc   Map negative and mixed grid row 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-36');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp36');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '536');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard36');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '3');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app36');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility36');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-36);
      expect(item.appName).assertEqual('DeepApp36');
      expect(item.appIconId).assertEqual(536);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0037
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0037
     * @tc.desc   Map negative and mixed grid row 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-37');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp37');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '537');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard37');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '4');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app37');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility37');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-37);
      expect(item.appName).assertEqual('DeepApp37');
      expect(item.appIconId).assertEqual(537);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0038
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0038
     * @tc.desc   Map negative and mixed grid row 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-38');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp38');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '538');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard38');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '5');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app38');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility38');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-38);
      expect(item.appName).assertEqual('DeepApp38');
      expect(item.appIconId).assertEqual(538);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0039
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0039
     * @tc.desc   Map negative and mixed grid row 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-39');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp39');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '539');
      rs.set(GridLayoutInfoColumns.CARD_ID, '4');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard39');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '6');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app39');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility39');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-39);
      expect(item.appName).assertEqual('DeepApp39');
      expect(item.appIconId).assertEqual(539);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0040
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0040
     * @tc.desc   Map negative and mixed grid row 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-40');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp40');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '540');
      rs.set(GridLayoutInfoColumns.CARD_ID, '5');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard40');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '7');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '4');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app40');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility40');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-40);
      expect(item.appName).assertEqual('DeepApp40');
      expect(item.appIconId).assertEqual(540);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0041
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0041
     * @tc.desc   Map negative and mixed grid row 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-41');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp41');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '541');
      rs.set(GridLayoutInfoColumns.CARD_ID, '6');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard41');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '8');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '1');
      rs.set(GridLayoutInfoColumns.ROW, '5');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app41');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility41');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-41);
      expect(item.appName).assertEqual('DeepApp41');
      expect(item.appIconId).assertEqual(541);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0042
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0042
     * @tc.desc   Map negative and mixed grid row 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-42');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp42');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '542');
      rs.set(GridLayoutInfoColumns.CARD_ID, '0');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard42');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '9');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,4');
      rs.set(GridLayoutInfoColumns.PAGE, '2');
      rs.set(GridLayoutInfoColumns.COLUMN, '2');
      rs.set(GridLayoutInfoColumns.ROW, '0');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app42');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility42');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-42);
      expect(item.appName).assertEqual('DeepApp42');
      expect(item.appIconId).assertEqual(542);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(4);
      expect(item.typeId).assertEqual(0);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0043
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0043
     * @tc.desc   Map negative and mixed grid row 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-43');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp43');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '543');
      rs.set(GridLayoutInfoColumns.CARD_ID, '1');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard43');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-2');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '10');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '1');
      rs.set(GridLayoutInfoColumns.AREA, '2,5');
      rs.set(GridLayoutInfoColumns.PAGE, '3');
      rs.set(GridLayoutInfoColumns.COLUMN, '3');
      rs.set(GridLayoutInfoColumns.ROW, '1');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app43');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility43');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-43);
      expect(item.appName).assertEqual('DeepApp43');
      expect(item.appIconId).assertEqual(543);
      expect(item.container).assertEqual(-2);
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(5);
      expect(item.typeId).assertEqual(1);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0044
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0044
     * @tc.desc   Map negative and mixed grid row 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-44');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp44');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '544');
      rs.set(GridLayoutInfoColumns.CARD_ID, '2');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard44');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-3');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '0');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '2');
      rs.set(GridLayoutInfoColumns.AREA, '3,2');
      rs.set(GridLayoutInfoColumns.PAGE, '0');
      rs.set(GridLayoutInfoColumns.COLUMN, '4');
      rs.set(GridLayoutInfoColumns.ROW, '2');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app44');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility44');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-44);
      expect(item.appName).assertEqual('DeepApp44');
      expect(item.appIconId).assertEqual(544);
      expect(item.container).assertEqual(-3);
      expect(item.area[0]).assertEqual(3);
      expect(item.area[1]).assertEqual(2);
      expect(item.typeId).assertEqual(2);
    })
    /**
     * @tc.name   testLauncherPlusGridDeep0045
     * @tc.number SUB_LAUNCHER_PLUS_GRID_DEEP_0045
     * @tc.desc   Map negative and mixed grid row 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLauncherPlusGridDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const rs: DeepResultSet = new DeepResultSet();
      rs.set(GridLayoutInfoColumns.ID, '-45');
      rs.set(GridLayoutInfoColumns.APP_NAME, 'DeepApp45');
      rs.set(GridLayoutInfoColumns.APPICON_ID, '545');
      rs.set(GridLayoutInfoColumns.CARD_ID, '3');
      rs.set(GridLayoutInfoColumns.CARD_NAME, 'DeepCard45');
      rs.set(GridLayoutInfoColumns.CONTAINER, '-1');
      rs.set(GridLayoutInfoColumns.BADGE_NUMBER, '1');
      rs.set(GridLayoutInfoColumns.TYPE_ID, '0');
      rs.set(GridLayoutInfoColumns.AREA, '1,3');
      rs.set(GridLayoutInfoColumns.PAGE, '1');
      rs.set(GridLayoutInfoColumns.COLUMN, '0');
      rs.set(GridLayoutInfoColumns.ROW, '3');
      rs.set(GridLayoutInfoColumns.BUNDLE_NAME, 'com.deep.app45');
      rs.set(GridLayoutInfoColumns.ABILITY_NAME, 'DeepAbility45');
      rs.set(GridLayoutInfoColumns.MODEL_NAME, 'entry');
      const item: GridLayoutItemInfo = GridLayoutItemInfo.fromResultSet(rs);
      expect(item.id).assertEqual(-45);
      expect(item.appName).assertEqual('DeepApp45');
      expect(item.appIconId).assertEqual(545);
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(3);
      expect(item.typeId).assertEqual(0);
    })
  })
}
