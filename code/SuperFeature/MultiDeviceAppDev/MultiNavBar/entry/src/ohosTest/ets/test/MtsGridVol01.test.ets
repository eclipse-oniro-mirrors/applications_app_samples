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

// @volume rule=slot basis=main-frozen cases=38
// Volume cases, see section 4 of ohosTest.md for the generation rule. Hand-written anchor cases must be added
// to the same describe and marked with an @tc.desc starting with 'Anchor:'.
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { StyleConfiguration } from '../../../main/ets/common/Configuration';
import { CustomFontStyle } from '../../../main/ets/model/StyleType';
import {
  MAIN_TABS_ACTIVE_FILL,
  MAIN_TABS_ACTIVE_FONT,
  MAIN_TABS_INACTIVE_FILL,
  MAIN_TABS_INACTIVE_FONT
} from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function mtsGridVol01Test() {
  describe('MultiNavBarMtsGridVol01', () => {

    /**
     * @tc.name   testMtsGridVol010001
     * @tc.number SUB_MNB_MTS_1121
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'sm') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010001 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010001 end');
    });

    /**
     * @tc.name   testMtsGridVol010002
     * @tc.number SUB_MNB_MTS_1122
     * @tc.desc   getCurrentMainTabsStyle(1, 0, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010002 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 0, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010002 end');
    });

    /**
     * @tc.name   testMtsGridVol010003
     * @tc.number SUB_MNB_MTS_1123
     * @tc.desc   getCurrentMainTabsStyle(2, 0, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010003 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 0, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010003 end');
    });

    /**
     * @tc.name   testMtsGridVol010004
     * @tc.number SUB_MNB_MTS_1124
     * @tc.desc   getCurrentMainTabsStyle(3, 0, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010004 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 0, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010004 end');
    });

    /**
     * @tc.name   testMtsGridVol010005
     * @tc.number SUB_MNB_MTS_1125
     * @tc.desc   getCurrentMainTabsStyle(4, 0, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010005 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 0, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010005 end');
    });

    /**
     * @tc.name   testMtsGridVol010006
     * @tc.number SUB_MNB_MTS_1126
     * @tc.desc   getCurrentMainTabsStyle(0, 1, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010006 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 1, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010006 end');
    });

    /**
     * @tc.name   testMtsGridVol010007
     * @tc.number SUB_MNB_MTS_1127
     * @tc.desc   getCurrentMainTabsStyle(1, 1, 'sm') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010007 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010007 end');
    });

    /**
     * @tc.name   testMtsGridVol010008
     * @tc.number SUB_MNB_MTS_1128
     * @tc.desc   getCurrentMainTabsStyle(2, 1, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010008 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 1, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010008 end');
    });

    /**
     * @tc.name   testMtsGridVol010009
     * @tc.number SUB_MNB_MTS_1129
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010009 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010009 end');
    });

    /**
     * @tc.name   testMtsGridVol010010
     * @tc.number SUB_MNB_MTS_1130
     * @tc.desc   getCurrentMainTabsStyle(4, 1, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010010 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 1, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010010 end');
    });

    /**
     * @tc.name   testMtsGridVol010011
     * @tc.number SUB_MNB_MTS_1131
     * @tc.desc   getCurrentMainTabsStyle(0, 2, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010011 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 2, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010011 end');
    });

    /**
     * @tc.name   testMtsGridVol010012
     * @tc.number SUB_MNB_MTS_1132
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010012 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010012 end');
    });

    /**
     * @tc.name   testMtsGridVol010013
     * @tc.number SUB_MNB_MTS_1133
     * @tc.desc   getCurrentMainTabsStyle(2, 2, 'sm') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010013 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010013 end');
    });

    /**
     * @tc.name   testMtsGridVol010014
     * @tc.number SUB_MNB_MTS_1134
     * @tc.desc   getCurrentMainTabsStyle(3, 2, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010014 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 2, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010014 end');
    });

    /**
     * @tc.name   testMtsGridVol010015
     * @tc.number SUB_MNB_MTS_1135
     * @tc.desc   getCurrentMainTabsStyle(4, 2, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010015 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 2, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010015 end');
    });

    /**
     * @tc.name   testMtsGridVol010016
     * @tc.number SUB_MNB_MTS_1136
     * @tc.desc   getCurrentMainTabsStyle(0, 3, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010016 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 3, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010016 end');
    });

    /**
     * @tc.name   testMtsGridVol010017
     * @tc.number SUB_MNB_MTS_1137
     * @tc.desc   getCurrentMainTabsStyle(1, 3, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010017 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 3, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010017 end');
    });

    /**
     * @tc.name   testMtsGridVol010018
     * @tc.number SUB_MNB_MTS_1138
     * @tc.desc   getCurrentMainTabsStyle(2, 3, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010018 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 3, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010018 end');
    });

    /**
     * @tc.name   testMtsGridVol010019
     * @tc.number SUB_MNB_MTS_1139
     * @tc.desc   getCurrentMainTabsStyle(3, 3, 'sm') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010019 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010019 end');
    });

    /**
     * @tc.name   testMtsGridVol010020
     * @tc.number SUB_MNB_MTS_1140
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010020 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010020 end');
    });

    /**
     * @tc.name   testMtsGridVol010021
     * @tc.number SUB_MNB_MTS_1141
     * @tc.desc   getCurrentMainTabsStyle(0, 4, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010021 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 4, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010021 end');
    });

    /**
     * @tc.name   testMtsGridVol010022
     * @tc.number SUB_MNB_MTS_1142
     * @tc.desc   getCurrentMainTabsStyle(1, 4, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010022 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 4, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010022 end');
    });

    /**
     * @tc.name   testMtsGridVol010023
     * @tc.number SUB_MNB_MTS_1143
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010023 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010023 end');
    });

    /**
     * @tc.name   testMtsGridVol010024
     * @tc.number SUB_MNB_MTS_1144
     * @tc.desc   getCurrentMainTabsStyle(3, 4, 'sm') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010024 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 4, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010024 end');
    });

    /**
     * @tc.name   testMtsGridVol010025
     * @tc.number SUB_MNB_MTS_1145
     * @tc.desc   getCurrentMainTabsStyle(4, 4, 'sm') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010025 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010025 end');
    });

    /**
     * @tc.name   testMtsGridVol010026
     * @tc.number SUB_MNB_MTS_1146
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010026 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010026 end');
    });

    /**
     * @tc.name   testMtsGridVol010027
     * @tc.number SUB_MNB_MTS_1147
     * @tc.desc   getCurrentMainTabsStyle(1, 0, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010027 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 0, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010027 end');
    });

    /**
     * @tc.name   testMtsGridVol010028
     * @tc.number SUB_MNB_MTS_1148
     * @tc.desc   getCurrentMainTabsStyle(2, 0, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010028 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 0, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010028 end');
    });

    /**
     * @tc.name   testMtsGridVol010029
     * @tc.number SUB_MNB_MTS_1149
     * @tc.desc   getCurrentMainTabsStyle(3, 0, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010029 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 0, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010029 end');
    });

    /**
     * @tc.name   testMtsGridVol010030
     * @tc.number SUB_MNB_MTS_1150
     * @tc.desc   getCurrentMainTabsStyle(4, 0, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010030 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 0, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010030 end');
    });

    /**
     * @tc.name   testMtsGridVol010031
     * @tc.number SUB_MNB_MTS_1151
     * @tc.desc   getCurrentMainTabsStyle(0, 1, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010031 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 1, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010031 end');
    });

    /**
     * @tc.name   testMtsGridVol010032
     * @tc.number SUB_MNB_MTS_1152
     * @tc.desc   getCurrentMainTabsStyle(1, 1, 'md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010032 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010032 end');
    });

    /**
     * @tc.name   testMtsGridVol010033
     * @tc.number SUB_MNB_MTS_1153
     * @tc.desc   getCurrentMainTabsStyle(2, 1, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010033 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 1, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010033 end');
    });

    /**
     * @tc.name   testMtsGridVol010034
     * @tc.number SUB_MNB_MTS_1154
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010034 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(3, 3, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010034 end');
    });

    /**
     * @tc.name   testMtsGridVol010035
     * @tc.number SUB_MNB_MTS_1155
     * @tc.desc   getCurrentMainTabsStyle(4, 1, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010035 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 1, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(4, 4, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010035 end');
    });

    /**
     * @tc.name   testMtsGridVol010036
     * @tc.number SUB_MNB_MTS_1156
     * @tc.desc   getCurrentMainTabsStyle(0, 2, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010036 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 2, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010036 end');
    });

    /**
     * @tc.name   testMtsGridVol010037
     * @tc.number SUB_MNB_MTS_1157
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010037 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(1, 1, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010037 end');
    });

    /**
     * @tc.name   testMtsGridVol010038
     * @tc.number SUB_MNB_MTS_1158
     * @tc.desc   getCurrentMainTabsStyle(2, 2, 'md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol010038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010038 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(2, 2, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol010038 end');
    });

  });
}
