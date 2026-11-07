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
  PAGE_PADDING, CONTENT_MAX_WIDTH, BUTTON_HEIGHT, CARD_RADIUS, CARD_PADDING
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function pageStructureTest(): void {
  describe('PageStructureTest', (): void => {

    // ==================== 页面结构验证（25 条） ====================

    /*
     * @tc.number: SUB_PGS_0100
     * @tc.name: testPageStructure0001
     * @tc.desc: Verify PageStructure scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageStructure0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0001');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      const qa = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0001');
    });

    /*
     * @tc.number: SUB_PGS_0200
     * @tc.name: testPageStructure0002
     * @tc.desc: Verify PageStructure scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageStructure0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0002');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_CLEAR_HISTORY_BUTTON);
      const cl = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      await scrollToId(ID_OPERATION_RESULT);
      const res = await sharedDriver.existsId(ID_OPERATION_RESULT);
      await scrollToId('pairingStatus');
      const pr = await sharedDriver.existsId('pairingStatus');
      expect(cl).assertTrue();
      expect(res).assertTrue();
      expect(pr).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0002');
    });

    /*
     * @tc.number: SUB_PGS_0300
     * @tc.name: testPageStructure0003
     * @tc.desc: Verify PageStructure scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageStructure0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0003');
      expect(PAGE_PADDING).assertEqual(24);
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(typeof PAGE_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testPageStructure0003');
    });

    /*
     * @tc.number: SUB_PGS_0400
     * @tc.name: testPageStructure0004
     * @tc.desc: Verify PageStructure scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageStructure0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0004');
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      sharedDriver.hilogEnd('testPageStructure0004');
    });

    /*
     * @tc.number: SUB_PGS_0500
     * @tc.name: testPageStructure0005
     * @tc.desc: Verify PageStructure scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testPageStructure0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0005');
      expect(CONTENT_MAX_WIDTH).assertLarger(BUTTON_HEIGHT);
      expect(CONTENT_MAX_WIDTH).assertLarger(CARD_PADDING);
      expect(PAGE_PADDING).assertLarger(0);
      sharedDriver.hilogEnd('testPageStructure0005');
    });

    /*
     * @tc.number: SUB_PGS_0600
     * @tc.name: testPageStructure0006
     * @tc.desc: Verify PageStructure scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testPageStructure0006');
    });

    /*
     * @tc.number: SUB_PGS_0700
     * @tc.name: testPageStructure0007
     * @tc.desc: Verify PageStructure scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testPageStructure0007');
    });

    /*
     * @tc.number: SUB_PGS_0800
     * @tc.name: testPageStructure0008
     * @tc.desc: Verify PageStructure scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testPageStructure0008');
    });

    /*
     * @tc.number: SUB_PGS_0900
     * @tc.name: testPageStructure0009
     * @tc.desc: Verify PageStructure scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testPageStructure0009');
    });

    /*
     * @tc.number: SUB_PGS_1000
     * @tc.name: testPageStructure0010
     * @tc.desc: Verify PageStructure scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('|')).assertTrue();
      expect(pairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testPageStructure0010');
    });

    /*
     * @tc.number: SUB_PGS_1100
     * @tc.name: testPageStructure0011
     * @tc.desc: Verify PageStructure scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0011');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testPageStructure0011');
    });

    /*
     * @tc.number: SUB_PGS_1200
     * @tc.name: testPageStructure0012
     * @tc.desc: Verify PageStructure scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0012');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testPageStructure0012');
    });

    /*
     * @tc.number: SUB_PGS_1300
     * @tc.name: testPageStructure0013
     * @tc.desc: Verify PageStructure scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0013');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertFalse();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(false);
      sharedDriver.hilogEnd('testPageStructure0013');
    });

    /*
     * @tc.number: SUB_PGS_1400
     * @tc.name: testPageStructure0014
     * @tc.desc: Verify PageStructure scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const ids: string[] = [ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON, ID_CLEAR_HISTORY_BUTTON];
      expect(ids.length).assertEqual(5);
      for (let i = 0; i < ids.length; i++) {
        const exists = await sharedDriver.existsId(ids[i]);
        expect(exists).assertTrue();
      }
      expect(typeof ids[0]).assertEqual('string');
      sharedDriver.hilogEnd('testPageStructure0014');
    });

    /*
     * @tc.number: SUB_PGS_1500
     * @tc.name: testPageStructure0015
     * @tc.desc: Verify PageStructure scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0015');
      expect(PAGE_PADDING).assertLarger(0);
      expect(CONTENT_MAX_WIDTH).assertLarger(0);
      expect(BUTTON_HEIGHT).assertLarger(0);
      expect(CARD_RADIUS).assertLarger(0);
      sharedDriver.hilogEnd('testPageStructure0015');
    });

    /*
     * @tc.number: SUB_PGS_1600
     * @tc.name: testPageStructure0016
     * @tc.desc: Verify PageStructure scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0016');
      expect(typeof PAGE_PADDING).assertEqual('number');
      expect(typeof CONTENT_MAX_WIDTH).assertEqual('number');
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      expect(typeof CARD_RADIUS).assertEqual('number');
      sharedDriver.hilogEnd('testPageStructure0016');
    });

    /*
     * @tc.number: SUB_PGS_1700
     * @tc.name: testPageStructure0017
     * @tc.desc: Verify PageStructure scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0017');
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      expect(BUTTON_HEIGHT).assertLarger(CARD_RADIUS);
      expect(CONTENT_MAX_WIDTH).assertLarger(BUTTON_HEIGHT);
      sharedDriver.hilogEnd('testPageStructure0017');
    });

    /*
     * @tc.number: SUB_PGS_1800
     * @tc.name: testPageStructure0018
     * @tc.desc: Verify PageStructure scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1 = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const r2 = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(r2.includes('Ready') || r2.includes('就绪')).assertTrue();
      expect(r1 !== r2).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0018');
    });

    /*
     * @tc.number: SUB_PGS_1900
     * @tc.name: testPageStructure0019
     * @tc.desc: Verify PageStructure scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0019');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing = await sharedDriver.getTextById('pairingStatus');
      const sections = pairing.split('|');
      expect(sections.length).assertEqual(3);
      expect(sections[0].includes('Acquire')).assertTrue();
      expect(sections[2].includes('Pending')).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0019');
    });

    /*
     * @tc.number: SUB_PGS_2000
     * @tc.name: testPageStructure0020
     * @tc.desc: Verify PageStructure scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire: 0')).assertTrue();
      expect(pairing.includes('Release: 0')).assertTrue();
      expect(pairing.includes('Pending: 0')).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0020');
    });

    /*
     * @tc.number: SUB_PGS_2100
     * @tc.name: testPageStructure0021
     * @tc.desc: Verify PageStructure scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0021');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(typeof result.length).assertEqual('number');
      sharedDriver.hilogEnd('testPageStructure0021');
    });

    /*
     * @tc.number: SUB_PGS_2200
     * @tc.name: testPageStructure0022
     * @tc.desc: Verify PageStructure scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0022');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1 = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      const r2 = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r2.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0022');
    });

    /*
     * @tc.number: SUB_PGS_2300
     * @tc.name: testPageStructure0023
     * @tc.desc: Verify PageStructure scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0023');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairing = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.length).assertLarger(0);
      expect(typeof pairing).assertEqual('string');
      sharedDriver.hilogEnd('testPageStructure0023');
    });

    /*
     * @tc.number: SUB_PGS_2400
     * @tc.name: testPageStructure0024
     * @tc.desc: Verify PageStructure scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0024');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
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
      sharedDriver.hilogEnd('testPageStructure0024');
    });

    /*
     * @tc.number: SUB_PGS_2500
     * @tc.name: testPageStructure0025
     * @tc.desc: Verify PageStructure scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testPageStructure0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testPageStructure0025');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const res = await sharedDriver.existsId(ID_OPERATION_RESULT);
      const pr = await sharedDriver.existsId('pairingStatus');
      expect(q).assertTrue();
      expect(res).assertTrue();
      expect(pr).assertTrue();
      sharedDriver.hilogEnd('testPageStructure0025');
    });
  });
}
