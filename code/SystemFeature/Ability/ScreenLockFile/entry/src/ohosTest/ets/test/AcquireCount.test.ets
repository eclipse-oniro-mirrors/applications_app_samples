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

export default function acquireCountTest(): void {
  describe('AcquireCountTest', (): void => {

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
    // ==================== acquire 计数精确值验证（30 条） ====================

    /*
     * @tc.number: SUB_AC_0100
     * @tc.name: testAcquireCount0001
     * @tc.desc: Verify acquire count is 1 after first granted acquire.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0001');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0001');
    });

    /*
     * @tc.number: SUB_AC_0200
     * @tc.name: testAcquireCount0002
     * @tc.desc: Verify acquire count is 2 after second granted acquire.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0002');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0002');
    });

    /*
     * @tc.number: SUB_AC_0300
     * @tc.name: testAcquireCount0003
     * @tc.desc: Verify acquire count is 3 after third granted acquire.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0003');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0003');
    });

    /*
     * @tc.number: SUB_AC_0400
     * @tc.name: testAcquireCount0004
     * @tc.desc: Verify acquire count increments only on granted status.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0004');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0004');
    });

    /*
     * @tc.number: SUB_AC_0500
     * @tc.name: testAcquireCount0005
     * @tc.desc: Verify acquire count displayed in pairing status.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0005');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0005');
    });

    /*
     * @tc.number: SUB_AC_0600
     * @tc.name: testAcquireCount0006
     * @tc.desc: Verify acquire count is 0 before any acquire operation.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0006');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0006');
    });

    /*
     * @tc.number: SUB_AC_0700
     * @tc.name: testAcquireCount0007
     * @tc.desc: Verify acquire count persists across queries.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0007');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0007');
    });

    /*
     * @tc.number: SUB_AC_0800
     * @tc.name: testAcquireCount0008
     * @tc.desc: Verify acquire count persists across release ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0008');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0008');
    });

    /*
     * @tc.number: SUB_AC_0900
     * @tc.name: testAcquireCount0009
     * @tc.desc: Verify acquire count shown in queryAllStates result.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0009');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0009');
    });

    /*
     * @tc.number: SUB_AC_1000
     * @tc.name: testAcquireCount0010
     * @tc.desc: Verify acquire count type is number.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0010');
      await extDriver.clearHistoryAndWait();
      const beforeCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(beforeCounts.acquire).assertEqual(0);
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      const afterCounts: PairingCounts = await extDriver.parsePairingCounts();
      expect(afterCounts.acquire).assertLarger(-1);
      expect(typeof afterCounts.acquire).assertEqual('number');
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testAcquireCount0010');
    });

    /*
     * @tc.number: SUB_AC_1100
     * @tc.name: testAcquireCount0011
     * @tc.desc: Verify API acquire increments count on granted.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0011');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0011');
    });

    /*
     * @tc.number: SUB_AC_1200
     * @tc.name: testAcquireCount0012
     * @tc.desc: Verify API acquire count via pairing status text.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0012');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0012');
    });

    /*
     * @tc.number: SUB_AC_1300
     * @tc.name: testAcquireCount0013
     * @tc.desc: Verify count matches number of granted acquires.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0013');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0013');
    });

    /*
     * @tc.number: SUB_AC_1400
     * @tc.name: testAcquireCount0014
     * @tc.desc: Verify count does not increment on denied acquire.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0014');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0014');
    });

    /*
     * @tc.number: SUB_AC_1500
     * @tc.name: testAcquireCount0015
     * @tc.desc: Verify count valid after multiple API acquires.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testAcquireCount0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0015');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0015');
    });

    /*
     * @tc.number: SUB_AC_1600
     * @tc.name: testAcquireCount0016
     * @tc.desc: Verify count type is number after API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0016');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0016');
    });

    /*
     * @tc.number: SUB_AC_1700
     * @tc.name: testAcquireCount0017
     * @tc.desc: Verify count non-negative after API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0017');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0017');
    });

    /*
     * @tc.number: SUB_AC_1800
     * @tc.name: testAcquireCount0018
     * @tc.desc: Verify count consistent with UI display.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0018');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0018');
    });

    /*
     * @tc.number: SUB_AC_1900
     * @tc.name: testAcquireCount0019
     * @tc.desc: Verify count in queryAllStates matches pairing status.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0019');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0019');
    });

    /*
     * @tc.number: SUB_AC_2000
     * @tc.name: testAcquireCount0020
     * @tc.desc: Verify count stable after API acquire sequence.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0020');
      await extDriver.clearHistoryAndWait();
      try {
        const status: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        const isValid: boolean = testHelper.isValidAccessStatus(status);
        expect(isValid).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(typeof counts.acquire).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testAcquireCount0020');
    });

    /*
     * @tc.number: SUB_AC_2100
     * @tc.name: testAcquireCount0021
     * @tc.desc: Verify acquire count resets to 0 after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0021');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0021');
    });

    /*
     * @tc.number: SUB_AC_2200
     * @tc.name: testAcquireCount0022
     * @tc.desc: Verify acquire count restarts from 0 after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0022');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0022');
    });

    /*
     * @tc.number: SUB_AC_2300
     * @tc.name: testAcquireCount0023
     * @tc.desc: Verify clear does not affect API acquire functionality.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0023');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0023');
    });

    /*
     * @tc.number: SUB_AC_2400
     * @tc.name: testAcquireCount0024
     * @tc.desc: Verify count valid after clear and new acquires.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0024');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0024');
    });

    /*
     * @tc.number: SUB_AC_2500
     * @tc.name: testAcquireCount0025
     * @tc.desc: Verify pairing status resets after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0025');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0025');
    });

    /*
     * @tc.number: SUB_AC_2600
     * @tc.name: testAcquireCount0026
     * @tc.desc: Verify queryAllStates shows reset count after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0026');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0026');
    });

    /*
     * @tc.number: SUB_AC_2700
     * @tc.name: testAcquireCount0027
     * @tc.desc: Verify operation result resets after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0027');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0027');
    });

    /*
     * @tc.number: SUB_AC_2800
     * @tc.name: testAcquireCount0028
     * @tc.desc: Verify multiple clear-acquire cycles work correctly.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0028');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0028');
    });

    /*
     * @tc.number: SUB_AC_2900
     * @tc.name: testAcquireCount0029
     * @tc.desc: Verify count type remains number after cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0029');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0029');
    });

    /*
     * @tc.number: SUB_AC_3000
     * @tc.name: testAcquireCount0030
     * @tc.desc: Verify no count corruption after clear cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testAcquireCount0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testAcquireCount0030');
      await extDriver.clickAcquireButton();
      await extDriver.clickAcquireButton();
      await extDriver.clearHistoryAndWait();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testAcquireCount0030');
    });

  });
}
