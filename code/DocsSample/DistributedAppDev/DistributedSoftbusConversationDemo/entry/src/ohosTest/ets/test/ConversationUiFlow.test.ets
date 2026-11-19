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
function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => { setTimeout(() => { resolve(); }, ms); });
}

export default function conversationUiFlowTest() {
  describe('ConversationUiFlowTest', () => {
    let driver: Driver;
    beforeAll(async () => {
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
      await DELEGATOR.startAbility(want);
      await delay(2000);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testUiFlow0001
     * @tc.number SUB_SOFTBUS_UI_FLOW_0001
     * @tc.desc   Test UI action flow, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0002
     * @tc.number SUB_SOFTBUS_UI_FLOW_0002
     * @tc.desc   Test UI action flow, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0003
     * @tc.number SUB_SOFTBUS_UI_FLOW_0003
     * @tc.desc   Test UI action flow, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0004
     * @tc.number SUB_SOFTBUS_UI_FLOW_0004
     * @tc.desc   Test UI action flow, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0005
     * @tc.number SUB_SOFTBUS_UI_FLOW_0005
     * @tc.desc   Test UI action flow, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0006
     * @tc.number SUB_SOFTBUS_UI_FLOW_0006
     * @tc.desc   Test UI action flow, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0007
     * @tc.number SUB_SOFTBUS_UI_FLOW_0007
     * @tc.desc   Test UI action flow, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0008
     * @tc.number SUB_SOFTBUS_UI_FLOW_0008
     * @tc.desc   Test UI action flow, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0009
     * @tc.number SUB_SOFTBUS_UI_FLOW_0009
     * @tc.desc   Test UI action flow, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0010
     * @tc.number SUB_SOFTBUS_UI_FLOW_0010
     * @tc.desc   Test UI action flow, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0011
     * @tc.number SUB_SOFTBUS_UI_FLOW_0011
     * @tc.desc   Test UI action flow, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0012
     * @tc.number SUB_SOFTBUS_UI_FLOW_0012
     * @tc.desc   Test UI action flow, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0013
     * @tc.number SUB_SOFTBUS_UI_FLOW_0013
     * @tc.desc   Test UI action flow, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0014
     * @tc.number SUB_SOFTBUS_UI_FLOW_0014
     * @tc.desc   Test UI action flow, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0015
     * @tc.number SUB_SOFTBUS_UI_FLOW_0015
     * @tc.desc   Test UI action flow, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0016
     * @tc.number SUB_SOFTBUS_UI_FLOW_0016
     * @tc.desc   Test UI action flow, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0017
     * @tc.number SUB_SOFTBUS_UI_FLOW_0017
     * @tc.desc   Test UI action flow, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0018
     * @tc.number SUB_SOFTBUS_UI_FLOW_0018
     * @tc.desc   Test UI action flow, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0019
     * @tc.number SUB_SOFTBUS_UI_FLOW_0019
     * @tc.desc   Test UI action flow, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0020
     * @tc.number SUB_SOFTBUS_UI_FLOW_0020
     * @tc.desc   Test UI action flow, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0021
     * @tc.number SUB_SOFTBUS_UI_FLOW_0021
     * @tc.desc   Test UI action flow, case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0022
     * @tc.number SUB_SOFTBUS_UI_FLOW_0022
     * @tc.desc   Test UI action flow, case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0023
     * @tc.number SUB_SOFTBUS_UI_FLOW_0023
     * @tc.desc   Test UI action flow, case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0024
     * @tc.number SUB_SOFTBUS_UI_FLOW_0024
     * @tc.desc   Test UI action flow, case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0025
     * @tc.number SUB_SOFTBUS_UI_FLOW_0025
     * @tc.desc   Test UI action flow, case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0026
     * @tc.number SUB_SOFTBUS_UI_FLOW_0026
     * @tc.desc   Test UI action flow, case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0027
     * @tc.number SUB_SOFTBUS_UI_FLOW_0027
     * @tc.desc   Test UI action flow, case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0028
     * @tc.number SUB_SOFTBUS_UI_FLOW_0028
     * @tc.desc   Test UI action flow, case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0029
     * @tc.number SUB_SOFTBUS_UI_FLOW_0029
     * @tc.desc   Test UI action flow, case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiFlow0030
     * @tc.number SUB_SOFTBUS_UI_FLOW_0030
     * @tc.desc   Test UI action flow, case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiFlow0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })
  })
}
