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

export default function mtsGridVol03Test() {
  describe('MultiNavBarMtsGridVol03', () => {

    /**
     * @tc.name   testMtsGridVol030001
     * @tc.number SUB_MNB_MTS_1271
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'sm ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030001 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030001 end');
    });

    /**
     * @tc.name   testMtsGridVol030002
     * @tc.number SUB_MNB_MTS_1272
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030002 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030002 end');
    });

    /**
     * @tc.name   testMtsGridVol030003
     * @tc.number SUB_MNB_MTS_1273
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030003 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030003 end');
    });

    /**
     * @tc.name   testMtsGridVol030004
     * @tc.number SUB_MNB_MTS_1274
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030004 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030004 end');
    });

    /**
     * @tc.name   testMtsGridVol030005
     * @tc.number SUB_MNB_MTS_1275
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030005 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030005 end');
    });

    /**
     * @tc.name   testMtsGridVol030006
     * @tc.number SUB_MNB_MTS_1276
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'sm ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030006 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030006 end');
    });

    /**
     * @tc.name   testMtsGridVol030007
     * @tc.number SUB_MNB_MTS_1277
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030007 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030007 end');
    });

    /**
     * @tc.name   testMtsGridVol030008
     * @tc.number SUB_MNB_MTS_1278
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030008 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030008 end');
    });

    /**
     * @tc.name   testMtsGridVol030009
     * @tc.number SUB_MNB_MTS_1279
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030009 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030009 end');
    });

    /**
     * @tc.name   testMtsGridVol030010
     * @tc.number SUB_MNB_MTS_1280
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030010 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030010 end');
    });

    /**
     * @tc.name   testMtsGridVol030011
     * @tc.number SUB_MNB_MTS_1281
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'sm ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030011 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030011 end');
    });

    /**
     * @tc.name   testMtsGridVol030012
     * @tc.number SUB_MNB_MTS_1282
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030012 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030012 end');
    });

    /**
     * @tc.name   testMtsGridVol030013
     * @tc.number SUB_MNB_MTS_1283
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030013 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030013 end');
    });

    /**
     * @tc.name   testMtsGridVol030014
     * @tc.number SUB_MNB_MTS_1284
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030014 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030014 end');
    });

    /**
     * @tc.name   testMtsGridVol030015
     * @tc.number SUB_MNB_MTS_1285
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030015 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030015 end');
    });

    /**
     * @tc.name   testMtsGridVol030016
     * @tc.number SUB_MNB_MTS_1286
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'sm ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030016 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030016 end');
    });

    /**
     * @tc.name   testMtsGridVol030017
     * @tc.number SUB_MNB_MTS_1287
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030017 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030017 end');
    });

    /**
     * @tc.name   testMtsGridVol030018
     * @tc.number SUB_MNB_MTS_1288
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030018 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030018 end');
    });

    /**
     * @tc.name   testMtsGridVol030019
     * @tc.number SUB_MNB_MTS_1289
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030019 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030019 end');
    });

    /**
     * @tc.name   testMtsGridVol030020
     * @tc.number SUB_MNB_MTS_1290
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030020 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030020 end');
    });

    /**
     * @tc.name   testMtsGridVol030021
     * @tc.number SUB_MNB_MTS_1291
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'sm ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030021 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(0, 0, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030021 end');
    });

    /**
     * @tc.name   testMtsGridVol030022
     * @tc.number SUB_MNB_MTS_1292
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030022 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(1, 2, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030022 end');
    });

    /**
     * @tc.name   testMtsGridVol030023
     * @tc.number SUB_MNB_MTS_1293
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030023 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(2, 4, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030023 end');
    });

    /**
     * @tc.name   testMtsGridVol030024
     * @tc.number SUB_MNB_MTS_1294
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030024 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(3, 1, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030024 end');
    });

    /**
     * @tc.name   testMtsGridVol030025
     * @tc.number SUB_MNB_MTS_1295
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'sm ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030025 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentMainTabsStyle(4, 3, 'sm ');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030025 end');
    });

    /**
     * @tc.name   testMtsGridVol030026
     * @tc.number SUB_MNB_MTS_1296
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'lg ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030026 end');
    });

    /**
     * @tc.name   testMtsGridVol030027
     * @tc.number SUB_MNB_MTS_1297
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030027 end');
    });

    /**
     * @tc.name   testMtsGridVol030028
     * @tc.number SUB_MNB_MTS_1298
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030028 end');
    });

    /**
     * @tc.name   testMtsGridVol030029
     * @tc.number SUB_MNB_MTS_1299
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030029 end');
    });

    /**
     * @tc.name   testMtsGridVol030030
     * @tc.number SUB_MNB_MTS_1300
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030030 end');
    });

    /**
     * @tc.name   testMtsGridVol030031
     * @tc.number SUB_MNB_MTS_1301
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'lg ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030031 end');
    });

    /**
     * @tc.name   testMtsGridVol030032
     * @tc.number SUB_MNB_MTS_1302
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030032 end');
    });

    /**
     * @tc.name   testMtsGridVol030033
     * @tc.number SUB_MNB_MTS_1303
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030033 end');
    });

    /**
     * @tc.name   testMtsGridVol030034
     * @tc.number SUB_MNB_MTS_1304
     * @tc.desc   getCurrentMainTabsStyle(3, 1, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030034 end');
    });

    /**
     * @tc.name   testMtsGridVol030035
     * @tc.number SUB_MNB_MTS_1305
     * @tc.desc   getCurrentMainTabsStyle(4, 3, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030035 end');
    });

    /**
     * @tc.name   testMtsGridVol030036
     * @tc.number SUB_MNB_MTS_1306
     * @tc.desc   getCurrentMainTabsStyle(0, 0, 'lg ') is the selected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030036 end');
    });

    /**
     * @tc.name   testMtsGridVol030037
     * @tc.number SUB_MNB_MTS_1307
     * @tc.desc   getCurrentMainTabsStyle(1, 2, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030037 end');
    });

    /**
     * @tc.name   testMtsGridVol030038
     * @tc.number SUB_MNB_MTS_1308
     * @tc.desc   getCurrentMainTabsStyle(2, 4, 'lg ') is the unselected state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testMtsGridVol030038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testMtsGridVol030038 end');
    });

  });
}
