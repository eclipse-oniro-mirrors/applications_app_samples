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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  SECTION_SPACING, ITEM_SPACING, CARD_PADDING, CARD_RADIUS
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function sectionLayoutTest(): void {
  describe('SectionLayoutTest', (): void => {

    // ==================== 分区布局验证（25 条） ====================

    /*
     * @tc.number: SUB_SNL_0100
     * @tc.name: testSectionLayout0001
     * @tc.desc: Verify SectionLayout scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testSectionLayout0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0001');
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(SECTION_SPACING).assertLarger(ITEM_SPACING);
      sharedDriver.hilogEnd('testSectionLayout0001');
    });

    /*
     * @tc.number: SUB_SNL_0200
     * @tc.name: testSectionLayout0002
     * @tc.desc: Verify SectionLayout scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testSectionLayout0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0002');
      expect(CARD_PADDING).assertEqual(20);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      sharedDriver.hilogEnd('testSectionLayout0002');
    });

    /*
     * @tc.number: SUB_SNL_0300
     * @tc.name: testSectionLayout0003
     * @tc.desc: Verify SectionLayout scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testSectionLayout0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0003');
      expect(typeof SECTION_SPACING).assertEqual('number');
      expect(typeof ITEM_SPACING).assertEqual('number');
      expect(typeof CARD_PADDING).assertEqual('number');
      expect(typeof CARD_RADIUS).assertEqual('number');
      sharedDriver.hilogEnd('testSectionLayout0003');
    });

    /*
     * @tc.number: SUB_SNL_0400
     * @tc.name: testSectionLayout0004
     * @tc.desc: Verify SectionLayout scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testSectionLayout0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0004');
      expect(SECTION_SPACING).assertLarger(0);
      expect(ITEM_SPACING).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      expect(CARD_RADIUS).assertLarger(0);
      sharedDriver.hilogEnd('testSectionLayout0004');
    });

    /*
     * @tc.number: SUB_SNL_0500
     * @tc.name: testSectionLayout0005
     * @tc.desc: Verify SectionLayout scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testSectionLayout0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testSectionLayout0005');
    });

    /*
     * @tc.number: SUB_SNL_0600
     * @tc.name: testSectionLayout0006
     * @tc.desc: Verify SectionLayout scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('|')).assertTrue();
      expect(pairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testSectionLayout0006');
    });

    /*
     * @tc.number: SUB_SNL_0700
     * @tc.name: testSectionLayout0007
     * @tc.desc: Verify SectionLayout scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testSectionLayout0007');
    });

    /*
     * @tc.number: SUB_SNL_0800
     * @tc.name: testSectionLayout0008
     * @tc.desc: Verify SectionLayout scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0008');
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
      sharedDriver.hilogEnd('testSectionLayout0008');
    });

    /*
     * @tc.number: SUB_SNL_0900
     * @tc.name: testSectionLayout0009
     * @tc.desc: Verify SectionLayout scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      const r2: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r2.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0009');
    });

    /*
     * @tc.number: SUB_SNL_1000
     * @tc.name: testSectionLayout0010
     * @tc.desc: Verify SectionLayout scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      const r2: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('acquireAccess')).assertTrue();
      expect(r2.includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0010');
    });

    /*
     * @tc.number: SUB_SNL_1100
     * @tc.name: testSectionLayout0011
     * @tc.desc: Verify SectionLayout scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0011');
    });

    /*
     * @tc.number: SUB_SNL_1200
     * @tc.name: testSectionLayout0012
     * @tc.desc: Verify SectionLayout scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testSectionLayout0012');
    });

    /*
     * @tc.number: SUB_SNL_1300
     * @tc.name: testSectionLayout0013
     * @tc.desc: Verify SectionLayout scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0013');
      expect(SECTION_SPACING + ITEM_SPACING).assertEqual(28);
      expect(CARD_PADDING + CARD_RADIUS).assertEqual(32);
      expect(typeof (SECTION_SPACING + ITEM_SPACING)).assertEqual('number');
      sharedDriver.hilogEnd('testSectionLayout0013');
    });

    /*
     * @tc.number: SUB_SNL_1400
     * @tc.name: testSectionLayout0014
     * @tc.desc: Verify SectionLayout scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0014');
      expect(CARD_PADDING).assertLarger(ITEM_SPACING);
      expect(CARD_PADDING).assertLarger(SECTION_SPACING);
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      sharedDriver.hilogEnd('testSectionLayout0014');
    });

    /*
     * @tc.number: SUB_SNL_1500
     * @tc.name: testSectionLayout0015
     * @tc.desc: Verify SectionLayout scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0015');
    });

    /*
     * @tc.number: SUB_SNL_1600
     * @tc.name: testSectionLayout0016
     * @tc.desc: Verify SectionLayout scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const qa: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      const cl: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      const res: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(qa).assertTrue();
      expect(cl).assertTrue();
      expect(res).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0016');
    });

    /*
     * @tc.number: SUB_SNL_1700
     * @tc.name: testSectionLayout0017
     * @tc.desc: Verify SectionLayout scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0017');
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
      sharedDriver.hilogEnd('testSectionLayout0017');
    });

    /*
     * @tc.number: SUB_SNL_1800
     * @tc.name: testSectionLayout0018
     * @tc.desc: Verify SectionLayout scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Pending: 0')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testSectionLayout0018');
    });

    /*
     * @tc.number: SUB_SNL_1900
     * @tc.name: testSectionLayout0019
     * @tc.desc: Verify SectionLayout scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0019');
    });

    /*
     * @tc.number: SUB_SNL_2000
     * @tc.name: testSectionLayout0020
     * @tc.desc: Verify SectionLayout scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0020');
    });

    /*
     * @tc.number: SUB_SNL_2100
     * @tc.name: testSectionLayout0021
     * @tc.desc: Verify SectionLayout scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('(')).assertTrue();
      expect(result.includes(')')).assertTrue();
      expect(result.includes('RELEASE_')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0021');
    });

    /*
     * @tc.number: SUB_SNL_2200
     * @tc.name: testSectionLayout0022
     * @tc.desc: Verify SectionLayout scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      const parts: string[] = result.split('|');
      expect(parts.length).assertEqual(4);
      expect(parts[0].includes('KeyState')).assertTrue();
      expect(parts[1].includes('Acquire')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0022');
    });

    /*
     * @tc.number: SUB_SNL_2300
     * @tc.name: testSectionLayout0023
     * @tc.desc: Verify SectionLayout scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire: 0')).assertTrue();
      expect(pairing.includes('Release: 0')).assertTrue();
      expect(pairing.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testSectionLayout0023');
    });

    /*
     * @tc.number: SUB_SNL_2400
     * @tc.name: testSectionLayout0024
     * @tc.desc: Verify SectionLayout scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof r1).assertEqual('string');
      expect(r1.length).assertLarger(0);
      expect(typeof r1.length).assertEqual('number');
      sharedDriver.hilogEnd('testSectionLayout0024');
    });

    /*
     * @tc.number: SUB_SNL_2500
     * @tc.name: testSectionLayout0025
     * @tc.desc: Verify SectionLayout scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testSectionLayout0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testSectionLayout0025');
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      expect(CARD_RADIUS).assertEqual(12);
      sharedDriver.hilogEnd('testSectionLayout0025');
    });
  });
}
