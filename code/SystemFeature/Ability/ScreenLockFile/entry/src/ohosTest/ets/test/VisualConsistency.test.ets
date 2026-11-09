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
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  PAGE_PADDING, SECTION_SPACING, ITEM_SPACING,
  TITLE_FONT_SIZE, SUBTITLE_FONT_SIZE, BODY_FONT_SIZE, SMALL_FONT_SIZE,
  CONTENT_MAX_WIDTH, BUTTON_HEIGHT, CARD_RADIUS, CARD_PADDING, MAX_HISTORY_SIZE
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const extDriver: SharedDriverExt = new SharedDriverExt(sharedDriver);

export default function visualConsistencyTest(): void {
  describe('VisualConsistencyTest', (): void => {

    // ==================== 视觉一致性验证（25 条） ====================

    /*
     * @tc.number: SUB_VSC_0100
     * @tc.name: testVisualConsistency0001
     * @tc.desc: Verify VisualConsistency scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0001');
      expect(TITLE_FONT_SIZE).assertLarger(SUBTITLE_FONT_SIZE);
      expect(SUBTITLE_FONT_SIZE).assertLarger(BODY_FONT_SIZE);
      expect(BODY_FONT_SIZE).assertLarger(SMALL_FONT_SIZE);
      sharedDriver.hilogEnd('testVisualConsistency0001');
    });

    /*
     * @tc.number: SUB_VSC_0200
     * @tc.name: testVisualConsistency0002
     * @tc.desc: Verify VisualConsistency scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0002');
      expect(PAGE_PADDING).assertEqual(24);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      sharedDriver.hilogEnd('testVisualConsistency0002');
    });

    /*
     * @tc.number: SUB_VSC_0300
     * @tc.name: testVisualConsistency0003
     * @tc.desc: Verify VisualConsistency scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0003');
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(MAX_HISTORY_SIZE).assertEqual(10);
      sharedDriver.hilogEnd('testVisualConsistency0003');
    });

    /*
     * @tc.number: SUB_VSC_0400
     * @tc.name: testVisualConsistency0004
     * @tc.desc: Verify VisualConsistency scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      const qa: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testVisualConsistency0004');
    });

    /*
     * @tc.number: SUB_VSC_0500
     * @tc.name: testVisualConsistency0005
     * @tc.desc: Verify VisualConsistency scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.scrollToId(ID_OPERATION_RESULT);
      const res: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      await sharedDriver.scrollToId('pairingStatus');
      const pr: boolean = await sharedDriver.existsId('pairingStatus');
      await sharedDriver.scrollToId(ID_CLEAR_HISTORY_BUTTON);
      const cl: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(res).assertTrue();
      expect(pr).assertTrue();
      expect(cl).assertTrue();
      sharedDriver.hilogEnd('testVisualConsistency0005');
    });

    /*
     * @tc.number: SUB_VSC_0600
     * @tc.name: testVisualConsistency0006
     * @tc.desc: Verify VisualConsistency scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testVisualConsistency0006');
    });

    /*
     * @tc.number: SUB_VSC_0700
     * @tc.name: testVisualConsistency0007
     * @tc.desc: Verify VisualConsistency scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.includes('ACCESS_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testVisualConsistency0007');
    });

    /*
     * @tc.number: SUB_VSC_0800
     * @tc.name: testVisualConsistency0008
     * @tc.desc: Verify VisualConsistency scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.includes('RELEASE_')).assertTrue();
      expect(result.length).assertLarger(5);
      sharedDriver.hilogEnd('testVisualConsistency0008');
    });

    /*
     * @tc.number: SUB_VSC_0900
     * @tc.name: testVisualConsistency0009
     * @tc.desc: Verify VisualConsistency scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testVisualConsistency0009');
    });

    /*
     * @tc.number: SUB_VSC_1000
     * @tc.name: testVisualConsistency0010
     * @tc.desc: Verify VisualConsistency scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testVisualConsistency0010');
    });

    /*
     * @tc.number: SUB_VSC_1100
     * @tc.name: testVisualConsistency0011
     * @tc.desc: Verify VisualConsistency scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('|')).assertTrue();
      expect(pairing.includes('Release:')).assertTrue();
      sharedDriver.hilogEnd('testVisualConsistency0011');
    });

    /*
     * @tc.number: SUB_VSC_1200
     * @tc.name: testVisualConsistency0012
     * @tc.desc: Verify VisualConsistency scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire: 0')).assertTrue();
      expect(pairing.includes('Release: 0')).assertTrue();
      expect(pairing.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testVisualConsistency0012');
    });

    /*
     * @tc.number: SUB_VSC_1300
     * @tc.name: testVisualConsistency0013
     * @tc.desc: Verify VisualConsistency scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0013');
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      expect(PAGE_PADDING).assertLarger(SECTION_SPACING);
      expect(SECTION_SPACING).assertLarger(ITEM_SPACING);
      sharedDriver.hilogEnd('testVisualConsistency0013');
    });

    /*
     * @tc.number: SUB_VSC_1400
     * @tc.name: testVisualConsistency0014
     * @tc.desc: Verify VisualConsistency scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0014');
      expect(typeof PAGE_PADDING).assertEqual('number');
      expect(typeof SECTION_SPACING).assertEqual('number');
      expect(typeof ITEM_SPACING).assertEqual('number');
      expect(typeof CARD_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testVisualConsistency0014');
    });

    /*
     * @tc.number: SUB_VSC_1500
     * @tc.name: testVisualConsistency0015
     * @tc.desc: Verify VisualConsistency scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0015');
      expect(typeof TITLE_FONT_SIZE).assertEqual('number');
      expect(typeof SUBTITLE_FONT_SIZE).assertEqual('number');
      expect(typeof BODY_FONT_SIZE).assertEqual('number');
      expect(typeof SMALL_FONT_SIZE).assertEqual('number');
      sharedDriver.hilogEnd('testVisualConsistency0015');
    });

    /*
     * @tc.number: SUB_VSC_1600
     * @tc.name: testVisualConsistency0016
     * @tc.desc: Verify VisualConsistency scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testVisualConsistency0016');
    });

    /*
     * @tc.number: SUB_VSC_1700
     * @tc.name: testVisualConsistency0017
     * @tc.desc: Verify VisualConsistency scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0017');
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
      sharedDriver.hilogEnd('testVisualConsistency0017');
    });

    /*
     * @tc.number: SUB_VSC_1800
     * @tc.name: testVisualConsistency0018
     * @tc.desc: Verify VisualConsistency scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      const r2: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r2.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testVisualConsistency0018');
    });

    /*
     * @tc.number: SUB_VSC_1900
     * @tc.name: testVisualConsistency0019
     * @tc.desc: Verify VisualConsistency scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0019');
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
      sharedDriver.hilogEnd('testVisualConsistency0019');
    });

    /*
     * @tc.number: SUB_VSC_2000
     * @tc.name: testVisualConsistency0020
     * @tc.desc: Verify VisualConsistency scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0020');
      expect(CONTENT_MAX_WIDTH).assertLarger(BUTTON_HEIGHT);
      expect(CONTENT_MAX_WIDTH).assertLarger(CARD_PADDING * 2);
      expect(CONTENT_MAX_WIDTH).assertLarger(0);
      sharedDriver.hilogEnd('testVisualConsistency0020');
    });

    /*
     * @tc.number: SUB_VSC_2100
     * @tc.name: testVisualConsistency0021
     * @tc.desc: Verify VisualConsistency scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0021');
      expect(BUTTON_HEIGHT).assertLarger(SMALL_FONT_SIZE);
      expect(BUTTON_HEIGHT).assertLarger(BODY_FONT_SIZE);
      expect(BUTTON_HEIGHT).assertLess(TITLE_FONT_SIZE * 2);
      sharedDriver.hilogEnd('testVisualConsistency0021');
    });

    /*
     * @tc.number: SUB_VSC_2200
     * @tc.name: testVisualConsistency0022
     * @tc.desc: Verify VisualConsistency scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0022');
      expect(CARD_RADIUS).assertLess(CARD_PADDING);
      expect(CARD_RADIUS).assertLess(BUTTON_HEIGHT);
      expect(CARD_RADIUS).assertLarger(0);
      sharedDriver.hilogEnd('testVisualConsistency0022');
    });

    /*
     * @tc.number: SUB_VSC_2300
     * @tc.name: testVisualConsistency0023
     * @tc.desc: Verify VisualConsistency scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0023');
      const allConstants: number[] = [PAGE_PADDING, SECTION_SPACING, ITEM_SPACING, CARD_PADDING, CARD_RADIUS, BUTTON_HEIGHT, CONTENT_MAX_WIDTH, MAX_HISTORY_SIZE];
      expect(allConstants.length).assertEqual(8);
      for (let i: number = 0; i < allConstants.length; i++) {
        expect(allConstants[i]).assertLarger(0);
        expect(typeof allConstants[i]).assertEqual('number');
      }
      sharedDriver.hilogEnd('testVisualConsistency0023');
    });

    /*
     * @tc.number: SUB_VSC_2400
     * @tc.name: testVisualConsistency0024
     * @tc.desc: Verify VisualConsistency scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(typeof result.length).assertEqual('number');
      sharedDriver.hilogEnd('testVisualConsistency0024');
    });

    /*
     * @tc.number: SUB_VSC_2500
     * @tc.name: testVisualConsistency0025
     * @tc.desc: Verify VisualConsistency scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testVisualConsistency0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testVisualConsistency0025');
      expect(PAGE_PADDING).assertEqual(24);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      expect(CARD_RADIUS).assertEqual(12);
      sharedDriver.hilogEnd('testVisualConsistency0025');
    });
  });
}
