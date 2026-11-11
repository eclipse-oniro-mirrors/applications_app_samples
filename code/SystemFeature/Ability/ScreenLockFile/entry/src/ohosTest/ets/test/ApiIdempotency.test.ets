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
import { TestHelper } from './TestHelper';
import { PairingCounts } from './SharedDriverExt';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';

const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function apiIdempotencyTest(): void {
  describe('ApiIdempotencyTest', (): void => {

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
    // ==================== 核心幂等性（10 条） ====================

    /*
     * @tc.number: SUB_AID_0100
     * @tc.name: testApiIdempotency0001
     * @tc.desc: Query app key state twice and verify consistent results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0001');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0001');
    });

    /*
     * @tc.number: SUB_AID_0200
     * @tc.name: testApiIdempotency0002
     * @tc.desc: Query app key state five times and verify all results are identical.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0002');
      const results: number[] = [];
      for (let i: number = 0; i < 5; i++) {
        results.push(screenLockFileManager.queryAppKeyState());
      }
      for (let i: number = 1; i < results.length; i++) {
        expect(results[i]).assertEqual(results[0]);
      }
      expect(results.length).assertEqual(5);
      expect(testHelper.isValidKeyStatus(results[0])).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0002');
    });

    /*
     * @tc.number: SUB_AID_0300
     * @tc.name: testApiIdempotency0003
     * @tc.desc: Click query all states button twice and verify consistent results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0003');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const r1: string = await textOfId('operationResult');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const r2: string = await textOfId('operationResult');
      expect(r1).assertEqual(r2);
      expect(r1.length).assertLarger(0);
      expect(r2.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiIdempotency0003');
    });

    /*
     * @tc.number: SUB_AID_0400
     * @tc.name: testApiIdempotency0004
     * @tc.desc: Read pairing status text twice and verify consistent results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0004');
      const p1: string = await sharedDriver.getTextById('pairingStatus');
      const p2: string = await sharedDriver.getTextById('pairingStatus');
      expect(p1).assertEqual(p2);
      expect(p1.length).assertLarger(0);
      expect(p2.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiIdempotency0004');
    });

    /*
     * @tc.number: SUB_AID_0500
     * @tc.name: testApiIdempotency0005
     * @tc.desc: Parse pairing counts twice and verify consistent acquire, release, and pending values.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0005');
      const c1: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      const c2: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(c1.acquire).assertEqual(c2.acquire);
      expect(c1.release).assertEqual(c2.release);
      expect(c1.pending).assertEqual(c2.pending);
      sharedDriver.hilogEnd('testApiIdempotency0005');
    });

    /*
     * @tc.number: SUB_AID_0600
     * @tc.name: testApiIdempotency0006
     * @tc.desc: Clear history twice and verify no-history indicator is consistently present.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0006');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const e1: boolean = await sharedDriver.existsId('noHistoryText');
      const e2: boolean = await sharedDriver.existsId('noHistoryText');
      expect(e1).assertEqual(e2);
      expect(e1).assertTrue();
      expect(e2).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0006');
    });

    /*
     * @tc.number: SUB_AID_0700
     * @tc.name: testApiIdempotency0007
     * @tc.desc: Query key state with UI click in between and verify state consistency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0007');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0007');
    });

    /*
     * @tc.number: SUB_AID_0800
     * @tc.name: testApiIdempotency0008
     * @tc.desc: Query key state around acquire call and verify state idempotency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0008');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try { screenLockFileManager.acquireAccess(); } catch (e) { /* expected */ }
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0008');
    });

    /*
     * @tc.number: SUB_AID_0900
     * @tc.name: testApiIdempotency0009
     * @tc.desc: Query key state around release call and verify state idempotency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0009');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try { screenLockFileManager.releaseAccess(); } catch (e) { /* expected */ }
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0009');
    });

    /*
     * @tc.number: SUB_AID_1000
     * @tc.name: testApiIdempotency0010
     * @tc.desc: Click query key state button twice and verify result text consistency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     */
    it('testApiIdempotency0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0010');
      await clickById('queryKeyStateButton')
      await scrollToId('operationResult')
      const r1: string = await textOfId('operationResult');
      await clickById('queryKeyStateButton')
      await scrollToId('operationResult')
      const r2: string = await textOfId('operationResult');
      expect(r1).assertEqual(r2);
      expect(r1.length).assertLarger(0);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0010');
    });

    // ==================== 高级稳定性（3 条） ====================

    /*
     * @tc.number: SUB_AID_1100
     * @tc.name: testApiIdempotency0011
     * @tc.desc: Verify pairing counts remain stable across multiple query operations with history clear.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0011');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const c1: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const c2: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(c1.acquire).assertEqual(c2.acquire);
      expect(c1.release).assertEqual(c2.release);
      expect(c1.pending).assertEqual(c2.pending);
      sharedDriver.hilogEnd('testApiIdempotency0011');
    });

    /*
     * @tc.number: SUB_AID_1200
     * @tc.name: testApiIdempotency0012
     * @tc.desc: Execute query all states three times and verify result text stability.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0012');
      const results: string[] = [];
      for (let i: number = 0; i < 3; i++) {
        await clickById('queryAllStatesButton')
        await scrollToId('operationResult')
        const text: string = await textOfId('operationResult');
        results.push(text);
      }
      expect(results[0]).assertEqual(results[1]);
      expect(results[1]).assertEqual(results[2]);
      expect(results.length).assertEqual(3);
      sharedDriver.hilogEnd('testApiIdempotency0012');
    });

    /*
     * @tc.number: SUB_AID_1300
     * @tc.name: testApiIdempotency0013
     * @tc.desc: Query key status name twice and verify consistent string representation.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0013');
      const n1: string = testHelper.getKeyStatusName(screenLockFileManager.queryAppKeyState());
      const n2: string = testHelper.getKeyStatusName(screenLockFileManager.queryAppKeyState());
      expect(n1).assertEqual(n2);
      expect(n1.length).assertLarger(0);
      expect(n2.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiIdempotency0013');
    });

    // ==================== 快速操作（3 条） ====================

    /*
     * @tc.number: SUB_AID_1400
     * @tc.name: testApiIdempotency0014
     * @tc.desc: Perform rapid query operations and verify history indicator consistency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0014');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const h1: boolean = await sharedDriver.existsId('noHistoryText');
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const h2: boolean = await sharedDriver.existsId('noHistoryText');
      expect(h1).assertEqual(h2);
      expect(h1).assertFalse();
      expect(h2).assertFalse();
      sharedDriver.hilogEnd('testApiIdempotency0014');
    });

    /*
     * @tc.number: SUB_AID_1500
     * @tc.name: testApiIdempotency0015
     * @tc.desc: Query state around rapid history clear and verify idempotency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0015');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0015');
    });

    /*
     * @tc.number: SUB_AID_1600
     * @tc.name: testApiIdempotency0016
     * @tc.desc: Read pairing status around rapid query and verify text consistency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0016');
      const p1: string = await sharedDriver.getTextById('pairingStatus');
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const p2: string = await sharedDriver.getTextById('pairingStatus');
      expect(p1).assertEqual(p2);
      expect(p1.length).assertLarger(0);
      expect(p1.includes('Acquire')).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0016');
    });

    // ==================== 枚举一致性（3 条） ====================

    /*
     * @tc.number: SUB_AID_1700
     * @tc.name: testApiIdempotency0017
     * @tc.desc: Verify pairing status changes after acquire and both values are non-empty.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0017');
      const p1: string = await sharedDriver.getTextById('pairingStatus');
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const p2: string = await sharedDriver.getTextById('pairingStatus');
      expect(p1 !== p2).assertTrue();
      expect(p1.length).assertLarger(0);
      expect(p2.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiIdempotency0017');
    });

    /*
     * @tc.number: SUB_AID_1800
     * @tc.name: testApiIdempotency0018
     * @tc.desc: Query key state around history clear and verify result text idempotency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0018');
      await clickById('queryKeyStateButton')
      await scrollToId('operationResult')
      const r1: string = await textOfId('operationResult');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await clickById('queryKeyStateButton')
      await scrollToId('operationResult')
      const r2: string = await textOfId('operationResult');
      expect(r1).assertEqual(r2);
      expect(r1.length).assertLarger(0);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0018');
    });

    /*
     * @tc.number: SUB_AID_1900
     * @tc.name: testApiIdempotency0019
     * @tc.desc: Query key state ten times and verify all results match the initial value.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0019');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      for (let i: number = 0; i < 10; i++) {
        const si: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        expect(si).assertEqual(s1);
      }
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(typeof s1).assertEqual('number');
      sharedDriver.hilogEnd('testApiIdempotency0019');
    });

    // ==================== 循环模式（6 条） ====================

    /*
     * @tc.number: SUB_AID_2000
     * @tc.name: testApiIdempotency0020
     * @tc.desc: Clear history and verify all pairing counts reset to zero.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0020');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const c1: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(c1.acquire).assertEqual(0);
      expect(c1.release).assertEqual(0);
      expect(c1.pending).assertEqual(0);
      sharedDriver.hilogEnd('testApiIdempotency0020');
    });

    /*
     * @tc.number: SUB_AID_2100
     * @tc.name: testApiIdempotency0021
     * @tc.desc: Read operation result text twice and verify consistent string output.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0021');
      const r1: string = await sharedDriver.getTextById('operationResult');
      const r2: string = await sharedDriver.getTextById('operationResult');
      expect(r1).assertEqual(r2);
      expect(r1.length).assertLarger(0);
      expect(typeof r1).assertEqual('string');
      sharedDriver.hilogEnd('testApiIdempotency0021');
    });

    /*
     * @tc.number: SUB_AID_2200
     * @tc.name: testApiIdempotency0022
     * @tc.desc: Query key status name around UI click and verify string consistency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0022');
      const n1: string = testHelper.getKeyStatusName(screenLockFileManager.queryAppKeyState());
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const n2: string = testHelper.getKeyStatusName(screenLockFileManager.queryAppKeyState());
      expect(n1).assertEqual(n2);
      expect(n1.length).assertLarger(0);
      expect(typeof n1).assertEqual('string');
      sharedDriver.hilogEnd('testApiIdempotency0022');
    });

    /*
     * @tc.number: SUB_AID_2300
     * @tc.name: testApiIdempotency0023
     * @tc.desc: Execute full acquire-release cycle and verify key state idempotency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0023');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try { screenLockFileManager.acquireAccess(); } catch (e) { /* expected */ }
      try { screenLockFileManager.releaseAccess(); } catch (e) { /* expected */ }
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(s1).assertEqual(s2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      expect(testHelper.isValidKeyStatus(s2)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0023');
    });

    /*
     * @tc.number: SUB_AID_2400
     * @tc.name: testApiIdempotency0024
     * @tc.desc: Perform multiple query cycles and verify result text consistency.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0024');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId('queryKeyStateButton');
        await sharedDriver.waitUiIdle();
      }
      const r1: string = await sharedDriver.getTextById('operationResult');
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const r2: string = await sharedDriver.getTextById('operationResult');
      expect(r1).assertEqual(r2);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r2.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0024');
    });

    /*
     * @tc.number: SUB_AID_2500
     * @tc.name: testApiIdempotency0025
     * @tc.desc: Verify state and pairing status consistency after history clear cycle.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 1
     */
    it('testApiIdempotency0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiIdempotency0025');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const p1: string = await sharedDriver.getTextById('pairingStatus');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const s2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const p2: string = await sharedDriver.getTextById('pairingStatus');
      expect(s1).assertEqual(s2);
      expect(p1).assertEqual(p2);
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      sharedDriver.hilogEnd('testApiIdempotency0025');
    });
  });
}
