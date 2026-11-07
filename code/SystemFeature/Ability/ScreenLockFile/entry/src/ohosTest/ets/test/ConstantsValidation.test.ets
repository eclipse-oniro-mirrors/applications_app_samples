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
  DOMAIN, TAG, KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
  ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED,
  RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED,
  MAX_HISTORY_SIZE, PAGE_PADDING, SECTION_SPACING, ITEM_SPACING,
  TITLE_FONT_SIZE, SUBTITLE_FONT_SIZE, BODY_FONT_SIZE, SMALL_FONT_SIZE,
  CONTENT_MAX_WIDTH, BUTTON_HEIGHT, CARD_RADIUS, CARD_PADDING,
  ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON, ID_QUERY_ALL_BUTTON,
  ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, ID_PAIRING_STATUS
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

const sharedDriver = new SharedDriver();
const abilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function constantsValidationTest(): void {
  describe('ConstantsValidationTest', (): void => {

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
    // ==================== 常量定义验证（20 条） ====================

    /*
     * @tc.number: SUB_CVL_0100
     * @tc.name: testConstantsValidation0001
     * @tc.desc: Verify ConstantsValidation scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0001');
      expect(KEY_STATUS_NOT_EXIST !== screenLockFileManager.KeyStatus.KEY_NOT_EXIST).assertTrue();
      expect(KEY_STATUS_RELEASED !== screenLockFileManager.KeyStatus.KEY_RELEASED).assertTrue();
      expect(KEY_STATUS_EXIST !== screenLockFileManager.KeyStatus.KEY_EXIST).assertTrue();
      sharedDriver.hilogEnd('testConstantsValidation0001');
    });

    /*
     * @tc.number: SUB_CVL_0200
     * @tc.name: testConstantsValidation0002
     * @tc.desc: Verify ConstantsValidation scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0002');
      expect(ACCESS_STATUS_GRANTED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_GRANTED);
      expect(ACCESS_STATUS_DENIED).assertEqual(screenLockFileManager.AccessStatus.ACCESS_DENIED);
      expect(ACCESS_STATUS_GRANTED !== ACCESS_STATUS_DENIED).assertTrue();
      sharedDriver.hilogEnd('testConstantsValidation0002');
    });

    /*
     * @tc.number: SUB_CVL_0300
     * @tc.name: testConstantsValidation0003
     * @tc.desc: Verify ConstantsValidation scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0003');
      expect(RELEASE_STATUS_GRANTED).assertEqual(screenLockFileManager.ReleaseStatus.RELEASE_GRANTED);
      expect(RELEASE_STATUS_DENIED !== screenLockFileManager.ReleaseStatus.RELEASE_DENIED).assertTrue();
      expect(RELEASE_STATUS_GRANTED !== RELEASE_STATUS_DENIED).assertTrue();
      sharedDriver.hilogEnd('testConstantsValidation0003');
    });

    /*
     * @tc.number: SUB_CVL_0400
     * @tc.name: testConstantsValidation0004
     * @tc.desc: Verify ConstantsValidation scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0004');
      expect(MAX_HISTORY_SIZE).assertEqual(10);
      expect(MAX_HISTORY_SIZE).assertLarger(0);
      expect(typeof MAX_HISTORY_SIZE).assertEqual('number');
      sharedDriver.hilogEnd('testConstantsValidation0004');
    });

    /*
     * @tc.number: SUB_CVL_0500
     * @tc.name: testConstantsValidation0005
     * @tc.desc: Verify ConstantsValidation scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0005');
      expect(PAGE_PADDING).assertEqual(24);
      expect(SECTION_SPACING).assertEqual(16);
      expect(ITEM_SPACING).assertEqual(12);
      expect(PAGE_PADDING).assertLarger(0);
      sharedDriver.hilogEnd('testConstantsValidation0005');
    });

    /*
     * @tc.number: SUB_CVL_0600
     * @tc.name: testConstantsValidation0006
     * @tc.desc: Verify ConstantsValidation scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0006');
      expect(TITLE_FONT_SIZE).assertEqual(28);
      expect(SUBTITLE_FONT_SIZE).assertEqual(20);
      expect(BODY_FONT_SIZE).assertEqual(16);
      expect(SMALL_FONT_SIZE).assertEqual(14);
      sharedDriver.hilogEnd('testConstantsValidation0006');
    });

    /*
     * @tc.number: SUB_CVL_0700
     * @tc.name: testConstantsValidation0007
     * @tc.desc: Verify ConstantsValidation scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0007');
      expect(TITLE_FONT_SIZE).assertLarger(SUBTITLE_FONT_SIZE);
      expect(SUBTITLE_FONT_SIZE).assertLarger(BODY_FONT_SIZE);
      expect(BODY_FONT_SIZE).assertLarger(SMALL_FONT_SIZE);
      expect(SMALL_FONT_SIZE).assertLarger(0);
      sharedDriver.hilogEnd('testConstantsValidation0007');
    });

    /*
     * @tc.number: SUB_CVL_0800
     * @tc.name: testConstantsValidation0008
     * @tc.desc: Verify ConstantsValidation scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0008');
      expect(CONTENT_MAX_WIDTH).assertEqual(720);
      expect(BUTTON_HEIGHT).assertEqual(48);
      expect(CARD_RADIUS).assertEqual(12);
      expect(CARD_PADDING).assertEqual(20);
      sharedDriver.hilogEnd('testConstantsValidation0008');
    });

    /*
     * @tc.number: SUB_CVL_0900
     * @tc.name: testConstantsValidation0009
     * @tc.desc: Verify ConstantsValidation scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0009');
      expect(CONTENT_MAX_WIDTH).assertLarger(0);
      expect(BUTTON_HEIGHT).assertLarger(0);
      expect(CARD_RADIUS).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      sharedDriver.hilogEnd('testConstantsValidation0009');
    });

    /*
     * @tc.number: SUB_CVL_1000
     * @tc.name: testConstantsValidation0010
     * @tc.desc: Verify ConstantsValidation scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0010');
      expect(ID_QUERY_BUTTON).assertEqual('queryKeyStateButton');
      expect(ID_ACQUIRE_BUTTON).assertEqual('acquireAccessButton');
      expect(ID_RELEASE_BUTTON).assertEqual('releaseAccessButton');
      expect(ID_QUERY_ALL_BUTTON).assertEqual('queryAllStatesButton');
      sharedDriver.hilogEnd('testConstantsValidation0010');
    });

    /*
     * @tc.number: SUB_CVL_1100
     * @tc.name: testConstantsValidation0011
     * @tc.desc: Verify ConstantsValidation scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0011');
      expect(ID_CLEAR_HISTORY_BUTTON).assertEqual('clearHistoryButton');
      expect(ID_OPERATION_RESULT).assertEqual('operationResult');
      expect(ID_PAIRING_STATUS).assertEqual('pairingStatus');
      expect(ID_QUERY_BUTTON.length).assertLarger(0);
      sharedDriver.hilogEnd('testConstantsValidation0011');
    });

    /*
     * @tc.number: SUB_CVL_1200
     * @tc.name: testConstantsValidation0012
     * @tc.desc: Verify ConstantsValidation scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0012');
      const componentIds: string[] = [
        ID_QUERY_BUTTON, ID_ACQUIRE_BUTTON, ID_RELEASE_BUTTON,
        ID_QUERY_ALL_BUTTON, ID_CLEAR_HISTORY_BUTTON, ID_OPERATION_RESULT, ID_PAIRING_STATUS
      ];
      expect(componentIds.length).assertEqual(7);
      const unique: string[] = [];
      for (let i = 0; i < componentIds.length; i++) {
        let isUnique = true;
        for (let j = 0; j < unique.length; j++) {
          if (componentIds[i] === unique[j]) { isUnique = false; }
        }
        if (isUnique) { unique.push(componentIds[i]); }
      }
      expect(unique.length).assertEqual(componentIds.length);
      expect(componentIds[0].length).assertLarger(0);
      sharedDriver.hilogEnd('testConstantsValidation0012');
    });

    /*
     * @tc.number: SUB_CVL_1300
     * @tc.name: testConstantsValidation0013
     * @tc.desc: Verify ConstantsValidation scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0013');
      expect(KEY_STATUS_NOT_EXIST).assertEqual(0);
      expect(KEY_STATUS_RELEASED).assertEqual(1);
      expect(KEY_STATUS_EXIST).assertEqual(2);
      expect(KEY_STATUS_NOT_EXIST).assertLess(KEY_STATUS_EXIST);
      sharedDriver.hilogEnd('testConstantsValidation0013');
    });

    /*
     * @tc.number: SUB_CVL_1400
     * @tc.name: testConstantsValidation0014
     * @tc.desc: Verify ConstantsValidation scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0014');
      const keyStatusValues: number[] = [KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST];
      expect(keyStatusValues.length).assertEqual(3);
      for (let i = 0; i < keyStatusValues.length; i++) {
        expect(typeof keyStatusValues[i]).assertEqual('number');
        expect(keyStatusValues[i]).assertLarger(-1);
      }
      sharedDriver.hilogEnd('testConstantsValidation0014');
    });

    /*
     * @tc.number: SUB_CVL_1500
     * @tc.name: testConstantsValidation0015
     * @tc.desc: Verify ConstantsValidation scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0015');
      const allEnumValues: number[] = [
        KEY_STATUS_NOT_EXIST, KEY_STATUS_RELEASED, KEY_STATUS_EXIST,
        ACCESS_STATUS_GRANTED, ACCESS_STATUS_DENIED,
        RELEASE_STATUS_GRANTED, RELEASE_STATUS_DENIED
      ];
      expect(allEnumValues.length).assertEqual(7);
      for (let i = 0; i < allEnumValues.length; i++) {
        expect(typeof allEnumValues[i]).assertEqual('number');
      }
      expect(allEnumValues[0]).assertEqual(0);
      sharedDriver.hilogEnd('testConstantsValidation0015');
    });

    /*
     * @tc.number: SUB_CVL_1600
     * @tc.name: testConstantsValidation0016
     * @tc.desc: Verify ConstantsValidation scenario 0016.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0016', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0016');
      const existsQuery = await sharedDriver.existsId(ID_QUERY_BUTTON);
      expect(existsQuery).assertTrue();
      const existsAcquire = await sharedDriver.existsId(ID_ACQUIRE_BUTTON);
      expect(existsAcquire).assertTrue();
      const existsRelease = await sharedDriver.existsId(ID_RELEASE_BUTTON);
      expect(existsRelease).assertTrue();
      sharedDriver.hilogEnd('testConstantsValidation0016');
    });

    /*
     * @tc.number: SUB_CVL_1700
     * @tc.name: testConstantsValidation0017
     * @tc.desc: Verify ConstantsValidation scenario 0017.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0017', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0017');
      await scrollToId(ID_OPERATION_RESULT)
      const existsResult = await sharedDriver.existsId(ID_OPERATION_RESULT);
      expect(existsResult).assertTrue();
      const existsPairing = await sharedDriver.existsId(ID_PAIRING_STATUS);
      expect(existsPairing).assertTrue();
      const existsClear = await sharedDriver.existsId(ID_CLEAR_HISTORY_BUTTON);
      expect(existsClear).assertTrue();
      sharedDriver.hilogEnd('testConstantsValidation0017');
    });

    /*
     * @tc.number: SUB_CVL_1800
     * @tc.name: testConstantsValidation0018
     * @tc.desc: Verify ConstantsValidation scenario 0018.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0018', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0018');
      expect(BUTTON_HEIGHT).assertLarger(0);
      expect(CARD_RADIUS).assertLarger(0);
      expect(CARD_PADDING).assertLarger(0);
      expect(PAGE_PADDING).assertLarger(0);
      expect(typeof BUTTON_HEIGHT).assertEqual('number');
      sharedDriver.hilogEnd('testConstantsValidation0018');
    });

    /*
     * @tc.number: SUB_CVL_1900
     * @tc.name: testConstantsValidation0019
     * @tc.desc: Verify ConstantsValidation scenario 0019.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0019', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0019');
      expect(CARD_RADIUS).assertLess(CARD_PADDING);
      expect(CARD_PADDING).assertLess(PAGE_PADDING);
      expect(BUTTON_HEIGHT).assertLarger(SMALL_FONT_SIZE);
      expect(BUTTON_HEIGHT).assertLess(CONTENT_MAX_WIDTH);
      sharedDriver.hilogEnd('testConstantsValidation0019');
    });

    /*
     * @tc.number: SUB_CVL_2000
     * @tc.name: testConstantsValidation0020
     * @tc.desc: Verify ConstantsValidation scenario 0020.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */

    it('testConstantsValidation0020', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testConstantsValidation0020');
      expect(KEY_STATUS_NOT_EXIST !== screenLockFileManager.KeyStatus.KEY_NOT_EXIST).assertTrue();
      expect(KEY_STATUS_RELEASED !== screenLockFileManager.KeyStatus.KEY_RELEASED).assertTrue();
      expect(KEY_STATUS_EXIST !== screenLockFileManager.KeyStatus.KEY_EXIST).assertTrue();
      expect(ACCESS_STATUS_GRANTED !== screenLockFileManager.AccessStatus.ACCESS_GRANTED).assertFalse();
      expect(ACCESS_STATUS_DENIED !== screenLockFileManager.AccessStatus.ACCESS_DENIED).assertFalse();
      expect(RELEASE_STATUS_GRANTED !== screenLockFileManager.ReleaseStatus.RELEASE_GRANTED).assertFalse();
      expect(RELEASE_STATUS_DENIED !== screenLockFileManager.ReleaseStatus.RELEASE_DENIED).assertTrue();
      sharedDriver.hilogEnd('testConstantsValidation0020');
    });
  });
}
