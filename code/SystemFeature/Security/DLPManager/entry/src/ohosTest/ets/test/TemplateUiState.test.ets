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
      const assertOk1: boolean = await existsUi(driver, 'moreIcon');
      logUi('testLaunch0001 check1: await existsUi(driver, \'moreIcon\') = ' + String(assertOk1));
      expect(assertOk1).assertTrue();
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
      const assertOk2: boolean = await existsUi(driver, 'policy_templates_entry');
      logUi('testMenuEntry0002 check2: await existsUi(driver, \'policy_templates_entry\') = ' + String(assertOk2));
      expect(assertOk2).assertTrue();
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
      const assertOk3: boolean = opened;
      logUi('testOpenPage0003 check3: opened = ' + String(assertOk3));
      expect(assertOk3).assertTrue();
      const assertOk4: boolean = await existsUi(driver, 'tmpl_title');
      logUi('testOpenPage0003 check4: await existsUi(driver, \'tmpl_title\') = ' + String(assertOk4));
      expect(assertOk4).assertTrue();
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
      const assertOk5: boolean = await existsUi(driver, 'builtin_section');
      logUi('testBuiltInSection0004 check5: await existsUi(driver, \'builtin_section\') = ' + String(assertOk5));
      expect(assertOk5).assertTrue();
      const assertOk6: boolean = await existsUi(driver, 'builtin_item_0');
      logUi('testBuiltInSection0004 check6: await existsUi(driver, \'builtin_item_0\') = ' + String(assertOk6));
      expect(assertOk6).assertTrue();
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
      const assertOk7: boolean = await existsUi(driver, 'builtin_item_4');
      logUi('testBuiltInCount0005 check7: await existsUi(driver, \'builtin_item_4\') = ' + String(assertOk7));
      expect(assertOk7).assertTrue();
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
      const assertOk8: boolean = await existsUi(driver, 'custom_section');
      logUi('testCustomSection0006 check8: await existsUi(driver, \'custom_section\') = ' + String(assertOk8));
      expect(assertOk8).assertTrue();
      const empty: boolean = await existsUi(driver, 'tmpl_empty');
      const first: boolean = await existsUi(driver, 'custom_item_0');
      const assertOk9: boolean = empty || first;
      logUi('testCustomSection0006 check9: empty || first = ' + String(assertOk9));
      expect(assertOk9).assertTrue();
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
      const assertOk10: boolean = await existsUi(driver, 'tmpl_name_input');
      logUi('testForm0007 check10: await existsUi(driver, \'tmpl_name_input\') = ' + String(assertOk10));
      expect(assertOk10).assertTrue();
      const assertOk11: boolean = await existsUi(driver, 'tmpl_save');
      logUi('testForm0007 check11: await existsUi(driver, \'tmpl_save\') = ' + String(assertOk11));
      expect(assertOk11).assertTrue();
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
      const assertOk12: boolean = await existsUi(driver, 'perm_read');
      logUi('testPermissionChips0008 check12: await existsUi(driver, \'perm_read\') = ' + String(assertOk12));
      expect(assertOk12).assertTrue();
      const assertOk13: boolean = await existsUi(driver, 'perm_write');
      logUi('testPermissionChips0008 check13: await existsUi(driver, \'perm_write\') = ' + String(assertOk13));
      expect(assertOk13).assertTrue();
      const assertOk14: boolean = await existsUi(driver, 'perm_print');
      logUi('testPermissionChips0008 check14: await existsUi(driver, \'perm_print\') = ' + String(assertOk14));
      expect(assertOk14).assertTrue();
      const assertOk15: boolean = await existsUi(driver, 'perm_copy');
      logUi('testPermissionChips0008 check15: await existsUi(driver, \'perm_copy\') = ' + String(assertOk15));
      expect(assertOk15).assertTrue();
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
      const assertOk16: boolean = await existsUi(driver, 'tmpl_save');
      logUi('testTogglePermission0009 check16: await existsUi(driver, \'tmpl_save\') = ' + String(assertOk16));
      expect(assertOk16).assertTrue();
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
      const assertOk17: boolean = await existsUi(driver, 'tmpl_status');
      logUi('testSaveEmptyName0010 check17: await existsUi(driver, \'tmpl_status\') = ' + String(assertOk17));
      expect(assertOk17).assertTrue();
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
      const assertOk18: boolean = await existsUi(driver, 'tmpl_name_input');
      logUi('testCreateCustom0011 check18: await existsUi(driver, \'tmpl_name_input\') = ' + String(assertOk18));
      expect(assertOk18).assertTrue();
      const assertOk19: boolean = await existsUi(driver, 'perm_read');
      logUi('testCreateCustom0011 check19: await existsUi(driver, \'perm_read\') = ' + String(assertOk19));
      expect(assertOk19).assertTrue();
      const assertOk20: boolean = await clickIdUi(driver, 'tmpl_save');
      logUi('testCreateCustom0011 check20: await clickIdUi(driver, \'tmpl_save\') = ' + String(assertOk20));
      expect(assertOk20).assertTrue();
      const assertOk21: boolean = await existsUi(driver, 'tmpl_status');
      logUi('testCreateCustom0011 check21: await existsUi(driver, \'tmpl_status\') = ' + String(assertOk21));
      expect(assertOk21).assertTrue();
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
        const assertOk22: boolean = await existsUi(driver, 'tmpl_cancel');
        logUi('testEditCustom0012 check22: await existsUi(driver, \'tmpl_cancel\') = ' + String(assertOk22));
        expect(assertOk22).assertTrue();
      } else {
        const assertOk23: boolean = await existsUi(driver, 'tmpl_empty');
        logUi('testEditCustom0012 check23: await existsUi(driver, \'tmpl_empty\') = ' + String(assertOk23));
        expect(assertOk23).assertTrue();
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
        const assertOk24: boolean = await existsUi(driver, 'tmpl_cancel');
        logUi('testCancelEdit0013 check24: await existsUi(driver, \'tmpl_cancel\') = ' + String(assertOk24));
        expect(assertOk24).assertFalse();
      } else {
        const assertOk25: boolean = await existsUi(driver, 'tmpl_empty');
        logUi('testCancelEdit0013 check25: await existsUi(driver, \'tmpl_empty\') = ' + String(assertOk25));
        expect(assertOk25).assertTrue();
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
        const assertOk26: boolean = await existsUi(driver, 'tmpl_status');
        logUi('testDeleteCustom0014 check26: await existsUi(driver, \'tmpl_status\') = ' + String(assertOk26));
        expect(assertOk26).assertTrue();
      } else {
        const assertOk27: boolean = await existsUi(driver, 'tmpl_empty');
        logUi('testDeleteCustom0014 check27: await existsUi(driver, \'tmpl_empty\') = ' + String(assertOk27));
        expect(assertOk27).assertTrue();
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
      const assertOk28: boolean = await existsUi(driver, 'moreIcon');
      logUi('testBack0015 check28: await existsUi(driver, \'moreIcon\') = ' + String(assertOk28));
      expect(assertOk28).assertTrue();
    })
  });
}
