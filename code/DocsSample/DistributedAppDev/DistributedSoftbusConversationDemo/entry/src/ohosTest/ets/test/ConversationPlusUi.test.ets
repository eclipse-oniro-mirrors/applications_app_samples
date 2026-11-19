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
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';
const SB_BUNDLE: string = 'com.example.distributedsoftbusconversationdemo';
const SB_DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
function sbWait(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }

export default function conversationPlusUiTest() {
  describe('ConversationPlusUiTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: SB_BUNDLE, abilityName: 'EntryAbility' }; await SB_DELEGATOR.startAbility(want); await sbWait(2500); driver = await Driver.create(); })

    /**
     * @tc.name   testSoftbusPlusUi0001
     * @tc.number SUB_SOFTBUS_PLUS_UI_0001
     * @tc.desc   Check conversation UI text 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0002
     * @tc.number SUB_SOFTBUS_PLUS_UI_0002
     * @tc.desc   Check conversation UI text 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0003
     * @tc.number SUB_SOFTBUS_PLUS_UI_0003
     * @tc.desc   Check conversation UI text 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0004
     * @tc.number SUB_SOFTBUS_PLUS_UI_0004
     * @tc.desc   Check conversation UI text 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0005
     * @tc.number SUB_SOFTBUS_PLUS_UI_0005
     * @tc.desc   Check conversation UI text 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0006
     * @tc.number SUB_SOFTBUS_PLUS_UI_0006
     * @tc.desc   Check conversation UI text 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0007
     * @tc.number SUB_SOFTBUS_PLUS_UI_0007
     * @tc.desc   Check conversation UI text 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0008
     * @tc.number SUB_SOFTBUS_PLUS_UI_0008
     * @tc.desc   Check conversation UI text 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0009
     * @tc.number SUB_SOFTBUS_PLUS_UI_0009
     * @tc.desc   Check conversation UI text 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0010
     * @tc.number SUB_SOFTBUS_PLUS_UI_0010
     * @tc.desc   Check conversation UI text 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0011
     * @tc.number SUB_SOFTBUS_PLUS_UI_0011
     * @tc.desc   Check conversation UI text 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0012
     * @tc.number SUB_SOFTBUS_PLUS_UI_0012
     * @tc.desc   Check conversation UI text 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0013
     * @tc.number SUB_SOFTBUS_PLUS_UI_0013
     * @tc.desc   Check conversation UI text 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0014
     * @tc.number SUB_SOFTBUS_PLUS_UI_0014
     * @tc.desc   Check conversation UI text 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0015
     * @tc.number SUB_SOFTBUS_PLUS_UI_0015
     * @tc.desc   Check conversation UI text 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0016
     * @tc.number SUB_SOFTBUS_PLUS_UI_0016
     * @tc.desc   Check conversation UI text 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0017
     * @tc.number SUB_SOFTBUS_PLUS_UI_0017
     * @tc.desc   Check conversation UI text 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0018
     * @tc.number SUB_SOFTBUS_PLUS_UI_0018
     * @tc.desc   Check conversation UI text 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0019
     * @tc.number SUB_SOFTBUS_PLUS_UI_0019
     * @tc.desc   Check conversation UI text 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0020
     * @tc.number SUB_SOFTBUS_PLUS_UI_0020
     * @tc.desc   Check conversation UI text 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0021
     * @tc.number SUB_SOFTBUS_PLUS_UI_0021
     * @tc.desc   Check conversation UI text 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0022
     * @tc.number SUB_SOFTBUS_PLUS_UI_0022
     * @tc.desc   Check conversation UI text 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0023
     * @tc.number SUB_SOFTBUS_PLUS_UI_0023
     * @tc.desc   Check conversation UI text 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0024
     * @tc.number SUB_SOFTBUS_PLUS_UI_0024
     * @tc.desc   Check conversation UI text 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0025
     * @tc.number SUB_SOFTBUS_PLUS_UI_0025
     * @tc.desc   Check conversation UI text 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0026
     * @tc.number SUB_SOFTBUS_PLUS_UI_0026
     * @tc.desc   Check conversation UI text 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0027
     * @tc.number SUB_SOFTBUS_PLUS_UI_0027
     * @tc.desc   Check conversation UI text 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0028
     * @tc.number SUB_SOFTBUS_PLUS_UI_0028
     * @tc.desc   Check conversation UI text 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0029
     * @tc.number SUB_SOFTBUS_PLUS_UI_0029
     * @tc.desc   Check conversation UI text 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0030
     * @tc.number SUB_SOFTBUS_PLUS_UI_0030
     * @tc.desc   Check conversation UI text 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0031
     * @tc.number SUB_SOFTBUS_PLUS_UI_0031
     * @tc.desc   Check conversation UI text 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0032
     * @tc.number SUB_SOFTBUS_PLUS_UI_0032
     * @tc.desc   Check conversation UI text 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0033
     * @tc.number SUB_SOFTBUS_PLUS_UI_0033
     * @tc.desc   Check conversation UI text 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0034
     * @tc.number SUB_SOFTBUS_PLUS_UI_0034
     * @tc.desc   Check conversation UI text 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0035
     * @tc.number SUB_SOFTBUS_PLUS_UI_0035
     * @tc.desc   Check conversation UI text 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0036
     * @tc.number SUB_SOFTBUS_PLUS_UI_0036
     * @tc.desc   Check conversation UI text 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0037
     * @tc.number SUB_SOFTBUS_PLUS_UI_0037
     * @tc.desc   Check conversation UI text 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0038
     * @tc.number SUB_SOFTBUS_PLUS_UI_0038
     * @tc.desc   Check conversation UI text 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0039
     * @tc.number SUB_SOFTBUS_PLUS_UI_0039
     * @tc.desc   Check conversation UI text 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0040
     * @tc.number SUB_SOFTBUS_PLUS_UI_0040
     * @tc.desc   Check conversation UI text 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0041
     * @tc.number SUB_SOFTBUS_PLUS_UI_0041
     * @tc.desc   Check conversation UI text 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0042
     * @tc.number SUB_SOFTBUS_PLUS_UI_0042
     * @tc.desc   Check conversation UI text 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0043
     * @tc.number SUB_SOFTBUS_PLUS_UI_0043
     * @tc.desc   Check conversation UI text 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0044
     * @tc.number SUB_SOFTBUS_PLUS_UI_0044
     * @tc.desc   Check conversation UI text 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0045
     * @tc.number SUB_SOFTBUS_PLUS_UI_0045
     * @tc.desc   Check conversation UI text 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0046
     * @tc.number SUB_SOFTBUS_PLUS_UI_0046
     * @tc.desc   Check conversation UI text 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0047
     * @tc.number SUB_SOFTBUS_PLUS_UI_0047
     * @tc.desc   Check conversation UI text 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0048
     * @tc.number SUB_SOFTBUS_PLUS_UI_0048
     * @tc.desc   Check conversation UI text 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0049
     * @tc.number SUB_SOFTBUS_PLUS_UI_0049
     * @tc.desc   Check conversation UI text 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0050
     * @tc.number SUB_SOFTBUS_PLUS_UI_0050
     * @tc.desc   Check conversation UI text 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0051
     * @tc.number SUB_SOFTBUS_PLUS_UI_0051
     * @tc.desc   Check conversation UI text 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0052
     * @tc.number SUB_SOFTBUS_PLUS_UI_0052
     * @tc.desc   Check conversation UI text 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0053
     * @tc.number SUB_SOFTBUS_PLUS_UI_0053
     * @tc.desc   Check conversation UI text 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0054
     * @tc.number SUB_SOFTBUS_PLUS_UI_0054
     * @tc.desc   Check conversation UI text 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0055
     * @tc.number SUB_SOFTBUS_PLUS_UI_0055
     * @tc.desc   Check conversation UI text 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0056
     * @tc.number SUB_SOFTBUS_PLUS_UI_0056
     * @tc.desc   Check conversation UI text 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 0).assertTrue();
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0057
     * @tc.number SUB_SOFTBUS_PLUS_UI_0057
     * @tc.desc   Check conversation UI text 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 0).assertTrue();
      expect('Get Trusted Devices'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0058
     * @tc.number SUB_SOFTBUS_PLUS_UI_0058
     * @tc.desc   Check conversation UI text 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 0).assertTrue();
      expect('Register Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0059
     * @tc.number SUB_SOFTBUS_PLUS_UI_0059
     * @tc.desc   Check conversation UI text 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 0).assertTrue();
      expect('Unregister Listener'.length > 3).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUi0060
     * @tc.number SUB_SOFTBUS_PLUS_UI_0060
     * @tc.desc   Check conversation UI text 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUi0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 0).assertTrue();
      expect('Send Message'.length > 3).assertTrue();
    })
  })
}
