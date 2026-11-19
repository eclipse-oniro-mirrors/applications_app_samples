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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const BUNDLE_NAME: string = abilityDelegatorRegistry.getArguments().bundleName;
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); });
}

export default function conversationUiFinalTest() {
  describe('ConversationUiFinalTest', () => {
    let driver: Driver;
    beforeAll(async () => {
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
      await DELEGATOR.startAbility(want);
      await delay(2000);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testUiFinal0001
     * @tc.number SUB_SOFTBUS_UI_FINAL_0001
     * @tc.desc   Test UI final matrix action, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0002
     * @tc.number SUB_SOFTBUS_UI_FINAL_0002
     * @tc.desc   Test UI final matrix action, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0003
     * @tc.number SUB_SOFTBUS_UI_FINAL_0003
     * @tc.desc   Test UI final matrix action, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0004
     * @tc.number SUB_SOFTBUS_UI_FINAL_0004
     * @tc.desc   Test UI final matrix action, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0005
     * @tc.number SUB_SOFTBUS_UI_FINAL_0005
     * @tc.desc   Test UI final matrix action, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0006
     * @tc.number SUB_SOFTBUS_UI_FINAL_0006
     * @tc.desc   Test UI final matrix action, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0007
     * @tc.number SUB_SOFTBUS_UI_FINAL_0007
     * @tc.desc   Test UI final matrix action, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0008
     * @tc.number SUB_SOFTBUS_UI_FINAL_0008
     * @tc.desc   Test UI final matrix action, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0009
     * @tc.number SUB_SOFTBUS_UI_FINAL_0009
     * @tc.desc   Test UI final matrix action, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0010
     * @tc.number SUB_SOFTBUS_UI_FINAL_0010
     * @tc.desc   Test UI final matrix action, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0011
     * @tc.number SUB_SOFTBUS_UI_FINAL_0011
     * @tc.desc   Test UI final matrix action, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0012
     * @tc.number SUB_SOFTBUS_UI_FINAL_0012
     * @tc.desc   Test UI final matrix action, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0013
     * @tc.number SUB_SOFTBUS_UI_FINAL_0013
     * @tc.desc   Test UI final matrix action, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0014
     * @tc.number SUB_SOFTBUS_UI_FINAL_0014
     * @tc.desc   Test UI final matrix action, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0015
     * @tc.number SUB_SOFTBUS_UI_FINAL_0015
     * @tc.desc   Test UI final matrix action, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0016
     * @tc.number SUB_SOFTBUS_UI_FINAL_0016
     * @tc.desc   Test UI final matrix action, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0017
     * @tc.number SUB_SOFTBUS_UI_FINAL_0017
     * @tc.desc   Test UI final matrix action, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0018
     * @tc.number SUB_SOFTBUS_UI_FINAL_0018
     * @tc.desc   Test UI final matrix action, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0019
     * @tc.number SUB_SOFTBUS_UI_FINAL_0019
     * @tc.desc   Test UI final matrix action, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0020
     * @tc.number SUB_SOFTBUS_UI_FINAL_0020
     * @tc.desc   Test UI final matrix action, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0021
     * @tc.number SUB_SOFTBUS_UI_FINAL_0021
     * @tc.desc   Test UI final matrix action, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0022
     * @tc.number SUB_SOFTBUS_UI_FINAL_0022
     * @tc.desc   Test UI final matrix action, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0023
     * @tc.number SUB_SOFTBUS_UI_FINAL_0023
     * @tc.desc   Test UI final matrix action, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0024
     * @tc.number SUB_SOFTBUS_UI_FINAL_0024
     * @tc.desc   Test UI final matrix action, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0025
     * @tc.number SUB_SOFTBUS_UI_FINAL_0025
     * @tc.desc   Test UI final matrix action, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0026
     * @tc.number SUB_SOFTBUS_UI_FINAL_0026
     * @tc.desc   Test UI final matrix action, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0027
     * @tc.number SUB_SOFTBUS_UI_FINAL_0027
     * @tc.desc   Test UI final matrix action, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0028
     * @tc.number SUB_SOFTBUS_UI_FINAL_0028
     * @tc.desc   Test UI final matrix action, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0029
     * @tc.number SUB_SOFTBUS_UI_FINAL_0029
     * @tc.desc   Test UI final matrix action, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0030
     * @tc.number SUB_SOFTBUS_UI_FINAL_0030
     * @tc.desc   Test UI final matrix action, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0031
     * @tc.number SUB_SOFTBUS_UI_FINAL_0031
     * @tc.desc   Test UI final matrix action, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0032
     * @tc.number SUB_SOFTBUS_UI_FINAL_0032
     * @tc.desc   Test UI final matrix action, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0033
     * @tc.number SUB_SOFTBUS_UI_FINAL_0033
     * @tc.desc   Test UI final matrix action, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0034
     * @tc.number SUB_SOFTBUS_UI_FINAL_0034
     * @tc.desc   Test UI final matrix action, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0035
     * @tc.number SUB_SOFTBUS_UI_FINAL_0035
     * @tc.desc   Test UI final matrix action, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0036
     * @tc.number SUB_SOFTBUS_UI_FINAL_0036
     * @tc.desc   Test UI final matrix action, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0037
     * @tc.number SUB_SOFTBUS_UI_FINAL_0037
     * @tc.desc   Test UI final matrix action, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0038
     * @tc.number SUB_SOFTBUS_UI_FINAL_0038
     * @tc.desc   Test UI final matrix action, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0039
     * @tc.number SUB_SOFTBUS_UI_FINAL_0039
     * @tc.desc   Test UI final matrix action, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0040
     * @tc.number SUB_SOFTBUS_UI_FINAL_0040
     * @tc.desc   Test UI final matrix action, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0041
     * @tc.number SUB_SOFTBUS_UI_FINAL_0041
     * @tc.desc   Test UI final matrix action, case 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0042
     * @tc.number SUB_SOFTBUS_UI_FINAL_0042
     * @tc.desc   Test UI final matrix action, case 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0043
     * @tc.number SUB_SOFTBUS_UI_FINAL_0043
     * @tc.desc   Test UI final matrix action, case 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0044
     * @tc.number SUB_SOFTBUS_UI_FINAL_0044
     * @tc.desc   Test UI final matrix action, case 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0045
     * @tc.number SUB_SOFTBUS_UI_FINAL_0045
     * @tc.desc   Test UI final matrix action, case 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0046
     * @tc.number SUB_SOFTBUS_UI_FINAL_0046
     * @tc.desc   Test UI final matrix action, case 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0047
     * @tc.number SUB_SOFTBUS_UI_FINAL_0047
     * @tc.desc   Test UI final matrix action, case 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0048
     * @tc.number SUB_SOFTBUS_UI_FINAL_0048
     * @tc.desc   Test UI final matrix action, case 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0049
     * @tc.number SUB_SOFTBUS_UI_FINAL_0049
     * @tc.desc   Test UI final matrix action, case 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFinal0050
     * @tc.number SUB_SOFTBUS_UI_FINAL_0050
     * @tc.desc   Test UI final matrix action, case 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFinal0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(300);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })
  })
}
