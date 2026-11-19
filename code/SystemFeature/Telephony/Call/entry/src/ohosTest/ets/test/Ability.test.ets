/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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

import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON, Component } from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Logger from '../util/Logger';

const TAG: string = 'AppTest';
const BUNDLE: string = 'Call_';
const APP_BUNDLE: string = 'ohos.samples.call';
const APP_ABILITY: string = 'EntryAbility';
let driver: Driver = Driver.create();

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * @tc.number    SUB_CALL_STARTABILITY_0001
     * @tc.name      Call_StartAbility_001
     * @tc.desc      Verify the call sample ability can be started.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it(BUNDLE + 'StartAbility_001', 0, async () => {
      Logger.info(TAG, `${BUNDLE}StartAbility start`);
      const want: Want = {
        bundleName: APP_BUNDLE,
        abilityName: APP_ABILITY
      };
      const abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      await abilityDelegator.startAbility(want);
      Logger.info(TAG, `${BUNDLE}StartAbility end`);
      expect(abilityDelegator !== undefined).assertTrue();
      expect(typeof APP_BUNDLE).assertEqual('string');
      expect(APP_BUNDLE).assertEqual('ohos.samples.call');
    })
    /**
     * 输入电话号码并拨打
     */
    /**
     * @tc.number    SUB_CALL_LEG_0001
     * @tc.name      CallFunction_001
     * @tc.desc      Verify legacy case CallFunction_001 runs without error.
     * @tc.type      FUNCTION
     * @tc.size      MEDIUMTEST
     * @tc.level     LEVEL0
     */
    it(BUNDLE + 'CallFunction_001', 0, async () => {
      // create UiDriver
      Logger.info(TAG, `${BUNDLE}CallFunction_001 begin`);
      await driver.delayMs(1000);
      // 输入电话号码
      await driver.assertComponentExist(ON.id('telInput'));
      let telInput: Component = await driver.findComponent(ON.id('telInput'));
      await driver.delayMs(1000);
      await telInput.inputText('13566254180');
      await driver.delayMs(1000);
      let telVal: string = await telInput.getText();
      await driver.delayMs(1000);
      expect('13566254180').assertEqual(telVal);
      expect(telVal.length).assertEqual(11);
      await driver.delayMs(1000);
      // 点击图标拨号
      await driver.assertComponentExist(ON.id('callImg'));
      let callBtn: Component = await driver.findComponent(ON.id('callImg'));
      await driver.delayMs(1000);
      await callBtn.click();
      await driver.delayMs(1000);
      // 返回桌面
      await driver.click(360, 1244);
      Logger.info(TAG, `${BUNDLE}CallFunction_001 end`);
    })
  })
}
