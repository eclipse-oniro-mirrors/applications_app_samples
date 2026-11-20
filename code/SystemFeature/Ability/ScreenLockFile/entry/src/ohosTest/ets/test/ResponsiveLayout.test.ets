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
  CONTENT_MAX_WIDTH, BUTTON_HEIGHT, CARD_RADIUS, CARD_PADDING
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function responsiveLayoutTest(): void {
  describe('ResponsiveLayoutTest', (): void => {

    // ==================== 响应式布局验证（20 条） ====================

    /*
     * @tc.number: SUB_RPL_0100
     * @tc.name: testResponsiveLayout0001
     * @tc.desc: Verify ResponsiveLayout scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0001');
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(CONTENT_MAX_WIDTH).assertLarger(0);
      expect(typeof CONTENT_MAX_WIDTH).assertEqual('number');
      sharedDriver.hilogEnd('testResponsiveLayout0001');
    });

    /*
     * @tc.number: SUB_RPL_0200
     * @tc.name: testResponsiveLayout0002
     * @tc.desc: Verify ResponsiveLayout scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0002');
      expect(CONTENT_MAX_WIDTH).assertLarger(BUTTON_HEIGHT);
      expect(CONTENT_MAX_WIDTH).assertLarger(CARD_PADDING);
      expect(CONTENT_MAX_WIDTH).assertLarger(CARD_RADIUS);
      sharedDriver.hilogEnd('testResponsiveLayout0002');
    });

    /*
     * @tc.number: SUB_RPL_0300
     * @tc.name: testResponsiveLayout0003
     * @tc.desc: Verify ResponsiveLayout scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0003');
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      sharedDriver.hilogEnd('testResponsiveLayout0003');
    });

    /*
     * @tc.number: SUB_RPL_0400
     * @tc.name: testResponsiveLayout0004
     * @tc.desc: Verify ResponsiveLayout scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0004');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testResponsiveLayout0004');
    });

    /*
     * @tc.number: SUB_RPL_0500
     * @tc.name: testResponsiveLayout0005
     * @tc.desc: Verify ResponsiveLayout scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0005');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResponsiveLayout0005');
    });

    /*
     * @tc.number: SUB_RPL_0600
     * @tc.name: testResponsiveLayout0006
     * @tc.desc: Verify ResponsiveLayout scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0006');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResponsiveLayout0006');
    });

    /*
     * @tc.number: SUB_RPL_0700
     * @tc.name: testResponsiveLayout0007
     * @tc.desc: Verify ResponsiveLayout scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0007');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_RELEASE_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResponsiveLayout0007');
    });

    /*
     * @tc.number: SUB_RPL_0800
     * @tc.name: testResponsiveLayout0008
     * @tc.desc: Verify ResponsiveLayout scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0008');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.clickAndGetResult(ID_QUERY_ALL_BUTTON, ID_OPERATION_RESULT);
      expect(result.includes('KeyState')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testResponsiveLayout0008');
    });

    /*
     * @tc.number: SUB_RPL_0900
     * @tc.name: testResponsiveLayout0009
     * @tc.desc: Verify ResponsiveLayout scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0009');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('Ready') || result.includes('就绪')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testResponsiveLayout0009');
    });

    /*
     * @tc.number: SUB_RPL_1000
     * @tc.name: testResponsiveLayout0010
     * @tc.desc: Verify ResponsiveLayout scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0010');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const pairing: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairing.includes('Acquire:')).assertTrue();
      expect(pairing.includes('|')).assertTrue();
      expect(pairing.length).assertLarger(0);
      sharedDriver.hilogEnd('testResponsiveLayout0010');
    });

    /*
     * @tc.number: SUB_RPL_1100
     * @tc.name: testResponsiveLayout0011
     * @tc.desc: Verify ResponsiveLayout scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0011');
      expect(typeof CONTENT_MAX_WIDTH).assertEqual('number');
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      expect(typeof CARD_RADIUS).assertEqual('number');
      expect(typeof CARD_PADDING).assertEqual('number');
      sharedDriver.hilogEnd('testResponsiveLayout0011');
    });

    /*
     * @tc.number: SUB_RPL_1200
     * @tc.name: testResponsiveLayout0012
     * @tc.desc: Verify ResponsiveLayout scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0012');
      expect(BUTTON_HEIGHT).assertLarger(CARD_RADIUS);
      expect(BUTTON_HEIGHT).assertLarger(0);
      expect(CARD_PADDING).assertLarger(CARD_RADIUS);
      sharedDriver.hilogEnd('testResponsiveLayout0012');
    });

    /*
     * @tc.number: SUB_RPL_1300
     * @tc.name: testResponsiveLayout0013
     * @tc.desc: Verify ResponsiveLayout scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0013');
      expect(CONTENT_MAX_WIDTH).assertLarger(BUTTON_HEIGHT * 2);
      expect(CONTENT_MAX_WIDTH).assertLarger(CARD_PADDING * 2);
      expect(typeof CONTENT_MAX_WIDTH).assertEqual('number');
      sharedDriver.hilogEnd('testResponsiveLayout0013');
    });

    /*
     * @tc.number: SUB_RPL_1400
     * @tc.name: testResponsiveLayout0014
     * @tc.desc: Verify ResponsiveLayout scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0014');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHist: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHist).assertTrue();
      expect(typeof noHist).assertEqual('boolean');
      expect(noHist).assertEqual(true);
      sharedDriver.hilogEnd('testResponsiveLayout0014');
    });

    /*
     * @tc.number: SUB_RPL_1500
     * @tc.name: testResponsiveLayout0015
     * @tc.desc: Verify ResponsiveLayout scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0015');
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
      sharedDriver.hilogEnd('testResponsiveLayout0015');
    });

    /*
     * @tc.number: SUB_RPL_1600
     * @tc.name: testResponsiveLayout0016
     * @tc.desc: Verify ResponsiveLayout scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0016');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const cl: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(cl).assertTrue();
      expect(typeof cl).assertEqual('boolean');
      expect(cl).assertEqual(true);
      sharedDriver.hilogEnd('testResponsiveLayout0016');
    });

    /*
     * @tc.number: SUB_RPL_1700
     * @tc.name: testResponsiveLayout0017
     * @tc.desc: Verify ResponsiveLayout scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0017');
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
      sharedDriver.hilogEnd('testResponsiveLayout0017');
    });

    /*
     * @tc.number: SUB_RPL_1800
     * @tc.name: testResponsiveLayout0018
     * @tc.desc: Verify ResponsiveLayout scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0018');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const r1: string = await sharedDriver.clickAndGetResult(ID_QUERY_BUTTON, ID_OPERATION_RESULT);
      const r2: string = await sharedDriver.clickAndGetResult(ID_ACQUIRE_BUTTON, ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r2.includes('acquireAccess')).assertTrue();
      sharedDriver.hilogEnd('testResponsiveLayout0018');
    });

    /*
     * @tc.number: SUB_RPL_1900
     * @tc.name: testResponsiveLayout0019
     * @tc.desc: Verify ResponsiveLayout scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0019');
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      sharedDriver.hilogEnd('testResponsiveLayout0019');
    });

    /*
     * @tc.number: SUB_RPL_2000
     * @tc.name: testResponsiveLayout0020
     * @tc.desc: Verify ResponsiveLayout scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testResponsiveLayout0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testResponsiveLayout0020');
      await abilityDelegator.startAbility({ bundleName: BUNDLE_NAME, abilityName: ABILITY_NAME });
      await sharedDriver.waitUiIdle();
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const res: boolean = await sharedDriver.existsId(ID_OPERATION_RESULT);
      const pr: boolean = await sharedDriver.existsId('pairingStatus');
      expect(q).assertTrue();
      expect(res).assertTrue();
      expect(pr).assertTrue();
      sharedDriver.hilogEnd('testResponsiveLayout0020');
    });
  });
}
