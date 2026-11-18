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
import { StateSnapshot, TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, ID_PAIRING_STATUS,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function restartRecoveryTest(): void {
  describe('RestartRecoveryTest', (): void => {

    // ==================== 重启恢复验证（25 条） ====================

    /*
     * @tc.number: SUB_RRC_0100
     * @tc.name: testRestartRecovery0001
     * @tc.desc: Verify RestartRecovery scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      sharedDriver.hilogEnd('testRestartRecovery0001');
    });

    /*
     * @tc.number: SUB_RRC_0200
     * @tc.name: testRestartRecovery0002
     * @tc.desc: Verify RestartRecovery scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testRestartRecovery0002');
    });

    /*
     * @tc.number: SUB_RRC_0300
     * @tc.name: testRestartRecovery0003
     * @tc.desc: Verify RestartRecovery scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testRestartRecovery0003');
    });

    /*
     * @tc.number: SUB_RRC_0400
     * @tc.name: testRestartRecovery0004
     * @tc.desc: Verify RestartRecovery scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testRestartRecovery0004');
    });

    /*
     * @tc.number: SUB_RRC_0500
     * @tc.name: testRestartRecovery0005
     * @tc.desc: Verify RestartRecovery scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      sharedDriver.hilogEnd('testRestartRecovery0005');
    });

    /*
     * @tc.number: SUB_RRC_0600
     * @tc.name: testRestartRecovery0006
     * @tc.desc: Verify RestartRecovery scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.release).assertLarger(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testRestartRecovery0006');
    });

    /*
     * @tc.number: SUB_RRC_0700
     * @tc.name: testRestartRecovery0007
     * @tc.desc: Verify RestartRecovery scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testRestartRecovery0007');
    });

    /*
     * @tc.number: SUB_RRC_0800
     * @tc.name: testRestartRecovery0008
     * @tc.desc: Verify RestartRecovery scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testRestartRecovery0008');
    });

    /*
     * @tc.number: SUB_RRC_0900
     * @tc.name: testRestartRecovery0009
     * @tc.desc: Verify RestartRecovery scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const result: string = await extDriver.clickQueryAllButton();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testRestartRecovery0009');
    });

    /*
     * @tc.number: SUB_RRC_1000
     * @tc.name: testRestartRecovery0010
     * @tc.desc: Verify RestartRecovery scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        testHelper.acquireAccess();
        await extDriver.clearHistoryAndWait();
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testRestartRecovery0010');
    });

    /*
     * @tc.number: SUB_RRC_1100
     * @tc.name: testRestartRecovery0011
     * @tc.desc: Verify RestartRecovery scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(testHelper.isValidKeyStatus(snapshot.keyStatus)).assertTrue();
      expect(typeof snapshot.operationResult).assertEqual('string');
      expect(snapshot.historyEmpty).assertTrue();
      sharedDriver.hilogEnd('testRestartRecovery0011');
    });

    /*
     * @tc.number: SUB_RRC_1200
     * @tc.name: testRestartRecovery0012
     * @tc.desc: Verify RestartRecovery scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await testHelper.verifyHistoryLimit();
      expect(valid).assertTrue();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof valid).assertEqual('boolean');
      sharedDriver.hilogEnd('testRestartRecovery0012');
    });

    /*
     * @tc.number: SUB_RRC_1300
     * @tc.name: testRestartRecovery0013
     * @tc.desc: Verify RestartRecovery scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const symm: boolean = await testHelper.verifyPairingSymmetry();
      expect(symm).assertTrue();
      expect(typeof symm).assertEqual('boolean');
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testRestartRecovery0013');
    });

    /*
     * @tc.number: SUB_RRC_1400
     * @tc.name: testRestartRecovery0014
     * @tc.desc: Verify RestartRecovery scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const stable: boolean = await testHelper.waitForStableState(2000);
      expect(stable).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testRestartRecovery0014');
    });

    /*
     * @tc.number: SUB_RRC_1500
     * @tc.name: testRestartRecovery0015
     * @tc.desc: Verify RestartRecovery scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testRestartRecovery0015');
    });

    /*
     * @tc.number: SUB_RRC_1600
     * @tc.name: testRestartRecovery0016
     * @tc.desc: Verify RestartRecovery scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(1);
      expect(counts.pending).assertLarger(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testRestartRecovery0016');
    });

    /*
     * @tc.number: SUB_RRC_1700
     * @tc.name: testRestartRecovery0017
     * @tc.desc: Verify RestartRecovery scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.performMultipleQueries(3);
      expect(results.length).assertEqual(3);
      expect(results[0].includes('queryAppKeyState')).assertTrue();
      expect(typeof results[0]).assertEqual('string');
      sharedDriver.hilogEnd('testRestartRecovery0017');
    });

    /*
     * @tc.number: SUB_RRC_1800
     * @tc.name: testRestartRecovery0018
     * @tc.desc: Verify RestartRecovery scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.performMultipleAcquires(3);
      expect(results.length).assertEqual(3);
      expect(results[0].includes('acquireAccess')).assertTrue();
      expect(typeof results[0]).assertEqual('string');
      sharedDriver.hilogEnd('testRestartRecovery0018');
    });

    /*
     * @tc.number: SUB_RRC_1900
     * @tc.name: testRestartRecovery0019
     * @tc.desc: Verify RestartRecovery scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.performMultipleReleases(2);
      expect(results.length).assertEqual(2);
      expect(typeof results[0]).assertEqual('string');
      expect(results[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testRestartRecovery0019');
    });

    /*
     * @tc.number: SUB_RRC_2000
     * @tc.name: testRestartRecovery0020
     * @tc.desc: Verify RestartRecovery scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const qExists: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const aExists: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const rExists: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(qExists).assertTrue();
      expect(aExists).assertTrue();
      expect(rExists).assertTrue();
      sharedDriver.hilogEnd('testRestartRecovery0020');
    });

    /*
     * @tc.number: SUB_RRC_2100
     * @tc.name: testRestartRecovery0021
     * @tc.desc: Verify RestartRecovery scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testRestartRecovery0021');
    });

    /*
     * @tc.number: SUB_RRC_2200
     * @tc.name: testRestartRecovery0022
     * @tc.desc: Verify RestartRecovery scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await extDriver.verifyQueryAllResult();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testRestartRecovery0022');
    });

    /*
     * @tc.number: SUB_RRC_2300
     * @tc.name: testRestartRecovery0023
     * @tc.desc: Verify RestartRecovery scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const valid: boolean = await extDriver.verifyHistoryMaxSize();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      sharedDriver.hilogEnd('testRestartRecovery0023');
    });

    /*
     * @tc.number: SUB_RRC_2400
     * @tc.name: testRestartRecovery0024
     * @tc.desc: Verify RestartRecovery scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name: string = testHelper.getKeyStatusName(status);
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testRestartRecovery0024');
    });

    /*
     * @tc.number: SUB_RRC_2500
     * @tc.name: testRestartRecovery0025
     * @tc.desc: Verify RestartRecovery scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testRestartRecovery0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testRestartRecovery0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const results: string[] = await extDriver.fullWorkflowAcquireRelease();
      expect(results.length).assertEqual(2);
      expect(results[0].includes('acquireAccess')).assertTrue();
      expect(results[1].includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testRestartRecovery0025');
    });
  });
}
