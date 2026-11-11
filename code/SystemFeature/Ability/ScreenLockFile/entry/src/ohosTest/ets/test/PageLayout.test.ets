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

export default function pageLayoutTest(): void {
  describe('PageLayoutTest', (): void => {

    // ==================== 页面布局验证（25 条） ====================

    /*
     * @tc.number: SUB_PLY_0100
     * @tc.name: testPageLayout0001
     * @tc.desc: Verify PageLayout scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      const qa: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testPageLayout0001');
    });

    /*
     * @tc.number: SUB_PLY_0200
     * @tc.name: testPageLayout0002
     * @tc.desc: Verify PageLayout scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT);
      const exists: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testPageLayout0002');
    });

    /*
     * @tc.number: SUB_PLY_0300
     * @tc.name: testPageLayout0003
     * @tc.desc: Verify PageLayout scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0003');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await scrollToId('pairingStatus');
      const exists: boolean = await sharedDriver.existsId('pairingStatus');
      expect(exists).assertTrue();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPageLayout0003');
    });

    /*
     * @tc.number: SUB_PLY_0400
     * @tc.name: testPageLayout0004
     * @tc.desc: Verify PageLayout scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      const exists: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(exists).assertTrue();
      expect(typeof exists).assertEqual('boolean');
      expect(exists).assertEqual(true);
      sharedDriver.hilogEnd('testPageLayout0004');
    });

    /*
     * @tc.number: SUB_PLY_0500
     * @tc.name: testPageLayout0005
     * @tc.desc: Verify PageLayout scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0005');
      expect(PAGE_PADDING).assertEqual(24);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(typeof PAGE_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0005');
    });

    /*
     * @tc.number: SUB_PLY_0600
     * @tc.name: testPageLayout0006
     * @tc.desc: Verify PageLayout scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0006');
      expect(TITLE_FONT_SIZE).assertEqual(28);
      expect(SUBTITLE_FONT_SIZE).assertEqual(20);
      expect(BODY_FONT_SIZE).assertEqual(16);
      expect(SMALL_FONT_SIZE).assertEqual(14);
      sharedDriver.hilogEnd('testPageLayout0006');
    });

    /*
     * @tc.number: SUB_PLY_0700
     * @tc.name: testPageLayout0007
     * @tc.desc: Verify PageLayout scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0007');
      expect(TITLE_FONT_SIZE).assertLarger(SUBTITLE_FONT_SIZE);
      expect(SUBTITLE_FONT_SIZE).assertLarger(BODY_FONT_SIZE);
      expect(BODY_FONT_SIZE).assertLarger(SMALL_FONT_SIZE);
      expect(SMALL_FONT_SIZE).assertLarger(0);
      sharedDriver.hilogEnd('testPageLayout0007');
    });

    /*
     * @tc.number: SUB_PLY_0800
     * @tc.name: testPageLayout0008
     * @tc.desc: Verify PageLayout scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0008');
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      sharedDriver.hilogEnd('testPageLayout0008');
    });

    /*
     * @tc.number: SUB_PLY_0900
     * @tc.name: testPageLayout0009
     * @tc.desc: Verify PageLayout scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0009');
      expect(MAX_HISTORY_SIZE).assertEqual(10);
      expect(MAX_HISTORY_SIZE).assertLarger(0);
      expect(typeof MAX_HISTORY_SIZE).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0009');
    });

    /*
     * @tc.number: SUB_PLY_1000
     * @tc.name: testPageLayout0010
     * @tc.desc: Verify PageLayout scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const ids: string[] = [ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON];
      expect(ids.length).assertEqual(4);
      for (let i: number = 0; i < ids.length; i++) {
        const exists: boolean = await sharedDriver.existsId(ids[i]);
        expect(exists).assertTrue();
      }
      expect(typeof ids[0]).assertEqual('string');
      sharedDriver.hilogEnd('testPageLayout0010');
    });

    /*
     * @tc.number: SUB_PLY_1100
     * @tc.name: testPageLayout0011
     * @tc.desc: Verify PageLayout scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0011');
      expect(PAGE_PADDING).assertLarger(0);
      expect(SECTION_SPACING).assertLarger(0);
      expect(ITEM_SPACING).assertLarger(0);
      expect(BUTTON_HEIGHT).assertLarger(0);
      sharedDriver.hilogEnd('testPageLayout0011');
    });

    /*
     * @tc.number: SUB_PLY_1200
     * @tc.name: testPageLayout0012
     * @tc.desc: Verify PageLayout scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0012');
      expect(PAGE_PADDING).assertLarger(SECTION_SPACING);
      expect(SECTION_SPACING).assertLarger(ITEM_SPACING);
      expect(ITEM_SPACING).assertLarger(0);
      expect(typeof PAGE_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0012');
    });

    /*
     * @tc.number: SUB_PLY_1300
     * @tc.name: testPageLayout0013
     * @tc.desc: Verify PageLayout scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0013');
      expect(CARD_RADIUS).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      expect(typeof CARD_RADIUS).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0013');
    });

    /*
     * @tc.number: SUB_PLY_1400
     * @tc.name: testPageLayout0014
     * @tc.desc: Verify PageLayout scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0014');
      expect(BUTTON_HEIGHT).assertLarger(BODY_FONT_SIZE);
      expect(BUTTON_HEIGHT).assertLarger(SMALL_FONT_SIZE);
      expect(BUTTON_HEIGHT).assertLess(CONTENT_MAX_WIDTH);
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0014');
    });

    /*
     * @tc.number: SUB_PLY_1500
     * @tc.name: testPageLayout0015
     * @tc.desc: Verify PageLayout scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0015');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.includes('queryAppKeyState')).assertTrue();
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testPageLayout0015');
    });

    /*
     * @tc.number: SUB_PLY_1600
     * @tc.name: testPageLayout0016
     * @tc.desc: Verify PageLayout scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire:')).assertTrue();
      expect(text.includes('Release:')).assertTrue();
      expect(text.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testPageLayout0016');
    });

    /*
     * @tc.number: SUB_PLY_1700
     * @tc.name: testPageLayout0017
     * @tc.desc: Verify PageLayout scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0017');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      const clearBtn: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(clearBtn).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      sharedDriver.hilogEnd('testPageLayout0017');
    });

    /*
     * @tc.number: SUB_PLY_1800
     * @tc.name: testPageLayout0018
     * @tc.desc: Verify PageLayout scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0018');
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(CONTENT_MAX_WIDTH).assertLarger(BUTTON_HEIGHT);
      expect(CONTENT_MAX_WIDTH).assertLarger(CARD_PADDING);
      expect(typeof CONTENT_MAX_WIDTH).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0018');
    });

    /*
     * @tc.number: SUB_PLY_1900
     * @tc.name: testPageLayout0019
     * @tc.desc: Verify PageLayout scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r1.length).assertLarger(0);
      const r2: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(r2.length).assertLarger(0);
      expect(r1 !== r2).assertTrue();
      sharedDriver.hilogEnd('testPageLayout0019');
    });

    /*
     * @tc.number: SUB_PLY_2000
     * @tc.name: testPageLayout0020
     * @tc.desc: Verify PageLayout scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0020');
      expect(typeof PAGE_PADDING).assertEqual('number');
      expect(typeof SECTION_SPACING).assertEqual('number');
      expect(typeof ITEM_SPACING).assertEqual('number');
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      sharedDriver.hilogEnd('testPageLayout0020');
    });

    /*
     * @tc.number: SUB_PLY_2100
     * @tc.name: testPageLayout0021
     * @tc.desc: Verify PageLayout scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(text.includes('Ready') || text.includes('就绪')).assertTrue();
      expect(text.length).assertLarger(0);
      expect(typeof text).assertEqual('string');
      sharedDriver.hilogEnd('testPageLayout0021');
    });

    /*
     * @tc.number: SUB_PLY_2200
     * @tc.name: testPageLayout0022
     * @tc.desc: Verify PageLayout scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageLayout0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const text: string = await sharedDriver.getTextById('pairingStatus');
      expect(text.includes('Acquire: 0')).assertTrue();
      expect(text.includes('Release: 0')).assertTrue();
      expect(text.length).assertLarger(0);
      sharedDriver.hilogEnd('testPageLayout0022');
    });

    /*
     * @tc.number: SUB_PLY_2300
     * @tc.name: testPageLayout0023
     * @tc.desc: Verify PageLayout scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      const r2: string = await sharedDriver.clickAndGetResult('queryAllStatesButton', ID_OPERATION_RESULT);
      expect(r2.includes('KeyState')).assertTrue();
      expect(r1 !== r2).assertTrue();
      sharedDriver.hilogEnd('testPageLayout0023');
    });

    /*
     * @tc.number: SUB_PLY_2400
     * @tc.name: testPageLayout0024
     * @tc.desc: Verify PageLayout scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0024');
      expect(SECTION_SPACING).assertLarger(0);
      expect(ITEM_SPACING).assertLarger(0);
      expect(PAGE_PADDING).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      sharedDriver.hilogEnd('testPageLayout0024');
    });

    /*
     * @tc.number: SUB_PLY_2500
     * @tc.name: testPageLayout0025
     * @tc.desc: Verify PageLayout scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageLayout0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageLayout0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      const p: boolean = await sharedDriver.existsId('pairingStatus');
      expect(q).assertTrue();
      expect(r).assertTrue();
      expect(p).assertTrue();
      sharedDriver.hilogEnd('testPageLayout0025');
    });
  });
}
