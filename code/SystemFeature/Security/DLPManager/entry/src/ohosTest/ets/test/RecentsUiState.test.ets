/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { Driver } from '@ohos.UiTest';
import { existsUi, clickIdUi, launchAppUi, openMenuEntry, sleepUi, logUi } from './UiCommon';

export default function recentsUiStateTest(): void {
  describe('RecentsUiStateTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0001
     * @tc.name      testLaunch0001
     * @tc.desc      application launches with the home entry
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLaunch0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testLaunch0001 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      const assertOk1: boolean = await existsUi(driver, 'moreIcon');
      logUi('testLaunch0001 check1: await existsUi(driver, \'moreIcon\') = ' + String(assertOk1));
      expect(assertOk1).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0002
     * @tc.name      testMenuEntry0002
     * @tc.desc      the recent entry exists in the home menu
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMenuEntry0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testMenuEntry0002 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await clickIdUi(driver, 'moreIcon');
      await sleepUi(400);
      const assertOk2: boolean = await existsUi(driver, 'recent_files_entry');
      logUi('testMenuEntry0002 check2: await existsUi(driver, \'recent_files_entry\') = ' + String(assertOk2));
      expect(assertOk2).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0003
     * @tc.name      testOpenPage0003
     * @tc.desc      the recent entry opens the recents page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenPage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testOpenPage0003 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      const opened: boolean = await openMenuEntry(driver, 'recent_files_entry');
      const assertOk3: boolean = opened;
      logUi('testOpenPage0003 check3: opened = ' + String(assertOk3));
      expect(assertOk3).assertTrue();
      const assertOk4: boolean = await existsUi(driver, 'recents_title');
      logUi('testOpenPage0003 check4: await existsUi(driver, \'recents_title\') = ' + String(assertOk4));
      expect(assertOk4).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0004
     * @tc.name      testInitialState0004
     * @tc.desc      the page shows either records or the empty hint
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInitialState0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testInitialState0004 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      const empty: boolean = await existsUi(driver, 'recents_empty');
      const favorite: boolean = await existsUi(driver, 'favorite_item_0');
      const recent: boolean = await existsUi(driver, 'recent_item_0');
      const assertOk5: boolean = empty || favorite || recent;
      logUi('testInitialState0004 check5: empty || favorite || recent = ' + String(assertOk5));
      expect(assertOk5).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0005
     * @tc.name      testBack0005
     * @tc.desc      back returns to the home page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBack0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testBack0005 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      await clickIdUi(driver, 'recents_back');
      const assertOk6: boolean = await existsUi(driver, 'moreIcon');
      logUi('testBack0005 check6: await existsUi(driver, \'moreIcon\') = ' + String(assertOk6));
      expect(assertOk6).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0006
     * @tc.name      testRefresh0006
     * @tc.desc      refresh keeps the page stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRefresh0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testRefresh0006 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      await clickIdUi(driver, 'recents_refresh');
      const assertOk7: boolean = await existsUi(driver, 'recents_title');
      logUi('testRefresh0006 check7: await existsUi(driver, \'recents_title\') = ' + String(assertOk7));
      expect(assertOk7).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0007
     * @tc.name      testClear0007
     * @tc.desc      clearing recent records keeps the page stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClear0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testClear0007 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      await clickIdUi(driver, 'recents_clear');
      const assertOk8: boolean = await existsUi(driver, 'recents_title');
      logUi('testClear0007 check8: await existsUi(driver, \'recents_title\') = ' + String(assertOk8));
      expect(assertOk8).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0008
     * @tc.name      testSections0008
     * @tc.desc      recent section is shown once records exist
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSections0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testSections0008 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      if (await existsUi(driver, 'recent_item_0')) {
        const assertOk9: boolean = await existsUi(driver, 'recent_section');
        logUi('testSections0008 check9: await existsUi(driver, \'recent_section\') = ' + String(assertOk9));
        expect(assertOk9).assertTrue();
      } else {
        const assertOk10: boolean = await existsUi(driver, 'recents_empty');
        logUi('testSections0008 check10: await existsUi(driver, \'recents_empty\') = ' + String(assertOk10));
        expect(assertOk10).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0009
     * @tc.name      testFavoriteToggle0009
     * @tc.desc      favorite toggle keeps the list usable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFavoriteToggle0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testFavoriteToggle0009 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      if (await existsUi(driver, 'recent_fav_0')) {
        await clickIdUi(driver, 'recent_fav_0');
        const assertOk11: boolean = await existsUi(driver, 'recents_title');
        logUi('testFavoriteToggle0009 check11: await existsUi(driver, \'recents_title\') = ' + String(assertOk11));
        expect(assertOk11).assertTrue();
      } else {
        const assertOk12: boolean = await existsUi(driver, 'recents_empty');
        logUi('testFavoriteToggle0009 check12: await existsUi(driver, \'recents_empty\') = ' + String(assertOk12));
        expect(assertOk12).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0010
     * @tc.name      testRemoveItem0010
     * @tc.desc      removing a record keeps the page usable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRemoveItem0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testRemoveItem0010 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      if (await existsUi(driver, 'recent_remove_0')) {
        await clickIdUi(driver, 'recent_remove_0');
        const assertOk13: boolean = await existsUi(driver, 'recents_title');
        logUi('testRemoveItem0010 check13: await existsUi(driver, \'recents_title\') = ' + String(assertOk13));
        expect(assertOk13).assertTrue();
      } else {
        const assertOk14: boolean = await existsUi(driver, 'recents_empty');
        logUi('testRemoveItem0010 check14: await existsUi(driver, \'recents_empty\') = ' + String(assertOk14));
        expect(assertOk14).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0011
     * @tc.name      testOpenTwice0011
     * @tc.desc      the page can be opened repeatedly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenTwice0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testOpenTwice0011 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      await clickIdUi(driver, 'recents_back');
      await openMenuEntry(driver, 'recent_files_entry');
      const assertOk15: boolean = await existsUi(driver, 'recents_title');
      logUi('testOpenTwice0011 check15: await existsUi(driver, \'recents_title\') = ' + String(assertOk15));
      expect(assertOk15).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0012
     * @tc.name      testOtherEntries00012
     * @tc.desc      other menu entries remain available
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOtherEntries00012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testOtherEntries00012 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await clickIdUi(driver, 'moreIcon');
      await sleepUi(400);
      const assertOk16: boolean = await existsUi(driver, 'search_files_entry');
      logUi('testOtherEntries00012 check16: await existsUi(driver, \'search_files_entry\') = ' + String(assertOk16));
      expect(assertOk16).assertTrue();
      const assertOk17: boolean = await existsUi(driver, 'policy_templates_entry');
      logUi('testOtherEntries00012 check17: await existsUi(driver, \'policy_templates_entry\') = ' +
        String(assertOk17));
      expect(assertOk17).assertTrue();
      const assertOk18: boolean = await existsUi(driver, 'settings_entry');
      logUi('testOtherEntries00012 check18: await existsUi(driver, \'settings_entry\') = ' + String(assertOk18));
      expect(assertOk18).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0013
     * @tc.name      testStatusAfterRefresh0013
     * @tc.desc      refresh reports a status when the list exists
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testStatusAfterRefresh0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testStatusAfterRefresh0013 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      await clickIdUi(driver, 'recents_refresh');
      if (await existsUi(driver, 'recent_item_0')) {
        const assertOk19: boolean = await existsUi(driver, 'recents_status');
        logUi('testStatusAfterRefresh0013 check19: await existsUi(driver, \'recents_status\') = ' + String(assertOk19));
        expect(assertOk19).assertTrue();
      } else {
        const assertOk20: boolean = await existsUi(driver, 'recents_empty');
        logUi('testStatusAfterRefresh0013 check20: await existsUi(driver, \'recents_empty\') = ' + String(assertOk20));
        expect(assertOk20).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0014
     * @tc.name      testTitleVisible0014
     * @tc.desc      the page title is visible
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTitleVisible0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testTitleVisible0014 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      const assertOk21: boolean = await existsUi(driver, 'recents_title');
      logUi('testTitleVisible0014 check21: await existsUi(driver, \'recents_title\') = ' + String(assertOk21));
      expect(assertOk21).assertTrue();
      const assertOk22: boolean = await existsUi(driver, 'recents_back');
      logUi('testTitleVisible0014 check22: await existsUi(driver, \'recents_back\') = ' + String(assertOk22));
      expect(assertOk22).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_RECENTSUI_0015
     * @tc.name      testClearThenBack0015
     * @tc.desc      navigation still works after clearing
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testClearThenBack0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testClearThenBack0015 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'recent_files_entry');
      await clickIdUi(driver, 'recents_clear');
      await clickIdUi(driver, 'recents_back');
      const assertOk23: boolean = await existsUi(driver, 'moreIcon');
      logUi('testClearThenBack0015 check23: await existsUi(driver, \'moreIcon\') = ' + String(assertOk23));
      expect(assertOk23).assertTrue();
    })
  });
}
