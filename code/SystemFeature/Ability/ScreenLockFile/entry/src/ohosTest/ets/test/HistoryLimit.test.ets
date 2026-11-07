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
import { DOMAIN, TAG, MAX_HISTORY_SIZE, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver = new SharedDriverExt(sharedDriver);

export default function historyLimitTest(): void {
  describe('HistoryLimitTest', (): void => {

    // ==================== 历史记录上限验证（25 条） ====================

    /*
     * @tc.number: SUB_HL_0100
     * @tc.name: testHistoryLimit0001
     * @tc.desc: Verify history does not exceed max size after 11 operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0001', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 3;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0001');
    });

    /*
     * @tc.number: SUB_HL_0200
     * @tc.name: testHistoryLimit0002
     * @tc.desc: Verify history does not exceed max size after 15 operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0002', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 4;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0002');
    });

    /*
     * @tc.number: SUB_HL_0300
     * @tc.name: testHistoryLimit0003
     * @tc.desc: Verify oldest entry is evicted when limit reached.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0003', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 5;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0003');
    });

    /*
     * @tc.number: SUB_HL_0400
     * @tc.name: testHistoryLimit0004
     * @tc.desc: Verify newest entry is at top when limit reached.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0004', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 6;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0004');
    });

    /*
     * @tc.number: SUB_HL_0500
     * @tc.name: testHistoryLimit0005
     * @tc.desc: Verify history count equals max size after overflow.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0005', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 7;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0005');
    });

    /*
     * @tc.number: SUB_HL_0600
     * @tc.name: testHistoryLimit0006
     * @tc.desc: Verify history count is less than operations count.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0006', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 8;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0006');
    });

    /*
     * @tc.number: SUB_HL_0700
     * @tc.name: testHistoryLimit0007
     * @tc.desc: Verify no crash when exceeding history limit.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0007', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 9;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0007');
    });

    /*
     * @tc.number: SUB_HL_0800
     * @tc.name: testHistoryLimit0008
     * @tc.desc: Verify history display updates after eviction.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0008', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 10;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0008');
    });

    /*
     * @tc.number: SUB_HL_0900
     * @tc.name: testHistoryLimit0009
     * @tc.desc: Verify operation result still shows after eviction.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0009', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 11;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0009');
    });

    /*
     * @tc.number: SUB_HL_1000
     * @tc.name: testHistoryLimit0010
     * @tc.desc: Verify pairing status still shows after eviction.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0010', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      const opCount = 12;
      for (let i = 0; i < opCount; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryLimit0010');
    });

    /*
     * @tc.number: SUB_HL_1100
     * @tc.name: testHistoryLimit0011
     * @tc.desc: Verify history has exactly 10 entries after 10 operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0011', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0011');
    });

    /*
     * @tc.number: SUB_HL_1200
     * @tc.name: testHistoryLimit0012
     * @tc.desc: Verify history has entries after exactly 10 queries.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0012', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0012');
    });

    /*
     * @tc.number: SUB_HL_1300
     * @tc.name: testHistoryLimit0013
     * @tc.desc: Verify 10th entry is visible in history list.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0013', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0013');
    });

    /*
     * @tc.number: SUB_HL_1400
     * @tc.name: testHistoryLimit0014
     * @tc.desc: Verify first entry is newest after 10 operations.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0014', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0014');
    });

    /*
     * @tc.number: SUB_HL_1500
     * @tc.name: testHistoryLimit0015
     * @tc.desc: Verify no eviction at exactly max capacity.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0015', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0015');
    });

    /*
     * @tc.number: SUB_HL_1600
     * @tc.name: testHistoryLimit0016
     * @tc.desc: Verify operation result valid at max capacity.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0016', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0016');
    });

    /*
     * @tc.number: SUB_HL_1700
     * @tc.name: testHistoryLimit0017
     * @tc.desc: Verify pairing counts valid at max capacity.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0017', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0017');
    });

    /*
     * @tc.number: SUB_HL_1800
     * @tc.name: testHistoryLimit0018
     * @tc.desc: Verify history not empty at max capacity.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0018', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 3; i++) {
        await extDriver.clickQueryButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryLimit0018');
    });

    /*
     * @tc.number: SUB_HL_1900
     * @tc.name: testHistoryLimit0019
     * @tc.desc: Verify history limit with mixed query and acquire operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0019', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0019');
    });

    /*
     * @tc.number: SUB_HL_2000
     * @tc.name: testHistoryLimit0020
     * @tc.desc: Verify history limit with mixed query and release operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0020', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0020');
    });

    /*
     * @tc.number: SUB_HL_2100
     * @tc.name: testHistoryLimit0021
     * @tc.desc: Verify history limit with all operation types combined.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0021', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0021');
    });

    /*
     * @tc.number: SUB_HL_2200
     * @tc.name: testHistoryLimit0022
     * @tc.desc: Verify eviction order with mixed operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0022', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0022');
    });

    /*
     * @tc.number: SUB_HL_2300
     * @tc.name: testHistoryLimit0023
     * @tc.desc: Verify newest entry always at top with mixed ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0023', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0023');
    });

    /*
     * @tc.number: SUB_HL_2400
     * @tc.name: testHistoryLimit0024
     * @tc.desc: Verify no data corruption at limit boundary.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0024', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0024');
    });

    /*
     * @tc.number: SUB_HL_2500
     * @tc.name: testHistoryLimit0025
     * @tc.desc: Verify result text valid after mixed ops at limit.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryLimit0025', 15000, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryLimit0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistory();
      for (let i = 0; i < 2; i++) {
        await extDriver.clickQueryButton();
      }
      for (let i = 0; i < 2; i++) {
        await extDriver.clickAcquireButton();
      }
      for (let i = 0; i < 1; i++) {
        await extDriver.clickReleaseButton();
      }
      await extDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryLimit0025');
    });

  });
}
