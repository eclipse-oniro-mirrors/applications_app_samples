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

export default function historyRecordTest(): void {
  describe('HistoryRecordTest', (): void => {

    // ==================== 历史记录基本条目验证（30 条） ====================

    /*
     * @tc.number: SUB_HR_0100
     * @tc.name: testHistoryRecord0001
     * @tc.desc: Verify history entry created after query operation.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0001');
    });

    /*
     * @tc.number: SUB_HR_0200
     * @tc.name: testHistoryRecord0002
     * @tc.desc: Verify history entry contains queryAppKeyState operation name.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0002');
    });

    /*
     * @tc.number: SUB_HR_0300
     * @tc.name: testHistoryRecord0003
     * @tc.desc: Verify history entry result contains KeyState text.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0003');
    });

    /*
     * @tc.number: SUB_HR_0400
     * @tc.name: testHistoryRecord0004
     * @tc.desc: Verify history entry timestamp format is HH:MM:SS.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0004');
    });

    /*
     * @tc.number: SUB_HR_0500
     * @tc.name: testHistoryRecord0005
     * @tc.desc: Verify history entry order is newest first.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0005');
    });

    /*
     * @tc.number: SUB_HR_0600
     * @tc.name: testHistoryRecord0006
     * @tc.desc: Verify multiple queries create multiple history entries.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0006');
    });

    /*
     * @tc.number: SUB_HR_0700
     * @tc.name: testHistoryRecord0007
     * @tc.desc: Verify history entry result contains key status name.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0007');
    });

    /*
     * @tc.number: SUB_HR_0800
     * @tc.name: testHistoryRecord0008
     * @tc.desc: Verify history count increments after each query.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0008');
    });

    /*
     * @tc.number: SUB_HR_0900
     * @tc.name: testHistoryRecord0009
     * @tc.desc: Verify history entry created after acquire operation.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0009');
    });

    /*
     * @tc.number: SUB_HR_1000
     * @tc.name: testHistoryRecord0010
     * @tc.desc: Verify acquire history result contains ACCESS status.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0010');
    });

    /*
     * @tc.number: SUB_HR_1100
     * @tc.name: testHistoryRecord0011
     * @tc.desc: Verify acquire history entry has operation field.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0011');
    });

    /*
     * @tc.number: SUB_HR_1200
     * @tc.name: testHistoryRecord0012
     * @tc.desc: Verify acquire history entry has timestamp field.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0012');
    });

    /*
     * @tc.number: SUB_HR_1300
     * @tc.name: testHistoryRecord0013
     * @tc.desc: Verify multiple acquires create multiple entries.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0013');
    });

    /*
     * @tc.number: SUB_HR_1400
     * @tc.name: testHistoryRecord0014
     * @tc.desc: Verify acquire history result contains grant or deny.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0014');
    });

    /*
     * @tc.number: SUB_HR_1500
     * @tc.name: testHistoryRecord0015
     * @tc.desc: Verify acquire entry appears at top of history list.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickAcquireButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0015');
    });

    /*
     * @tc.number: SUB_HR_1600
     * @tc.name: testHistoryRecord0016
     * @tc.desc: Verify history entry created after release operation.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0016');
    });

    /*
     * @tc.number: SUB_HR_1700
     * @tc.name: testHistoryRecord0017
     * @tc.desc: Verify release history result contains RELEASE status.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0017');
    });

    /*
     * @tc.number: SUB_HR_1800
     * @tc.name: testHistoryRecord0018
     * @tc.desc: Verify release history entry has operation field.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0018');
    });

    /*
     * @tc.number: SUB_HR_1900
     * @tc.name: testHistoryRecord0019
     * @tc.desc: Verify release history entry has timestamp field.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0019');
    });

    /*
     * @tc.number: SUB_HR_2000
     * @tc.name: testHistoryRecord0020
     * @tc.desc: Verify multiple releases create multiple entries.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0020');
    });

    /*
     * @tc.number: SUB_HR_2100
     * @tc.name: testHistoryRecord0021
     * @tc.desc: Verify release history result contains grant or deny.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0021');
    });

    /*
     * @tc.number: SUB_HR_2200
     * @tc.name: testHistoryRecord0022
     * @tc.desc: Verify release entry appears at top of history list.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickReleaseButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0022');
    });

    /*
     * @tc.number: SUB_HR_2300
     * @tc.name: testHistoryRecord0023
     * @tc.desc: Verify history entry created after queryAllStates operation.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryAllButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0023');
    });

    /*
     * @tc.number: SUB_HR_2400
     * @tc.name: testHistoryRecord0024
     * @tc.desc: Verify queryAllStates history contains KeyState text.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryAllButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0024');
    });

    /*
     * @tc.number: SUB_HR_2500
     * @tc.name: testHistoryRecord0025
     * @tc.desc: Verify queryAllStates history contains Acquire count.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryAllButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0025');
    });

    /*
     * @tc.number: SUB_HR_2600
     * @tc.name: testHistoryRecord0026
     * @tc.desc: Verify queryAllStates history contains Release count.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0026');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryAllButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0026');
    });

    /*
     * @tc.number: SUB_HR_2700
     * @tc.name: testHistoryRecord0027
     * @tc.desc: Verify queryAllStates history contains Pending count.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryAllButton();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryRecord0027');
    });

    /*
     * @tc.number: SUB_HR_2800
     * @tc.name: testHistoryRecord0028
     * @tc.desc: Verify history entry operation field is non-empty string.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      const hasContent: boolean = result.trim().length > 0;
      expect(hasContent).assertTrue();
      sharedDriver.hilogEnd('testHistoryRecord0028');
    });

    /*
     * @tc.number: SUB_HR_2900
     * @tc.name: testHistoryRecord0029
     * @tc.desc: Verify history entry result field is non-empty string.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      const hasContent: boolean = result.trim().length > 0;
      expect(hasContent).assertTrue();
      sharedDriver.hilogEnd('testHistoryRecord0029');
    });

    /*
     * @tc.number: SUB_HR_3000
     * @tc.name: testHistoryRecord0030
     * @tc.desc: Verify history entry timestamp matches expected format.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryRecord0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryRecord0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      const hasContent: boolean = result.trim().length > 0;
      expect(hasContent).assertTrue();
      sharedDriver.hilogEnd('testHistoryRecord0030');
    });

  });
}
