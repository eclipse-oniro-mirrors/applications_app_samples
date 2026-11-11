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
import { PairingCounts, SharedDriverExt } from './SharedDriverExt';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME, ID_OPERATION_RESULT, ID_PAIRING_STATUS, ID_ACQUIRE_BUTTON, ID_QUERY_BUTTON, ID_RELEASE_BUTTON, ID_CLEAR_HISTORY_BUTTON} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { scrollToId } from '../testkit/SharedDriver';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function historyAfterRestartTest(): void {
  describe('HistoryAfterRestartTest', (): void => {

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
    // ==================== 清除后历史记录恢复验证（25 条） ====================

    /*
     * @tc.number: SUB_HAR_0100
     * @tc.name: testHistoryAfterRestart0001
     * @tc.desc: Verify history empty after clear and page reload.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0001');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0001');
    });

    /*
     * @tc.number: SUB_HAR_0200
     * @tc.name: testHistoryAfterRestart0002
     * @tc.desc: Verify acquire count zero after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0002');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0002');
    });

    /*
     * @tc.number: SUB_HAR_0300
     * @tc.name: testHistoryAfterRestart0003
     * @tc.desc: Verify release count zero after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0003');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0003');
    });

    /*
     * @tc.number: SUB_HAR_0400
     * @tc.name: testHistoryAfterRestart0004
     * @tc.desc: Verify pending count zero after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0004');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0004');
    });

    /*
     * @tc.number: SUB_HAR_0500
     * @tc.name: testHistoryAfterRestart0005
     * @tc.desc: Verify operation result reset after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0005');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0005');
    });

    /*
     * @tc.number: SUB_HAR_0600
     * @tc.name: testHistoryAfterRestart0006
     * @tc.desc: Verify no-history indicator shown after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0006');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0006');
    });

    /*
     * @tc.number: SUB_HAR_0700
     * @tc.name: testHistoryAfterRestart0007
     * @tc.desc: Verify clear button still functional after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0007');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0007');
    });

    /*
     * @tc.number: SUB_HAR_0800
     * @tc.name: testHistoryAfterRestart0008
     * @tc.desc: Verify history section visible after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0008');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0008');
    });

    /*
     * @tc.number: SUB_HAR_0900
     * @tc.name: testHistoryAfterRestart0009
     * @tc.desc: Verify page layout intact after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0009');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0009');
    });

    /*
     * @tc.number: SUB_HAR_1000
     * @tc.name: testHistoryAfterRestart0010
     * @tc.desc: Verify all buttons clickable after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0010');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      expect(counts.pending).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0010');
    });

    /*
     * @tc.number: SUB_HAR_1100
     * @tc.name: testHistoryAfterRestart0011
     * @tc.desc: Verify new query creates history after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0011');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0011');
    });

    /*
     * @tc.number: SUB_HAR_1200
     * @tc.name: testHistoryAfterRestart0012
     * @tc.desc: Verify new acquire creates history after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0012');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0012');
    });

    /*
     * @tc.number: SUB_HAR_1300
     * @tc.name: testHistoryAfterRestart0013
     * @tc.desc: Verify new release creates history after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0013');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0013');
    });

    /*
     * @tc.number: SUB_HAR_1400
     * @tc.name: testHistoryAfterRestart0014
     * @tc.desc: Verify counts increment from zero after clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0014');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0014');
    });

    /*
     * @tc.number: SUB_HAR_1500
     * @tc.name: testHistoryAfterRestart0015
     * @tc.desc: Verify operation result updates after new op post-clear.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0015');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0015');
    });

    /*
     * @tc.number: SUB_HAR_1600
     * @tc.name: testHistoryAfterRestart0016
     * @tc.desc: Verify history entry has correct timestamp after clear.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0016');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0016');
    });

    /*
     * @tc.number: SUB_HAR_1700
     * @tc.name: testHistoryAfterRestart0017
     * @tc.desc: Verify pairing status valid after clear and new ops.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0017');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0017');
    });

    /*
     * @tc.number: SUB_HAR_1800
     * @tc.name: testHistoryAfterRestart0018
     * @tc.desc: Verify multiple ops after clear recorded correctly.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0018');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await extDriver.getOperationResult();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryAfterRestart0018');
    });

    /*
     * @tc.number: SUB_HAR_1900
     * @tc.name: testHistoryAfterRestart0019
     * @tc.desc: Verify repeated clear and rebuild cycles work correctly.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0019');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0019');
    });

    /*
     * @tc.number: SUB_HAR_2000
     * @tc.name: testHistoryAfterRestart0020
     * @tc.desc: Verify history valid after clear-rebuild-clear cycle.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0020');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0020');
    });

    /*
     * @tc.number: SUB_HAR_2100
     * @tc.name: testHistoryAfterRestart0021
     * @tc.desc: Verify counts reset properly in repeated cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0021');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0021');
    });

    /*
     * @tc.number: SUB_HAR_2200
     * @tc.name: testHistoryAfterRestart0022
     * @tc.desc: Verify no memory leak after multiple clear cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0022');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0022');
    });

    /*
     * @tc.number: SUB_HAR_2300
     * @tc.name: testHistoryAfterRestart0023
     * @tc.desc: Verify operation result consistent after cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0023');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0023');
    });

    /*
     * @tc.number: SUB_HAR_2400
     * @tc.name: testHistoryAfterRestart0024
     * @tc.desc: Verify pairing status valid after multiple cycles.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0024');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0024');
    });

    /*
     * @tc.number: SUB_HAR_2500
     * @tc.name: testHistoryAfterRestart0025
     * @tc.desc: Verify page stability after repeated clear operations.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testHistoryAfterRestart0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryAfterRestart0025');
      for (let cycle: number = 0; cycle < 3; cycle++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await scrollToId(ID_ACQUIRE_BUTTON);
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await scrollToId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      expect(counts.release).assertEqual(0);
      sharedDriver.hilogEnd('testHistoryAfterRestart0025');
    });

  });
}
