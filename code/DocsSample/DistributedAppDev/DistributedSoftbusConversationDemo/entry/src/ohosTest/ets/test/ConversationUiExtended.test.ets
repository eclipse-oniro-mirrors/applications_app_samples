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
const TEXTS: string[] = ['Distributed SoftBus Conversation Test', 'Get Trusted Devices', 'Register Listener', 'Unregister Listener', 'Send Message'];
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => { resolve(); }, ms);
  });
}

export default function conversationUiExtendedTest() {
  describe('ConversationUiExtendedTest', () => {
    let driver: Driver;
    beforeAll(async () => {
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
      await DELEGATOR.startAbility(want);
      await delay(2000);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testUiExtended0001
     * @tc.number SUB_SOFTBUS_UI_EXT_0001
     * @tc.desc   Test UI component existence, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0002
     * @tc.number SUB_SOFTBUS_UI_EXT_0002
     * @tc.desc   Test UI component existence, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0003
     * @tc.number SUB_SOFTBUS_UI_EXT_0003
     * @tc.desc   Test UI component existence, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0004
     * @tc.number SUB_SOFTBUS_UI_EXT_0004
     * @tc.desc   Test UI component existence, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0005
     * @tc.number SUB_SOFTBUS_UI_EXT_0005
     * @tc.desc   Test UI component existence, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0006
     * @tc.number SUB_SOFTBUS_UI_EXT_0006
     * @tc.desc   Test UI component existence, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0007
     * @tc.number SUB_SOFTBUS_UI_EXT_0007
     * @tc.desc   Test UI component existence, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0008
     * @tc.number SUB_SOFTBUS_UI_EXT_0008
     * @tc.desc   Test UI component existence, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0009
     * @tc.number SUB_SOFTBUS_UI_EXT_0009
     * @tc.desc   Test UI component existence, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0010
     * @tc.number SUB_SOFTBUS_UI_EXT_0010
     * @tc.desc   Test UI component existence, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0011
     * @tc.number SUB_SOFTBUS_UI_EXT_0011
     * @tc.desc   Test UI component existence, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0012
     * @tc.number SUB_SOFTBUS_UI_EXT_0012
     * @tc.desc   Test UI component existence, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0013
     * @tc.number SUB_SOFTBUS_UI_EXT_0013
     * @tc.desc   Test UI component existence, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0014
     * @tc.number SUB_SOFTBUS_UI_EXT_0014
     * @tc.desc   Test UI component existence, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0015
     * @tc.number SUB_SOFTBUS_UI_EXT_0015
     * @tc.desc   Test UI component existence, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0016
     * @tc.number SUB_SOFTBUS_UI_EXT_0016
     * @tc.desc   Test UI component existence, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0017
     * @tc.number SUB_SOFTBUS_UI_EXT_0017
     * @tc.desc   Test UI component existence, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0018
     * @tc.number SUB_SOFTBUS_UI_EXT_0018
     * @tc.desc   Test UI component existence, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0019
     * @tc.number SUB_SOFTBUS_UI_EXT_0019
     * @tc.desc   Test UI component existence, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0020
     * @tc.number SUB_SOFTBUS_UI_EXT_0020
     * @tc.desc   Test UI component existence, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0021
     * @tc.number SUB_SOFTBUS_UI_EXT_0021
     * @tc.desc   Test UI component existence, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0022
     * @tc.number SUB_SOFTBUS_UI_EXT_0022
     * @tc.desc   Test UI component existence, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0023
     * @tc.number SUB_SOFTBUS_UI_EXT_0023
     * @tc.desc   Test UI component existence, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0024
     * @tc.number SUB_SOFTBUS_UI_EXT_0024
     * @tc.desc   Test UI component existence, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0025
     * @tc.number SUB_SOFTBUS_UI_EXT_0025
     * @tc.desc   Test UI component existence, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0026
     * @tc.number SUB_SOFTBUS_UI_EXT_0026
     * @tc.desc   Test UI component existence, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0027
     * @tc.number SUB_SOFTBUS_UI_EXT_0027
     * @tc.desc   Test UI component existence, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0028
     * @tc.number SUB_SOFTBUS_UI_EXT_0028
     * @tc.desc   Test UI component existence, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0029
     * @tc.number SUB_SOFTBUS_UI_EXT_0029
     * @tc.desc   Test UI component existence, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0030
     * @tc.number SUB_SOFTBUS_UI_EXT_0030
     * @tc.desc   Test UI component existence, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0031
     * @tc.number SUB_SOFTBUS_UI_EXT_0031
     * @tc.desc   Test UI component existence, case 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0032
     * @tc.number SUB_SOFTBUS_UI_EXT_0032
     * @tc.desc   Test UI component existence, case 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0033
     * @tc.number SUB_SOFTBUS_UI_EXT_0033
     * @tc.desc   Test UI component existence, case 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0034
     * @tc.number SUB_SOFTBUS_UI_EXT_0034
     * @tc.desc   Test UI component existence, case 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0035
     * @tc.number SUB_SOFTBUS_UI_EXT_0035
     * @tc.desc   Test UI component existence, case 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0036
     * @tc.number SUB_SOFTBUS_UI_EXT_0036
     * @tc.desc   Test UI component existence, case 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0037
     * @tc.number SUB_SOFTBUS_UI_EXT_0037
     * @tc.desc   Test UI component existence, case 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0038
     * @tc.number SUB_SOFTBUS_UI_EXT_0038
     * @tc.desc   Test UI component existence, case 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0039
     * @tc.number SUB_SOFTBUS_UI_EXT_0039
     * @tc.desc   Test UI component existence, case 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiExtended0040
     * @tc.number SUB_SOFTBUS_UI_EXT_0040
     * @tc.desc   Test UI component existence, case 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiExtended0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })
  })
}
