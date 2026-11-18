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

import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { Driver, ON, MatchPattern } from '@ohos.UiTest';

const BUNDLE = 'MapNavigation';
const TAG = '[Sample_MapNavigation]';

export default function uiAutoTest() {
  describe('MapNavigationTest', function () {

    it(BUNDLE + 'GrantMicrophonePermission_001', 0, async (done) => {
      console.info(TAG + 'GrantMicrophonePermission_001 start');
      let driver = await Driver.create();
      let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      let want = {
        bundleName: 'com.example.mapnavigation',
        abilityName: 'EntryAbility'
      }
      await abilityDelegator.startAbility(want);
      await driver.delayMs(3000);
      await driver.assertComponentExist(ON.type('Button'));
      console.info(TAG + 'GrantMicrophonePermission_001 end');
      done();
    })

    it(BUNDLE + 'PageNavigation_002', 1, async (done) => {
      console.info(TAG + 'PageNavigation_002 start');
      let driver = await Driver.create();
      let routeBtn = await driver.findComponent(ON.text('路线', MatchPattern.CONTAINS));
      await routeBtn.click();
      await driver.delayMs(1000);
      await driver.assertComponentExist(ON.text('开始导航', MatchPattern.CONTAINS));
      console.info(TAG + 'PageNavigation_002 end');
      done();
    })

    it(BUNDLE + 'StartNavigation_003', 2, async (done) => {
      console.info(TAG + 'StartNavigation_003 start');
      let driver = await Driver.create();
      let startNavBtn = await driver.findComponent(ON.text('开始导航', MatchPattern.CONTAINS));
      await startNavBtn.click();
      await driver.delayMs(2000);
      console.info(TAG + 'StartNavigation_003 end');
      done();
    })

    it(BUNDLE + 'SimulateAIAssistant_004', 3, async (done) => {
      console.info(TAG + 'SimulateAIAssistant_004 start');
      let driver = await Driver.create();
      let aiBtn = await driver.findComponent(ON.text('模拟AI助手', MatchPattern.CONTAINS));
      await aiBtn.click();
      await driver.delayMs(6000);
      await driver.assertComponentExist(ON.type('Column'));
      console.info(TAG + 'SimulateAIAssistant_004 end');
      done();
    })
  })
}
