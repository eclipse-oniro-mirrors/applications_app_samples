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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_VCard]';
const WAIT_MS: number = 500;
const PREVIEW_WAIT_MS: number = 1000;
const LAUNCH_WAIT_MS: number = 2000;

export default function vCardTest() {
  describe('VCardTest', () => {
    beforeAll(async () => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, launch EntryAbility');
      const want: Want = {
        bundleName: 'com.samples.vcard',
        abilityName: 'EntryAbility'
      };
      await abilityDelegatorRegistry.getAbilityDelegator().startAbility(want);
      const driver = Driver.create();
      await driver.delayMs(LAUNCH_WAIT_MS);
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'setup, end');
    })

    /**
     * @tc.number    SUB_VCARD_UI_MAINTABS_0100
     * @tc.name      testMainTabs0001
     * @tc.desc      Verify the home page brand title and tab switching across contacts,
     *               toolbox, history and settings, asserting each tab shows its root container.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testMainTabs0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testMainTabs0001';
      const driver = Driver.create();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_main_title');
      await driver.assertComponentExist(ON.id('id_main_title'));
      await driver.delayMs(WAIT_MS);

      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_toolbox');
      const toolboxTab = await driver.findComponent(ON.id('id_tab_toolbox'));
      await toolboxTab.click();
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_toolbox_root');
      await driver.assertComponentExist(ON.id('id_toolbox_root'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_history');
      const historyTab = await driver.findComponent(ON.id('id_tab_history'));
      await historyTab.click();
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_history_root');
      await driver.assertComponentExist(ON.id('id_history_root'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_settings');
      const settingsTab = await driver.findComponent(ON.id('id_tab_settings'));
      await settingsTab.click();
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_settings_root');
      await driver.assertComponentExist(ON.id('id_settings_root'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_contacts');
      const contactsTab = await driver.findComponent(ON.id('id_tab_contacts'));
      await contactsTab.click();
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_contacts_root');
      await driver.assertComponentExist(ON.id('id_contacts_root'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_UI_CONTACTS_0100
     * @tc.name      testContactsPermission0001
     * @tc.desc      Verify the contacts page shows the permission entry when unauthorized
     *               or the contact list when authorized, and the search bar exists in both states.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testContactsPermission0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testContactsPermission0001';
      const driver = Driver.create();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_contacts');
      const contactsTab = await driver.findComponent(ON.id('id_tab_contacts'));
      await contactsTab.click();
      await driver.delayMs(WAIT_MS);

      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_contacts_root');
      await driver.assertComponentExist(ON.id('id_contacts_root'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_contacts_search');
      await driver.assertComponentExist(ON.id('id_contacts_search'));

      // 未授权时必须出现申请权限按钮
      let hasPermissionButton: boolean = false;
      try {
        hilog.info(DOMAIN, TAG, '%{public}s', 'check exist, id: id_contacts_permission_button');
        await driver.assertComponentExist(ON.id('id_contacts_permission_button'));
        hasPermissionButton = true;
      } catch (error) {
        hasPermissionButton = false;
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        'id_contacts_permission_button visible: ' + (hasPermissionButton ? 'true' : 'false'));

      // 已授权时必须出现联系人列表，二者至少存在其一
      let hasContactList: boolean = false;
      if (!hasPermissionButton) {
        try {
          hilog.info(DOMAIN, TAG, '%{public}s', 'check exist, id: id_contacts_list');
          await driver.assertComponentExist(ON.id('id_contacts_list'));
          hasContactList = true;
        } catch (error) {
          hasContactList = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert permission button or contact list exists');
      expect(hasPermissionButton || hasContactList).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_UI_TOOLBOX_0100
     * @tc.name      testToolboxPreview0001
     * @tc.desc      Verify the toolbox page shows pick-file, sample-import and export entries,
     *               and clicking sample import opens the parse preview panel.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testToolboxPreview0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testToolboxPreview0001';
      const driver = Driver.create();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_toolbox');
      const toolboxTab = await driver.findComponent(ON.id('id_tab_toolbox'));
      await toolboxTab.click();
      await driver.delayMs(WAIT_MS);

      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_toolbox_pick');
      await driver.assertComponentExist(ON.id('id_toolbox_pick'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_toolbox_sample');
      await driver.assertComponentExist(ON.id('id_toolbox_sample'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_toolbox_sample');
      const sampleButton = await driver.findComponent(ON.id('id_toolbox_sample'));
      await sampleButton.click();
      await driver.delayMs(PREVIEW_WAIT_MS);
      // getDisplaySize returns Point: x = display width, y = display height
      const display = await driver.getDisplaySize();
      // swipe up a bit so the expanded preview card enters the viewport
      await driver.swipe(display.x / 2, display.y * 0.85, display.x / 2, display.y * 0.55, 1200);
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_toolbox_preview');
      await driver.assertComponentExist(ON.id('id_toolbox_preview'));
      // the export card sits at the bottom of a long scroll page, keep swiping up to reveal it
      await driver.swipe(display.x / 2, display.y * 0.8, display.x / 2, display.y * 0.2, 1200);
      await driver.delayMs(WAIT_MS);
      await driver.swipe(display.x / 2, display.y * 0.8, display.x / 2, display.y * 0.2, 1200);
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_toolbox_export');
      await driver.assertComponentExist(ON.id('id_toolbox_export'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_UI_HISTORY_0100
     * @tc.name      testHistoryPage0001
     * @tc.desc      Verify the history page root container exists with its all and import
     *               filter options available.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testHistoryPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testHistoryPage0001';
      const driver = Driver.create();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_history');
      const historyTab = await driver.findComponent(ON.id('id_tab_history'));
      await historyTab.click();
      await driver.delayMs(WAIT_MS);

      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_history_root');
      await driver.assertComponentExist(ON.id('id_history_root'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_history_filter_all');
      await driver.assertComponentExist(ON.id('id_history_filter_all'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_history_filter_import');
      await driver.assertComponentExist(ON.id('id_history_filter_import'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })

    /**
     * @tc.number    SUB_VCARD_UI_SETTINGS_0100
     * @tc.name      testSettingsPage0001
     * @tc.desc      Verify the settings page shows three default version options and the
     *               auto-jump switch, and the 3.0 option still exists after being clicked.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSettingsPage0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSettingsPage0001';
      const driver = Driver.create();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_tab_settings');
      const settingsTab = await driver.findComponent(ON.id('id_tab_settings'));
      await settingsTab.click();
      await driver.delayMs(WAIT_MS);

      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_settings_version_21');
      await driver.assertComponentExist(ON.id('id_settings_version_21'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_settings_version_30');
      await driver.assertComponentExist(ON.id('id_settings_version_30'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_settings_version_40');
      await driver.assertComponentExist(ON.id('id_settings_version_40'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist, id: id_settings_auto_jump');
      await driver.assertComponentExist(ON.id('id_settings_auto_jump'));

      hilog.info(DOMAIN, TAG, '%{public}s', 'click, id: id_settings_version_30');
      const version30 = await driver.findComponent(ON.id('id_settings_version_30'));
      await version30.click();
      await driver.delayMs(WAIT_MS);
      hilog.info(DOMAIN, TAG, '%{public}s', 'assert exist after click, id: id_settings_version_30');
      await driver.assertComponentExist(ON.id('id_settings_version_30'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    })
  })
}
