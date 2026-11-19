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

export default function mtsGridVol02BTest() {
  describe('MultiNavBarMtsGridVol02B', () => {

    /**
     * @tc.name   testMtsGridVol020039
     * @tc.number SUB_MNB_MTS_1234
     * @tc.desc   getCurrentMainTabsStyle(8, 7, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020039 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 7, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020039 end');
    });

    /**
     * @tc.name   testMtsGridVol020040
     * @tc.number SUB_MNB_MTS_1235
     * @tc.desc   getCurrentMainTabsStyle(9, 7, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020040 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 7, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020040 end');
    });

    /**
     * @tc.name   testMtsGridVol020041
     * @tc.number SUB_MNB_MTS_1236
     * @tc.desc   getCurrentMainTabsStyle(5, 8, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020041 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 8, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020041 end');
    });

    /**
     * @tc.name   testMtsGridVol020042
     * @tc.number SUB_MNB_MTS_1237
     * @tc.desc   getCurrentMainTabsStyle(6, 8, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020042 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 8, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020042 end');
    });

    /**
     * @tc.name   testMtsGridVol020043
     * @tc.number SUB_MNB_MTS_1238
     * @tc.desc   getCurrentMainTabsStyle(7, 8, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020043 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 8, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020043 end');
    });

    /**
     * @tc.name   testMtsGridVol020044
     * @tc.number SUB_MNB_MTS_1239
     * @tc.desc   getCurrentMainTabsStyle(8, 8, 'Md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020044 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 8, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020044 end');
    });

    /**
     * @tc.name   testMtsGridVol020045
     * @tc.number SUB_MNB_MTS_1240
     * @tc.desc   getCurrentMainTabsStyle(9, 8, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020045 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 8, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020045 end');
    });

    /**
     * @tc.name   testMtsGridVol020046
     * @tc.number SUB_MNB_MTS_1241
     * @tc.desc   getCurrentMainTabsStyle(5, 9, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020046 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 9, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020046 end');
    });

    /**
     * @tc.name   testMtsGridVol020047
     * @tc.number SUB_MNB_MTS_1242
     * @tc.desc   getCurrentMainTabsStyle(6, 9, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020047 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 9, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020047 end');
    });

    /**
     * @tc.name   testMtsGridVol020048
     * @tc.number SUB_MNB_MTS_1243
     * @tc.desc   getCurrentMainTabsStyle(7, 9, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020048 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 9, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020048 end');
    });

    /**
     * @tc.name   testMtsGridVol020049
     * @tc.number SUB_MNB_MTS_1244
     * @tc.desc   getCurrentMainTabsStyle(8, 9, 'Md') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020049 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 9, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020049 end');
    });

    /**
     * @tc.name   testMtsGridVol020050
     * @tc.number SUB_MNB_MTS_1245
     * @tc.desc   getCurrentMainTabsStyle(9, 9, 'Md') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020050 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 9, 'Md');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020050 end');
    });

    /**
     * @tc.name   testMtsGridVol020051
     * @tc.number SUB_MNB_MTS_1246
     * @tc.desc   getCurrentMainTabsStyle(5, 5, '') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020051 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 5, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020051 end');
    });

    /**
     * @tc.name   testMtsGridVol020052
     * @tc.number SUB_MNB_MTS_1247
     * @tc.desc   getCurrentMainTabsStyle(6, 5, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020052 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 5, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020052 end');
    });

    /**
     * @tc.name   testMtsGridVol020053
     * @tc.number SUB_MNB_MTS_1248
     * @tc.desc   getCurrentMainTabsStyle(7, 5, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020053 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 5, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020053 end');
    });

    /**
     * @tc.name   testMtsGridVol020054
     * @tc.number SUB_MNB_MTS_1249
     * @tc.desc   getCurrentMainTabsStyle(8, 5, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020054 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 5, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020054 end');
    });

    /**
     * @tc.name   testMtsGridVol020055
     * @tc.number SUB_MNB_MTS_1250
     * @tc.desc   getCurrentMainTabsStyle(9, 5, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020055 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 5, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020055 end');
    });

    /**
     * @tc.name   testMtsGridVol020056
     * @tc.number SUB_MNB_MTS_1251
     * @tc.desc   getCurrentMainTabsStyle(5, 6, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020056 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 6, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020056 end');
    });

    /**
     * @tc.name   testMtsGridVol020057
     * @tc.number SUB_MNB_MTS_1252
     * @tc.desc   getCurrentMainTabsStyle(6, 6, '') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020057 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 6, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020057 end');
    });

    /**
     * @tc.name   testMtsGridVol020058
     * @tc.number SUB_MNB_MTS_1253
     * @tc.desc   getCurrentMainTabsStyle(7, 6, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020058 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 6, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020058 end');
    });

    /**
     * @tc.name   testMtsGridVol020059
     * @tc.number SUB_MNB_MTS_1254
     * @tc.desc   getCurrentMainTabsStyle(8, 6, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020059 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 6, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020059 end');
    });

    /**
     * @tc.name   testMtsGridVol020060
     * @tc.number SUB_MNB_MTS_1255
     * @tc.desc   getCurrentMainTabsStyle(9, 6, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020060 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 6, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020060 end');
    });

    /**
     * @tc.name   testMtsGridVol020061
     * @tc.number SUB_MNB_MTS_1256
     * @tc.desc   getCurrentMainTabsStyle(5, 7, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020061 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 7, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020061 end');
    });

    /**
     * @tc.name   testMtsGridVol020062
     * @tc.number SUB_MNB_MTS_1257
     * @tc.desc   getCurrentMainTabsStyle(6, 7, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020062 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 7, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020062 end');
    });

    /**
     * @tc.name   testMtsGridVol020063
     * @tc.number SUB_MNB_MTS_1258
     * @tc.desc   getCurrentMainTabsStyle(7, 7, '') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020063 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 7, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020063 end');
    });

    /**
     * @tc.name   testMtsGridVol020064
     * @tc.number SUB_MNB_MTS_1259
     * @tc.desc   getCurrentMainTabsStyle(8, 7, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020064 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 7, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020064 end');
    });

    /**
     * @tc.name   testMtsGridVol020065
     * @tc.number SUB_MNB_MTS_1260
     * @tc.desc   getCurrentMainTabsStyle(9, 7, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020065 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 7, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020065 end');
    });

    /**
     * @tc.name   testMtsGridVol020066
     * @tc.number SUB_MNB_MTS_1261
     * @tc.desc   getCurrentMainTabsStyle(5, 8, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020066 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 8, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020066 end');
    });

    /**
     * @tc.name   testMtsGridVol020067
     * @tc.number SUB_MNB_MTS_1262
     * @tc.desc   getCurrentMainTabsStyle(6, 8, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020067 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 8, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020067 end');
    });

    /**
     * @tc.name   testMtsGridVol020068
     * @tc.number SUB_MNB_MTS_1263
     * @tc.desc   getCurrentMainTabsStyle(7, 8, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020068 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 8, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020068 end');
    });

    /**
     * @tc.name   testMtsGridVol020069
     * @tc.number SUB_MNB_MTS_1264
     * @tc.desc   getCurrentMainTabsStyle(8, 8, '') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020069 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 8, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020069 end');
    });

    /**
     * @tc.name   testMtsGridVol020070
     * @tc.number SUB_MNB_MTS_1265
     * @tc.desc   getCurrentMainTabsStyle(9, 8, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020070 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(9, 8, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020070 end');
    });

    /**
     * @tc.name   testMtsGridVol020071
     * @tc.number SUB_MNB_MTS_1266
     * @tc.desc   getCurrentMainTabsStyle(5, 9, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020071 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(5, 9, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020071 end');
    });

    /**
     * @tc.name   testMtsGridVol020072
     * @tc.number SUB_MNB_MTS_1267
     * @tc.desc   getCurrentMainTabsStyle(6, 9, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020072 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(6, 9, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020072 end');
    });

    /**
     * @tc.name   testMtsGridVol020073
     * @tc.number SUB_MNB_MTS_1268
     * @tc.desc   getCurrentMainTabsStyle(7, 9, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020073 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(7, 9, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020073 end');
    });

    /**
     * @tc.name   testMtsGridVol020074
     * @tc.number SUB_MNB_MTS_1269
     * @tc.desc   getCurrentMainTabsStyle(8, 9, '') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020074 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(8, 9, '');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020074 end');
    });

    /**
     * @tc.name   testMtsGridVol020075
     * @tc.number SUB_MNB_MTS_1270
     * @tc.desc   Anchor: a negative index still highlights when both sides are -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020075 begin');
      const same: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(-1, -1, 'md');
      const other: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(-1, 0, 'md');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'same=%{public}s other=%{public}s', same.fillColor, other.fillColor);
      expect(same.fillColor).assertEqual(MAIN_TABS_ACTIVE_FILL);
      expect(other.fillColor).assertEqual(MAIN_TABS_INACTIVE_FILL);
      expect(same.fillColor === other.fillColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol020075 end');
    });
  });
}
