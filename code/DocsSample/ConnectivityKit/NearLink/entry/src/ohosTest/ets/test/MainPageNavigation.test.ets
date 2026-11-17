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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_NearLink]';
const BUNDLE: string = 'NearLink_';

export default function mainPageNavigationTest() {
  describe('NearLinkNavigationTest', () => {
    let driver: Driver;
    let delegator: abilityDelegatorRegistry.AbilityDelegator;

    beforeAll(async () => {
      delegator = abilityDelegatorRegistry.getAbilityDelegator();
      let bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
      let want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility',
        moduleName: 'entry'
      };
      await delegator.startAbility(want);
      driver = Driver.create();
      await driver.delayMs(2000);
    });

    /**
     * Navigate to Manager page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateManager_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateManager_001, begin');

      let menu = await driver.findComponent(ON.id('menu_ManagerPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateManager_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateManager_001, end');
    });

    /**
     * Navigate to Advertising page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateAdvertising_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateAdvertising_001, begin');

      let menu = await driver.findComponent(ON.id('menu_AdvertisingPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateAdvertising_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateAdvertising_001, end');
    });

    /**
     * Navigate to Scan page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateScan_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateScan_001, begin');

      let menu = await driver.findComponent(ON.id('menu_ScanConfigPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateScan_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateScan_001, end');
    });

    /**
     * Navigate to SSAP Server page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateSsapServer_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateSsapServer_001, begin');

      // Scroll down to ensure SSAP Server menu is visible
      await driver.swipe(500, 1500, 500, 800, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_SsapServerPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateSsapServer_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateSsapServer_001, end');
    });

    /**
     * Navigate to SSAP Client page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateSsapClient_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateSsapClient_001, begin');

      // Scroll down to ensure SSAP Client menu is visible
      await driver.swipe(500, 1500, 500, 800, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_SsapClientPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateSsapClient_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateSsapClient_001, end');
    });

    /**
     * Navigate to DataTransfer page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateDataTransfer_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateDataTransfer_001, begin');

      // Scroll down to ensure DataTransfer menu is visible
      await driver.swipe(500, 1500, 500, 500, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_DataTransferPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateDataTransfer_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateDataTransfer_001, end');
    });

    /**
     * Navigate to CDSM page and verify the page title is displayed correctly
     */
    it(BUNDLE + 'NavigateCdsm_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateCdsm_001, begin');

      // Scroll down to ensure CDSM menu is visible
      await driver.swipe(500, 1500, 500, 500, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_CdsmPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateCdsm_001, navTitle: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateCdsm_001, end');
    });

    /**
     * Verify navigation back to main page shows the title again
     */
    it(BUNDLE + 'NavigateBack_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateBack_001, begin');

      // Scroll back to top to ensure Manager menu is visible
      await driver.swipe(500, 500, 500, 1500, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_ManagerPage'));
      await menu.click();
      await driver.delayMs(1000);

      let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
      await backBtn.click();
      await driver.delayMs(500);

      let exist: boolean = false;
      try {
        await driver.findComponent(ON.id('main_title_text'));
        exist = true;
      } catch (e) {
        exist = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateBack_001, main title visible: %{public}s', String(exist));
      expect(exist).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateBack_001, end');
    });
  });
}
