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
import { BusinessError } from '@kit.BasicServicesKit';
import { SharedDriver } from './SharedDriver';
import { SharedDriverExt } from './SharedDriverExt';
import { TestHelper } from './TestHelper';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
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

export default function errorUIImpactTest(): void {
  describe('ErrorUIImpactTest', (): void => {

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
    // ==================== 错误 UI 影响验证（25 条） ====================

    /*
     * @tc.number: SUB_EUI_0100
     * @tc.name: testErrorUIImpact0001
     * @tc.desc: Verify ErrorUIImpact scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0001');
      const q = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      const qa = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testErrorUIImpact0001');
    });

    /*
     * @tc.number: SUB_EUI_0200
     * @tc.name: testErrorUIImpact0002
     * @tc.desc: Verify ErrorUIImpact scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0002');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      const exists = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(exists).assertTrue();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0002');
    });

    /*
     * @tc.number: SUB_EUI_0300
     * @tc.name: testErrorUIImpact0003
     * @tc.desc: Verify ErrorUIImpact scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0003');
      await scrollToId(ID_OPERATION_RESULT)
      const exists = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(exists).assertTrue();
      const text = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0003');
    });

    /*
     * @tc.number: SUB_EUI_0400
     * @tc.name: testErrorUIImpact0004
     * @tc.desc: Verify ErrorUIImpact scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0004');
      await scrollToId(ID_PAIRING_STATUS)
      const exists = await sharedDriver.existsId(ID_PAIRING_STATUS);
      expect(exists).assertTrue();
      const text = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testErrorUIImpact0004');
    });

    /*
     * @tc.number: SUB_EUI_0500
     * @tc.name: testErrorUIImpact0005
     * @tc.desc: Verify ErrorUIImpact scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0005');
      await scrollToId(ID_OPERATION_RESULT)
      const before = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const after = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(after.includes('queryAppKeyState')).assertTrue();
      expect(before !== after).assertTrue();
      expect(after.length).assertLarger(0);
      sharedDriver.hilogEnd('testErrorUIImpact0005');
    });

    /*
     * @tc.number: SUB_EUI_0600
     * @tc.name: testErrorUIImpact0006
     * @tc.desc: Verify ErrorUIImpact scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0006');
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess') || result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0006');
    });

    /*
     * @tc.number: SUB_EUI_0700
     * @tc.name: testErrorUIImpact0007
     * @tc.desc: Verify ErrorUIImpact scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0007');
      testHelper.acquireAccess();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess') || result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0007');
    });

    /*
     * @tc.number: SUB_EUI_0800
     * @tc.name: testErrorUIImpact0008
     * @tc.desc: Verify ErrorUIImpact scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0008');
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(typeof counts.acquire).assertEqual('number');
      expect(typeof counts.pending).assertEqual('number');
      sharedDriver.hilogEnd('testErrorUIImpact0008');
    });

    /*
     * @tc.number: SUB_EUI_0900
     * @tc.name: testErrorUIImpact0009
     * @tc.desc: Verify ErrorUIImpact scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0009');
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testErrorUIImpact0009');
    });

    /*
     * @tc.number: SUB_EUI_1000
     * @tc.name: testErrorUIImpact0010
     * @tc.desc: Verify ErrorUIImpact scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0010');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const counts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      sharedDriver.hilogEnd('testErrorUIImpact0010');
    });

    /*
     * @tc.number: SUB_EUI_1100
     * @tc.name: testErrorUIImpact0011
     * @tc.desc: Verify ErrorUIImpact scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0011');
      const result = await extDriver.clickQueryAllButton();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testErrorUIImpact0011');
    });

    /*
     * @tc.number: SUB_EUI_1200
     * @tc.name: testErrorUIImpact0012
     * @tc.desc: Verify ErrorUIImpact scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0012');
      await scrollToId(ID_RELEASE_BUTTON)
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      const hasContent = result.includes('releaseAccess') || result.includes('RELEASE_') ||
        result.includes('Error');
      expect(hasContent).assertFalse();
      sharedDriver.hilogEnd('testErrorUIImpact0012');
    });

    /*
     * @tc.number: SUB_EUI_1300
     * @tc.name: testErrorUIImpact0013
     * @tc.desc: Verify ErrorUIImpact scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0013');
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const qResult = await textOfId(ID_OPERATION_RESULT);
      expect(qResult.includes('queryAppKeyState')).assertTrue();
      expect(qResult.length).assertLarger(0);
      expect(typeof qResult).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0013');
    });

    /*
     * @tc.number: SUB_EUI_1400
     * @tc.name: testErrorUIImpact0014
     * @tc.desc: Verify ErrorUIImpact scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0014');
      const text = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      const acquireMatch = new RegExp('Acquire:\\s*\\d+');
      const releaseMatch = new RegExp('Release:\\s*\\d+');
      const pendingMatch = new RegExp('Pending:\\s*\\d+');
      expect(acquireMatch.test(text)).assertTrue();
      expect(releaseMatch.test(text)).assertTrue();
      expect(pendingMatch.test(text)).assertTrue();
      sharedDriver.hilogEnd('testErrorUIImpact0014');
    });

    /*
     * @tc.number: SUB_EUI_1500
     * @tc.name: testErrorUIImpact0015
     * @tc.desc: Verify ErrorUIImpact scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0015');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r1 = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      const r2 = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r1).assertEqual(r2);
      expect(r1.length).assertLarger(0);
      expect(typeof r1).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0015');
    });

    /*
     * @tc.number: SUB_EUI_1600
     * @tc.name: testErrorUIImpact0016
     * @tc.desc: Verify ErrorUIImpact scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0016');
      await extDriver.clearHistoryAndWait();
      const valid = await extDriver.verifyHistoryMaxSize();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      sharedDriver.hilogEnd('testErrorUIImpact0016');
    });

    /*
     * @tc.number: SUB_EUI_1700
     * @tc.name: testErrorUIImpact0017
     * @tc.desc: Verify ErrorUIImpact scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0017');
      await extDriver.clearHistoryAndWait();
      const noHist = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      const isEmpty = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorUIImpact0017');
    });

    /*
     * @tc.number: SUB_EUI_1800
     * @tc.name: testErrorUIImpact0018
     * @tc.desc: Verify ErrorUIImpact scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0018');
      const latency = await extDriver.measureOperationLatency(ID_QUERY_BUTTON);
      expect(latency).assertLarger(-1);
      expect(typeof latency).assertEqual('number');
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testErrorUIImpact0018');
    });

    /*
     * @tc.number: SUB_EUI_1900
     * @tc.name: testErrorUIImpact0019
     * @tc.desc: Verify ErrorUIImpact scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0019');
      const latencies = await extDriver.measureMultipleLatencies(ID_QUERY_BUTTON, 3);
      expect(latencies.length).assertEqual(3);
      expect(typeof latencies[0]).assertEqual('number');
      expect(latencies[0]).assertLarger(-1);
      sharedDriver.hilogEnd('testErrorUIImpact0019');
    });

    /*
     * @tc.number: SUB_EUI_2000
     * @tc.name: testErrorUIImpact0020
     * @tc.desc: Verify ErrorUIImpact scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0020');
      const visible = await extDriver.waitForComponentVisible(ID_OPERATION_RESULT, 5000);
      expect(visible).assertTrue();
      const text = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0020');
    });

    /*
     * @tc.number: SUB_EUI_2100
     * @tc.name: testErrorUIImpact0021
     * @tc.desc: Verify ErrorUIImpact scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0021');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const contains = await extDriver.verifyResultContains('queryAppKeyState');
      expect(contains).assertTrue();
      expect(typeof contains).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorUIImpact0021');
    });

    /*
     * @tc.number: SUB_EUI_2200
     * @tc.name: testErrorUIImpact0022
     * @tc.desc: Verify ErrorUIImpact scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0022');
      await extDriver.clearHistoryAndWait();
      const notContains = await extDriver.verifyResultNotContains('queryAppKeyState');
      expect(notContains).assertTrue();
      expect(typeof notContains).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorUIImpact0022');
    });

    /*
     * @tc.number: SUB_EUI_2300
     * @tc.name: testErrorUIImpact0023
     * @tc.desc: Verify ErrorUIImpact scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0023');
      const results = await extDriver.getResultTextBeforeAndAfter(ID_QUERY_BUTTON);
      expect(results.length).assertEqual(2);
      expect(typeof results[0]).assertEqual('string');
      expect(typeof results[1]).assertEqual('string');
      sharedDriver.hilogEnd('testErrorUIImpact0023');
    });

    /*
     * @tc.number: SUB_EUI_2400
     * @tc.name: testErrorUIImpact0024
     * @tc.desc: Verify ErrorUIImpact scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0024');
      const hasText = await extDriver.verifyComponentContainsText(ID_PAIRING_STATUS, 'Acquire:');
      expect(hasText).assertTrue();
      expect(typeof hasText).assertEqual('boolean');
      const hasRelease = await extDriver.verifyComponentContainsText(ID_PAIRING_STATUS, 'Release:');
      expect(hasRelease).assertTrue();
      sharedDriver.hilogEnd('testErrorUIImpact0024');
    });

    /*
     * @tc.number: SUB_EUI_2500
     * @tc.name: testErrorUIImpact0025
     * @tc.desc: Verify ErrorUIImpact scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorUIImpact0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorUIImpact0025');
      await extDriver.clearHistoryAndWait();
      const qResult = await extDriver.clickQueryButton();
      expect(qResult.includes('queryAppKeyState')).assertTrue();
      const aResult = await extDriver.clickAcquireButton();
      expect(aResult.includes('acquireAccess')).assertTrue();
      const rResult = await extDriver.clickReleaseButton();
      expect(rResult.includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testErrorUIImpact0025');
    });
  });
}
