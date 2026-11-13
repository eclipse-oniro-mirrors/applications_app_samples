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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry, Component, Driver, ON } from '@kit.TestKit';
import { Want } from '@kit.AbilityKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_DistributedSoftbus_Matrix]';
const BUNDLE_NAME: string = abilityDelegatorRegistry.getArguments().bundleName;
const TITLE_TEXT: string = 'Distributed SoftBus Conversation Test';
const GET_DEVICES_TEXT: string = 'Get Trusted Devices';
const REGISTER_TEXT: string = 'Register Listener';
const UNREGISTER_TEXT: string = 'Unregister Listener';
const SEND_TEXT: string = 'Send Message';
const DELEGATOR = abilityDelegatorRegistry.getAbilityDelegator();

function delay(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function conversationUiMatrixTest() {
  describe('ConversationUiMatrixTest', () => {
    let driver: Driver;

    beforeAll(async () => {
      const want: Want = {
        bundleName: BUNDLE_NAME,
        abilityName: 'EntryAbility'
      };
      await DELEGATOR.startAbility(want);
      await delay(2500);
      driver = await Driver.create();
      const allowText: string = '\u5141\u8bb8';
      const allow1: Component = await driver.findComponent(ON.text(allowText));
      if (allow1 !== null) {
        await allow1.click();
        await delay(1000);
      }
      const allow2: Component = await driver.findComponent(ON.text(allowText));
      if (allow2 !== null) {
        await allow2.click();
        await delay(1000);
      }
    })

    /**
     * @tc.name   testUiMatrix0001
     * @tc.number SUB_SOFTBUS_UI_0001
     * @tc.desc   Test the page title. UI matrix case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0001 begin');
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0001 end');
    })

    /**
     * @tc.name   testUiMatrix0002
     * @tc.number SUB_SOFTBUS_UI_0002
     * @tc.desc   Test the getDevices button click. UI matrix case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0002 begin');
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0002 end');
    })

    /**
     * @tc.name   testUiMatrix0003
     * @tc.number SUB_SOFTBUS_UI_0003
     * @tc.desc   Test the register button click. UI matrix case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0003 begin');
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0003 end');
    })

    /**
     * @tc.name   testUiMatrix0004
     * @tc.number SUB_SOFTBUS_UI_0004
     * @tc.desc   Test the unregister button click. UI matrix case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0004 begin');
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0004 end');
    })

    /**
     * @tc.name   testUiMatrix0005
     * @tc.number SUB_SOFTBUS_UI_0005
     * @tc.desc   Test the send button click. UI matrix case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0005 begin');
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0005 end');
    })

    /**
     * @tc.name   testUiMatrix0006
     * @tc.number SUB_SOFTBUS_UI_0006
     * @tc.desc   Test the page title. UI matrix case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0006 begin');
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0006 end');
    })

    /**
     * @tc.name   testUiMatrix0007
     * @tc.number SUB_SOFTBUS_UI_0007
     * @tc.desc   Test the getDevices button click. UI matrix case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0007 begin');
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0007 end');
    })

    /**
     * @tc.name   testUiMatrix0008
     * @tc.number SUB_SOFTBUS_UI_0008
     * @tc.desc   Test the register button click. UI matrix case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0008 begin');
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0008 end');
    })

    /**
     * @tc.name   testUiMatrix0009
     * @tc.number SUB_SOFTBUS_UI_0009
     * @tc.desc   Test the unregister button click. UI matrix case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0009 begin');
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0009 end');
    })

    /**
     * @tc.name   testUiMatrix0010
     * @tc.number SUB_SOFTBUS_UI_0010
     * @tc.desc   Test the send button click. UI matrix case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0010 begin');
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0010 end');
    })

    /**
     * @tc.name   testUiMatrix0011
     * @tc.number SUB_SOFTBUS_UI_0011
     * @tc.desc   Test the page title. UI matrix case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0011 begin');
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0011 end');
    })

    /**
     * @tc.name   testUiMatrix0012
     * @tc.number SUB_SOFTBUS_UI_0012
     * @tc.desc   Test the getDevices button click. UI matrix case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0012 begin');
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0012 end');
    })

    /**
     * @tc.name   testUiMatrix0013
     * @tc.number SUB_SOFTBUS_UI_0013
     * @tc.desc   Test the register button click. UI matrix case 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0013 begin');
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0013 end');
    })

    /**
     * @tc.name   testUiMatrix0014
     * @tc.number SUB_SOFTBUS_UI_0014
     * @tc.desc   Test the unregister button click. UI matrix case 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0014 begin');
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0014 end');
    })

    /**
     * @tc.name   testUiMatrix0015
     * @tc.number SUB_SOFTBUS_UI_0015
     * @tc.desc   Test the send button click. UI matrix case 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0015 begin');
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0015 end');
    })

    /**
     * @tc.name   testUiMatrix0016
     * @tc.number SUB_SOFTBUS_UI_0016
     * @tc.desc   Test the page title. UI matrix case 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0016 begin');
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0016 end');
    })

    /**
     * @tc.name   testUiMatrix0017
     * @tc.number SUB_SOFTBUS_UI_0017
     * @tc.desc   Test the getDevices button click. UI matrix case 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0017 begin');
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0017 end');
    })

    /**
     * @tc.name   testUiMatrix0018
     * @tc.number SUB_SOFTBUS_UI_0018
     * @tc.desc   Test the register button click. UI matrix case 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0018 begin');
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0018 end');
    })

    /**
     * @tc.name   testUiMatrix0019
     * @tc.number SUB_SOFTBUS_UI_0019
     * @tc.desc   Test the unregister button click. UI matrix case 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0019 begin');
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0019 end');
    })

    /**
     * @tc.name   testUiMatrix0020
     * @tc.number SUB_SOFTBUS_UI_0020
     * @tc.desc   Test the send button click. UI matrix case 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0020 begin');
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0020 end');
    })

    /**
     * @tc.name   testUiMatrix0021
     * @tc.number SUB_SOFTBUS_UI_0021
     * @tc.desc   Test the page title. UI matrix case 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0021 begin');
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0021 end');
    })

    /**
     * @tc.name   testUiMatrix0022
     * @tc.number SUB_SOFTBUS_UI_0022
     * @tc.desc   Test the getDevices button click. UI matrix case 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0022 begin');
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0022 end');
    })

    /**
     * @tc.name   testUiMatrix0023
     * @tc.number SUB_SOFTBUS_UI_0023
     * @tc.desc   Test the register button click. UI matrix case 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0023 begin');
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0023 end');
    })

    /**
     * @tc.name   testUiMatrix0024
     * @tc.number SUB_SOFTBUS_UI_0024
     * @tc.desc   Test the unregister button click. UI matrix case 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0024 begin');
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0024 end');
    })

    /**
     * @tc.name   testUiMatrix0025
     * @tc.number SUB_SOFTBUS_UI_0025
     * @tc.desc   Test the send button click. UI matrix case 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0025 begin');
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0025 end');
    })

    /**
     * @tc.name   testUiMatrix0026
     * @tc.number SUB_SOFTBUS_UI_0026
     * @tc.desc   Test the page title. UI matrix case 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0026 begin');
      await driver.assertComponentExist(ON.text('Distributed SoftBus Conversation Test'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0026 end');
    })

    /**
     * @tc.name   testUiMatrix0027
     * @tc.number SUB_SOFTBUS_UI_0027
     * @tc.desc   Test the getDevices button click. UI matrix case 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0027 begin');
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      const button: Component = await driver.findComponent(ON.text('Get Trusted Devices'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Get Trusted Devices'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0027 end');
    })

    /**
     * @tc.name   testUiMatrix0028
     * @tc.number SUB_SOFTBUS_UI_0028
     * @tc.desc   Test the register button click. UI matrix case 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0028 begin');
      await driver.assertComponentExist(ON.text('Register Listener'));
      const button: Component = await driver.findComponent(ON.text('Register Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Register Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0028 end');
    })

    /**
     * @tc.name   testUiMatrix0029
     * @tc.number SUB_SOFTBUS_UI_0029
     * @tc.desc   Test the unregister button click. UI matrix case 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0029 begin');
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      const button: Component = await driver.findComponent(ON.text('Unregister Listener'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Unregister Listener'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0029 end');
    })

    /**
     * @tc.name   testUiMatrix0030
     * @tc.number SUB_SOFTBUS_UI_0030
     * @tc.desc   Test the send button click. UI matrix case 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testUiMatrix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, 'testUiMatrix0030 begin');
      await driver.assertComponentExist(ON.text('Send Message'));
      const button: Component = await driver.findComponent(ON.text('Send Message'));
      await button.click();
      await delay(500);
      await driver.assertComponentExist(ON.text('Send Message'));
      expect(true).assertTrue();
      hilog.info(DOMAIN, TAG, 'testUiMatrix0030 end');
    })
  })
}
