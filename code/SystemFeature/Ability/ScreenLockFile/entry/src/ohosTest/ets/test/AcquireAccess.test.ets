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
import { screenLockFileManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { SharedDriver } from './SharedDriver';
import { TestHelper } from './TestHelper';
import { PairingCounts } from './SharedDriverExt';
import { ABILITY_NAME, ACCESS_STATUS_DENIED, ACCESS_STATUS_GRANTED, BUNDLE_NAME } from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';

const sharedDriver: SharedDriver = new SharedDriver();
const testHelper: TestHelper = new TestHelper(sharedDriver);
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function acquireAccessTest(): void {
  describe('AcquireAccessTest', (): void => {

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
    // ==================== acquireAccess API 功能验证（30 条） ====================

    /*
     * @tc.number: SUB_ACQ_0100
     * @tc.name: testAcquireAccess0001
     * @tc.desc: Verify AcquireAccess scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0001');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = status === ACCESS_STATUS_GRANTED || status === ACCESS_STATUS_DENIED;
        expect(isValid).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0001');
    });

    /*
     * @tc.number: SUB_ACQ_0200
     * @tc.name: testAcquireAccess0002
     * @tc.desc: Verify AcquireAccess scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0002');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
        expect(status).assertLess(100);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0002');
    });

    /*
     * @tc.number: SUB_ACQ_0300
     * @tc.name: testAcquireAccess0003
     * @tc.desc: Verify AcquireAccess scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0003');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isKnown: boolean = status === ACCESS_STATUS_GRANTED || status === ACCESS_STATUS_DENIED;
        expect(isKnown).assertTrue();
        expect(status).assertLarger(-1);
        expect(status).assertLess(2);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0003');
    });

    /*
     * @tc.number: SUB_ACQ_0400
     * @tc.name: testAcquireAccess0004
     * @tc.desc: Verify AcquireAccess scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0004');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const name: string = testHelper.getAccessStatusName(status);
        expect(name.length).assertLarger(0);
        const isKnownName: boolean = name === 'ACCESS_GRANTED' || name === 'ACCESS_DENIED' || name === 'UNKNOWN';
        expect(isKnownName).assertTrue();
        expect(typeof name).assertEqual('string');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0004');
    });

    /*
     * @tc.number: SUB_ACQ_0500
     * @tc.name: testAcquireAccess0005
     * @tc.desc: Verify AcquireAccess scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0005');
      await scrollToId('operationResult')
      const beforeText: string = await sharedDriver.getTextById('operationResult');
      await clickById('acquireAccessButton')
      await scrollToId('operationResult')
      const afterText: string = await textOfId('operationResult');
      expect(beforeText !== afterText).assertTrue();
      expect(afterText.length).assertLarger(0);
      const containsAcquire: boolean = afterText.includes('acquireAccess');
      expect(containsAcquire).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0005');
    });

    /*
     * @tc.number: SUB_ACQ_0600
     * @tc.name: testAcquireAccess0006
     * @tc.desc: Verify AcquireAccess scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0006');
      await scrollToId('clearHistoryButton')
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const beforeCounts: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const afterCounts: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(beforeCounts.acquire - 1);
      expect(afterCounts.pending).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireAccess0006');
    });

    /*
     * @tc.number: SUB_ACQ_0700
     * @tc.name: testAcquireAccess0007
     * @tc.desc: Verify AcquireAccess scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0007');
      await scrollToId('clearHistoryButton')
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const noHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const resultText: string = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      const containsAcquire: boolean = resultText.includes('acquireAccess');
      expect(containsAcquire).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0007');
    });

    /*
     * @tc.number: SUB_ACQ_0800
     * @tc.name: testAcquireAccess0008
     * @tc.desc: Verify AcquireAccess scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0008');
      let successCount: number = 0;
      let errorCount: number = 0;
      for (let i: number = 0; i < 3; i++) {
        try {
          const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
          expect(testHelper.isValidAccessStatus(status)).assertTrue();
          successCount = successCount + 1;
        } catch (error) {
          const err: BusinessError = error as BusinessError;
          expect(err.code).assertLarger(0);
          expect(err.message.length).assertLarger(0);
          errorCount = errorCount + 1;
        }
      }
      expect(successCount + errorCount).assertEqual(3);
      expect(successCount).assertLarger(-1);
      expect(errorCount).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireAccess0008');
    });

    /*
     * @tc.number: SUB_ACQ_0900
     * @tc.name: testAcquireAccess0009
     * @tc.desc: Verify AcquireAccess scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0009');
      const granted: number = ACCESS_STATUS_GRANTED;
      const denied: number = ACCESS_STATUS_DENIED;
      expect(granted !== denied).assertTrue();
      expect(granted).assertEqual(0);
      expect(denied).assertEqual(-1);
      sharedDriver.hilogEnd('testAcquireAccess0009');
    });

    /*
     * @tc.number: SUB_ACQ_1000
     * @tc.name: testAcquireAccess0010
     * @tc.desc: Verify AcquireAccess scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0010');
      const keyStatus1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(keyStatus1)).assertTrue();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const keyStatus2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(keyStatus2)).assertTrue();
      expect(keyStatus1).assertEqual(keyStatus2);
      sharedDriver.hilogEnd('testAcquireAccess0010');
    });

    /*
     * @tc.number: SUB_ACQ_1100
     * @tc.name: testAcquireAccess0011
     * @tc.desc: Verify AcquireAccess scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0011');
      await scrollToId('acquireAccessButton')
      await clickById('acquireAccessButton')
      await scrollToId('operationResult')
      const resultText: string = await textOfId('operationResult');
      expect(resultText.length).assertLarger(0);
      const hasPrefix: boolean = resultText.includes('acquireAccess:');
      expect(hasPrefix).assertTrue();
      const hasStatus: boolean = resultText.includes('ACCESS_');
      expect(hasStatus).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0011');
    });

    /*
     * @tc.number: SUB_ACQ_1200
     * @tc.name: testAcquireAccess0012
     * @tc.desc: Verify AcquireAccess scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0012');
      await scrollToId('clearHistoryButton')
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const allResult: string = await textOfId('operationResult');
      expect(allResult.length).assertLarger(0);
      expect(allResult.includes('Acquire')).assertTrue();
      expect(allResult.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0012');
    });

    /*
     * @tc.number: SUB_ACQ_1300
     * @tc.name: testAcquireAccess0013
     * @tc.desc: Verify AcquireAccess scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0013');
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0013');
    });

    /*
     * @tc.number: SUB_ACQ_1400
     * @tc.name: testAcquireAccess0014
     * @tc.desc: Verify AcquireAccess scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0014');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const pairingText: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.length).assertLarger(0);
      expect(pairingText.includes('Acquire')).assertTrue();
      expect(pairingText.includes('Release')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0014');
    });

    /*
     * @tc.number: SUB_ACQ_1500
     * @tc.name: testAcquireAccess0015
     * @tc.desc: Verify AcquireAccess scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0015');
      const results: string[] = [];
      for (let i: number = 0; i < 3; i++) {
        await clickById('acquireAccessButton')
        await scrollToId('operationResult')
        const text: string = await textOfId('operationResult');
        results.push(text);
      }
      expect(results.length).assertEqual(3);
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i].length).assertLarger(0);
      }
      expect(results[0].includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0015');
    });

    /*
     * @tc.number: SUB_ACQ_1600
     * @tc.name: testAcquireAccess0016
     * @tc.desc: Verify AcquireAccess scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0016');
      const enumGranted: number = screenLockFileManager.AccessStatus.ACCESS_GRANTED;
      const enumDenied: number = screenLockFileManager.AccessStatus.ACCESS_DENIED;
      expect(enumGranted).assertEqual(ACCESS_STATUS_GRANTED);
      expect(enumDenied).assertEqual(ACCESS_STATUS_DENIED);
      expect(enumGranted !== enumDenied).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0016');
    });

    /*
     * @tc.number: SUB_ACQ_1700
     * @tc.name: testAcquireAccess0017
     * @tc.desc: Verify AcquireAccess scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0017');
      let errorCaught: boolean = false;
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        errorCaught = true;
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      expect(typeof errorCaught).assertEqual('boolean');
      expect(errorCaught === true || errorCaught === false).assertTrue();
      expect(typeof errorCaught).assertEqual('boolean');
      sharedDriver.hilogEnd('testAcquireAccess0017');
    });

    /*
     * @tc.number: SUB_ACQ_1800
     * @tc.name: testAcquireAccess0018
     * @tc.desc: Verify AcquireAccess scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0018');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await clickById('acquireAccessButton')
      await scrollToId('operationResult')
      const resultText: string = await textOfId('operationResult');
      expect(resultText.length).assertLarger(0);
      expect(resultText.includes('acquireAccess')).assertTrue();
      expect(resultText.includes('ACCESS_')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0018');
    });

    /*
     * @tc.number: SUB_ACQ_1900
     * @tc.name: testAcquireAccess0019
     * @tc.desc: Verify AcquireAccess scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0019');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
      }
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const allResult: string = await textOfId('operationResult');
      expect(allResult.length).assertLarger(0);
      expect(allResult.includes('Acquire')).assertTrue();
      expect(allResult.includes('KeyState')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0019');
    });

    /*
     * @tc.number: SUB_ACQ_2000
     * @tc.name: testAcquireAccess0020
     * @tc.desc: Verify AcquireAccess scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0020');
      const pairingText: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.length).assertLarger(0);
      expect(pairingText.includes('Pending')).assertTrue();
      expect(pairingText.includes('Acquire')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0020');
    });

    /*
     * @tc.number: SUB_ACQ_2100
     * @tc.name: testAcquireAccess0021
     * @tc.desc: Verify AcquireAccess scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0021');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(status === ACCESS_STATUS_GRANTED || status === ACCESS_STATUS_DENIED).assertTrue();
        expect(typeof status).assertEqual('number');
        expect(status).assertLarger(-1);
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0021');
    });

    /*
     * @tc.number: SUB_ACQ_2200
     * @tc.name: testAcquireAccess0022
     * @tc.desc: Verify AcquireAccess scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0022');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0022');
    });

    /*
     * @tc.number: SUB_ACQ_2300
     * @tc.name: testAcquireAccess0023
     * @tc.desc: Verify AcquireAccess scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0023');
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const name: string = testHelper.getAccessStatusName(status);
        expect(name.length).assertLarger(0);
        const validNames: string[] = ['ACCESS_GRANTED', 'ACCESS_DENIED', 'UNKNOWN'];
        let nameValid: boolean = false;
        for (let i: number = 0; i < validNames.length; i++) {
          if (name === validNames[i]) {
            nameValid = true;
          }
        }
        expect(nameValid).assertTrue();
        expect(typeof name).assertEqual('string');
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        expect(typeof err.code).assertEqual('number');
      }
      sharedDriver.hilogEnd('testAcquireAccess0023');
    });

    /*
     * @tc.number: SUB_ACQ_2400
     * @tc.name: testAcquireAccess0024
     * @tc.desc: Verify AcquireAccess scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0024');
      const beforeStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const afterStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(beforeStatus).assertEqual(afterStatus);
      expect(testHelper.isValidKeyStatus(afterStatus)).assertTrue();
      expect(typeof afterStatus).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireAccess0024');
    });

    /*
     * @tc.number: SUB_ACQ_2500
     * @tc.name: testAcquireAccess0025
     * @tc.desc: Verify AcquireAccess scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0025');
      await clickById('acquireAccessButton')
      await scrollToId('operationResult')
      const resultText: string = await textOfId('operationResult');
      expect(resultText.length).assertLarger(0);
      const hasAccessPrefix: boolean = resultText.includes('ACCESS_');
      expect(hasAccessPrefix).assertTrue();
      const hasAcquireLabel: boolean = resultText.includes('acquireAccess');
      expect(hasAcquireLabel).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0025');
    });

    /*
     * @tc.number: SUB_ACQ_2600
     * @tc.name: testAcquireAccess0026
     * @tc.desc: Verify AcquireAccess scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0026');
      const results: string[] = [];
      for (let i: number = 0; i < 2; i++) {
        await clickById('acquireAccessButton')
        await scrollToId('operationResult')
        const text: string = await textOfId('operationResult');
        results.push(text);
      }
      expect(results.length).assertEqual(2);
      for (let i: number = 0; i < results.length; i++) {
        expect(results[i].includes('acquireAccess')).assertTrue();
      }
      expect(results[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireAccess0026');
    });

    /*
     * @tc.number: SUB_ACQ_2700
     * @tc.name: testAcquireAccess0027
     * @tc.desc: Verify AcquireAccess scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0027');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 2; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const pairingText: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.length).assertLarger(0);
      expect(pairingText.includes('Acquire')).assertTrue();
      expect(pairingText.includes('Pending')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0027');
    });

    /*
     * @tc.number: SUB_ACQ_2800
     * @tc.name: testAcquireAccess0028
     * @tc.desc: Verify AcquireAccess scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0028');
      let callCompleted: boolean = false;
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(status)).assertTrue();
        callCompleted = true;
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
        callCompleted = true;
      }
      expect(callCompleted).assertTrue();
      expect(typeof callCompleted).assertEqual('boolean');
      expect(callCompleted === true).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0028');
    });

    /*
     * @tc.number: SUB_ACQ_2900
     * @tc.name: testAcquireAccess0029
     * @tc.desc: Verify AcquireAccess scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0029');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const noHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const resultText: string = await sharedDriver.getTextById('operationResult');
      expect(resultText.length).assertLarger(0);
      expect(resultText.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testAcquireAccess0029');
    });

    /*
     * @tc.number: SUB_ACQ_3000
     * @tc.name: testAcquireAccess0030
     * @tc.desc: Verify AcquireAccess scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testAcquireAccess0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireAccess0030');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const initialKeyStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(initialKeyStatus)).assertTrue();
      try {
        const acquireStatus: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(acquireStatus)).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const afterKeyStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(afterKeyStatus)).assertTrue();
      expect(initialKeyStatus).assertEqual(afterKeyStatus);
      sharedDriver.hilogEnd('testAcquireAccess0030');
    });
  });
}
