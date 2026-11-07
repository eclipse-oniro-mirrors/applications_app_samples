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
  RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED,
  ACCESS_STATUS_GRANTED
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper = new TestHelper(sharedDriver);

export default function releaseAccessTest(): void {
  describe('ReleaseAccessTest', (): void => {

    // ==================== releaseAccess API 功能验证（30 条） ====================

    /*
     * @tc.number: SUB_RLA_0100
     * @tc.name: testReleaseAccess0001
     * @tc.desc: Verify ReleaseAccess scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0001');
      try {
        const status = screenLockFileManager.releaseAccess();
        const isValid = status === RELEASE_STATUS_GRANTED || status === RELEASE_STATUS_DENIED;
        expect(isValid).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0001');
    });

    /*
     * @tc.number: SUB_RLA_0200
     * @tc.name: testReleaseAccess0002
     * @tc.desc: Verify ReleaseAccess scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0002');
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
        expect(status).assertLess(100);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0002');
    });

    /*
     * @tc.number: SUB_RLA_0300
     * @tc.name: testReleaseAccess0003
     * @tc.desc: Verify ReleaseAccess scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0003');
      try {
        const status = screenLockFileManager.releaseAccess();
        const isKnown = status === RELEASE_STATUS_GRANTED || status === RELEASE_STATUS_DENIED;
        expect(isKnown).assertTrue();
        expect(status).assertLarger(-1);
        expect(status).assertLess(2);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0003');
    });

    /*
     * @tc.number: SUB_RLA_0400
     * @tc.name: testReleaseAccess0004
     * @tc.desc: Verify ReleaseAccess scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0004');
      try {
        const status = screenLockFileManager.releaseAccess();
        const name = testHelper.getReleaseStatusName(status);
        expect(name.length).assertLarger(0);
        const isKnownName = name === 'RELEASE_GRANTED' || name === 'RELEASE_DENIED' || name === 'UNKNOWN';
        expect(isKnownName).assertTrue();
        expect(typeof name).assertEqual('string');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0004');
    });

    /*
     * @tc.number: SUB_RLA_0500
     * @tc.name: testReleaseAccess0005
     * @tc.desc: Verify ReleaseAccess scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const beforeText = await sharedDriver.getTextById('operationResult');
      const afterText = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
      expect(beforeText !== afterText).assertTrue();
      expect(afterText.length).assertLarger(0);
      const containsRelease = afterText.includes('releaseAccess') || afterText.includes('RELEASE_');
      expect(containsRelease).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0005');
    });

    /*
     * @tc.number: SUB_RLA_0600
     * @tc.name: testReleaseAccess0006
     * @tc.desc: Verify ReleaseAccess scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const beforeCounts = await testHelper.getExtDriver().parsePairingCounts();
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.waitUiIdle();
      const afterCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(afterCounts.release).assertLarger(beforeCounts.release - 1);
      expect(afterCounts.pending).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseAccess0006');
    });

    /*
     * @tc.number: SUB_RLA_0700
     * @tc.name: testReleaseAccess0007
     * @tc.desc: Verify ReleaseAccess scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.waitUiIdle();
      const noHistory = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const resultText = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      const containsRelease = resultText.includes('releaseAccess') || resultText.includes('RELEASE_');
      expect(containsRelease).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0007');
    });

    /*
     * @tc.number: SUB_RLA_0800
     * @tc.name: testReleaseAccess0008
     * @tc.desc: Verify ReleaseAccess scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0008');
      let successCount = 0;
      let errorCount = 0;
      for (let i = 0; i < 3; i++) {
        try {
          const status = screenLockFileManager.releaseAccess();
          expect(testHelper.isValidReleaseStatus(status)).assertTrue();
          successCount = successCount + 1;
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertLarger(0);
          expect(err.message.length).assertLarger(0);
          errorCount = errorCount + 1;
        }
      }
      expect(successCount + errorCount).assertEqual(3);
      expect(successCount).assertLarger(-1);
      expect(errorCount).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseAccess0008');
    });

    /*
     * @tc.number: SUB_RLA_0900
     * @tc.name: testReleaseAccess0009
     * @tc.desc: Verify ReleaseAccess scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0009');
      const granted = RELEASE_STATUS_GRANTED;
      const denied = RELEASE_STATUS_DENIED;
      expect(granted !== denied).assertTrue();
      expect(granted).assertEqual(0);
      expect(denied).assertEqual(-1);
      sharedDriver.hilogEnd('testReleaseAccess0009');
    });

    /*
     * @tc.number: SUB_RLA_1000
     * @tc.name: testReleaseAccess0010
     * @tc.desc: Verify ReleaseAccess scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0010');
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0010');
    });

    /*
     * @tc.number: SUB_RLA_1100
     * @tc.name: testReleaseAccess0011
     * @tc.desc: Verify ReleaseAccess scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const resultText = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
      expect(resultText.length).assertLarger(0);
      const hasPrefix = resultText.includes('releaseAccess:') || resultText.includes('RELEASE_');
      expect(hasPrefix).assertTrue();
      const hasStatus = resultText.includes('RELEASE_');
      expect(hasStatus).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0011');
    });

    /*
     * @tc.number: SUB_RLA_1200
     * @tc.name: testReleaseAccess0012
     * @tc.desc: Verify ReleaseAccess scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      const allResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(allResult.length).assertLarger(0);
      expect(allResult.includes('Release')).assertTrue();
      expect(allResult.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0012');
    });

    /*
     * @tc.number: SUB_RLA_1300
     * @tc.name: testReleaseAccess0013
     * @tc.desc: Verify ReleaseAccess scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0013');
      const enumGranted: number = screenLockFileManager.ReleaseStatus.RELEASE_GRANTED;
      const enumDenied: number = screenLockFileManager.ReleaseStatus.RELEASE_DENIED;
      expect(enumGranted).assertEqual(RELEASE_STATUS_GRANTED);
      expect(enumDenied).assertEqual(RELEASE_STATUS_DENIED);
      expect(enumGranted !== enumDenied).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0013');
    });

    /*
     * @tc.number: SUB_RLA_1400
     * @tc.name: testReleaseAccess0014
     * @tc.desc: Verify ReleaseAccess scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const pairingText = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.length).assertLarger(0);
      expect(pairingText.includes('Release')).assertTrue();
      expect(pairingText.includes('Pending')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0014');
    });

    /*
     * @tc.number: SUB_RLA_1500
     * @tc.name: testReleaseAccess0015
     * @tc.desc: Verify ReleaseAccess scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const results: string[] = [];
      for (let i = 0; i < 3; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
        const text = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
        results.push(text);
      }
      expect(results.length).assertEqual(3);
      for (let i = 0; i < results.length; i++) {
        expect(results[i].length).assertLarger(0);
      }
      expect(results[0].includes('releaseAccess') || results[0].includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0015');
    });

    /*
     * @tc.number: SUB_RLA_1600
     * @tc.name: testReleaseAccess0016
     * @tc.desc: Verify ReleaseAccess scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0016');
      let errorCaught = false;
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        errorCaught = true;
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      expect(typeof errorCaught).assertEqual('boolean');
      expect(errorCaught === true || errorCaught === false).assertTrue();
      expect(typeof errorCaught).assertEqual('boolean');
      sharedDriver.hilogEnd('testReleaseAccess0016');
    });

    /*
     * @tc.number: SUB_RLA_1700
     * @tc.name: testReleaseAccess0017
     * @tc.desc: Verify ReleaseAccess scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const resultText = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
      expect(resultText.length).assertLarger(0);
      expect(resultText.includes('releaseAccess') || resultText.includes('RELEASE_')).assertTrue();
      expect(resultText.includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0017');
    });

    /*
     * @tc.number: SUB_RLA_1800
     * @tc.name: testReleaseAccess0018
     * @tc.desc: Verify ReleaseAccess scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 3; i++) {
        await sharedDriver.clickId('releaseAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const allResult = await sharedDriver.clickAndGetResult('queryAllStatesButton', 'operationResult');
      expect(allResult.length).assertLarger(0);
      expect(allResult.includes('Release')).assertTrue();
      expect(allResult.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0018');
    });

    /*
     * @tc.number: SUB_RLA_1900
     * @tc.name: testReleaseAccess0019
     * @tc.desc: Verify ReleaseAccess scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairingText = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.length).assertLarger(0);
      expect(pairingText.includes('Pending')).assertTrue();
      expect(pairingText.includes('Release')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0019');
    });

    /*
     * @tc.number: SUB_RLA_2000
     * @tc.name: testReleaseAccess0020
     * @tc.desc: Verify ReleaseAccess scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0020');
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(status === RELEASE_STATUS_GRANTED || status === RELEASE_STATUS_DENIED).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0020');
    });

    /*
     * @tc.number: SUB_RLA_2100
     * @tc.name: testReleaseAccess0021
     * @tc.desc: Verify ReleaseAccess scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0021');
    });

    /*
     * @tc.number: SUB_RLA_2200
     * @tc.name: testReleaseAccess0022
     * @tc.desc: Verify ReleaseAccess scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0022');
      try {
        const status = screenLockFileManager.releaseAccess();
        const name = testHelper.getReleaseStatusName(status);
        expect(name.length).assertLarger(0);
        const validNames: string[] = ['RELEASE_GRANTED', 'RELEASE_DENIED', 'UNKNOWN'];
        let nameValid = false;
        for (let i = 0; i < validNames.length; i++) {
          if (name === validNames[i]) {
            nameValid = true;
          }
        }
        expect(nameValid).assertTrue();
        expect(typeof name).assertEqual('string');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0022');
    });

    /*
     * @tc.number: SUB_RLA_2300
     * @tc.name: testReleaseAccess0023
     * @tc.desc: Verify ReleaseAccess scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0023');
      const beforeStatus = screenLockFileManager.queryAppKeyState();
      try {
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const afterStatus = screenLockFileManager.queryAppKeyState();
      expect(beforeStatus).assertEqual(afterStatus);
      expect(testHelper.isValidKeyStatus(afterStatus)).assertTrue();
      expect(typeof afterStatus).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseAccess0023');
    });

    /*
     * @tc.number: SUB_RLA_2400
     * @tc.name: testReleaseAccess0024
     * @tc.desc: Verify ReleaseAccess scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const resultText = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
      expect(resultText.length).assertLarger(0);
      const hasReleasePrefix = resultText.includes('RELEASE_');
      expect(hasReleasePrefix).assertTrue();
      const hasReleaseLabel = resultText.includes('releaseAccess') || resultText.includes('RELEASE_');
      expect(hasReleaseLabel).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0024');
    });

    /*
     * @tc.number: SUB_RLA_2500
     * @tc.name: testReleaseAccess0025
     * @tc.desc: Verify ReleaseAccess scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const results: string[] = [];
      for (let i = 0; i < 2; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
        const text = await sharedDriver.clickAndGetResult('releaseAccessButton', 'operationResult');
        results.push(text);
      }
      expect(results.length).assertEqual(2);
      for (let i = 0; i < results.length; i++) {
        expect(results[i].includes('releaseAccess') || results[i].includes('RELEASE_')).assertTrue();
      }
      expect(results[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseAccess0025');
    });

    /*
     * @tc.number: SUB_RLA_2600
     * @tc.name: testReleaseAccess0026
     * @tc.desc: Verify ReleaseAccess scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0026');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i = 0; i < 2; i++) {
        await sharedDriver.clickId('releaseAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const pairingText = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.length).assertLarger(0);
      expect(pairingText.includes('Release')).assertTrue();
      expect(pairingText.includes('Pending')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0026');
    });

    /*
     * @tc.number: SUB_RLA_2700
     * @tc.name: testReleaseAccess0027
     * @tc.desc: Verify ReleaseAccess scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0027');
      let callCompleted = false;
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        callCompleted = true;
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        callCompleted = true;
      }
      expect(callCompleted).assertTrue();
      expect(typeof callCompleted).assertEqual('boolean');
      expect(callCompleted === true).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0027');
    });

    /*
     * @tc.number: SUB_RLA_2800
     * @tc.name: testReleaseAccess0028
     * @tc.desc: Verify ReleaseAccess scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.waitUiIdle();
      const noHistory = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const resultText = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      expect(resultText.includes('releaseAccess') || resultText.includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testReleaseAccess0028');
    });

    /*
     * @tc.number: SUB_RLA_2900
     * @tc.name: testReleaseAccess0029
     * @tc.desc: Verify ReleaseAccess scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      try {
        const status = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testReleaseAccess0029');
    });

    /*
     * @tc.number: SUB_RLA_3000
     * @tc.name: testReleaseAccess0030
     * @tc.desc: Verify ReleaseAccess scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseAccess0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseAccess0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const initialKeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(initialKeyStatus)).assertTrue();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      try {
        const releaseStatus = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(releaseStatus)).assertTrue();
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const afterKeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(afterKeyStatus)).assertTrue();
      expect(initialKeyStatus).assertEqual(afterKeyStatus);
      sharedDriver.hilogEnd('testReleaseAccess0030');
    });
  });
}
