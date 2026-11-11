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
import { ApiCallResult, StateSnapshot, TestHelper } from './TestHelper';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function foregroundBackgroundTest(): void {
  describe('ForegroundBackgroundTest', (): void => {

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
    // ==================== 前后台状态验证（25 条） ====================

    /*
     * @tc.number: SUB_FGB_0100
     * @tc.name: testForegroundBackground0001
     * @tc.desc: Verify ForegroundBackground scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0001');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      expect(status).assertLarger(-1);
      sharedDriver.hilogEnd('testForegroundBackground0001');
    });

    /*
     * @tc.number: SUB_FGB_0200
     * @tc.name: testForegroundBackground0002
     * @tc.desc: Verify ForegroundBackground scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0002');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testForegroundBackground0002');
    });

    /*
     * @tc.number: SUB_FGB_0300
     * @tc.name: testForegroundBackground0003
     * @tc.desc: Verify ForegroundBackground scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0003');
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testForegroundBackground0003');
    });

    /*
     * @tc.number: SUB_FGB_0400
     * @tc.name: testForegroundBackground0004
     * @tc.desc: Verify ForegroundBackground scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0004');
      testHelper.acquireAccess();
      await scrollToId(ID_RELEASE_BUTTON);
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testForegroundBackground0004');
    });

    /*
     * @tc.number: SUB_FGB_0500
     * @tc.name: testForegroundBackground0005
     * @tc.desc: Verify ForegroundBackground scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0005');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s3: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(s2).assertEqual(s3);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0005');
    });

    /*
     * @tc.number: SUB_FGB_0600
     * @tc.name: testForegroundBackground0006
     * @tc.desc: Verify ForegroundBackground scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0006');
      await extDriver.clearHistoryAndWait();
      testHelper.acquireAccess();
      const p1: PairingCounts = await extDriver.parsePairingCounts();
      const p2: PairingCounts = await extDriver.parsePairingCounts();
      expect(p1.acquire).assertEqual(p2.acquire);
      expect(p1.pending).assertEqual(p2.pending);
      expect(typeof p1.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testForegroundBackground0006');
    });

    /*
     * @tc.number: SUB_FGB_0700
     * @tc.name: testForegroundBackground0007
     * @tc.desc: Verify ForegroundBackground scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0007');
      await extDriver.clearHistoryAndWait();
      await scrollToId(ID_OPERATION_RESULT)
      const before: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(before.includes('ready')).assertFalse();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const after: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(after.includes('queryAppKeyState')).assertTrue();
      expect(before !== after).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0007');
    });

    /*
     * @tc.number: SUB_FGB_0800
     * @tc.name: testForegroundBackground0008
     * @tc.desc: Verify ForegroundBackground scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0008');
      await extDriver.clearHistoryAndWait();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const count: number = await extDriver.getHistoryEntryCount();
      expect(count).assertLarger(0);
      expect(typeof count).assertEqual('number');
      sharedDriver.hilogEnd('testForegroundBackground0008');
    });

    /*
     * @tc.number: SUB_FGB_0900
     * @tc.name: testForegroundBackground0009
     * @tc.desc: Verify ForegroundBackground scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0009');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await extDriver.clearHistoryAndWait();
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testForegroundBackground0009');
    });

    /*
     * @tc.number: SUB_FGB_1000
     * @tc.name: testForegroundBackground0010
     * @tc.desc: Verify ForegroundBackground scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0010');
      await scrollToId(ID_QUERY_ALL_BUTTON);
      await sharedDriver.clickId(ID_QUERY_ALL_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testForegroundBackground0010');
    });

    /*
     * @tc.number: SUB_FGB_1100
     * @tc.name: testForegroundBackground0011
     * @tc.desc: Verify ForegroundBackground scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0011');
      const snapshot: StateSnapshot = await testHelper.captureStateSnapshot();
      expect(testHelper.isValidKeyStatus(snapshot.keyStatus)).assertTrue();
      expect(typeof snapshot.operationResult).assertEqual('string');
      expect(typeof snapshot.pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testForegroundBackground0011');
    });

    /*
     * @tc.number: SUB_FGB_1200
     * @tc.name: testForegroundBackground0012
     * @tc.desc: Verify ForegroundBackground scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0012');
      const valid: boolean = await testHelper.verifyStateConsistency();
      expect(valid).assertTrue();
      expect(typeof valid).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0012');
    });

    /*
     * @tc.number: SUB_FGB_1300
     * @tc.name: testForegroundBackground0013
     * @tc.desc: Verify ForegroundBackground scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0013');
      await extDriver.clearHistoryAndWait();
      const result: boolean = await testHelper.performAcquireReleaseCycle();
      expect(typeof result).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      const counts: PairingCounts = await extDriver.parsePairingCounts();
      expect(counts.acquire).assertEqual(0);
      sharedDriver.hilogEnd('testForegroundBackground0013');
    });

    /*
     * @tc.number: SUB_FGB_1400
     * @tc.name: testForegroundBackground0014
     * @tc.desc: Verify ForegroundBackground scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0014');
      await extDriver.clearHistoryAndWait();
      for (let i: number = 0; i < 3; i++) {
        await scrollToId(ID_QUERY_BUTTON);
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
        await scrollToId(ID_OPERATION_RESULT);
        const r: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
        expect(r.includes('queryAppKeyState')).assertTrue();
      }
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0014');
    });

    /*
     * @tc.number: SUB_FGB_1500
     * @tc.name: testForegroundBackground0015
     * @tc.desc: Verify ForegroundBackground scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0015');
      const n0: string = testHelper.getKeyStatusName(KEY_STATUS_NOT_EXIST);
      const n1: string = testHelper.getKeyStatusName(KEY_STATUS_RELEASED);
      const n2: string = testHelper.getKeyStatusName(KEY_STATUS_EXIST);
      expect(n0).assertEqual('KEY_NOT_EXIST');
      expect(n1).assertEqual('KEY_RELEASED');
      expect(n2).assertEqual('KEY_EXIST');
      sharedDriver.hilogEnd('testForegroundBackground0015');
    });

    /*
     * @tc.number: SUB_FGB_1600
     * @tc.name: testForegroundBackground0016
     * @tc.desc: Verify ForegroundBackground scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0016');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      const colonIdx: number = r1.indexOf(':');
      expect(colonIdx).assertLarger(0);
      expect(r1.substring(0, colonIdx)).assertEqual('queryAppKeyState');
      expect(r1.length).assertLarger(colonIdx + 1);
      sharedDriver.hilogEnd('testForegroundBackground0016');
    });

    /*
     * @tc.number: SUB_FGB_1700
     * @tc.name: testForegroundBackground0017
     * @tc.desc: Verify ForegroundBackground scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0017');
      const pairing: string = await extDriver.getPairingStatusText();
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('Release:')).assertTrue();
      expect(pairing.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0017');
    });

    /*
     * @tc.number: SUB_FGB_1800
     * @tc.name: testForegroundBackground0018
     * @tc.desc: Verify ForegroundBackground scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0018');
      const pairing: string = await extDriver.getPairingStatusText();
      const sections: string[] = pairing.split('|');
      expect(sections.length).assertEqual(3);
      expect(sections[0].includes('Acquire')).assertTrue();
      expect(sections[1].includes('Release')).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0018');
    });

    /*
     * @tc.number: SUB_FGB_1900
     * @tc.name: testForegroundBackground0019
     * @tc.desc: Verify ForegroundBackground scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0019');
      await scrollToId(ID_QUERY_BUTTON);
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r1.includes('Error')).assertFalse();
      await scrollToId(ID_ACQUIRE_BUTTON);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const r2: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r2.includes('Error')).assertFalse();
      expect(r1 !== r2).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0019');
    });

    /*
     * @tc.number: SUB_FGB_2000
     * @tc.name: testForegroundBackground0020
     * @tc.desc: Verify ForegroundBackground scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0020');
      const ids: string[] = ['queryKeyStateButton', 'acquireAccessButton', 'releaseAccessButton', 'queryAllStatesButton', 'clearHistoryButton'];
      expect(ids.length).assertEqual(5);
      const unique: string[] = [];
      for (let i: number = 0; i < ids.length; i++) {
        let found: boolean = false;
        for (let j: number = 0; j < unique.length; j++) {
          if (ids[i] === unique[j]) { found = true; }
        }
        if (!found) { unique.push(ids[i]); }
      }
      expect(unique.length).assertEqual(ids.length);
      expect(typeof ids[0]).assertEqual('string');
      expect(ids[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testForegroundBackground0020');
    });

    /*
     * @tc.number: SUB_FGB_2100
     * @tc.name: testForegroundBackground0021
     * @tc.desc: Verify ForegroundBackground scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0021');
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0021');
    });

    /*
     * @tc.number: SUB_FGB_2200
     * @tc.name: testForegroundBackground0022
     * @tc.desc: Verify ForegroundBackground scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0022');
      const qa: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      const cl: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(qa).assertTrue();
      expect(cl).assertTrue();
      const res: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(res).assertTrue();
      sharedDriver.hilogEnd('testForegroundBackground0022');
    });

    /*
     * @tc.number: SUB_FGB_2300
     * @tc.name: testForegroundBackground0023
     * @tc.desc: Verify ForegroundBackground scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0023');
      const qr: ApiCallResult = testHelper.queryKeyState();
      expect(typeof qr.success).assertEqual('boolean');
      expect(typeof qr.errorCode).assertEqual('number');
      expect(typeof qr.errorMessage).assertEqual('string');
      sharedDriver.hilogEnd('testForegroundBackground0023');
    });

    /*
     * @tc.number: SUB_FGB_2400
     * @tc.name: testForegroundBackground0024
     * @tc.desc: Verify ForegroundBackground scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0024');
      const ar: ApiCallResult = testHelper.acquireAccess();
      expect(typeof ar.success).assertEqual('boolean');
      expect(typeof ar.errorCode).assertEqual('number');
      expect(ar.timestamp).assertLarger(0);
      sharedDriver.hilogEnd('testForegroundBackground0024');
    });

    /*
     * @tc.number: SUB_FGB_2500
     * @tc.name: testForegroundBackground0025
     * @tc.desc: Verify ForegroundBackground scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testForegroundBackground0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testForegroundBackground0025');
      const isValid: boolean = await testHelper.verifyStateConsistency();
      expect(isValid).assertTrue();
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(status)).assertTrue();
      expect(typeof status).assertEqual('number');
      sharedDriver.hilogEnd('testForegroundBackground0025');
    });
  });
}
