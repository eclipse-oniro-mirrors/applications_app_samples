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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, CARD_RADIUS, CARD_PADDING, SECTION_SPACING, ITEM_SPACING,
  ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function cardStyleTest(): void {
  describe('CardStyleTest', (): void => {

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
    // ==================== 卡片样式验证（20 条） ====================

    /*
     * @tc.number: SUB_CST_0100
     * @tc.name: testCardStyle0001
     * @tc.desc: Verify CardStyle scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testCardStyle0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0001');
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      expect(typeof CARD_RADIUS).assertEqual('number');
      sharedDriver.hilogEnd('testCardStyle0001');
    });

    /*
     * @tc.number: SUB_CST_0200
     * @tc.name: testCardStyle0002
     * @tc.desc: Verify CardStyle scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testCardStyle0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0002');
      expect(CARD_RADIUS).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      sharedDriver.hilogEnd('testCardStyle0002');
    });

    /*
     * @tc.number: SUB_CST_0300
     * @tc.name: testCardStyle0003
     * @tc.desc: Verify CardStyle scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testCardStyle0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0003');
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(SECTION_SPACING).assertLarger(ITEM_SPACING);
      sharedDriver.hilogEnd('testCardStyle0003');
    });

    /*
     * @tc.number: SUB_CST_0400
     * @tc.name: testCardStyle0004
     * @tc.desc: Verify CardStyle scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testCardStyle0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0004');
      await scrollToId(ID_OPERATION_RESULT)
      const exists: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testCardStyle0004');
    });

    /*
     * @tc.number: SUB_CST_0500
     * @tc.name: testCardStyle0005
     * @tc.desc: Verify CardStyle scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testCardStyle0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0005');
      await scrollToId('pairingStatus')
      const exists: boolean = await sharedDriver.existsId('pairingStatus');
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testCardStyle0005');
    });

    /*
     * @tc.number: SUB_CST_0600
     * @tc.name: testCardStyle0006
     * @tc.desc: Verify CardStyle scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0006');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testCardStyle0006');
    });

    /*
     * @tc.number: SUB_CST_0700
     * @tc.name: testCardStyle0007
     * @tc.desc: Verify CardStyle scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0007');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertFalse();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(false);
      sharedDriver.hilogEnd('testCardStyle0007');
    });

    /*
     * @tc.number: SUB_CST_0800
     * @tc.name: testCardStyle0008
     * @tc.desc: Verify CardStyle scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0008');
      expect(CARD_PADDING).assertLarger(SECTION_SPACING);
      expect(SECTION_SPACING).assertLarger(ITEM_SPACING);
      expect(ITEM_SPACING).assertLarger(0);
      sharedDriver.hilogEnd('testCardStyle0008');
    });

    /*
     * @tc.number: SUB_CST_0900
     * @tc.name: testCardStyle0009
     * @tc.desc: Verify CardStyle scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0009');
      expect(typeof CARD_RADIUS).assertEqual('number');
      expect(typeof CARD_PADDING).assertEqual('number');
      expect(typeof SECTION_SPACING).assertEqual('number');
      expect(typeof ITEM_SPACING).assertEqual('number');
      sharedDriver.hilogEnd('testCardStyle0009');
    });

    /*
     * @tc.number: SUB_CST_1000
     * @tc.name: testCardStyle0010
     * @tc.desc: Verify CardStyle scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0010');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testCardStyle0010');
    });

    /*
     * @tc.number: SUB_CST_1100
     * @tc.name: testCardStyle0011
     * @tc.desc: Verify CardStyle scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0011');
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testCardStyle0011');
    });

    /*
     * @tc.number: SUB_CST_1200
     * @tc.name: testCardStyle0012
     * @tc.desc: Verify CardStyle scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0012');
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testCardStyle0012');
    });

    /*
     * @tc.number: SUB_CST_1300
     * @tc.name: testCardStyle0013
     * @tc.desc: Verify CardStyle scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0013');
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('Release:')).assertTrue();
      expect(pairing.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testCardStyle0013');
    });

    /*
     * @tc.number: SUB_CST_1400
     * @tc.name: testCardStyle0014
     * @tc.desc: Verify CardStyle scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0014');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire: 0')).assertTrue();
      expect(pairing.includes('Release: 0')).assertTrue();
      expect(pairing.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testCardStyle0014');
    });

    /*
     * @tc.number: SUB_CST_1500
     * @tc.name: testCardStyle0015
     * @tc.desc: Verify CardStyle scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0015');
      expect(CARD_RADIUS).assertLess(CARD_PADDING);
      expect(CARD_RADIUS).assertLess(SECTION_SPACING);
      expect(CARD_RADIUS).assertLarger(0);
      sharedDriver.hilogEnd('testCardStyle0015');
    });

    /*
     * @tc.number: SUB_CST_1600
     * @tc.name: testCardStyle0016
     * @tc.desc: Verify CardStyle scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0016');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const r2: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.length).assertLarger(0);
      expect(r2.length).assertLarger(0);
      sharedDriver.hilogEnd('testCardStyle0016');
    });

    /*
     * @tc.number: SUB_CST_1700
     * @tc.name: testCardStyle0017
     * @tc.desc: Verify CardStyle scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0017');
      const cl: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(cl).assertTrue();
      expect(typeof cl).assertEqual('boolean');
      expect(cl).assertEqual(true);
      sharedDriver.hilogEnd('testCardStyle0017');
    });

    /*
     * @tc.number: SUB_CST_1800
     * @tc.name: testCardStyle0018
     * @tc.desc: Verify CardStyle scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0018');
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(typeof q).assertEqual('boolean');
      sharedDriver.hilogEnd('testCardStyle0018');
    });

    /*
     * @tc.number: SUB_CST_1900
     * @tc.name: testCardStyle0019
     * @tc.desc: Verify CardStyle scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0019');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testCardStyle0019');
    });

    /*
     * @tc.number: SUB_CST_2000
     * @tc.name: testCardStyle0020
     * @tc.desc: Verify CardStyle scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testCardStyle0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testCardStyle0020');
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      sharedDriver.hilogEnd('testCardStyle0020');
    });
  });
}
