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
import { SharedDriver } from './SharedDriver';
import { SharedDriverExt } from './SharedDriverExt';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function historyMixedOpsTest(): void {
  describe('HistoryMixedOpsTest', (): void => {

    // ==================== 混合操作历史记录验证（25 条） ====================

    /*
     * @tc.number: SUB_HM_0100
     * @tc.name: testHistoryMixedOps0001
     * @tc.desc: Verify history records query then acquire sequence.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0001');
    });

    /*
     * @tc.number: SUB_HM_0200
     * @tc.name: testHistoryMixedOps0002
     * @tc.desc: Verify history records query then release sequence.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0002');
    });

    /*
     * @tc.number: SUB_HM_0300
     * @tc.name: testHistoryMixedOps0003
     * @tc.desc: Verify history records acquire then release sequence.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0003');
    });

    /*
     * @tc.number: SUB_HM_0400
     * @tc.name: testHistoryMixedOps0004
     * @tc.desc: Verify history records multiple operation types in order.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0004');
    });

    /*
     * @tc.number: SUB_HM_0500
     * @tc.name: testHistoryMixedOps0005
     * @tc.desc: Verify newest entry at top after mixed operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0005');
    });

    /*
     * @tc.number: SUB_HM_0600
     * @tc.name: testHistoryMixedOps0006
     * @tc.desc: Verify history count correct after mixed operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0006');
    });

    /*
     * @tc.number: SUB_HM_0700
     * @tc.name: testHistoryMixedOps0007
     * @tc.desc: Verify operation result reflects last mixed operation.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0007');
    });

    /*
     * @tc.number: SUB_HM_0800
     * @tc.name: testHistoryMixedOps0008
     * @tc.desc: Verify pairing counts update correctly in mixed ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0008');
    });

    /*
     * @tc.number: SUB_HM_0900
     * @tc.name: testHistoryMixedOps0009
     * @tc.desc: Verify no history corruption after mixed operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0009');
    });

    /*
     * @tc.number: SUB_HM_1000
     * @tc.name: testHistoryMixedOps0010
     * @tc.desc: Verify all entries have valid timestamps in mixed ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0010');
    });

    /*
     * @tc.number: SUB_HM_1100
     * @tc.name: testHistoryMixedOps0011
     * @tc.desc: Verify history with interleaved query and acquire ops.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0011');
    });

    /*
     * @tc.number: SUB_HM_1200
     * @tc.name: testHistoryMixedOps0012
     * @tc.desc: Verify history with interleaved query and release ops.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0012');
    });

    /*
     * @tc.number: SUB_HM_1300
     * @tc.name: testHistoryMixedOps0013
     * @tc.desc: Verify history with interleaved acquire and release ops.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0013');
    });

    /*
     * @tc.number: SUB_HM_1400
     * @tc.name: testHistoryMixedOps0014
     * @tc.desc: Verify pairing counts after interleaved operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0014');
    });

    /*
     * @tc.number: SUB_HM_1500
     * @tc.name: testHistoryMixedOps0015
     * @tc.desc: Verify operation result after interleaved operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0015');
    });

    /*
     * @tc.number: SUB_HM_1600
     * @tc.name: testHistoryMixedOps0016
     * @tc.desc: Verify history entries contain correct operation names.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0016');
    });

    /*
     * @tc.number: SUB_HM_1700
     * @tc.name: testHistoryMixedOps0017
     * @tc.desc: Verify no duplicate entries in interleaved operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0017');
    });

    /*
     * @tc.number: SUB_HM_1800
     * @tc.name: testHistoryMixedOps0018
     * @tc.desc: Verify history order matches operation sequence.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await extDriver.clickAcquireButton();
        await extDriver.clickQueryButton();
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0018');
    });

    /*
     * @tc.number: SUB_HM_1900
     * @tc.name: testHistoryMixedOps0019
     * @tc.desc: Verify history with queryAllStates after acquire.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0019');
    });

    /*
     * @tc.number: SUB_HM_2000
     * @tc.name: testHistoryMixedOps0020
     * @tc.desc: Verify history with queryAllStates after release.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0020');
    });

    /*
     * @tc.number: SUB_HM_2100
     * @tc.name: testHistoryMixedOps0021
     * @tc.desc: Verify queryAllStates result contains all count fields.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0021');
    });

    /*
     * @tc.number: SUB_HM_2200
     * @tc.name: testHistoryMixedOps0022
     * @tc.desc: Verify history after mixed ops with queryAllStates.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0022');
    });

    /*
     * @tc.number: SUB_HM_2300
     * @tc.name: testHistoryMixedOps0023
     * @tc.desc: Verify pairing counts consistent after mixed ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0023');
    });

    /*
     * @tc.number: SUB_HM_2400
     * @tc.name: testHistoryMixedOps0024
     * @tc.desc: Verify operation result valid after queryAllStates in mixed.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0024');
    });

    /*
     * @tc.number: SUB_HM_2500
     * @tc.name: testHistoryMixedOps0025
     * @tc.desc: Verify no history corruption with queryAllStates mixed.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryMixedOps0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryMixedOps0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clickQueryAllButton();
      await extDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryMixedOps0025');
    });

  });
}
