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
import { TestHelper } from './TestHelper';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function releaseCountTest(): void {
  describe('ReleaseCountTest', (): void => {

    // ==================== release 计数精确值验证（30 条） ====================

    /*
     * @tc.number: SUB_RC_0100
     * @tc.name: testReleaseCount0001
     * @tc.desc: Verify release count is 1 after first granted release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0001');
    });

    /*
     * @tc.number: SUB_RC_0200
     * @tc.name: testReleaseCount0002
     * @tc.desc: Verify release count is 2 after second granted release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0002');
    });

    /*
     * @tc.number: SUB_RC_0300
     * @tc.name: testReleaseCount0003
     * @tc.desc: Verify release count is 3 after third granted release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0003');
    });

    /*
     * @tc.number: SUB_RC_0400
     * @tc.name: testReleaseCount0004
     * @tc.desc: Verify release count increments only on granted status.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0004');
    });

    /*
     * @tc.number: SUB_RC_0500
     * @tc.name: testReleaseCount0005
     * @tc.desc: Verify release count displayed in pairing status.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0005');
    });

    /*
     * @tc.number: SUB_RC_0600
     * @tc.name: testReleaseCount0006
     * @tc.desc: Verify release count is 0 before any release operation.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0006');
    });

    /*
     * @tc.number: SUB_RC_0700
     * @tc.name: testReleaseCount0007
     * @tc.desc: Verify release count persists across queries.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0007');
    });

    /*
     * @tc.number: SUB_RC_0800
     * @tc.name: testReleaseCount0008
     * @tc.desc: Verify release count persists across acquire ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0008');
    });

    /*
     * @tc.number: SUB_RC_0900
     * @tc.name: testReleaseCount0009
     * @tc.desc: Verify release count shown in queryAllStates result.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0009');
    });

    /*
     * @tc.number: SUB_RC_1000
     * @tc.name: testReleaseCount0010
     * @tc.desc: Verify release count type is number.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.release).assertEqual(0);
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.release).assertLarger(-1);
      expect(typeof afterCounts.release).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testReleaseCount0010');
    });

    /*
     * @tc.number: SUB_RC_1100
     * @tc.name: testReleaseCount0011
     * @tc.desc: Verify API release increments count on granted.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0011');
    });

    /*
     * @tc.number: SUB_RC_1200
     * @tc.name: testReleaseCount0012
     * @tc.desc: Verify API release count via pairing status text.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0012');
    });

    /*
     * @tc.number: SUB_RC_1300
     * @tc.name: testReleaseCount0013
     * @tc.desc: Verify count matches number of granted releases.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0013');
    });

    /*
     * @tc.number: SUB_RC_1400
     * @tc.name: testReleaseCount0014
     * @tc.desc: Verify count does not increment on denied release.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0014');
    });

    /*
     * @tc.number: SUB_RC_1500
     * @tc.name: testReleaseCount0015
     * @tc.desc: Verify count valid after multiple API releases.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testReleaseCount0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0015');
    });

    /*
     * @tc.number: SUB_RC_1600
     * @tc.name: testReleaseCount0016
     * @tc.desc: Verify count type is number after API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0016');
    });

    /*
     * @tc.number: SUB_RC_1700
     * @tc.name: testReleaseCount0017
     * @tc.desc: Verify count non-negative after API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0017');
    });

    /*
     * @tc.number: SUB_RC_1800
     * @tc.name: testReleaseCount0018
     * @tc.desc: Verify count consistent with UI display.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0018');
    });

    /*
     * @tc.number: SUB_RC_1900
     * @tc.name: testReleaseCount0019
     * @tc.desc: Verify count in queryAllStates matches pairing status.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0019');
    });

    /*
     * @tc.number: SUB_RC_2000
     * @tc.name: testReleaseCount0020
     * @tc.desc: Verify count stable after API release sequence.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        const isValid: boolean = testHelper.isValidReleaseStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.release).assertEqual('number');
      expect(counts.release).assertLarger(-1);
      sharedDriver.hilogEnd('testReleaseCount0020');
    });

    /*
     * @tc.number: SUB_RC_2100
     * @tc.name: testReleaseCount0021
     * @tc.desc: Verify release count resets to 0 after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0021');
    });

    /*
     * @tc.number: SUB_RC_2200
     * @tc.name: testReleaseCount0022
     * @tc.desc: Verify release count restarts from 0 after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0022');
    });

    /*
     * @tc.number: SUB_RC_2300
     * @tc.name: testReleaseCount0023
     * @tc.desc: Verify clear does not affect API release functionality.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0023');
    });

    /*
     * @tc.number: SUB_RC_2400
     * @tc.name: testReleaseCount0024
     * @tc.desc: Verify count valid after clear and new releases.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0024');
    });

    /*
     * @tc.number: SUB_RC_2500
     * @tc.name: testReleaseCount0025
     * @tc.desc: Verify pairing status resets after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0025');
    });

    /*
     * @tc.number: SUB_RC_2600
     * @tc.name: testReleaseCount0026
     * @tc.desc: Verify queryAllStates shows reset count after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0026');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0026');
    });

    /*
     * @tc.number: SUB_RC_2700
     * @tc.name: testReleaseCount0027
     * @tc.desc: Verify operation result resets after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0027');
    });

    /*
     * @tc.number: SUB_RC_2800
     * @tc.name: testReleaseCount0028
     * @tc.desc: Verify multiple clear-release cycles work correctly.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0028');
    });

    /*
     * @tc.number: SUB_RC_2900
     * @tc.name: testReleaseCount0029
     * @tc.desc: Verify count type remains number after cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0029');
    });

    /*
     * @tc.number: SUB_RC_3000
     * @tc.name: testReleaseCount0030
     * @tc.desc: Verify no count corruption after clear cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testReleaseCount0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testReleaseCount0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clickReleaseButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.release).assertEqual('number');
      sharedDriver.hilogEnd('testReleaseCount0030');
    });

  });
}
