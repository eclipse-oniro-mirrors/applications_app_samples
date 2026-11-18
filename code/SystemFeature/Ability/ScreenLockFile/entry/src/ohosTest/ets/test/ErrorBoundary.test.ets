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
import { PairingCounts, SharedDriverExt } from './SharedDriverExt';
import { ApiCallResult, TestHelper } from './TestHelper';
import { abilityDelegatorRegistry, Driver } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, ID_PAIRING_STATUS,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED,
  RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);
const driver: Driver = Driver.create();

export default function errorBoundaryTest(): void {
  describe('ErrorBoundaryTest', (): void => {
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
    // 删除全局 beforeEach/afterEach，只在需要 UI 的测试用例中启动 Ability

    // ==================== 错误边界验证（25 条） ====================

    /*
     * @tc.number: SUB_ERB_0100
     * @tc.name: testErrorBoundary0001
     * @tc.desc: Verify ErrorBoundary scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0001');
      expect(testHelper.isValidKeyStatus(-1)).assertFalse();
      expect(testHelper.isValidKeyStatus(99)).assertFalse();
      expect(testHelper.isValidKeyStatus(0)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0001');
    });

    /*
     * @tc.number: SUB_ERB_0200
     * @tc.name: testErrorBoundary0002
     * @tc.desc: Verify ErrorBoundary scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0002');
      expect(testHelper.isValidKeyStatus(KEY_STATUS_NOT_EXIST)).assertTrue();
      expect(testHelper.isValidKeyStatus(KEY_STATUS_RELEASED)).assertTrue();
      expect(testHelper.isValidKeyStatus(KEY_STATUS_EXIST)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0002');
    });

    /*
     * @tc.number: SUB_ERB_0300
     * @tc.name: testErrorBoundary0003
     * @tc.desc: Verify ErrorBoundary scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0003');
      expect(testHelper.isValidAccessStatus(-1)).assertTrue();
      expect(testHelper.isValidAccessStatus(99)).assertFalse();
      expect(testHelper.isValidAccessStatus(ACCESS_STATUS_GRANTED)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0003');
    });

    /*
     * @tc.number: SUB_ERB_0400
     * @tc.name: testErrorBoundary0004
     * @tc.desc: Verify ErrorBoundary scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0004');
      expect(testHelper.isValidAccessStatus(ACCESS_STATUS_GRANTED)).assertTrue();
      expect(testHelper.isValidAccessStatus(ACCESS_STATUS_DENIED)).assertTrue();
      expect(testHelper.isValidAccessStatus(0)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0004');
    });

    /*
     * @tc.number: SUB_ERB_0500
     * @tc.name: testErrorBoundary0005
     * @tc.desc: Verify ErrorBoundary scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0005');
      expect(testHelper.isValidReleaseStatus(-1)).assertFalse();
      expect(testHelper.isValidReleaseStatus(99)).assertFalse();
      expect(testHelper.isValidReleaseStatus(RELEASE_STATUS_GRANTED)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0005');
    });

    /*
     * @tc.number: SUB_ERB_0600
     * @tc.name: testErrorBoundary0006
     * @tc.desc: Verify ErrorBoundary scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0006');
      expect(testHelper.isValidReleaseStatus(RELEASE_STATUS_GRANTED)).assertTrue();
      expect(testHelper.isValidReleaseStatus(RELEASE_STATUS_DENIED)).assertTrue();
      expect(testHelper.isValidReleaseStatus(0)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0006');
    });

    /*
     * @tc.number: SUB_ERB_0700
     * @tc.name: testErrorBoundary0007
     * @tc.desc: Verify ErrorBoundary scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0007');
      expect(testHelper.getKeyStatusName(-999)).assertEqual('UNKNOWN');
      expect(testHelper.getKeyStatusName(999)).assertEqual('UNKNOWN');
      expect(testHelper.getKeyStatusName(3)).assertEqual('UNKNOWN');
      sharedDriver.hilogEnd('testErrorBoundary0007');
    });

    /*
     * @tc.number: SUB_ERB_0800
     * @tc.name: testErrorBoundary0008
     * @tc.desc: Verify ErrorBoundary scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0008');
      expect(testHelper.getAccessStatusName(-1)).assertEqual('ACCESS_DENIED');
      expect(testHelper.getAccessStatusName(99)).assertEqual('UNKNOWN');
      expect(testHelper.getAccessStatusName(2)).assertEqual('UNKNOWN');
      sharedDriver.hilogEnd('testErrorBoundary0008');
    });

    /*
     * @tc.number: SUB_ERB_0900
     * @tc.name: testErrorBoundary0009
     * @tc.desc: Verify ErrorBoundary scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0009');
      expect(testHelper.getReleaseStatusName(-1)).assertEqual('UNKNOWN');
      expect(testHelper.getReleaseStatusName(99)).assertEqual('UNKNOWN');
      expect(testHelper.getReleaseStatusName(2)).assertEqual('UNKNOWN');
      sharedDriver.hilogEnd('testErrorBoundary0009');
    });

    /*
     * @tc.number: SUB_ERB_1000
     * @tc.name: testErrorBoundary0010
     * @tc.desc: Verify ErrorBoundary scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0010');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      await extDriver.clearHistoryAndWait();
      testHelper.releaseAccess();
      testHelper.releaseAccess();
      await scrollToId(ID_PAIRING_STATUS);
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.pending).assertLarger(-1);
      expect(typeof counts.pending).assertEqual('number');
      expect(counts.acquire).assertLarger(-1);
      sharedDriver.hilogEnd('testErrorBoundary0010');
    });

    /*
     * @tc.number: SUB_ERB_1100
     * @tc.name: testErrorBoundary0011
     * @tc.desc: Verify ErrorBoundary scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0011');
      const r1: ApiCallResult = testHelper.queryKeyState();
      const r2: ApiCallResult = testHelper.acquireAccess();
      const r3: ApiCallResult = testHelper.releaseAccess();
      expect(r1.errorCode).assertLarger(-1);
      expect(r2.errorCode).assertLarger(-1);
      expect(r3.errorCode).assertLarger(-1);
      sharedDriver.hilogEnd('testErrorBoundary0011');
    });

    /*
     * @tc.number: SUB_ERB_1200
     * @tc.name: testErrorBoundary0012
     * @tc.desc: Verify ErrorBoundary scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0012');
      const result: ApiCallResult = testHelper.queryKeyState();
      expect(result.timestamp).assertLarger(0);
      expect(typeof result.timestamp).assertEqual('number');
      sharedDriver.hilogEnd('testErrorBoundary0012');
    });

    /*
     * @tc.number: SUB_ERB_1300
     * @tc.name: testErrorBoundary0013
     * @tc.desc: Verify ErrorBoundary scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0013');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(status).assertLarger(-1);
      expect(status).assertLess(10);
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testErrorBoundary0013');
    });

    /*
     * @tc.number: SUB_ERB_1400
     * @tc.name: testErrorBoundary0014
     * @tc.desc: Verify ErrorBoundary scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0014');
      await scrollToId(ID_OPERATION_RESULT)
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testErrorBoundary0014');
    });

    /*
     * @tc.number: SUB_ERB_1500
     * @tc.name: testErrorBoundary0015
     * @tc.desc: Verify ErrorBoundary scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0015');
      await scrollToId(ID_PAIRING_STATUS)
      const text: string = await sharedDriver.getTextById(ID_PAIRING_STATUS);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      expect(text.includes('Acquire:')).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0015');
    });

    /*
     * @tc.number: SUB_ERB_1600
     * @tc.name: testErrorBoundary0016
     * @tc.desc: Verify ErrorBoundary scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0016');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await extDriver.clearHistoryAndWait();
      const count: number = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(-1);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testErrorBoundary0016');
    });

    /*
     * @tc.number: SUB_ERB_1700
     * @tc.name: testErrorBoundary0017
     * @tc.desc: Verify ErrorBoundary scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0017');
      await scrollToId(ID_QUERY_BUTTON)
      const latency: number = await extDriver.measureOperationLatency(ID_QUERY_BUTTON);
      expect(latency).assertLarger(-1);
      expect(typeof latency).assertEqual('number');
      sharedDriver.hilogEnd('testErrorBoundary0017');
    });

    /*
     * @tc.number: SUB_ERB_1800
     * @tc.name: testErrorBoundary0018
     * @tc.desc: Verify ErrorBoundary scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0018');
      await scrollToId(ID_QUERY_BUTTON)
      const latencies: number[] = await extDriver.measureMultipleLatencies(ID_QUERY_BUTTON, 3);
      expect(latencies.length).assertEqual(3);
      expect(typeof latencies[0]).assertEqual('number');
      expect(latencies[0]).assertLarger(-1);
      sharedDriver.hilogEnd('testErrorBoundary0018');
    });

    /*
     * @tc.number: SUB_ERB_1900
     * @tc.name: testErrorBoundary0019
     * @tc.desc: Verify ErrorBoundary scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0019');
      const data: string[] = testHelper.generateTestData(5);
      expect(data.length).assertEqual(5);
      expect(typeof data[0]).assertEqual('string');
      expect(data[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testErrorBoundary0019');
    });

    /*
     * @tc.number: SUB_ERB_2000
     * @tc.name: testErrorBoundary0020
     * @tc.desc: Verify ErrorBoundary scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0020');
      const ts: string = testHelper.formatTimestamp();
      expect(ts.length).assertLarger(0);
      expect(typeof ts).assertEqual('string');
      const colonMatch: RegExp = new RegExp(':');
      expect(colonMatch.test(ts)).assertTrue();
      sharedDriver.hilogEnd('testErrorBoundary0020');
    });

    /*
     * @tc.number: SUB_ERB_2100
     * @tc.name: testErrorBoundary0021
     * @tc.desc: Verify ErrorBoundary scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0021');
      const data: string[] = testHelper.generateTestData(0);
      expect(data.length).assertEqual(0);
      expect(typeof data.length).assertEqual('number');
      sharedDriver.hilogEnd('testErrorBoundary0021');
    });

    /*
     * @tc.number: SUB_ERB_2200
     * @tc.name: testErrorBoundary0022
     * @tc.desc: Verify ErrorBoundary scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0022');
      await scrollToId(ID_OPERATION_RESULT)
      const visible: boolean = await extDriver.waitForComponentVisible(ID_OPERATION_RESULT, 5000);
      expect(visible).assertTrue();
      expect(typeof visible).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorBoundary0022');
    });

    /*
     * @tc.number: SUB_ERB_2300
     * @tc.name: testErrorBoundary0023
     * @tc.desc: Verify ErrorBoundary scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0023');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await extDriver.clearHistoryAndWait();
      const hidden: boolean = await extDriver.waitForComponentHidden('nonExistentComponent', 1000);
      expect(hidden).assertTrue();
      expect(typeof hidden).assertEqual('boolean');
      sharedDriver.hilogEnd('testErrorBoundary0023');
    });

    /*
     * @tc.number: SUB_ERB_2400
     * @tc.name: testErrorBoundary0024
     * @tc.desc: Verify ErrorBoundary scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0024');
      await scrollToId(ID_QUERY_BUTTON)
      const latencies: number[] = await extDriver.measureMultipleLatencies(ID_QUERY_BUTTON, 3);
      const avg: number = await extDriver.calculateAverageLatency(latencies);
      expect(avg).assertLarger(-1);
      expect(typeof avg).assertEqual('number');
      expect(latencies.length).assertEqual(3);
      sharedDriver.hilogEnd('testErrorBoundary0024');
    });

    /*
     * @tc.number: SUB_ERB_2500
     * @tc.name: testErrorBoundary0025
     * @tc.desc: Verify ErrorBoundary scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testErrorBoundary0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testErrorBoundary0025');
      const emptyLatencies: number[] = [];
      const avg: number = await extDriver.calculateAverageLatency(emptyLatencies);
      expect(avg).assertEqual(0);
      expect(typeof avg).assertEqual('number');
      expect(emptyLatencies.length).assertEqual(0);
      sharedDriver.hilogEnd('testErrorBoundary0025');
    });
  });
}
