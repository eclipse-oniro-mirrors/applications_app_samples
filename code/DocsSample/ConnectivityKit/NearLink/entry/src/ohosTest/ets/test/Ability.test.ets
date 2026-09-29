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

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
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
     * Verify the application starts successfully and top ability is EntryAbility
     */
    it(BUNDLE + 'StartAbility_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');

      let topAbility = await delegator.getCurrentTopAbility();
      let abilityName: string = topAbility.context.abilityInfo.name;
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, topAbility: %{public}s', abilityName);
      expect(abilityName).assertEqual('EntryAbility');

      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, end');
    });

    /**
     * Verify the main page title is displayed after app launch
     */
    it(BUNDLE + 'MainPageLoad_001', 0, async () => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'MainPageLoad_001, begin');

      let exist: boolean = false;
      try {
        await driver.findComponent(ON.id('main_title_text'));
        exist = true;
      } catch (e) {
        exist = false;
      }
      hilog.info(DOMAIN, TAG, BUNDLE + 'MainPageLoad_001, title exists: %{public}s', String(exist));
      expect(exist).assertTrue();

      let title = await driver.findComponent(ON.id('main_title_text'));
      let titleText: string = await title.getText();
      hilog.info(DOMAIN, TAG, BUNDLE + 'MainPageLoad_001, titleText: %{public}s', titleText);
      expect(titleText).assertEqual('NearLink');

      hilog.info(DOMAIN, TAG, BUNDLE + 'MainPageLoad_001, end');
    });
  });
}
