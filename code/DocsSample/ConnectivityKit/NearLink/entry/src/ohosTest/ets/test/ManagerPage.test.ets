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

export default function managerPageTest() {
  describe('NearLinkManagerPageTest', () => {
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
      // Ensure we are on main page: use system back if on a sub-page
      let onSubPage: boolean = false;
      try {
        let backBtn = await driver.findComponent(ON.id('btn_nav_back'));
        if (backBtn !== null) {
          onSubPage = true;
        }
      } catch (e) {
        onSubPage = false;
      }
      if (onSubPage) {
        await driver.pressBack();
        await driver.delayMs(1500);
      }
      // Scroll to top to ensure menu items are visible
      await driver.swipe(500, 500, 500, 1500, 600);
      await driver.delayMs(500);
      // Navigate to Manager page
      let menu = await driver.findComponent(ON.id('menu_ManagerPage'));
      await menu.click();
      await driver.delayMs(1000);
    });

    /**
     * Verify Manager page displays NearLink Status section
     */
    it(BUNDLE + 'ManagerUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerUI_001, begin');

      let exist: boolean = false;
      try {
        await driver.findComponent(ON.id('section_nearlink_status'));
        exist = true;
      } catch (e) {
        exist = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerUI_001, NearLink Status section exists: %{public}s', String(exist));
      expect(exist).assertTrue();

      let existSupport: boolean = false;
      try {
        await driver.findComponent(ON.id('section_device_support'));
        existSupport = true;
      } catch (e) {
        existSupport = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerUI_001, Device Support section exists: %{public}s', String(existSupport));
      expect(existSupport).assertTrue();

      let existInfo: boolean = false;
      try {
        await driver.findComponent(ON.id('section_local_info'));
        existInfo = true;
      } catch (e) {
        existInfo = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerUI_001, Local Info section exists: %{public}s', String(existInfo));
      expect(existInfo).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerUI_001, end');
    });

    /**
     * Verify Refresh Status button is clickable on Manager page
     */
    it(BUNDLE + 'ManagerRefresh_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerRefresh_001, begin');

      let btn = await driver.findComponent(ON.id('btn_refresh_status'));
      let enabled: boolean = await btn.isEnabled();
      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerRefresh_001, Refresh Status enabled: %{public}s', String(enabled));
      expect(enabled).assertTrue();

      await btn.click();
      await driver.delayMs(500);

      hilog.info(DOMAIN, TAG, BUNDLE + 'ManagerRefresh_001, end');
    });
  });
}
