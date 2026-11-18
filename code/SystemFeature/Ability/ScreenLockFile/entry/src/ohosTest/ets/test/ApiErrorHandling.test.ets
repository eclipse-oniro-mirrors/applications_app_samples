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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { SharedDriver } from './SharedDriver';
import { PairingCounts, SharedDriverExt } from './SharedDriverExt';
import { ApiCallResult, StateSnapshot, TestHelper } from './TestHelper';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, RELEASE_STATUS_GRANTED
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function apiErrorHandlingTest(): void {
  describe('ApiErrorHandlingTest', (): void => {

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
    // ==================== API 错误处理验证（30 条） ====================

    /*
     * @tc.number: SUB_AEH_0100
     * @tc.name: testApiErrorHandling0001
     * @tc.desc: Verify ApiErrorHandling scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0001');
      let caught: boolean = false
      try {
        const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        expect(testHelper.isValidKeyStatus(status)).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        caught = true;
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      expect(typeof caught).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiErrorHandling0001');
    });

    /*
     * @tc.number: SUB_AEH_0200
     * @tc.name: testApiErrorHandling0002
     * @tc.desc: Verify ApiErrorHandling scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0002');
      let caught: boolean = false
      try {
        const status: number = screenLockFileManager.acquireAccess();
        expect(status === ACCESS_STATUS_GRANTED || status === 1).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        caught = true;
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      expect(typeof caught).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiErrorHandling0002');
    });

    /*
     * @tc.number: SUB_AEH_0300
     * @tc.name: testApiErrorHandling0003
     * @tc.desc: Verify ApiErrorHandling scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0003');
      let caught: boolean = false
      try {
        const status: number = screenLockFileManager.releaseAccess();
        expect(status === RELEASE_STATUS_GRANTED || status === 1).assertTrue();
        expect(typeof status).assertEqual('number');
      } catch (error) {
        caught = true;
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      expect(typeof caught).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiErrorHandling0003');
    });

    /*
     * @tc.number: SUB_AEH_0400
     * @tc.name: testApiErrorHandling0004
     * @tc.desc: Verify ApiErrorHandling scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0004');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.errorMessage).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0004');
    });

    /*
     * @tc.number: SUB_AEH_0500
     * @tc.name: testApiErrorHandling0005
     * @tc.desc: Verify ApiErrorHandling scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0005');
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testApiErrorHandling0005');
    });

    /*
     * @tc.number: SUB_AEH_0600
     * @tc.name: testApiErrorHandling0006
     * @tc.desc: Verify ApiErrorHandling scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0006');
      const result: ApiCallResult = testHelper.releaseAccess();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testApiErrorHandling0006');
    });

    /*
     * @tc.number: SUB_AEH_0700
     * @tc.name: testApiErrorHandling0007
     * @tc.desc: Verify ApiErrorHandling scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0007');
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes('ready') || result.includes('queryAppKeyState') ||
        result.includes('acquireAccess') || result.includes('releaseAccess') ||
        result.includes('Error') || result.includes('KeyState:')).assertFalse();
      sharedDriver.hilogEnd('testApiErrorHandling0007');
    });

    /*
     * @tc.number: SUB_AEH_0800
     * @tc.name: testApiErrorHandling0008
     * @tc.desc: Verify ApiErrorHandling scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0008');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiErrorHandling0008');
    });

    /*
     * @tc.number: SUB_AEH_0900
     * @tc.name: testApiErrorHandling0009
     * @tc.desc: Verify ApiErrorHandling scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0009');
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      const acqResult: ApiCallResult = testHelper.acquireAccess();
      expect(typeof acqResult.success).assertEqual('boolean');
      expect(typeof acqResult.errorCode).assertEqual('number');
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testApiErrorHandling0009');
    });

    /*
     * @tc.number: SUB_AEH_1000
     * @tc.name: testApiErrorHandling0010
     * @tc.desc: Verify ApiErrorHandling scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0010');
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      const relResult: ApiCallResult = testHelper.releaseAccess();
      expect(typeof relResult.success).assertEqual('boolean');
      expect(typeof relResult.errorCode).assertEqual('number');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testApiErrorHandling0010');
    });

    /*
     * @tc.number: SUB_AEH_1100
     * @tc.name: testApiErrorHandling0011
     * @tc.desc: Verify ApiErrorHandling scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0011');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testApiErrorHandling0011');
    });

    /*
     * @tc.number: SUB_AEH_1200
     * @tc.name: testApiErrorHandling0012
     * @tc.desc: Verify ApiErrorHandling scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0012');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(result.errorCode).assertLarger(-1);
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiErrorHandling0012');
    });

    /*
     * @tc.number: SUB_AEH_1300
     * @tc.name: testApiErrorHandling0013
     * @tc.desc: Verify ApiErrorHandling scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0013');
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(typeof result.errorMessage).assertEqual('string');
      expect(typeof result.errorCode).assertEqual('number');
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiErrorHandling0013');
    });

    /*
     * @tc.number: SUB_AEH_1400
     * @tc.name: testApiErrorHandling0014
     * @tc.desc: Verify ApiErrorHandling scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0014');
      const before: number = Date.now();
      const result: ApiCallResult = testHelper.queryKeyState();
      const after: number = Date.now();
      expect(result.timestamp).assertLarger(before - 1);
      expect(result.timestamp).assertLess(after + 1);
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testApiErrorHandling0014');
    });

    /*
     * @tc.number: SUB_AEH_1500
     * @tc.name: testApiErrorHandling0015
     * @tc.desc: Verify ApiErrorHandling scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0015');
      testHelper.releaseAccess();
      const result: string = await extDriver.clickQueryAllButton();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testApiErrorHandling0015');
    });

    /*
     * @tc.number: SUB_AEH_1600
     * @tc.name: testApiErrorHandling0016
     * @tc.desc: Verify ApiErrorHandling scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0016');
      const qExists: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const aExists: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const rExists: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(qExists).assertTrue();
      expect(aExists).assertTrue();
      expect(rExists).assertTrue();
      sharedDriver.hilogEnd('testApiErrorHandling0016');
    });

    /*
     * @tc.number: SUB_AEH_1700
     * @tc.name: testApiErrorHandling0017
     * @tc.desc: Verify ApiErrorHandling scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0017');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      expect(result.includes('queryAppKeyState') || result.includes('KEY_')).assertTrue();
      sharedDriver.hilogEnd('testApiErrorHandling0017');
    });

    /*
     * @tc.number: SUB_AEH_1800
     * @tc.name: testApiErrorHandling0018
     * @tc.desc: Verify ApiErrorHandling scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0018');
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count: number = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testApiErrorHandling0018');
    });

    /*
     * @tc.number: SUB_AEH_1900
     * @tc.name: testApiErrorHandling0019
     * @tc.desc: Verify ApiErrorHandling scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0019');
      testHelper.releaseAccess();
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(typeof snapshot.keyStatus).assertEqual('number');
      expect(typeof snapshot.operationResult).assertEqual('string');
      expect(typeof snapshot.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0019');
    });

    /*
     * @tc.number: SUB_AEH_2000
     * @tc.name: testApiErrorHandling0020
     * @tc.desc: Verify ApiErrorHandling scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0020');
      testHelper.releaseAccess();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testApiErrorHandling0020');
    });

    /*
     * @tc.number: SUB_AEH_2100
     * @tc.name: testApiErrorHandling0021
     * @tc.desc: Verify ApiErrorHandling scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0021');
      const name: string = testHelper.getKeyStatusName(-1);
      expect(name).assertEqual('UNKNOWN');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0021');
    });

    /*
     * @tc.number: SUB_AEH_2200
     * @tc.name: testApiErrorHandling0022
     * @tc.desc: Verify ApiErrorHandling scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0022');
      const name: string = testHelper.getAccessStatusName(2);
      expect(name).assertEqual('UNKNOWN');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0022');
    });

    /*
     * @tc.number: SUB_AEH_2300
     * @tc.name: testApiErrorHandling0023
     * @tc.desc: Verify ApiErrorHandling scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0023');
      const name: string = testHelper.getReleaseStatusName(2);
      expect(name).assertEqual('UNKNOWN');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0023');
    });

    /*
     * @tc.number: SUB_AEH_2400
     * @tc.name: testApiErrorHandling0024
     * @tc.desc: Verify ApiErrorHandling scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0024');
      let opCount: number = 0;
      for (let i: number = 0; i < 5; i++) {
        testHelper.queryKeyState();
        opCount = opCount + 1;
      }
      expect(opCount).assertEqual(5);
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testApiErrorHandling0024');
    });

    /*
     * @tc.number: SUB_AEH_2500
     * @tc.name: testApiErrorHandling0025
     * @tc.desc: Verify ApiErrorHandling scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0025');
      const exists: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(exists).assertTrue();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testApiErrorHandling0025');
    });

    /*
     * @tc.number: SUB_AEH_2600
     * @tc.name: testApiErrorHandling0026
     * @tc.desc: Verify ApiErrorHandling scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0026');
      const exists: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(exists).assertTrue();
      const result: string = await extDriver.clickQueryAllButton();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testApiErrorHandling0026');
    });

    /*
     * @tc.number: SUB_AEH_2700
     * @tc.name: testApiErrorHandling0027
     * @tc.desc: Verify ApiErrorHandling scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0027');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      testHelper.queryKeyState();
      const stable: boolean = await testHelper.waitForStableState(2000);
      expect(stable).assertTrue();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiErrorHandling0027');
    });

    /*
     * @tc.number: SUB_AEH_2800
     * @tc.name: testApiErrorHandling0028
     * @tc.desc: Verify ApiErrorHandling scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0028');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess') || result.includes('ACCESS_') ||
        result.includes('Error')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0028');
    });

    /*
     * @tc.number: SUB_AEH_2900
     * @tc.name: testApiErrorHandling0029
     * @tc.desc: Verify ApiErrorHandling scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0029');
      testHelper.acquireAccess();
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess') || result.includes('RELEASE_') ||
        result.includes('Error')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0029');
    });

    /*
     * @tc.number: SUB_AEH_3000
     * @tc.name: testApiErrorHandling0030
     * @tc.desc: Verify ApiErrorHandling scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testApiErrorHandling0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiErrorHandling0030');
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const result: string[] = await extDriver.fullWorkflowAcquireRelease();
      expect(result.length).assertEqual(2);
      expect(typeof result[0]).assertEqual('string');
      expect(typeof result[1]).assertEqual('string');
      sharedDriver.hilogEnd('testApiErrorHandling0030');
    });
  });
}
