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
  SUB_TABS_LIST_ACTIVE_SIZE,
  SUB_TABS_LIST_INACTIVE_SIZE,
  SUB_TABS_LIST_ACTIVE_BG,
  SUB_TABS_LIST_ACTIVE_FONT,
  SUB_TABS_LIST_INACTIVE_BG,
  SUB_TABS_LIST_INACTIVE_FONT,
  SUB_TABS_TABS_ACTIVE_SIZE,
  SUB_TABS_TABS_INACTIVE_SIZE,
  SUB_TABS_TABS_ACTIVE_BG,
  SUB_TABS_TABS_ACTIVE_FONT,
  SUB_TABS_TABS_INACTIVE_BG,
  SUB_TABS_TABS_INACTIVE_FONT
} from '../util/NavSpec';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_MultiNavBar]';

export default function sstsCellVol03BTest() {
  describe('MultiNavBarSstsCellVol03B', () => {

    /**
     * @tc.name   testSstsCellVol030039
     * @tc.number SUB_MNB_SSTS_2009
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030039 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030039 end');
    });

    /**
     * @tc.name   testSstsCellVol030040
     * @tc.number SUB_MNB_SSTS_2010
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030040 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030040 end');
    });

    /**
     * @tc.name   testSstsCellVol030041
     * @tc.number SUB_MNB_SSTS_2011
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030041 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030041 end');
    });

    /**
     * @tc.name   testSstsCellVol030042
     * @tc.number SUB_MNB_SSTS_2012
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030042 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030042 end');
    });

    /**
     * @tc.name   testSstsCellVol030043
     * @tc.number SUB_MNB_SSTS_2013
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030043 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030043 end');
    });

    /**
     * @tc.name   testSstsCellVol030044
     * @tc.number SUB_MNB_SSTS_2014
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030044 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030044 end');
    });

    /**
     * @tc.name   testSstsCellVol030045
     * @tc.number SUB_MNB_SSTS_2015
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030045 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030045 end');
    });

    /**
     * @tc.name   testSstsCellVol030046
     * @tc.number SUB_MNB_SSTS_2016
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030046 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030046 end');
    });

    /**
     * @tc.name   testSstsCellVol030047
     * @tc.number SUB_MNB_SSTS_2017
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030047 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030047 end');
    });

    /**
     * @tc.name   testSstsCellVol030048
     * @tc.number SUB_MNB_SSTS_2018
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030048 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030048 end');
    });

    /**
     * @tc.name   testSstsCellVol030049
     * @tc.number SUB_MNB_SSTS_2019
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030049 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030049 end');
    });

    /**
     * @tc.name   testSstsCellVol030050
     * @tc.number SUB_MNB_SSTS_2020
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030050 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030050 end');
    });

    /**
     * @tc.name   testSstsCellVol030051
     * @tc.number SUB_MNB_SSTS_2021
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030051 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030051 end');
    });

    /**
     * @tc.name   testSstsCellVol030052
     * @tc.number SUB_MNB_SSTS_2022
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030052 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030052 end');
    });

    /**
     * @tc.name   testSstsCellVol030053
     * @tc.number SUB_MNB_SSTS_2023
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030053 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030053 end');
    });

    /**
     * @tc.name   testSstsCellVol030054
     * @tc.number SUB_MNB_SSTS_2024
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030054 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030054 end');
    });

    /**
     * @tc.name   testSstsCellVol030055
     * @tc.number SUB_MNB_SSTS_2025
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030055 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030055 end');
    });

    /**
     * @tc.name   testSstsCellVol030056
     * @tc.number SUB_MNB_SSTS_2026
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030056 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030056 end');
    });

    /**
     * @tc.name   testSstsCellVol030057
     * @tc.number SUB_MNB_SSTS_2027
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030057 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030057 end');
    });

    /**
     * @tc.name   testSstsCellVol030058
     * @tc.number SUB_MNB_SSTS_2028
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030058 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030058 end');
    });

    /**
     * @tc.name   testSstsCellVol030059
     * @tc.number SUB_MNB_SSTS_2029
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030059 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030059 end');
    });

    /**
     * @tc.name   testSstsCellVol030060
     * @tc.number SUB_MNB_SSTS_2030
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030060 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030060 end');
    });

    /**
     * @tc.name   testSstsCellVol030061
     * @tc.number SUB_MNB_SSTS_2031
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030061 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030061 end');
    });

    /**
     * @tc.name   testSstsCellVol030062
     * @tc.number SUB_MNB_SSTS_2032
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030062 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030062 end');
    });

    /**
     * @tc.name   testSstsCellVol030063
     * @tc.number SUB_MNB_SSTS_2033
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030063 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030063 end');
    });

    /**
     * @tc.name   testSstsCellVol030064
     * @tc.number SUB_MNB_SSTS_2034
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030064 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030064 end');
    });

    /**
     * @tc.name   testSstsCellVol030065
     * @tc.number SUB_MNB_SSTS_2035
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030065 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030065 end');
    });

    /**
     * @tc.name   testSstsCellVol030066
     * @tc.number SUB_MNB_SSTS_2036
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030066 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030066 end');
    });

    /**
     * @tc.name   testSstsCellVol030067
     * @tc.number SUB_MNB_SSTS_2037
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030067 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030067 end');
    });

    /**
     * @tc.name   testSstsCellVol030068
     * @tc.number SUB_MNB_SSTS_2038
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030068 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030068 end');
    });

    /**
     * @tc.name   testSstsCellVol030069
     * @tc.number SUB_MNB_SSTS_2039
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030069 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030069 end');
    });

    /**
     * @tc.name   testSstsCellVol030070
     * @tc.number SUB_MNB_SSTS_2040
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030070 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030070 end');
    });

    /**
     * @tc.name   testSstsCellVol030071
     * @tc.number SUB_MNB_SSTS_2041
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030071 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030071 end');
    });

    /**
     * @tc.name   testSstsCellVol030072
     * @tc.number SUB_MNB_SSTS_2042
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030072 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm ', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030072 end');
    });

    /**
     * @tc.name   testSstsCellVol030073
     * @tc.number SUB_MNB_SSTS_2043
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030073 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030073 end');
    });

    /**
     * @tc.name   testSstsCellVol030074
     * @tc.number SUB_MNB_SSTS_2044
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030074 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_LIST_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_LIST_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_LIST_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_LIST_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('SM', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030074 end');
    });

    /**
     * @tc.name   testSstsCellVol030075
     * @tc.number SUB_MNB_SSTS_2045
     * @tc.desc   Anchor: an empty side bar mode keeps the wide branch, so the compact 24vp size never appears
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030075 begin');
      const style: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'size=%{public}s compact=%{public}s', String(style.fontSize),
        String(SUB_TABS_LIST_ACTIVE_SIZE));
      expect(style.fontSize).assertEqual(SUB_TABS_TABS_ACTIVE_SIZE);
      expect(style.backgroundColor).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check style.fontSize === SUB_TABS_LIST_ACTIVE_SIZE');
      expect(style.fontSize === SUB_TABS_LIST_ACTIVE_SIZE).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030075 end');
    });
  });
}
