/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
const delegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const bundleName = abilityDelegatorRegistry.getArguments().bundleName;
export default function abilityTest() {
  describe('ActsAbilityTest', () => {
    beforeAll(async (done: Function) => {
      console.info('ActsAbilityTest begin');
      const want: Want = {
        bundleName: bundleName,
        abilityName: 'EntryAbility'
      };
      await delegator.startAbility(want);
      const driver = Driver.create();
      await driver.delayMs(1000);
      console.info('get top ability');
      await driver.delayMs(1000);

      done();
    })
    beforeEach(() => {
    })
    afterEach(async (done: Function) => {
      const driver = Driver.create();
      await driver.pressBack();
      await driver.delayMs(3000);
      done();
    })
    afterAll(() => {
    })

    it('flingSpeedLimit_dynamic_001', 0, async (done: Function) => {
      console.info('flingSpeedLimit_dynamic_001 begin');
      const driver = Driver.create();

      const button = await driver.findComponent(ON.text('FlingSpeedLimitDynamicButton'));
      await button.click();
      await driver.delayMs(3000);

      const speedText = await driver.findComponent(ON.id('speedLimitText'));
      const text = await speedText.getText();
      console.info(`speedText: ${text}`);
      expect(text).assertContain('5000');

      console.info('flingSpeedLimit_dynamic_001 end');
      done();
    })

    it('flingSpeedLimit_modifier_001', 0, async (done: Function) => {
      console.info('flingSpeedLimit_modifier_001 begin');
      const driver = Driver.create();

      const button = await driver.findComponent(ON.text('FlingSpeedLimitModifierButton'));
      await button.click();
      await driver.delayMs(3000);

      const speedText = await driver.findComponent(ON.id('speedLimitText'));
      const text = await speedText.getText();
      console.info(`speedText: ${text}`);
      expect(text).assertContain('5000');

      console.info('flingSpeedLimit_modifier_001 end');
      done();
    })
  })
}
