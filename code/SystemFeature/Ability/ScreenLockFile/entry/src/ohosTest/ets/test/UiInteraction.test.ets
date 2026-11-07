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

import { describe, expect, it } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function uiInteractionTest(): void {
  describe('UiInteractionTest', (): void => {

    // ==================== 按钮交互与结果展示验证（7 条） ====================

    /*
     * @tc.number: SUB_UI_0100
     * @tc.name: testUiInteraction0001
     * @tc.desc: Verify UiInteraction scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testUiInteraction0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const beforeText = await sharedDriver.getTextById('operationResult');
      const afterText = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
      sharedDriver.hilogAssert('testUiInteraction0001', 'result changed', (beforeText !== afterText).toString());
      expect(beforeText !== afterText).assertTrue();
      sharedDriver.hilogEnd('testUiInteraction0001');
    });

    /*
     * @tc.number: SUB_UI_0200
     * @tc.name: testUiInteraction0002
     * @tc.desc: Verify UiInteraction scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testUiInteraction0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const beforeText = await sharedDriver.getTextById('operationResult');
      const afterText = await sharedDriver.clickAndGetResult('acquireAccessButton', 'operationResult');
      sharedDriver.hilogAssert('testUiInteraction0002', 'result changed', (beforeText !== afterText).toString());
      expect(beforeText !== afterText).assertTrue();
      sharedDriver.hilogEnd('testUiInteraction0002');
    });

    /*
     * @tc.number: SUB_UI_0300
     * @tc.name: testUiInteraction0003
     * @tc.desc: Verify UiInteraction scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testUiInteraction0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const beforeText = await sharedDriver.getTextById('operationResult');
      const afterText = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
      sharedDriver.hilogAssert('testUiInteraction0003', 'result changed', (beforeText !== afterText).toString());
      expect(beforeText !== afterText).assertTrue();
      sharedDriver.hilogEnd('testUiInteraction0003');
    });

    /*
     * @tc.number: SUB_UI_0400
     * @tc.name: testUiInteraction0004
     * @tc.desc: Verify UiInteraction scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testUiInteraction0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const afterText = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      const containsKeyState = afterText.includes('KeyState');
      sharedDriver.hilogAssert('testUiInteraction0004', 'result contains KeyState', containsKeyState.toString());
      expect(containsKeyState).assertTrue();
      sharedDriver.hilogEnd('testUiInteraction0004');
    });

    /*
     * @tc.number: SUB_UI_0500
     * @tc.name: testUiInteraction0005
     * @tc.desc: Verify UiInteraction scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testUiInteraction0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      const beforeClear = await sharedDriver.getTextById('operationResult');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const afterClear = await sharedDriver.getTextById('operationResult');
      sharedDriver.hilogAssert('testUiInteraction0005', 'before clear', beforeClear);
      sharedDriver.hilogAssert('testUiInteraction0005', 'after clear', afterClear);
      expect(beforeClear !== afterClear).assertTrue();
      sharedDriver.hilogEnd('testUiInteraction0005');
    });

    /*
     * @tc.number: SUB_UI_0600
     * @tc.name: testUiInteraction0006
     * @tc.desc: Verify UiInteraction scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testUiInteraction0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const noHistoryExists = await sharedDriver.existsId('noHistoryText');
      sharedDriver.hilogAssert('testUiInteraction0006', 'noHistoryText visible before query', noHistoryExists.toString());
      expect(noHistoryExists).assertTrue();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const stillNoHistory = await sharedDriver.existsId('noHistoryText');
      sharedDriver.hilogAssert('testUiInteraction0006', 'noHistoryText hidden after query', (!stillNoHistory).toString());
      expect(stillNoHistory).assertFalse();
      sharedDriver.hilogEnd('testUiInteraction0006');
    });

    /*
     * @tc.number: SUB_UI_0700
     * @tc.name: testUiInteraction0007
     * @tc.desc: Verify UiInteraction scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testUiInteraction0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testUiInteraction0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairingText = await sharedDriver.getTextById('pairingStatus');
      const containsAcquire = pairingText.includes('Acquire');
      const containsRelease = pairingText.includes('Release');
      const containsPending = pairingText.includes('Pending');
      sharedDriver.hilogAssert('testUiInteraction0007', 'pairing text', pairingText);
      expect(containsAcquire).assertTrue();
      expect(containsRelease).assertTrue();
      expect(containsPending).assertTrue();
      sharedDriver.hilogEnd('testUiInteraction0007');
    });
  });
}
