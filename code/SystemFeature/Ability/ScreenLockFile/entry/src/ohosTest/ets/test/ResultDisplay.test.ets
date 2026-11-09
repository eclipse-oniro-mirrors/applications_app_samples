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
import { TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  TEXT_QUERY_RESULT, TEXT_ACQUIRE_RESULT, TEXT_RELEASE_RESULT
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function resultDisplayTest(): void {
  describe('ResultDisplayTest', (): void => {

    // ==================== 结果展示验证（30 条） ====================

    /*
     * @tc.number: SUB_RSD_0100
     * @tc.name: testResultDisplay0001
     * @tc.desc: Verify ResultDisplay scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResultDisplay0001');
    });

    /*
     * @tc.number: SUB_RSD_0200
     * @tc.name: testResultDisplay0002
     * @tc.desc: Verify ResultDisplay scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testResultDisplay0002');
    });

    /*
     * @tc.number: SUB_RSD_0300
     * @tc.name: testResultDisplay0003
     * @tc.desc: Verify ResultDisplay scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      const hasAccess: boolean = result.includes('ACCESS_GRANTED') || result.includes('ACCESS_DENIED');
      expect(hasAccess).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testResultDisplay0003');
    });

    /*
     * @tc.number: SUB_RSD_0400
     * @tc.name: testResultDisplay0004
     * @tc.desc: Verify ResultDisplay scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      const hasRelease: boolean = result.includes('RELEASE_GRANTED') || result.includes('RELEASE_DENIED');
      expect(hasRelease).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testResultDisplay0004');
    });

    /*
     * @tc.number: SUB_RSD_0500
     * @tc.name: testResultDisplay0005
     * @tc.desc: Verify ResultDisplay scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0005');
    });

    /*
     * @tc.number: SUB_RSD_0600
     * @tc.name: testResultDisplay0006
     * @tc.desc: Verify ResultDisplay scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      const hasKeyName: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResultDisplay0006');
    });

    /*
     * @tc.number: SUB_RSD_0700
     * @tc.name: testResultDisplay0007
     * @tc.desc: Verify ResultDisplay scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      const hasFormat: boolean = result.includes('acquireAccess: ACCESS_');
      expect(hasFormat).assertTrue();
      expect(result.length).assertLarger(10);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResultDisplay0007');
    });

    /*
     * @tc.number: SUB_RSD_0800
     * @tc.name: testResultDisplay0008
     * @tc.desc: Verify ResultDisplay scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      const hasFormat: boolean = result.includes('releaseAccess: RELEASE_');
      expect(hasFormat).assertTrue();
      expect(result.length).assertLarger(10);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResultDisplay0008');
    });

    /*
     * @tc.number: SUB_RSD_0900
     * @tc.name: testResultDisplay0009
     * @tc.desc: Verify ResultDisplay scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      const pipeCount: number = result.split('|').length - 1;
      expect(pipeCount).assertEqual(3);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0009');
    });

    /*
     * @tc.number: SUB_RSD_1000
     * @tc.name: testResultDisplay0010
     * @tc.desc: Verify ResultDisplay scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r1.includes(TEXT_QUERY_RESULT)).assertTrue();
      const r2: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(r2.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(r1 !== r2).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0010');
    });

    /*
     * @tc.number: SUB_RSD_1100
     * @tc.name: testResultDisplay0011
     * @tc.desc: Verify ResultDisplay scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.includes(TEXT_QUERY_RESULT)).assertFalse();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0011');
    });

    /*
     * @tc.number: SUB_RSD_1200
     * @tc.name: testResultDisplay0012
     * @tc.desc: Verify ResultDisplay scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      const hasEnum: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasEnum).assertTrue();
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0012');
    });

    /*
     * @tc.number: SUB_RSD_1300
     * @tc.name: testResultDisplay0013
     * @tc.desc: Verify ResultDisplay scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      const hasEnum: boolean = result.includes('ACCESS_GRANTED') || result.includes('ACCESS_DENIED');
      expect(hasEnum).assertTrue();
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0013');
    });

    /*
     * @tc.number: SUB_RSD_1400
     * @tc.name: testResultDisplay0014
     * @tc.desc: Verify ResultDisplay scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      const hasEnum: boolean = result.includes('RELEASE_GRANTED') || result.includes('RELEASE_DENIED');
      expect(hasEnum).assertTrue();
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0014');
    });

    /*
     * @tc.number: SUB_RSD_1500
     * @tc.name: testResultDisplay0015
     * @tc.desc: Verify ResultDisplay scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      expect(result.length).assertLarger(20);
      sharedDriver.hilogEnd('testResultDisplay0015');
    });

    /*
     * @tc.number: SUB_RSD_1600
     * @tc.name: testResultDisplay0016
     * @tc.desc: Verify ResultDisplay scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('Release:')).assertTrue();
      expect(result.includes('Pending:')).assertTrue();
      expect(result.length).assertLarger(20);
      sharedDriver.hilogEnd('testResultDisplay0016');
    });

    /*
     * @tc.number: SUB_RSD_1700
     * @tc.name: testResultDisplay0017
     * @tc.desc: Verify ResultDisplay scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('Error')).assertFalse();
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0017');
    });

    /*
     * @tc.number: SUB_RSD_1800
     * @tc.name: testResultDisplay0018
     * @tc.desc: Verify ResultDisplay scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('Error')).assertFalse();
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0018');
    });

    /*
     * @tc.number: SUB_RSD_1900
     * @tc.name: testResultDisplay0019
     * @tc.desc: Verify ResultDisplay scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('Error')).assertFalse();
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0019');
    });

    /*
     * @tc.number: SUB_RSD_2000
     * @tc.name: testResultDisplay0020
     * @tc.desc: Verify ResultDisplay scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const exists: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testResultDisplay0020');
    });

    /*
     * @tc.number: SUB_RSD_2100
     * @tc.name: testResultDisplay0021
     * @tc.desc: Verify ResultDisplay scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const results: string[] = [];
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      results.push(await sharedDriver.getTextById(ID_OPERATION_RESULT));
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      results.push(await sharedDriver.getTextById(ID_OPERATION_RESULT));
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      results.push(await sharedDriver.getTextById(ID_OPERATION_RESULT));
      expect(results.length).assertEqual(3);
      expect(results[0] !== results[1]).assertTrue();
      expect(results[1] !== results[2]).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0021');
    });

    /*
     * @tc.number: SUB_RSD_2200
     * @tc.name: testResultDisplay0022
     * @tc.desc: Verify ResultDisplay scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0022');
    });

    /*
     * @tc.number: SUB_RSD_2300
     * @tc.name: testResultDisplay0023
     * @tc.desc: Verify ResultDisplay scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0023');
    });

    /*
     * @tc.number: SUB_RSD_2400
     * @tc.name: testResultDisplay0024
     * @tc.desc: Verify ResultDisplay scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      const parts: string[] = result.split('|');
      expect(parts.length).assertEqual(4);
      expect(parts[0].includes('KeyState')).assertTrue();
      expect(parts[1].includes('Acquire')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0024');
    });

    /*
     * @tc.number: SUB_RSD_2500
     * @tc.name: testResultDisplay0025
     * @tc.desc: Verify ResultDisplay scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r2: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r1).assertEqual(r2);
      expect(r1.includes('Ready') || r1.includes('就绪')).assertTrue();
      expect(r1.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0025');
    });

    /*
     * @tc.number: SUB_RSD_2600
     * @tc.name: testResultDisplay0026
     * @tc.desc: Verify ResultDisplay scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0026');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      const hasNumber: boolean = result.includes('(0)') || result.includes('(1)') || result.includes('(2)');
      expect(hasNumber).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0026');
    });

    /*
     * @tc.number: SUB_RSD_2700
     * @tc.name: testResultDisplay0027
     * @tc.desc: Verify ResultDisplay scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      const hasNumber: boolean = result.includes('(0)') || result.includes('(1)');
      expect(hasNumber).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0027');
    });

    /*
     * @tc.number: SUB_RSD_2800
     * @tc.name: testResultDisplay0028
     * @tc.desc: Verify ResultDisplay scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      const hasNumber: boolean = result.includes('(0)') || result.includes('(1)');
      expect(hasNumber).assertTrue();
      expect(result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testResultDisplay0028');
    });

    /*
     * @tc.number: SUB_RSD_2900
     * @tc.name: testResultDisplay0029
     * @tc.desc: Verify ResultDisplay scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResultDisplay0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('Pending: 0')).assertTrue();
      expect(result.includes('Acquire: 0')).assertTrue();
      expect(result.includes('Release: 0')).assertTrue();
      sharedDriver.hilogEnd('testResultDisplay0029');
    });

    /*
     * @tc.number: SUB_RSD_3000
     * @tc.name: testResultDisplay0030
     * @tc.desc: Verify ResultDisplay scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResultDisplay0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResultDisplay0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof r1).assertEqual('string');
      expect(r1.length).assertLarger(0);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r2: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof r2).assertEqual('string');
      sharedDriver.hilogEnd('testResultDisplay0030');
    });
  });
}
