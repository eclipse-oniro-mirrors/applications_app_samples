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
      expect(await existsUi(driver, 'moreIcon')).assertTrue();
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
      expect(await existsUi(driver, 'recent_files_entry')).assertTrue();
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
      expect(opened).assertTrue();
      expect(await existsUi(driver, 'recents_title')).assertTrue();
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
      expect(empty || favorite || recent).assertTrue();
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
      expect(await existsUi(driver, 'moreIcon')).assertTrue();
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
      expect(await existsUi(driver, 'recents_title')).assertTrue();
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
      expect(await existsUi(driver, 'recents_title')).assertTrue();
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
        expect(await existsUi(driver, 'recent_section')).assertTrue();
      } else {
        expect(await existsUi(driver, 'recents_empty')).assertTrue();
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
        expect(await existsUi(driver, 'recents_title')).assertTrue();
      } else {
        expect(await existsUi(driver, 'recents_empty')).assertTrue();
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
        expect(await existsUi(driver, 'recents_title')).assertTrue();
      } else {
        expect(await existsUi(driver, 'recents_empty')).assertTrue();
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
      expect(await existsUi(driver, 'recents_title')).assertTrue();
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
      expect(await existsUi(driver, 'search_files_entry')).assertTrue();
      expect(await existsUi(driver, 'policy_templates_entry')).assertTrue();
      expect(await existsUi(driver, 'settings_entry')).assertTrue();
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
        expect(await existsUi(driver, 'recents_status')).assertTrue();
      } else {
        expect(await existsUi(driver, 'recents_empty')).assertTrue();
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
      expect(await existsUi(driver, 'recents_title')).assertTrue();
      expect(await existsUi(driver, 'recents_back')).assertTrue();
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
      expect(await existsUi(driver, 'moreIcon')).assertTrue();
    })
  });
}
