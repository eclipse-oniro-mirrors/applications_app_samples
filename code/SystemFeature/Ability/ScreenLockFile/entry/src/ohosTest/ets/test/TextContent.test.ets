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
import { screenLockFileManager } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_OPERATION_RESULT, TEXT_QUERY_RESULT, TEXT_ACQUIRE_RESULT, TEXT_RELEASE_RESULT
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function textContentTest(): void {
  describe('TextContentTest', (): void => {

    // ==================== 文本内容验证（10 条） ====================

    /*
     * @tc.number: SUB_TXC_0100
     * @tc.name: testTextContent0001
     * @tc.desc: Verify TextContent scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testTextContent0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      expect(result.includes('Ready') || result.includes('就绪') || result.includes('queryAppKeyState') ||
        result.includes('acquireAccess') || result.includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testTextContent0001');
    });

    /*
     * @tc.number: SUB_TXC_0200
     * @tc.name: testTextContent0002
     * @tc.desc: Verify TextContent scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testTextContent0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('Release:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testTextContent0002');
    });

    /*
     * @tc.number: SUB_TXC_0300
     * @tc.name: testTextContent0003
     * @tc.desc: Verify TextContent scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testTextContent0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('queryKeyStateButton', ID_OPERATION_RESULT);
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testTextContent0003');
    });

    /*
     * @tc.number: SUB_TXC_0400
     * @tc.name: testTextContent0004
     * @tc.desc: Verify TextContent scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testTextContent0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('acquireAccessButton', ID_OPERATION_RESULT);
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testTextContent0004');
    });

    /*
     * @tc.number: SUB_TXC_0500
     * @tc.name: testTextContent0005
     * @tc.desc: Verify TextContent scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testTextContent0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('releaseAccessButton', ID_OPERATION_RESULT);
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testTextContent0005');
    });

    /*
     * @tc.number: SUB_TXC_0600
     * @tc.name: testTextContent0006
     * @tc.desc: Verify TextContent scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testTextContent0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('queryAllStatesButton', ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testTextContent0006');
    });

    /*
     * @tc.number: SUB_TXC_0700
     * @tc.name: testTextContent0007
     * @tc.desc: Verify TextContent scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testTextContent0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testTextContent0007');
    });

    /*
     * @tc.number: SUB_TXC_0800
     * @tc.name: testTextContent0008
     * @tc.desc: Verify TextContent scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testTextContent0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      const sections: string[] = pairing.split('|');
      expect(sections.length).assertEqual(3);
      expect(sections[0].includes('Acquire')).assertTrue();
      expect(sections[1].includes('Release')).assertTrue();
      sharedDriver.hilogEnd('testTextContent0008');
    });

    /*
     * @tc.number: SUB_TXC_0900
     * @tc.name: testTextContent0009
     * @tc.desc: Verify TextContent scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testTextContent0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult('queryKeyStateButton', ID_OPERATION_RESULT);
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testTextContent0009');
    });

    /*
     * @tc.number: SUB_TXC_1000
     * @tc.name: testTextContent0010
     * @tc.desc: Verify TextContent scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testTextContent0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testTextContent0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(typeof result.length).assertEqual('number');
      sharedDriver.hilogEnd('testTextContent0010');
    });
  });
}
