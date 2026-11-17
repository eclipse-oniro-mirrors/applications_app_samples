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
import { existsUi, clickIdUi, inputIdUi, launchAppUi, openMenuEntry, sleepUi, logUi } from './UiCommon';

export default function settingsUiStateTest(): void {
  describe('SettingsUiStateTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0001
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
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0002
     * @tc.name      testMenuEntry0002
     * @tc.desc      the settings entry exists in the home menu
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
      const assertOk2: boolean = await existsUi(driver, 'settings_entry');
      logUi('testMenuEntry0002 check2: await existsUi(driver, \'settings_entry\') = ' + String(assertOk2));
      expect(assertOk2).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0003
     * @tc.name      testOpenPage0003
     * @tc.desc      the settings entry opens the settings page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenPage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testOpenPage0003 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      const opened: boolean = await openMenuEntry(driver, 'settings_entry');
      const assertOk3: boolean = opened;
      logUi('testOpenPage0003 check3: opened = ' + String(assertOk3));
      expect(assertOk3).assertTrue();
      const assertOk4: boolean = await existsUi(driver, 'settings_title');
      logUi('testOpenPage0003 check4: await existsUi(driver, \'settings_title\') = ' + String(assertOk4));
      expect(assertOk4).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0004
     * @tc.name      testLogChips0004
     * @tc.desc      log level options are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLogChips0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testLogChips0004 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      const assertOk5: boolean = await existsUi(driver, 'log_debug');
      logUi('testLogChips0004 check5: await existsUi(driver, \'log_debug\') = ' + String(assertOk5));
      expect(assertOk5).assertTrue();
      const assertOk6: boolean = await existsUi(driver, 'log_info');
      logUi('testLogChips0004 check6: await existsUi(driver, \'log_info\') = ' + String(assertOk6));
      expect(assertOk6).assertTrue();
      const assertOk7: boolean = await existsUi(driver, 'log_warn');
      logUi('testLogChips0004 check7: await existsUi(driver, \'log_warn\') = ' + String(assertOk7));
      expect(assertOk7).assertTrue();
      const assertOk8: boolean = await existsUi(driver, 'log_error');
      logUi('testLogChips0004 check8: await existsUi(driver, \'log_error\') = ' + String(assertOk8));
      expect(assertOk8).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0005
     * @tc.name      testPageChips0005
     * @tc.desc      page size options are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPageChips0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testPageChips0005 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      const assertOk9: boolean = await existsUi(driver, 'page_10');
      logUi('testPageChips0005 check9: await existsUi(driver, \'page_10\') = ' + String(assertOk9));
      expect(assertOk9).assertTrue();
      const assertOk10: boolean = await existsUi(driver, 'page_50');
      logUi('testPageChips0005 check10: await existsUi(driver, \'page_50\') = ' + String(assertOk10));
      expect(assertOk10).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0006
     * @tc.name      testThemeChips0006
     * @tc.desc      theme options are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThemeChips0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testThemeChips0006 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      const assertOk11: boolean = await existsUi(driver, 'theme_light');
      logUi('testThemeChips0006 check11: await existsUi(driver, \'theme_light\') = ' + String(assertOk11));
      expect(assertOk11).assertTrue();
      const assertOk12: boolean = await existsUi(driver, 'theme_dark');
      logUi('testThemeChips0006 check12: await existsUi(driver, \'theme_dark\') = ' + String(assertOk12));
      expect(assertOk12).assertTrue();
      const assertOk13: boolean = await existsUi(driver, 'theme_auto');
      logUi('testThemeChips0006 check13: await existsUi(driver, \'theme_auto\') = ' + String(assertOk13));
      expect(assertOk13).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0007
     * @tc.name      testTemplateChips0007
     * @tc.desc      default template options are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTemplateChips0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testTemplateChips0007 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      const assertOk14: boolean = await existsUi(driver, 'default_readonly');
      logUi('testTemplateChips0007 check14: await existsUi(driver, \'default_readonly\') = ' + String(assertOk14));
      expect(assertOk14).assertTrue();
      const assertOk15: boolean = await existsUi(driver, 'default_full');
      logUi('testTemplateChips0007 check15: await existsUi(driver, \'default_full\') = ' + String(assertOk15));
      expect(assertOk15).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0008
     * @tc.name      testConfirmSwitch0008
     * @tc.desc      the confirmation switch exists
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testConfirmSwitch0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testConfirmSwitch0008 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      const assertOk16: boolean = await existsUi(driver, 'confirm_switch');
      logUi('testConfirmSwitch0008 check16: await existsUi(driver, \'confirm_switch\') = ' + String(assertOk16));
      expect(assertOk16).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0009
     * @tc.name      testSelectLogLevel0009
     * @tc.desc      selecting a log level keeps the page usable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSelectLogLevel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testSelectLogLevel0009 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      await clickIdUi(driver, 'log_debug');
      const assertOk17: boolean = await existsUi(driver, 'settings_save');
      logUi('testSelectLogLevel0009 check17: await existsUi(driver, \'settings_save\') = ' + String(assertOk17));
      expect(assertOk17).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0010
     * @tc.name      testSave0010
     * @tc.desc      saving reports a status
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSave0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testSave0010 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      await clickIdUi(driver, 'settings_save');
      const assertOk18: boolean = await existsUi(driver, 'settings_status');
      logUi('testSave0010 check18: await existsUi(driver, \'settings_status\') = ' + String(assertOk18));
      expect(assertOk18).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0011
     * @tc.name      testReset0011
     * @tc.desc      restoring defaults reports a status
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testReset0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testReset0011 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      await clickIdUi(driver, 'settings_reset');
      const assertOk19: boolean = await existsUi(driver, 'settings_status');
      logUi('testReset0011 check19: await existsUi(driver, \'settings_status\') = ' + String(assertOk19));
      expect(assertOk19).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0012
     * @tc.name      testErrorCenterEntry0012
     * @tc.desc      the error center entry is available
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCenterEntry0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testErrorCenterEntry0012 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      const assertOk20: boolean = await existsUi(driver, 'error_center_entry');
      logUi('testErrorCenterEntry0012 check20: await existsUi(driver, \'error_center_entry\') = ' + String(assertOk20));
      expect(assertOk20).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0013
     * @tc.name      testOpenErrorCenter0013
     * @tc.desc      the error center page can be opened
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenErrorCenter0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testOpenErrorCenter0013 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      await clickIdUi(driver, 'error_center_entry');
      const assertOk21: boolean = await existsUi(driver, 'error_title');
      logUi('testOpenErrorCenter0013 check21: await existsUi(driver, \'error_title\') = ' + String(assertOk21));
      expect(assertOk21).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0014
     * @tc.name      testErrorCategories0014
     * @tc.desc      error category chips are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorCategories0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testErrorCategories0014 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      await clickIdUi(driver, 'error_center_entry');
      const assertOk22: boolean = await existsUi(driver, 'cat_all');
      logUi('testErrorCategories0014 check22: await existsUi(driver, \'cat_all\') = ' + String(assertOk22));
      expect(assertOk22).assertTrue();
      const assertOk23: boolean = await existsUi(driver, 'cat_file');
      logUi('testErrorCategories0014 check23: await existsUi(driver, \'cat_file\') = ' + String(assertOk23));
      expect(assertOk23).assertTrue();
      const assertOk24: boolean = await existsUi(driver, 'cat_permission');
      logUi('testErrorCategories0014 check24: await existsUi(driver, \'cat_permission\') = ' + String(assertOk24));
      expect(assertOk24).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_SETTINGSUI_0015
     * @tc.name      testErrorFilter0015
     * @tc.desc      error categories can be selected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testErrorFilter0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testErrorFilter0015 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'settings_entry');
      await clickIdUi(driver, 'error_center_entry');
      await clickIdUi(driver, 'cat_file');
      const assertOk25: boolean = await existsUi(driver, 'error_count');
      logUi('testErrorFilter0015 check25: await existsUi(driver, \'error_count\') = ' + String(assertOk25));
      expect(assertOk25).assertTrue();
    })
  });
}
