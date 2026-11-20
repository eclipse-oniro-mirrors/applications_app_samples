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
  DOMAIN, TAG, TITLE_FONT_SIZE, SUBTITLE_FONT_SIZE, BODY_FONT_SIZE, SMALL_FONT_SIZE,
  ID_OPERATION_RESULT
} from './TestConstants';
import { scrollToId } from '../testkit/SharedDriver';

const sharedDriver: SharedDriver = new SharedDriver();
const abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();

export default function fontHierarchyTest(): void {
  describe('FontHierarchyTest', (): void => {

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
    // ==================== 字体层级验证（15 条） ====================

    /*
     * @tc.number: SUB_FNH_0100
     * @tc.name: testFontHierarchy0001
     * @tc.desc: Verify FontHierarchy scenario 0001.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0001', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0001');
      expect(TITLE_FONT_SIZE).assertEqual(28);
      expect(SUBTITLE_FONT_SIZE).assertEqual(20);
      expect(BODY_FONT_SIZE).assertEqual(16);
      expect(SMALL_FONT_SIZE).assertEqual(14);
      sharedDriver.hilogEnd('testFontHierarchy0001');
    });

    /*
     * @tc.number: SUB_FNH_0200
     * @tc.name: testFontHierarchy0002
     * @tc.desc: Verify FontHierarchy scenario 0002.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0002', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0002');
      expect(TITLE_FONT_SIZE).assertLarger(SUBTITLE_FONT_SIZE);
      expect(SUBTITLE_FONT_SIZE).assertLarger(BODY_FONT_SIZE);
      expect(BODY_FONT_SIZE).assertLarger(SMALL_FONT_SIZE);
      sharedDriver.hilogEnd('testFontHierarchy0002');
    });

    /*
     * @tc.number: SUB_FNH_0300
     * @tc.name: testFontHierarchy0003
     * @tc.desc: Verify FontHierarchy scenario 0003.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0003', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0003');
      expect(TITLE_FONT_SIZE).assertLarger(0);
      expect(SUBTITLE_FONT_SIZE).assertLarger(0);
      expect(BODY_FONT_SIZE).assertLarger(0);
      expect(SMALL_FONT_SIZE).assertLarger(0);
      sharedDriver.hilogEnd('testFontHierarchy0003');
    });

    /*
     * @tc.number: SUB_FNH_0400
     * @tc.name: testFontHierarchy0004
     * @tc.desc: Verify FontHierarchy scenario 0004.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0004', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0004');
      expect(typeof TITLE_FONT_SIZE).assertEqual('number');
      expect(typeof SUBTITLE_FONT_SIZE).assertEqual('number');
      expect(typeof BODY_FONT_SIZE).assertEqual('number');
      expect(typeof SMALL_FONT_SIZE).assertEqual('number');
      sharedDriver.hilogEnd('testFontHierarchy0004');
    });

    /*
     * @tc.number: SUB_FNH_0500
     * @tc.name: testFontHierarchy0005
     * @tc.desc: Verify FontHierarchy scenario 0005.
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0005', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0005');
      expect(TITLE_FONT_SIZE - SUBTITLE_FONT_SIZE).assertEqual(8);
      expect(SUBTITLE_FONT_SIZE - BODY_FONT_SIZE).assertEqual(4);
      expect(BODY_FONT_SIZE - SMALL_FONT_SIZE).assertEqual(2);
      sharedDriver.hilogEnd('testFontHierarchy0005');
    });

    /*
     * @tc.number: SUB_FNH_0600
     * @tc.name: testFontHierarchy0006
     * @tc.desc: Verify FontHierarchy scenario 0006.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0006', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0006');
      expect(TITLE_FONT_SIZE).assertEqual(SUBTITLE_FONT_SIZE + 8);
      expect(SUBTITLE_FONT_SIZE).assertEqual(BODY_FONT_SIZE + 4);
      expect(BODY_FONT_SIZE).assertEqual(SMALL_FONT_SIZE + 2);
      sharedDriver.hilogEnd('testFontHierarchy0006');
    });

    /*
     * @tc.number: SUB_FNH_0700
     * @tc.name: testFontHierarchy0007
     * @tc.desc: Verify FontHierarchy scenario 0007.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0007', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0007');
      const ratio1: number = TITLE_FONT_SIZE / SUBTITLE_FONT_SIZE;
      const ratio2: number = SUBTITLE_FONT_SIZE / BODY_FONT_SIZE;
      expect(ratio1).assertLarger(1);
      expect(ratio2).assertLarger(1);
      expect(typeof ratio1).assertEqual('number');
      sharedDriver.hilogEnd('testFontHierarchy0007');
    });

    /*
     * @tc.number: SUB_FNH_0800
     * @tc.name: testFontHierarchy0008
     * @tc.desc: Verify FontHierarchy scenario 0008.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0008', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0008');
      expect(TITLE_FONT_SIZE).assertLess(40);
      expect(SUBTITLE_FONT_SIZE).assertLess(30);
      expect(BODY_FONT_SIZE).assertLess(25);
      expect(SMALL_FONT_SIZE).assertLess(20);
      sharedDriver.hilogEnd('testFontHierarchy0008');
    });

    /*
     * @tc.number: SUB_FNH_0900
     * @tc.name: testFontHierarchy0009
     * @tc.desc: Verify FontHierarchy scenario 0009.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0009', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0009');
      expect(TITLE_FONT_SIZE).assertLarger(20);
      expect(SUBTITLE_FONT_SIZE).assertLarger(15);
      expect(BODY_FONT_SIZE).assertLarger(12);
      expect(SMALL_FONT_SIZE).assertLarger(10);
      sharedDriver.hilogEnd('testFontHierarchy0009');
    });

    /*
     * @tc.number: SUB_FNH_1000
     * @tc.name: testFontHierarchy0010
     * @tc.desc: Verify FontHierarchy scenario 0010.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0010', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0010');
      expect(SMALL_FONT_SIZE).assertLarger(10);
      expect(TITLE_FONT_SIZE).assertLess(50);
      expect(TITLE_FONT_SIZE - SMALL_FONT_SIZE).assertEqual(14);
      sharedDriver.hilogEnd('testFontHierarchy0010');
    });

    /*
     * @tc.number: SUB_FNH_1100
     * @tc.name: testFontHierarchy0011
     * @tc.desc: Verify FontHierarchy scenario 0011.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0011', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0011');
      const fonts: number[] = [TITLE_FONT_SIZE, SUBTITLE_FONT_SIZE, BODY_FONT_SIZE, SMALL_FONT_SIZE];
      expect(fonts.length).assertEqual(4);
      for (let i: number = 0; i < fonts.length; i++) {
        expect(typeof fonts[i]).assertEqual('number');
        expect(fonts[i]).assertLarger(0);
      }
      sharedDriver.hilogEnd('testFontHierarchy0011');
    });

    /*
     * @tc.number: SUB_FNH_1200
     * @tc.name: testFontHierarchy0012
     * @tc.desc: Verify FontHierarchy scenario 0012.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0012', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0012');
      const fonts: number[] = [TITLE_FONT_SIZE, SUBTITLE_FONT_SIZE, BODY_FONT_SIZE, SMALL_FONT_SIZE];
      for (let i: number = 1; i < fonts.length; i++) {
        expect(fonts[i - 1]).assertLarger(fonts[i]);
      }
      expect(fonts[0]).assertLarger(fonts[3]);
      expect(typeof fonts[0]).assertEqual('number');
      sharedDriver.hilogEnd('testFontHierarchy0012');
    });

    /*
     * @tc.number: SUB_FNH_1300
     * @tc.name: testFontHierarchy0013
     * @tc.desc: Verify FontHierarchy scenario 0013.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0013', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0013');
      const sum: number = TITLE_FONT_SIZE + SUBTITLE_FONT_SIZE + BODY_FONT_SIZE + SMALL_FONT_SIZE;
      expect(sum).assertEqual(78);
      expect(sum).assertLarger(0);
      expect(typeof sum).assertEqual('number');
      sharedDriver.hilogEnd('testFontHierarchy0013');
    });

    /*
     * @tc.number: SUB_FNH_1400
     * @tc.name: testFontHierarchy0014
     * @tc.desc: Verify FontHierarchy scenario 0014.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0014', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0014');
      await scrollToId(ID_OPERATION_RESULT)
      const result: string = await sharedDriver.getTextById(ID_OPERATION_RESULT);
      expect(result.length).assertLarger(0);
      expect(typeof result).assertEqual('string');
      expect(typeof result.length).assertEqual('number');
      sharedDriver.hilogEnd('testFontHierarchy0014');
    });

    /*
     * @tc.number: SUB_FNH_1500
     * @tc.name: testFontHierarchy0015
     * @tc.desc: Verify FontHierarchy scenario 0015.
     * @tc.type: Function
     * @tc.level: Level 1
     * @tc.size: MediumTest
     */
    it('testFontHierarchy0015', 0, async (): Promise<void> => {
      sharedDriver.hilogBegin('testFontHierarchy0015');
      expect(TITLE_FONT_SIZE).assertEqual(28);
      expect(SUBTITLE_FONT_SIZE).assertEqual(20);
      expect(BODY_FONT_SIZE).assertEqual(16);
      expect(SMALL_FONT_SIZE).assertEqual(14);
      sharedDriver.hilogEnd('testFontHierarchy0015');
    });
  });
}
