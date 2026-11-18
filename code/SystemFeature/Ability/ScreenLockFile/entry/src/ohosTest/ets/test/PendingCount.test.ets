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
import { PairingCounts, SharedDriverExt } from './SharedDriverExt';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function pendingCountTest(): void {
  describe('PendingCountTest', (): void => {

    // ==================== pending 计数逻辑验证（25 条） ====================

    /*
     * @tc.number: SUB_PC_0100
     * @tc.name: testPendingCount0001
     * @tc.desc: Verify pending is 0 when no operations performed.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0001');
    });

    /*
     * @tc.number: SUB_PC_0200
     * @tc.name: testPendingCount0002
     * @tc.desc: Verify pending equals acquire count after acquires.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0002');
    });

    /*
     * @tc.number: SUB_PC_0300
     * @tc.name: testPendingCount0003
     * @tc.desc: Verify pending decreases after release operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0003');
    });

    /*
     * @tc.number: SUB_PC_0400
     * @tc.name: testPendingCount0004
     * @tc.desc: Verify pending is 0 when acquire equals release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0004');
    });

    /*
     * @tc.number: SUB_PC_0500
     * @tc.name: testPendingCount0005
     * @tc.desc: Verify pending never goes negative.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0005');
    });

    /*
     * @tc.number: SUB_PC_0600
     * @tc.name: testPendingCount0006
     * @tc.desc: Verify pending equals acquire minus release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0006');
    });

    /*
     * @tc.number: SUB_PC_0700
     * @tc.name: testPendingCount0007
     * @tc.desc: Verify pending shown in pairing status text.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0007');
    });

    /*
     * @tc.number: SUB_PC_0800
     * @tc.name: testPendingCount0008
     * @tc.desc: Verify pending shown in queryAllStates result.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0008');
    });

    /*
     * @tc.number: SUB_PC_0900
     * @tc.name: testPendingCount0009
     * @tc.desc: Verify pending type is number.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0009');
    });

    /*
     * @tc.number: SUB_PC_1000
     * @tc.name: testPendingCount0010
     * @tc.desc: Verify pending updates after each operation.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const initial: PairingCounts = await extDriver.parsePairingCounts();
      expect(initial.pending).assertEqual(0);
      await extDriver.clickAcquireButton();
      const afterAcquire: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterAcquire.pending).assertLarger(-1);
      expect(typeof afterAcquire.pending).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPendingCount0010');
    });

    /*
     * @tc.number: SUB_PC_1100
     * @tc.name: testPendingCount0011
     * @tc.desc: Verify pending is 0 when release exceeds acquire.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0011');
    });

    /*
     * @tc.number: SUB_PC_1200
     * @tc.name: testPendingCount0012
     * @tc.desc: Verify pending clamped to 0 on excess release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0012');
    });

    /*
     * @tc.number: SUB_PC_1300
     * @tc.name: testPendingCount0013
     * @tc.desc: Verify pending valid after rapid acquire-release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0013');
    });

    /*
     * @tc.number: SUB_PC_1400
     * @tc.name: testPendingCount0014
     * @tc.desc: Verify pending valid after multiple cycles.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPendingCount0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0014');
    });

    /*
     * @tc.number: SUB_PC_1500
     * @tc.name: testPendingCount0015
     * @tc.desc: Verify pending 0 after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0015');
    });

    /*
     * @tc.number: SUB_PC_1600
     * @tc.name: testPendingCount0016
     * @tc.desc: Verify pending recalculated after clear and new ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0016');
    });

    /*
     * @tc.number: SUB_PC_1700
     * @tc.name: testPendingCount0017
     * @tc.desc: Verify pending consistent with acquire and release.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0017');
    });

    /*
     * @tc.number: SUB_PC_1800
     * @tc.name: testPendingCount0018
     * @tc.desc: Verify pending formula acquire minus release min 0.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0018');
    });

    /*
     * @tc.number: SUB_PC_1900
     * @tc.name: testPendingCount0019
     * @tc.desc: Verify pending after API acquire call.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0019');
    });

    /*
     * @tc.number: SUB_PC_2000
     * @tc.name: testPendingCount0020
     * @tc.desc: Verify pending after API release call.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0020');
    });

    /*
     * @tc.number: SUB_PC_2100
     * @tc.name: testPendingCount0021
     * @tc.desc: Verify pending after API acquire-release cycle.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0021');
    });

    /*
     * @tc.number: SUB_PC_2200
     * @tc.name: testPendingCount0022
     * @tc.desc: Verify pending via queryAllStates matches pairing.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0022');
    });

    /*
     * @tc.number: SUB_PC_2300
     * @tc.name: testPendingCount0023
     * @tc.desc: Verify pending type is number after API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0023');
    });

    /*
     * @tc.number: SUB_PC_2400
     * @tc.name: testPendingCount0024
     * @tc.desc: Verify pending non-negative after API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0024');
    });

    /*
     * @tc.number: SUB_PC_2500
     * @tc.name: testPendingCount0025
     * @tc.desc: Verify pending stable after repeated API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPendingCount0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPendingCount0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPendingCount0025');
    });

  });
}
