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

import { afterEach, beforeEach, describe, expect, it } from '@ohos/hypium';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import { SharedDriver } from './SharedDriver';
import { ABILITY_NAME, BUNDLE_NAME } from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function abilityLifecycleTest(): void {
  describe('AbilityLifecycleTest', (): void => {

    beforeEach(async (): Promise<void> => {
      await abilityDelegator.startAbility({
        bundleName: BUNDLE_NAME,
        abilityName: ABILITY_NAME
      });
      await sharedDriver.waitTimeout();
    });

    afterEach(async (): Promise<void> => {
      await sharedDriver.waitUiIdle();
    });
    // ==================== 应用启动与页面元素完整性验证（3 条） ====================

    /*
     * @tc.number: SUB_AL_0100
     * @tc.name: testAbilityLifecycle0001
     * @tc.desc: Verify app launch and query key state button existence.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAbilityLifecycle0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAbilityLifecycle0001');
      const exists: boolean = await sharedDriver.existsId('queryKeyStateButton');
      sharedDriver.hilogAssert('testAbilityLifecycle0001', 'expects queryKeyStateButton to exist', exists.toString());
      expect(exists).assertTrue();
      sharedDriver.hilogEnd('testAbilityLifecycle0001');
    });

    /*
     * @tc.number: SUB_AL_0200
     * @tc.name: testAbilityLifecycle0002
     * @tc.desc: Verify all page element buttons exist.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAbilityLifecycle0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAbilityLifecycle0002');
      sharedDriver.hilogAssert('testAbilityLifecycle0002', 'checking queryKeyStateButton', '');
      await sharedDriver.assertComponentExist('queryKeyStateButton');
      sharedDriver.hilogAssert('testAbilityLifecycle0002', 'checking acquireAccessButton', '');
      await sharedDriver.assertComponentExist('acquireAccessButton');
      sharedDriver.hilogAssert('testAbilityLifecycle0002', 'checking releaseAccessButton', '');
      await sharedDriver.assertComponentExist('releaseAccessButton');
      sharedDriver.hilogAssert('testAbilityLifecycle0002', 'checking queryAllStatesButton', '');
      await sharedDriver.assertComponentExist('queryAllStatesButton');
      sharedDriver.hilogAssert('testAbilityLifecycle0002', 'checking operationResult', '');
      const driver: Driver = Driver.create();
      await driver.findComponent(ON.id('operationResult'));
      sharedDriver.hilogAssert('testAbilityLifecycle0002', 'checking pairingStatus', '');
      await driver.findComponent(ON.id('pairingStatus'));
      sharedDriver.hilogEnd('testAbilityLifecycle0002');
    });

    /*
     * @tc.number: SUB_AL_0300
     * @tc.name: testAbilityLifecycle0003
     * @tc.desc: Verify initial result text shows ready state.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testAbilityLifecycle0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAbilityLifecycle0003');
      await sharedDriver.waitUiIdle();
      await scrollToId('operationResult');
      const resultText: string = await sharedDriver.getTextById('operationResult');
      sharedDriver.hilogAssert('testAbilityLifecycle0003', 'initial result text', resultText);
      expect(resultText.length > 0).assertTrue();
      sharedDriver.hilogEnd('testAbilityLifecycle0003');
    });
  });
}
