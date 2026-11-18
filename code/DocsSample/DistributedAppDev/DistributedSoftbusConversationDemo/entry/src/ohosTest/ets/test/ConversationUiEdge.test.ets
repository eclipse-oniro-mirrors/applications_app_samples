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
export default function conversationUiEdgeTest() {
  describe('ConversationUiEdgeTest', () => {
    let driver: Driver;
    beforeAll(async () => { const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' }; await DELEGATOR.startAbility(want); await delay(2000); driver = await Driver.create(); })

    /**
     * @tc.name   testUiEdge0001
     * @tc.number SUB_SOFTBUS_UI_EDGE_0001
     * @tc.desc   Test UI edge matrix 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0002
     * @tc.number SUB_SOFTBUS_UI_EDGE_0002
     * @tc.desc   Test UI edge matrix 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0003
     * @tc.number SUB_SOFTBUS_UI_EDGE_0003
     * @tc.desc   Test UI edge matrix 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0004
     * @tc.number SUB_SOFTBUS_UI_EDGE_0004
     * @tc.desc   Test UI edge matrix 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0005
     * @tc.number SUB_SOFTBUS_UI_EDGE_0005
     * @tc.desc   Test UI edge matrix 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0006
     * @tc.number SUB_SOFTBUS_UI_EDGE_0006
     * @tc.desc   Test UI edge matrix 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0007
     * @tc.number SUB_SOFTBUS_UI_EDGE_0007
     * @tc.desc   Test UI edge matrix 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0008
     * @tc.number SUB_SOFTBUS_UI_EDGE_0008
     * @tc.desc   Test UI edge matrix 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0009
     * @tc.number SUB_SOFTBUS_UI_EDGE_0009
     * @tc.desc   Test UI edge matrix 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0010
     * @tc.number SUB_SOFTBUS_UI_EDGE_0010
     * @tc.desc   Test UI edge matrix 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0011
     * @tc.number SUB_SOFTBUS_UI_EDGE_0011
     * @tc.desc   Test UI edge matrix 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0012
     * @tc.number SUB_SOFTBUS_UI_EDGE_0012
     * @tc.desc   Test UI edge matrix 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0013
     * @tc.number SUB_SOFTBUS_UI_EDGE_0013
     * @tc.desc   Test UI edge matrix 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0014
     * @tc.number SUB_SOFTBUS_UI_EDGE_0014
     * @tc.desc   Test UI edge matrix 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0015
     * @tc.number SUB_SOFTBUS_UI_EDGE_0015
     * @tc.desc   Test UI edge matrix 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0016
     * @tc.number SUB_SOFTBUS_UI_EDGE_0016
     * @tc.desc   Test UI edge matrix 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0017
     * @tc.number SUB_SOFTBUS_UI_EDGE_0017
     * @tc.desc   Test UI edge matrix 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0018
     * @tc.number SUB_SOFTBUS_UI_EDGE_0018
     * @tc.desc   Test UI edge matrix 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0019
     * @tc.number SUB_SOFTBUS_UI_EDGE_0019
     * @tc.desc   Test UI edge matrix 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0020
     * @tc.number SUB_SOFTBUS_UI_EDGE_0020
     * @tc.desc   Test UI edge matrix 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0021
     * @tc.number SUB_SOFTBUS_UI_EDGE_0021
     * @tc.desc   Test UI edge matrix 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0022
     * @tc.number SUB_SOFTBUS_UI_EDGE_0022
     * @tc.desc   Test UI edge matrix 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Register Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0023
     * @tc.number SUB_SOFTBUS_UI_EDGE_0023
     * @tc.desc   Test UI edge matrix 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Unregister Listener')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0024
     * @tc.number SUB_SOFTBUS_UI_EDGE_0024
     * @tc.desc   Test UI edge matrix 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Send Message')); expect(true).assertTrue(); })

    /**
     * @tc.name   testUiEdge0025
     * @tc.number SUB_SOFTBUS_UI_EDGE_0025
     * @tc.desc   Test UI edge matrix 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiEdge0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => { await driver.assertComponentExist(ON.text('Get Trusted Devices')); expect(true).assertTrue(); })
  })
}
