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

export default function scanConfigPageTest() {
  describe('NearLinkScanConfigPageTest', () => {
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
      // Navigate to Scan page
      let menu = await driver.findComponent(ON.id('menu_ScanConfigPage'));
      await menu.click();
      await driver.delayMs(1000);
    });

    /**
     * Verify Scan page displays filter inputs and scan buttons
     */
    it(BUNDLE + 'ScanUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScanUI_001, begin');

      let existFilter: boolean = false;
      try {
        await driver.findComponent(ON.id('section_scan_filters'));
        existFilter = true;
      } catch (e) {
        existFilter = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScanUI_001, Scan Filters section exists: %{public}s', String(existFilter));
      expect(existFilter).assertTrue();

      let existScanBtn: boolean = false;
      try {
        await driver.findComponent(ON.id('btn_filtered_scan'));
        existScanBtn = true;
      } catch (e) {
        existScanBtn = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScanUI_001, Filtered Scan button exists: %{public}s', String(existScanBtn));
      expect(existScanBtn).assertTrue();

      let existFullBtn: boolean = false;
      try {
        await driver.findComponent(ON.id('btn_full_scan'));
        existFullBtn = true;
      } catch (e) {
        existFullBtn = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'ScanUI_001, Full Scan button exists: %{public}s', String(existFullBtn));
      expect(existFullBtn).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'ScanUI_001, end');
    });
  });
}
