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

// @volume rule=slot basis=main-frozen cases=37
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

export default function mtsGridVol03BTest() {
  describe('MultiNavBarMtsGridVol03B', () => {

    /**
     * @tc.name   testMtsGridVol030039
     * @tc.number SUB_MNB_MTS_1309
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030039 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030039 end');
    });

    /**
     * @tc.name   testMtsGridVol030040
     * @tc.number SUB_MNB_MTS_1310
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030040 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030040 end');
    });

    /**
     * @tc.name   testMtsGridVol030041
     * @tc.number SUB_MNB_MTS_1311
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'lg ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030041 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030041 end');
    });

    /**
     * @tc.name   testMtsGridVol030042
     * @tc.number SUB_MNB_MTS_1312
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030042 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030042 end');
    });

    /**
     * @tc.name   testMtsGridVol030043
     * @tc.number SUB_MNB_MTS_1313
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030043 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030043 end');
    });

    /**
     * @tc.name   testMtsGridVol030044
     * @tc.number SUB_MNB_MTS_1314
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030044 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030044 end');
    });

    /**
     * @tc.name   testMtsGridVol030045
     * @tc.number SUB_MNB_MTS_1315
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030045 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030045 end');
    });

    /**
     * @tc.name   testMtsGridVol030046
     * @tc.number SUB_MNB_MTS_1316
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'lg ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030046 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030046 end');
    });

    /**
     * @tc.name   testMtsGridVol030047
     * @tc.number SUB_MNB_MTS_1317
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030047 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030047 end');
    });

    /**
     * @tc.name   testMtsGridVol030048
     * @tc.number SUB_MNB_MTS_1318
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030048 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030048 end');
    });

    /**
     * @tc.name   testMtsGridVol030049
     * @tc.number SUB_MNB_MTS_1319
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030049 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030049 end');
    });

    /**
     * @tc.name   testMtsGridVol030050
     * @tc.number SUB_MNB_MTS_1320
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030050 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'lg ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030050 end');
    });

    /**
     * @tc.name   testMtsGridVol030051
     * @tc.number SUB_MNB_MTS_1321
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'smlg') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030051 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030051 end');
    });

    /**
     * @tc.name   testMtsGridVol030052
     * @tc.number SUB_MNB_MTS_1322
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030052 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030052 end');
    });

    /**
     * @tc.name   testMtsGridVol030053
     * @tc.number SUB_MNB_MTS_1323
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030053 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030053 end');
    });

    /**
     * @tc.name   testMtsGridVol030054
     * @tc.number SUB_MNB_MTS_1324
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030054 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030054 end');
    });

    /**
     * @tc.name   testMtsGridVol030055
     * @tc.number SUB_MNB_MTS_1325
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030055 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030055 end');
    });

    /**
     * @tc.name   testMtsGridVol030056
     * @tc.number SUB_MNB_MTS_1326
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'smlg') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030056 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030056 end');
    });

    /**
     * @tc.name   testMtsGridVol030057
     * @tc.number SUB_MNB_MTS_1327
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030057 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030057 end');
    });

    /**
     * @tc.name   testMtsGridVol030058
     * @tc.number SUB_MNB_MTS_1328
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030058 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030058 end');
    });

    /**
     * @tc.name   testMtsGridVol030059
     * @tc.number SUB_MNB_MTS_1329
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030059 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030059 end');
    });

    /**
     * @tc.name   testMtsGridVol030060
     * @tc.number SUB_MNB_MTS_1330
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030060 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030060 end');
    });

    /**
     * @tc.name   testMtsGridVol030061
     * @tc.number SUB_MNB_MTS_1331
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'smlg') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030061 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030061 end');
    });

    /**
     * @tc.name   testMtsGridVol030062
     * @tc.number SUB_MNB_MTS_1332
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030062 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030062 end');
    });

    /**
     * @tc.name   testMtsGridVol030063
     * @tc.number SUB_MNB_MTS_1333
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030063 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030063 end');
    });

    /**
     * @tc.name   testMtsGridVol030064
     * @tc.number SUB_MNB_MTS_1334
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030064 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030064 end');
    });

    /**
     * @tc.name   testMtsGridVol030065
     * @tc.number SUB_MNB_MTS_1335
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030065 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030065 end');
    });

    /**
     * @tc.name   testMtsGridVol030066
     * @tc.number SUB_MNB_MTS_1336
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'smlg') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030066 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030066 end');
    });

    /**
     * @tc.name   testMtsGridVol030067
     * @tc.number SUB_MNB_MTS_1337
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030067 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030067 end');
    });

    /**
     * @tc.name   testMtsGridVol030068
     * @tc.number SUB_MNB_MTS_1338
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030068 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030068 end');
    });

    /**
     * @tc.name   testMtsGridVol030069
     * @tc.number SUB_MNB_MTS_1339
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030069 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030069 end');
    });

    /**
     * @tc.name   testMtsGridVol030070
     * @tc.number SUB_MNB_MTS_1340
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030070 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030070 end');
    });

    /**
     * @tc.name   testMtsGridVol030071
     * @tc.number SUB_MNB_MTS_1341
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'smlg') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030071 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030071 end');
    });

    /**
     * @tc.name   testMtsGridVol030072
     * @tc.number SUB_MNB_MTS_1342
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030072 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030072 end');
    });

    /**
     * @tc.name   testMtsGridVol030073
     * @tc.number SUB_MNB_MTS_1343
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030073 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030073 end');
    });

    /**
     * @tc.name   testMtsGridVol030074
     * @tc.number SUB_MNB_MTS_1344
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'smlg') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030074 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'smlg');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030074 end');
    });

    /**
     * @tc.name   testMtsGridVol030075
     * @tc.number SUB_MNB_MTS_1345
     * @tc.desc   Anchor: a fractional current index never matches integer index 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030075 begin');
      const fractional: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1.5, 1.5, 'sm ');
      const truncated: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1.5, 1, 'sm ');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'fractional=%{public}s truncated=%{public}s', fractional.fontColor,
        truncated.fontColor);
      expect(fractional.fontColor).assertEqual(MAIN_TABS_ACTIVE_FONT);
      expect(truncated.fontColor).assertEqual(MAIN_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check fractional.fillColor === truncated.fillColor');
      expect(fractional.fillColor === truncated.fillColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030075 end');
    });
  });
}
