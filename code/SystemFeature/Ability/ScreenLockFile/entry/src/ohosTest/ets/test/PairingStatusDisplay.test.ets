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
  DOMAIN, TAG, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_CLEAR_HISTORY_BUTTON,
  ID_QUERY_ALL_BUTTON
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function pairingStatusDisplayTest(): void {
  describe('PairingStatusDisplayTest', (): void => {

    // ==================== 配对状态展示验证（25 条） ====================

    /*
     * @tc.number: SUB_PSD_0100
     * @tc.name: testPairingStatusDisplay0001
     * @tc.desc: Verify PairingStatusDisplay scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire: 0')).assertTrue();
      expect(text.includes('Release: 0')).assertTrue();
      expect(text.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0001');
    });

    /*
     * @tc.number: SUB_PSD_0200
     * @tc.name: testPairingStatusDisplay0002
     * @tc.desc: Verify PairingStatusDisplay scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0002');
    });

    /*
     * @tc.number: SUB_PSD_0300
     * @tc.name: testPairingStatusDisplay0003
     * @tc.desc: Verify PairingStatusDisplay scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Release:')).assertTrue();
      expect(text.includes('Pending:')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0003');
    });

    /*
     * @tc.number: SUB_PSD_0400
     * @tc.name: testPairingStatusDisplay0004
     * @tc.desc: Verify PairingStatusDisplay scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('|')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0004');
    });

    /*
     * @tc.number: SUB_PSD_0500
     * @tc.name: testPairingStatusDisplay0005
     * @tc.desc: Verify PairingStatusDisplay scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire: 0')).assertTrue();
      expect(text.includes('Release: 0')).assertTrue();
      expect(text.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0005');
    });

    /*
     * @tc.number: SUB_PSD_0600
     * @tc.name: testPairingStatusDisplay0006
     * @tc.desc: Verify PairingStatusDisplay scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Pending:')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0006');
    });

    /*
     * @tc.number: SUB_PSD_0700
     * @tc.name: testPairingStatusDisplay0007
     * @tc.desc: Verify PairingStatusDisplay scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0007');
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
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Pending:')).assertTrue();
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0007');
    });

    /*
     * @tc.number: SUB_PSD_0800
     * @tc.name: testPairingStatusDisplay0008
     * @tc.desc: Verify PairingStatusDisplay scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Pending: 0')).assertTrue();
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0008');
    });

    /*
     * @tc.number: SUB_PSD_0900
     * @tc.name: testPairingStatusDisplay0009
     * @tc.desc: Verify PairingStatusDisplay scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const exists: boolean = await sharedDriver.existsId('pairingStatus');
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testPairingStatusDisplay0009');
    });

    /*
     * @tc.number: SUB_PSD_1000
     * @tc.name: testPairingStatusDisplay0010
     * @tc.desc: Verify PairingStatusDisplay scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      const pipeCount: number = text.split('|').length - 1;
      expect(pipeCount).assertEqual(2);
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0010');
    });

    /*
     * @tc.number: SUB_PSD_1100
     * @tc.name: testPairingStatusDisplay0011
     * @tc.desc: Verify PairingStatusDisplay scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const before: string = await sharedDriver.getTextById('pairingStatus');
      expect(before.includes('Acquire: 0')).assertTrue();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const after: string = await sharedDriver.getTextById('pairingStatus');
      expect(after.includes('Acquire:')).assertTrue();
      expect(before !== after).assertTrue();
      expect(after.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0011');
    });

    /*
     * @tc.number: SUB_PSD_1200
     * @tc.name: testPairingStatusDisplay0012
     * @tc.desc: Verify PairingStatusDisplay scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const t1: string = await sharedDriver.getTextById('pairingStatus');
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const t2: string = await sharedDriver.getTextById('pairingStatus');
      expect(t1 !== t2).assertTrue();
      expect(t2.includes('Release:')).assertTrue();
      expect(t2.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0012');
    });

    /*
     * @tc.number: SUB_PSD_1300
     * @tc.name: testPairingStatusDisplay0013
     * @tc.desc: Verify PairingStatusDisplay scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairingText: string = await sharedDriver.getTextById('pairingStatus');
      const queryResult: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, 'operationResult');
      expect(pairingText.includes('Acquire:')).assertTrue();
      expect(queryResult.includes('Acquire:')).assertTrue();
      expect(pairingText.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0013');
    });

    /*
     * @tc.number: SUB_PSD_1400
     * @tc.name: testPairingStatusDisplay0014
     * @tc.desc: Verify PairingStatusDisplay scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0014');
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
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      expect(text.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0014');
    });

    /*
     * @tc.number: SUB_PSD_1500
     * @tc.name: testPairingStatusDisplay0015
     * @tc.desc: Verify PairingStatusDisplay scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Pending: 0')).assertTrue();
      expect(text.includes('Pending: -')).assertFalse();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0015');
    });

    /*
     * @tc.number: SUB_PSD_1600
     * @tc.name: testPairingStatusDisplay0016
     * @tc.desc: Verify PairingStatusDisplay scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(typeof text).assertEqual('string');
      expect(text.length).assertLarger(0);
      expect(text.includes(':')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0016');
    });

    /*
     * @tc.number: SUB_PSD_1700
     * @tc.name: testPairingStatusDisplay0017
     * @tc.desc: Verify PairingStatusDisplay scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0017');
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
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Pending: 0')).assertTrue();
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0017');
    });

    /*
     * @tc.number: SUB_PSD_1800
     * @tc.name: testPairingStatusDisplay0018
     * @tc.desc: Verify PairingStatusDisplay scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire: 0')).assertTrue();
      expect(text.includes('Release: 0')).assertTrue();
      expect(text.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0018');
    });

    /*
     * @tc.number: SUB_PSD_1900
     * @tc.name: testPairingStatusDisplay0019
     * @tc.desc: Verify PairingStatusDisplay scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const t1: string = await sharedDriver.getTextById('pairingStatus');
      const t2: string = await sharedDriver.getTextById('pairingStatus');
      expect(t1).assertEqual(t2);
      expect(t1.length).assertLarger(0);
      expect(typeof t1).assertEqual('string');
      sharedDriver.hilogEnd('testPairingStatusDisplay0019');
    });

    /*
     * @tc.number: SUB_PSD_2000
     * @tc.name: testPairingStatusDisplay0020
     * @tc.desc: Verify PairingStatusDisplay scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      const sections: string[] = text.split('|');
      expect(sections.length).assertEqual(3);
      expect(sections[0].includes('Acquire')).assertTrue();
      expect(sections[1].includes('Release')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0020');
    });

    /*
     * @tc.number: SUB_PSD_2100
     * @tc.name: testPairingStatusDisplay0021
     * @tc.desc: Verify PairingStatusDisplay scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Pending:')).assertTrue();
      expect(text.includes('Pending: 0')).assertFalse();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0021');
    });

    /*
     * @tc.number: SUB_PSD_2200
     * @tc.name: testPairingStatusDisplay0022
     * @tc.desc: Verify PairingStatusDisplay scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Pending: 0')).assertTrue();
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0022');
    });

    /*
     * @tc.number: SUB_PSD_2300
     * @tc.name: testPairingStatusDisplay0023
     * @tc.desc: Verify PairingStatusDisplay scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      const regex: RegExp = new RegExp('\\d+');
      const hasNumbers: boolean = regex.test(text);
      expect(hasNumbers).assertTrue();
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0023');
    });

    /*
     * @tc.number: SUB_PSD_2400
     * @tc.name: testPairingStatusDisplay0024
     * @tc.desc: Verify PairingStatusDisplay scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const beforeQueryAll: string = await sharedDriver.getTextById('pairingStatus');
      await sharedDriver.clickId(ID_QUERY_ALL_BUTTON);
      await sharedDriver.waitUiIdle();
      const afterQueryAll: string = await sharedDriver.getTextById('pairingStatus');
      expect(beforeQueryAll).assertEqual(afterQueryAll);
      expect(beforeQueryAll.includes('Acquire:')).assertTrue();
      expect(beforeQueryAll.length).assertLarger(0);
      sharedDriver.hilogEnd('testPairingStatusDisplay0024');
    });

    /*
     * @tc.number: SUB_PSD_2500
     * @tc.name: testPairingStatusDisplay0025
     * @tc.desc: Verify PairingStatusDisplay scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPairingStatusDisplay0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPairingStatusDisplay0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(typeof text).assertEqual('string');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      expect(text.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testPairingStatusDisplay0025');
    });
  });
}
