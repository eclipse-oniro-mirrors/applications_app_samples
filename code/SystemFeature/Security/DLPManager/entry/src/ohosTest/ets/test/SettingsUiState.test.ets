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
      expect(await existsUi(driver, 'moreIcon')).assertTrue();
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
      expect(await existsUi(driver, 'settings_entry')).assertTrue();
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
      expect(opened).assertTrue();
      expect(await existsUi(driver, 'settings_title')).assertTrue();
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
      expect(await existsUi(driver, 'log_debug')).assertTrue();
      expect(await existsUi(driver, 'log_info')).assertTrue();
      expect(await existsUi(driver, 'log_warn')).assertTrue();
      expect(await existsUi(driver, 'log_error')).assertTrue();
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
      expect(await existsUi(driver, 'page_10')).assertTrue();
      expect(await existsUi(driver, 'page_50')).assertTrue();
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
      expect(await existsUi(driver, 'theme_light')).assertTrue();
      expect(await existsUi(driver, 'theme_dark')).assertTrue();
      expect(await existsUi(driver, 'theme_auto')).assertTrue();
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
      expect(await existsUi(driver, 'default_readonly')).assertTrue();
      expect(await existsUi(driver, 'default_full')).assertTrue();
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
      expect(await existsUi(driver, 'confirm_switch')).assertTrue();
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
      expect(await existsUi(driver, 'settings_save')).assertTrue();
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
      expect(await existsUi(driver, 'settings_status')).assertTrue();
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
      expect(await existsUi(driver, 'settings_status')).assertTrue();
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
      expect(await existsUi(driver, 'error_center_entry')).assertTrue();
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
      expect(await existsUi(driver, 'error_title')).assertTrue();
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
      expect(await existsUi(driver, 'cat_all')).assertTrue();
      expect(await existsUi(driver, 'cat_file')).assertTrue();
      expect(await existsUi(driver, 'cat_permission')).assertTrue();
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
      expect(await existsUi(driver, 'error_count')).assertTrue();
    })
  });
}
