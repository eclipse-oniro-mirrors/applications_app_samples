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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, MAX_HISTORY_SIZE
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function historyListTest(): void {
  describe('HistoryListTest', (): void => {

    // ==================== 历史记录列表验证（30 条） ====================

    /*
     * @tc.number: SUB_HSL_0100
     * @tc.name: testHistoryList0001
     * @tc.desc: Verify HistoryList scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const noHistExists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistExists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryList0001');
    });

    /*
     * @tc.number: SUB_HSL_0200
     * @tc.name: testHistoryList0002
     * @tc.desc: Verify HistoryList scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      const noHistExists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistExists).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryList0002');
    });

    /*
     * @tc.number: SUB_HSL_0300
     * @tc.name: testHistoryList0003
     * @tc.desc: Verify HistoryList scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0003');
    });

    /*
     * @tc.number: SUB_HSL_0400
     * @tc.name: testHistoryList0004
     * @tc.desc: Verify HistoryList scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0004');
    });

    /*
     * @tc.number: SUB_HSL_0500
     * @tc.name: testHistoryList0005
     * @tc.desc: Verify HistoryList scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      const noHistExists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistExists).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryList0005');
    });

    /*
     * @tc.number: SUB_HSL_0600
     * @tc.name: testHistoryList0006
     * @tc.desc: Verify HistoryList scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0006');
    });

    /*
     * @tc.number: SUB_HSL_0700
     * @tc.name: testHistoryList0007
     * @tc.desc: Verify HistoryList scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0007');
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
      expect(MAX_HISTORY_SIZE).assertEqual(10);
      sharedDriver.hilogEnd('testHistoryList0007');
    });

    /*
     * @tc.number: SUB_HSL_0800
     * @tc.name: testHistoryList0008
     * @tc.desc: Verify HistoryList scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const exists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(exists).assertTrue();
      expect(typeof exists).assertEqual('boolean');
      expect(exists).assertEqual(true);
      sharedDriver.hilogEnd('testHistoryList0008');
    });

    /*
     * @tc.number: SUB_HSL_0900
     * @tc.name: testHistoryList0009
     * @tc.desc: Verify HistoryList scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const exists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(exists).assertFalse();
      expect(typeof exists).assertEqual('boolean');
      expect(exists).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0009');
    });

    /*
     * @tc.number: SUB_HSL_1000
     * @tc.name: testHistoryList0010
     * @tc.desc: Verify HistoryList scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const exists: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(exists).assertTrue();
      expect(typeof exists).assertEqual('boolean');
      expect(exists).assertEqual(true);
      sharedDriver.hilogEnd('testHistoryList0010');
    });

    /*
     * @tc.number: SUB_HSL_1100
     * @tc.name: testHistoryList0011
     * @tc.desc: Verify HistoryList scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0011');
    });

    /*
     * @tc.number: SUB_HSL_1200
     * @tc.name: testHistoryList0012
     * @tc.desc: Verify HistoryList scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const buttons: string[] = [ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON];
      for (let i: number = 0; i < buttons.length; i++) {
        await sharedDriver.clickId(buttons[i]);
        await sharedDriver.waitUiIdle();
      }
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0012');
    });

    /*
     * @tc.number: SUB_HSL_1300
     * @tc.name: testHistoryList0013
     * @tc.desc: Verify HistoryList scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(true);
      sharedDriver.hilogEnd('testHistoryList0013');
    });

    /*
     * @tc.number: SUB_HSL_1400
     * @tc.name: testHistoryList0014
     * @tc.desc: Verify HistoryList scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryAllStatesButton');
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0014');
    });

    /*
     * @tc.number: SUB_HSL_1500
     * @tc.name: testHistoryList0015
     * @tc.desc: Verify HistoryList scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0015');
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
      expect(MAX_HISTORY_SIZE).assertEqual(10);
      sharedDriver.hilogEnd('testHistoryList0015');
    });

    /*
     * @tc.number: SUB_HSL_1600
     * @tc.name: testHistoryList0016
     * @tc.desc: Verify HistoryList scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < MAX_HISTORY_SIZE + 3; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0016');
    });

    /*
     * @tc.number: SUB_HSL_1700
     * @tc.name: testHistoryList0017
     * @tc.desc: Verify HistoryList scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 5; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertTrue();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(true);
      sharedDriver.hilogEnd('testHistoryList0017');
    });

    /*
     * @tc.number: SUB_HSL_1800
     * @tc.name: testHistoryList0018
     * @tc.desc: Verify HistoryList scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const emptyBefore: boolean = await extDriver.isHistoryEmpty();
      expect(emptyBefore).assertTrue();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const emptyAfter: boolean = await extDriver.isHistoryEmpty();
      expect(emptyAfter).assertFalse();
      expect(typeof emptyAfter).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryList0018');
    });

    /*
     * @tc.number: SUB_HSL_1900
     * @tc.name: testHistoryList0019
     * @tc.desc: Verify HistoryList scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryList0019');
    });

    /*
     * @tc.number: SUB_HSL_2000
     * @tc.name: testHistoryList0020
     * @tc.desc: Verify HistoryList scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryList0020');
    });

    /*
     * @tc.number: SUB_HSL_2100
     * @tc.name: testHistoryList0021
     * @tc.desc: Verify HistoryList scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire: 0')).assertTrue();
      expect(pairing.includes('Release: 0')).assertTrue();
      expect(pairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryList0021');
    });

    /*
     * @tc.number: SUB_HSL_2200
     * @tc.name: testHistoryList0022
     * @tc.desc: Verify HistoryList scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 5; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
      }
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0022');
    });

    /*
     * @tc.number: SUB_HSL_2300
     * @tc.name: testHistoryList0023
     * @tc.desc: Verify HistoryList scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const isEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(isEmpty).assertFalse();
      expect(typeof isEmpty).assertEqual('boolean');
      expect(isEmpty).assertEqual(false);
      sharedDriver.hilogEnd('testHistoryList0023');
    });

    /*
     * @tc.number: SUB_HSL_2400
     * @tc.name: testHistoryList0024
     * @tc.desc: Verify HistoryList scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const before: boolean = await extDriver.isHistoryEmpty();
      expect(before).assertFalse();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const after: boolean = await extDriver.isHistoryEmpty();
      expect(after).assertTrue();
      expect(before !== after).assertTrue();
      sharedDriver.hilogEnd('testHistoryList0024');
    });

    /*
     * @tc.number: SUB_HSL_2500
     * @tc.name: testHistoryList0025
     * @tc.desc: Verify HistoryList scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertFalse();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testHistoryList0025');
    });

    /*
     * @tc.number: SUB_HSL_2600
     * @tc.name: testHistoryList0026
     * @tc.desc: Verify HistoryList scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0026');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryList0026');
    });

    /*
     * @tc.number: SUB_HSL_2700
     * @tc.name: testHistoryList0027
     * @tc.desc: Verify HistoryList scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0027');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryList0027');
    });

    /*
     * @tc.number: SUB_HSL_2800
     * @tc.name: testHistoryList0028
     * @tc.desc: Verify HistoryList scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0028');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId('queryAllStatesButton');
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById('operationResult');
      expect(result.includes('KeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testHistoryList0028');
    });

    /*
     * @tc.number: SUB_HSL_2900
     * @tc.name: testHistoryList0029
     * @tc.desc: Verify HistoryList scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testHistoryList0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0029');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const e1: boolean = await extDriver.isHistoryEmpty();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const e2: boolean = await extDriver.isHistoryEmpty();
      expect(e1).assertEqual(e2);
      expect(e1).assertTrue();
      expect(typeof e1).assertEqual('boolean');
      sharedDriver.hilogEnd('testHistoryList0029');
    });

    /*
     * @tc.number: SUB_HSL_3000
     * @tc.name: testHistoryList0030
     * @tc.desc: Verify HistoryList scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testHistoryList0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testHistoryList0030');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const empty: boolean = await extDriver.isHistoryEmpty();
      expect(empty).assertTrue();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const notEmpty: boolean = await extDriver.isHistoryEmpty();
      expect(notEmpty).assertFalse();
      expect(empty !== notEmpty).assertTrue();
      sharedDriver.hilogEnd('testHistoryList0030');
    });
  });
}
