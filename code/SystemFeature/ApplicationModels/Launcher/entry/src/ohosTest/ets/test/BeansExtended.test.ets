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
import {
  AppItemInfo,
  CardItemInfo,
  FormCardItem,
  GridLayoutItemInfo,
  MenuInfo,
  MissionInfo
} from '@ohos/base';

export default function beansExtendedTest() {
  describe('LauncherBeansExtendedTest', () => {

    /**
     * @tc.name   testAppItemInfoFields0001
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0100
     * @tc.desc   Test that all AppItemInfo fields retain assigned application metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppItemInfoFields0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.appId = 'app-1001';
      app.appName = 'Gallery';
      app.appIconId = 101;
      app.appLabelId = 'gallery_label';
      app.bundleName = 'com.samples.gallery';
      app.abilityName = 'EntryAbility';
      app.isSystemApp = false;
      app.isUninstallAble = true;
      app.badgeNumber = 3;
      app.moduleName = 'entry';
      app.typeId = 0;
      app.area = [1, 1];
      app.page = 2;
      app.column = 4;
      app.row = 5;
      expect(app.appId).assertEqual('app-1001');
      expect(app.appName).assertEqual('Gallery');
      expect(app.appIconId).assertEqual(101);
      expect(app.appLabelId).assertEqual('gallery_label');
      expect(app.bundleName).assertEqual('com.samples.gallery');
      expect(app.abilityName).assertEqual('EntryAbility');
      expect(app.isSystemApp).assertFalse();
      expect(app.isUninstallAble).assertTrue();
      expect(app.badgeNumber).assertEqual(3);
      expect(app.moduleName).assertEqual('entry');
      expect(app.typeId).assertEqual(0);
      expect(app.area.length).assertEqual(2);
      expect(app.page).assertEqual(2);
      expect(app.column).assertEqual(4);
      expect(app.row).assertEqual(5);
    })

    /**
     * @tc.name   testAppItemInfoSystemFlags0002
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0200
     * @tc.desc   Test the system app and uninstallable flags of AppItemInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppItemInfoSystemFlags0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = new AppItemInfo();
      app.isSystemApp = true;
      app.isUninstallAble = false;
      app.badgeNumber = 0;
      expect(app.isSystemApp).assertTrue();
      expect(app.isUninstallAble).assertFalse();
      expect(app.badgeNumber).assertEqual(0);
    })

    /**
     * @tc.name   testCardItemInfoFields0003
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0300
     * @tc.desc   Test that CardItemInfo retains form metadata and default collections.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardItemInfoFields0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 1001;
      card.bundleName = 'com.samples.form';
      card.abilityName = 'FormAbility';
      card.moduleName = 'entry';
      card.cardName = 'WeatherCard';
      card.cardDimension = 2;
      card.area = [2, 2];
      card.formConfigAbility = 'FormConfigAbility';
      card.appLabelId = 'weather_label';
      card.appName = 'Weather';
      card.supportDimensions = [1, 2, 3, 4];
      expect(card.cardId).assertEqual(1001);
      expect(card.bundleName).assertEqual('com.samples.form');
      expect(card.abilityName).assertEqual('FormAbility');
      expect(card.moduleName).assertEqual('entry');
      expect(card.cardName).assertEqual('WeatherCard');
      expect(card.cardDimension).assertEqual(2);
      expect(card.area.length).assertEqual(2);
      expect(card.description).assertEqual('');
      expect(card.formConfigAbility).assertEqual('FormConfigAbility');
      expect(card.appLabelId).assertEqual('weather_label');
      expect(card.appName).assertEqual('Weather');
      expect(card.supportDimensions.length).assertEqual(4);
    })

    /**
     * @tc.name   testCardItemInfoDefaults0004
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0400
     * @tc.desc   Test the default description and support dimensions of CardItemInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCardItemInfoDefaults0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = new CardItemInfo();
      expect(card.description).assertEqual('');
      expect(card.supportDimensions.length).assertEqual(0);
    })

    /**
     * @tc.name   testFormCardItemFields0005
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0500
     * @tc.desc   Test that FormCardItem retains the metadata used to add a card.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFormCardItemFields0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const form: FormCardItem = new FormCardItem();
      form.cardId = 7;
      form.appName = 'Calendar';
      form.cardName = 'CalendarCard';
      form.bundleName = 'com.samples.calendar';
      form.abilityName = 'CalendarAbility';
      form.moduleName = 'entry';
      form.dimension = 2;
      form.formConfigAbility = 'CalendarConfig';
      form.appLabelId = 'calendar_label';
      expect(form.cardId).assertEqual(7);
      expect(form.appName).assertEqual('Calendar');
      expect(form.cardName).assertEqual('CalendarCard');
      expect(form.bundleName).assertEqual('com.samples.calendar');
      expect(form.abilityName).assertEqual('CalendarAbility');
      expect(form.moduleName).assertEqual('entry');
      expect(form.dimension).assertEqual(2);
      expect(form.formConfigAbility).assertEqual('CalendarConfig');
      expect(form.appLabelId).assertEqual('calendar_label');
    })

    /**
     * @tc.name   testMissionInfoFields0006
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0600
     * @tc.desc   Test that MissionInfo retains recent task metadata.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionInfoFields0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 42;
      mission.lockedState = false;
      mission.bundleName = 'com.samples.notes';
      mission.abilityName = 'NotesAbility';
      mission.appName = 'Notes';
      mission.appIconId = 202;
      expect(mission.missionId).assertEqual(42);
      expect(mission.lockedState).assertFalse();
      expect(mission.bundleName).assertEqual('com.samples.notes');
      expect(mission.abilityName).assertEqual('NotesAbility');
      expect(mission.appName).assertEqual('Notes');
      expect(mission.appIconId).assertEqual(202);
    })

    /**
     * @tc.name   testMissionInfoLocked0007
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0700
     * @tc.desc   Test the locked state flag of MissionInfo.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMissionInfoLocked0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const mission: MissionInfo = new MissionInfo();
      mission.missionId = 1;
      mission.lockedState = true;
      expect(mission.missionId).assertEqual(1);
      expect(mission.lockedState).assertTrue();
    })

    /**
     * @tc.name   testMenuInfoFields0008
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0800
     * @tc.desc   Test that MenuInfo retains bundle name and click callback.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testMenuInfoFields0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const menu: MenuInfo = new MenuInfo();
      let clicked: boolean = false;
      menu.bundleName = 'com.samples.menu';
      menu.onMenuClick = (): void => {
        clicked = true;
      };
      menu.onMenuClick();
      expect(menu.bundleName).assertEqual('com.samples.menu');
      expect(clicked).assertTrue();
    })

    /**
     * @tc.name   testGridLayoutItemInfoDefaults0009
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_0900
     * @tc.desc   Test that GridLayoutItemInfo exposes writable grid fields.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridLayoutItemInfoDefaults0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = new GridLayoutItemInfo();
      item.id = 9;
      item.appName = 'Maps';
      item.appIconId = 303;
      item.typeId = 0;
      item.cardId = 0;
      item.cardName = '';
      item.badgeNumber = 5;
      item.bundleName = 'com.samples.maps';
      item.abilityName = 'MapsAbility';
      item.moduleName = 'entry';
      item.container = -1;
      item.area = [1, 1];
      item.page = 0;
      item.column = 2;
      item.row = 3;
      expect(item.id).assertEqual(9);
      expect(item.appName).assertEqual('Maps');
      expect(item.appIconId).assertEqual(303);
      expect(item.typeId).assertEqual(0);
      expect(item.cardId).assertEqual(0);
      expect(item.cardName).assertEqual('');
      expect(item.badgeNumber).assertEqual(5);
      expect(item.bundleName).assertEqual('com.samples.maps');
      expect(item.abilityName).assertEqual('MapsAbility');
      expect(item.moduleName).assertEqual('entry');
      expect(item.container).assertEqual(-1);
      expect(item.area[0]).assertEqual(1);
      expect(item.page).assertEqual(0);
      expect(item.column).assertEqual(2);
      expect(item.row).assertEqual(3);
    })

    /**
     * @tc.name   testGridLayoutItemInfoCard0010
     * @tc.number SUB_LAUNCHER_ENTRY_BEANS_1000
     * @tc.desc   Test a card-shaped GridLayoutItemInfo with a 2x4 area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridLayoutItemInfoCard0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const item: GridLayoutItemInfo = new GridLayoutItemInfo();
      item.id = 10;
      item.typeId = 1;
      item.cardId = 500;
      item.cardName = 'MusicCard';
      item.area = [2, 4];
      item.page = 1;
      item.column = 0;
      item.row = 2;
      expect(item.typeId).assertEqual(1);
      expect(item.cardId).assertEqual(500);
      expect(item.cardName).assertEqual('MusicCard');
      expect(item.area[0]).assertEqual(2);
      expect(item.area[1]).assertEqual(4);
      expect(item.page).assertEqual(1);
      expect(item.column).assertEqual(0);
      expect(item.row).assertEqual(2);
    })

  })
}
