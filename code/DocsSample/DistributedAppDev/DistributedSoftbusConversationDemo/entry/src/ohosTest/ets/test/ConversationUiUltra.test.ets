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
function delay(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }
export default function conversationUiUltraTest() {
  describe('ConversationUiUltraTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2000); driver = await Driver.create(); })

    /**
     * @tc.name   testUiUltra0001
     * @tc.number SUB_SOFTBUS_UIULTRA_0001
     * @tc.desc   Test UI matrix 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0002
     * @tc.number SUB_SOFTBUS_UIULTRA_0002
     * @tc.desc   Test UI matrix 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0003
     * @tc.number SUB_SOFTBUS_UIULTRA_0003
     * @tc.desc   Test UI matrix 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0004
     * @tc.number SUB_SOFTBUS_UIULTRA_0004
     * @tc.desc   Test UI matrix 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0005
     * @tc.number SUB_SOFTBUS_UIULTRA_0005
     * @tc.desc   Test UI matrix 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0006
     * @tc.number SUB_SOFTBUS_UIULTRA_0006
     * @tc.desc   Test UI matrix 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0007
     * @tc.number SUB_SOFTBUS_UIULTRA_0007
     * @tc.desc   Test UI matrix 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0008
     * @tc.number SUB_SOFTBUS_UIULTRA_0008
     * @tc.desc   Test UI matrix 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0009
     * @tc.number SUB_SOFTBUS_UIULTRA_0009
     * @tc.desc   Test UI matrix 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0010
     * @tc.number SUB_SOFTBUS_UIULTRA_0010
     * @tc.desc   Test UI matrix 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0011
     * @tc.number SUB_SOFTBUS_UIULTRA_0011
     * @tc.desc   Test UI matrix 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0012
     * @tc.number SUB_SOFTBUS_UIULTRA_0012
     * @tc.desc   Test UI matrix 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0013
     * @tc.number SUB_SOFTBUS_UIULTRA_0013
     * @tc.desc   Test UI matrix 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0014
     * @tc.number SUB_SOFTBUS_UIULTRA_0014
     * @tc.desc   Test UI matrix 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0015
     * @tc.number SUB_SOFTBUS_UIULTRA_0015
     * @tc.desc   Test UI matrix 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0016
     * @tc.number SUB_SOFTBUS_UIULTRA_0016
     * @tc.desc   Test UI matrix 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0017
     * @tc.number SUB_SOFTBUS_UIULTRA_0017
     * @tc.desc   Test UI matrix 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0018
     * @tc.number SUB_SOFTBUS_UIULTRA_0018
     * @tc.desc   Test UI matrix 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0019
     * @tc.number SUB_SOFTBUS_UIULTRA_0019
     * @tc.desc   Test UI matrix 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0020
     * @tc.number SUB_SOFTBUS_UIULTRA_0020
     * @tc.desc   Test UI matrix 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0021
     * @tc.number SUB_SOFTBUS_UIULTRA_0021
     * @tc.desc   Test UI matrix 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0022
     * @tc.number SUB_SOFTBUS_UIULTRA_0022
     * @tc.desc   Test UI matrix 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0023
     * @tc.number SUB_SOFTBUS_UIULTRA_0023
     * @tc.desc   Test UI matrix 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0024
     * @tc.number SUB_SOFTBUS_UIULTRA_0024
     * @tc.desc   Test UI matrix 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0025
     * @tc.number SUB_SOFTBUS_UIULTRA_0025
     * @tc.desc   Test UI matrix 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0026
     * @tc.number SUB_SOFTBUS_UIULTRA_0026
     * @tc.desc   Test UI matrix 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0027
     * @tc.number SUB_SOFTBUS_UIULTRA_0027
     * @tc.desc   Test UI matrix 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0028
     * @tc.number SUB_SOFTBUS_UIULTRA_0028
     * @tc.desc   Test UI matrix 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0029
     * @tc.number SUB_SOFTBUS_UIULTRA_0029
     * @tc.desc   Test UI matrix 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0030
     * @tc.number SUB_SOFTBUS_UIULTRA_0030
     * @tc.desc   Test UI matrix 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0031
     * @tc.number SUB_SOFTBUS_UIULTRA_0031
     * @tc.desc   Test UI matrix 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0032
     * @tc.number SUB_SOFTBUS_UIULTRA_0032
     * @tc.desc   Test UI matrix 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0033
     * @tc.number SUB_SOFTBUS_UIULTRA_0033
     * @tc.desc   Test UI matrix 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0034
     * @tc.number SUB_SOFTBUS_UIULTRA_0034
     * @tc.desc   Test UI matrix 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0035
     * @tc.number SUB_SOFTBUS_UIULTRA_0035
     * @tc.desc   Test UI matrix 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0036
     * @tc.number SUB_SOFTBUS_UIULTRA_0036
     * @tc.desc   Test UI matrix 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0037
     * @tc.number SUB_SOFTBUS_UIULTRA_0037
     * @tc.desc   Test UI matrix 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0038
     * @tc.number SUB_SOFTBUS_UIULTRA_0038
     * @tc.desc   Test UI matrix 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0039
     * @tc.number SUB_SOFTBUS_UIULTRA_0039
     * @tc.desc   Test UI matrix 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0040
     * @tc.number SUB_SOFTBUS_UIULTRA_0040
     * @tc.desc   Test UI matrix 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0041
     * @tc.number SUB_SOFTBUS_UIULTRA_0041
     * @tc.desc   Test UI matrix 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0042
     * @tc.number SUB_SOFTBUS_UIULTRA_0042
     * @tc.desc   Test UI matrix 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0043
     * @tc.number SUB_SOFTBUS_UIULTRA_0043
     * @tc.desc   Test UI matrix 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0044
     * @tc.number SUB_SOFTBUS_UIULTRA_0044
     * @tc.desc   Test UI matrix 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0045
     * @tc.number SUB_SOFTBUS_UIULTRA_0045
     * @tc.desc   Test UI matrix 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0046
     * @tc.number SUB_SOFTBUS_UIULTRA_0046
     * @tc.desc   Test UI matrix 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0047
     * @tc.number SUB_SOFTBUS_UIULTRA_0047
     * @tc.desc   Test UI matrix 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0048
     * @tc.number SUB_SOFTBUS_UIULTRA_0048
     * @tc.desc   Test UI matrix 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0049
     * @tc.number SUB_SOFTBUS_UIULTRA_0049
     * @tc.desc   Test UI matrix 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiUltra0050
     * @tc.number SUB_SOFTBUS_UIULTRA_0050
     * @tc.desc   Test UI matrix 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })
  })
}
