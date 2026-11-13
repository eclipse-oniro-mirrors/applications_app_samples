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

export default function conversationUiRepeatedTest() {
  describe('ConversationUiRepeatedTest', () => {
    let driver: Driver;
    beforeAll(async () => {
      const want: Want = { bundleName: BUNDLE_NAME, abilityName: 'EntryAbility' };
      await DELEGATOR.startAbility(want);
      await delay(2000);
      driver = await Driver.create();
    })

    /**
     * @tc.name   testUiRepeated0001
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0001
     * @tc.desc   Test UI component repeated existence, case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0002
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0002
     * @tc.desc   Test UI component repeated existence, case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0003
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0003
     * @tc.desc   Test UI component repeated existence, case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0004
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0004
     * @tc.desc   Test UI component repeated existence, case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0005
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0005
     * @tc.desc   Test UI component repeated existence, case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0006
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0006
     * @tc.desc   Test UI component repeated existence, case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0007
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0007
     * @tc.desc   Test UI component repeated existence, case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0008
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0008
     * @tc.desc   Test UI component repeated existence, case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0009
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0009
     * @tc.desc   Test UI component repeated existence, case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0010
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0010
     * @tc.desc   Test UI component repeated existence, case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0011
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0011
     * @tc.desc   Test UI component repeated existence, case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0012
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0012
     * @tc.desc   Test UI component repeated existence, case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0013
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0013
     * @tc.desc   Test UI component repeated existence, case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0014
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0014
     * @tc.desc   Test UI component repeated existence, case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0015
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0015
     * @tc.desc   Test UI component repeated existence, case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0016
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0016
     * @tc.desc   Test UI component repeated existence, case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0017
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0017
     * @tc.desc   Test UI component repeated existence, case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0018
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0018
     * @tc.desc   Test UI component repeated existence, case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0019
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0019
     * @tc.desc   Test UI component repeated existence, case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
    })

    /**
     * @tc.name   testUiRepeated0020
     * @tc.number SUB_SOFTBUS_UI_REPEAT_0020
     * @tc.desc   Test UI component repeated existence, case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiRepeated0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
    })
  })
}
