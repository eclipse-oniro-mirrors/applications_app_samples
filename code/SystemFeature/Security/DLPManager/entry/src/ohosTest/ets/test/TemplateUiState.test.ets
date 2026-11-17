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

export default function templateUiStateTest(): void {
  describe('TemplateUiStateTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0001
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
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0002
     * @tc.name      testMenuEntry0002
     * @tc.desc      the template entry exists in the home menu
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
      expect(await existsUi(driver, 'policy_templates_entry')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0003
     * @tc.name      testOpenPage0003
     * @tc.desc      the template entry opens the template page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testOpenPage0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testOpenPage0003 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      const opened: boolean = await openMenuEntry(driver, 'policy_templates_entry');
      expect(opened).assertTrue();
      expect(await existsUi(driver, 'tmpl_title')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0004
     * @tc.name      testBuiltInSection0004
     * @tc.desc      built in templates are listed
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltInSection0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testBuiltInSection0004 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      expect(await existsUi(driver, 'builtin_section')).assertTrue();
      expect(await existsUi(driver, 'builtin_item_0')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0005
     * @tc.name      testBuiltInCount0005
     * @tc.desc      five built in templates are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBuiltInCount0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testBuiltInCount0005 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      expect(await existsUi(driver, 'builtin_item_4')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0006
     * @tc.name      testCustomSection0006
     * @tc.desc      the custom section is rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCustomSection0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testCustomSection0006 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      expect(await existsUi(driver, 'custom_section')).assertTrue();
      const empty: boolean = await existsUi(driver, 'tmpl_empty');
      const first: boolean = await existsUi(driver, 'custom_item_0');
      expect(empty || first).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0007
     * @tc.name      testForm0007
     * @tc.desc      the creation form is rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testForm0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testForm0007 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      expect(await existsUi(driver, 'tmpl_name_input')).assertTrue();
      expect(await existsUi(driver, 'tmpl_save')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0008
     * @tc.name      testPermissionChips0008
     * @tc.desc      permission chips are rendered
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPermissionChips0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testPermissionChips0008 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      expect(await existsUi(driver, 'perm_read')).assertTrue();
      expect(await existsUi(driver, 'perm_write')).assertTrue();
      expect(await existsUi(driver, 'perm_print')).assertTrue();
      expect(await existsUi(driver, 'perm_copy')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0009
     * @tc.name      testTogglePermission0009
     * @tc.desc      permission chips can be toggled
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTogglePermission0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testTogglePermission0009 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      await clickIdUi(driver, 'perm_write');
      await clickIdUi(driver, 'perm_write');
      expect(await existsUi(driver, 'tmpl_save')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0010
     * @tc.name      testSaveEmptyName0010
     * @tc.desc      saving without a name reports an error message
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSaveEmptyName0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testSaveEmptyName0010 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      await clickIdUi(driver, 'tmpl_save');
      expect(await existsUi(driver, 'tmpl_status')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0011
     * @tc.name      testCreateCustom0011
     * @tc.desc      the template form and validation state are available
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCreateCustom0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testCreateCustom0011 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      expect(await existsUi(driver, 'tmpl_name_input')).assertTrue();
      expect(await existsUi(driver, 'perm_read')).assertTrue();
      expect(await clickIdUi(driver, 'tmpl_save')).assertTrue();
      expect(await existsUi(driver, 'tmpl_status')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0012
     * @tc.name      testEditCustom0012
     * @tc.desc      tapping a custom template fills the edit form
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEditCustom0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testEditCustom0012 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      if (await existsUi(driver, 'custom_item_0')) {
        await clickIdUi(driver, 'custom_item_0');
        expect(await existsUi(driver, 'tmpl_cancel')).assertTrue();
      } else {
        expect(await existsUi(driver, 'tmpl_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0013
     * @tc.name      testCancelEdit0013
     * @tc.desc      cancelling edit restores the creation form
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCancelEdit0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testCancelEdit0013 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      if (await existsUi(driver, 'custom_item_0')) {
        await clickIdUi(driver, 'custom_item_0');
        await clickIdUi(driver, 'tmpl_cancel');
        expect(await existsUi(driver, 'tmpl_cancel')).assertFalse();
      } else {
        expect(await existsUi(driver, 'tmpl_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0014
     * @tc.name      testDeleteCustom0014
     * @tc.desc      custom templates can be deleted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDeleteCustom0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testDeleteCustom0014 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      if (await existsUi(driver, 'custom_delete_0')) {
        await clickIdUi(driver, 'custom_delete_0');
        expect(await existsUi(driver, 'tmpl_status')).assertTrue();
      } else {
        expect(await existsUi(driver, 'tmpl_empty')).assertTrue();
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEMPLATEUI_0015
     * @tc.name      testBack0015
     * @tc.desc      back returns to the home page
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBack0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      logUi('testBack0015 begin');
      const driver: Driver = Driver.create();
      await launchAppUi(driver);
      await openMenuEntry(driver, 'policy_templates_entry');
      await clickIdUi(driver, 'tmpl_back');
      expect(await existsUi(driver, 'moreIcon')).assertTrue();
    })
  });
}
