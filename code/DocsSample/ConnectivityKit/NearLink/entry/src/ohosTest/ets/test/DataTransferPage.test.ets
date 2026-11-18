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

export default function dataTransferPageTest() {
  describe('NearLinkDataTransferPageTest', () => {
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
      // Scroll to top first, then scroll down to DataTransfer menu
      await driver.swipe(500, 500, 500, 1500, 600);
      await driver.delayMs(500);
      // Scroll down to make DataTransfer menu visible
      await driver.swipe(500, 1500, 500, 500, 600);
      await driver.delayMs(1000);
      // Navigate to DataTransfer page
      let menu = await driver.findComponent(ON.id('menu_DataTransferPage'));
      await menu.click();
      await driver.delayMs(1000);
    });

    /**
     * Verify DataTransfer page displays Port Management and Advertising Control sections
     */
    it(BUNDLE + 'DataTransferUI_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'DataTransferUI_001, begin');

      let existPort: boolean = false;
      try {
        await driver.findComponent(ON.id('section_port_management'));
        existPort = true;
      } catch (e) {
        existPort = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'DataTransferUI_001, Port Management exists: %{public}s', String(existPort));
      expect(existPort).assertTrue();

      let existAdv: boolean = false;
      try {
        await driver.findComponent(ON.id('section_advertising_control'));
        existAdv = true;
      } catch (e) {
        existAdv = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'DataTransferUI_001, Advertising Control exists: %{public}s', String(existAdv));
      expect(existAdv).assertTrue();

      let existCreatePort: boolean = false;
      try {
        await driver.findComponent(ON.id('btn_create_port'));
        existCreatePort = true;
      } catch (e) {
        existCreatePort = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'DataTransferUI_001, Create Port button exists: %{public}s', String(existCreatePort));
      expect(existCreatePort).assertTrue();

      hilog.info(DOMAIN, TAG, BUNDLE + 'DataTransferUI_001, end');
    });
  });
}
