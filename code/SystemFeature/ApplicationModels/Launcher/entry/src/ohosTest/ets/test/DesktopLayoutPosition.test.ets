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
import { AppItemInfo, CardItemInfo, FormModel, GridLayoutItemInfo } from '@ohos/base';
import { DesktopLayoutModel } from '@ohos/desktop';
import { common } from '@kit.AbilityKit';

function createApp(index: number): AppItemInfo {
  const app: AppItemInfo = new AppItemInfo();
  app.appId = 'app-' + index;
  app.appName = 'App' + index;
  app.appIconId = 1000 + index;
  app.appLabelId = 'label_' + index;
  app.bundleName = 'com.samples.app' + index;
  app.abilityName = 'EntryAbility';
  app.moduleName = 'entry';
  app.isSystemApp = false;
  app.isUninstallAble = true;
  return app;
}

function createModel(): DesktopLayoutModel {
  return new DesktopLayoutModel(undefined!);
}

export default function desktopLayoutPositionTest() {
  describe('LauncherDesktopLayoutPositionTest', () => {

    /**
     * @tc.name   testEmptyAppList0001
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0100
     * @tc.desc   Test that an empty application list produces no grid pages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEmptyAppList0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos([]);
      expect(pages.length).assertEqual(0);
    })

    /**
     * @tc.name   testSingleAppPosition0002
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0200
     * @tc.desc   Test that the first application is placed at page 0, row 0 and column 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSingleAppPosition0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos([createApp(0)]);
      expect(pages.length).assertEqual(1);
      expect(pages[0].length).assertEqual(1);
      expect(pages[0][0].page).assertEqual(0);
      expect(pages[0][0].row).assertEqual(0);
      expect(pages[0][0].column).assertEqual(0);
    })

    /**
     * @tc.name   testFirstRowColumns0003
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0300
     * @tc.desc   Test the column positions of the first five applications.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFirstRowColumns0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const apps: AppItemInfo[] = [createApp(0), createApp(1), createApp(2), createApp(3), createApp(4)];
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos(apps);
      expect(pages.length).assertEqual(1);
      expect(pages[0].length).assertEqual(5);
      for (let i = 0; i < 5; i++) {
        expect(pages[0][i].page).assertEqual(0);
        expect(pages[0][i].row).assertEqual(0);
        expect(pages[0][i].column).assertEqual(i);
      }
    })

    /**
     * @tc.name   testSecondRowStart0004
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0400
     * @tc.desc   Test that the sixth application starts at row 1, column 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSecondRowStart0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const apps: AppItemInfo[] = [];
      for (let i = 0; i < 6; i++) {
        apps.push(createApp(i));
      }
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos(apps);
      expect(pages[0][5].row).assertEqual(1);
      expect(pages[0][5].column).assertEqual(0);
    })

    /**
     * @tc.name   testLastCellOfPage0005
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0500
     * @tc.desc   Test the page, row and column of the 29th application in the first grid page.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLastCellOfPage0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const apps: AppItemInfo[] = [];
      for (let i = 0; i < 29; i++) {
        apps.push(createApp(i));
      }
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos(apps);
      expect(pages.length).assertEqual(1);
      expect(pages[0].length).assertEqual(29);
      expect(pages[0][28].page).assertEqual(0);
      expect(pages[0][28].row).assertEqual(5);
      expect(pages[0][28].column).assertEqual(3);
    })

    /**
     * @tc.name   testGridItemConversion0006
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0600
     * @tc.desc   Test that application metadata is copied into the generated grid item.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testGridItemConversion0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const app: AppItemInfo = createApp(7);
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos([app]);
      const item: GridLayoutItemInfo = pages[0][0];
      expect(item.appName).assertEqual('App7');
      expect(item.appIconId).assertEqual(1007);
      expect(item.bundleName).assertEqual('com.samples.app7');
      expect(item.abilityName).assertEqual('EntryAbility');
      expect(item.moduleName).assertEqual('entry');
      expect(item.container).assertEqual(-100);
      expect(item.typeId).assertEqual(0);
      expect(item.area[0]).assertEqual(1);
      expect(item.area[1]).assertEqual(1);
    })

    /**
     * @tc.name   testLayoutCacheInitiallyEmpty0007
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0700
     * @tc.desc   Test that a newly created layout model has an empty page cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLayoutCacheInitiallyEmpty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const model: DesktopLayoutModel = createModel();
      expect(model.getLayoutInfoCache().length).assertEqual(0);
    })

    /**
     * @tc.name   testAppItemFormInfoDelegation0008
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0800
     * @tc.desc   Test that getAppItemFormInfo delegates to the shared form model cache.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testAppItemFormInfoDelegation0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const card: CardItemInfo = new CardItemInfo();
      card.cardId = 31;
      card.cardName = 'DelegatedCard';
      card.bundleName = 'com.samples.delegate';
      card.abilityName = 'FormAbility';
      card.moduleName = 'entry';
      card.formConfigAbility = 'FormConfig';
      card.appLabelId = 'delegate_label';
      FormModel.setAppItemFormInfo('com.samples.delegate', [card]);
      const model: DesktopLayoutModel = createModel();
      const cards: CardItemInfo[] | undefined = model.getAppItemFormInfo('com.samples.delegate');
      expect(cards?.length).assertEqual(1);
      expect(cards?.[0].cardId).assertEqual(31);
      FormModel.setAppItemFormInfo('com.samples.delegate', []);
    })

    /**
     * @tc.name   testTwoRowsPosition0009
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_0900
     * @tc.desc   Test the row and column positions of the tenth application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTwoRowsPosition0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const apps: AppItemInfo[] = [];
      for (let i = 0; i < 10; i++) {
        apps.push(createApp(i));
      }
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos(apps);
      expect(pages.length).assertEqual(1);
      expect(pages[0].length).assertEqual(10);
      expect(pages[0][9].page).assertEqual(0);
      expect(pages[0][9].row).assertEqual(1);
      expect(pages[0][9].column).assertEqual(4);
    })

    /**
     * @tc.name   testFifthRowPosition0010
     * @tc.number SUB_LAUNCHER_ENTRY_DESKTOP_1000
     * @tc.desc   Test the row and column positions of the twenty-fifth application.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFifthRowPosition0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const apps: AppItemInfo[] = [];
      for (let i = 0; i < 25; i++) {
        apps.push(createApp(i));
      }
      const model: DesktopLayoutModel = createModel();
      const pages: Array<Array<GridLayoutItemInfo>> = model.initPositionInfos(apps);
      expect(pages.length).assertEqual(1);
      expect(pages[0].length).assertEqual(25);
      expect(pages[0][24].page).assertEqual(0);
      expect(pages[0][24].row).assertEqual(4);
      expect(pages[0][24].column).assertEqual(4);
    })

  })
}
