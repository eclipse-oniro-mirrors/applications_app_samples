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
const TAG: string = '[Sample_LocationKit]';
const BUNDLE: string = 'LocationKit_';

async function openApp(): Promise<Driver> {
  let delegator = abilityDelegatorRegistry.getAbilityDelegator();
  let bundleName: string = abilityDelegatorRegistry.getArguments().bundleName;
  let want: Want = {
    bundleName: bundleName,
    abilityName: 'EntryAbility',
    moduleName: 'entry'
  };
  await delegator.startAbility(want);
  let driver = Driver.create();
  await driver.delayMs(2000);
  return driver;
}

async function backToMainIfSubPage(driver: Driver): Promise<void> {
  try {
    let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
    if (backBtn !== null) {
      await driver.pressBack();
      await driver.delayMs(1000);
    }
  } catch (e) {
    // Already on the main page.
  }
}

export default function mainPageNavigationTest() {
  describe('LocationKitNavigationTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = await openApp();
      await backToMainIfSubPage(driver);
    });

    /**
     * Navigate to Location page and verify the page title is displayed
     */
    it(BUNDLE + 'NavigateLocation_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocation_001, begin');

      let menu = await driver.findComponent(ON.id('menu_LocationPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocation_001, navTitle: %{public}s', titleText);
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocation_001, titleText: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocation_001, end');
    });

    /**
     * Navigate to Geocode page and verify the page title is displayed
     */
    it(BUNDLE + 'NavigateGeocode_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeocode_001, begin');

      let menu = await driver.findComponent(ON.id('menu_GeocodePage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeocode_001, navTitle: %{public}s', titleText);
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeocode_001, titleText: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeocode_001, end');
    });

    /**
     * Navigate to Geofence page and verify the page title is displayed
     */
    it(BUNDLE + 'NavigateGeofence_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeofence_001, begin');

      // Scroll down to ensure Geofence menu is visible
      await driver.swipe(500, 1500, 500, 800, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_GeofencePage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeofence_001, navTitle: %{public}s', titleText);
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeofence_001, titleText: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateGeofence_001, end');
    });

    /**
     * Navigate to Location C API page and verify the page title is displayed
     */
    it(BUNDLE + 'NavigateLocationCapi_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocationCapi_001, begin');

      // Scroll down to ensure Location C API menu is visible
      await driver.swipe(500, 1500, 500, 800, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_LocationCapiPage'));
      await menu.click();
      await driver.delayMs(1000);

      try {
        let navTitle = await driver.findComponent(ON.id('nav_title_text'));
        let titleText: string = await navTitle.getText();
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocationCapi_001, navTitle: %{public}s', titleText);
        hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocationCapi_001, titleText: %{public}s', titleText);
        expect(titleText.length > 0).assertTrue();
      } finally {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        await backBtn.click();
        await driver.delayMs(500);
      }

      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateLocationCapi_001, end');
    });

    /**
     * Verify navigation back to main page shows the title again
     */
    it(BUNDLE + 'NavigateBack_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'NavigateBack_001, begin');

      await driver.swipe(500, 800, 500, 1500, 600);
      await driver.delayMs(500);
      let menu = await driver.findComponent(ON.id('menu_LocationPage'));
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
