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
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, BUTTON_HEIGHT
} from './TestConstants';
const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function buttonStyleTest(): void {
  describe('ButtonStyleTest', (): void => {

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
    // ==================== 按钮样式验证（20 条） ====================

    /*
     * @tc.number: SUB_BST_0100
     * @tc.name: testButtonStyle0001
     * @tc.desc: Verify ButtonStyle scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonStyle0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0001');
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(BUTTON_HEIGHT).assertLarger(0);
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      sharedDriver.hilogEnd('testButtonStyle0001');
    });

    /*
     * @tc.number: SUB_BST_0200
     * @tc.name: testButtonStyle0002
     * @tc.desc: Verify ButtonStyle scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonStyle0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0002');
      const q = await sharedDriver.existsId(ID_QUERY_BUTTON);
      const a = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      const r = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(q).assertTrue();
      expect(a).assertTrue();
      expect(r).assertTrue();
      sharedDriver.hilogEnd('testButtonStyle0002');
    });

    /*
     * @tc.number: SUB_BST_0300
     * @tc.name: testButtonStyle0003
     * @tc.desc: Verify ButtonStyle scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonStyle0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0003');
      const qa = await sharedDriver.existsId(ID_QUERY_ALL_BUTTON);
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      const cl = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(qa).assertTrue();
      expect(cl).assertTrue();
      expect(typeof qa).assertEqual('boolean');
      sharedDriver.hilogEnd('testButtonStyle0003');
    });

    /*
     * @tc.number: SUB_BST_0400
     * @tc.name: testButtonStyle0004
     * @tc.desc: Verify ButtonStyle scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonStyle0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0004');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0004');
    });

    /*
     * @tc.number: SUB_BST_0500
     * @tc.name: testButtonStyle0005
     * @tc.desc: Verify ButtonStyle scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testButtonStyle0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0005');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('acquireAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0005');
    });

    /*
     * @tc.number: SUB_BST_0600
     * @tc.name: testButtonStyle0006
     * @tc.desc: Verify ButtonStyle scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0006');
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('releaseAccess')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0006');
    });

    /*
     * @tc.number: SUB_BST_0700
     * @tc.name: testButtonStyle0007
     * @tc.desc: Verify ButtonStyle scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0007');
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(result.includes('KeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0007');
    });

    /*
     * @tc.number: SUB_BST_0800
     * @tc.name: testButtonStyle0008
     * @tc.desc: Verify ButtonStyle scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0008');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0008');
    });

    /*
     * @tc.number: SUB_BST_0900
     * @tc.name: testButtonStyle0009
     * @tc.desc: Verify ButtonStyle scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0009');
      const ids: string[] = [ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON];
      expect(ids.length).assertEqual(4);
      for (let i = 0; i < ids.length; i++) {
        expect(typeof ids[i]).assertEqual('string');
        expect(ids[i].length).assertLarger(0);
      }
      sharedDriver.hilogEnd('testButtonStyle0009');
    });

    /*
     * @tc.number: SUB_BST_1000
     * @tc.name: testButtonStyle0010
     * @tc.desc: Verify ButtonStyle scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0010');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r1 = await textOfId(ID_OPERATION_RESULT);
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r2 = await textOfId(ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.length).assertLarger(0);
      expect(r2.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonStyle0010');
    });

    /*
     * @tc.number: SUB_BST_1100
     * @tc.name: testButtonStyle0011
     * @tc.desc: Verify ButtonStyle scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0011');
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r1 = await textOfId(ID_OPERATION_RESULT);
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r2 = await textOfId(ID_OPERATION_RESULT);
      expect(r1 !== r2).assertTrue();
      expect(r1.includes('acquireAccess')).assertTrue();
      expect(r2.includes('releaseAccess')).assertTrue();
      sharedDriver.hilogEnd('testButtonStyle0011');
    });

    /*
     * @tc.number: SUB_BST_1200
     * @tc.name: testButtonStyle0012
     * @tc.desc: Verify ButtonStyle scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0012');
      expect(BUTTON_HEIGHT).assertLarger(32);
      expect(BUTTON_HEIGHT).assertLess(100);
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      sharedDriver.hilogEnd('testButtonStyle0012');
    });

    /*
     * @tc.number: SUB_BST_1300
     * @tc.name: testButtonStyle0013
     * @tc.desc: Verify ButtonStyle scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0013');
      await scrollToId(ID_CLEAR_HISTORY_BUTTON)
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_QUERY_BUTTON);
      await sharedDriver.waitUiIdle();
      await sharedDriver.clickId(ID_CLEAR_HISTORY_BUTTON);
      await sharedDriver.waitUiIdle();
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('ready')).assertFalse();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0013');
    });

    /*
     * @tc.number: SUB_BST_1400
     * @tc.name: testButtonStyle0014
     * @tc.desc: Verify ButtonStyle scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0014');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r1 = await textOfId(ID_OPERATION_RESULT);
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const r2 = await textOfId(ID_OPERATION_RESULT);
      expect(r1).assertEqual(r2);
      expect(r1.includes('queryAppKeyState')).assertTrue();
      expect(r1.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonStyle0014');
    });

    /*
     * @tc.number: SUB_BST_1500
     * @tc.name: testButtonStyle0015
     * @tc.desc: Verify ButtonStyle scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0015');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const noError1 = await textOfId(ID_OPERATION_RESULT);
      expect(noError1.includes('Error')).assertFalse();
      await clickById(ID_ACQUIRE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const noError2 = await textOfId(ID_OPERATION_RESULT);
      expect(noError2.includes('Error')).assertFalse();
      expect(noError1 !== noError2).assertTrue();
      sharedDriver.hilogEnd('testButtonStyle0015');
    });

    /*
     * @tc.number: SUB_BST_1600
     * @tc.name: testButtonStyle0016
     * @tc.desc: Verify ButtonStyle scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0016');
      await clickById(ID_RELEASE_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const noError = await textOfId(ID_OPERATION_RESULT);
      expect(noError.includes('Error')).assertFalse();
      expect(noError.includes('releaseAccess')).assertTrue();
      expect(noError.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonStyle0016');
    });

    /*
     * @tc.number: SUB_BST_1700
     * @tc.name: testButtonStyle0017
     * @tc.desc: Verify ButtonStyle scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0017');
      await clickById(ID_QUERY_ALL_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const noError = await textOfId(ID_OPERATION_RESULT);
      expect(noError.includes('Error')).assertFalse();
      expect(noError.includes('KeyState')).assertTrue();
      expect(noError.length).assertLarger(0);
      sharedDriver.hilogEnd('testButtonStyle0017');
    });

    /*
     * @tc.number: SUB_BST_1800
     * @tc.name: testButtonStyle0018
     * @tc.desc: Verify ButtonStyle scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0018');
      const ids: string[] = [ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON, ID_CLEAR_HISTORY_BUTTON];
      const unique: string[] = [];
      for (let i = 0; i < ids.length; i++) {
        let isUnique = true;
        for (let j = 0; j < unique.length; j++) {
          if (ids[i] === unique[j]) { isUnique = false; }
        }
        if (isUnique) { unique.push(ids[i]); }
      }
      expect(unique.length).assertEqual(ids.length);
      expect(ids.length).assertEqual(5);
      expect(typeof ids[0]).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0018');
    });

    /*
     * @tc.number: SUB_BST_1900
     * @tc.name: testButtonStyle0019
     * @tc.desc: Verify ButtonStyle scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0019');
      for (let i = 0; i < 3; i++) {
        await sharedDriver.clickId(ID_QUERY_BUTTON);
        await sharedDriver.waitUiIdle();
      }
      const result = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.includes('queryAppKeyState')).assertTrue();
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      sharedDriver.hilogEnd('testButtonStyle0019');
    });

    /*
     * @tc.number: SUB_BST_2000
     * @tc.name: testButtonStyle0020
     * @tc.desc: Verify ButtonStyle scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testButtonStyle0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testButtonStyle0020');
      await clickById(ID_QUERY_BUTTON)
      await scrollToId(ID_OPERATION_RESULT)
      const result = await textOfId(ID_OPERATION_RESULT);
      expect(typeof result).assertEqual('string');
      expect(result.length).assertLarger(0);
      expect(result.includes(':')).assertTrue();
      sharedDriver.hilogEnd('testButtonStyle0020');
    });
  });
}
