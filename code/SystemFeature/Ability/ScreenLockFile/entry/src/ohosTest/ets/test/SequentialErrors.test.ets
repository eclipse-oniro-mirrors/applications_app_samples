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
import { BusinessError } from '@kit.BasicServicesKit';
import { SharedDriver } from './SharedDriver';
import { PairingCounts, SharedDriverExt } from './SharedDriverExt';
import { ApiCallResult, StateSnapshot, TestHelper } from './TestHelper';
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

export default function sequentialErrorsTest(): void {
  describe('SequentialErrorsTest', (): void => {

    // ==================== 连续错误验证（25 条） ====================

    /*
     * @tc.number: SUB_SQE_0100
     * @tc.name: testSequentialErrors0001
     * @tc.desc: Verify SequentialErrors scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const results: string[] = await extDriver.performMultipleQueries(3);
      expect(results.length).assertEqual(3);
      expect(results[0].includes('queryAppKeyState')).assertTrue();
      expect(typeof results[0]).assertEqual('string');
      sharedDriver.hilogEnd('testSequentialErrors0001');
    });

    /*
     * @tc.number: SUB_SQE_0200
     * @tc.name: testSequentialErrors0002
     * @tc.desc: Verify SequentialErrors scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.performMultipleAcquires(3);
      expect(results.length).assertEqual(3);
      expect(results[0].includes('acquireAccess')).assertTrue();
      expect(typeof results[0]).assertEqual('string');
      sharedDriver.hilogEnd('testSequentialErrors0002');
    });

    /*
     * @tc.number: SUB_SQE_0300
     * @tc.name: testSequentialErrors0003
     * @tc.desc: Verify SequentialErrors scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      const results: string[] = await extDriver.performMultipleReleases(3);
      expect(results.length).assertEqual(3);
      expect(typeof results[0]).assertEqual('string');
      expect(results[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testSequentialErrors0003');
    });

    /*
     * @tc.number: SUB_SQE_0400
     * @tc.name: testSequentialErrors0004
     * @tc.desc: Verify SequentialErrors scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const qResult: string = await extDriver.clickQueryButton();
      expect(qResult.includes('queryAppKeyState')).assertTrue();
      const aResult: string = await extDriver.clickAcquireButton();
      expect(aResult.includes('acquireAccess')).assertTrue();
      const rResult: string = await extDriver.clickReleaseButton();
      expect(rResult.includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testSequentialErrors0004');
    });

    /*
     * @tc.number: SUB_SQE_0500
     * @tc.name: testSequentialErrors0005
     * @tc.desc: Verify SequentialErrors scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testSequentialErrors0005');
    });

    /*
     * @tc.number: SUB_SQE_0600
     * @tc.name: testSequentialErrors0006
     * @tc.desc: Verify SequentialErrors scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0006');
      for (let i: number = 0; i < 3; i++) {
        testHelper.releaseAccess();
        const result: ApiCallResult = testHelper.queryKeyState();
        expect(typeof result.success).assertEqual('boolean');
      }
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0006');
    });

    /*
     * @tc.number: SUB_SQE_0700
     * @tc.name: testSequentialErrors0007
     * @tc.desc: Verify SequentialErrors scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        testHelper.acquireAccess();
        testHelper.releaseAccess();
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0007');
    });

    /*
     * @tc.number: SUB_SQE_0800
     * @tc.name: testSequentialErrors0008
     * @tc.desc: Verify SequentialErrors scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0008');
      const statuses: number[] = [];
      for (let i: number = 0; i < 5; i++) {
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        statuses.push(s);
        expect(testHelper.isValidKeyStatus(s)).assertTrue();
      }
      expect(statuses.length).assertEqual(5);
      expect(typeof statuses[0]).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0008');
    });

    /*
     * @tc.number: SUB_SQE_0900
     * @tc.name: testSequentialErrors0009
     * @tc.desc: Verify SequentialErrors scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const c1: number = await extDriver.getHistoryEntryCount();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const c2: number = await extDriver.getHistoryEntryCount();
      expect(c2).assertLarger(c1 - 1);
      expect(c1).assertLarger(0);
      expect(typeof c2).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0009');
    });

    /*
     * @tc.number: SUB_SQE_1000
     * @tc.name: testSequentialErrors0010
     * @tc.desc: Verify SequentialErrors scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(counts.release).assertLarger(0);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0010');
    });

    /*
     * @tc.number: SUB_SQE_1100
     * @tc.name: testSequentialErrors0011
     * @tc.desc: Verify SequentialErrors scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0011');
      const r1: ApiCallResult = testHelper.queryKeyState();
      const r2: ApiCallResult = testHelper.queryKeyState();
      expect(r1.errorCode).assertEqual(r2.errorCode);
      expect(typeof r1.errorCode).assertEqual('number');
      expect(typeof r2.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0011');
    });

    /*
     * @tc.number: SUB_SQE_1200
     * @tc.name: testSequentialErrors0012
     * @tc.desc: Verify SequentialErrors scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0012');
      const r1: ApiCallResult = testHelper.queryKeyState();
      const r2: ApiCallResult = testHelper.acquireAccess();
      const r3: ApiCallResult = testHelper.releaseAccess();
      expect(r2.timestamp).assertLarger(r1.timestamp - 1);
      expect(r3.timestamp).assertLarger(r2.timestamp - 1);
      expect(typeof r3.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0012');
    });

    /*
     * @tc.number: SUB_SQE_1300
     * @tc.name: testSequentialErrors0013
     * @tc.desc: Verify SequentialErrors scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r2: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r2.includes('queryAppKeyState')).assertTrue();
      expect(r2.length).assertLarger(0);
      sharedDriver.hilogEnd('testSequentialErrors0013');
    });

    /*
     * @tc.number: SUB_SQE_1400
     * @tc.name: testSequentialErrors0014
     * @tc.desc: Verify SequentialErrors scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(counts.release).assertLarger(0);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0014');
    });

    /*
     * @tc.number: SUB_SQE_1500
     * @tc.name: testSequentialErrors0015
     * @tc.desc: Verify SequentialErrors scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const s1: StateSnapshot = await testHelper.captureStateSnapshot();
      const s2: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(s1.keyStatus).assertEqual(s2.keyStatus);
      expect(typeof s1.operationResult).assertEqual('string');
      expect(typeof s2.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testSequentialErrors0015');
    });

    /*
     * @tc.number: SUB_SQE_1600
     * @tc.name: testSequentialErrors0016
     * @tc.desc: Verify SequentialErrors scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const result: string = await extDriver.clickQueryAllButton();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testSequentialErrors0016');
    });

    /*
     * @tc.number: SUB_SQE_1700
     * @tc.name: testSequentialErrors0017
     * @tc.desc: Verify SequentialErrors scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const valid: boolean = await extDriver.verifyQueryAllResult();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      sharedDriver.hilogEnd('testSequentialErrors0017');
    });

    /*
     * @tc.number: SUB_SQE_1800
     * @tc.name: testSequentialErrors0018
     * @tc.desc: Verify SequentialErrors scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.fullWorkflowAcquireRelease();
      expect(results.length).assertEqual(2);
      expect(results[0].includes('acquireAccess')).assertTrue();
      expect(results[1].includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testSequentialErrors0018');
    });

    /*
     * @tc.number: SUB_SQE_1900
     * @tc.name: testSequentialErrors0019
     * @tc.desc: Verify SequentialErrors scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.fullWorkflowMultipleOps(2, 3, 3);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0019');
    });

    /*
     * @tc.number: SUB_SQE_2000
     * @tc.name: testSequentialErrors0020
     * @tc.desc: Verify SequentialErrors scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.getPairingStatusAfterOperations(3, 3);
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0020');
    });

    /*
     * @tc.number: SUB_SQE_2100
     * @tc.name: testSequentialErrors0021
     * @tc.desc: Verify SequentialErrors scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.getPairingStatusAfterOperations(5, 2);
      expect(counts.acquire).assertLarger(counts.release);
      expect(counts.pending).assertLarger(0);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0021');
    });

    /*
     * @tc.number: SUB_SQE_2200
     * @tc.name: testSequentialErrors0022
     * @tc.desc: Verify SequentialErrors scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      testHelper.queryKeyState();
      const stable: boolean = await testHelper.waitForStableState(2000);
      expect(stable).assertTrue();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      sharedDriver.hilogEnd('testSequentialErrors0022');
    });

    /*
     * @tc.number: SUB_SQE_2300
     * @tc.name: testSequentialErrors0023
     * @tc.desc: Verify SequentialErrors scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count: number = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0023');
    });

    /*
     * @tc.number: SUB_SQE_2400
     * @tc.name: testSequentialErrors0024
     * @tc.desc: Verify SequentialErrors scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0024');
      const names: string[] = [];
      for (let i: number = 0; i < 3; i++) {
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        names.push(testHelper.getKeyStatusName(s));
      }
      expect(names[0]).assertEqual(names[2]);
      expect(names.length).assertEqual(3);
      expect(typeof names[0]).assertEqual('string');
      sharedDriver.hilogEnd('testSequentialErrors0024');
    });

    /*
     * @tc.number: SUB_SQE_2500
     * @tc.name: testSequentialErrors0025
     * @tc.desc: Verify SequentialErrors scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSequentialErrors0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSequentialErrors0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.releaseAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const result: string[] = await extDriver.fullWorkflowAcquireRelease();
      expect(result.length).assertEqual(2);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testSequentialErrors0025');
    });
  });
}
