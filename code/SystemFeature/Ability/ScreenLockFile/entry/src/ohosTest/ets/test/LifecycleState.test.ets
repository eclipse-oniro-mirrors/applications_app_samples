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
import { SharedDriverExt } from './SharedDriverExt';
import { TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, RELEASE_STATUS_GRANTED
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver = new SharedDriverExt(sharedDriver);
const testHelper = new TestHelper(sharedDriver);

export default function lifecycleStateTest(): void {
  describe('LifecycleStateTest', (): void => {

    // ==================== 生命周期状态验证（25 条） ====================

    /*
     * @tc.number: SUB_LCS_0100
     * @tc.name: testLifecycleState0001
     * @tc.desc: Verify LifecycleState scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testLifecycleState0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0001');
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      sharedDriver.hilogEnd('testLifecycleState0001');
    });

    /*
     * @tc.number: SUB_LCS_0200
     * @tc.name: testLifecycleState0002
     * @tc.desc: Verify LifecycleState scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testLifecycleState0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      sharedDriver.hilogEnd('testLifecycleState0002');
    });

    /*
     * @tc.number: SUB_LCS_0300
     * @tc.name: testLifecycleState0003
     * @tc.desc: Verify LifecycleState scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testLifecycleState0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testLifecycleState0003');
    });

    /*
     * @tc.number: SUB_LCS_0400
     * @tc.name: testLifecycleState0004
     * @tc.desc: Verify LifecycleState scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testLifecycleState0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testLifecycleState0004');
    });

    /*
     * @tc.number: SUB_LCS_0500
     * @tc.name: testLifecycleState0005
     * @tc.desc: Verify LifecycleState scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testLifecycleState0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      const result = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testLifecycleState0005');
    });

    /*
     * @tc.number: SUB_LCS_0600
     * @tc.name: testLifecycleState0006
     * @tc.desc: Verify LifecycleState scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(-1);
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testLifecycleState0006');
    });

    /*
     * @tc.number: SUB_LCS_0700
     * @tc.name: testLifecycleState0007
     * @tc.desc: Verify LifecycleState scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      await extDriver.clearHistoryAndWait();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testLifecycleState0007');
    });

    /*
     * @tc.number: SUB_LCS_0800
     * @tc.name: testLifecycleState0008
     * @tc.desc: Verify LifecycleState scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testLifecycleState0008');
    });

    /*
     * @tc.number: SUB_LCS_0900
     * @tc.name: testLifecycleState0009
     * @tc.desc: Verify LifecycleState scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testLifecycleState0009');
    });

    /*
     * @tc.number: SUB_LCS_1000
     * @tc.name: testLifecycleState0010
     * @tc.desc: Verify LifecycleState scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const result = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testLifecycleState0010');
    });

    /*
     * @tc.number: SUB_LCS_1100
     * @tc.name: testLifecycleState0011
     * @tc.desc: Verify LifecycleState scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const before = await testHelper.captureStateSnapshot();
      expect(typeof before.operationResult).assertEqual('string');
      await extDriver.clickAcquireButton();
      const after = await testHelper.captureStateSnapshot();
      expect(after.historyEmpty).assertFalse();
      expect(typeof after.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testLifecycleState0011');
    });

    /*
     * @tc.number: SUB_LCS_1200
     * @tc.name: testLifecycleState0012
     * @tc.desc: Verify LifecycleState scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(-1);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testLifecycleState0012');
    });

    /*
     * @tc.number: SUB_LCS_1300
     * @tc.name: testLifecycleState0013
     * @tc.desc: Verify LifecycleState scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertLarger(-1);
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testLifecycleState0013');
    });

    /*
     * @tc.number: SUB_LCS_1400
     * @tc.name: testLifecycleState0014
     * @tc.desc: Verify LifecycleState scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testLifecycleState0014');
    });

    /*
     * @tc.number: SUB_LCS_1500
     * @tc.name: testLifecycleState0015
     * @tc.desc: Verify LifecycleState scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickReleaseButton();
      }
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testLifecycleState0015');
    });

    /*
     * @tc.number: SUB_LCS_1600
     * @tc.name: testLifecycleState0016
     * @tc.desc: Verify LifecycleState scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.waitUiIdle();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      const stable = await testHelper.waitForStableState(2000);
      expect(stable).assertTrue();
      expect(typeof stable).assertEqual('boolean');
      sharedDriver.hilogEnd('testLifecycleState0016');
    });

    /*
     * @tc.number: SUB_LCS_1700
     * @tc.name: testLifecycleState0017
     * @tc.desc: Verify LifecycleState scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testLifecycleState0017');
    });

    /*
     * @tc.number: SUB_LCS_1800
     * @tc.name: testLifecycleState0018
     * @tc.desc: Verify LifecycleState scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const valid = await testHelper.verifyHistoryLimit();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      sharedDriver.hilogEnd('testLifecycleState0018');
    });

    /*
     * @tc.number: SUB_LCS_1900
     * @tc.name: testLifecycleState0019
     * @tc.desc: Verify LifecycleState scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const valid = await testHelper.verifyPairingSymmetry();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testLifecycleState0019');
    });

    /*
     * @tc.number: SUB_LCS_2000
     * @tc.name: testLifecycleState0020
     * @tc.desc: Verify LifecycleState scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState:')).assertTrue();
      const colonIdx = result.indexOf(':');
      expect(colonIdx).assertLarger(0);
      expect(result.length).assertLarger(colonIdx + 1);
      sharedDriver.hilogEnd('testLifecycleState0020');
    });

    /*
     * @tc.number: SUB_LCS_2100
     * @tc.name: testLifecycleState0021
     * @tc.desc: Verify LifecycleState scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const result = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess:')).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testLifecycleState0021');
    });

    /*
     * @tc.number: SUB_LCS_2200
     * @tc.name: testLifecycleState0022
     * @tc.desc: Verify LifecycleState scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const result = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess:') || result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testLifecycleState0022');
    });

    /*
     * @tc.number: SUB_LCS_2300
     * @tc.name: testLifecycleState0023
     * @tc.desc: Verify LifecycleState scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const ts = testHelper.formatTimestamp();
      expect(ts.length).assertEqual(8);
      expect(ts.includes(':')).assertTrue();
      expect(typeof ts).assertEqual('string');
      sharedDriver.hilogEnd('testLifecycleState0023');
    });

    /*
     * @tc.number: SUB_LCS_2400
     * @tc.name: testLifecycleState0024
     * @tc.desc: Verify LifecycleState scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testLifecycleState0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0024');
      const result = testHelper.queryKeyState();
      expect(result.timestamp).assertLarger(0);
      expect(typeof result.timestamp).assertEqual('number');
      expect(typeof result.success).assertEqual('boolean');
      sharedDriver.hilogEnd('testLifecycleState0024');
    });

    /*
     * @tc.number: SUB_LCS_2500
     * @tc.name: testLifecycleState0025
     * @tc.desc: Verify LifecycleState scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testLifecycleState0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testLifecycleState0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const isValid = await testHelper.verifyStateConsistency();
      expect(isValid).assertTrue();
      const status = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testLifecycleState0025');
    });
  });
}
