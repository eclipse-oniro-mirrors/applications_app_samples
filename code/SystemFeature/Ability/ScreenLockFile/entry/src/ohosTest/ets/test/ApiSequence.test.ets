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
import { TestHelper } from './TestHelper';
import { PairingCounts } from './SharedDriverExt';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
import { DOMAIN, TAG, BUNDLE_NAME, ABILITY_NAME} from './TestConstants';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function apiSequenceTest(): void {
  describe('ApiSequenceTest', (): void => {

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
    // ==================== API 调用顺序验证（20 条） ====================

    /*
     * @tc.number: SUB_ASEQ_0100
     * @tc.name: testApiSequence0001
     * @tc.desc: Verify ApiSequence scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0001');
      const s1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(s1)).assertTrue();
      try {
        const s2: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(s2)).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const s3: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(s3)).assertTrue();
      sharedDriver.hilogEnd('testApiSequence0001');
    });

    /*
     * @tc.number: SUB_ASEQ_0200
     * @tc.name: testApiSequence0002
     * @tc.desc: Verify ApiSequence scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0002');
      try {
        const acq: screenLockFileManager.AccessStatus = screenLockFileManager.acquireAccess();
        expect(testHelper.isValidAccessStatus(acq)).assertTrue();
        const rel: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(rel)).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const q: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q)).assertTrue();
      expect(typeof q).assertEqual('number');
      sharedDriver.hilogEnd('testApiSequence0002');
    });

    /*
     * @tc.number: SUB_ASEQ_0300
     * @tc.name: testApiSequence0003
     * @tc.desc: Verify ApiSequence scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0003');
      try {
        const rel: screenLockFileManager.ReleaseStatus = screenLockFileManager.releaseAccess();
        expect(testHelper.isValidReleaseStatus(rel)).assertTrue();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const q: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q)).assertTrue();
      expect(q).assertLarger(-1);
      sharedDriver.hilogEnd('testApiSequence0003');
    });

    /*
     * @tc.number: SUB_ASEQ_0400
     * @tc.name: testApiSequence0004
     * @tc.desc: Verify ApiSequence scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0004');
      const q1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      const q2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(q1).assertEqual(q2);
      expect(testHelper.isValidKeyStatus(q1)).assertTrue();
      expect(typeof q1).assertEqual('number');
      sharedDriver.hilogEnd('testApiSequence0004');
    });

    /*
     * @tc.number: SUB_ASEQ_0500
     * @tc.name: testApiSequence0005
     * @tc.desc: Verify ApiSequence scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0005');
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.acquireAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const q: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q)).assertTrue();
      expect(typeof q).assertEqual('number');
      sharedDriver.hilogEnd('testApiSequence0005');
    });

    /*
     * @tc.number: SUB_ASEQ_0600
     * @tc.name: testApiSequence0006
     * @tc.desc: Verify ApiSequence scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0006');
      try {
        screenLockFileManager.acquireAccess();
        screenLockFileManager.releaseAccess();
        screenLockFileManager.releaseAccess();
      } catch (error) {
        const err: BusinessError = error as BusinessError;
        expect(err.code).assertLarger(0);
        expect(err.message.length).assertLarger(0);
      }
      const q: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q)).assertTrue();
      expect(typeof q).assertEqual('number');
      sharedDriver.hilogEnd('testApiSequence0006');
    });

    /*
     * @tc.number: SUB_ASEQ_0700
     * @tc.name: testApiSequence0007
     * @tc.desc: Verify ApiSequence scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0007');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.clickId('acquireAccessButton');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const result: string = await textOfId('operationResult');
      expect(result.includes('KeyState')).assertTrue();
      expect(result.includes('Acquire')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiSequence0007');
    });

    /*
     * @tc.number: SUB_ASEQ_0800
     * @tc.name: testApiSequence0008
     * @tc.desc: Verify ApiSequence scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0008');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.clickId('queryKeyStateButton');
      await clickById('queryAllStatesButton')
      await scrollToId('operationResult')
      const result: string = await textOfId('operationResult');
      expect(result.includes('KeyState')).assertTrue();
      expect(result.includes('Release')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiSequence0008');
    });

    /*
     * @tc.number: SUB_ASEQ_0900
     * @tc.name: testApiSequence0009
     * @tc.desc: Verify ApiSequence scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0009');
      const q1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try { screenLockFileManager.acquireAccess(); } catch (e) { /* expected */ }
      const q2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try { screenLockFileManager.releaseAccess(); } catch (e) { /* expected */ }
      const q3: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q1)).assertTrue();
      expect(testHelper.isValidKeyStatus(q2)).assertTrue();
      expect(testHelper.isValidKeyStatus(q3)).assertTrue();
      sharedDriver.hilogEnd('testApiSequence0009');
    });

    /*
     * @tc.number: SUB_ASEQ_1000
     * @tc.name: testApiSequence0010
     * @tc.desc: Verify ApiSequence scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testApiSequence0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0010');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const noHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertTrue();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const hasHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(hasHistory).assertFalse();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testApiSequence0010');
    });

    /*
     * @tc.number: SUB_ASEQ_1100
     * @tc.name: testApiSequence0011
     * @tc.desc: Verify ApiSequence scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0011');
      for (let i: number = 0; i < 3; i++) {
        const q: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
        expect(testHelper.isValidKeyStatus(q)).assertTrue();
      }
      expect(typeof screenLockFileManager.queryAppKeyState()).assertEqual('number');
      const q: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(q).assertLarger(-1);
      sharedDriver.hilogEnd('testApiSequence0011');
    });

    /*
     * @tc.number: SUB_ASEQ_1200
     * @tc.name: testApiSequence0012
     * @tc.desc: Verify ApiSequence scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0012');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const counts1: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      const counts2: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(counts2.acquire).assertLarger(counts1.acquire - 1);
      expect(counts2.acquire).assertLarger(-1);
      expect(typeof counts2.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testApiSequence0012');
    });

    /*
     * @tc.number: SUB_ASEQ_1300
     * @tc.name: testApiSequence0013
     * @tc.desc: Verify ApiSequence scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0013');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(result.includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testApiSequence0013');
    });

    /*
     * @tc.number: SUB_ASEQ_1400
     * @tc.name: testApiSequence0014
     * @tc.desc: Verify ApiSequence scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0014');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.clickId('releaseAccessButton');
      await sharedDriver.clickId('queryAllStatesButton');
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('KeyState')).assertTrue();
      expect(result.includes('Acquire')).assertTrue();
      expect(result.includes('Release')).assertTrue();
      sharedDriver.hilogEnd('testApiSequence0014');
    });

    /*
     * @tc.number: SUB_ASEQ_1500
     * @tc.name: testApiSequence0015
     * @tc.desc: Verify ApiSequence scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0015');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('acquireAccessButton');
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.length).assertLarger(0);
      const noHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertTrue();
      expect(typeof noHistory).assertEqual('boolean');
      sharedDriver.hilogEnd('testApiSequence0015');
    });

    /*
     * @tc.number: SUB_ASEQ_1600
     * @tc.name: testApiSequence0016
     * @tc.desc: Verify ApiSequence scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0016');
      const q1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      try { screenLockFileManager.acquireAccess(); } catch (e) { /* expected */ }
      try { screenLockFileManager.releaseAccess(); } catch (e) { /* expected */ }
      const q2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q1)).assertTrue();
      expect(testHelper.isValidKeyStatus(q2)).assertTrue();
      expect(q1).assertEqual(q2);
      sharedDriver.hilogEnd('testApiSequence0016');
    });

    /*
     * @tc.number: SUB_ASEQ_1700
     * @tc.name: testApiSequence0017
     * @tc.desc: Verify ApiSequence scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0017');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId('queryKeyStateButton');
        await sharedDriver.waitUiIdle();
      }
      const noHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertFalse();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.length).assertLarger(0);
      expect(result.includes('queryAppKeyState')).assertTrue();
      sharedDriver.hilogEnd('testApiSequence0017');
    });

    /*
     * @tc.number: SUB_ASEQ_1800
     * @tc.name: testApiSequence0018
     * @tc.desc: Verify ApiSequence scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0018');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const counts: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(counts.acquire).assertLarger(0);
      expect(counts.pending).assertLarger(0);
      expect(typeof counts.acquire).assertEqual('number');
      sharedDriver.hilogEnd('testApiSequence0018');
    });

    /*
     * @tc.number: SUB_ASEQ_1900
     * @tc.name: testApiSequence0019
     * @tc.desc: Verify ApiSequence scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0019');
      await sharedDriver.clickId('clearHistoryButton');
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId('acquireAccessButton');
        await sharedDriver.waitUiIdle();
      }
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId('releaseAccessButton');
        await sharedDriver.waitUiIdle();
      }
      const counts: PairingCounts = await testHelper.getExtDriver().parsePairingCounts();
      expect(counts.pending).assertEqual(0);
      expect(counts.acquire).assertLarger(0);
      expect(counts.release).assertLarger(0);
      sharedDriver.hilogEnd('testApiSequence0019');
    });

    /*
     * @tc.number: SUB_ASEQ_2000
     * @tc.name: testApiSequence0020
     * @tc.desc: Verify ApiSequence scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testApiSequence0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testApiSequence0020');
      const q1: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(testHelper.isValidKeyStatus(q1)).assertTrue();
      await sharedDriver.clickId('queryKeyStateButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      const q2: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      expect(q1).assertEqual(q2);
      sharedDriver.hilogEnd('testApiSequence0020');
    });
  });
}
