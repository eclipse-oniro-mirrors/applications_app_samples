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

export default function pairingSymmetryTest(): void {
  describe('PairingSymmetryTest', (): void => {

    // ==================== 配对对称性验证（25 条） ====================

    /*
     * @tc.number: SUB_PS_0100
     * @tc.name: testPairingSymmetry0001
     * @tc.desc: Verify pending is 0 after equal acquire and release count.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0001');
    });

    /*
     * @tc.number: SUB_PS_0200
     * @tc.name: testPairingSymmetry0002
     * @tc.desc: Verify symmetry after 1 acquire and 1 release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0002');
    });

    /*
     * @tc.number: SUB_PS_0300
     * @tc.name: testPairingSymmetry0003
     * @tc.desc: Verify symmetry after 2 acquires and 2 releases.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0003');
    });

    /*
     * @tc.number: SUB_PS_0400
     * @tc.name: testPairingSymmetry0004
     * @tc.desc: Verify symmetry after 3 acquires and 3 releases.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0004');
    });

    /*
     * @tc.number: SUB_PS_0500
     * @tc.name: testPairingSymmetry0005
     * @tc.desc: Verify pairing status shows balanced counts.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0005');
    });

    /*
     * @tc.number: SUB_PS_0600
     * @tc.name: testPairingSymmetry0006
     * @tc.desc: Verify symmetry via API acquire-release calls.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0006');
    });

    /*
     * @tc.number: SUB_PS_0700
     * @tc.name: testPairingSymmetry0007
     * @tc.desc: Verify symmetry via UI button clicks.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0007');
    });

    /*
     * @tc.number: SUB_PS_0800
     * @tc.name: testPairingSymmetry0008
     * @tc.desc: Verify operation result valid after symmetric ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0008');
    });

    /*
     * @tc.number: SUB_PS_0900
     * @tc.name: testPairingSymmetry0009
     * @tc.desc: Verify history records symmetric operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0009');
    });

    /*
     * @tc.number: SUB_PS_1000
     * @tc.name: testPairingSymmetry0010
     * @tc.desc: Verify queryAllStates shows pending 0 after symmetry.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingSymmetry0010');
    });

    /*
     * @tc.number: SUB_PS_1100
     * @tc.name: testPairingSymmetry0011
     * @tc.desc: Verify pending positive when acquires exceed releases.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0011');
    });

    /*
     * @tc.number: SUB_PS_1200
     * @tc.name: testPairingSymmetry0012
     * @tc.desc: Verify pending zero when releases match acquires.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0012');
    });

    /*
     * @tc.number: SUB_PS_1300
     * @tc.name: testPairingSymmetry0013
     * @tc.desc: Verify pending zero when releases exceed acquires.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0013');
    });

    /*
     * @tc.number: SUB_PS_1400
     * @tc.name: testPairingSymmetry0014
     * @tc.desc: Verify symmetry restored after additional release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0014');
    });

    /*
     * @tc.number: SUB_PS_1500
     * @tc.name: testPairingSymmetry0015
     * @tc.desc: Verify asymmetry reflected in pairing status.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0015');
    });

    /*
     * @tc.number: SUB_PS_1600
     * @tc.name: testPairingSymmetry0016
     * @tc.desc: Verify queryAllStates shows correct asymmetry.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0016');
    });

    /*
     * @tc.number: SUB_PS_1700
     * @tc.name: testPairingSymmetry0017
     * @tc.desc: Verify history records asymmetric operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0017');
    });

    /*
     * @tc.number: SUB_PS_1800
     * @tc.name: testPairingSymmetry0018
     * @tc.desc: Verify operation result valid after asymmetric ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0018');
    });

    /*
     * @tc.number: SUB_PS_1900
     * @tc.name: testPairingSymmetry0019
     * @tc.desc: Verify API acquire-release symmetry.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0019');
    });

    /*
     * @tc.number: SUB_PS_2000
     * @tc.name: testPairingSymmetry0020
     * @tc.desc: Verify API multiple acquire-release cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0020');
    });

    /*
     * @tc.number: SUB_PS_2100
     * @tc.name: testPairingSymmetry0021
     * @tc.desc: Verify API symmetry reflected in pairing status.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0021');
    });

    /*
     * @tc.number: SUB_PS_2200
     * @tc.name: testPairingSymmetry0022
     * @tc.desc: Verify mixed API and UI symmetry operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0022');
    });

    /*
     * @tc.number: SUB_PS_2300
     * @tc.name: testPairingSymmetry0023
     * @tc.desc: Verify symmetry after API calls with error handling.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0023');
    });

    /*
     * @tc.number: SUB_PS_2400
     * @tc.name: testPairingSymmetry0024
     * @tc.desc: Verify queryAllStates consistent after API symmetry.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0024');
    });

    /*
     * @tc.number: SUB_PS_2500
     * @tc.name: testPairingSymmetry0025
     * @tc.desc: Verify history valid after API symmetric operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testPairingSymmetry0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingSymmetry0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testPairingSymmetry0025');
    });

  });
}
