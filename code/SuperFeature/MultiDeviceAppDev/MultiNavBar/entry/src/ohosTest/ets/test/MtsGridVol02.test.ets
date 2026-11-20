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

export default function mtsGridVol02Test() {
  describe('MultiNavBarMtsGridVol02', () => {

    /**
     * @tc.name   testMtsGridVol020001
     * @tc.number SUB_MNB_MTS_1196
     * @tc.desc   getCurrentMainTabsStyle(5, 5, 'SM') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020001 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020001 end');
    });

    /**
     * @tc.name   testMtsGridVol020002
     * @tc.number SUB_MNB_MTS_1197
     * @tc.desc   getCurrentMainTabsStyle(6, 5, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020002 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 5, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020002 end');
    });

    /**
     * @tc.name   testMtsGridVol020003
     * @tc.number SUB_MNB_MTS_1198
     * @tc.desc   getCurrentMainTabsStyle(7, 5, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020003 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 5, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020003 end');
    });

    /**
     * @tc.name   testMtsGridVol020004
     * @tc.number SUB_MNB_MTS_1199
     * @tc.desc   getCurrentMainTabsStyle(8, 5, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020004 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 5, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020004 end');
    });

    /**
     * @tc.name   testMtsGridVol020005
     * @tc.number SUB_MNB_MTS_1200
     * @tc.desc   getCurrentMainTabsStyle(9, 5, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020005 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 5, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020005 end');
    });

    /**
     * @tc.name   testMtsGridVol020006
     * @tc.number SUB_MNB_MTS_1201
     * @tc.desc   getCurrentMainTabsStyle(5, 6, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020006 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 6, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020006 end');
    });

    /**
     * @tc.name   testMtsGridVol020007
     * @tc.number SUB_MNB_MTS_1202
     * @tc.desc   getCurrentMainTabsStyle(6, 6, 'SM') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020007 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020007 end');
    });

    /**
     * @tc.name   testMtsGridVol020008
     * @tc.number SUB_MNB_MTS_1203
     * @tc.desc   getCurrentMainTabsStyle(7, 6, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020008 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 6, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020008 end');
    });

    /**
     * @tc.name   testMtsGridVol020009
     * @tc.number SUB_MNB_MTS_1204
     * @tc.desc   getCurrentMainTabsStyle(8, 6, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020009 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 6, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020009 end');
    });

    /**
     * @tc.name   testMtsGridVol020010
     * @tc.number SUB_MNB_MTS_1205
     * @tc.desc   getCurrentMainTabsStyle(9, 6, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020010 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 6, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020010 end');
    });

    /**
     * @tc.name   testMtsGridVol020011
     * @tc.number SUB_MNB_MTS_1206
     * @tc.desc   getCurrentMainTabsStyle(5, 7, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020011 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 7, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020011 end');
    });

    /**
     * @tc.name   testMtsGridVol020012
     * @tc.number SUB_MNB_MTS_1207
     * @tc.desc   getCurrentMainTabsStyle(6, 7, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020012 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 7, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020012 end');
    });

    /**
     * @tc.name   testMtsGridVol020013
     * @tc.number SUB_MNB_MTS_1208
     * @tc.desc   getCurrentMainTabsStyle(7, 7, 'SM') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020013 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020013 end');
    });

    /**
     * @tc.name   testMtsGridVol020014
     * @tc.number SUB_MNB_MTS_1209
     * @tc.desc   getCurrentMainTabsStyle(8, 7, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020014 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 7, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020014 end');
    });

    /**
     * @tc.name   testMtsGridVol020015
     * @tc.number SUB_MNB_MTS_1210
     * @tc.desc   getCurrentMainTabsStyle(9, 7, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020015 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 7, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020015 end');
    });

    /**
     * @tc.name   testMtsGridVol020016
     * @tc.number SUB_MNB_MTS_1211
     * @tc.desc   getCurrentMainTabsStyle(5, 8, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020016 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 8, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020016 end');
    });

    /**
     * @tc.name   testMtsGridVol020017
     * @tc.number SUB_MNB_MTS_1212
     * @tc.desc   getCurrentMainTabsStyle(6, 8, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020017 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 8, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020017 end');
    });

    /**
     * @tc.name   testMtsGridVol020018
     * @tc.number SUB_MNB_MTS_1213
     * @tc.desc   getCurrentMainTabsStyle(7, 8, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020018 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 8, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020018 end');
    });

    /**
     * @tc.name   testMtsGridVol020019
     * @tc.number SUB_MNB_MTS_1214
     * @tc.desc   getCurrentMainTabsStyle(8, 8, 'SM') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020019 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020019 end');
    });

    /**
     * @tc.name   testMtsGridVol020020
     * @tc.number SUB_MNB_MTS_1215
     * @tc.desc   getCurrentMainTabsStyle(9, 8, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020020 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 8, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020020 end');
    });

    /**
     * @tc.name   testMtsGridVol020021
     * @tc.number SUB_MNB_MTS_1216
     * @tc.desc   getCurrentMainTabsStyle(5, 9, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020021 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 9, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020021 end');
    });

    /**
     * @tc.name   testMtsGridVol020022
     * @tc.number SUB_MNB_MTS_1217
     * @tc.desc   getCurrentMainTabsStyle(6, 9, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020022 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 9, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020022 end');
    });

    /**
     * @tc.name   testMtsGridVol020023
     * @tc.number SUB_MNB_MTS_1218
     * @tc.desc   getCurrentMainTabsStyle(7, 9, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020023 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 9, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020023 end');
    });

    /**
     * @tc.name   testMtsGridVol020024
     * @tc.number SUB_MNB_MTS_1219
     * @tc.desc   getCurrentMainTabsStyle(8, 9, 'SM') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020024 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 9, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020024 end');
    });

    /**
     * @tc.name   testMtsGridVol020025
     * @tc.number SUB_MNB_MTS_1220
     * @tc.desc   getCurrentMainTabsStyle(9, 9, 'SM') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020025 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'SM');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020025 end');
    });

    /**
     * @tc.name   testMtsGridVol020026
     * @tc.number SUB_MNB_MTS_1221
     * @tc.desc   getCurrentMainTabsStyle(5, 5, 'Md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020026 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020026 end');
    });

    /**
     * @tc.name   testMtsGridVol020027
     * @tc.number SUB_MNB_MTS_1222
     * @tc.desc   getCurrentMainTabsStyle(6, 5, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020027 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 5, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020027 end');
    });

    /**
     * @tc.name   testMtsGridVol020028
     * @tc.number SUB_MNB_MTS_1223
     * @tc.desc   getCurrentMainTabsStyle(7, 5, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020028 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 5, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020028 end');
    });

    /**
     * @tc.name   testMtsGridVol020029
     * @tc.number SUB_MNB_MTS_1224
     * @tc.desc   getCurrentMainTabsStyle(8, 5, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020029 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 5, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020029 end');
    });

    /**
     * @tc.name   testMtsGridVol020030
     * @tc.number SUB_MNB_MTS_1225
     * @tc.desc   getCurrentMainTabsStyle(9, 5, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020030 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 5, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020030 end');
    });

    /**
     * @tc.name   testMtsGridVol020031
     * @tc.number SUB_MNB_MTS_1226
     * @tc.desc   getCurrentMainTabsStyle(5, 6, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020031 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 6, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020031 end');
    });

    /**
     * @tc.name   testMtsGridVol020032
     * @tc.number SUB_MNB_MTS_1227
     * @tc.desc   getCurrentMainTabsStyle(6, 6, 'Md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020032 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020032 end');
    });

    /**
     * @tc.name   testMtsGridVol020033
     * @tc.number SUB_MNB_MTS_1228
     * @tc.desc   getCurrentMainTabsStyle(7, 6, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020033 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 6, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020033 end');
    });

    /**
     * @tc.name   testMtsGridVol020034
     * @tc.number SUB_MNB_MTS_1229
     * @tc.desc   getCurrentMainTabsStyle(8, 6, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020034 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 6, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020034 end');
    });

    /**
     * @tc.name   testMtsGridVol020035
     * @tc.number SUB_MNB_MTS_1230
     * @tc.desc   getCurrentMainTabsStyle(9, 6, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020035 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 6, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020035 end');
    });

    /**
     * @tc.name   testMtsGridVol020036
     * @tc.number SUB_MNB_MTS_1231
     * @tc.desc   getCurrentMainTabsStyle(5, 7, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020036 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 7, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(5, 5, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020036 end');
    });

    /**
     * @tc.name   testMtsGridVol020037
     * @tc.number SUB_MNB_MTS_1232
     * @tc.desc   getCurrentMainTabsStyle(6, 7, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020037 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 7, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_INACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_INACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(6, 6, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('false'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020037 end');
    });

    /**
     * @tc.name   testMtsGridVol020038
     * @tc.number SUB_MNB_MTS_1233
     * @tc.desc   getCurrentMainTabsStyle(7, 7, 'Md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020038 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'Md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fillColor),
        String(MAIN_TABS_ACTIVE_FILL));
      expect(String(result.fillColor)).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(MAIN_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor), String(MAIN_TABS_ACTIVE_FILL));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'sm').fillColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FILL);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor), String(MAIN_TABS_ACTIVE_FONT));
      expect(
        String(StyleConfiguration.getCurrentMainTabsStyle(7, 7, 'md').fontColor)
      ).assertEqual(MAIN_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(String(result.fillColor === result.fontColor)), String('true'));
      expect(String(String(result.fillColor === result.fontColor))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020038 end');
    });

  });
}
