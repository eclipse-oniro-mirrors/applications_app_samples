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

import { abilityDelegatorRegistry } from '@kit.AbilityKit';
import { describe, it, expect } from '@ohos/hypium';
import { Driver, ON, ComponentInfo } from '@ohos/UiTest';
import { hilog } from '@kit.PerformanceAnalysisKit';

const TAG = '[Sample_NDKInputEventHook]';
const DOMAIN = 0xF811;
const BUNDLE = 'NDKInputEventHook_';
const BUNDLE_NAME = 'com.example.ndkinputeventhook';
const ABILITY_NAME = 'EntryAbility';
const CREATE_BUTTON_TEXT = 'Create and enable event handler. Observing key/mouse/touch/axis events';
const DISABLE_BUTTON_TEXT = 'Disable and destroy event handler';
const RESULT_TEXT_ID = 'result_text';

export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    /**
     * 打开应用
     */
    it('NDKInputEventHook_StartAbility_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, begin');
      let driver: Driver = Driver.create();
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        await delegator.startAbility({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME
        });
      } catch (exception) {
        hilog.info(DOMAIN, TAG, BUNDLE + `StartAbility_001 exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, assert create button exist');
      await driver.assertComponentExist(ON.text(CREATE_BUTTON_TEXT));
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001, assert disable button exist');
      await driver.assertComponentExist(ON.text(DISABLE_BUTTON_TEXT));
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'StartAbility_001 end');
    })

    /**
     * 创建并启用输入事件handler
     */
    it('NDKInputEventHook_createAndEnableHandler_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'createAndEnableHandler_001, begin');
      let driver: Driver = Driver.create();
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        await delegator.startAbility({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME
        });
      } catch (exception) {
        hilog.info(DOMAIN, TAG, BUNDLE + `createAndEnableHandler_001 exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'createAndEnableHandler_001, find and click create button');
      let createButton: ComponentInfo = await driver.findComponent(ON.text(CREATE_BUTTON_TEXT));
      await createButton.click();
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'createAndEnableHandler_001, assert result text updated');
      let resultText: ComponentInfo = await driver.findComponent(ON.id(RESULT_TEXT_ID));
      let text: string = await resultText.getText();
      hilog.info(DOMAIN, TAG, BUNDLE + `createAndEnableHandler_001, result: ${text}`);
      expect(text.includes('event handler')).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'createAndEnableHandler_001 end');
    })

    /**
     * 禁用并销毁输入事件handler
     */
    it('NDKInputEventHook_disableAndDestroyHandler_001', 0, async (done: Function) => {
      hilog.info(DOMAIN, TAG, BUNDLE + 'disableAndDestroyHandler_001, begin');
      let driver: Driver = Driver.create();
      let delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
      try {
        await delegator.startAbility({
          bundleName: BUNDLE_NAME,
          abilityName: ABILITY_NAME
        });
      } catch (exception) {
        hilog.info(DOMAIN, TAG, BUNDLE + `disableAndDestroyHandler_001 exception = ${JSON.stringify(exception)}`);
        expect().assertFail();
      }
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'disableAndDestroyHandler_001, find and click disable button');
      let disableButton: ComponentInfo = await driver.findComponent(ON.text(DISABLE_BUTTON_TEXT));
      await disableButton.click();
      await driver.delayMs(3000);
      hilog.info(DOMAIN, TAG, BUNDLE + 'disableAndDestroyHandler_001, assert result text updated');
      let resultText: ComponentInfo = await driver.findComponent(ON.id(RESULT_TEXT_ID));
      let text: string = await resultText.getText();
      hilog.info(DOMAIN, TAG, BUNDLE + `disableAndDestroyHandler_001, result: ${text}`);
      expect(text.includes('event handler')).assertTrue();
      done();
      hilog.info(DOMAIN, TAG, BUNDLE + 'disableAndDestroyHandler_001 end');
    })
  })
}
