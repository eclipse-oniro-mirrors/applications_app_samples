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
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SharedDriver } from './SharedDriver';
import { TestHelper } from './TestHelper';
import { clickById, scrollToId, textOfId } from '../testkit/SharedDriver';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { BUNDLE_NAME, ABILITY_NAME } from './TestConstants';
import {
  DOMAIN, TAG, ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT,
  TEXT_QUERY_RESULT, TEXT_ACQUIRE_RESULT, TEXT_RELEASE_RESULT
} from './TestConstants';
const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
const testHelper: TestHelper = new TestHelper(sharedDriver);

export default function buttonClickTest(): void {
  describe('ButtonClickTest', (): void => {

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
    // ==================== 按钮点击交互验证（35 条） ====================

    /*
     * @tc.number: SUB_BCK_0100
     * @tc.name: testButtonClick0001
     * @tc.desc: Verify ButtonClick scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0001');
      const exists: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      expect(exists).assertTrue();
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0001');
    });

    /*
     * @tc.number: SUB_BCK_0200
     * @tc.name: testButtonClick0002
     * @tc.desc: Verify ButtonClick scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0002');
      const exists: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      expect(exists).assertTrue();
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0002');
    });

    /*
     * @tc.number: SUB_BCK_0300
     * @tc.name: testButtonClick0003
     * @tc.desc: Verify ButtonClick scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0003');
      const exists: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(exists).assertTrue();
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0003');
    });

    /*
     * @tc.number: SUB_BCK_0400
     * @tc.name: testButtonClick0004
     * @tc.desc: Verify ButtonClick scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0004');
      const exists: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(exists).assertTrue();
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('KeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0004');
    });

    /*
     * @tc.number: SUB_BCK_0500
     * @tc.name: testButtonClick0005
     * @tc.desc: Verify ButtonClick scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0005');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      const exists: boolean = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(exists).assertTrue();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0005');
    });

    /*
     * @tc.number: SUB_BCK_0600
     * @tc.name: testButtonClick0006
     * @tc.desc: Verify ButtonClick scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0006');
      const status: screenLockFileManager.KeyStatus = screenLockFileManager.queryAppKeyState();
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      const statusName: string = testHelper.getKeyStatusName(status);
      expect(result.includes(statusName)).assertFalse();
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0006');
    });

    /*
     * @tc.number: SUB_BCK_0700
     * @tc.name: testButtonClick0007
     * @tc.desc: Verify ButtonClick scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0007');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      const hasAccess: boolean = result.includes('ACCESS_GRANTED') || result.includes('ACCESS_DENIED');
      expect(hasAccess).assertTrue();
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0007');
    });

    /*
     * @tc.number: SUB_BCK_0800
     * @tc.name: testButtonClick0008
     * @tc.desc: Verify ButtonClick scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0008');
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      const hasRelease: boolean = result.includes('RELEASE_GRANTED') || result.includes('RELEASE_DENIED');
      expect(hasRelease).assertTrue();
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0008');
    });

    /*
     * @tc.number: SUB_BCK_0900
     * @tc.name: testButtonClick0009
     * @tc.desc: Verify ButtonClick scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0009');
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      expect(result.includes('Pending:')).assertTrue();
      sharedDriver.hilogEnd('testButtonClick0009');
    });

    /*
     * @tc.number: SUB_BCK_1000
     * @tc.name: testButtonClick0010
     * @tc.desc: Verify ButtonClick scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0010');
      const results: string[] = [];
      for (let i: number = 0; i < 3; i++) {
        await clickById(ID_QUERY_BUTTON)
        await scrollToId(ID_OPERATION_RESULT)
        const r: string = await textOfId(ID_OPERATION_RESULT);
        results.push(r);
      }
      expect(results.length).assertEqual(3);
      expect(results[0].includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(results[2].includes(TEXT_QUERY_RESULT)).assertTrue();
      sharedDriver.hilogEnd('testButtonClick0010');
    });

    /*
     * @tc.number: SUB_BCK_1100
     * @tc.name: testButtonClick0011
     * @tc.desc: Verify ButtonClick scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0011');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const acqResult: string = await textOfId(ID_OPERATION_RESULT);
      expect(acqResult.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const relResult: string = await textOfId(ID_OPERATION_RESULT);
      expect(relResult.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(acqResult.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0011');
    });

    /*
     * @tc.number: SUB_BCK_1200
     * @tc.name: testButtonClick0012
     * @tc.desc: Verify ButtonClick scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0012');
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonClick0012');
    });

    /*
     * @tc.number: SUB_BCK_1300
     * @tc.name: testButtonClick0013
     * @tc.desc: Verify ButtonClick scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0013');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r1: string = await textOfId(ID_OPERATION_RESULT);
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r2: string = await textOfId(ID_OPERATION_RESULT);
      expect(r1.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(r2.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(r1.includes('KEY_')).assertTrue();
      sharedDriver.hilogEnd('testButtonClick0013');
    });

    /*
     * @tc.number: SUB_BCK_1400
     * @tc.name: testButtonClick0014
     * @tc.desc: Verify ButtonClick scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0014');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairingText: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.includes('Acquire:')).assertTrue();
      expect(pairingText.length).assertLarger(0);
      expect(typeof pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testButtonClick0014');
    });

    /*
     * @tc.number: SUB_BCK_1500
     * @tc.name: testButtonClick0015
     * @tc.desc: Verify ButtonClick scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0015');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      const pairingText: string = await sharedDriver.getTextById('pairingStatus');
      expect(pairingText.includes('Release:')).assertTrue();
      expect(pairingText.length).assertLarger(0);
      expect(typeof pairingText).assertEqual('string');
      sharedDriver.hilogEnd('testButtonClick0015');
    });

    /*
     * @tc.number: SUB_BCK_1600
     * @tc.name: testButtonClick0016
     * @tc.desc: Verify ButtonClick scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0016');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const noHistory: boolean = await sharedDriver.existsId('noHistoryText');
      expect(noHistory).assertTrue();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      const stillExists: boolean = await sharedDriver.existsId('noHistoryText');
      expect(stillExists).assertFalse();
      expect(noHistory).assertTrue();
      sharedDriver.hilogEnd('testButtonClick0016');
    });

    /*
     * @tc.number: SUB_BCK_1700
     * @tc.name: testButtonClick0017
     * @tc.desc: Verify ButtonClick scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0017');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r1: string = await textOfId(ID_OPERATION_RESULT);
      expect(r1.length).assertLarger(0);
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r2: string = await textOfId(ID_OPERATION_RESULT);
      expect(r2.length).assertLarger(0);
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r3: string = await textOfId(ID_OPERATION_RESULT);
      expect(r3.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0017');
    });

    /*
     * @tc.number: SUB_BCK_1800
     * @tc.name: testButtonClick0018
     * @tc.desc: Verify ButtonClick scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0018');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0018');
    });

    /*
     * @tc.number: SUB_BCK_1900
     * @tc.name: testButtonClick0019
     * @tc.desc: Verify ButtonClick scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0019');
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.includes('|')).assertTrue();
      expect(result.length).assertLarger(10);
      sharedDriver.hilogEnd('testButtonClick0019');
    });

    /*
     * @tc.number: SUB_BCK_2000
     * @tc.name: testButtonClick0020
     * @tc.desc: Verify ButtonClick scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0020');
      let successCount: number = 0;
      for (let i: number = 0; i < 5; i++) {
        await clickById(ID_QUERY_BUTTON)
        await scrollToId(ID_OPERATION_RESULT)
        const result: string = await textOfId(ID_OPERATION_RESULT);
        if (result.includes(TEXT_QUERY_RESULT)) {
          successCount = successCount + 1;
        }
      }
      expect(successCount).assertEqual(5);
      expect(successCount).assertLarger(0);
      expect(typeof successCount).assertEqual('number');
      sharedDriver.hilogEnd('testButtonClick0020');
    });

    /*
     * @tc.number: SUB_BCK_2100
     * @tc.name: testButtonClick0021
     * @tc.desc: Verify ButtonClick scenario 0021.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0021', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0021');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0021');
    });

    /*
     * @tc.number: SUB_BCK_2200
     * @tc.name: testButtonClick0022
     * @tc.desc: Verify ButtonClick scenario 0022.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0022', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0022');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_RELEASE_BUTTON);
      await sharedDriver.waitUiIdle();
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Release:')).assertTrue();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0022');
    });

    /*
     * @tc.number: SUB_BCK_2300
     * @tc.name: testButtonClick0023
     * @tc.desc: Verify ButtonClick scenario 0023.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0023', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0023');
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonClick0023');
    });

    /*
     * @tc.number: SUB_BCK_2400
     * @tc.name: testButtonClick0024
     * @tc.desc: Verify ButtonClick scenario 0024.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0024', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0024');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      const hasEnumName: boolean = result.includes('KEY_NOT_EXIST') || result.includes('KEY_RELEASED') ||
        result.includes('KEY_EXIST');
      expect(hasEnumName).assertTrue();
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0024');
    });

    /*
     * @tc.number: SUB_BCK_2500
     * @tc.name: testButtonClick0025
     * @tc.desc: Verify ButtonClick scenario 0025.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0025', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0025');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      const hasEnumName: boolean = result.includes('ACCESS_GRANTED') || result.includes('ACCESS_DENIED');
      expect(hasEnumName).assertTrue();
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0025');
    });

    /*
     * @tc.number: SUB_BCK_2600
     * @tc.name: testButtonClick0026
     * @tc.desc: Verify ButtonClick scenario 0026.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0026', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0026');
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      const hasEnumName: boolean = result.includes('RELEASE_GRANTED') || result.includes('RELEASE_DENIED');
      expect(hasEnumName).assertTrue();
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0026');
    });

    /*
     * @tc.number: SUB_BCK_2700
     * @tc.name: testButtonClick0027
     * @tc.desc: Verify ButtonClick scenario 0027.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0027', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0027');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Pending: 0')).assertTrue();
      expect(result.includes('Acquire: 0')).assertTrue();
      expect(result.includes('Release: 0')).assertTrue();
      sharedDriver.hilogEnd('testButtonClick0027');
    });

    /*
     * @tc.number: SUB_BCK_2800
     * @tc.name: testButtonClick0028
     * @tc.desc: Verify ButtonClick scenario 0028.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0028', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0028');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
      await sharedDriver.waitUiIdle();
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('KeyState:')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0028');
    });

    /*
     * @tc.number: SUB_BCK_2900
     * @tc.name: testButtonClick0029
     * @tc.desc: Verify ButtonClick scenario 0029.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0029', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0029');
      const q: boolean = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a: boolean = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r: boolean = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      const qa: boolean = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testButtonClick0029');
    });

    /*
     * @tc.number: SUB_BCK_3000
     * @tc.name: testButtonClick0030
     * @tc.desc: Verify ButtonClick scenario 0030.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0030', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0030');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.includes('KEY_')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0030');
    });

    /*
     * @tc.number: SUB_BCK_3100
     * @tc.name: testButtonClick0031
     * @tc.desc: Verify ButtonClick scenario 0031.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonClick0031', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0031');
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      for (let i: number = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_ACQUIRE_BUTTON);
        await sharedDriver.waitUiIdle();
        await sharedDriver.clickId(ID_RELEASE_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Acquire:')).assertTrue();
      expect(result.includes('Release:')).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0031');
    });

    /*
     * @tc.number: SUB_BCK_3200
     * @tc.name: testButtonClick0032
     * @tc.desc: Verify ButtonClick scenario 0032.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0032', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0032');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Error')).assertFalse();
      expect(result.includes(TEXT_QUERY_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0032');
    });

    /*
     * @tc.number: SUB_BCK_3300
     * @tc.name: testButtonClick0033
     * @tc.desc: Verify ButtonClick scenario 0033.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0033', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0033');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Error')).assertFalse();
      expect(result.includes(TEXT_ACQUIRE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0033');
    });

    /*
     * @tc.number: SUB_BCK_3400
     * @tc.name: testButtonClick0034
     * @tc.desc: Verify ButtonClick scenario 0034.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0034', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0034');
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('Error')).assertFalse();
      expect(result.includes(TEXT_RELEASE_RESULT)).assertTrue();
      expect(result.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonClick0034');
    });

    /*
     * @tc.number: SUB_BCK_3500
     * @tc.name: testButtonClick0035
     * @tc.desc: Verify ButtonClick scenario 0035.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonClick0035', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonClick0035');
      const ids: string[] = [ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON];
      expect(ids.length).assertEqual(4);
      const unique: string[] = [];
      for (let i: number = 0; i < ids.length; i++) {
        let isUnique: boolean = true;
        for (let j: number = 0; j < unique.length; j++) {
          if (ids[i] === unique[j]) { isUnique = false; }
        }
        if (isUnique) { unique.push(ids[i]); }
      }
      expect(unique.length).assertEqual(4);
      expect(ids.length).assertEqual(unique.length);
      expect(typeof ids[0]).assertEqual('string');
      sharedDriver.hilogEnd('testButtonClick0035');
    });
  });
}
