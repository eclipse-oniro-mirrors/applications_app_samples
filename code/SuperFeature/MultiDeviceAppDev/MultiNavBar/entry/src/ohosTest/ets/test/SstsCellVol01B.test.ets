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

export default function sstsCellVol01BTest() {
  describe('MultiNavBarSstsCellVol01B', () => {

    /**
     * @tc.name   testSstsCellVol010039
     * @tc.number SUB_MNB_SSTS_1859
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010039 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010039 end');
    });

    /**
     * @tc.name   testSstsCellVol010040
     * @tc.number SUB_MNB_SSTS_1860
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010040 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010040 end');
    });

    /**
     * @tc.name   testSstsCellVol010041
     * @tc.number SUB_MNB_SSTS_1861
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010041 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010041 end');
    });

    /**
     * @tc.name   testSstsCellVol010042
     * @tc.number SUB_MNB_SSTS_1862
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010042 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010042 end');
    });

    /**
     * @tc.name   testSstsCellVol010043
     * @tc.number SUB_MNB_SSTS_1863
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010043 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010043 end');
    });

    /**
     * @tc.name   testSstsCellVol010044
     * @tc.number SUB_MNB_SSTS_1864
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010044 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010044 end');
    });

    /**
     * @tc.name   testSstsCellVol010045
     * @tc.number SUB_MNB_SSTS_1865
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010045 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010045 end');
    });

    /**
     * @tc.name   testSstsCellVol010046
     * @tc.number SUB_MNB_SSTS_1866
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010046 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010046 end');
    });

    /**
     * @tc.name   testSstsCellVol010047
     * @tc.number SUB_MNB_SSTS_1867
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010047 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010047 end');
    });

    /**
     * @tc.name   testSstsCellVol010048
     * @tc.number SUB_MNB_SSTS_1868
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010048 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010048 end');
    });

    /**
     * @tc.name   testSstsCellVol010049
     * @tc.number SUB_MNB_SSTS_1869
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010049 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010049 end');
    });

    /**
     * @tc.name   testSstsCellVol010050
     * @tc.number SUB_MNB_SSTS_1870
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010050 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010050 end');
    });

    /**
     * @tc.name   testSstsCellVol010051
     * @tc.number SUB_MNB_SSTS_1871
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010051 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010051 end');
    });

    /**
     * @tc.name   testSstsCellVol010052
     * @tc.number SUB_MNB_SSTS_1872
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010052 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010052 end');
    });

    /**
     * @tc.name   testSstsCellVol010053
     * @tc.number SUB_MNB_SSTS_1873
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010053 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010053 end');
    });

    /**
     * @tc.name   testSstsCellVol010054
     * @tc.number SUB_MNB_SSTS_1874
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010054 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010054 end');
    });

    /**
     * @tc.name   testSstsCellVol010055
     * @tc.number SUB_MNB_SSTS_1875
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010055 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010055 end');
    });

    /**
     * @tc.name   testSstsCellVol010056
     * @tc.number SUB_MNB_SSTS_1876
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010056 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010056 end');
    });

    /**
     * @tc.name   testSstsCellVol010057
     * @tc.number SUB_MNB_SSTS_1877
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010057 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010057 end');
    });

    /**
     * @tc.name   testSstsCellVol010058
     * @tc.number SUB_MNB_SSTS_1878
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010058 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010058 end');
    });

    /**
     * @tc.name   testSstsCellVol010059
     * @tc.number SUB_MNB_SSTS_1879
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010059 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010059 end');
    });

    /**
     * @tc.name   testSstsCellVol010060
     * @tc.number SUB_MNB_SSTS_1880
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010060 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010060 end');
    });

    /**
     * @tc.name   testSstsCellVol010061
     * @tc.number SUB_MNB_SSTS_1881
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010061 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010061 end');
    });

    /**
     * @tc.name   testSstsCellVol010062
     * @tc.number SUB_MNB_SSTS_1882
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010062 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010062 end');
    });

    /**
     * @tc.name   testSstsCellVol010063
     * @tc.number SUB_MNB_SSTS_1883
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010063 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010063 end');
    });

    /**
     * @tc.name   testSstsCellVol010064
     * @tc.number SUB_MNB_SSTS_1884
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010064 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010064 end');
    });

    /**
     * @tc.name   testSstsCellVol010065
     * @tc.number SUB_MNB_SSTS_1885
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010065 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010065 end');
    });

    /**
     * @tc.name   testSstsCellVol010066
     * @tc.number SUB_MNB_SSTS_1886
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010066 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010066 end');
    });

    /**
     * @tc.name   testSstsCellVol010067
     * @tc.number SUB_MNB_SSTS_1887
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010067 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010067 end');
    });

    /**
     * @tc.name   testSstsCellVol010068
     * @tc.number SUB_MNB_SSTS_1888
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010068 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010068 end');
    });

    /**
     * @tc.name   testSstsCellVol010069
     * @tc.number SUB_MNB_SSTS_1889
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010069 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010069 end');
    });

    /**
     * @tc.name   testSstsCellVol010070
     * @tc.number SUB_MNB_SSTS_1890
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 4, 3) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010070 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 3);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 4, 4 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010070 end');
    });

    /**
     * @tc.name   testSstsCellVol010071
     * @tc.number SUB_MNB_SSTS_1891
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 0, 0) returns the selected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010071 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 0, 0 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010071 end');
    });

    /**
     * @tc.name   testSstsCellVol010072
     * @tc.number SUB_MNB_SSTS_1892
     * @tc.desc   getCurrentSubTabsStyle('md', 'list', 1, 2) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010072 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 2);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 1 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('md', 'list', 1, 1 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010072 end');
    });

    /**
     * @tc.name   testSstsCellVol010073
     * @tc.number SUB_MNB_SSTS_1893
     * @tc.desc   getCurrentSubTabsStyle('sm', 'list', 2, 4) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010073 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 4);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', 2, 2 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010073 end');
    });

    /**
     * @tc.name   testSstsCellVol010074
     * @tc.number SUB_MNB_SSTS_1894
     * @tc.desc   getCurrentSubTabsStyle('sm', 'tabs', 3, 1) returns the unselected compact cell
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010074 begin');
      const result: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 1);
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
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 3 + 100).fontSize),
        String(String(SUB_TABS_LIST_INACTIVE_SIZE)));
      expect(
        String(StyleConfiguration.getCurrentSubTabsStyle('sm', 'tabs', 3, 3 + 100).fontSize)
      ).assertEqual(String(SUB_TABS_LIST_INACTIVE_SIZE));
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010074 end');
    });

    /**
     * @tc.name   testSstsCellVol010075
     * @tc.number SUB_MNB_SSTS_1895
     * @tc.desc   Anchor: an out of range index is still compared by equality only, so -1 against -1 is selected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testSstsCellVol010075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010075 begin');
      const same: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', -1, -1);
      const other: CustomFontStyle = StyleConfiguration.getCurrentSubTabsStyle('sm', 'list', -1, 0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'same=%{public}s other=%{public}s', String(same.fontSize),
        String(other.fontSize));
      expect(same.fontSize).assertEqual(SUB_TABS_LIST_ACTIVE_SIZE);
      expect(other.fontSize).assertEqual(SUB_TABS_LIST_INACTIVE_SIZE);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'check same.backgroundColor');
      expect(same.backgroundColor).assertEqual(SUB_TABS_LIST_ACTIVE_BG);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testSstsCellVol010075 end');
    });
  });
}
