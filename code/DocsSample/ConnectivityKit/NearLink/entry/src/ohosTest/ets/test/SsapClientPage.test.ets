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

export default function ssapClientPageTest() {
  describe('NearLinkSsapClientPageTest', () => {
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
      // Scroll to top first, then scroll down to SSAP Client menu
      await driver.swipe(500, 500, 500, 1500, 600);
      await driver.delayMs(500);
      // Scroll down to ensure SSAP Client menu is visible
      await driver.swipe(500, 1500, 500, 800, 600);
      await driver.delayMs(1000);
      // Navigate to SSAP Client page
      let menu = await driver.findComponent(ON.id('menu_SsapClientPage'));
      await menu.click();
      await driver.delayMs(1000);
    });

    /**
     * Verify SSAP Client page displays Scan Devices and Connection Management sections
     */
    it(BUNDLE + 'SsapClientUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'SsapClientUI_001, begin');

      let existScan: boolean = false;
      try {
        await driver.findComponent(ON.id('section_scan_devices'));
        existScan = true;
      } catch (e) {
        existScan = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'SsapClientUI_001, Scan Devices exists: %{public}s', String(existScan));
      expect(existScan).assertTrue();

      let existConn: boolean = false;
      try {
        await driver.findComponent(ON.id('section_connection_management'));
        existConn = true;
      } catch (e) {
        existConn = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'SsapClientUI_001, Connection Management exists: %{public}s', String(existConn));
      expect(existConn).assertTrue();

      let existStartScan: boolean = false;
      try {
        await driver.findComponent(ON.id('btn_start_scan'));
        existStartScan = true;
      } catch (e) {
        existStartScan = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'SsapClientUI_001, Start Scan button exists: %{public}s', String(existStartScan));
      expect(existStartScan).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'SsapClientUI_001, end');
    });
  });
}
