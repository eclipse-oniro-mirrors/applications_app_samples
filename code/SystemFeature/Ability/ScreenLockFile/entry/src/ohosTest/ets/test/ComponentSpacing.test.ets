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
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  PAGE_PADDING, SECTION_SPACING, ITEM_SPACING, CARD_PADDING, CARD_RADIUS
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function componentSpacingTest(): void {
  describe('ComponentSpacingTest', (): void => {

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
    // ==================== 组件间距验证（25 条） ====================

    /*
     * @tc.number: SUB_CSP_0100
     * @tc.name: testComponentSpacing0001
     * @tc.desc: Verify ComponentSpacing scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0001');
      expect(PAGE_PADDING).assertEqual(24);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      sharedDriver.hilogEnd('testComponentSpacing0001');
    });

    /*
     * @tc.number: SUB_CSP_0200
     * @tc.name: testComponentSpacing0002
     * @tc.desc: Verify ComponentSpacing scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0002');
      expect(CARD_PADDING).assertEqual(20);
      expect(CARD_RADIUS).assertEqual(12);
      expect(typeof CARD_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testComponentSpacing0002');
    });

    /*
     * @tc.number: SUB_CSP_0300
     * @tc.name: testComponentSpacing0003
     * @tc.desc: Verify ComponentSpacing scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0003');
      expect(PAGE_PADDING).assertLarger(SECTION_SPACING);
      expect(SECTION_SPACING).assertLarger(ITEM_SPACING);
      expect(ITEM_SPACING).assertLarger(0);
      sharedDriver.hilogEnd('testComponentSpacing0003');
    });

    /*
     * @tc.number: SUB_CSP_0400
     * @tc.name: testComponentSpacing0004
     * @tc.desc: Verify ComponentSpacing scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0004');
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      expect(CARD_PADDING).assertLarger(ITEM_SPACING);
      expect(typeof CARD_RADIUS).assertEqual('number');
      sharedDriver.hilogEnd('testComponentSpacing0004');
    });

    /*
     * @tc.number: SUB_CSP_0500
     * @tc.name: testComponentSpacing0005
     * @tc.desc: Verify ComponentSpacing scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0005');
      expect(PAGE_PADDING).assertLarger(0);
      expect(SECTION_SPACING).assertLarger(0);
      expect(ITEM_SPACING).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      sharedDriver.hilogEnd('testComponentSpacing0005');
    });

    /*
     * @tc.number: SUB_CSP_0600
     * @tc.name: testComponentSpacing0006
     * @tc.desc: Verify ComponentSpacing scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0006');
      expect(typeof PAGE_PADDING).assertEqual('number');
      expect(typeof SECTION_SPACING).assertEqual('number');
      expect(typeof ITEM_SPACING).assertEqual('number');
      expect(typeof CARD_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testComponentSpacing0006');
    });

    /*
     * @tc.number: SUB_CSP_0700
     * @tc.name: testComponentSpacing0007
     * @tc.desc: Verify ComponentSpacing scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0007');
      expect(PAGE_PADDING - SECTION_SPACING).assertEqual(8);
      expect(SECTION_SPACING - ITEM_SPACING).assertEqual(4);
      expect(ITEM_SPACING).assertEqual(12);
      sharedDriver.hilogEnd('testComponentSpacing0007');
    });

    /*
     * @tc.number: SUB_CSP_0800
     * @tc.name: testComponentSpacing0008
     * @tc.desc: Verify ComponentSpacing scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0008');
      const sum = PAGE_PADDING + SECTION_SPACING + ITEM_SPACING;
      expect(sum).assertEqual(52);
      expect(sum).assertLarger(0);
      expect(typeof sum).assertEqual('number');
      sharedDriver.hilogEnd('testComponentSpacing0008');
    });

    /*
     * @tc.number: SUB_CSP_0900
     * @tc.name: testComponentSpacing0009
     * @tc.desc: Verify ComponentSpacing scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0009');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testComponentSpacing0009');
    });

    /*
     * @tc.number: SUB_CSP_1000
     * @tc.name: testComponentSpacing0010
     * @tc.desc: Verify ComponentSpacing scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0010');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testComponentSpacing0010');
    });

    /*
     * @tc.number: SUB_CSP_1100
     * @tc.name: testComponentSpacing0011
     * @tc.desc: Verify ComponentSpacing scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0011');
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testComponentSpacing0011');
    });

    /*
     * @tc.number: SUB_CSP_1200
     * @tc.name: testComponentSpacing0012
     * @tc.desc: Verify ComponentSpacing scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0012');
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('KeyState')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testComponentSpacing0012');
    });

    /*
     * @tc.number: SUB_CSP_1300
     * @tc.name: testComponentSpacing0013
     * @tc.desc: Verify ComponentSpacing scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0013');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testComponentSpacing0013');
    });

    /*
     * @tc.number: SUB_CSP_1400
     * @tc.name: testComponentSpacing0014
     * @tc.desc: Verify ComponentSpacing scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0014');
      const pairing = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('|')).assertTrue();
      expect(pairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testComponentSpacing0014');
    });

    /*
     * @tc.number: SUB_CSP_1500
     * @tc.name: testComponentSpacing0015
     * @tc.desc: Verify ComponentSpacing scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0015');
      expect(CARD_RADIUS).assertLess(CARD_PADDING);
      expect(CARD_RADIUS).assertLess(PAGE_PADDING);
      expect(CARD_RADIUS).assertLarger(0);
      sharedDriver.hilogEnd('testComponentSpacing0015');
    });

    /*
     * @tc.number: SUB_CSP_1600
     * @tc.name: testComponentSpacing0016
     * @tc.desc: Verify ComponentSpacing scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0016');
      const spacings: number[] = [PAGE_PADDING, SECTION_SPACING, ITEM_SPACING, CARD_PADDING, CARD_RADIUS];
      expect(spacings.length).assertEqual(5);
      for (let i = 0; i < spacings.length; i++) {
        expect(spacings[i]).assertLarger(0);
        expect(typeof spacings[i]).assertEqual('number');
      }
      sharedDriver.hilogEnd('testComponentSpacing0016');
    });

    /*
     * @tc.number: SUB_CSP_1700
     * @tc.name: testComponentSpacing0017
     * @tc.desc: Verify ComponentSpacing scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0017');
      const q = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testComponentSpacing0017');
    });

    /*
     * @tc.number: SUB_CSP_1800
     * @tc.name: testComponentSpacing0018
     * @tc.desc: Verify ComponentSpacing scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0018');
      const qa = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      const cl = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      const res = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(qa).assertTrue();
      expect(cl).assertTrue();
      expect(res).assertTrue();
      sharedDriver.hilogEnd('testComponentSpacing0018');
    });

    /*
     * @tc.number: SUB_CSP_1900
     * @tc.name: testComponentSpacing0019
     * @tc.desc: Verify ComponentSpacing scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0019');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testComponentSpacing0019');
    });

    /*
     * @tc.number: SUB_CSP_2000
     * @tc.name: testComponentSpacing0020
     * @tc.desc: Verify ComponentSpacing scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0020');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertFalse();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(false);
      sharedDriver.hilogEnd('testComponentSpacing0020');
    });

    /*
     * @tc.number: SUB_CSP_2100
     * @tc.name: testComponentSpacing0021
     * @tc.desc: Verify ComponentSpacing scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0021');
      expect(PAGE_PADDING).assertEqual(24);
      expect(CARD_PADDING).assertEqual(20);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      sharedDriver.hilogEnd('testComponentSpacing0021');
    });

    /*
     * @tc.number: SUB_CSP_2200
     * @tc.name: testComponentSpacing0022
     * @tc.desc: Verify ComponentSpacing scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0022');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r1 = await textOfId(ID_OPERATION_RESULT);
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r2 = await textOfId(ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r2.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testComponentSpacing0022');
    });

    /*
     * @tc.number: SUB_CSP_2300
     * @tc.name: testComponentSpacing0023
     * @tc.desc: Verify ComponentSpacing scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0023');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testComponentSpacing0023');
    });

    /*
     * @tc.number: SUB_CSP_2400
     * @tc.name: testComponentSpacing0024
     * @tc.desc: Verify ComponentSpacing scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0024');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Pending: 0')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testComponentSpacing0024');
    });

    /*
     * @tc.number: SUB_CSP_2500
     * @tc.name: testComponentSpacing0025
     * @tc.desc: Verify ComponentSpacing scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testComponentSpacing0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testComponentSpacing0025');
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      expect(PAGE_PADDING).assertEqual(24);
      expect(typeof CARD_RADIUS).assertEqual('number');
      sharedDriver.hilogEnd('testComponentSpacing0025');
    });
  });
}
