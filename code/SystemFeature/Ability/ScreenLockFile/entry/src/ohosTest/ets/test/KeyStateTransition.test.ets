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
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED, RELEASE_STATUS_GRANTED
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function keyStateTransitionTest(): void {
  describe('KeyStateTransitionTest', (): void => {

    // ==================== 按键状态转换验证（30 条） ====================

    /*
     * @tc.number: SUB_KST_0100
     * @tc.name: testKeyStateTransition0001
     * @tc.desc: Verify KeyStateTransition scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0001');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(status).assertLarger(-1);
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0001');
    });

    /*
     * @tc.number: SUB_KST_0200
     * @tc.name: testKeyStateTransition0002
     * @tc.desc: Verify KeyStateTransition scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0002');
      const beforeStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(beforeStatus)).assertTrue();
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(result.success).assertTrue();
      const afterStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(afterStatus)).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0002');
    });

    /*
     * @tc.number: SUB_KST_0300
     * @tc.name: testKeyStateTransition0003
     * @tc.desc: Verify KeyStateTransition scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0003');
      testHelper.acquireAccess();
      const acqStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(acqStatus)).assertTrue();
      const relResult: ApiCallResult = testHelper.releaseAccess();
      expect(relResult.success).assertTrue();
      const relStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(relStatus)).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0003');
    });

    /*
     * @tc.number: SUB_KST_0400
     * @tc.name: testKeyStateTransition0004
     * @tc.desc: Verify KeyStateTransition scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0004');
      const s0: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(s0)).assertTrue();
      testHelper.acquireAccess();
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      testHelper.releaseAccess();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0004');
    });

    /*
     * @tc.number: SUB_KST_0500
     * @tc.name: testKeyStateTransition0005
     * @tc.desc: Verify KeyStateTransition scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0005');
      const statuses: number[] = [];
      for (let i: number = 0; i < 3; i++) {
        testHelper.acquireAccess();
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        statuses.push(s);
        expect(testHelper.isValidKeyStatus(s)).assertTrue();
      }
      expect(statuses.length).assertEqual(3);
      expect(typeof statuses[0]).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0005');
    });

    /*
     * @tc.number: SUB_KST_0600
     * @tc.name: testKeyStateTransition0006
     * @tc.desc: Verify KeyStateTransition scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0006');
      testHelper.acquireAccess();
      const statuses: number[] = [];
      for (let i: number = 0; i < 3; i++) {
        testHelper.releaseAccess();
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        statuses.push(s);
        expect(testHelper.isValidKeyStatus(s)).assertTrue();
      }
      expect(statuses.length).assertEqual(3);
      expect(typeof statuses[2]).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0006');
    });

    /*
     * @tc.number: SUB_KST_0700
     * @tc.name: testKeyStateTransition0007
     * @tc.desc: Verify KeyStateTransition scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: boolean = await testHelper.performAcquireReleaseCycle();
      expect(typeof result).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0007');
    });

    /*
     * @tc.number: SUB_KST_0800
     * @tc.name: testKeyStateTransition0008
     * @tc.desc: Verify KeyStateTransition scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0008');
    });

    /*
     * @tc.number: SUB_KST_0900
     * @tc.name: testKeyStateTransition0009
     * @tc.desc: Verify KeyStateTransition scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testKeyStateTransition0009');
    });

    /*
     * @tc.number: SUB_KST_1000
     * @tc.name: testKeyStateTransition0010
     * @tc.desc: Verify KeyStateTransition scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testKeyStateTransition0010');
    });

    /*
     * @tc.number: SUB_KST_1100
     * @tc.name: testKeyStateTransition0011
     * @tc.desc: Verify KeyStateTransition scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0011');
      const name0: string = testHelper.getKeyStatusName(KEY_STATUS_NOT_EXIST);
      const name1: string = testHelper.getKeyStatusName(KEY_STATUS_RELEASED);
      const name2: string = testHelper.getKeyStatusName(KEY_STATUS_EXIST);
      expect(name0).assertEqual('KEY_NOT_EXIST');
      expect(name1).assertEqual('KEY_RELEASED');
      expect(name2).assertEqual('KEY_EXIST');
      sharedDriver.hilogEnd('testKeyStateTransition0011');
    });

    /*
     * @tc.number: SUB_KST_1200
     * @tc.name: testKeyStateTransition0012
     * @tc.desc: Verify KeyStateTransition scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0012');
      const name: string = testHelper.getKeyStatusName(99);
      expect(name).assertEqual('UNKNOWN');
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStateTransition0012');
    });

    /*
     * @tc.number: SUB_KST_1300
     * @tc.name: testKeyStateTransition0013
     * @tc.desc: Verify KeyStateTransition scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0013');
      const results: number[] = [];
      for (let i: number = 0; i < 5; i++) {
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        results.push(s);
      }
      expect(results.length).assertEqual(5);
      expect(testHelper.isValidKeyStatus(results[0])).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0013');
    });

    /*
     * @tc.number: SUB_KST_1400
     * @tc.name: testKeyStateTransition0014
     * @tc.desc: Verify KeyStateTransition scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0014');
      const before: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(before)).assertTrue();
      const result: ApiCallResult = testHelper.acquireAccess();
      expect(typeof result.success).assertEqual('boolean');
      expect(typeof result.errorCode).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0014');
    });

    /*
     * @tc.number: SUB_KST_1500
     * @tc.name: testKeyStateTransition0015
     * @tc.desc: Verify KeyStateTransition scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const before: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(before)).assertTrue();
      const result: ApiCallResult = testHelper.releaseAccess();
      expect(typeof result.success).assertEqual('boolean');
      const after: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(after)).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0015');
    });

    /*
     * @tc.number: SUB_KST_1600
     * @tc.name: testKeyStateTransition0016
     * @tc.desc: Verify KeyStateTransition scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      testHelper.acquireAccess();
      const r2: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r2.includes('queryAppKeyState')).assertTrue();
      expect(r1.length).assertLarger(0);
      sharedDriver.hilogEnd('testKeyStateTransition0016');
    });

    /*
     * @tc.number: SUB_KST_1700
     * @tc.name: testKeyStateTransition0017
     * @tc.desc: Verify KeyStateTransition scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('|')).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0017');
    });

    /*
     * @tc.number: SUB_KST_1800
     * @tc.name: testKeyStateTransition0018
     * @tc.desc: Verify KeyStateTransition scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      expect(result.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0018');
    });

    /*
     * @tc.number: SUB_KST_1900
     * @tc.name: testKeyStateTransition0019
     * @tc.desc: Verify KeyStateTransition scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0019');
      let allValid: boolean = true;
      for (let i: number = 0; i < 3; i++) {
        testHelper.acquireAccess();
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        if (!testHelper.isValidKeyStatus(s)) {
          allValid = false;
        }
        testHelper.releaseAccess();
      }
      expect(allValid).assertTrue();
      const finalStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(finalStatus)).assertTrue();
      expect(typeof finalStatus).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0019');
    });

    /*
     * @tc.number: SUB_KST_2000
     * @tc.name: testKeyStateTransition0020
     * @tc.desc: Verify KeyStateTransition scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      const pairing: PairingCounts = await extDriver.parsePairingCounts();
      expect(pairing.acquire).assertEqual(0);
      expect(pairing.release).assertEqual(0);
      sharedDriver.hilogEnd('testKeyStateTransition0020');
    });

    /*
     * @tc.number: SUB_KST_2100
     * @tc.name: testKeyStateTransition0021
     * @tc.desc: Verify KeyStateTransition scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0021');
      const name0: string = testHelper.getAccessStatusName(ACCESS_STATUS_GRANTED);
      const name1: string = testHelper.getAccessStatusName(ACCESS_STATUS_DENIED);
      expect(name0).assertEqual('ACCESS_GRANTED');
      expect(name1).assertEqual('ACCESS_DENIED');
      expect(typeof name0).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStateTransition0021');
    });

    /*
     * @tc.number: SUB_KST_2200
     * @tc.name: testKeyStateTransition0022
     * @tc.desc: Verify KeyStateTransition scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0022');
      const name0: string = testHelper.getReleaseStatusName(RELEASE_STATUS_GRANTED);
      const name1: string = testHelper.getReleaseStatusName(1);
      expect(name0).assertEqual('RELEASE_GRANTED');
      expect(name1).assertEqual('RELEASE_DENIED');
      expect(typeof name0).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStateTransition0022');
    });

    /*
     * @tc.number: SUB_KST_2300
     * @tc.name: testKeyStateTransition0023
     * @tc.desc: Verify KeyStateTransition scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(testHelper.isValidKeyStatus(snapshot.keyStatus)).assertTrue();
      expect(typeof snapshot.operationResult).assertEqual('string');
      expect(typeof snapshot.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testKeyStateTransition0023');
    });

    /*
     * @tc.number: SUB_KST_2400
     * @tc.name: testKeyStateTransition0024
     * @tc.desc: Verify KeyStateTransition scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(testHelper.isValidKeyStatus(snapshot.keyStatus)).assertTrue();
      expect(snapshot.pairingText.includes('Acquire:')).assertTrue();
      expect(snapshot.historyEmpty).assertFalse();
      sharedDriver.hilogEnd('testKeyStateTransition0024');
    });

    /*
     * @tc.number: SUB_KST_2500
     * @tc.name: testKeyStateTransition0025
     * @tc.desc: Verify KeyStateTransition scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0025');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testKeyStateTransition0025');
    });

    /*
     * @tc.number: SUB_KST_2600
     * @tc.name: testKeyStateTransition0026
     * @tc.desc: Verify KeyStateTransition scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0026');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count: number = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0026');
    });

    /*
     * @tc.number: SUB_KST_2700
     * @tc.name: testKeyStateTransition0027
     * @tc.desc: Verify KeyStateTransition scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(-1);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0027');
    });

    /*
     * @tc.number: SUB_KST_2800
     * @tc.name: testKeyStateTransition0028
     * @tc.desc: Verify KeyStateTransition scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertLarger(-1);
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testKeyStateTransition0028');
    });

    /*
     * @tc.number: SUB_KST_2900
     * @tc.name: testKeyStateTransition0029
     * @tc.desc: Verify KeyStateTransition scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testKeyStateTransition0029');
    });

    /*
     * @tc.number: SUB_KST_3000
     * @tc.name: testKeyStateTransition0030
     * @tc.desc: Verify KeyStateTransition scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testKeyStateTransition0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testKeyStateTransition0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const isValid: boolean = await testHelper.verifyStateConsistency();
      expect(isValid).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testKeyStateTransition0030');
    });
  });
}
