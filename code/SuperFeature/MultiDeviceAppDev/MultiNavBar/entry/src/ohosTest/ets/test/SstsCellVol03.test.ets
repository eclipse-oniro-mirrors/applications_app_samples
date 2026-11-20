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

export default function sstsCellVol03Test() {
  describe('MultiNavBarSstsCellVol03', () => {

    /**
     * @tc.name   testSstsCellVol030001
     * @tc.number SUB_MNB_SSTS_1971
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030001 end');
    });

    /**
     * @tc.name   testSstsCellVol030002
     * @tc.number SUB_MNB_SSTS_1972
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030002 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030002 end');
    });

    /**
     * @tc.name   testSstsCellVol030003
     * @tc.number SUB_MNB_SSTS_1973
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030003 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030003 end');
    });

    /**
     * @tc.name   testSstsCellVol030004
     * @tc.number SUB_MNB_SSTS_1974
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030004 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030004 end');
    });

    /**
     * @tc.name   testSstsCellVol030005
     * @tc.number SUB_MNB_SSTS_1975
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030005 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030005 end');
    });

    /**
     * @tc.name   testSstsCellVol030006
     * @tc.number SUB_MNB_SSTS_1976
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030006 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030006 end');
    });

    /**
     * @tc.name   testSstsCellVol030007
     * @tc.number SUB_MNB_SSTS_1977
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030007 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030007 end');
    });

    /**
     * @tc.name   testSstsCellVol030008
     * @tc.number SUB_MNB_SSTS_1978
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030008 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030008 end');
    });

    /**
     * @tc.name   testSstsCellVol030009
     * @tc.number SUB_MNB_SSTS_1979
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030009 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030009 end');
    });

    /**
     * @tc.name   testSstsCellVol030010
     * @tc.number SUB_MNB_SSTS_1980
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030010 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030010 end');
    });

    /**
     * @tc.name   testSstsCellVol030011
     * @tc.number SUB_MNB_SSTS_1981
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030011 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030011 end');
    });

    /**
     * @tc.name   testSstsCellVol030012
     * @tc.number SUB_MNB_SSTS_1982
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030012 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030012 end');
    });

    /**
     * @tc.name   testSstsCellVol030013
     * @tc.number SUB_MNB_SSTS_1983
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030013 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030013 end');
    });

    /**
     * @tc.name   testSstsCellVol030014
     * @tc.number SUB_MNB_SSTS_1984
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030014 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030014 end');
    });

    /**
     * @tc.name   testSstsCellVol030015
     * @tc.number SUB_MNB_SSTS_1985
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030015 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030015 end');
    });

    /**
     * @tc.name   testSstsCellVol030016
     * @tc.number SUB_MNB_SSTS_1986
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030016 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030016 end');
    });

    /**
     * @tc.name   testSstsCellVol030017
     * @tc.number SUB_MNB_SSTS_1987
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030017 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030017 end');
    });

    /**
     * @tc.name   testSstsCellVol030018
     * @tc.number SUB_MNB_SSTS_1988
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030018 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030018 end');
    });

    /**
     * @tc.name   testSstsCellVol030019
     * @tc.number SUB_MNB_SSTS_1989
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030019 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030019 end');
    });

    /**
     * @tc.name   testSstsCellVol030020
     * @tc.number SUB_MNB_SSTS_1990
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030020 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030020 end');
    });

    /**
     * @tc.name   testSstsCellVol030021
     * @tc.number SUB_MNB_SSTS_1991
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030021 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030021 end');
    });

    /**
     * @tc.name   testSstsCellVol030022
     * @tc.number SUB_MNB_SSTS_1992
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030022 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030022 end');
    });

    /**
     * @tc.name   testSstsCellVol030023
     * @tc.number SUB_MNB_SSTS_1993
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030023 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030023 end');
    });

    /**
     * @tc.name   testSstsCellVol030024
     * @tc.number SUB_MNB_SSTS_1994
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030024 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030024 end');
    });

    /**
     * @tc.name   testSstsCellVol030025
     * @tc.number SUB_MNB_SSTS_1995
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030025 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030025 end');
    });

    /**
     * @tc.name   testSstsCellVol030026
     * @tc.number SUB_MNB_SSTS_1996
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030026 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030026 end');
    });

    /**
     * @tc.name   testSstsCellVol030027
     * @tc.number SUB_MNB_SSTS_1997
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030027 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030027 end');
    });

    /**
     * @tc.name   testSstsCellVol030028
     * @tc.number SUB_MNB_SSTS_1998
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030028 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030028 end');
    });

    /**
     * @tc.name   testSstsCellVol030029
     * @tc.number SUB_MNB_SSTS_1999
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030029 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030029 end');
    });

    /**
     * @tc.name   testSstsCellVol030030
     * @tc.number SUB_MNB_SSTS_2000
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030030 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030030 end');
    });

    /**
     * @tc.name   testSstsCellVol030031
     * @tc.number SUB_MNB_SSTS_2001
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030031 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030031 end');
    });

    /**
     * @tc.name   testSstsCellVol030032
     * @tc.number SUB_MNB_SSTS_2002
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030032 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030032 end');
    });

    /**
     * @tc.name   testSstsCellVol030033
     * @tc.number SUB_MNB_SSTS_2003
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030033 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030033 end');
    });

    /**
     * @tc.name   testSstsCellVol030034
     * @tc.number SUB_MNB_SSTS_2004
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030034 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030034 end');
    });

    /**
     * @tc.name   testSstsCellVol030035
     * @tc.number SUB_MNB_SSTS_2005
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030035 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030035 end');
    });

    /**
     * @tc.name   testSstsCellVol030036
     * @tc.number SUB_MNB_SSTS_2006
     * @tc.desc   getCurrentSubTabsStyle('sm ', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030036 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030036 end');
    });

    /**
     * @tc.name   testSstsCellVol030037
     * @tc.number SUB_MNB_SSTS_2007
     * @tc.desc   getCurrentSubTabsStyle('', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030037 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030037 end');
    });

    /**
     * @tc.name   testSstsCellVol030038
     * @tc.number SUB_MNB_SSTS_2008
     * @tc.desc   getCurrentSubTabsStyle('SM', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol030038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030038 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol030038 end');
    });

  });
}
