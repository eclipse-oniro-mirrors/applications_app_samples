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

export default function stateConsistencyTest(): void {
  describe('StateConsistencyTest', (): void => {

    // ==================== 状态一致性验证（25 条） ====================

    /*
     * @tc.number: SUB_SCS_0100
     * @tc.name: testStateConsistency0001
     * @tc.desc: Verify StateConsistency scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testStateConsistency0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0001');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(typeof s1).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0001');
    });

    /*
     * @tc.number: SUB_SCS_0200
     * @tc.name: testStateConsistency0002
     * @tc.desc: Verify StateConsistency scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testStateConsistency0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0002');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s3: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(s2).assertEqual(s3);
      expect(testHelper.isValidKeyStatus(s3)).assertTrue();
      sharedDriver.hilogEnd('testStateConsistency0002');
    });

    /*
     * @tc.number: SUB_SCS_0300
     * @tc.name: testStateConsistency0003
     * @tc.desc: Verify StateConsistency scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testStateConsistency0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0003');
      testHelper.acquireAccess();
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(typeof s1).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0003');
    });

    /*
     * @tc.number: SUB_SCS_0400
     * @tc.name: testStateConsistency0004
     * @tc.desc: Verify StateConsistency scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testStateConsistency0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0004');
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(typeof s2).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0004');
    });

    /*
     * @tc.number: SUB_SCS_0500
     * @tc.name: testStateConsistency0005
     * @tc.desc: Verify StateConsistency scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const initial: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const afterClear: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(initial)).assertTrue();
      expect(testHelper.isValidKeyStatus(afterClear)).assertTrue();
      expect(typeof afterClear).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0005');
    });

    /*
     * @tc.number: SUB_SCS_0600
     * @tc.name: testStateConsistency0006
     * @tc.desc: Verify StateConsistency scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testStateConsistency0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testStateConsistency0006');
    });

    /*
     * @tc.number: SUB_SCS_0700
     * @tc.name: testStateConsistency0007
     * @tc.desc: Verify StateConsistency scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0007');
    });

    /*
     * @tc.number: SUB_SCS_0800
     * @tc.name: testStateConsistency0008
     * @tc.desc: Verify StateConsistency scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_RELEASE_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0008');
    });

    /*
     * @tc.number: SUB_SCS_0900
     * @tc.name: testStateConsistency0009
     * @tc.desc: Verify StateConsistency scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const apiStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(testHelper.isValidKeyStatus(apiStatus)).assertTrue();
      sharedDriver.hilogEnd('testStateConsistency0009');
    });

    /*
     * @tc.number: SUB_SCS_1000
     * @tc.name: testStateConsistency0010
     * @tc.desc: Verify StateConsistency scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const p1: PairingCounts = await extDriver.parsePairingCounts();
      const p2: PairingCounts = await extDriver.parsePairingCounts();
      expect(p1.acquire).assertEqual(p2.acquire);
      expect(p1.release).assertEqual(p2.release);
      expect(p1.pending).assertEqual(p2.pending);
      sharedDriver.hilogEnd('testStateConsistency0010');
    });

    /*
     * @tc.number: SUB_SCS_1100
     * @tc.name: testStateConsistency0011
     * @tc.desc: Verify StateConsistency scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const apiStatus: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const allResult: string = await extDriver.clickQueryAllButton();
      expect(allResult.includes('KeyState:')).assertTrue();
      expect(allResult.includes('|')).assertTrue();
      expect(testHelper.isValidKeyStatus(apiStatus)).assertTrue();
      sharedDriver.hilogEnd('testStateConsistency0011');
    });

    /*
     * @tc.number: SUB_SCS_1200
     * @tc.name: testStateConsistency0012
     * @tc.desc: Verify StateConsistency scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0012');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const name: string = testHelper.getKeyStatusName(status);
      const validNames: string[] = ['KEY_NOT_EXIST', 'KEY_RELEASED', 'KEY_EXIST'];
      let found: boolean = false;
      for (let i: number = 0; i < validNames.length; i++) {
        if (name === validNames[i]) {
          found = true;
        }
      }
      expect(found).assertTrue();
      expect(name.length).assertLarger(0);
      expect(typeof name).assertEqual('string');
      sharedDriver.hilogEnd('testStateConsistency0012');
    });

    /*
     * @tc.number: SUB_SCS_1300
     * @tc.name: testStateConsistency0013
     * @tc.desc: Verify StateConsistency scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const snap1: StateSnapshot = await testHelper.captureStateSnapshot();
      const snap2: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(snap1.keyStatus).assertEqual(snap2.keyStatus);
      expect(typeof snap1.operationResult).assertEqual('string');
      expect(typeof snap2.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testStateConsistency0013');
    });

    /*
     * @tc.number: SUB_SCS_1400
     * @tc.name: testStateConsistency0014
     * @tc.desc: Verify StateConsistency scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0014');
    });

    /*
     * @tc.number: SUB_SCS_1500
     * @tc.name: testStateConsistency0015
     * @tc.desc: Verify StateConsistency scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count: number = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0015');
    });

    /*
     * @tc.number: SUB_SCS_1600
     * @tc.name: testStateConsistency0016
     * @tc.desc: Verify StateConsistency scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0016');
      const names: string[] = [];
      for (let i: number = 0; i < 5; i++) {
        const s: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        names.push(testHelper.getKeyStatusName(s));
      }
      expect(names[0]).assertEqual(names[4]);
      expect(names.length).assertEqual(5);
      expect(typeof names[0]).assertEqual('string');
      sharedDriver.hilogEnd('testStateConsistency0016');
    });

    /*
     * @tc.number: SUB_SCS_1700
     * @tc.name: testStateConsistency0017
     * @tc.desc: Verify StateConsistency scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0017');
      const n1: string = testHelper.getAccessStatusName(0);
      const n2: string = testHelper.getAccessStatusName(0);
      expect(n1).assertEqual(n2);
      expect(n1).assertEqual('ACCESS_GRANTED');
      expect(typeof n1).assertEqual('string');
      sharedDriver.hilogEnd('testStateConsistency0017');
    });

    /*
     * @tc.number: SUB_SCS_1800
     * @tc.name: testStateConsistency0018
     * @tc.desc: Verify StateConsistency scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0018');
      const n1: string = testHelper.getReleaseStatusName(0);
      const n2: string = testHelper.getReleaseStatusName(0);
      expect(n1).assertEqual(n2);
      expect(n1).assertEqual('RELEASE_GRANTED');
      expect(typeof n1).assertEqual('string');
      sharedDriver.hilogEnd('testStateConsistency0018');
    });

    /*
     * @tc.number: SUB_SCS_1900
     * @tc.name: testStateConsistency0019
     * @tc.desc: Verify StateConsistency scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const result: boolean = await testHelper.performAcquireReleaseCycle();
      expect(typeof result).assertEqual('boolean');
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testStateConsistency0019');
    });

    /*
     * @tc.number: SUB_SCS_2000
     * @tc.name: testStateConsistency0020
     * @tc.desc: Verify StateConsistency scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        const valid: boolean = await testHelper.verifyStateConsistency();
        expect(valid).assertTrue();
      }
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0020');
    });

    /*
     * @tc.number: SUB_SCS_2100
     * @tc.name: testStateConsistency0021
     * @tc.desc: Verify StateConsistency scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const symm: boolean = await testHelper.verifyPairingSymmetry();
      expect(symm).assertTrue();
      expect(typeof symm).assertEqual('boolean');
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testStateConsistency0021');
    });

    /*
     * @tc.number: SUB_SCS_2200
     * @tc.name: testStateConsistency0022
     * @tc.desc: Verify StateConsistency scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      const r2: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r1).assertEqual(r2);
      expect(r1.includes('KEY_')).assertTrue();
      expect(r1.length).assertLarger(0);
      sharedDriver.hilogEnd('testStateConsistency0022');
    });

    /*
     * @tc.number: SUB_SCS_2300
     * @tc.name: testStateConsistency0023
     * @tc.desc: Verify StateConsistency scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.waitUiIdle();
      const p1: string = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      const p2: string = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      expect(p1).assertEqual(p2);
      expect(p1.includes('Acquire:')).assertTrue();
      expect(p1.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testStateConsistency0023');
    });

    /*
     * @tc.number: SUB_SCS_2400
     * @tc.name: testStateConsistency0024
     * @tc.desc: Verify StateConsistency scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const valid: boolean = await testHelper.verifyHistoryLimit();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      sharedDriver.hilogEnd('testStateConsistency0024');
    });

    /*
     * @tc.number: SUB_SCS_2500
     * @tc.name: testStateConsistency0025
     * @tc.desc: Verify StateConsistency scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testStateConsistency0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testStateConsistency0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const stable: boolean = await testHelper.waitForStableState(2000);
      expect(stable).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testStateConsistency0025');
    });
  });
}
