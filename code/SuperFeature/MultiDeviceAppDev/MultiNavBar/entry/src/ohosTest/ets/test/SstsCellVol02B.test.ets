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

export default function sstsCellVol02BTest() {
  describe('MultiNavBarSstsCellVol02B', () => {

    /**
     * @tc.name   testSstsCellVol020039
     * @tc.number SUB_MNB_SSTS_1934
     * @tc.desc   getCurrentSubTabsStyle('md', '', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020039 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020039 end');
    });

    /**
     * @tc.name   testSstsCellVol020040
     * @tc.number SUB_MNB_SSTS_1935
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020040 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020040 end');
    });

    /**
     * @tc.name   testSstsCellVol020041
     * @tc.number SUB_MNB_SSTS_1936
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020041 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020041 end');
    });

    /**
     * @tc.name   testSstsCellVol020042
     * @tc.number SUB_MNB_SSTS_1937
     * @tc.desc   getCurrentSubTabsStyle('md', '', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020042 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020042 end');
    });

    /**
     * @tc.name   testSstsCellVol020043
     * @tc.number SUB_MNB_SSTS_1938
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020043 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020043 end');
    });

    /**
     * @tc.name   testSstsCellVol020044
     * @tc.number SUB_MNB_SSTS_1939
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020044 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020044 end');
    });

    /**
     * @tc.name   testSstsCellVol020045
     * @tc.number SUB_MNB_SSTS_1940
     * @tc.desc   getCurrentSubTabsStyle('md', '', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020045 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020045 end');
    });

    /**
     * @tc.name   testSstsCellVol020046
     * @tc.number SUB_MNB_SSTS_1941
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020046 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020046 end');
    });

    /**
     * @tc.name   testSstsCellVol020047
     * @tc.number SUB_MNB_SSTS_1942
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020047 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020047 end');
    });

    /**
     * @tc.name   testSstsCellVol020048
     * @tc.number SUB_MNB_SSTS_1943
     * @tc.desc   getCurrentSubTabsStyle('md', '', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020048 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020048 end');
    });

    /**
     * @tc.name   testSstsCellVol020049
     * @tc.number SUB_MNB_SSTS_1944
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020049 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020049 end');
    });

    /**
     * @tc.name   testSstsCellVol020050
     * @tc.number SUB_MNB_SSTS_1945
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020050 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020050 end');
    });

    /**
     * @tc.name   testSstsCellVol020051
     * @tc.number SUB_MNB_SSTS_1946
     * @tc.desc   getCurrentSubTabsStyle('md', '', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020051 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020051 end');
    });

    /**
     * @tc.name   testSstsCellVol020052
     * @tc.number SUB_MNB_SSTS_1947
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020052 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020052 end');
    });

    /**
     * @tc.name   testSstsCellVol020053
     * @tc.number SUB_MNB_SSTS_1948
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020053 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020053 end');
    });

    /**
     * @tc.name   testSstsCellVol020054
     * @tc.number SUB_MNB_SSTS_1949
     * @tc.desc   getCurrentSubTabsStyle('md', '', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020054 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020054 end');
    });

    /**
     * @tc.name   testSstsCellVol020055
     * @tc.number SUB_MNB_SSTS_1950
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020055 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020055 end');
    });

    /**
     * @tc.name   testSstsCellVol020056
     * @tc.number SUB_MNB_SSTS_1951
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020056 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020056 end');
    });

    /**
     * @tc.name   testSstsCellVol020057
     * @tc.number SUB_MNB_SSTS_1952
     * @tc.desc   getCurrentSubTabsStyle('md', '', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020057 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020057 end');
    });

    /**
     * @tc.name   testSstsCellVol020058
     * @tc.number SUB_MNB_SSTS_1953
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020058 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020058 end');
    });

    /**
     * @tc.name   testSstsCellVol020059
     * @tc.number SUB_MNB_SSTS_1954
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020059 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020059 end');
    });

    /**
     * @tc.name   testSstsCellVol020060
     * @tc.number SUB_MNB_SSTS_1955
     * @tc.desc   getCurrentSubTabsStyle('md', '', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020060 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020060 end');
    });

    /**
     * @tc.name   testSstsCellVol020061
     * @tc.number SUB_MNB_SSTS_1956
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020061 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020061 end');
    });

    /**
     * @tc.name   testSstsCellVol020062
     * @tc.number SUB_MNB_SSTS_1957
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020062 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020062 end');
    });

    /**
     * @tc.name   testSstsCellVol020063
     * @tc.number SUB_MNB_SSTS_1958
     * @tc.desc   getCurrentSubTabsStyle('md', '', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020063 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020063 end');
    });

    /**
     * @tc.name   testSstsCellVol020064
     * @tc.number SUB_MNB_SSTS_1959
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020064 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020064 end');
    });

    /**
     * @tc.name   testSstsCellVol020065
     * @tc.number SUB_MNB_SSTS_1960
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020065 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020065 end');
    });

    /**
     * @tc.name   testSstsCellVol020066
     * @tc.number SUB_MNB_SSTS_1961
     * @tc.desc   getCurrentSubTabsStyle('md', '', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020066 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020066 end');
    });

    /**
     * @tc.name   testSstsCellVol020067
     * @tc.number SUB_MNB_SSTS_1962
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020067 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020067 end');
    });

    /**
     * @tc.name   testSstsCellVol020068
     * @tc.number SUB_MNB_SSTS_1963
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020068 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020068 end');
    });

    /**
     * @tc.name   testSstsCellVol020069
     * @tc.number SUB_MNB_SSTS_1964
     * @tc.desc   getCurrentSubTabsStyle('md', '', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020069 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020069 end');
    });

    /**
     * @tc.name   testSstsCellVol020070
     * @tc.number SUB_MNB_SSTS_1965
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 4, 3) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020070 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 3);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020070 end');
    });

    /**
     * @tc.name   testSstsCellVol020071
     * @tc.number SUB_MNB_SSTS_1966
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 0, 0) returns the selected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020071 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_ACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_ACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_ACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020071 end');
    });

    /**
     * @tc.name   testSstsCellVol020072
     * @tc.number SUB_MNB_SSTS_1967
     * @tc.desc   getCurrentSubTabsStyle('md', '', 1, 2) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020072 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', '', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020072 end');
    });

    /**
     * @tc.name   testSstsCellVol020073
     * @tc.number SUB_MNB_SSTS_1968
     * @tc.desc   getCurrentSubTabsStyle('md', 'tabs', 2, 4) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020073 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020073 end');
    });

    /**
     * @tc.name   testSstsCellVol020074
     * @tc.number SUB_MNB_SSTS_1969
     * @tc.desc   getCurrentSubTabsStyle('lg', 'tabs', 3, 1) returns the unselected wide cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020074 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(String(result.fontSize)).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.backgroundColor),
        String(SUB_TABS_TABS_INACTIVE_BG));
      expect(String(result.backgroundColor)).assertEqual(SUB_TABS_TABS_INACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.fontColor),
        String(SUB_TABS_TABS_INACTIVE_FONT));
      expect(String(result.fontColor)).assertEqual(SUB_TABS_TABS_INACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize),
        String(String(SUB_TABS_LIST_ACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_ACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s',
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_TABS_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_TABS_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020074 end');
    });

    /**
     * @tc.name   testSstsCellVol020075
     * @tc.number SUB_MNB_SSTS_1970
     * @tc.desc   Anchor: wide selected and unselected cells share font size 16 and differ only in colour
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol020075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020075 begin');
      const active: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 3);
      const inactive: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('lg', 'tabs', 3, 4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'active=%{public}s inactive=%{public}s', active.backgroundColor,
        inactive.backgroundColor);
      expect(active.fontSize).assertEqual(inactive.fontSize);
      expect(active.backgroundColor === inactive.backgroundColor).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check active.fontColor');
      expect(active.fontColor).assertEqual(SUB_TABS_TABS_ACTIVE_FONT);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol020075 end');
    });
  });
}
