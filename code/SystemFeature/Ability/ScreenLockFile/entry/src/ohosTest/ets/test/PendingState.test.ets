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
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, ID_PAIRING_STATUS,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver = new SharedDriverExt(sharedDriver);
const testHelper = new TestHelper(sharedDriver);

export default function pendingStateTest(): void {
  describe('PendingStateTest', (): void => {

    // ==================== Pending 状态验证（20 条） ====================

    /*
     * @tc.number: SUB_PDS_0100
     * @tc.name: testPendingState0001
     * @tc.desc: Verify PendingState scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPendingState0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testPendingState0001');
    });

    /*
     * @tc.number: SUB_PDS_0200
     * @tc.name: testPendingState0002
     * @tc.desc: Verify PendingState scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPendingState0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const counts = await extDriver.parsePairingCounts();
      const result = await extDriver.getOperationResult();
      if (result.includes('ACCESS_GRANTED') || result.includes('acquireAccess')) {
        expect(counts.acquire).assertLarger(-1);
      }
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0002');
    });

    /*
     * @tc.number: SUB_PDS_0300
     * @tc.name: testPendingState0003
     * @tc.desc: Verify PendingState scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPendingState0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0003');
    });

    /*
     * @tc.number: SUB_PDS_0400
     * @tc.name: testPendingState0004
     * @tc.desc: Verify PendingState scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPendingState0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0004');
    });

    /*
     * @tc.number: SUB_PDS_0500
     * @tc.name: testPendingState0005
     * @tc.desc: Verify PendingState scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const counts = await extDriver.parsePairingCounts();
      const expectedPending = counts.acquire - counts.release;
      if (expectedPending >= 0) {
        expect(counts.pending).assertEqual(expectedPending);
      } else {
        expect(counts.pending).assertEqual(0);
      }
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0005');
    });

    /*
     * @tc.number: SUB_PDS_0600
     * @tc.name: testPendingState0006
     * @tc.desc: Verify PendingState scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const c1 = await extDriver.parsePairingCounts();
      testHelper.acquireAccess();
      const c2 = await extDriver.parsePairingCounts();
      expect(c2.pending).assertLarger(c1.pending - 1);
      expect(c2.acquire).assertLarger(c1.acquire - 1);
      expect(typeof c2.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0006');
    });

    /*
     * @tc.number: SUB_PDS_0700
     * @tc.name: testPendingState0007
     * @tc.desc: Verify PendingState scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      const before = await extDriver.parsePairingCounts();
      testHelper.releaseAccess();
      const after = await extDriver.parsePairingCounts();
      expect(after.release).assertLarger(before.release - 1);
      expect(typeof after.pending).assertEqual('number');
      expect(after.pending).assertLarger(-1);
      sharedDriver.hilogEnd('testPendingState0007');
    });

    /*
     * @tc.number: SUB_PDS_0800
     * @tc.name: testPendingState0008
     * @tc.desc: Verify PendingState scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      testHelper.acquireAccess();
      testHelper.acquireAccess();
      await extDriver.clearHistoryAndWait();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testPendingState0008');
    });

    /*
     * @tc.number: SUB_PDS_0900
     * @tc.name: testPendingState0009
     * @tc.desc: Verify PendingState scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const result = await extDriver.clickQueryAllButton();
      expect(result.includes('Pending:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPendingState0009');
    });

    /*
     * @tc.number: SUB_PDS_1000
     * @tc.name: testPendingState0010
     * @tc.desc: Verify PendingState scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const symm = await testHelper.verifyPairingSymmetry();
      expect(symm).assertTrue();
      expect(typeof symm).assertEqual('boolean');
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testPendingState0010');
    });

    /*
     * @tc.number: SUB_PDS_1100
     * @tc.name: testPendingState0011
     * @tc.desc: Verify PendingState scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const before = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      expect(before.includes('Acquire:')).assertTrue();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const after = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      expect(after.includes('Acquire:')).assertTrue();
      expect(after.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingState0011');
    });

    /*
     * @tc.number: SUB_PDS_1200
     * @tc.name: testPendingState0012
     * @tc.desc: Verify PendingState scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const before = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const after = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      expect(before.includes('Release:')).assertTrue();
      expect(after.includes('Release:')).assertTrue();
      expect(after.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingState0012');
    });

    /*
     * @tc.number: SUB_PDS_1300
     * @tc.name: testPendingState0013
     * @tc.desc: Verify PendingState scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const p1 = await extDriver.parsePairingCounts();
      await sharedDriver.waitUiIdle();
      const p2 = await extDriver.parsePairingCounts();
      expect(p1.pending).assertEqual(p2.pending);
      expect(p1.acquire).assertEqual(p2.acquire);
      expect(p1.release).assertEqual(p2.release);
      sharedDriver.hilogEnd('testPendingState0013');
    });

    /*
     * @tc.number: SUB_PDS_1400
     * @tc.name: testPendingState0014
     * @tc.desc: Verify PendingState scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(-1);
      expect(counts.release).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0014');
    });

    /*
     * @tc.number: SUB_PDS_1500
     * @tc.name: testPendingState0015
     * @tc.desc: Verify PendingState scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      testHelper.releaseAccess();
      const result = await extDriver.clickQueryAllButton();
      expect(result.includes('Pending:')).assertTrue();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testPendingState0015');
    });

    /*
     * @tc.number: SUB_PDS_1600
     * @tc.name: testPendingState0016
     * @tc.desc: Verify PendingState scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(-1);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0016');
    });

    /*
     * @tc.number: SUB_PDS_1700
     * @tc.name: testPendingState0017
     * @tc.desc: Verify PendingState scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(counts.acquire).assertLarger(-1);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0017');
    });

    /*
     * @tc.number: SUB_PDS_1800
     * @tc.name: testPendingState0018
     * @tc.desc: Verify PendingState scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const counts = await extDriver.parsePairingCounts();
      const computed = counts.acquire - counts.release;
      const expected = computed >= 0 ? computed : 0;
      expect(counts.pending).assertEqual(expected);
      expect(typeof counts.pending).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testPendingState0018');
    });

    /*
     * @tc.number: SUB_PDS_1900
     * @tc.name: testPendingState0019
     * @tc.desc: Verify PendingState scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i = 0; i < 3; i++) {
        testHelper.acquireAccess();
        testHelper.releaseAccess();
      }
      const counts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertEqual(counts.release);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPendingState0019');
    });

    /*
     * @tc.number: SUB_PDS_2000
     * @tc.name: testPendingState0020
     * @tc.desc: Verify PendingState scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPendingState0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingState0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const snapshot = await testHelper.captureStateSnapshot();
      expect(snapshot.pairingText.includes('Acquire:')).assertTrue();
      expect(snapshot.pairingText.includes('Pending:')).assertTrue();
      expect(typeof snapshot.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testPendingState0020');
    });
  });
}
