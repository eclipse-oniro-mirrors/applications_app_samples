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
import { scrollToId } from '../testkit/SharedDriver';
import { SharedDriverExt } from './SharedDriverExt';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, MAX_HISTORY_SIZE
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function scrollBehaviorTest(): void {
  describe('ScrollBehaviorTest', (): void => {

    // ==================== 滚动行为验证（20 条） ====================

    /*
     * @tc.number: SUB_SCB_0100
     * @tc.name: testScrollBehavior0001
     * @tc.desc: Verify ScrollBehavior scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const exists: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0001');
    });

    /*
     * @tc.number: SUB_SCB_0200
     * @tc.name: testScrollBehavior0002
     * @tc.desc: Verify ScrollBehavior scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 5; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0002');
    });

    /*
     * @tc.number: SUB_SCB_0300
     * @tc.name: testScrollBehavior0003
     * @tc.desc: Verify ScrollBehavior scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < MAX_HISTORY_SIZE; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testScrollBehavior0003');
    });

    /*
     * @tc.number: SUB_SCB_0400
     * @tc.name: testScrollBehavior0004
     * @tc.desc: Verify ScrollBehavior scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < MAX_HISTORY_SIZE + 5; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testScrollBehavior0004');
    });

    /*
     * @tc.number: SUB_SCB_0500
     * @tc.name: testScrollBehavior0005
     * @tc.desc: Verify ScrollBehavior scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testScrollBehavior0005');
    });

    /*
     * @tc.number: SUB_SCB_0600
     * @tc.name: testScrollBehavior0006
     * @tc.desc: Verify ScrollBehavior scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0006');
    });

    /*
     * @tc.number: SUB_SCB_0700
     * @tc.name: testScrollBehavior0007
     * @tc.desc: Verify ScrollBehavior scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Release:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0007');
    });

    /*
     * @tc.number: SUB_SCB_0800
     * @tc.name: testScrollBehavior0008
     * @tc.desc: Verify ScrollBehavior scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testScrollBehavior0008');
    });

    /*
     * @tc.number: SUB_SCB_0900
     * @tc.name: testScrollBehavior0009
     * @tc.desc: Verify ScrollBehavior scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertFalse();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(false);
      sharedDriver.hilogEnd('testScrollBehavior0009');
    });

    /*
     * @tc.number: SUB_SCB_1000
     * @tc.name: testScrollBehavior0010
     * @tc.desc: Verify ScrollBehavior scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0010');
    });

    /*
     * @tc.number: SUB_SCB_1100
     * @tc.name: testScrollBehavior0011
     * @tc.desc: Verify ScrollBehavior scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0011');
    });

    /*
     * @tc.number: SUB_SCB_1200
     * @tc.name: testScrollBehavior0012
     * @tc.desc: Verify ScrollBehavior scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0012');
    });

    /*
     * @tc.number: SUB_SCB_1300
     * @tc.name: testScrollBehavior0013
     * @tc.desc: Verify ScrollBehavior scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0013');
    });

    /*
     * @tc.number: SUB_SCB_1400
     * @tc.name: testScrollBehavior0014
     * @tc.desc: Verify ScrollBehavior scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Pending:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0014');
    });

    /*
     * @tc.number: SUB_SCB_1500
     * @tc.name: testScrollBehavior0015
     * @tc.desc: Verify ScrollBehavior scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await sharedDriver.waitUiIdle();
        await sharedDriver.clickId(ID_RELEASE_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Pending: 0')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0015');
    });

    /*
     * @tc.number: SUB_SCB_1600
     * @tc.name: testScrollBehavior0016
     * @tc.desc: Verify ScrollBehavior scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testScrollBehavior0016');
    });

    /*
     * @tc.number: SUB_SCB_1700
     * @tc.name: testScrollBehavior0017
     * @tc.desc: Verify ScrollBehavior scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(true);
      sharedDriver.hilogEnd('testScrollBehavior0017');
    });

    /*
     * @tc.number: SUB_SCB_1800
     * @tc.name: testScrollBehavior0018
     * @tc.desc: Verify ScrollBehavior scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      const r2: string = await sharedDriver.clickAndGetResult('queryAllStatesButton', ID_OPERATION_RESULT);
      expect(r2.includes('KeyState')).assertTrue();
      expect(r1 !== r2).assertTrue();
      sharedDriver.hilogEnd('testScrollBehavior0018');
    });

    /*
     * @tc.number: SUB_SCB_1900
     * @tc.name: testScrollBehavior0019
     * @tc.desc: Verify ScrollBehavior scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testScrollBehavior0019');
    });

    /*
     * @tc.number: SUB_SCB_2000
     * @tc.name: testScrollBehavior0020
     * @tc.desc: Verify ScrollBehavior scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testScrollBehavior0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testScrollBehavior0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      const p: boolean = await sharedDriver.existsId('pairingStatus');
      expect(q).assertTrue();
      expect(r).assertTrue();
      expect(p).assertTrue();
      sharedDriver.hilogEnd('testScrollBehavior0020');
    });
  });
}
