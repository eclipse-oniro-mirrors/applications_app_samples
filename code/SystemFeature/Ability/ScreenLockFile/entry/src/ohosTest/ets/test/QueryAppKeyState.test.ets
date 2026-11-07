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
  DOMAIN, TAG,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper = new TestHelper(sharedDriver);

export default function queryAppKeyStateTest(): void {
  describe('QueryAppKeyStateTest', (): void => {

    // ==================== queryAppKeyState API 功能验证（30 条） ====================

    /*
     * @tc.number: SUB_QKS_0100
     * @tc.name: testQueryAppKeyState0001
     * @tc.desc: Verify QueryAppKeyState scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0001');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      const isValid = status === KEY_STATUS_NOT_EXIST ||
        status === KEY_STATUS_RELEASED ||
        status === KEY_STATUS_EXIST;
      expect(isValid).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0001');
    });

    /*
     * @tc.number: SUB_QKS_0200
     * @tc.name: testQueryAppKeyState0002
     * @tc.desc: Verify QueryAppKeyState scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0002');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      expect(status).assertLess(100);
      sharedDriver.hilogEnd('testQueryAppKeyState0002');
    });

    /*
     * @tc.number: SUB_QKS_0300
     * @tc.name: testQueryAppKeyState0003
     * @tc.desc: Verify QueryAppKeyState scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0003');
      const status1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const status2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(status1).assertEqual(status2);
      expect(typeof status1).assertEqual('number');
      expect(typeof status2).assertEqual('number');
      sharedDriver.hilogEnd('testQueryAppKeyState0003');
    });

    /*
     * @tc.number: SUB_QKS_0400
     * @tc.name: testQueryAppKeyState0004
     * @tc.desc: Verify QueryAppKeyState scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0004');
      const results: number[] = [];
      for (let i = 0; i < 5; i++) {
        const status = screenLockFileManager.queryAppKeyState();
        results.push(status);
      }
      for (let i = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
      expect(results.length).assertEqual(5);
      expect(testHelper.isValidKeyStatus(results[0])).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0004');
    });

    /*
     * @tc.number: SUB_QKS_0500
     * @tc.name: testQueryAppKeyState0005
     * @tc.desc: Verify QueryAppKeyState scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0005');
      const status = screenLockFileManager.queryAppKeyState();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testQueryAppKeyState0005');
    });

    /*
     * @tc.number: SUB_QKS_0600
     * @tc.name: testQueryAppKeyState0006
     * @tc.desc: Verify QueryAppKeyState scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0006');
      const status = screenLockFileManager.queryAppKeyState();
      const isKnown = status === KEY_STATUS_NOT_EXIST ||
        status === KEY_STATUS_RELEASED ||
        status === KEY_STATUS_EXIST;
      expect(isKnown).assertTrue();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      sharedDriver.hilogEnd('testQueryAppKeyState0006');
    });

    /*
     * @tc.number: SUB_QKS_0700
     * @tc.name: testQueryAppKeyState0007
     * @tc.desc: Verify QueryAppKeyState scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0007');
      const status = screenLockFileManager.queryAppKeyState();
      const enumValues: number[] = [];
      enumValues.push(KEY_STATUS_NOT_EXIST);
      enumValues.push(KEY_STATUS_RELEASED);
      enumValues.push(KEY_STATUS_EXIST);
      let found = false;
      for (let i = 0; i < enumValues.length; i++) {
        if (status === enumValues[i]) {
          found = true;
        }
      }
      expect(found).assertTrue();
      expect(enumValues.length).assertEqual(3);
      expect(status).assertLarger(-1);
      sharedDriver.hilogEnd('testQueryAppKeyState0007');
    });

    /*
     * @tc.number: SUB_QKS_0800
     * @tc.name: testQueryAppKeyState0008
     * @tc.desc: Verify QueryAppKeyState scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0008');
      const status = screenLockFileManager.queryAppKeyState();
      const name = testHelper.getKeyStatusName(status);
      expect(name.length).assertLarger(0);
      const isKnownName = name === 'KEY_NOT_EXIST' || name === 'KEY_RELEASED' ||
        name === 'KEY_EXIST' || name === 'UNKNOWN';
      expect(isKnownName).assertTrue();
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testQueryAppKeyState0008');
    });

    /*
     * @tc.number: SUB_QKS_0900
     * @tc.name: testQueryAppKeyState0009
     * @tc.desc: Verify QueryAppKeyState scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0009');
      let threwError = false;
      let status: screenLockFileManager.KeyStatus = KEY_STATUS_NOT_EXIST;
      try {
        status = screenLockFileManager.queryAppKeyState();
      } catch (error) {
        threwError = true;
      }
      expect(threwError).assertFalse();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testQueryAppKeyState0009');
    });

    /*
     * @tc.number: SUB_QKS_1000
     * @tc.name: testQueryAppKeyState0010
     * @tc.desc: Verify QueryAppKeyState scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0010');
      const results: number[] = [];
      for (let i = 0; i < 10; i++) {
        results.push(screenLockFileManager.queryAppKeyState());
      }
      expect(results.length).assertEqual(10);
      for (let i = 0; i < results.length; i++) {
        expect(testHelper.isValidKeyStatus(results[i])).assertTrue();
      }
      expect(results[0]).assertEqual(results[9]);
      sharedDriver.hilogEnd('testQueryAppKeyState0010');
    });

    /*
     * @tc.number: SUB_QKS_1100
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
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      sharedDriver.hilogEnd('testQueryAppKeyState0011');
    });

    /*
     * @tc.number: SUB_QKS_1200
     * @tc.name: testQueryAppKeyState0012
     * @tc.desc: Verify QueryAppKeyState scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const resultText = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
      expect(resultText.length).assertLarger(0);
      const containsQuery = resultText.includes('queryAppKeyState');
      expect(containsQuery).assertTrue();
      const hasKeyName = resultText.includes('KEY_NOT_EXIST') || resultText.includes('KEY_RELEASED') ||
        resultText.includes('KEY_EXIST');
      expect(hasKeyName).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0012');
    });

    /*
     * @tc.number: SUB_QKS_1300
     * @tc.name: testQueryAppKeyState0013
     * @tc.desc: Verify QueryAppKeyState scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0013');
      const notExist = KEY_STATUS_NOT_EXIST;
      const released = KEY_STATUS_RELEASED;
      const exist = KEY_STATUS_EXIST;
      expect(notExist !== released).assertTrue();
      expect(released !== exist).assertTrue();
      expect(notExist !== exist).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0013');
    });

    /*
     * @tc.number: SUB_QKS_1400
     * @tc.name: testQueryAppKeyState0014
     * @tc.desc: Verify QueryAppKeyState scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0014');
      expect(KEY_STATUS_NOT_EXIST).assertEqual(0);
      expect(KEY_STATUS_RELEASED).assertEqual(1);
      expect(KEY_STATUS_EXIST).assertEqual(2);
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0014');
    });

    /*
     * @tc.number: SUB_QKS_1500
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
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const noHistory = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const resultText = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      const containsQuery = resultText.includes('queryAppKeyState');
      expect(containsQuery).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0015');
    });

    /*
     * @tc.number: SUB_QKS_1600
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
      const beforePairing = await sharedDriver.getTextById('pairingStatus');
      screenLockFileManager.queryAppKeyState();
      const afterPairing = await sharedDriver.getTextById('pairingStatus');
      expect(beforePairing).assertEqual(afterPairing);
      expect(beforePairing.length).assertLarger(0);
      expect(afterPairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testQueryAppKeyState0016');
    });

    /*
     * @tc.number: SUB_QKS_1700
     * @tc.name: testQueryAppKeyState0017
     * @tc.desc: Verify QueryAppKeyState scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0017');
      const status1 = screenLockFileManager.queryAppKeyState();
      const status2 = screenLockFileManager.queryAppKeyState();
      const status3 = screenLockFileManager.queryAppKeyState();
      expect(status1).assertEqual(status2);
      expect(status2).assertEqual(status3);
      expect(status1).assertEqual(status3);
      sharedDriver.hilogEnd('testQueryAppKeyState0017');
    });

    /*
     * @tc.number: SUB_QKS_1800
     * @tc.name: testQueryAppKeyState0018
     * @tc.desc: Verify QueryAppKeyState scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0018');
      const beforeStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(beforeStatus)).assertTrue();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const afterStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(afterStatus)).assertTrue();
      expect(typeof afterStatus).assertEqual('number');
      sharedDriver.hilogEnd('testQueryAppKeyState0018');
    });

    /*
     * @tc.number: SUB_QKS_1900
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
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      sharedDriver.hilogEnd('testQueryAppKeyState0019');
    });

    /*
     * @tc.number: SUB_QKS_2000
     * @tc.name: testQueryAppKeyState0020
     * @tc.desc: Verify QueryAppKeyState scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0020');
      const status = screenLockFileManager.queryAppKeyState();
      const name = testHelper.getKeyStatusName(status);
      expect(name.length).assertLarger(0);
      const validNames: string[] = ['KEY_NOT_EXIST', 'KEY_RELEASED', 'KEY_EXIST', 'UNKNOWN'];
      let nameValid = false;
      for (let i = 0; i < validNames.length; i++) {
        if (name === validNames[i]) {
          nameValid = true;
        }
      }
      expect(nameValid).assertTrue();
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testQueryAppKeyState0020');
    });

    /*
     * @tc.number: SUB_QKS_2100
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
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const resultText = await sharedDriver.getTextById('operationResult');
      const hasPrefix = resultText.includes('queryAppKeyState:');
      expect(hasPrefix).assertTrue();
      const hasStatusInfo = resultText.includes('KEY_');
      expect(hasStatusInfo).assertTrue();
      expect(resultText.length).assertLarger(10);
      sharedDriver.hilogEnd('testQueryAppKeyState0021');
    });

    /*
     * @tc.number: SUB_QKS_2200
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
      const results: string[] = [];
      for (let i = 0; i < 3; i++) {
        const text = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
        results.push(text);
      }
      expect(results.length).assertEqual(3);
      for (let i = 0; i < results.length; i++) {
        expect(results[i].length).assertLarger(0);
      }
      expect(results[0]).assertEqual(results[2]);
      sharedDriver.hilogEnd('testQueryAppKeyState0022');
    });

    /*
     * @tc.number: SUB_QKS_2300
     * @tc.name: testQueryAppKeyState0023
     * @tc.desc: Verify QueryAppKeyState scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0023');
      const enumNot: number = screenLockFileManager.KeyStatus.KEY_NOT_EXIST;
      const enumRel: number = screenLockFileManager.KeyStatus.KEY_RELEASED;
      const enumExist: number = screenLockFileManager.KeyStatus.KEY_EXIST;
      expect(typeof enumNot).assertEqual('number');
      expect(typeof enumRel).assertEqual('number');
      expect(typeof enumExist).assertEqual('number');
      expect(enumNot !== enumExist).assertTrue();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0023');
    });

    /*
     * @tc.number: SUB_QKS_2400
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
      const queryResult = await sharedDriver.clickAndGetResult('queryKeyStateButton', 'operationResult');
      const allResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(allResult.length).assertLarger(queryResult.length);
      const containsKeyState = allResult.includes('KeyState');
      expect(containsKeyState).assertTrue();
      expect(allResult.includes('Acquire')).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0024');
    });

    /*
     * @tc.number: SUB_QKS_2500
     * @tc.name: testQueryAppKeyState0025
     * @tc.desc: Verify QueryAppKeyState scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0025');
      const status1 = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status1)).assertTrue();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const status2 = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status2)).assertTrue();
      expect(typeof status2).assertEqual('number');
      sharedDriver.hilogEnd('testQueryAppKeyState0025');
    });

    /*
     * @tc.number: SUB_QKS_2600
     * @tc.name: testQueryAppKeyState0026
     * @tc.desc: Verify QueryAppKeyState scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0026');
      const status1 = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status1)).assertTrue();
      try {
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const status2 = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status2)).assertTrue();
      expect(typeof status2).assertEqual('number');
      sharedDriver.hilogEnd('testQueryAppKeyState0026');
    });

    /*
     * @tc.number: SUB_QKS_2700
     * @tc.name: testQueryAppKeyState0027
     * @tc.desc: Verify QueryAppKeyState scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      const status1 = screenLockFileManager.queryAppKeyState();
      await sharedDriver.clickId('acquireAccessButton');
      const status2 = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status1)).assertTrue();
      expect(testHelper.isValidKeyStatus(status2)).assertTrue();
      expect(status1).assertEqual(status2);
      sharedDriver.hilogEnd('testQueryAppKeyState0027');
    });

    /*
     * @tc.number: SUB_QKS_2800
     * @tc.name: testQueryAppKeyState0028
     * @tc.desc: Verify QueryAppKeyState scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        await sharedDriver.clickId('queryKeyStateButton');
        await sharedDriver.waitUiIdle();
      }
      const noHistory = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const resultText = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      const containsQuery = resultText.includes('queryAppKeyState');
      expect(containsQuery).assertTrue();
      sharedDriver.hilogEnd('testQueryAppKeyState0028');
    });

    /*
     * @tc.number: SUB_QKS_2900
     * @tc.name: testQueryAppKeyState0029
     * @tc.desc: Verify QueryAppKeyState scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(status).assertLarger(-1);
      expect(status).assertLess(3);
      sharedDriver.hilogEnd('testQueryAppKeyState0029');
    });

    /*
     * @tc.number: SUB_QKS_3000
     * @tc.name: testQueryAppKeyState0030
     * @tc.desc: Verify QueryAppKeyState scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testQueryAppKeyState0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testQueryAppKeyState0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const initialStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(initialStatus)).assertTrue();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const afterQuery = screenLockFileManager.queryAppKeyState();
      expect(afterQuery).assertEqual(initialStatus);
      const resultText = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      const noHistory = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      sharedDriver.hilogEnd('testQueryAppKeyState0030');
    });
  });
}
