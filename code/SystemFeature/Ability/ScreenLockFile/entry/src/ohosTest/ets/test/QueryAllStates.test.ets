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
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, TEXT_KEY_STATE, TEXT_ACQUIRE, TEXT_RELEASE, TEXT_PENDING
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper = new TestHelper(sharedDriver);

export default function queryAllStatesTest(): void {
  describe('QueryAllStatesTest', (): void => {

    // ==================== queryAppKeyState API 功能验证（25 条） ====================

    /*
     * @tc.number: SUB_QAS_0100
     * @tc.name: testQueryAppKeyState0001
     * @tc.desc: Verify QueryAppKeyState scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.length).assertLarger(0);
      expect(result.includes(TEXT_KEY_STATE)).assertTrue();
      expect(result.includes(TEXT_ACQUIRE)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0001');
    });

    /*
     * @tc.number: SUB_QAS_0200
     * @tc.name: testQueryAppKeyState0002
     * @tc.desc: Verify QueryAppKeyState scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes(TEXT_RELEASE)).assertTrue();
      expect(result.includes(TEXT_PENDING)).assertTrue();
      expect(result.includes('|')).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0002');
    });

    /*
     * @tc.number: SUB_QAS_0300
     * @tc.name: testQueryAppKeyState0003
     * @tc.desc: Verify QueryAppKeyState scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('Acquire: 0')).assertTrue();
      expect(result.includes('Release: 0')).assertTrue();
      expect(result.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0003');
    });

    /*
     * @tc.number: SUB_QAS_0400
     * @tc.name: testQueryAppKeyState0004
     * @tc.desc: Verify QueryAppKeyState scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.length).assertLarger(0);
      expect(result.includes(TEXT_KEY_STATE)).assertTrue();
      expect(result.includes(TEXT_ACQUIRE)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0004');
    });

    /*
     * @tc.number: SUB_QAS_0500
     * @tc.name: testQueryAppKeyState0005
     * @tc.desc: Verify QueryAppKeyState scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes(TEXT_RELEASE)).assertTrue();
      expect(result.includes(TEXT_PENDING)).assertTrue();
      expect(result.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0005');
    });

    /*
     * @tc.number: SUB_QAS_0600
     * @tc.name: testQueryAppKeyState0006
     * @tc.desc: Verify QueryAppKeyState scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result1 = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      const result2 = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result1).assertEqual(result2);
      expect(result1.length).assertLarger(0);
      expect(result2.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0006');
    });

    /*
     * @tc.number: SUB_QAS_0700
     * @tc.name: testQueryAppKeyState0007
     * @tc.desc: Verify QueryAppKeyState scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      const hasKeyName = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      expect(result.includes(TEXT_KEY_STATE)).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testQueryAppKeyState0007');
    });

    /*
     * @tc.number: SUB_QAS_0800
     * @tc.name: testQueryAppKeyState0008
     * @tc.desc: Verify QueryAppKeyState scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes(TEXT_ACQUIRE)).assertTrue();
      expect(result.includes(TEXT_PENDING)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0008');
    });

    /*
     * @tc.number: SUB_QAS_0900
     * @tc.name: testQueryAppKeyState0009
     * @tc.desc: Verify QueryAppKeyState scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      const parts = result.split('|');
      expect(parts.length).assertEqual(4);
      expect(parts[0].length).assertLarger(0);
      expect(parts[1].length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0009');
    });

    /*
     * @tc.number: SUB_QAS_1000
     * @tc.name: testQueryAppKeyState0010
     * @tc.desc: Verify QueryAppKeyState scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const beforeResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      await sharedDriver.clickId('queryKeyStateButton');
      const afterResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(beforeResult).assertEqual(afterResult);
      expect(beforeResult.length).assertLarger(0);
      expect(afterResult.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0010');
    });

    /*
     * @tc.number: SUB_QAS_1100
     * @tc.name: testQueryAppKeyState0011
     * @tc.desc: Verify QueryAppKeyState scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0011');
    });

    /*
     * @tc.number: SUB_QAS_1200
     * @tc.name: testQueryAppKeyState0012
     * @tc.desc: Verify QueryAppKeyState scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const counts = await testHelper.getExtDriver().parsePairingCounts();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes(`Acquire: ${counts.acquire}`)).assertTrue();
      expect(result.includes(`Release: ${counts.release}`)).assertTrue();
      expect(result.includes(`Pending: ${counts.pending}`)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0012');
    });

    /*
     * @tc.number: SUB_QAS_1300
     * @tc.name: testQueryAppKeyState0013
     * @tc.desc: Verify QueryAppKeyState scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      const keyStateMatch = new RegExp('KeyState:\\s*\\w+');
      const hasKeyState = keyStateMatch.test(result);
      expect(hasKeyState).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes(TEXT_KEY_STATE)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0013');
    });

    /*
     * @tc.number: SUB_QAS_1400
     * @tc.name: testQueryAppKeyState0014
     * @tc.desc: Verify QueryAppKeyState scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.clickId('acquireAccessButton');
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('Pending: 1')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes(TEXT_KEY_STATE)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0014');
    });

    /*
     * @tc.number: SUB_QAS_1500
     * @tc.name: testQueryAppKeyState0015
     * @tc.desc: Verify QueryAppKeyState scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const results: string[] = [];
      for (let i = 0; i < 3; i++) {
        const text = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
        results.push(text);
      }
      expect(results.length).assertEqual(3);
      expect(results[0]).assertEqual(results[1]);
      expect(results[1]).assertEqual(results[2]);
      sharedDriver.hilogEnd('testQueryAppKeyState0015');
    });

    /*
     * @tc.number: SUB_QAS_1600
     * @tc.name: testQueryAppKeyState0016
     * @tc.desc: Verify QueryAppKeyState scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('Pending:')).assertTrue();
      const pendingMatch = new RegExp('Pending:\\s*(\\d+)');
      const pendingExec = pendingMatch.exec(result);
      expect(pendingExec !== null).assertTrue();
      if (pendingExec !== null && pendingExec.length > 1) {
        const pendingVal = parseInt(pendingExec[1]);
        expect(pendingVal).assertLarger(-1);
      }
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0016');
    });

    /*
     * @tc.number: SUB_QAS_1700
     * @tc.name: testQueryAppKeyState0017
     * @tc.desc: Verify QueryAppKeyState scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 5; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
      }
      for (let i = 0; i < 5; i++) {
        await sharedDriver.clickId('releaseAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('Pending: 0')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes(TEXT_KEY_STATE)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0017');
    });

    /*
     * @tc.number: SUB_QAS_1800
     * @tc.name: testQueryAppKeyState0018
     * @tc.desc: Verify QueryAppKeyState scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const noHistory = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertTrue();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('Acquire: 0')).assertTrue();
      expect(result.includes('Release: 0')).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0018');
    });

    /*
     * @tc.number: SUB_QAS_1900
     * @tc.name: testQueryAppKeyState0019
     * @tc.desc: Verify QueryAppKeyState scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('KeyState:')).assertTrue();
      const hasEnumName = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasEnumName).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testQueryAppKeyState0019');
    });

    /*
     * @tc.number: SUB_QAS_2000
     * @tc.name: testQueryAppKeyState0020
     * @tc.desc: Verify QueryAppKeyState scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      const colonCount = (result.match(new RegExp(':', 'g')) || []).length;
      expect(colonCount).assertLarger(2);
      sharedDriver.hilogEnd('testQueryAppKeyState0020');
    });

    /*
     * @tc.number: SUB_QAS_2100
     * @tc.name: testQueryAppKeyState0021
     * @tc.desc: Verify QueryAppKeyState scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      const result1 = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      await sharedDriver.clickId('acquireAccessButton');
      const result2 = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result1 !== result2).assertTrue();
      expect(result1.length).assertLarger(0);
      expect(result2.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0021');
    });

    /*
     * @tc.number: SUB_QAS_2200
     * @tc.name: testQueryAppKeyState0022
     * @tc.desc: Verify QueryAppKeyState scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes(' | ')).assertTrue();
      const pipeCount = (result.match(new RegExp('\\|', 'g')) || []).length;
      expect(pipeCount).assertEqual(3);
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0022');
    });

    /*
     * @tc.number: SUB_QAS_2300
     * @tc.name: testQueryAppKeyState0023
     * @tc.desc: Verify QueryAppKeyState scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('releaseAccessButton');
      const result = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result.includes('Release:')).assertTrue();
      expect(result.includes('Pending: 0')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0023');
    });

    /*
     * @tc.number: SUB_QAS_2400
     * @tc.name: testQueryAppKeyState0024
     * @tc.desc: Verify QueryAppKeyState scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result1 = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const result2 = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(result1.length).assertLarger(0);
      expect(result2.length).assertLarger(0);
      expect(result2.includes(TEXT_KEY_STATE)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0024');
    });

    /*
     * @tc.number: SUB_QAS_2500
     * @tc.name: testQueryAppKeyState0025
     * @tc.desc: Verify QueryAppKeyState scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testQueryAppKeyState0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const initialResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(initialResult.includes('Acquire: 0')).assertTrue();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const resetResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(resetResult.includes('Acquire: 0')).assertTrue();
      expect(resetResult.includes('Release: 0')).assertTrue();
      expect(resetResult).assertEqual(initialResult);
      sharedDriver.hilogEnd('testQueryAppKeyState0025');
    });
  });
}
