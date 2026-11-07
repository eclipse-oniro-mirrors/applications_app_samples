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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { SharedDriverExt } from './SharedDriverExt';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver = new SharedDriverExt(sharedDriver);

export default function historyClearTest(): void {
  describe('HistoryClearTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitTimeout();
    });

    afterEach(async (): Promise<void> => {
      await sharedDriver.waitUiIdle();
    });

    // ==================== 历史清除功能验证（25 条） ====================

    /*
     * @tc.number: SUB_HC_0100
     * @tc.name: testHistoryClear0001
     * @tc.desc: Verify clear history makes history empty.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0001');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0001');
    });

    /*
     * @tc.number: SUB_HC_0200
     * @tc.name: testHistoryClear0002
     * @tc.desc: Verify clear history shows no-history indicator.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0002');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0002');
    });

    /*
     * @tc.number: SUB_HC_0300
     * @tc.name: testHistoryClear0003
     * @tc.desc: Verify clear history resets acquire count to zero.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0003');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0003');
    });

    /*
     * @tc.number: SUB_HC_0400
     * @tc.name: testHistoryClear0004
     * @tc.desc: Verify clear history resets release count to zero.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0004');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0004');
    });

    /*
     * @tc.number: SUB_HC_0500
     * @tc.name: testHistoryClear0005
     * @tc.desc: Verify clear history resets pending count to zero.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0005');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0005');
    });

    /*
     * @tc.number: SUB_HC_0600
     * @tc.name: testHistoryClear0006
     * @tc.desc: Verify clear history resets operation result to ready.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0006');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0006');
    });

    /*
     * @tc.number: SUB_HC_0700
     * @tc.name: testHistoryClear0007
     * @tc.desc: Verify clear after single query clears history.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0007');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0007');
    });

    /*
     * @tc.number: SUB_HC_0800
     * @tc.name: testHistoryClear0008
     * @tc.desc: Verify clear after multiple queries clears history.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0008');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0008');
    });

    /*
     * @tc.number: SUB_HC_0900
     * @tc.name: testHistoryClear0009
     * @tc.desc: Verify clear after acquire operations clears history.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0009');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0009');
    });

    /*
     * @tc.number: SUB_HC_1000
     * @tc.name: testHistoryClear0010
     * @tc.desc: Verify clear after release operations clears history.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0010');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clickAcquireButton();
      await extDriver.clickReleaseButton();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryClear0010');
    });

    /*
     * @tc.number: SUB_HC_1100
     * @tc.name: testHistoryClear0011
     * @tc.desc: Verify new query after clear creates history entry.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0011');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0011');
    });

    /*
     * @tc.number: SUB_HC_1200
     * @tc.name: testHistoryClear0012
     * @tc.desc: Verify new acquire after clear creates history entry.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0012');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0012');
    });

    /*
     * @tc.number: SUB_HC_1300
     * @tc.name: testHistoryClear0013
     * @tc.desc: Verify new release after clear creates history entry.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0013');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0013');
    });

    /*
     * @tc.number: SUB_HC_1400
     * @tc.name: testHistoryClear0014
     * @tc.desc: Verify counts reset and increment correctly after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0014');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0014');
    });

    /*
     * @tc.number: SUB_HC_1500
     * @tc.name: testHistoryClear0015
     * @tc.desc: Verify operation result updates after clear and new op.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryClear0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0015');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0015');
    });

    /*
     * @tc.number: SUB_HC_1600
     * @tc.name: testHistoryClear0016
     * @tc.desc: Verify history not empty after clear and new query.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0016');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0016');
    });

    /*
     * @tc.number: SUB_HC_1700
     * @tc.name: testHistoryClear0017
     * @tc.desc: Verify pairing status updates after clear and new ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0017');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0017');
    });

    /*
     * @tc.number: SUB_HC_1800
     * @tc.name: testHistoryClear0018
     * @tc.desc: Verify clear does not affect subsequent API calls.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0018');
      await sharedDriver.waitUiIdle();
      await extDriver.clickQueryButton();
      await extDriver.clearHistoryAndWait();
      await extDriver.clickQueryButton();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const result = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryClear0018');
    });

    /*
     * @tc.number: SUB_HC_1900
     * @tc.name: testHistoryClear0019
     * @tc.desc: Verify double clear does not cause errors.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0019');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0019');
    });

    /*
     * @tc.number: SUB_HC_2000
     * @tc.name: testHistoryClear0020
     * @tc.desc: Verify clear on already empty history is safe.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0020');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0020');
    });

    /*
     * @tc.number: SUB_HC_2100
     * @tc.name: testHistoryClear0021
     * @tc.desc: Verify clear resets result text to initial state.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0021');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0021');
    });

    /*
     * @tc.number: SUB_HC_2200
     * @tc.name: testHistoryClear0022
     * @tc.desc: Verify clear button component exists.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0022');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0022');
    });

    /*
     * @tc.number: SUB_HC_2300
     * @tc.name: testHistoryClear0023
     * @tc.desc: Verify history section visible after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0023');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0023');
    });

    /*
     * @tc.number: SUB_HC_2400
     * @tc.name: testHistoryClear0024
     * @tc.desc: Verify no crash after rapid clear operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0024');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0024');
    });

    /*
     * @tc.number: SUB_HC_2500
     * @tc.name: testHistoryClear0025
     * @tc.desc: Verify clear preserves page layout integrity.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryClear0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryClear0025');
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await extDriver.clearHistoryAndWait();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const exists = await sharedDriver.existsId('clearHistoryButton');
      expect(exists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryClear0025');
    });

  });
}
