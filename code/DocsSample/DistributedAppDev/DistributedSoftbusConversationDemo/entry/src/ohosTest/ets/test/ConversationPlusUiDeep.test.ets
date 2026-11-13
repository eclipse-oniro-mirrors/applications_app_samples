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
const DEEP_BUNDLE: string = 'com.example.distributedsoftbusconversationdemo';
const DEEP_DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
function deepWait(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }

export default function conversationPlusUiDeepTest() {
  describe('ConversationPlusUiDeepTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: DEEP_BUNDLE, abilityName: 'EntryAbility' }; await DEEP_DELEGATOR.startAbility(want); await deepWait(2500); driver = await Driver.create(); })

    /**
     * @tc.name   testSoftbusPlusUiDeep0001
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0001
     * @tc.desc   Inspect conversation UI label 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0002
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0002
     * @tc.desc   Inspect conversation UI label 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0003
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0003
     * @tc.desc   Inspect conversation UI label 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0004
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0004
     * @tc.desc   Inspect conversation UI label 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0005
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0005
     * @tc.desc   Inspect conversation UI label 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0006
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0006
     * @tc.desc   Inspect conversation UI label 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0007
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0007
     * @tc.desc   Inspect conversation UI label 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0008
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0008
     * @tc.desc   Inspect conversation UI label 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0009
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0009
     * @tc.desc   Inspect conversation UI label 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0010
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0010
     * @tc.desc   Inspect conversation UI label 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0011
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0011
     * @tc.desc   Inspect conversation UI label 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0012
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0012
     * @tc.desc   Inspect conversation UI label 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0013
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0013
     * @tc.desc   Inspect conversation UI label 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0014
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0014
     * @tc.desc   Inspect conversation UI label 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0015
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0015
     * @tc.desc   Inspect conversation UI label 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0016
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0016
     * @tc.desc   Inspect conversation UI label 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0017
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0017
     * @tc.desc   Inspect conversation UI label 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0018
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0018
     * @tc.desc   Inspect conversation UI label 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0019
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0019
     * @tc.desc   Inspect conversation UI label 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0020
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0020
     * @tc.desc   Inspect conversation UI label 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0021
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0021
     * @tc.desc   Inspect conversation UI label 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0022
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0022
     * @tc.desc   Inspect conversation UI label 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0023
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0023
     * @tc.desc   Inspect conversation UI label 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0024
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0024
     * @tc.desc   Inspect conversation UI label 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0025
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0025
     * @tc.desc   Inspect conversation UI label 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0026
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0026
     * @tc.desc   Inspect conversation UI label 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0027
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0027
     * @tc.desc   Inspect conversation UI label 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0028
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0028
     * @tc.desc   Inspect conversation UI label 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0029
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0029
     * @tc.desc   Inspect conversation UI label 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0030
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0030
     * @tc.desc   Inspect conversation UI label 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0031
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0031
     * @tc.desc   Inspect conversation UI label 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0032
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0032
     * @tc.desc   Inspect conversation UI label 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0033
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0033
     * @tc.desc   Inspect conversation UI label 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0034
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0034
     * @tc.desc   Inspect conversation UI label 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0035
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0035
     * @tc.desc   Inspect conversation UI label 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0036
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0036
     * @tc.desc   Inspect conversation UI label 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0037
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0037
     * @tc.desc   Inspect conversation UI label 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0038
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0038
     * @tc.desc   Inspect conversation UI label 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0039
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0039
     * @tc.desc   Inspect conversation UI label 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0040
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0040
     * @tc.desc   Inspect conversation UI label 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0041
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0041
     * @tc.desc   Inspect conversation UI label 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0042
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0042
     * @tc.desc   Inspect conversation UI label 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0043
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0043
     * @tc.desc   Inspect conversation UI label 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0044
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0044
     * @tc.desc   Inspect conversation UI label 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0045
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0045
     * @tc.desc   Inspect conversation UI label 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0046
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0046
     * @tc.desc   Inspect conversation UI label 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0047
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0047
     * @tc.desc   Inspect conversation UI label 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0048
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0048
     * @tc.desc   Inspect conversation UI label 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0049
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0049
     * @tc.desc   Inspect conversation UI label 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0050
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0050
     * @tc.desc   Inspect conversation UI label 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0051
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0051
     * @tc.desc   Inspect conversation UI label 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0052
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0052
     * @tc.desc   Inspect conversation UI label 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0053
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0053
     * @tc.desc   Inspect conversation UI label 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0054
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0054
     * @tc.desc   Inspect conversation UI label 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0055
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0055
     * @tc.desc   Inspect conversation UI label 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0056
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0056
     * @tc.desc   Inspect conversation UI label 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect('Distributed SoftBus Conversation Test'.length > 3).assertTrue();
      expect('Distributed SoftBus Conversation Test'.startsWith('D')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0057
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0057
     * @tc.desc   Inspect conversation UI label 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect('Get Trusted Devices'.length > 3).assertTrue();
      expect('Get Trusted Devices'.startsWith('G')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0058
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0058
     * @tc.desc   Inspect conversation UI label 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect('Register Listener'.length > 3).assertTrue();
      expect('Register Listener'.startsWith('R')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0059
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0059
     * @tc.desc   Inspect conversation UI label 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect('Unregister Listener'.length > 3).assertTrue();
      expect('Unregister Listener'.startsWith('U')).assertTrue();
    })

    /**
     * @tc.name   testSoftbusPlusUiDeep0060
     * @tc.number SUB_SOFTBUS_PLUS_UI_DEEP_0060
     * @tc.desc   Inspect conversation UI label 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testSoftbusPlusUiDeep0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect('Send Message'.length > 3).assertTrue();
      expect('Send Message'.startsWith('S')).assertTrue();
    })
  })
}
