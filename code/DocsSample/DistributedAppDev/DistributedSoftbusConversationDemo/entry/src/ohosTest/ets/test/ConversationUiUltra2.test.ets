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
const BUNDLE_NAME: string = abilityDelegatorRegistry.getArguments().bundleName;
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();
function delay(ms: number): Promise<void> { return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); }); }
export default function conversationUiUltra2Test() {
  describe('ConversationUiUltra2Test', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2000); driver = await Driver.create(); })

    /**
     * @tc.name   testUiUltra20001
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0001
     * @tc.desc   Test UI ultra2 matrix 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20002
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0002
     * @tc.desc   Test UI ultra2 matrix 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20003
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0003
     * @tc.desc   Test UI ultra2 matrix 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20004
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0004
     * @tc.desc   Test UI ultra2 matrix 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20005
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0005
     * @tc.desc   Test UI ultra2 matrix 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20006
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0006
     * @tc.desc   Test UI ultra2 matrix 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20007
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0007
     * @tc.desc   Test UI ultra2 matrix 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20008
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0008
     * @tc.desc   Test UI ultra2 matrix 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20009
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0009
     * @tc.desc   Test UI ultra2 matrix 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20010
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0010
     * @tc.desc   Test UI ultra2 matrix 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20011
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0011
     * @tc.desc   Test UI ultra2 matrix 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20012
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0012
     * @tc.desc   Test UI ultra2 matrix 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20013
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0013
     * @tc.desc   Test UI ultra2 matrix 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20014
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0014
     * @tc.desc   Test UI ultra2 matrix 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20015
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0015
     * @tc.desc   Test UI ultra2 matrix 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20016
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0016
     * @tc.desc   Test UI ultra2 matrix 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20017
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0017
     * @tc.desc   Test UI ultra2 matrix 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20018
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0018
     * @tc.desc   Test UI ultra2 matrix 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20019
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0019
     * @tc.desc   Test UI ultra2 matrix 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20020
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0020
     * @tc.desc   Test UI ultra2 matrix 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20021
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0021
     * @tc.desc   Test UI ultra2 matrix 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20022
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0022
     * @tc.desc   Test UI ultra2 matrix 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20023
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0023
     * @tc.desc   Test UI ultra2 matrix 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20024
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0024
     * @tc.desc   Test UI ultra2 matrix 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20025
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0025
     * @tc.desc   Test UI ultra2 matrix 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20026
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0026
     * @tc.desc   Test UI ultra2 matrix 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20027
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0027
     * @tc.desc   Test UI ultra2 matrix 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20028
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0028
     * @tc.desc   Test UI ultra2 matrix 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20029
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0029
     * @tc.desc   Test UI ultra2 matrix 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20030
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0030
     * @tc.desc   Test UI ultra2 matrix 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20031
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0031
     * @tc.desc   Test UI ultra2 matrix 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20032
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0032
     * @tc.desc   Test UI ultra2 matrix 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20033
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0033
     * @tc.desc   Test UI ultra2 matrix 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20034
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0034
     * @tc.desc   Test UI ultra2 matrix 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20035
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0035
     * @tc.desc   Test UI ultra2 matrix 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20036
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0036
     * @tc.desc   Test UI ultra2 matrix 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20037
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0037
     * @tc.desc   Test UI ultra2 matrix 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20038
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0038
     * @tc.desc   Test UI ultra2 matrix 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20039
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0039
     * @tc.desc   Test UI ultra2 matrix 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20040
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0040
     * @tc.desc   Test UI ultra2 matrix 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20041
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0041
     * @tc.desc   Test UI ultra2 matrix 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20042
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0042
     * @tc.desc   Test UI ultra2 matrix 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20043
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0043
     * @tc.desc   Test UI ultra2 matrix 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20044
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0044
     * @tc.desc   Test UI ultra2 matrix 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20045
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0045
     * @tc.desc   Test UI ultra2 matrix 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20046
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0046
     * @tc.desc   Test UI ultra2 matrix 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20047
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0047
     * @tc.desc   Test UI ultra2 matrix 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20048
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0048
     * @tc.desc   Test UI ultra2 matrix 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20049
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0049
     * @tc.desc   Test UI ultra2 matrix 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiUltra20050
     * @tc.number SUB_SOFTBUS_UI_ULTRA2_0050
     * @tc.desc   Test UI ultra2 matrix 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiUltra20050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })
  })
}
