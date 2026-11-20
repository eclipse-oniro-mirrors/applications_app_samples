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
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function errorRecoveryTest(): void {
  describe('ErrorRecoveryTest', (): void => {

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
    // ==================== 错误恢复验证（25 条） ====================

    /*
     * @tc.number: SUB_ERC_0100
     * @tc.name: testErrorRecovery0001
     * @tc.desc: Verify ErrorRecovery scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0001');
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      testHelper.acquireAccess();
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testErrorRecovery0001');
    });

    /*
     * @tc.number: SUB_ERC_0200
     * @tc.name: testErrorRecovery0002
     * @tc.desc: Verify ErrorRecovery scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0002');
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 5; i++) {
        testHelper.acquireAccess();
      }
      for (let i: number = 0; i < 5; i++) {
        testHelper.releaseAccess();
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0002');
    });

    /*
     * @tc.number: SUB_ERC_0300
     * @tc.name: testErrorRecovery0003
     * @tc.desc: Verify ErrorRecovery scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0003');
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 5; i++) {
        testHelper.releaseAccess();
      }
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      sharedDriver.hilogEnd('testErrorRecovery0003');
    });

    /*
     * @tc.number: SUB_ERC_0400
     * @tc.name: testErrorRecovery0004
     * @tc.desc: Verify ErrorRecovery scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0004');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testErrorRecovery0004');
    });

    /*
     * @tc.number: SUB_ERC_0500
     * @tc.name: testErrorRecovery0005
     * @tc.desc: Verify ErrorRecovery scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0005');
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testErrorRecovery0005');
    });

    /*
     * @tc.number: SUB_ERC_0600
     * @tc.name: testErrorRecovery0006
     * @tc.desc: Verify ErrorRecovery scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0006');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0006');
    });

    /*
     * @tc.number: SUB_ERC_0700
     * @tc.name: testErrorRecovery0007
     * @tc.desc: Verify ErrorRecovery scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0007');
      testHelper.releaseAccess();
      const result: boolean = await testHelper.performAcquireReleaseCycle();
      expect(typeof result).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0007');
    });

    /*
     * @tc.number: SUB_ERC_0800
     * @tc.name: testErrorRecovery0008
     * @tc.desc: Verify ErrorRecovery scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0008');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(testHelper.isValidKeyStatus(snapshot.keyStatus)).assertTrue();
      expect(typeof snapshot.operationResult).assertEqual('string');
      expect(snapshot.historyEmpty).assertTrue();
      sharedDriver.hilogEnd('testErrorRecovery0008');
    });

    /*
     * @tc.number: SUB_ERC_0900
     * @tc.name: testErrorRecovery0009
     * @tc.desc: Verify ErrorRecovery scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0009');
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await testHelper.verifyHistoryLimit();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      sharedDriver.hilogEnd('testErrorRecovery0009');
    });

    /*
     * @tc.number: SUB_ERC_1000
     * @tc.name: testErrorRecovery0010
     * @tc.desc: Verify ErrorRecovery scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0010');
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const symm: boolean = await testHelper.verifyPairingSymmetry();
      expect(symm).assertTrue();
      expect(typeof symm).assertEqual('boolean');
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testErrorRecovery0010');
    });

    /*
     * @tc.number: SUB_ERC_1100
     * @tc.name: testErrorRecovery0011
     * @tc.desc: Verify ErrorRecovery scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0011');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const stable: boolean = await testHelper.waitForStableState(2000);
      expect(stable).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0011');
    });

    /*
     * @tc.number: SUB_ERC_1200
     * @tc.name: testErrorRecovery0012
     * @tc.desc: Verify ErrorRecovery scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0012');
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await extDriver.verifyQueryAllResult();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorRecovery0012');
    });

    /*
     * @tc.number: SUB_ERC_1300
     * @tc.name: testErrorRecovery0013
     * @tc.desc: Verify ErrorRecovery scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0013');
      for (let i: number = 0; i < 3; i++) {
        testHelper.acquireAccess();
        await extDriver.clearHistoryAndWait();
        const counts: PairingCounts = await extDriver.parsePairingCounts();
        expect(counts.acquire).assertEqual(0);
        expect(counts.pending).assertEqual(0);
      }
      sharedDriver.hilogEnd('testErrorRecovery0013');
    });

    /*
     * @tc.number: SUB_ERC_1400
     * @tc.name: testErrorRecovery0014
     * @tc.desc: Verify ErrorRecovery scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0014');
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.fullWorkflowAcquireRelease();
      expect(results.length).assertEqual(2);
      expect(results[0].includes('acquireAccess')).assertTrue();
      expect(results[1].includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testErrorRecovery0014');
    });

    /*
     * @tc.number: SUB_ERC_1500
     * @tc.name: testErrorRecovery0015
     * @tc.desc: Verify ErrorRecovery scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0015');
      await extDriver.clearHistoryAndWait();
      const qExists: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const aExists: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const rExists: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(qExists).assertTrue();
      expect(aExists).assertTrue();
      expect(rExists).assertTrue();
      sharedDriver.hilogEnd('testErrorRecovery0015');
    });

    /*
     * @tc.number: SUB_ERC_1600
     * @tc.name: testErrorRecovery0016
     * @tc.desc: Verify ErrorRecovery scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0016');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testErrorRecovery0016');
    });

    /*
     * @tc.number: SUB_ERC_1700
     * @tc.name: testErrorRecovery0017
     * @tc.desc: Verify ErrorRecovery scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0017');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const noHistExists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistExists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorRecovery0017');
    });

    /*
     * @tc.number: SUB_ERC_1800
     * @tc.name: testErrorRecovery0018
     * @tc.desc: Verify ErrorRecovery scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0018');
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.performMultipleQueries(3);
      expect(results.length).assertEqual(3);
      expect(results[0].includes('queryAppKeyState')).assertTrue();
      expect(typeof results[0]).assertEqual('string');
      sharedDriver.hilogEnd('testErrorRecovery0018');
    });

    /*
     * @tc.number: SUB_ERC_1900
     * @tc.name: testErrorRecovery0019
     * @tc.desc: Verify ErrorRecovery scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0019');
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.performMultipleAcquires(3);
      expect(results.length).assertEqual(3);
      expect(results[0].includes('acquireAccess')).assertTrue();
      expect(typeof results[0]).assertEqual('string');
      sharedDriver.hilogEnd('testErrorRecovery0019');
    });

    /*
     * @tc.number: SUB_ERC_2000
     * @tc.name: testErrorRecovery0020
     * @tc.desc: Verify ErrorRecovery scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0020');
      await extDriver.clearHistoryAndWait();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name: string = testHelper.getKeyStatusName(status);
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testErrorRecovery0020');
    });

    /*
     * @tc.number: SUB_ERC_2100
     * @tc.name: testErrorRecovery0021
     * @tc.desc: Verify ErrorRecovery scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0021');
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await extDriver.verifyHistoryMaxSize();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      sharedDriver.hilogEnd('testErrorRecovery0021');
    });

    /*
     * @tc.number: SUB_ERC_2200
     * @tc.name: testErrorRecovery0022
     * @tc.desc: Verify ErrorRecovery scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0022');
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.getPairingStatusAfterOperations(3, 3);
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0022');
    });

    /*
     * @tc.number: SUB_ERC_2300
     * @tc.name: testErrorRecovery0023
     * @tc.desc: Verify ErrorRecovery scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0023');
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.getPairingStatusAfterOperations(5, 2);
      expect(counts.acquire).assertLarger(counts.release);
      expect(counts.pending).assertLarger(0);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0023');
    });

    /*
     * @tc.number: SUB_ERC_2400
     * @tc.name: testErrorRecovery0024
     * @tc.desc: Verify ErrorRecovery scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0024');
      const result: string = await extDriver.fullWorkflowQuery();
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testErrorRecovery0024');
    });

    /*
     * @tc.number: SUB_ERC_2500
     * @tc.name: testErrorRecovery0025
     * @tc.desc: Verify ErrorRecovery scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorRecovery0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorRecovery0025');
      await extDriver.clearHistoryAndWait();
      await extDriver.fullWorkflowMultipleOps(2, 2, 2);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testErrorRecovery0025');
    });
  });
}
